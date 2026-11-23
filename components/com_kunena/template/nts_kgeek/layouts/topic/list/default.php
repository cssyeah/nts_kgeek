<?php

/**
 * Kunena Component
 *
 * @package         Kunena.Template.KGeek
 * @subpackage      Layout.Topic
 *
 * @copyright       Copyright (C) 2008 - 2023 Kunena Team. All rights reserved.
 * @license         https://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link            https://www.kunena.org
 **/

defined('_JEXEC') or die();

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Uri\Uri;
use Kunena\Forum\Libraries\Config\KunenaConfig;
use Kunena\Forum\Libraries\Factory\KunenaFactory;
use Kunena\Forum\Libraries\Forum\Category\KunenaCategory;
use Kunena\Forum\Libraries\Icons\KunenaIcons;
use Kunena\Forum\Libraries\Route\KunenaRoute;
use Kunena\Forum\Libraries\Template\KunenaTemplate;
use Kunena\Forum\Libraries\User\KunenaUserHelper;

$cols            = !empty($this->actions) ? 6 : 7;
$colspan         = !empty($this->actions) ? 4 : 3;
$view            = $this->input->getWord('view');
$layout          = $this->input->getWord('layout');
$this->ktemplate = KunenaFactory::getTemplate();
$me              = KunenaUserHelper::getMyself();

if (KunenaConfig::getInstance()->ratingEnabled) {
  $this->addStyleSheet('rating.css');
}
?>

<div class="kpage-header">
  <div class="kpage-title-wrap">
    <h1 class="kpage-title">
      <?php echo $this->escape($this->headerText); ?>

      <?php if ($layout != 'unread') : ?>
        <small>
          (<?php echo KunenaCategory::getInstance()->totalCount($this->pagination->total); ?>)
        </small>
      <?php endif; ?>

      <?php // ToDo:: <span class="badge bg-success"> <?php echo $this->topics->count->unread; ?/></span> 
      ?>
    </h1>

    <?php if ($view != 'user') : ?>
      <div id="filter-time">
        <h2 class="filter-sel"><?php echo Text::_('COM_KUNENA_TIME_RANGE'); ?></h2>
        <form action="<?php echo $this->escape(Uri::getInstance()->toString()); ?>" id="timeselect" name="timeselect" method="post" target="_self" class="form-inline d-none d-sm-block">
          <?php $this->displayTimeFilter('sel'); ?>
          <?php echo HTMLHelper::_('form.token'); ?>
        </form>
      </div>
    <?php endif; ?>
  </div>

</div> <!-- End: Page header -->


<div class="ktopic-filter">
  <?php
  if ($this->config->enableForumJump && !$this->embedded && $this->topics) {
    echo $this->subLayout('Widget/Forumjump')->set('categorylist', $this->categorylist);
  } ?>

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
</div> <!-- End: Topic filter -->

<div class="kfrontend">
  <form action="<?php echo KunenaRoute::_('index.php?option=com_kunena&view=topics'); ?>" method="post" name="ktopicsform" id="ktopicsform">
    <?php echo HTMLHelper::_('form.token'); ?>
    <?php if ($view == 'user') : ?>
      <input type="hidden" name="userid" value="<?php echo $this->user->userid; ?>" />
    <?php endif; ?>

    <div class="ktopic-list-wrap">
      <div class="ktopic-list-header">
        <div class="krow">
          <div class="kcol kcol-icon">
            <a id="forumtop"> </a>
            <a href="#forumbottom" rel="nofollow">
              <?php echo KunenaIcons::arrowdown(); ?>
            </a>
          </div>

          <?php if (!empty($this->actions)) : ?>
            <div class="kcol kcol-checkbox"><input class="kcheckall" type="checkbox" name="toggle" value="" /></div>
          <?php endif; ?>
        </div>
      </div>

      <div class="ktopic-list">
        <?php if (empty($this->topics) && empty($this->subcategories)) : ?>
          <div class="krow">
            <div class="kcol kcol-full"><?php echo Text::_('COM_KUNENA_VIEW_NO_TOPICS') ?></div>
          </div>
        <?php else : ?>
          <?php $counter = 2; ?>

          <?php foreach ($this->topics as $i => $topic) {
            echo $this->subLayout('Topic/Row')
              ->set('topic', $topic)
              ->set('position', 'kunena_topic_' . $i)
              ->set('checkbox', !empty($this->actions));

            if ($this->ktemplate->params->get('displayModule')) {
              echo $this->subLayout('Widget/Module')
                ->set('position', 'kunena_topic_' . $counter++)
                ->set('cols', $cols)
                ->setLayout('table_row');
            }
          } ?>
        <?php endif; ?>
      </div>

      <div class="ktopic-list-footer">
        <div class="krow">
          <div class="kcol kcol-icon">
            <a id="forumbottom"> </a>
            <a href="#forumtop" rel="nofollow">
              <span class="dropdown-divider"></span>
              <?php echo KunenaIcons::arrowup(); ?>
            </a>
          </div>
          <?php if (!empty($this->actions) || !empty($this->moreUri)) : ?>
            <div class="kcol kcol-auto">
              <div class="form-group">
                <div class="input-group" role="group">
                  <?php if (!empty($this->topics) && !empty($this->moreUri)) {
                    echo HTMLHelper::_('kunenaforum.link', $this->moreUri, Text::_('COM_KUNENA_MORE'), null, 'kbtn kbtn-primary', 'follow');
                  } ?>
                  <?php if (!empty($this->actions)) : ?>
                    <?php echo HTMLHelper::_('select.genericlist', $this->actions, 'task', 'class="form-select kchecktask" ', 'value', 'text', 0, 'kchecktask'); ?>
                    <?php if (isset($this->actions['move'])) :
                      $options = [HTMLHelper::_('select.option', '0', Text::_('COM_KUNENA_BULK_CHOOSE_DESTINATION'))];
                      echo HTMLHelper::_('kunenaforum.categorylist', 'target', 0, $options, [], 'class="form-select fbs" disabled="disabled"', 'value', 'text', 0, 'kchecktarget');
                    endif; ?>
                    <button type="submit" name="kcheckgo" class="kbtn kbtn-primary"><?php echo Text::_('COM_KUNENA_GO') ?>
                    </button>
                  <?php endif; ?>
                </div>
              </div>
            </div>
          <?php endif; ?>
        </div>
      </div>
    </div>
  </form>
</div>


<div class="kpagination-wrap kpagination-bot">
  <?php echo $this->subLayout('Widget/Pagination/List')
  ->set('pagination', $this->pagination->setDisplayedPages(4))
  ->set('display', true); ?>
</div>