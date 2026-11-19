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
 * @var int                      $Itemid
 */

$config          = DMSHelper::getConfig();
$bootstrapHelper = DMSHelperUi::getInstance();
$clearfix        = $bootstrapHelper->getClassMapping('clearfix');

if (!$item->short_description)
{
	$item->short_description = $item->description;
}

$tags = array_filter(array_map('trim', explode(',', (string) $item->tags)));
?>
<div class="dms-document-item dms-document-item-grid-default<?php if ($params->get('enable_hover_effect')) echo ' dms-category-item-hover-effect'; ?>">
	<?php
		if ($item->imgSrc)
		{
		?>
			<a href="<?php echo $item->url; ?>" class="dms-document-thumb-link">
				<img class="dms-document-thumb" src="<?php echo $item->imgSrc; ?>" alt="<?php echo $item->title; ?>" />
			</a>
		<?php
		}
	?>

	<div class="bee-item-content">
		<div class="bee-item-title-wrap">
			<?php if ($tags) : ?>
				<div class="bee-item-tags">
					<?php
					// "Plugin,Joomla 5" => <span class="plugin">Plugin</span><span class="joomla-5">Joomla 5</span>
					foreach ($tags as $tag)
					{
						$class = trim(preg_replace('/[^a-z0-9]+/', '-', strtolower($tag)), '-');
						echo '<span class="' . $class . '">' . htmlspecialchars($tag, ENT_QUOTES, 'UTF-8') . '</span>';
					}
					?>
				</div>
			<?php endif; ?>

			<h3 class="bee-item-title">
				<a href="<?php echo $item->url; ?>" title="<?php echo $item->title; ?>">
					<?php echo $item->title; ?>
				</a>
			</h3>
		</div>
		<div class="bee-item-desc">
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
	</div>
</div>


