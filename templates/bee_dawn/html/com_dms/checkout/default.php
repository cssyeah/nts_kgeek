<?php
/**
 * @package        Joomla
 * @subpackage     Documents Seller
 * @author         Tuan Pham Ngoc
 * @copyright      Copyright (C) 2012 - 2020 Ossolution Team
 * @license        GNU/GPL, see LICENSE.php
 */

defined('_JEXEC') or die ;

use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Uri\Uri;

HTMLHelper::_('behavior.core');

$selectedState = $this->input->getString('state');

DMSHelperPayments::writeJavascriptObjects();
$rootUri = Uri::root(true);

Factory::getApplication()
	->getDocument()
	->addScriptOptions('selectedState', $selectedState)
	->addScriptOptions('categoryUrl', $this->categoryUrl)
	->addScriptOptions('showPaymentFee', $this->showPaymentFee)
	->getWebAssetManager()
	->registerAndUseScript('com_dms.site-checkout-default', 'media/com_dms/js/site-checkout-default.min.js')
	->addInlineScript("var siteUrl = '$rootUri/';");

Text::script('DMS_REMOVE_CONFIRM', true);
Text::script('DMS_INVALID_VATNUMBER', true);

DMSHelperJquery::colorbox('a.dms-modal');

$rowFluid            = $this->uiHelper->getClassMapping('row-fluid');
$formHorizontalClass = $this->uiHelper->getClassMapping('form form-horizontal');
$clearFix            = $this->uiHelper->getClassMapping('clearfix');
$controlGroup        = $this->uiHelper->getClassMapping('control-group');
$controlLabel        = $this->uiHelper->getClassMapping('control-label');
$controls            = $this->uiHelper->getClassMapping('control');
$btnPrimary          = $this->uiHelper->getClassMapping('btn btn-primary');
?>
<div id="dms-order-page" class="container">
<h1 class="dms-page-heading"><?php echo $this->fees['total_amount'] > 0 ? Text::_('DMS_CHECKOUT') : Text::_('DMS_DOWNLOAD_FORM'); ?></h1>
<?php
if ($this->isFreeDownload)
{
	$msg = $this->message->download_form_msg;
	$msg = str_replace('[ITEM_NAME]', $this->itemName, $msg);
	$msg = str_replace('[AMOUNT]', $this->itemPrice, $msg);
}
elseif ($this->config->enable_cart)
{
	$msg = $this->message->order_form_msg_cart;
}
else
{
	$msg = $this->message->order_form_msg;
	$msg = str_replace('[ITEM_NAME]', $this->itemName, $msg);
	$msg = str_replace('[AMOUNT]', $this->itemPrice, $msg);
	$msg = str_replace('[DOCUMENT_TITLE]', $this->documentTitle, $msg);
	$msg = str_replace('[AMOUNT_INCLUDING_TAX]', $this->documentPriceIncludingTax, $msg);
}

if (strlen($msg))
{
?>
    <div class="dms-message"><?php echo $msg; ?></div>
<?php
}

if ($this->config->enable_cart)
{
	echo $this->loadTemplate('items');
}

if (!$this->userId && $this->config->user_registration)
{
   echo $this->loadTemplate('login');
}
?>
<form method="post" name="os_form" id="os_form" action="<?php echo Route::_('index.php?option=com_dms&Itemid=' . $this->Itemid); ?>" autocomplete="off" class="<?php echo $formHorizontalClass; ?>">
	<?php
    echo $this->loadTemplate('form');

    if ($this->fees['total_amount'] > 0)
    {
        echo $this->loadTemplate('payment_amount');

        echo $this->loadTemplate('payment_methods');
    }

	echo $this->loadTemplate('gdpr');

    if ($this->config->active_term ==1 && $this->config->article_id)
    {
	    echo $this->loadTemplate('terms_and_conditions');
    }

    if ($this->showCaptcha)
    {
     ?>
        <div class="<?php echo $controlGroup ?> dms-captcha-container">
            <div class="<?php echo $controlLabel; ?>">
                <?php echo Text::_('DMS_CAPTCHA'); ?><span class="required">*</span>
            </div>
            <div class="<?php echo $controls; ?>">
                <?php echo $this->captcha;?>
            </div>
        </div>
     <?php
    }
	?>

    <div class="form-actions">
        <input type="submit" class="<?php echo $btnPrimary; ?>" name="btnSubmit" id="btn-submit" value="<?php echo $this->isFreeDownload ? Text::_('DMS_PROCESS') : Text::_('DMS_COMPLETE_ORDER');?>">
        <img id="ajax-loading-animation" src="<?php echo $rootUri; ?>/media/com_dms/ajax-loadding-animation.gif" style="display: none;"/>
    </div>

    <input type="hidden" name="task" value="process_order" />
    <input type="hidden" name="id" value="0" />
    <input type="hidden" name="redirect" value="1" />
    <?php
    if (isset($this->methods) && count($this->methods) == 1)
    {
    ?>
        <input type="hidden" name="payment_method" value="<?php echo $this->methods[0]->getName(); ?>" />
    <?php
    }
    ?>
</form>
</div>