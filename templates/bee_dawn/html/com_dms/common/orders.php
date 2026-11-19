<?php

/**
 * @package            Joomla
 * @subpackage         Documents Seller
 * @author             Tuan Pham Ngoc
 * @license            GNU/GPL, see LICENSE.php
 */

defined('_JEXEC') or die;

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;

/**
 * Layout variables
 *
 * @var array     $items
 * @var DSFConfig $config
 * @var int       $Itemid
 */

if ($config->show_detail_in_popup) {
  DMSHelperJquery::colorbox('a.dms-modal');
  $popup = 'class="dms-modal"';
} else {
  $popup = '';
}

if (empty($uiHelper)) {
  $uiHelper = DMSHelperUi::getInstance();
}

$clearfix    = $uiHelper->getClassMapping('clearfix');
$hiddenPhone = $uiHelper->getClassMapping('hidden-phone');
?>


<div class="bee-order-list">
  <?php
  $total = 0;
  for ($i = 0, $n = count($items); $i < $n; $i++) {
    $item = $items[$i];

    if ($config->show_detail_in_popup) {
      $url = Route::_(DMSHelperRoute::getDocumentRoute($item->id, 0, $Itemid, '&tmpl=component'));
    } else {
      $url = Route::_(DMSHelperRoute::getDocumentRoute($item->id, 0, $Itemid));
    }
  ?>
    <div class="bee-order-item">

      <div class="bee-order-content">

      <h4>
        <a href="<?php echo $url; ?>" <?php echo $popup; ?>><?php echo $item->title; ?></a>
        <?php if (!empty($item->version)) : ?>
          <span class="bee-order-version">v<?php echo htmlspecialchars($item->version, ENT_QUOTES, 'UTF-8'); ?></span>
        <?php endif; ?>
      </h4>

      <div class="bee-order-meta">
        <div class="bee-order-price">
          <span class="field-label"><?php echo Text::_('DMS_PRICE'); ?></span>
          <strong><?php echo DMSHelperHtml::formatPrice($config, $item->price); ?></strong>
        </div>

        <div class="bee-order-date">
          <span class="field-label"><?php echo Text::_('DMS_ORDER_DATE');  ?></span>
          <?php echo HTMLHelper::_('date', $item->created_date, $config->date_format); ?>
        </div>

          <?php
          if ($config->show_download_in) {
          ?>
            <div class="bee-order-download-in">
              <span class="field-label"><?php echo Text::_('DMS_RESTRICTION'); ?></span>
              <span class="field-value">
              <?php
              if ($item->prevent_download_type == 1) {
                $restriction = '<strong>' . (int) $item->number_downloads . '</strong> <span class="field-unit">' . Text::_('DMS_DOWNLOADS') . '</span>';
              } elseif ($item->prevent_download_type == 2) {
                $restriction = '<strong>' . (int) $item->number_days . '</strong> <span class="field-unit">' . Text::_('DMS_DAYS') . '</span>';
              } else {
                $restriction = '<strong>' . Text::_('DMS_LIFETIME') . '</strong>';
              }

              echo $restriction;
              ?>
              </span>
            </div>
          <?php
          }

          // Remaining download days (only for "limit by number of days" documents)
          if ($item->prevent_download_type == 2) {
            // Download is allowed while number_days >= days since payment, so 0 means today is the last day
            $daysRemaining = (int) $item->number_days - (int) $item->days_different;
          ?>
            <div class="bee-order-days-remaining">
              <span class="field-label"><?php echo Text::_('BEE_DMS_DAYS_REMAINING'); ?></span>
              <span class="field-value">
              <?php
              if ($daysRemaining > 0) {
                echo '<strong>' . $daysRemaining . '</strong> <span class="field-unit">' . Text::plural('BEE_DMS_N_DAYS_LEFT', $daysRemaining) . '</span>';
              } elseif ($daysRemaining === 0) {
                echo '<strong>' . Text::_('BEE_DMS_LAST_DAY') . '</strong>';
              } else {
                echo '<strong class="required">' . Text::_('DMS_EXPIRED') . '</strong>';
              }
              ?>
              </span>
            </div>
          <?php
          }
          ?>
        </div>
      </div>

      <div class="bee-order-actions">
        <?php
        if ($item->prevent_download_type == 0) {
          $canDownload = true;
        } elseif ($item->prevent_download_type == 1 && ($item->number_downloads > $item->downloaded)) {
          $canDownload = true;
        } elseif ($item->prevent_download_type == 2 && ($item->number_days >= $item->days_different)) {
          $canDownload = true;
        } else {
          $canDownload = false;
        }
        ?>
        <?php
        // Show invoice for every paid-amount order. Orders without a real invoice number
        // get a virtual invoice (BEE-<order id>) from DMSControllerOverrideController::download_invoice()
        if ($config->activate_invoice_feature && $item->amount > 0) {
          $invoiceNumber = $item->invoice_number > 0
            ? DMSHelper::getFormattedInvoiceNumber($item, $config)
            : DMSHelperOverrideHelper::getVirtualInvoiceNumber($item->order_id, $config);
        ?>
            <a href="<?php echo Route::_('index.php?option=com_dms&task=download_invoice&order_id=' . $item->order_id . '&Itemid=' . $Itemid); ?>" class="btn-invoice">
              <i class="fa-duotone fa-thin fa-file-invoice"></i>
              Invoice
              <?php //echo $invoiceNumber; ?>
            </a>
            <?php
        }
        ?>
        
        <?php
        if ($canDownload) {
          $downloadLink = Route::_('index.php?option=com_dms&task=download&id=' . $item->id . '&order_id=' . $item->order_id . '&Itemid=' . $Itemid);
        ?>
          <a href="<?php echo $downloadLink; ?>" class="btn-download">
            <i class="fa-duotone fa-thin fa-file-zipper"></i>
            <?php echo Text::_('DMS_DOWNLOAD'); ?>
          </a>
        <?php
        } else {
          echo '<span class="required">' . Text::_('DMS_EXPIRED') . '</span>';
        }
        ?>


      </div>
    </div>
  <?php
  }
  ?>
</div>