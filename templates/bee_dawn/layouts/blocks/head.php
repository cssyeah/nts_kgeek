<?php

/**
 * @package     Bee Framework
 *
 * @copyright   (C) 2023 Bee Framework. <https://beetemplate.com>
 * @license     GNU General Public License version 2 or later;
 */


// This is the code which will be placed in the head section

// No direct access.
defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\Plugin\System\Bee\BeeConfig;

$doc = Factory::getDocument();
$params = $doc->params;

$doc->setMetaData('viewport', 'width=device-width, initial-scale=1');

HTMLHelper::stylesheet('plugins/system/bee/media/css/joomla-fontawesome.css');
HTMLHelper::stylesheet('templates/'.$doc->template.'/media/js/owl-carousel/owl.carousel.min.css');
HTMLHelper::stylesheet('templates/'.$doc->template.'/media/js/owl-carousel/owl.theme.default.min.css');
HTMLHelper::stylesheet('templates/'.$doc->template.'/media/fonts/remixicon/remixicon.css');
HTMLHelper::stylesheet('templates/'.$doc->template.'/media/fonts/faws/css/all.min.css');
HTMLHelper::stylesheet('templates/'.$doc->template.'/media/fonts/faws/css/duotone-light.min.css');
HTMLHelper::stylesheet('templates/'.$doc->template.'/media/fonts/faws/css/duotone-regular.min.css');
HTMLHelper::stylesheet('templates/'.$doc->template.'/media/fonts/faws/css/duotone-thin.min.css');

HTMLHelper::_('jquery.framework');
HTMLHelper::_('bootstrap.offcanvas');
HTMLHelper::_('bootstrap.collapse');
HTMLHelper::script('templates/'.$doc->template.'/media/js/owl-carousel/owl.carousel.min.js');
HTMLHelper::script('templates/'.$doc->template.'/media/js/offcanvas.js');
?>
<!-- after open head -->
<?php echo BeeConfig::get('custom_code_after_head') ?>

<jdoc:include type="metas" />
<jdoc:include type="styles" />
<jdoc:include type="scripts" />

<!-- before close head -->
<?php echo BeeConfig::get('custom_code_before_head') ?>