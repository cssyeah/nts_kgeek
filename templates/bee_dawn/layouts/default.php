<?php

/**
 * @package     Bee Framework
 *
 * @copyright   (C) 2023 Bee Framework. <https://beetemplate.com>
 * @license     GNU General Public License version 2 or later;
 */

use Joomla\CMS\Factory;
use Joomla\Plugin\System\Bee\BeeTemplate;
use Joomla\Plugin\System\Bee\BeeSection;
use Joomla\CMS\Helper\MediaHelper;
use Joomla\Plugin\System\Bee\BeeConfig;
use Joomla\Plugin\System\Bee\Helper\BeeColorPresetHelper;

// No direct access.
defined('_JEXEC') or die('Restricted access');

$doc = Factory::getDocument();

$app   = Factory::getApplication();
$input = $app->getInput();
$params = $doc->params;

$favicon = MediaHelper::getCleanMediaFieldValue($params->get('favicon_image', ''));

if ($favicon) {
    $doc->addFavicon($favicon);
}

$touch_image = $params->get('touch_image', '');

if($touch_image == '') {
    $touch_image = $doc->baseurl.'/templates/'.$doc->template.'/media/images/touch-device.png';
}

$doc->addCustomTag('<link rel="apple-touch-icon" href="'.$touch_image.'">');
$doc->addCustomTag('<link rel="apple-touch-icon-precomposed" href="'.$touch_image.'">');

// Detecting Active Variables
$option   = $input->getCmd('option', '');
$view     = $input->getCmd('view', '');
$layout   = $input->getCmd('layout', '');
$task     = $input->getCmd('task', '');
$itemid   = $input->getCmd('Itemid', '');
$sitename = htmlspecialchars($app->get('sitename'), ENT_QUOTES, 'UTF-8');
$menu     = $app->getMenu()->getActive();
$pageclass = $menu !== null ? $menu->getParams()->get('pageclass_sfx', '') : '';

// defines if com_config
define('BEE_COM_CONFIG', $option == 'com_config');

// Defines if layout-edit
define('BEE_LAYOUT_EDIT', $layout == 'edit');

// defines if com_users
define('BEE_COM_USERS', $option == 'com_users');

// Colors
BeeColorPresetHelper::loadPreset();
?>

<!DOCTYPE html>
<html class="<?php echo $option . ' view-' . $view . ' layout-' . $layout . ' taks-' . $task . ' ' . $pageclass;?>" lang="<?php echo $doc->language; ?>" dir="<?php echo $doc->direction; ?>">

<head>
    <?php echo BeeTemplate::renderBlock('head') ?>
</head>

<body id="bt-body" class="bt-body" data-bt-theme="<?php echo BeeColorPresetHelper::getActivePreset(); ?>">
    <!-- before open body -->
    <?php echo BeeConfig::get('custom_code_before_body') ?>

  <?php echo BeeTemplate::renderBlock('offcanvas') ?>
	<div id="bt-page-wrapper" class="bt-page-wrapper">
    	<?php echo BeeTemplate::renderBlock('header') ?>

        <?php if($doc->countModules('masthead') && !BEE_LAYOUT_EDIT && !BEE_COM_CONFIG) : ?>
        <section <?php echo BeeSection::attrs('bt-masthead-section') ?>>
            <jdoc:include type="modules" name="masthead" style="bt_section" section="bt-masthead-section" />
        </section>
        <?php endif; ?>

        <?php if ($sublayout = BeeTemplate::getSublayout()): ?>
            <?php echo BeeTemplate::renderSublayout($sublayout) ?>
        <?php else : ?>
            <?php echo BeeTemplate::renderBlock('mainbody') ?>
        <?php endif ?>

        <?php echo BeeTemplate::renderBlock('footer') ?>
	</div>
    <!-- after open body -->
    <?php echo BeeConfig::get('custom_code_after_body') ?>
</body>
<html>