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

if ($touch_image == '') {
  $touch_image = $doc->baseurl . '/templates/' . $doc->template . '/media/images/touch-device.png';
}

$doc->addCustomTag('<link rel="apple-touch-icon" href="' . $touch_image . '">');
$doc->addCustomTag('<link rel="apple-touch-icon-precomposed" href="' . $touch_image . '">');

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
<html class="<?php echo $option . ' view-' . $view . ' layout-' . $layout . ' taks-' . $task . ' ' . $pageclass; ?>" lang="<?php echo $doc->language; ?>" dir="<?php echo $doc->direction; ?>">

<head>
  <?php echo BeeTemplate::renderBlock('head') ?>
</head>

<body id="bee-body" class="bee-body" data-bt-theme="<?php echo BeeColorPresetHelper::getActivePreset(); ?>">
    <!-- before open body -->
    <?php echo BeeConfig::get('custom_code_before_body') ?>

  <?php echo BeeTemplate::renderBlock('offcanvas') ?>
  <div id="bee-page-wrapper" class="bee-page-wrapper">
    <?php echo BeeTemplate::renderBlock('header') ?>

    <!-- Hero -->
    <?php if($doc->countModules('hero') && !BEE_LAYOUT_EDIT && !BEE_COM_CONFIG) : ?>
    <div <?php echo BeeSection::attrs('bee-hero') ?>>
      <div class="container">
        <jdoc:include type="modules" name="hero" style="none" />
      </div>
    </div>
    <?php endif; ?>

    <?php if($doc->countModules('landing-1') && !BEE_LAYOUT_EDIT && !BEE_COM_CONFIG) : ?>
      <section <?php echo BeeSection::attrs('bee-landing-1', 'bee-landing') ?>>
        <jdoc:include type="modules" name="landing-1" style="bee_section" section="bee-landing-1" />
      </section>
    <?php endif; ?>

    <?php if($doc->countModules('landing-2') && !BEE_LAYOUT_EDIT && !BEE_COM_CONFIG) : ?>
      <section <?php echo BeeSection::attrs('bee-landing-2', 'bee-landing') ?>>
        <jdoc:include type="modules" name="landing-2" style="bee_section" section="bee-landing-2" />
      </section>
    <?php endif; ?>

    <?php if($doc->countModules('landing-3') && !BEE_LAYOUT_EDIT && !BEE_COM_CONFIG) : ?>
      <section <?php echo BeeSection::attrs('bee-landing-3', 'bee-landing') ?>>
        <jdoc:include type="modules" name="landing-3" style="bee_section" section="bee-landing-3" />
      </section>
    <?php endif; ?>

    <?php if($doc->countModules('landing-4') && !BEE_LAYOUT_EDIT && !BEE_COM_CONFIG) : ?>
      <section <?php echo BeeSection::attrs('bee-landing-4', 'bee-landing') ?>>
        <jdoc:include type="modules" name="landing-4" style="bee_section" section="bee-landing-4" />
      </section>
    <?php endif; ?>

    <?php if($doc->countModules('landing-5') && !BEE_LAYOUT_EDIT && !BEE_COM_CONFIG) : ?>
      <section <?php echo BeeSection::attrs('bee-landing-5', 'bee-landing') ?>>
        <jdoc:include type="modules" name="landing-5" style="bee_section" section="bee-landing-5" />
      </section>
    <?php endif; ?>

    <?php if($doc->countModules('landing-6') && !BEE_LAYOUT_EDIT && !BEE_COM_CONFIG) : ?>
      <section <?php echo BeeSection::attrs('bee-landing-6', 'bee-landing') ?>>
        <jdoc:include type="modules" name="landing-6" style="bee_section" section="bee-landing-6" />
      </section>
    <?php endif; ?>

    <?php if($doc->countModules('landing-7') && !BEE_LAYOUT_EDIT && !BEE_COM_CONFIG) : ?>
      <section <?php echo BeeSection::attrs('bee-landing-7', 'bee-landing') ?>>
        <jdoc:include type="modules" name="landing-7" style="bee_section" section="bee-landing-7" />
      </section>
    <?php endif; ?>

    <?php if($doc->countModules('landing-8') && !BEE_LAYOUT_EDIT && !BEE_COM_CONFIG) : ?>
      <section <?php echo BeeSection::attrs('bee-landing-8', 'bee-landing') ?>>
        <jdoc:include type="modules" name="landing-8" style="bee_section" section="bee-landing-8" />
      </section>
    <?php endif; ?>

    <?php if($doc->countModules('landing-9') && !BEE_LAYOUT_EDIT && !BEE_COM_CONFIG) : ?>
      <section <?php echo BeeSection::attrs('bee-landing-9', 'bee-landing') ?>>
        <jdoc:include type="modules" name="landing-9" style="bee_section" section="bee-landing-9" />
      </section>
    <?php endif; ?>

    <?php if($doc->countModules('landing-10') && !BEE_LAYOUT_EDIT && !BEE_COM_CONFIG) : ?>
      <section <?php echo BeeSection::attrs('bee-landing-10', 'bee-landing') ?>>
        <jdoc:include type="modules" name="landing-10" style="bee_section" section="bee-landing-10" />
      </section>
    <?php endif; ?>

    <!-- Footer -->
    <?php echo BeeTemplate::renderBlock('footer') ?>
  </div>

  <!-- after open body -->
  <?php echo BeeConfig::get('custom_code_after_body') ?>
</body>
<html>