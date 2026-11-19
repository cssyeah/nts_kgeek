<?php

use Joomla\CMS\Helper\ModuleHelper;

defined('_JEXEC') or die('Restricted access');

extract($displayData);

$module = ModuleHelper::getModuleById($config->module_id);
?>
<div class="bt-mega-module-wrapper">
    <div class="bt-mega-module <?php echo 'bt-mode-' . $config->module_id ?>">
        <?php echo ModuleHelper::renderModule($module) ?>
    </div>
</div>