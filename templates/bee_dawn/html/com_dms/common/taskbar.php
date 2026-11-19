<?php

/**
 * @package            Joomla
 * @subpackage         Documents Seller
 * @author             Tuan Pham Ngoc
 * @license            GNU/GPL, see LICENSE.php
 */

defined('_JEXEC') or die;

use Bee\Component\Dmsreviews\Site\Helper\ReviewsHelper;
use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Layout\LayoutHelper;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Uri\Uri;

/**
 * Layout variables
 *
 * @var stdClass $item
 * @var int      $Itemid
 * @var string   $url
 * @var string   $popup
 * @var string   $layout
 */

$config     = DMSHelper::getConfig();
$user       = Factory::getApplication()->getIdentity();
$userId     = $user->id;
$viewLevels = $user->getAuthorisedViewLevels();
$Itemid     = DMSHelperRoute::getDocumentMenuId($item->id, $catId, $Itemid);

$uiHelper   = DMSHelperUi::getInstance();
$btn        = $uiHelper->getClassMapping('btn');
$btnPrimary = $uiHelper->getClassMapping('btn btn-primary');

// Rating from com_dmsreviews, hidden when the component is disabled or the document has no reviews yet
$rating = null;

if (ComponentHelper::isEnabled('com_dmsreviews') && class_exists(ReviewsHelper::class)) {
  $rating = ReviewsHelper::getSummary((int) $item->id);

  if ($rating->count) {
    $app = Factory::getApplication();
    $app->getLanguage()->load('com_dmsreviews', JPATH_SITE) || $app->getLanguage()->load('com_dmsreviews', JPATH_SITE . '/components/com_dmsreviews');

    $wa = $app->getDocument()->getWebAssetManager();
    $wa->getRegistry()->addExtensionRegistryFile('com_dmsreviews');
    $wa->useStyle('com_dmsreviews.reviews');
  } else {
    $rating = null;
  }
}
?>
<ul class="bee-doc-info">
  <!-- <li>
    <span class="field-label">Released date</span>
    <date class="field-value"><?php echo date('M d, Y', strtotime($item->created_date)); ?></date>
  </li> -->

  <li>
    <span class="field-label"><i class="fa-duotone fa-thin fa-calendar"></i>Updated on</span>
    <date class="field-value"><?php echo date('M d, Y', strtotime($item->modified_date)); ?></date>
  </li>

  <?php if (!empty($item->version)) : ?>
    <li>
      <span class="field-label"><i class="fa-duotone fa-thin fa-code-merge"></i>Version</span>
      <span class="field-value"><?php echo htmlspecialchars($item->version, ENT_QUOTES, 'UTF-8'); ?></span>
    </li>
  <?php endif; ?>

  <?php
  // Compatible values come from the document tags
  $compatibles = array_filter(array_map('trim', explode(',', (string) $item->tags)));
  ?>
  <?php if ($compatibles) : ?>
    <li class="bee-doc-compatible">
      <span class="field-label"><i class="fa-duotone fa-thin fa-circle-check"></i>Compatible</span>
      <span class="field-value">
        <?php
        // "Joomla 5,Joomla 6" => <span class="joomla-5">Joomla 5</span><span class="joomla-6">Joomla 6</span>
        foreach ($compatibles as $compatible) {
          $class = trim(preg_replace('/[^a-z0-9]+/', '-', strtolower($compatible)), '-');
          echo '<span class="' . $class . '">' . htmlspecialchars($compatible, ENT_QUOTES, 'UTF-8') . '</span>';
        }
        ?>
      </span>
    </li>
  <?php endif; ?>

  <?php if ($rating) : ?>
    <li class="bee-doc-rating">
      <span class="field-label"><i class="fa-duotone fa-thin fa-stars"></i>Rating</span>
      <span class="field-value">
        <?php echo LayoutHelper::render('reviews.stars', ['rating' => (float) $rating->average], null, ['component' => 'com_dmsreviews', 'client' => 0]); ?>
        <span class="bee-doc-rating-average"><?php echo number_format((float) $rating->average, 1); ?></span>
        <span class="bee-doc-rating-count">(<?php echo (int) $rating->count; ?>)</span>
      </span>
    </li>
  <?php endif; ?>

  <li class="bee-doc-price">
    <span class="field-label"><i class="fa-duotone fa-thin fa-badge-dollar"></i>Price</span>
    <?php $finalPrice = $item->price - $item->discount_amount; ?>
    <span class="field-value"><?php echo $finalPrice <= 0 ? 'Free' : DMSHelperHtml::formatPrice($config, $finalPrice); ?></span>
  </li>

  </ul>

  <ul class="bee-doc-actions">
  <?php if ($layout == 'default' && !empty($item->demo_url)) : ?>
    <li>
      <a href="<?php echo htmlspecialchars($item->demo_url, ENT_QUOTES, 'UTF-8'); ?>" rel="noopener noreferrer" class="btn btn-outline">
        <i class="fa-duotone fa-thin fa-eye"></i>
        <?php echo Text::_('DMS_DEMO'); ?>
      </a>
    </li>
  <?php endif; ?>

  <?php if ($layout == 'default' && !empty($item->documentation_url)) : ?>
    <li>
      <a href="<?php echo htmlspecialchars($item->documentation_url, ENT_QUOTES, 'UTF-8'); ?>" rel="noopener noreferrer" class="btn btn-outline">
        <i class="fa-duotone fa-thin fa-file-doc"></i>
        <?php echo Text::_('DMS_DOCUMENTATION'); ?>
      </a>
    </li>
  <?php endif; ?>

  <?php
  if ($item->price == 0) {
    if (in_array($config->download_free_doc, $viewLevels)) {
      if ($config->require_form) {
        $downloadUrl = Route::_('index.php?option=com_dms&task=add_to_cart&id=' . $item->id . '&Itemid=' . $Itemid);
      } else {
        $downloadUrl = Route::_('index.php?option=com_dms&task=download&id=' . $item->id . '&Itemid=' . $Itemid);
      }
  ?>
      <li>
        <a href="<?php echo $downloadUrl; ?>" class="<?php echo $btnPrimary; ?>">
          <i class="fa-duotone fa-thin fa-cloud-arrow-down"></i>
          <?php echo Text::_('DMS_DOWNLOAD'); ?>
        </a>
      </li>
    <?php
    } elseif ($userId == 0) {
      if ($config->require_form) {
        $returnUrl = Route::_('index.php?option=com_dms&task=add_to_cart&id=' . $item->id . '&Itemid=' . $Itemid);
      } else {
        //We should return user to the current page so that he can press download, avoid a "dead" login screen
        $returnUrl = Uri::getInstance()->toString();
      }

      $downloadUrl = Route::_('index.php?option=com_users&view=login&return=' . base64_encode($returnUrl));
    ?>
      <li>
        <a href="<?php echo $downloadUrl; ?>" class="<?php echo $btnPrimary; ?>">
          <i class="fa-duotone fa-thin fa-cloud-arrow-down"></i>
          <?php echo Text::_('DMS_DOWNLOAD'); ?>
        </a>
      </li>
    <?php
    }
  } else {
    // Price > 0
    if ($item->price <= $item->discount_amount) {
      $downloadUrl = Route::_('index.php?option=com_dms&task=download&id=' . $item->id . '&Itemid=' . $Itemid);
    ?>
      <li>
        <a href="<?php echo $downloadUrl; ?>" class="<?php echo $btnPrimary; ?>">
          <i class="fa-duotone fa-thin fa-cloud-arrow-down"></i>
          <?php echo Text::_('DMS_DOWNLOAD'); ?>
        </a>
      </li>
      <?php
    } else {
      if (in_array($config->purchase_document, $viewLevels)) {
      ?>
        <li>
          <?php
          if ($config->enable_cart) {
            $addToCartUrl = "javascript:addToCart($item->id, $Itemid)";
          } else {
            $addToCartUrl = Route::_('index.php?option=com_dms&task=add_to_cart&id=' . $item->id . '&Itemid=' . $Itemid);
          }
          ?>
          <a href="<?php echo $addToCartUrl; ?>" class="<?php echo $btnPrimary; ?>">
            <i class="fa-duotone fa-thin fa-cloud-arrow-down"></i>
            <?php echo Text::_('DMS_DOWNLOAD'); ?>
          </a>
        </li>
      <?php
      } elseif ($userId == 0) {
      ?>
        <li>
          <?php
          $returnUrl    = Route::_('index.php?option=com_dms&task=add_to_cart&id=' . $item->id . '&Itemid=' . $Itemid);
          $addToCartUrl = Route::_('index.php?option=com_users&view=login&return=' . base64_encode($returnUrl));
          ?>
          <a href="<?php echo $addToCartUrl; ?>" class="<?php echo $btnPrimary; ?>">
            <i class="fa-duotone fa-thin fa-cart-circle-check"></i>
            <?php //echo Text::_('DMS_ORDER'); ?>
            Buy Now
          </a>
        </li>
    <?php
      }
    }
  }

  if (!isset($showDetailsLink)) {
    ?>
    <li>
      <a href="<?php echo $url; ?>" <?php echo $popup; ?> class="<?php echo $btn; ?>">
        <?php echo Text::_('DMS_DETAILS'); ?>
      </a>
    </li>
    <?php
  }
  ?>
</ul>