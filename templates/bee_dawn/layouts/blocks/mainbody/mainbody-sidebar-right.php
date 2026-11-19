<?php

/**
 * @package     Bee Framework
 *
 * @copyright   (C) 2023 Bee Framework. <https://beetemplate.com>
 * @license     GNU General Public License version 2 or later;
 */


// This is the code which will be placed in the head section

use Joomla\CMS\Factory;
use Joomla\Plugin\System\Bee\BeeTemplate;
use Joomla\Plugin\System\Bee\BeeSection;

// No direct access.
defined('_JEXEC') or die;

$doc = Factory::getDocument();
?>
<div id="bt-mainbody-wrap" class="bt-mainbody-wrap">
  <div class="<?php echo BeeSection::container('bt-page-content') ?>">
    <div class="row row-flex">
      <div id="bt-main-content" class="bt-main-content col-xs-12 col-md-8 col-lg-9">
        <?php if($doc->countModules('mainbody_top') && !BEE_COM_CONFIG && !BEE_COM_USERS) : ?>
          <section id="bt-mainbody-top" class="bt-mainbody-top">
            <jdoc:include type="modules" name="mainbody_top" style="bt_subheading_style" />
          </section>
        <?php endif; ?>

        <?php if($doc->countModules('mainbody')  && !BEE_COM_CONFIG && !BEE_COM_USERS) : ?>
          <div id="bt-mainbody" class="bt-mainbody bt-module">
            <jdoc:include type="message" />
            <jdoc:include type="modules" name="mainbody" style="bt_subheading_style" />
          </div>
        <?php else : ?>
          <div id="bt-mainbody" class="bt-mainbody bt-component">
            <jdoc:include type="message" />
            <jdoc:include type="component" />
          </div>
        <?php endif; ?>

        <?php if($doc->countModules('mainbody_bottom')  && !BEE_COM_CONFIG && !BEE_COM_USERS) : ?>
          <section id="bt-mainbody-bottom" class="bt-mainbody-bottom">
            <jdoc:include type="modules" name="mainbody_bottom" style="bt_subheading_style" />
          </section>
        <?php endif; ?>
      </div>
      <div id="bt-sidebar-right" class="bt-sidebar bt-sidebar-right col-xs-12 col-md-4 col-lg-3">
        <jdoc:include type="modules" name="sidebar-r" style="bt_style" />
      </div>
    </div>
  </div>
</div>