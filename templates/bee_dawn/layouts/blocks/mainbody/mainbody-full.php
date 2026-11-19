<?php

/**
 * @package     Bee Framework
 *
 * @copyright   (C) 2023 Bee Framework. <https://beetemplate.com>
 * @license     GNU General Public License version 2 or later;
 */

// This is the code which will be placed in the mainbody section

use Joomla\CMS\Factory;
use Joomla\Plugin\System\Bee\BeeTemplate;
use Joomla\Plugin\System\Bee\BeeSection;

// No direct access.
defined('_JEXEC') or die;

$doc = Factory::getDocument();

?>
<div id="bt-mainbody-wrap" class="bt-mainbody-wrap">
    <?php if($doc->countModules('mainbody_top') && !BEE_COM_CONFIG && !BEE_COM_USERS && !BEE_LAYOUT_EDIT) : ?>
      <section id="bt-mainbody-top" class="bt-mainbody-top">
        <jdoc:include type="modules" name="mainbody_top" style="bt_subheading_style" />
      </section>
    <?php endif; ?>

    <?php if($doc->countModules('mainbody') && !BEE_COM_CONFIG && !BEE_COM_USERS && !BEE_LAYOUT_EDIT) : ?>
      <div id="bt-mainbody" class="bt-mainbody bt-module">
        <jdoc:include type="modules" name="mainbody" style="bt_subheading_style" />
      </div>
    <?php else : ?>
      <div id="bt-mainbody" class="bt-mainbody bt-component">
        <jdoc:include type="message" />
        <jdoc:include type="component" />
      </div>
    <?php endif; ?>

    <?php if($doc->countModules('mainbody_bottom') && !BEE_COM_CONFIG && !BEE_COM_USERS && !BEE_LAYOUT_EDIT) : ?>
      <section id="bt-mainbody-bottom" class="bt-mainbody-bottom">
        <jdoc:include type="modules" name="mainbody_bottom" style="bt_subheading_style" />
      </section>
    <?php endif; ?>
</div>