<?php

/**
 * @package     Bee Framework
 *
 * @copyright   (C) 2023 Bee Framework. <https://beetemplate.com>
 * @license     GNU General Public License version 2 or later;
 */

// This is the code which will be placed in the mainbody section

use Joomla\CMS\Factory;
use Joomla\Plugin\System\Bee\BeeTemplate;
use Joomla\Plugin\System\Bee\BeeSection;

// No direct access.
defined('_JEXEC') or die;

$doc = Factory::getDocument();
?>

<div <?php echo BeeSection::attrs('bt-page-content', 'bt-page-content wrap') ?>>
    <div id="bt-content" class="bt-content">
        <?php if ($doc->countModules('sidebar-l') && $doc->countModules('sidebar-r') && !BEE_LAYOUT_EDIT && !BEE_COM_CONFIG):  
            echo BeeTemplate::renderBlock('mainbody/mainbody-two-sidebar');
        elseif ($doc->countModules('sidebar-l') && !BEE_LAYOUT_EDIT && !BEE_COM_CONFIG):  
            echo BeeTemplate::renderBlock('mainbody/mainbody-sidebar-left');
        elseif ($doc->countModules('sidebar-r') && !BEE_LAYOUT_EDIT && !BEE_COM_CONFIG):
            echo BeeTemplate::renderBlock('mainbody/mainbody-sidebar-right');
        else:
            echo BeeTemplate::renderBlock('mainbody/mainbody-no-sidebar');
        endif; ?>
    </div><!-- #bee-content -->
</div><!-- #bee-page-content -->