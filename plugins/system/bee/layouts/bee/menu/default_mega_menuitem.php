<?php

use Joomla\Plugin\System\Bee\BeeTemplate;

defined('_JEXEC') or die('Restricted access');

extract($displayData);

$itemMap = [];

foreach ($list as $item) {
    if (in_array($item->id, $config->menu_ids)) {
        $itemMap['item_' . $item->id] = $item;
    }
}

?>
<div class="bt-mega-menuitem-wrapper">
    <ul class="bt-mega-menuitem-list">
        <?php foreach ($itemMap as $item) : ?>
            <li>
                <?php
                $displayData['item'] = $item;

                switch ($item->type):
                    case 'separator':
                    case 'component':
                    case 'heading':
                    case 'url':
                        echo BeeTemplate::renderLayout('bee/menu/default_' . $item->type, $displayData);
                        break;

                    default:
                        echo BeeTemplate::renderLayout('bee/menu/default_url', $displayData);
                        break;
                endswitch;
                ?>
            </li>
        <?php endforeach ?>
    </ul>
</div>