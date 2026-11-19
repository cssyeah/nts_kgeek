<?php
/**
 * @package            Joomla
 * @subpackage         Documents Seller
 * @author             Tuan Pham Ngoc
 * @license            GNU/GPL, see LICENSE.php
 */

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Router\Route;

$wa = Factory::getApplication()
	->getDocument()
	->getWebAssetManager()
	->registerAndUseStyle('com_dms.documentgrid', 'media/com_dms/assets/css/documentgrid.min.css', ['version' => DMSHelper::getInstalledVersion()]);

$config        = DMSHelper::getConfig();
$numberColumns = (int) $this->params->get('number_columns', $config->number_columns ?: 3);
$span          = intval(12 / $numberColumns);

$rowFluid  = $this->uiHelper->getClassMapping('row-fluid');
$span11    = $this->uiHelper->getClassMapping('span11');
$spanClass = $this->uiHelper->getClassMapping('span' . $span);
$clearfix  = $this->uiHelper->getClassMapping('clearfix');

$cssVariables = [];

if ($this->params->get('hover_bg_color'))
{
	$cssVariables[] = '--dms-document-box-hover-bg-color: ' . $this->params->get('hover_bg_color');
}

if ($this->params->get('hover_color'))
{
	$cssVariables[] = '--dms-document-box-hover-color: ' . $this->params->get('hover_color');
}

if (count($cssVariables))
{
	$inlineStyles = ' style="' . implode(';', $cssVariables) . '"';
}
else
{
	$inlineStyles = '';
}

if ($config->enable_cart)
{
	$wa->registerAndUseScript('com_dms.colorbox', 'media/com_dms/assets/js/colorbox/jquery.colorbox.min.js')
		->registerAndUseScript('com_dms.cart', 'media/com_dms/assets/js/cart.min.js');
}
?>
<div class="dms-documents-grid-items">
	<?php
	$rowCount = 0;

	if ($this->category)
	{
		$catId = $this->category->id;
	}
	else
	{
		$catId = 0;
	}

	foreach ($this->items as $i => $document)
	{
		if ($i % $numberColumns == 0)
		{
			$rowCount++;
			$newRowClass = ' dms-first-child-of-new-row';
		}
		else
		{
			$newRowClass = '';
		}

		$Itemid = DMSHelperRoute::getDocumentMenuId($document->id, $catId, $this->Itemid);

		$document->url = Route::_('index.php?option=com_dms&view=document&id=' . $document->id . '&catid=' . $catId . '&Itemid=' . $Itemid);
		?>
			<div class="dms-grid-row-<?php echo $rowCount; ?>">
				<?php
				echo DMSHelperHtml::loadCommonLayout(
					'documentgrid/tmpl/' . $this->params->get('document_item_layout', 'default') . '.php',
					['item' => $document, 'params' => $this->params, 'Itemid' => $Itemid]
				);
				?>
			</div>
		<?php
	}
	?>
</div>