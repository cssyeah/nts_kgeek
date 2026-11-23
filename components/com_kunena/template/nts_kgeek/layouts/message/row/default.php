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

$author          = $topic->getLastPostAuthor();
$this->ktemplate = KunenaFactory::getTemplate();
$avatar          = \ntsKunenaAvatarImage($author, $this->ktemplate->params->get('avatarType'), 'thumb');
?>
<?php
// Avatar of the user who started the topic (or the first letter of the username),
// with the topic icon (Kunena topic icon set of the category) in a <span> inside it.
$firstAuthor     = $topic->getFirstPostAuthor();
$firstAuthorName = $firstAuthor->username ?: $firstAuthor->getName($topic->first_post_guest_name, false);
// Font Awesome icon name without "fa-" (heart, check, lock, ...) as a class, e.g. "ktopic-icon heart",
// read before getIcon() because Kunena overwrites $topic->icon_id there.
$topicIconName   = \ntsKunenaTopicIconName($topic);
$topicIconClass  = 'ktopic-icon' . ($topicIconName !== '' ? ' ' . $topicIconName : '');
$topicIcon       = \ntsKunenaAvatarOrInitial($firstAuthor, (string) $firstAuthorName)
  . '<span class="' . $topicIconClass . '">' . $topic->getIcon($category->iconset) . '</span>';

// Everyone who posted in the topic (author first, then repliers).
$participantsMax   = 5;
$participantsData  = \ntsKunenaTopicParticipants($topic, $participantsMax);
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

    <div class="kpost-info">
      <span class="last-post-link">
        <i class="fa-solid fa-reply"></i>
        <strong><?php echo $author->getLink(null, Text::sprintf('COM_KUNENA_VIEW_USER_LINK_TITLE', $author->getName()), '', '', KunenaTemplate::getInstance()->tooltips(), $category->id); ?> - </strong>
      </span>
      <span class="date-post">
        Replied
        <?php echo $topic->getLastPostTime()->toKunena('config_postDateFormat'); ?>
      </span>
    </div>

    <div class="kpagination-small">
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
              <?php echo \ntsKunenaAvatarOrInitial($participant, $participantName); ?>
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
      <?php echo $this->getCategoryLink($category, null, $category->description, KunenaTemplate::getInstance()->tooltips()) ?>
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