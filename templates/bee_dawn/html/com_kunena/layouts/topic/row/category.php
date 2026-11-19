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

namespace Kunena\Forum\Site;

\defined('_JEXEC') or die();

require_once dirname(__DIR__, 3) . '/helpers/avatar.php';

use Joomla\CMS\Language\Text;
use Kunena\Forum\Libraries\Config\KunenaConfig;
use Kunena\Forum\Libraries\Factory\KunenaFactory;
use Kunena\Forum\Libraries\Icons\KunenaIcons;
use Kunena\Forum\Libraries\Template\KunenaTemplate;

$topic           = $this->topic;
$category        = $topic->getCategory();
$userTopic       = $topic->getUserTopic();
$config          = KunenaConfig::getInstance();
$topicPages      = $topic->getPagination(null, $config->messagesPerPage, 3);
$author          = $topic->getLastPostAuthor();
$this->ktemplate = KunenaFactory::getTemplate();
$avatar          = \beeKunenaAvatarImage($author, $this->ktemplate->params->get('avatarType'), 'thumb');
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

// Display in grey topics which in unpublished category
if ($this->topic->getCategory()->published == 0) {
  $txt = '-grey';
  $category->class_sfx = '';
}

if (!empty($this->spacing)) : ?>
  <div class="krow kcontenttablespacer">
    <div class="kcol kcol-full">&nbsp;</div>
  </div>
<?php endif; ?>

<?php
// Avatar of the user who started the topic; fall back to the first letter of the username.
$firstAuthor     = $topic->getFirstPostAuthor();
$firstAuthorName = $firstAuthor->username ?: $firstAuthor->getName($topic->first_post_guest_name, false);

if (!empty($firstAuthor->avatar)) {
  $topicIcon = '<span class="kuser-avatar-icon"><img src="' . $this->escape(\beeKunenaAvatarUrl($firstAuthor) ?? $firstAuthor->getAvatarURL('thumb')) . '" alt="' . $this->escape($firstAuthorName) . '" loading="lazy" /></span>';
} else {
  $initial   = $firstAuthorName !== '' ? mb_strtoupper(mb_substr(trim($firstAuthorName), 0, 1, 'UTF-8'), 'UTF-8') : '?';
  $topicIcon = '<span class="kuser-avatar-icon kuser-avatar-initial" title="' . $this->escape($firstAuthorName) . '">' . $this->escape($initial) . '</span>';
}
?>

<div class="krow category<?php echo $this->escape($category->class_sfx) . $txt; ?>">
  <?php if ($topic->unread) : ?>
    <div class="kcol kcol-icon topic-item-unread">
      <?php echo $this->getTopicLink($topic, 'unread', $topicIcon, '', null, $category, true, true); ?>
    </div>
  <?php else : ?>
    <div class="kcol kcol-icon">
      <?php echo $this->getTopicLink($topic, null, $topicIcon, '', null, $category, true, false); ?>
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
        echo $this->getTopicLink($topic, 'unread', $this->escape($topic->subject) .
          '<sup class="knewchar" dir="ltr">(' . (int) $topic->unread . ' ' . Text::_('COM_KUNENA_A_GEN_NEWCHAR') . ')</sup>', null, KunenaTemplate::getInstance()->tooltips() . ' topictitle', $category, true, true);
      } else {
        echo $this->getTopicLink($topic, null, null, null, KunenaTemplate::getInstance()->tooltips() . ' topictitle', $category, true, false);
      }

      echo $this->subLayout('Widget/Rating')->set('config', $config)->set('category', $category)->set('topic', $this->topic)->setLayout('default'); ?>
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

    <div class="kpost-info">
      <span class="last-post-link">
        <i class="fa-duotone fa-thin fa-reply"></i>
        <strong><?php echo $this->topic->getLastPostAuthor()->getLink(null, Text::sprintf('COM_KUNENA_VIEW_USER_LINK_TITLE', $this->topic->getLastPostAuthor()->getName()), '', '', KunenaTemplate::getInstance()->tooltips(), $category->id); ?> - </strong>
      </span>
      <span class="date-post">
        Replied
        <?php echo $topic->getLastPostTime()->toKunena('config_postDateFormat'); ?>
      </span>
    </div>

    <div class="kpagination-wrap-sm">
      <?php echo $this->subLayout('Widget/Pagination/List')->set('pagination', $topicPages)->setLayout('simple'); ?>
    </div>
  </div>

  <div class="kcol kcol-topic-info">
    <div class="ktopic-category"><?php echo $this->getCategoryLink($this->topic->getCategory(), null, $this->topic->getCategory()->description, KunenaTemplate::getInstance()->tooltips()) ?></div>

    <div class="ktopic-stats">
      <span class="kstats-label"><i class="fa-duotone fa-thin fa-comments"></i></span>
      <span class="kstats-value"><?php echo $this->formatLargeNumber($topic->getReplies()); ?></span>      
    </div>

    <div class="ktopic-stats">
      <span class="kstats-label"><i class="fa-duotone fa-thin fa-eye"></i></span>
      <span class="kstats-value"><?php echo $this->formatLargeNumber($topic->hits); ?></span>
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