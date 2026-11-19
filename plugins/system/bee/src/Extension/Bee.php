<?php

namespace Joomla\Plugin\System\Bee\Extension;

use Exception;
use Joomla\CMS\Factory;
use Joomla\CMS\Form\Form;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Plugin\CMSPlugin;
use Joomla\CMS\Plugin\PluginHelper;
use Joomla\Plugin\System\Bee\BeeConfig;
use Joomla\Plugin\System\Bee\BeeTemplate;
use Joomla\Plugin\System\Bee\Helper\BeeFormHelper;
use Joomla\Plugin\System\Bee\Helper\BeeOptimizeHelper;

defined('_JEXEC') or die('Restricted access');

class Bee extends CMSPlugin
{
    public function onAfterRoute()
    {
        if (BeeTemplate::isBeeTemplate()) {
            define('BEETEMPLATE', 1);

            $this->loadLanguage();

            $app = Factory::getApplication();
            $input = $app->input;
            $option = $input->get('option');
            $view = $input->get('view');

            if ($option === 'com_config' && $view === 'templates') {
                throw new Exception(Text::_('TPL_BEE_ERROR_FRONTEND_EDIT_NOT_SUPPORTED'), 500);
            }
        }
    }

    public function onExtensionBeforeSave($context, $table, $isNew)
    {
        if ($isNew || $context !== 'com_templates.style') {
            return;
        }

        BeeConfig::store($table);
    }

    public function onContentPrepareForm(Form $form, $data)
    {
        $app = Factory::getApplication();

        if ($app->isClient('administrator')) {
            BeeFormHelper::extendAdminForm($form, $data);
        }

        if ($app->isClient('site')) {
            BeeFormHelper::extendSiteForm($form);
        }

        $formName = $form->getName();
        if ($formName === 'com_templates.style') {
            $gkFields = $form->getXml()->xpath("//fieldset[@addfieldprefix=\"Joomla\\Plugin\\System\\Bee\Field\"]");

            if ($gkFields && $data) {
                $lang = $app->getLanguage();
                $lang->load('plg_system_bee', JPATH_ADMINISTRATOR);

                BeeConfig::injectBeeConfig($data);
                define('ON_BEETEMPLATE_FORM', 1);
            }
        }
    }

    public function onAfterRender()
    {
        if (!defined('BEETEMPLATE')) {
            return;
        }

        $app = Factory::getApplication();
        $input = $app->input;

        $option = $input->get('option');
        $view = $input->get('view');
        $layout = $input->get('layout');

        if ($option === 'com_config' || ($option === 'com_content' && $view === 'form' && $layout === 'edit')) {
            return;
        }

        $html = $app->getBody();
        $frags = explode('</head>', $html);
        if (count($frags) !== 2) {
            return;
        }

        $head = $frags[0];
        $body = $frags[1];
        $onDevMode = PluginHelper::isEnabled('system', 'jadev');

        if (BeeConfig::get('optimize_css') && !$onDevMode) {
            $cssExcluded = BeeConfig::get('css_excluded', '');
            $cssExcludedFiles = array_filter(array_map('strtolower', explode("\n", $cssExcluded)));

            $head = BeeOptimizeHelper::css($head, $cssExcludedFiles);
        }

        if (BeeConfig::get('optimize_js') && !$onDevMode) {
            $jsExcluded = BeeConfig::get('js_excluded', '');
            $jsExcludedFiles = array_filter(array_map('strtolower', explode("\n", $jsExcluded)));

            $head = BeeOptimizeHelper::js($head, $jsExcludedFiles);
        }

        $return = $head . '</head>' . $body;

        $app->setBody($return);
    }
}
