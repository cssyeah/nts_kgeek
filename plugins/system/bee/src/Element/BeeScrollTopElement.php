<?php

namespace Joomla\Plugin\System\Bee\Element;

use Joomla\Plugin\System\Bee\BeeTemplate;

class BeeScrollTopElement
{
    public static function render()
    {
        echo BeeTemplate::renderLayout('bee/scrolltop');
    }
}