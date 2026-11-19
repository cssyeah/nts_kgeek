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
use Joomla\CMS\Uri\Uri;
use Joomla\Database\ParameterType;

/**
 * Owl Carousel slider layout. jQuery, Owl Carousel JS/CSS and Font Awesome are loaded globally
 * by the template (layouts/blocks/head.php).
 *
 * Layout variables
 *
 * "Other extensions" slider: only rendered on a document detail page and never shows the document
 * being viewed. Empty output means the module (and its title/chrome) is not displayed at all.
 *
 * @var array                     $lists
 * @var int                       $Itemid
 * @var stdClass                  $module
 * @var \Joomla\Registry\Registry $params
 */

$app   = Factory::getApplication();
$input = $app->getInput();

if ($input->getCmd('option') !== 'com_dms' || $input->getCmd('view') !== 'document')
{
	return;
}

$currentId = $input->getInt('id');

if ($currentId && in_array($currentId, array_map('intval', array_column($lists, 'id')), true))
{
	// The current document took one of the slots, fetch one more so the slider keeps the configured count
	$moreParams = clone $params;
	$moreParams->set('number_document', (int) $params->get('number_document', 5) + 1);
	$lists = $app->bootModule('mod_dms_documents', 'site')->getHelper('DocumentsHelper')->getLists($moreParams);
	$lists = array_values(array_filter($lists, function ($doc) use ($currentId) {
		return (int) $doc->id !== $currentId;
	}));
}

if (!count($lists))
{
	return;
}

// The module query only selects id, thumb and title, so load the extra fields we need here
$db      = Factory::getContainer()->get('DatabaseDriver');
$columns = ['id', 'thumbnail', 'image', 'indicators', 'created_date', 'short_description', 'tags'];
$query   = $db->getQuery(true)
	->select($db->quoteName($columns))
	->from($db->quoteName('#__dms_documents'))
	->whereIn($db->quoteName('id'), array_map('intval', array_column($lists, 'id')), ParameterType::INTEGER);
$db->setQuery($query);
$extras = $db->loadObjectList('id');

// Newest documents first, fall back to id when created dates are equal
usort($lists, function ($a, $b) use ($extras) {
	$dateA = $extras[$a->id]->created_date ?? '';
	$dateB = $extras[$b->id]->created_date ?? '';

	return strcmp($dateB, $dateA) ?: $b->id <=> $a->id;
});

$rootUri  = Uri::root(true);
$sliderId = 'bee-docs-slider-' . (int) $module->id;
?>
<div class="bee-docs-listing bee-docs-slider" id="<?php echo $sliderId; ?>">
	<div class="owl-carousel">
		<?php
		foreach ($lists as $doc)
		{
			$extra = $extras[$doc->id] ?? null;
			$url   = Route::_(DMSHelperRoute::getDocumentRoute($doc->id, 0, $Itemid));
			// short_description is an editor field, keep only its text for the card
			$thumbDesc = trim(html_entity_decode(strip_tags((string) ($extra->short_description ?? '')), ENT_QUOTES, 'UTF-8'));
			// Indicators are stored comma separated (New, Hot), same as the component's common/indicators.php
			$indicators = array_filter(array_map('trim', explode(',', (string) ($extra->indicators ?? ''))));
			// Tags are stored comma separated (Plugin, Joomla 5), same as the documentgrid override
			$tags   = array_filter(array_map('trim', explode(',', (string) ($extra->tags ?? ''))));
			$imgSrc = '';

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
			<div class="bee-doc-item">
				<?php if ($imgSrc) : ?>
					<div class="bee-doc-media">
						<a href="<?php echo $url; ?>">
							<img src="<?php echo $imgSrc; ?>" alt="<?php echo htmlspecialchars($doc->title, ENT_QUOTES, 'UTF-8'); ?>" loading="lazy" />
						</a>
					</div>
				<?php endif; ?>

				<div class="bee-doc-title">
					<h4><a href="<?php echo $url; ?>"><?php echo $doc->title; ?></a><?php foreach ($indicators as $indicator) : ?><sup class="bee-doc-indicator bee-doc-<?php echo strtolower(preg_replace('/[^a-zA-Z0-9]+/', '-', $indicator)); ?>"><?php echo htmlspecialchars($indicator, ENT_QUOTES, 'UTF-8'); ?></sup><?php endforeach; ?></h4>
				</div>

			</div>
		<?php
		}
		?>
	</div>
</div>

<script>
	jQuery(function ($) {
		var $slider = $('#<?php echo $sliderId; ?> .owl-carousel');
		// Respect the OS "reduce motion" setting, otherwise use a long eased slide
		var reduceMotion = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
		var speed = reduceMotion ? 0 : 700;

		$slider.owlCarousel({
			items: 1,
			margin: 16,
			loop: true,
			rewind: false,
			autoplay: true,
			nav: true,
			dots: false,
			mouseDrag: true,
			touchDrag: true,
			smartSpeed: speed,
			navSpeed: speed,
			dragEndSpeed: speed,
			// easeOutCubic, gives the slide a soft stop instead of the default linear "ease"
			slideTransition: 'cubic-bezier(0.22, 0.61, 0.36, 1)',
			navText: [
				'<i class="fa-duotone fa-light fa-angle-left"></i><span class="visually-hidden">Previous</span>',
				'<i class="fa-duotone fa-light fa-angle-right"></i><span class="visually-hidden">Next</span>'
			],
			responsive: {
				0: {items: 1, margin: 16},
				768: {items: 2, margin: 24},
				992: {items: 3, margin: 32}
			}
		});
	});
</script>