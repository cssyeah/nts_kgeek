<?php

use Joomla\CMS\Helper\ModuleHelper;
use Joomla\CMS\Language\Text;

defined('_JEXEC') or die('Restricted access');

$modules = ModuleHelper::getModules('offcanvas');
?>

<div class="bt-offcanvas-wrapper">
    <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#bt-offcanvas">
        <i class="fas fa-bars"></i>
    </button>

    <div class="offcanvas offcanvas-start" tabindex="-1" id="bt-offcanvas" aria-labelledby="offcanvasExampleLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasExampleLabel"><?php echo Text::_('TPL_BEE_OFFCANVAS_TITLE'); ?></h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="<?php echo Text::_('JCLOSE'); ?>"></button>
        </div>
        <div class="offcanvas-body">
            <?php foreach ($modules as $module) : ?>
                <div class="bt-offcanvas-module-content">
                    <?php echo ModuleHelper::renderModule($module) ?>
                </div>
            <?php endforeach ?>
        </div>
    </div>
</div>