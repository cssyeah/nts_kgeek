<?php

defined('_JEXEC') or die;

use Joomla\Plugin\System\Bee\BeeTemplate;

extract($displayData);

$mainMenuLevel = 999;
$mainMenu = [];

foreach ($list as $item) {
    if ($item->level > $mainMenuLevel) {
        continue;
    }

    $mainMenuLevel = $item->level;
    $mainMenu[] = $item;
}

$id = '';

if ($tagId = $params->get('tag_id', '')) {
    $id = ' id="' . $tagId . '"';
}
?>
<div class="bt-menu-wrapper bt-mod-<?php echo $moduleid ?>" menu-mode="<?php echo $mode ?>">
    <div class="bt-menu">
        <ul <?php echo $id; ?> class="bt-nav<?php echo ' ' . $class_sfx; ?>">
            <?php foreach ($mainMenu as $i => $item) {
                $displayData['level'] = 0;
                $displayData['item'] = $item;
                $megaData = $megaParams->get('item_' . $item->id);

                if (
                    is_object($megaData)
                    && isset($megaData->megamenu)
                    && $megaData->megamenu === 'on'
                ) {
                    echo BeeTemplate::renderLayout('bee/menu/default_mega', $displayData);
                } else {
                    echo BeeTemplate::renderLayout('bee/menu/default_item', $displayData);
                }
            }
            ?>
        </ul>
    </div>
</div>