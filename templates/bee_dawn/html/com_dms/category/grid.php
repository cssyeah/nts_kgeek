<?php

/**
 * @package            Joomla
 * @subpackage         Documents Seller
 * @author             Tuan Pham Ngoc
 * @license            GNU/GPL, see LICENSE.php
 */

defined('_JEXEC') or die;

use Joomla\CMS\Router\Route;
use Joomla\CMS\Uri\Uri;

$bootstrapHelper = DMSHelperUi::getInstance();
$rootUri = Uri::root(true);
?>
<div id="dms-category-page-grid" class="dms-container">
  <div class="container">
    <form method="post" name="dms_form" id="dms_form" action="<?php echo Route::_('index.php?option=com_dms&view=category&layout=columns&id=' . ($this->category ? $this->category->id : 0) . '&Itemid=' . $this->Itemid); ?>">
      <?php
      if ($this->category) {
        $imgUrl = $this->category->imgSrc;
      ?>
        <!-- <h1 class="dms-page-heading"><?php echo $this->category->name; ?></h1> -->

        <?php
        if ($this->category->description != '') {
        ?>
          <div class="dms-leading-description <?php echo $bootstrapHelper->getClassMapping('clearfix'); ?>">
            <?php if ($imgUrl) { ?>
              <img class="dms-thumb-left" src="<?php echo $imgUrl; ?>" alt="<?php echo $this->category->name; ?>" />
            <?php }
            echo $this->category->description;
            ?>
          </div>
        <?php
        }
      } elseif ($this->params->get('show_page_heading', 1) && $this->params->get('page_heading')) {
        ?>
        <h1 class="dms-page-heading"><?php echo $this->params->get('page_heading'); ?></h1>
      <?php
      }

      if (count($this->categories)) {
        echo DMSHelperHtml::loadCommonLayout('common/categories.php', ['categories' => $this->categories, 'categoryId' => $this->category->id, 'config' => $this->config, 'Itemid' => $this->Itemid, 'uiHelper' => $this->uiHelper]);
      }

      if ($this->config->show_sort_options && count($this->items)) {
        echo DMSHelperHtml::loadCommonLayout('common/category_header.php', ['lists' => $this->lists, 'uiHelper' => $this->uiHelper]);
      }

      if (count($this->items)) {
        echo $this->loadTemplate('items');
      }

      if ($this->pagination->total > $this->pagination->limit) {
      ?>
        <div class="pagination">
          <?php echo $this->pagination->getPagesLinks(); ?>
        </div>
      <?php
      }
      ?>
    </form>
  </div>

</div>