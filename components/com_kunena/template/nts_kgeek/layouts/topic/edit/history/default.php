<?php

/**
 * Kunena Component
 *
 * @package         Kunena.Template
 * @subpackage      Topic
 *
 * @copyright       Copyright (C) 2008 - 2023 Kunena Team. All rights reserved.
 * @license         https://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link            https://www.kunena.org
 **/

namespace Kunena\Forum\Site;

\defined('_JEXEC') or die();

use Joomla\CMS\Language\Text;
use Kunena\Forum\Libraries\Factory\KunenaFactory;
use Kunena\Forum\Libraries\Html\KunenaParser;
use Kunena\Forum\Libraries\Icons\KunenaIcons;
?>

<h3 class="khistory-subject">
  <?php echo Text::_('COM_KUNENA_POST_TOPIC_HISTORY') ?>:
  <?php echo $this->escape($this->topic->subject) ?>
</h3>

<div id="history">
  <p class="knote-msg">
    <?php echo Text::_('COM_KUNENA_POST_TOPIC_HISTORY_MAX') . ' ' . $this->escape($this->config->historyLimit) . ' ' . Text::_('COM_KUNENA_POST_TOPIC_HISTORY_LAST') ?>
  </p>
  <?php foreach ($this->history as $this->message) : ?>
    <div class="khistory-item">
      <div class="user-info">
        <div class="user-avatar">
          <?php
            $profile    = KunenaFactory::getUser(\intval($this->message->userid));
            $useravatar = $profile->getAvatarImage(KunenaFactory::getTemplate()->params->get('avatarType'), 'profile');

            if ($useravatar) :
              echo $this->message->getAuthor()->getLink($useravatar, null, '', '', null, $this->topic->getcategory()->id);
            endif;
          ?>
        </div>
        <div class="khistory-profile-box">
          <strong><?php echo $this->message->getAuthor()->getLink(null, null, '', '', null, $this->topic->getcategory()->id) ?></strong>
          <span class="khistory-post-date"><?php echo KunenaIcons::clock(); ?><?php echo $this->message->getTime()->toSpan('config_postDateFormat', 'config_postDateFormatHover'); ?></span>
        </div>
      </div>

      <div class="khistory-msg">
        <div class="khistory" data-badger="<?php echo $this->message->displayField('subject'); ?>">
          <div class="kmessage">
            <p class="kmsg"><?php echo KunenaParser::parseBBCode($this->message->message, $this) ?></p>
          </div>
          <?php
            $attachments = $this->message->getAttachments();
            $hasVisibleAttachments = false;
                    
            // Filter out private attachments
            $visibleAttachments = array_filter($attachments, function($attachment) {
                return $attachment->protected != 32; // Exclude private attachments
            });

            if (!empty($visibleAttachments)) :
              foreach ($visibleAttachments as $attachment) {
                if (!$attachment->inline) {
                  $hasVisibleAttachments = true;
                  break;
                }
              }
            endif;

            if ($hasVisibleAttachments) :
          ?>
            <div class="kattach">
              <ul>
              <?php foreach ($visibleAttachments as $attachment) :
                if (!$attachment->inline) : ?>
                  <li>
                    <?php echo $attachment->getLayout()->render('thumbnail'); ?>
                    <?php echo $attachment->getLayout()->render('textlink'); ?>
                  </li>
                  <?php endif;
                  endforeach; ?>
              </ul>
            </div>
          <?php endif; ?>
        </div>
      </div>
    </div>
  <?php endforeach; ?>
</div>