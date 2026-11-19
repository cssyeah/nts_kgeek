<?php

/**
 * @package     Bee Framework
 *
 * @copyright   (C) 2023 Bee Framework. <https://beetemplate.com>
 * @license     GNU General Public License version 2 or later;
 */

use Joomla\CMS\Uri\Uri;
use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\Plugin\System\Bee\BeeTemplate;
use Joomla\Plugin\System\Bee\BeeSection;
use Joomla\Plugin\System\Bee\Element\BeeMenuElement;
use Joomla\Plugin\System\Bee\Element\BeeOffcanvasElement;
use Joomla\Plugin\System\Bee\Element\BeePresetElement;

// No direct access.
defined('_JEXEC') or die;

$doc = Factory::getDocument();
$params = $doc->params;
$menu_fixed = $params->get('menu_fixed', '0');
$show_dark_light_mode = $params->get('show_dark_light_mode', '0');
?>

<!-- TOPBAR -->
<?php if ($doc->countModules('topbar')): ?>
  <div <?php echo BeeSection::attrs('bee-topbar', 'bee-topbar') ?>>
    <div class="<?php echo BeeSection::container('bee-topbar') ?>">
      <?php if ($doc->countModules('topbar')): ?>
        <jdoc:include type="modules" name="topbar" style="none" />
      <?php endif; ?>
    </div>
  </div>
<?php endif; ?>
<!-- // TOPBAR -->

<!-- HEADER -->
<header <?php echo BeeSection::attrs('bee-header', 'bee-header' . ($menu_fixed ? ' bee-fixed-top' : '')) ?>>
  <div class="<?php echo BeeSection::container('bee-header') ?>">
    <div class="header-inner">
      <div class="bee-logo-wrap">
        <a href="<?php echo Uri::root(); ?>" title="BeeThemePro">
          <span class="bee-logo-ico">
            <svg xmlns="http://www.w3.org/2000/svg" width="240" height="200" viewBox="0 0 120 100" fill="none">
            <title>Hand-drawn BeeTheme bee</title>
            <!-- Hand-drawn wings -->
            <path d="M55 42 C42 42 28 31 28 19 C28 8 39 8 49 16 C56 21 60 31 63 38" fill="#fff" stroke="#111" stroke-width="4.5" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M60 40 C58 29 60 18 66 13 C71 9 76 13 75 21" stroke="#111" stroke-width="4.5" stroke-linecap="round"/>
            <path d="M64 38 C65 32 70 30 73 33 C76 36 72 42 67 43" stroke="#111" stroke-width="3.7" stroke-linecap="round"/>
            <!-- Body silhouette -->
            <path d="M64 38 C49 37 36 44 30 57 C24 68 28 79 40 84 C51 91 66 90 77 83 L82 88 L82 78 C90 67 85 49 74 42 Z" fill="#111" stroke="#111" stroke-width="3.5" stroke-linejoin="round"/>
            <!-- Yellow body stripes -->
            <path d="M38 52 C32 62 31 73 38 80 C42 84 46 85 50 86 C43 77 38 66 38 52Z" fill="#ffda00"/>
            <path d="M52 41 C47 45 45 50 46 58 C47 70 55 82 63 85 C69 85 73 83 76 80 C63 73 54 55 52 41Z" fill="#ffda00"/>
            <!-- Face and head -->
            <path d="M74 34 C84 26 98 28 106 37 C114 46 112 60 102 68 C93 76 80 76 71 68 C61 60 61 44 74 34Z" fill="#ffda00" stroke="#111" stroke-width="4.5" stroke-linejoin="round"/>
            <path d="M70 60 C73 66 80 71 88 72" stroke="#fff" stroke-width="2" opacity=".9" stroke-linecap="round"/>
            <path d="M77 35 C86 31 96 33 102 40" stroke="#fff" stroke-width="2" opacity=".85" stroke-linecap="round"/>
            <path d="M92 46 C95 43 98 46 98 49 C97 53 92 54 90 50 C89 48 90 47 92 46Z" fill="#111"/>
            <!-- Sketch motion marks -->
            <g stroke="#111" stroke-width="4.5" stroke-linecap="round"><path d="M20 54 L10 49"/><path d="M16 65 L5 65"/><path d="M20 76 L11 83"/><path d="M99 16 L103 9"/></g>
            </svg>
          </span>
          <div class="bee-logo-text">
            <span><strong>BeeTheme</strong><small>Pro</small></span>
          </div>
        </a>
        <?php // echo BeeTemplate::renderBlock('logo') ?>
      </div>

      <?php if ($doc->countModules('mainmenu', true)) : ?>
        <?php echo BeeMenuElement::render(); ?>
      <?php endif; ?>

      <div class="bee-header-r">
        <?php if($doc->countModules('header-r')) : ?>
          <jdoc:include type="modules" name="header-r" style="raw" />
        <?php endif ?>

        <?php //echo BeeMenuElement::renderDropdownButton() ?>

        <div class="d-lg-none">
        <!-- Offcanvas -->
        <?php
        if ($doc->params->get('offcanvas')) {
          echo BeeOffcanvasElement::render();
        }
        ?>
        </div>
      </div>
    </div>
  </div>
</header>
<!-- // HEADER -->

<?php if($doc->countModules('subnav')) : ?>
  <div id="bee-subnav" class="bee-subnav">
    <div class="container">
      <jdoc:include type="modules" name="subnav" style="raw" />
    </div>
  </div>
<?php endif; ?>