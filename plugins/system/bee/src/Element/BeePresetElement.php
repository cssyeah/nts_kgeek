<?php

namespace Joomla\Plugin\System\Bee\Element;

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\Plugin\System\Bee\BeeTemplate;

defined('_JEXEC') or die('Restricted access');


class BeePresetElement
{
    public static function renderPresetDropdown($presets = [])
    {
        HTMLHelper::_('behavior.core');
        HTMLHelper::_('bootstrap.dropdown');
        HTMLHelper::script('plugins/system/bee/media/js/beetheme.js', [], ['type' => 'module']);

        echo BeeTemplate::renderLayout('bee/preset/dropdown', ['presets' => $presets]);
    }

    public static function renderPresetToggle($presetA, $presetB)
    {
        HTMLHelper::_('behavior.core');
        HTMLHelper::script('plugins/system/bee/media/js/beetheme.js', [], ['type' => 'module']);

        echo BeeTemplate::renderLayout('bee/preset/toggle', ['presets' => [$presetA, $presetB]]);
    }
}
