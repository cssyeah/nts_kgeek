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

require_once dirname(__DIR__, 3) . '/helpers/avatar.php';

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
$avatar          = \beeKunenaAvatarImage($author, $this->ktemplate->params->get('avatarType'), 'thumb');
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

<?php
// Avatar of the user who started the topic (or the first letter of the username),
// with the topic icon (Kunena topic icon set of the category) in a <span> inside it.
$firstAuthor     = $topic->getFirstPostAuthor();
$firstAuthorName = $firstAuthor->username ?: $firstAuthor->getName($topic->first_post_guest_name, false);
// Font Awesome icon name without "fa-" (heart, check, lock, ...) as a class, e.g. "ktopic-icon heart",
// read before getIcon() because Kunena overwrites $topic->icon_id there.
$topicIconName   = \beeKunenaTopicIconName($topic);
$topicIconClass  = 'ktopic-icon' . ($topicIconName !== '' ? ' ' . $topicIconName : '');
$topicIcon       = \beeKunenaAvatarOrInitial($firstAuthor, (string) $firstAuthorName)
  . '<span class="' . $topicIconClass . '">' . $topic->getIcon($category->iconset) . '</span>';

// Everyone who posted in the topic (author first, then repliers).
$participantsMax   = 5;
$participantsData  = \beeKunenaTopicParticipants($topic, $participantsMax);
$participants      = $participantsData['users'];
$participantsMore  = $participantsData['total'] - \count($participants);
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

        <?php if ($topic->locked != 0) : ?>
          <span class="badge bg-warning">
            <span data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_LOCKED'); ?>"><?php echo KunenaIcons::lock(); ?></span>
          </span>
        <?php endif; ?>
      </div>
    </div>

    <div class="kpost-info">
      <span class="last-post-link">
        <i class="fa-solid fa-reply"></i>
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

  <div class="kcol kcol-users">
    <?php if ($participants) : ?>
      <ul class="ktopic-users">
        <?php foreach ($participants as $participant) : ?>
          <?php $participantName = (string) ($participant->username ?: $participant->getName('', false)); ?>
          <li class="ktopic-user<?php echo (int) $participant->userid === (int) $topic->first_post_userid ? ' is-author' : ''; ?>">
            <a href="<?php echo $participant->getURL(); ?>" title="<?php echo $this->escape($participantName); ?>" data-bs-toggle="tooltip">
              <?php echo \beeKunenaAvatarOrInitial($participant, $participantName); ?>
            </a>
          </li>
        <?php endforeach; ?>

        <?php if ($participantsMore > 0) : ?>
          <li class="ktopic-user ktopic-user-more">
            <span class="kuser-avatar-icon kuser-avatar-initial">+<?php echo (int) $participantsMore; ?></span>
          </li>
        <?php endif; ?>
      </ul>
    <?php endif; ?>
  </div>

  <div class="kcol kcol-topic-info">
    <div class="ktopic-category">
      <i class="fa-solid fa-folder" aria-hidden="true"></i>
      <?php echo $this->getCategoryLink($this->topic->getCategory(), null, $this->topic->getCategory()->description, KunenaTemplate::getInstance()->tooltips()) ?>
    </div>

    <div class="ktopic-stats">
      <span class="kstats-label"><i class="fa-solid fa-comments"></i></span>
      <span class="kstats-value"><?php echo $this->formatLargeNumber($topic->getReplies()); ?></span>      
    </div>

    <div class="ktopic-stats">
      <span class="kstats-label"><i class="fa-solid fa-eye"></i></span>
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