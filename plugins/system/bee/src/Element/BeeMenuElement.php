<?php

namespace Joomla\Plugin\System\Bee\Element;

use Joomla\CMS\Factory;
use Joomla\CMS\Helper\ModuleHelper;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\Module\Menu\Site\Helper\MenuHelper;
use Joomla\Plugin\System\Bee\BeeConfig;
use Joomla\Plugin\System\Bee\BeeTemplate;
use Joomla\Registry\Registry;

defined('_JEXEC') or die('Restricted access');

class BeeMenuElement
{
    public static function render()
    {
        $doc = Factory::getDocument();
        $mode = $doc->params->get('menu_mode', 'normal');
        $megamenu = new Registry(BeeConfig::get('megamenu'));
        $modules = ModuleHelper::getModules('mainmenu');
        $output = '';

        if ($modules) {
            HTMLHelper::script('plugins/system/bee/media/js/beemegamenu.js', [], ['defer' => true]);

            HTMLHelper::stylesheet('plugins/system/bee/media/css/beemegamenu.css');

            $mobileBreakpoint = $doc->params->get('mobile_menu_breakpoint', '768');
            $doc->addScriptOptions('bee_mobile_menu_breakpoint', $mobileBreakpoint);
            $doc->addScriptOptions('bee_menu_trigger', $doc->params->get('menu_trigger', 'hover'));

            $output .= "
            <style>
            @media (min-width: {$mobileBreakpoint}px) {
                .bt-menu-toggle {
                    display: none;
                }

                .bt-menu {
                    display: block;
                }
            }
            </style>
            ";
        }

        $module = array_shift($modules);

        $params     = new Registry($module->params);
        $list       = MenuHelper::getList($params);
        $base       = MenuHelper::getBase($params);
        $active     = MenuHelper::getActive($params);
        $default    = MenuHelper::getDefault();
        $active_id  = $active->id;
        $default_id = $default->id;
        $path       = $base->tree;
        $showAll    = $params->get('showAllChildren', 1);
        $class_sfx  = htmlspecialchars($params->get('class_sfx', ''), ENT_COMPAT, 'UTF-8');
        $megaParams = new Registry($megamenu->get('mod_' . $module->id));
        $layoutName = 'default';

        $output .= BeeTemplate::renderLayout('bee/menu/' . $layoutName, [
            'megaParams' => $megaParams,
            'moduleid' => $module->id,
            'params' => $params,
            'list' => $list,
            'base' => $base,
            'active' => $active,
            'default' => $default,
            'path' => $path,
            'showAll' => $showAll,
            'class_sfx' => $class_sfx,
            'active_id' => $active_id,
            'default_id' => $default_id,
            'mode' => $mode,
        ]);

        return $output;
    }

    public static function renderDropdownButton()
    {
        return BeeTemplate::renderLayout('bee/menu/dropdown_button');
    }
}
