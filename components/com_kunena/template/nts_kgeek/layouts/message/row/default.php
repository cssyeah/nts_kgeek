<?php

/**
 * Kunena Component
 *
 * @package         Kunena.Template.KInfinite
 * @subpackage      Layout.Message
 *
 * @copyright       Copyright (C) 2008 - 2023 Kunena Team. All rights reserved.
 * @license         https://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link            https://www.kunena.org
 **/

namespace Kunena\Forum\Site;

\defined('_JEXEC') or die();

use Joomla\CMS\Language\Text;
use Kunena\Forum\Libraries\Config\KunenaConfig;
use Kunena\Forum\Libraries\Factory\KunenaFactory;
use Kunena\Forum\Libraries\Icons\KunenaIcons;
use Kunena\Forum\Libraries\Template\KunenaTemplate;

$this->addStyleSheet('rating.css');

$message         = $this->message;
$author          = $message->getAuthor();
$topic           = $message->getTopic();
$userTopic       = $topic->getUserTopic();
$category        = $message->getCategory();
$this->ktemplate = KunenaFactory::getTemplate();
$config          = KunenaFactory::getConfig();
$avatar          = $config->avatarOnCategory ? $topic->getLastPostAuthor()->getAvatarImage(KunenaFactory::getTemplate()->params->get('avatarType'), 'thumb') : null;
$cols            = empty($this->checkbox) ? 5 : 6;
$txt             = $topic->getActions();
$topicPages      = $topic->getPagination(null, KunenaConfig::getInstance()->messagesPerPage, 3);

?>
<div class="krow category<?php echo $this->escape($category->class_sfx) . $txt; ?>">
  <?php if ($topic->unread) : ?>
    <div class="kcol kcol-icon topic-item-unread">
      <?php echo $this->getTopicLink($topic, 'unread', $topic->getIcon($topic->getCategory()->iconset), '', null, $category, true, true); ?>
    </div>
  <?php else : ?>
    <div class="kcol kcol-icon">
      <?php echo $this->getTopicLink($topic, $this->message, $topic->getIcon($topic->getCategory()->iconset), '', null, $category, true, false); ?>
    </div>
  <?php endif; ?>
  <div class="kcol kcol-subject kcol-auto">
    <div class="ktopic-title-wrap">
      <h3>
      <?php
      if ($this->ktemplate->params->get('labels') != 0) {
        echo $this->subLayout('Widget/Label')->set('topic', $topic)->setLayout('default');
      }

      if ($topic->unread) {
        echo $this->getTopicLink(
          $topic,
          'unread',
          $this->escape($topic->subject) .
            '<sup class="knewchar" dir="ltr">(' . (int) $topic->unread . ' ' . Text::_('COM_KUNENA_A_GEN_NEWCHAR') . ')</sup>',
          null,
          KunenaTemplate::getInstance()->tooltips() . ' topictitle',
          $category,
          true,
          true
        );
      } else {
        echo $this->getTopicLink($topic, $this->message, null, null, KunenaTemplate::getInstance()->tooltips() . ' topictitle', $category, true, false);
      }

      echo $this->subLayout('Widget/Rating')->set('config', $config)->set('category', $category)->set('topic', $topic)->setLayout('default'); ?>
      </h3>
      <div class="ktopic-badge">
        <?php if ($userTopic->favorite) :
        ?>
          <span class="badge-favorite" <?php echo KunenaTemplate::getInstance()->tooltips(true); ?> data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_FAVORITE'); ?>"><?php echo KunenaIcons::star(); ?></span>
        <?php endif; ?>

        <?php if ($userTopic->posts) :
        ?>
          <span class="badge-myposts" <?php echo KunenaTemplate::getInstance()->tooltips(true); ?> data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_MYPOSTS'); ?>"><?php echo KunenaIcons::flag(); ?></span>
        <?php endif; ?>

        <?php if ($topic->attachments) :
        ?>
          <span class="badge-attach" <?php echo KunenaTemplate::getInstance()->tooltips(true); ?> data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_ATTACH'); ?>"><?php echo KunenaIcons::attach(); ?></span>
        <?php endif; ?>

        <?php if ($topic->poll_id && $category->allowPolls) :
        ?>
          <span class="badge-poll" <?php echo KunenaTemplate::getInstance()->tooltips(true); ?> data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_ADMIN_POLLS'); ?>"><?php echo KunenaIcons::poll(); ?></span>
        <?php endif; ?>
      </div>
    </div>

    <div class="ktopic-meta">
      <span class="ktopic-category"> <?php echo Text::sprintf('COM_KUNENA_CATEGORY_X', $this->getCategoryLink($topic->getCategory(), null, $topic->getCategory()->description, KunenaTemplate::getInstance()->tooltips())) ?></span>
      <br />
      <?php echo Text::_('COM_KUNENA_TOPIC_STARTED_ON') ?>
      <?php if ($config->postDateFormat != 'none') :
      ?>
        <?php echo $topic->getFirstPostTime()->toKunena('config_postDateFormat'); ?>,
      <?php endif; ?>
      <?php echo Text::_('COM_KUNENA_BY') ?>
      <?php echo $topic->getAuthor()->getLink(null, Text::sprintf('COM_KUNENA_VIEW_USER_LINK_TITLE', $topic->getFirstPostAuthor()->getName()), '', '', KunenaTemplate::getInstance()->tooltips(), $category->id); ?>
      <div class="float-end">
        <?php /** TODO: New Feature - LABELS
         * <span class="badge bg-info">
         * <?php echo Text::_('COM_KUNENA_TOPIC_ROW_TABLE_LABEL_QUESTION'); ?>
         * </span>    */ ?>
        <?php if ($topic->locked != 0) :
        ?>
          <span class="badge bg-warning">
            <span data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_LOCKED'); ?>"><?php echo KunenaIcons::lock(); ?></span>
          </span>
        <?php endif; ?>
      </div>
    </div>

    <div class="kpagination-small">
      <?php echo $this->subLayout('Widget/Pagination/List')->set('pagination', $topicPages)->setLayout('simple'); ?>
    </div>
  </div>

  <div class="kcol kcol-stats">
    <span class="kstats-value"><?php echo $this->formatLargeNumber($topic->getReplies()); ?></span>
    <span class="kstats-label"><?php echo Text::_('COM_KUNENA_GEN_REPLIES'); ?></span>
  </div>

  <div class="kcol kcol-stats">
    <span class="kstats-value"><?php echo $this->formatLargeNumber($topic->hits); ?></span>
    <span class="kstats-label"><?php echo Text::_('COM_KUNENA_GEN_HITS'); ?></span>
  </div>

  <div class="kcol kcol-latest-post">
    <?php if ($config->avatarOnCategory) : ?>
      <div class="kuser-avatar">
        <?php echo $author->getLink($avatar, Text::sprintf('COM_KUNENA_VIEW_USER_LINK_TITLE', $topic->getLastPostAuthor()->getName()), '', '', KunenaTemplate::getInstance()->tooltips(), $category->id, $config->avatarEdit); ?>
      </div>
    <?php endif; ?>

    <div class="kpost-info">
      <span class="last-post-link"><?php echo $this->getTopicLink($topic, 'last', Text::_('COM_KUNENA_GEN_LAST_POST'), null, KunenaTemplate::getInstance()->tooltips(), $category, false, true); ?>
        <?php echo ' ' . Text::_('COM_KUNENA_BY') . ' ' . $topic->getLastPostAuthor()->getLink(null, Text::sprintf('COM_KUNENA_VIEW_USER_LINK_TITLE', $topic->getLastPostAuthor()->getName()), '', '', KunenaTemplate::getInstance()->tooltips(), $category->id); ?>
      </span>
      <span class="date-post"><?php echo $topic->getLastPostTime()->toKunena('config_postDateFormat'); ?></span>
    </div>
  </div>

  <?php if (!empty($this->checkbox)) : ?>
    <div class="kcol kcol-checkbox">
      <label>
        <input class="kcheck" type="checkbox" name="posts[<?php echo $message->id; ?>]" value="1" />
      </label>
    </div>
  <?php endif; ?>

  <?php
  if (!empty($this->position)) {
    echo $this->subLayout('Widget/Module')
      ->set('position', $this->position)
      ->set('cols', $cols)
      ->setLayout('table_row');
  }
  ?>
</div>