<?php

/**
 * @package            Joomla
 * @subpackage         Documents Seller
 * @author             Tuan Pham Ngoc
 * @license            GNU/GPL, see LICENSE.php
 */

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;

?>
<div id="dms-orders-history-page-default" class="dms-container">
  <?php
  if ($this->params->get('show_page_heading', 1)) {
  ?>
    <h1 class="dms-page-heading"><?php echo Text::_('DMS_YOUR_ORDERS') ?></h1>
  <?php
  }
  ?>
  <form method="post" name="adminForm" id="adminForm" action="<?php echo Route::_('index.php?option=com_dms&view=mydocs&Itemid=' . $this->Itemid); ?>">
    <?php
    if ($this->items) {
      echo DMSHelperHtml::loadCommonLayout('common/orders.php', ['items' => $this->items, 'config' => $this->config, 'Itemid' => $this->Itemid]);

      if ($this->pagination->total > $this->pagination->limit) {
    ?>
        <div class="pagination"><?php echo $this->pagination->getListFooter(); ?></div>
      <?php
      }
    } else {
      ?>
      <div class="dms-message"><?php echo Text::_('DMS_NO_DOCUMENTS_PURCHASED'); ?></div>
    <?php
    }
    ?>
  </form>
</div>