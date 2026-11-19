<?php

/**
 * Kunena Component
 *
 * @package         Kunena.Template.KBee
 * @subpackage      Layout.Message
 *
 * @copyright       Copyright (C) 2008 - 2023 Kunena Team. All rights reserved.
 * @license         https://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link            https://www.kunena.org
 **/

namespace Kunena\Forum\Site;

\defined('_JEXEC') or die();

use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Uri\Uri;
use Kunena\Forum\Libraries\Icons\KunenaIcons;
use Kunena\Forum\Libraries\Route\KunenaRoute;
use Kunena\Forum\Libraries\Template\KunenaTemplate;

$view    = Factory::getApplication()->getInput()->getWord('view');
?>

<div class="kpage-header">
  <div class="kpage-title-wrap">
    <h1>
      <?php echo $this->escape($this->headerText); ?>
      <small class="d-none d-sm-block">
        (<?php echo Text::sprintf($this->messagemore, $this->formatLargeNumber($this->pagination->total)); ?>
        )
      </small>

      <?php // ToDo:: <span class="badge bg-success"> <?php echo $this->topics->count->unread; ?/></span>
      ?>
    </h1>

    <div id="filter-time">
      <h2 class="filter-sel"><?php echo Text::_('COM_KUNENA_TIME_RANGE'); ?></h2>
      <form action="<?php echo $this->escape(Uri::getInstance()->toString()); ?>" id="timeselect" name="timeselect" method="post" target="_self" class="form-inline d-none d-sm-block">
        <?php $this->displayTimeFilter('sel'); ?>
        <?php echo HTMLHelper::_('form.token'); ?>
      </form>
    </div>
    <form action="<?php echo $this->escape(Uri::getInstance()->toString()); ?>"
        id="timeselect-mobile" name="timeselect-mobile"
        method="post" target="_self" class="timefilter d-block d-sm-none">
        <?php $this->displayTimeFilter('sel'); ?>
        <?php echo HTMLHelper::_('form.token'); ?>
    </form>

  </div>
</div>


<div class="ktopic-filter">
  <div class="kpagination-wrap">
    <?php echo $this->subLayout('Widget/Pagination/List')
      ->set('pagination', $this->pagination->setDisplayedPages(4))
      ->set('display', true); ?>
  </div>

  <div class="ktopic-search-wrap">
    <?php echo $this->subLayout('Widget/Search')
      ->set('catid', 'all')
      ->setLayout('topic'); ?>
  </div>
</div>

<form action="<?php echo KunenaRoute::_('index.php?option=com_kunena&view=topics'); ?>" method="post" name="ktopicsform" id="ktopicsform">
  <?php echo HTMLHelper::_('form.token'); ?>

  <div class="ktopic-list-wrap">
    <div class="ktopic-list-header">
      <div class="krow">
      <?php if (empty($this->messages)) : ?>
          <div scope="kcol kcol-full">&nbsp;</div>
      <?php else : ?>
        <div class="kcol kcol-icon">
          <a id="forumtop"> </a>
          <a href="#forumbottom" rel="nofollow">
            <?php echo KunenaIcons::arrowdown(); ?>
          </a>
        </div>
        <div class="kcol kcol-subject kcol-auto"><?php echo Text::_('COM_KUNENA_GEN_SUBJECT'); ?></div>
        <div class="kcol kcol-stats"><?php echo Text::_('COM_KUNENA_GEN_REPLIES'); ?></div>
        <div class="kcol kcol-stats"><?php echo Text::_('COM_KUNENA_GEN_HITS'); ?></div>
        <div class="kcol kcol-latest-post"><?php echo Text::_('COM_KUNENA_GEN_LAST_POST'); ?></div>
        
        <?php if (!empty($this->actions)) : ?>
          <div class="kcol kcol-checkbox"><input class="kcheckall" type="checkbox" name="toggle" value="" /></div>
        <?php endif; ?>
      <?php endif; ?>
      </div>
    </div>

    <div class="ktopic-list">
      <?php
      foreach ($this->messages as $i => $message) {
        echo $this->subLayout('Message/Row')
          ->set('message', $message)
          ->set('position', $i)
          ->set('checkbox', !empty($this->actions));
      }
      ?>
    </div>

    <div class="ktopic-list-footer">
      <?php if (!empty($this->messages)) : ?>
        <div class="krow">
          <div class="kcol kcol-icon">
            <a id="forumbottom"> </a>
            <a href="#forumtop" rel="nofollow">
              <span class="dropdown-divider"></span>
              <?php echo KunenaIcons::arrowup(); ?>
            </a>
          </div>
          <?php if (!empty($this->actions)) : ?>
            <div class="kcol kcol-auto">
              <div class="form-group">
                <div class="input-group" role="group">
                  <?php if (!empty($this->moreUri)) {
                    echo HTMLHelper::_('kunenaforum.link', $this->moreUri, Text::_('COM_KUNENA_MORE'), null, 'kbtn kbtn-primary', 'nofollow');
                  } ?>
                  <?php
                  if (!empty($this->actions)) :
                  ?>
                    <?php echo HTMLHelper::_('select.genericlist', $this->actions, 'task', 'class="form-select kchecktask" ', 'value', 'text', 0, 'kchecktask'); ?>
                    <?php
                    if (isset($this->actions['move'])) :
                      $options = [HTMLHelper::_('select.option', '0', Text::_('COM_KUNENA_BULK_CHOOSE_DESTINATION'))];
                      echo HTMLHelper::_('kunenaforum.categorylist', 'target', 0, $options, [], 'class="form-select fbs" disabled="disabled"', 'value', 'text', 0, 'kchecktarget');
                    endif; ?>
                    <input type="submit" name="kcheckgo" class="kbtn kbtn-primary" value="<?php echo Text::_('COM_KUNENA_GO') ?>" />
                  <?php endif; ?>
                </div>
              </div>
            </div>
          <?php endif; ?>
        </div>
      <?php endif; ?>
    </div>

  </div>
</form>

<div class="kpagination-wrap kpagination-bot">
  <?php echo $this->subLayout('Widget/Pagination/List')
    ->set('pagination', $this->pagination->setDisplayedPages(4))
    ->set('display', true); ?>
</div>