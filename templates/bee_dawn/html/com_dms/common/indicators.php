<?php
/**
 * @package            Joomla
 * @subpackage         Documents Seller
 * @author             Tuan Pham Ngoc
 * @license            GNU/GPL, see LICENSE.php
 */

use Joomla\CMS\Language\Text;

/**
 * Layout variables
 *
 * @var stdClass $item
 */

$indicators = explode(',', $item->indicators);
?>
<span class="dms-indicators">
    <?php
    if($item->featured)
    {
    ?>
        <span class="dms-featured"><?php echo Text::_('DMS_FEATURED');?></span>
    <?php
    }

    if(in_array('Hot', $indicators))
    {
    ?>
        <span class="dms-hot"><?php echo Text::_('DMS_HOT');?></span>
    <?php
    }
    ?>

    <?php
    if(in_array('New', $indicators))
    {
    ?>
        <span class="dms-new"><?php echo Text::_('DMS_NEW');?></span>
    <?php
    }
    ?>

    <?php
    if(in_array('Popular', $indicators))
    {
    ?>
        <span class="dms-new">Popular</span>
    <?php
    }
    ?>
</span>

