<?php
/**
 * @package            Joomla
 * @subpackage         Documents Seller
 * @author             Tuan Pham Ngoc
 * @license            GNU/GPL, see LICENSE.php
 */

defined('_JEXEC') or die;

use Joomla\CMS\HTML\HTMLHelper;

/**
 * Layout variables
 *
 * @var stdClass                 $item
 * @var Joomla\Registry\Registry $params
 */

$config          = DMSHelper::getConfig();
$bootstrapHelper = DMSHelperUi::getInstance();
$clearfix        = $bootstrapHelper->getClassMapping('clearfix');
?>
<div class="dms-document-item dms-document-item-grid-image-top<?php if ($params->get('enable_hover_effect')) echo ' dms-document-item-hover-effect'; ?>">
	<?php
	if ($item->imgSrc)
	{
	?>
		<a href="<?php echo $item->url; ?>" class="dms-document-thumb-link">
			<img class="dms-document-thumb img-polaroid" src="<?php echo $item->imgSrc; ?>" alt="<?php echo $item->title; ?>" />
		</a>
	<?php
	}
	?>
	<div class="dms-document-information <?php echo $clearfix; ?>">
		<a href="<?php echo $item->url; ?>" class="dms-document-link">
			<?php echo $item->title; ?>
		</a>
	</div>
	<div class="dms-document-description <?php echo $clearfix; ?>">
		<?php
		if ($params->get('document_description_limit'))
		{
			echo HTMLHelper::_('string.truncate', $item->short_description, $params->get('document_description_limit', 120));
		}
		else
		{
			echo $item->short_description;
		}
		?>
	</div>
	<div class="dms-taskbar <?php echo $clearfix; ?>">
		<?php echo DMSHelperHtml::loadCommonLayout('common/taskbar.php', ['item' => $item, 'config'=>$config, 'Itemid' => $Itemid, 'url' => $item->url, 'popup' => '', 'layout' => 'grid']); ?>
	</div>
</div>


