<?php

/**
 * Kunena Component
 *
 * @package         Kunena.Template.KInfinite
 * @subpackage      Layout.Topic
 *
 * @copyright       Copyright (C) 2008 - 2023 Kunena Team. All rights reserved.
 * @license         https://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link            https://www.kunena.org
 **/

defined('_JEXEC') or die();

use Joomla\CMS\Language\Text;
use Kunena\Forum\Libraries\Config\KunenaConfig;
use Kunena\Forum\Libraries\Factory\KunenaFactory;
use Kunena\Forum\Libraries\Icons\KunenaIcons;
use Kunena\Forum\Libraries\Template\KunenaTemplate;

$topic           = $this->topic;
$userTopic       = $topic->getUserTopic();
$config          = KunenaConfig::getInstance();
$topicPages      = $topic->getPagination(null, $config->messagesPerPage, 3);
$author          = $topic->getLastPostAuthor();
$this->ktemplate = KunenaFactory::getTemplate();
$avatar          = $author->getAvatarImage($this->ktemplate->params->get('avatarType'), 'thumb');
$category        = $this->topic->getCategory();
$txt             = '';

if ($this->topic->ordering) {
  $txt = $this->topic->getCategory()->class_sfx ? $txt . '' : $txt . '-stickymsg';
}

if ($this->topic->hold == 1) {
  $txt .= ' ' . 'unapproved';
} else {
  if ($this->topic->hold) {
    $txt .= ' ' . 'deleted';
  }
}

if ($this->topic->moved_id > 0) {
  $txt .= ' ' . 'moved';
}

if (!empty($this->spacing)) : ?>
  <div class="kcontenttablespacer">
    <div class="kcol kcol-full">&nbsp;</div>
  </div>
<?php endif; ?>

<div class="krow category<?php echo $this->escape($category->class_sfx) . $txt; ?>">
  <div class="kcol kcol-stats">
    <span class="kstats-value"><?php echo $this->formatLargeNumber($topic->getReplies()); ?></span>
    <span class="kstats-label"><?php echo Text::_('COM_KUNENA_GEN_REPLIES'); ?></span>
  </div>

  <?php if ($topic->unread) : ?>
    <div class="kcol kcol-icon topic-item-unread">
      <?php echo $this->getTopicLink($topic, 'unread', KunenaTemplate::getInstance()->getTopicIcon($topic), '', null, $category, true, true); ?>
    </div>
  <?php else : ?>
    <div class="kcol kcol-icon">
      <?php echo $this->getTopicLink($topic, null, KunenaTemplate::getInstance()->getTopicIcon($topic), '', null, $category, true, false); ?>
    </div>
  <?php endif; ?>

  <div class="kcol kcol-subject kcol-auto">
    <div class="ktopic-title-wrap">
      <h3>
        <?php
        if ($this->ktemplate->params->get('labels') != 0) {
          echo $this->subLayout('Widget/Label')->set('topic', $this->topic)->setLayout('default');
        }

        if ($topic->unread) {
          echo $this->getTopicLink($topic, 'unread', $this->escape($topic->subject) . '<sup class="knewchar" dir="ltr">(' . (int) $topic->unread . ' ' .
            Text::_('COM_KUNENA_A_GEN_NEWCHAR') . ')</sup>', null, KunenaTemplate::getInstance()->tooltips() . ' topictitle', $category, true, true);
        } else {
          echo $this->getTopicLink($topic, null, null, null, KunenaTemplate::getInstance()->tooltips() . ' topictitle', $category, true, false);
        }
        echo $this->subLayout('Widget/Rating')->set('config', $config)->set('category', $category)->set('topic', $this->topic)->set('reviewCount', $this->topic->getReviewCount())->setLayout('default'); ?>
      </h3>
      <div class="ktopic-badge">
        <?php if ($userTopic->favorite) : ?>
          <span class="badge-favorite" <?php echo KunenaTemplate::getInstance()->tooltips(true); ?> data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_FAVORITE'); ?>"><?php echo KunenaIcons::star(); ?></span>
        <?php endif; ?>

        <?php if ($userTopic->posts) : ?>
          <span class="badge-myposts" <?php echo KunenaTemplate::getInstance()->tooltips(true); ?> data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_MYPOSTS'); ?>"><?php echo KunenaIcons::flag(); ?></span>
        <?php endif; ?>

        <?php if ($this->topic->attachments) : ?>
          <span class="badge-attach" <?php echo KunenaTemplate::getInstance()->tooltips(true); ?> data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_ATTACH'); ?>"><?php echo KunenaIcons::attach(); ?></span>
        <?php endif; ?>

        <?php if ($this->topic->poll_id && $category->allowPolls) : ?>
          <span class="badge-poll" <?php echo KunenaTemplate::getInstance()->tooltips(true); ?> data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_ADMIN_POLLS'); ?>"><?php echo KunenaIcons::poll(); ?></span>
        <?php endif; ?>
      </div>
    </div>

    <div class="ktopic-meta">
      <span class="ktopic-category"> <?php echo Text::sprintf('COM_KUNENA_CATEGORY_X', $this->getCategoryLink($this->topic->getCategory(), null, $this->topic->getCategory()->description, KunenaTemplate::getInstance()->tooltips())) ?></span>
      <?php echo Text::_('COM_KUNENA_TOPIC_STARTED_ON') ?>
      <?php if ($config->postDateFormat != 'none') : ?>
        <?php echo $topic->getFirstPostTime()->toKunena('config_postDateFormat'); ?>,
      <?php endif; ?>
      <?php echo Text::_('COM_KUNENA_BY') ?>
      <?php echo $topic->getAuthor()->getLink(null, Text::sprintf('COM_KUNENA_VIEW_USER_LINK_TITLE', $this->topic->getFirstPostAuthor()->getName()), '', '', KunenaTemplate::getInstance()->tooltips(), $category->id); ?>
      <div class="float-end">
        <?php /** TODO: New Feature - LABELS
         * <span class="badge bg-info">
         * <?php echo Text::_('COM_KUNENA_TOPIC_ROW_TABLE_LABEL_QUESTION'); ?>
         * </span>    */ ?>
        <?php if ($topic->locked != 0) : ?>
          <span class="badge bg-warning">
            <span data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_LOCKED'); ?>"><?php echo KunenaIcons::lock(); ?></span>
          </span>
        <?php endif; ?>
      </div>
    </div>

    <div class="kpagination-wrap-sm">
      <?php echo $this->subLayout('Widget/Pagination/List')->set('pagination', $topicPages)->setLayout('simple'); ?>
    </div>
  </div>

  <div class="kcol kcol-stats">
    <span class="kstats-value"><?php echo $this->formatLargeNumber($topic->hits); ?></span>
    <span class="kstats-label"><?php echo Text::_('COM_KUNENA_GEN_HITS'); ?></span>
  </div>

  <div class="kcol kcol-latest-post">
    <?php if ($config->avatarOnCategory) : ?>
      <div class="kuser-avatar">
        <?php echo $author->getLink($avatar, Text::sprintf('COM_KUNENA_VIEW_USER_LINK_TITLE', $this->topic->getLastPostAuthor()->getName()), '', '', KunenaTemplate::getInstance()->tooltips(), $category->id, $config->avatarEdit); ?>
      </div>
    <?php endif; ?>
    <div class="kpost-info">
      <span class="last-post-link"><?php echo $this->getTopicLink($this->topic, 'last', Text::_('COM_KUNENA_GEN_LAST_POST'), null, KunenaTemplate::getInstance()->tooltips(), $category, false, true); ?>
        <?php echo ' ' . Text::_('COM_KUNENA_BY') . ' ' . $this->topic->getLastPostAuthor()->getLink(null, Text::sprintf('COM_KUNENA_VIEW_USER_LINK_TITLE', $this->topic->getLastPostAuthor()->getName()), '', '', KunenaTemplate::getInstance()->tooltips(), $category->id); ?>
      </span>
      <span class="date-post"><?php echo $topic->getLastPostTime()->toKunena('config_postDateFormat'); ?></span>
    </div>
  </div>

  <?php if (!empty($this->checkbox)) : ?>
  <div class="kcol kcol-checkbox">
    <label>
      <input class="kcheck" type="checkbox" name="topics[<?php echo $topic->displayField('id'); ?>]" value="1" />
    </label>
  </div>
  <?php endif; ?>
  </div>