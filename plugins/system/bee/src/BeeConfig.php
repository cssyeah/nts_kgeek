<?php

namespace Joomla\Plugin\System\Bee;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Table\Table;
use Joomla\Filesystem\File;
use Joomla\Registry\Registry;

defined('_JEXEC') or die('Restricted access');

class BeeConfig
{
    protected static $template;
    protected static $config;

    protected static function loadConfig(): Registry
    {
        if (!self::$config) {
            if (!self::$template) {
                self::$template = Factory::getApplication()->getTemplate();
            }

            $extension = Table::getInstance('Extension');
            $extension->load(['type' => 'template', 'element' => self::$template]);
            self::$config = new Registry($extension->custom_data);
        }

        return self::$config;
    }

    public static function get($key = '', $default = '')
    {
        $config = self::loadConfig();

        return $config->get($key, $default);
    }

    public static function store(Table &$table)
    {
        $params = new Registry($table->params);
        $gkConfig = new Registry();

        $gkConfig->set('optimize_js', $params->get('optimize_js', 0));
        $gkConfig->set('optimize_css', $params->get('optimize_css', 0));
        $gkConfig->set('js_excluded', $params->get('js_excluded', ''));
        $gkConfig->set('css_excluded', $params->get('css_excluded', ''));

        $gkConfig->set('custom_code_after_head', $params->get('custom_code_after_head', ''));
        $gkConfig->set('custom_code_before_head', $params->get('custom_code_before_head', ''));
        $gkConfig->set('custom_code_after_body', $params->get('custom_code_after_body', ''));
        $gkConfig->set('custom_code_before_body', $params->get('custom_code_before_body', ''));

        $colorPreset = new Registry($params->get('color_preset', ''));
        $presets = $colorPreset->get('presets', []);
        $cookieKey = $colorPreset->get('cookieKey', '');
        $gkConfig->set('presets', $presets);
        $gkConfig->set('cookieKey', $cookieKey);

        $megamenu = new Registry($params->get('megamenu', []));
        $gkConfig->set('megamenu', $megamenu);

        if ($params->exists('custom_css')) {
            self::storeCustomCss($table->template, (string) $params->get('custom_css', ''));
        }

        $extension = Table::getInstance('Extension');
        $extension->load(['type' => 'template', 'element' => $table->template]);

        if ($extension->extension_id) {
            $extension->custom_data = $gkConfig->toString();
            $extension->store();
        }

        self::removeBeeConfig($params);
        $table->params = $params->toString();
    }

    public static function removeBeeConfig(Registry &$params)
    {
        $params->set('optimize_js', 0);
        $params->set('optimize_css', 0);
        $params->set('js_excluded', '');
        $params->set('css_excluded', '');
        $params->set('custom_code_after_head', '');
        $params->set('custom_code_before_head', '');
        $params->set('custom_code_after_body', '');
        $params->set('custom_code_before_body', '');

        $colorPreset = new Registry($params->get('color_preset', ''));
        $colorPreset->remove('presets');
        $colorPreset->remove('cookieKey');
        $params->set('color_preset', $colorPreset->toString());

        $params->set('megamenu', '{}');

        // Kept in media/css/custom.css only
        $params->remove('custom_css');
    }

    /**
     * Custom Style tab => templates/<template>/media/css/custom.css (loaded by BeeTemplate::render()).
     */
    public static function getCustomCssFile(string $template): string
    {
        return JPATH_ROOT . '/templates/' . basename($template) . '/media/css/custom.css';
    }

    protected static function storeCustomCss(string $template, string $css)
    {
        $file = self::getCustomCssFile($template);

        if (trim($css) === '') {
            if (is_file($file)) {
                File::delete($file);
            }

            return;
        }

        if (!File::write($file, str_replace("\r\n", "\n", $css))) {
            Factory::getApplication()->enqueueMessage(Text::sprintf('TPL_BEE_ERROR_CUSTOM_CSS_NOT_SAVED', $file), 'error');
        }
    }

    public static function injectBeeConfig(&$data)
    {
        self::$template = $data->template;

        $params = new Registry($data->params);
        $params->set('optimize_js', self::get('optimize_js', 0));
        $params->set('optimize_css', self::get('optimize_css', 0));
        $params->set('js_excluded', self::get('js_excluded', ''));
        $params->set('css_excluded', self::get('css_excluded', ''));
        $params->set('custom_code_after_head', self::get('custom_code_after_head', ''));
        $params->set('custom_code_before_head', self::get('custom_code_before_head', ''));
        $params->set('custom_code_after_body', self::get('custom_code_after_body', ''));
        $params->set('custom_code_before_body', self::get('custom_code_before_body', ''));

        $presets = self::get('presets', []);
        $colorPreset = new Registry($params->get('color_preset', ''));
        $colorPreset->set('presets', $presets);
        $colorPreset->set('cookieKey', self::get('cookieKey'));
        $params->set('color_preset', $colorPreset->toString());

        $megamenu = new Registry(self::get('megamenu', ''));
        $params->set('megamenu', $megamenu->toString());

        $cssFile = self::getCustomCssFile($data->template);
        $params->set('custom_css', is_file($cssFile) ? (string) file_get_contents($cssFile) : '');

        $data->params = $params->toArray();
    }
}
