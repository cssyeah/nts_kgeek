<?php

namespace Joomla\Plugin\System\Bee\Element;

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\Plugin\System\Bee\BeeTemplate;

class BeeOffcanvasElement
{
    public static function render($name = 'bee/offcanvas')
    {
        HTMLHelper::_('bootstrap.offcanvas');

        echo BeeTemplate::renderLayout($name);
    }
}