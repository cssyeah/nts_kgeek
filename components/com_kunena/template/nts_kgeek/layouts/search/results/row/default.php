<?php

/**
 * Kunena Component
 *
 * @package         Kunena.Template.Aurelia
 * @subpackage      Layout.Search
 *
 * @copyright       Copyright (C) 2008 - 2023 Kunena Team. All rights reserved.
 * @license         https://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link            https://www.kunena.org
 **/

defined('_JEXEC') or die();

use Joomla\CMS\Language\Text;
use Kunena\Forum\Libraries\Forum\Message\KunenaMessage;
use Kunena\Forum\Libraries\Icons\KunenaIcons;
use Kunena\Forum\Libraries\User\KunenaUserHelper;

$message              = $this->message;
$topic                = $message->getTopic();
$category             = $topic->getCategory();
$author               = $message->getAuthor();
$isReply              = $message->id != $topic->first_post_id;
$me                   = isset($this->me) ? $this->me : KunenaUserHelper::getMyself();
$subjectlengthmessage = $this->ktemplate->params->get('SubjectLengthMessage', 20);

?>
<div class="ksearch-result-item <?php if ($message->getAuthor()->isModerator()) : ?> badger-moderator <?php endif; ?> message-<?php echo $message->getState(); ?>">

  <div class="kitem-header">
    <h3><?php
      $title   = KunenaMessage::getInstance()->getsubstr($this->escape($message->subject), 0, $subjectlengthmessage);
      $langstr = $isReply ? 'COM_KUNENA_MESSAGE_REPLIED_NEW' : 'COM_KUNENA_MESSAGE_CREATED_NEW';
      echo Text::sprintf($langstr, $message->getAuthor()->getLink(), $this->getTopicLink($topic, $message, null, null, $this->ktemplate->tooltips() . ' topictitle', $category, true, false)); ?>
      </h3>
      <?php echo $message->getTime()->toSpan(); ?>
      <?php if ($message->modified_time) : ?> - <?php echo KunenaIcons::edit() . ' ' . $message->getModifiedTime()->toSpan(); ?>
      <?php endif; ?>
  </div>

  <div class="ksearch-result-body">
    <div class="kmsg-profile">
      <span class="kuser-avatar"><?php echo $author->getLink($author->getAvatarImage($this->ktemplate->params->get('avatarType'), 'post')); ?></span>
      <span class="kuser-name"><?php echo $author->getLink(null, null, 'nofollow', '', null, $topic->getCategory()->id); ?></span>
    </div>

    <div class="kmsg-body">
    <?php if (!$isReply) :
        echo $message->displayField('message');
      else :
        echo (!$me->userid && $this->config->teaser) ? Text::_('COM_KUNENA_TEASER_TEXT') : $this->message->displayField('message');
      endif; ?>
    </div>
  </div>

</div>