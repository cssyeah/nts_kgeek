<?php
/**
 * @package        Joomla
 * @subpackage     Documents Seller
 * @author         Tuan Pham Ngoc
 * @copyright      Copyright (C) 2012 - 2020 Ossolution Team
 * @license        GNU/GPL, see LICENSE.php
 */

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;

/**
 * Layout variables
 *
 * @var   DMSViewCheckoutHtml $this
 */

if (empty($this->uiHelper))
{
	$this->uiHelper = DMSHelperUi::getInstance();
}

$controlGroupClass = $this->uiHelper->getClassMapping('control-group');
$controlLabelClass = $this->uiHelper->getClassMapping('control-label');
$controlsClass     = $this->uiHelper->getClassMapping('controls');

$stripePaymentMethod = null;

if (count($this->methods) > 1)
{
?>
	<div class="<?php echo $controlGroupClass;  ?> payment_information" id="payment_method_container">
		<div class="<?php echo $controlLabelClass; ?>">
			<?php echo Text::_('DMS_PAYMENT_OPTION'); ?>
			<span class="required">*</span>
		</div>
		<div class="<?php echo $controlsClass; ?>">
			<?php
			$method = null;

			for ($i = 0, $n = count($this->methods); $i < $n; $i++)
			{
				$paymentMethod     = $this->methods[$i];
				$paymentMethodName = $paymentMethod->getName();

				if ($paymentMethodName == $this->paymentMethod)
				{
					$checked = ' checked="checked" ';
					$method  = $paymentMethod;
				}
				else
				{
					$checked = '';
				}

				if (str_contains($paymentMethodName, 'os_stripe'))
				{
					$stripePaymentMethod = $paymentMethod;
				}
				?>
					<label class="radio">
						<input onclick="changePaymentMethod();" class="validate[required] radio"
							   type="radio" name="payment_method"
							   value="<?php echo $paymentMethod->getName(); ?>" <?php echo $checked; ?> />

						<?php
						if ($paymentMethod->iconUri)
						{
						?>
							<img class="dms-payment-method-icon clearfix" src="<?php echo $paymentMethod->iconUri; ?>"
							     title="<?php echo Text::_($paymentMethod->getTitle()); ?>" />
						<?php
						}
						else
						{
							echo Text::_($paymentMethod->getTitle());
						}
						?>
					</label>
				<?php
			}
			?>
		</div>
	</div>
	<?php
}
else
{
	$method = $this->methods[0];

	if (str_contains($method->getName(), 'os_stripe'))
	{
		$stripePaymentMethod = $method;
	}
?>

	<div class="<?php echo $controlGroupClass;  ?> payment_information" id="payment_method_container">
		<div class="<?php echo $controlLabelClass; ?>">
			<?php echo Text::_('DMS_PAYMENT_OPTION'); ?>
		</div>
		<div class="<?php echo $controlsClass; ?>">
			<?php
			if ($method->iconUri)
			{
			?>
				<img class="dms-payment-method-icon clearfix" src="<?php echo $method->iconUri; ?>"
				     title="<?php echo Text::_($method->getTitle()); ?>" />
			<?php
			}
			else
			{
				echo Text::_($method->getTitle());
			}
			?>
		</div>
	</div>
<?php
}

if ($method->getCreditCard())
{
	$style = '';
}
else
{
	$style = 'style = "display:none"';
}
?>
<div class="<?php echo $controlGroupClass;  ?> payment_information" id="tr_card_number" <?php echo $style; ?>>
	<div class="<?php echo $controlLabelClass; ?>">
		<?php echo Text::_('AUTH_CARD_NUMBER'); ?><span class="required">*</span>
	</div>

	<div class="<?php echo $controlsClass; ?>">
		<input type="text" id="x_card_num" name="x_card_num"
			   class="input-large validate[required,creditCard] form-control"
			   value="<?php echo $this->escape($this->input->getAlnum('x_card_num')); ?>" onchange="removeSpace(this);"/>
	</div>
</div>
<div class="<?php echo $controlGroupClass;  ?> payment_information" id="tr_exp_date" <?php echo $style; ?>>
	<div class="<?php echo $controlLabelClass; ?>">
		<?php echo Text::_('AUTH_CARD_EXPIRY_DATE'); ?><span class="required">*</span>
	</div>
	<div class="<?php echo $controlsClass; ?>">
		<?php echo $this->lists['exp_month'] . '  /  ' . $this->lists['exp_year']; ?>
	</div>
</div>
<div class="<?php echo $controlGroupClass;  ?> payment_information" id="tr_cvv_code" <?php echo $style; ?>>
	<div class="<?php echo $controlLabelClass; ?>" for="x_card_code">
		<?php echo Text::_('AUTH_CVV_CODE'); ?><span class="required">*</span>
	</div>

	<div class="<?php echo $controlsClass; ?>">
		<input type="text" id="x_card_code" name="x_card_code"
			   class="input-large form-control validate[required,custom[number]]"
			   value="<?php echo $this->escape($this->input->getString('x_card_code')); ?>"/>
	</div>
</div>
<?php
if ($method->getCardHolderName())
{
	$style = '';
}
else
{
	$style = ' style = "display:none;" ';
}
?>
<div class="<?php echo $controlGroupClass;  ?> payment_information" id="tr_card_holder_name" <?php echo $style; ?>>
	<div class="<?php echo $controlLabelClass; ?>" for="card_holder_name">
		<?php echo Text::_('DMS_CARD_HOLDER_NAME'); ?><span class="required">*</span>
	</div>

	<div class="<?php echo $controlsClass; ?>">
		<input type="text" id="card_holder_name" name="card_holder_name"
			   class="input-large form-control validate[required]"
			   value="<?php echo $this->escape($this->input->getString('card_holder_name')); ?>"/>
	</div>
</div>

<?php
if ($stripePaymentMethod !== null && method_exists($stripePaymentMethod, 'getParams'))
{
	/* @var os_stripe $stripePaymentMethod */
	$params = $stripePaymentMethod->getParams();
	$useStripeCardElement = $params->get('use_stripe_card_element', 0);

	if ($useStripeCardElement)
	{
		if (str_contains($method->getName(), 'os_stripe'))
		{
			$style = '';
		}
		else
		{
			$style = ' style = "display:none;" ';
		}
		?>
        <div class="<?php echo $controlGroupClass;  ?> payment_information" <?php echo $style; ?> id="stripe-card-form">
            <div class="<?php echo $controlLabelClass; ?>" for="stripe-card-element">
				<?php echo Text::_('DMS_CREDIT_OR_DEBIT_CARD'); ?><span class="required">*</span>
            </div>
            <div class="<?php echo $controlsClass; ?>" id="stripe-card-element">

            </div>
        </div>
		<?php
	}
}

if ($this->hasSquareCard)
{
	if (str_contains($method->getName(), 'os_squarecard'))
	{
		$style = '';
	}
	else
	{
		$style = ' style = "display:none;" ';
	}
	?>
	<div class="<?php echo $controlGroupClass;  ?> payment_information" <?php echo $style; ?> id="square-card-form">
		<div class="<?php echo $controlLabelClass; ?>">
			<?php echo Text::_('OSM_CREDIT_OR_DEBIT_CARD'); ?><span class="required">*</span>
		</div>
		<div class="<?php echo $controlsClass; ?>" id="square-card-element">

		</div>
	</div>
	<input type="hidden" name="square_card_token" value="" />
	<input type="hidden" name="square_card_verification_token" value="" />
	<?php
}