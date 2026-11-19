<?php
/**
 * @package            Joomla
 * @subpackage         Documents Seller
 * @author             Tuan Pham Ngoc
 * @license            GNU/GPL, see LICENSE.php
 */

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Uri\Uri;
use Joomla\Database\ParameterType;

/**
 * Layout variables
 *
 * @var array $lists
 * @var int   $Itemid
 */

// The module query only selects id, thumb and title, so load the extra fields we need here
$extras = [];

if (count($lists))
{
	$db      = Factory::getContainer()->get('DatabaseDriver');
	$columns = ['id', 'thumbnail', 'image', 'demo_url', 'indicators', 'created_date', 'short_description', 'tags'];
	$query = $db->getQuery(true)
		->select($db->quoteName($columns))
		->from($db->quoteName('#__dms_documents'))
		->whereIn($db->quoteName('id'), array_map('intval', array_column($lists, 'id')), ParameterType::INTEGER);
	$db->setQuery($query);
	$extras = $db->loadObjectList('id');

	// Newest documents first (grid renders in DOM order), fall back to id when created dates are equal
	usort($lists, function ($a, $b) use ($extras) {
		$dateA = $extras[$a->id]->created_date ?? '';
		$dateB = $extras[$b->id]->created_date ?? '';

		return strcmp($dateB, $dateA) ?: $b->id <=> $a->id;
	});
}

$rootUri = Uri::root(true);
?>
<ul class="bee-docs-listing">
	<?php
		foreach ($lists as $doc)
		{
			$extra   = $extras[$doc->id] ?? null;
			$url     = Route::_(DMSHelperRoute::getDocumentRoute($doc->id, 0, $Itemid));
			$demoUrl   = $extra->demo_url ?? '';
			// short_description is an editor field, keep only its text for the card
			$thumbDesc = trim(html_entity_decode(strip_tags((string) ($extra->short_description ?? '')), ENT_QUOTES, 'UTF-8'));
			// Indicators are stored comma separated (New, Hot), same as the component's common/indicators.php
			$indicators = array_filter(array_map('trim', explode(',', (string) ($extra->indicators ?? ''))));
			// Tags are stored comma separated (Plugin, Joomla 5), same as the documentgrid override
			$tags = array_filter(array_map('trim', explode(',', (string) ($extra->tags ?? ''))));
			$imgSrc    = '';

			// Same thumbnail logic as the component (DMSModelDocumenttrait::calculateAndSetThumbnail)
			if ($extra)
			{
				$image = DMSHelperImage::getCleanImagePath($extra->image);

				if ($extra->thumbnail && is_file(JPATH_ROOT . '/images/com_dms/documents/thumbs/' . $extra->thumbnail))
				{
					$imgSrc = $rootUri . '/images/com_dms/documents/thumbs/' . $extra->thumbnail;
				}
				elseif ($image && is_file(JPATH_ROOT . '/' . $image))
				{
					$imgSrc = $rootUri . '/' . $image;
				}
			}
		?>
			<li>
				
				<?php if ($imgSrc) : ?>
					<div class="bee-doc-media">
						<a href="<?php echo $url; ?>">
							<img src="<?php echo $imgSrc; ?>" alt="<?php echo htmlspecialchars($doc->title, ENT_QUOTES, 'UTF-8'); ?>" loading="lazy" />
						</a>
					</div>
				<?php endif; ?>
				
				<div class="bee-doc-title">
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
					<h4><a href="<?php echo $url; ?>"><?php echo $doc->title; ?></a><?php foreach ($indicators as $indicator) : ?><sup class="bee-doc-indicator bee-doc-<?php echo strtolower(preg_replace('/[^a-zA-Z0-9]+/', '-', $indicator)); ?>"><?php echo htmlspecialchars($indicator, ENT_QUOTES, 'UTF-8'); ?></sup><?php endforeach; ?></h4>
				</div>
				<?php if ($thumbDesc) : ?>
					<p class="bee-doc-desc"><?php echo htmlspecialchars($thumbDesc, ENT_QUOTES, 'UTF-8'); ?></p>
				<?php endif; ?>
			</li>
		<?php
		}
	?>
</ul>

<div class="bee-view-all">
	<a href="index.php/joomla-extensions" title="View all">View more...</a>
</div>
