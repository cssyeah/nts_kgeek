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

defined('_JEXEC') or die();

use Joomla\CMS\Language\Text;
use Kunena\Forum\Libraries\Date\KunenaDate;
use Kunena\Forum\Libraries\Forum\Message\KunenaMessage;
use Kunena\Forum\Libraries\Icons\KunenaIcons;
use Kunena\Forum\Libraries\Layout\KunenaLayout;
use Kunena\Forum\Libraries\Template\KunenaTemplate;

$message              = $this->message;
$isReply              = $this->message->id != $this->topic->first_post_id;
$signature            = $this->profile->getSignature();
$attachments          = $message->getAttachments();
$attachs              = $message->getNbAttachments();
$subjectlengthmessage = $this->ktemplate->params->get('SubjectLengthMessage', 20);

$list = [];
?>

<div class="kmsg-wrap">
  <div class="kmsg-header">
    <?php
    $title   = KunenaMessage::getInstance()->getsubstr($this->escape($message->subject), 0, $subjectlengthmessage);
    $langstr = $isReply ? 'TPL_KUNENA_MESSAGE_REPLIED_NEW' : 'TPL_KUNENA_MESSAGE_CREATED';
    // echo Text::sprintf($langstr, $message->getAuthor()->getLink(), $this->getTopicLink($this->message->getTopic(), $this->message, $this->message->displayField('subject'), null, KunenaTemplate::getInstance()->tooltips() . ' ktopic-title'));
    ?>
    <div class="kmsg-title">
      <h4>
        <span><?php echo Text::sprintf($langstr, $message->getAuthor()->getLink(), ''); ?></span>
        <?php echo $this->message->displayField('subject'); ?>
      </h4>

      <span class="kmsg-time">
        <?php echo KunenaIcons::clock(); ?>
        <?php echo $message->getTime()->toSpan('config_postDateFormat', 'config_postDateFormatHover'); ?>
        <?php if ($message->modified_time) : ?> - <?php echo KunenaIcons::edit() . ' ' . $message->getModifiedTime()->toSpan('config_postDateFormat', 'config_postDateFormatHover');
                                                endif; ?>
      </span>
    </div>

    <a href="#<?php echo $this->message->id; ?>" id="<?php echo $this->message->id; ?>" class="kmsg-id" rel="canonical">#<?php echo $this->numLink; ?></a>
  </div>

  <div class="kmsg-body">

    <?php if ($this->pmHasBody && $this->config->privateMessage) : ?>
      <div class="kpost-pm">
        <div class="kmsgtext-hide">
          <?php foreach ($this->message->pm as $pm) {
            echo $pm->displayField('body');
          } ?>
        </div>
      </div>
    <?php endif ?>

    <?php if (!$this->me->userid && !$isReply) :
      echo $message->displayField('message');
    else :
      echo (!$this->me->userid && $this->config->teaser) ? Text::_('COM_KUNENA_TEASER_TEXT') : $this->message->displayField('message');
    endif; ?>
  </div>

  <!-- User signature -->
  <?php if ($signature) : ?>
    <div class="ksig">
      <span class="ksignature"><?php echo $signature; ?></span>
    </div>
  <?php endif ?>
  <!-- // User signature -->

  <!-- Message footer -->
  <div class="kmsg-footer">

    <?php if ($this->ipLink && !empty($this->message->ip)) : ?>
      <span class="ip">
        <?php echo $this->ipLink; ?>
      </span>
    <?php endif; ?>

    <?php if ($this->config->reportMsg && $this->me->exists()) : ?>
      <div class="report">
        <?php echo KunenaLayout::factory('Widget/Button')
          ->setProperties([
            'url'   => '#report' . $message->id . '',
            'name' => 'report',
            'scope' => 'message',
            'type'  => 'user',
            'id' => 'btn_report',
            'normal' => '',
            'icon' => KunenaIcons::reportname(),
            'modal' => 'modal',
            'pullright' => 'pullright',
          ]); ?>
      </div>

      <?php if ($this->me->isModerator($this->topic->getCategory()) || $this->config->userReport || !$this->config->userReport && $this->me->userid != $this->message->userid) : ?>
        <div id="report<?php echo $this->message->id; ?>" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="false" style="display: none;">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="reportModalLabel">
                  <?php echo Text::_('COM_KUNENA_REPORT_TO_MODERATOR'); ?>
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <?php echo $this->subRequest('Topic/Report')->set('id', $this->topic->id); ?>
              </div>
            </div>
          </div>
        </div>
      <?php endif; ?>
    <?php endif; ?>
  </div>
  <!-- // Message footer -->
</div>

<?php if (!empty($attachments)) :
  if (!$this->me->exists() && ($this->config->showImgForGuest || $this->config->showFileForGuest) || $this->me->exists() && $attachs->inline != count($attachments)) : ?>
    <div class="kattachment-wrapper">
      <?php if ($this->canSeeAttachments($attachments, $attachs, $this->topic)) : ?>
        <h4><?php echo Text::_('COM_KUNENA_ATTACHMENTS'); ?></h4>
        <div class="kattachments">
        <?php endif; ?>
        <ul class="kattach-list">
          <?php foreach ($attachments as $attachment) :
            if (!$attachment->protected) : ?>
              <?php if ($attachment->isAudio()) :
                echo $attachment->getLayout()->render('audio'); ?>
              <?php elseif ($attachment->isVideo()) :
                echo $attachment->getLayout()->render('video'); ?>
              <?php elseif (!$attachment->inline) : ?>
                <li>
                  <?php echo $attachment->getLayout()->render('thumbnail'); ?>
                  <?php echo $attachment->getLayout()->render('textlink'); ?>
                </li>
              <?php endif; ?>
            <?php elseif ($attachment->isAuthorised('private')): ?>
              <?php if ($attachment->isAudio()) :
                echo $attachment->getLayout()->render('audio'); ?>
              <?php elseif ($attachment->isVideo()) :
                echo $attachment->getLayout()->render('video'); ?>
              <?php elseif (!$attachment->inline) : ?>
                <li>
                  <?php echo $attachment->getLayout()->render('thumbnail'); ?>
                  <?php echo $attachment->getLayout()->render('textlink'); ?>
                </li>
              <?php endif; ?>
            <?php elseif ($attachment->protected < 32 && !$attachment->inline) : ?>
              <li>
                <?php echo $attachment->getLayout()->render('thumbnail'); ?>
                <?php echo $attachment->getLayout()->render('textlink'); ?>
              </li>
          <?php endif;
          endforeach; ?>
        </ul>
        <?php if ($this->canSeeAttachments($attachments, $attachs, $this->topic)) : ?>
        </div>
      <?php endif; ?>
    </div>
  <?php endif; ?>
<?php endif; ?>

<?php if ($message->modified_by && $this->config->editMarkup) :
  $dateshown = $datehover = '';

  if ($message->modified_time) {
    $datehover = 'data-bs-toggle="tooltip" title="' . KunenaDate::getInstance($message->modified_time)->toKunena('config_postDateFormatHover') . '"';
    $dateshown = KunenaDate::getInstance($message->modified_time)->toKunena('config_postDateFormat') . ' ';
  }
?>
  <div class="alert alert-info d-none d-sm-block" <?php echo $datehover ?>>
    <?php echo Text::sprintf('COM_KUNENA_EDITING_LASTEDIT_ON_BY', $dateshown, $message->getModifier()->getLink(null, null, '', '', null, $this->category->id)); ?>
    <?php if ($message->modified_reason) {
      echo Text::_('COM_KUNENA_REASON') . ': ' . $this->escape($message->modified_reason);
    } ?>
  </div>
<?php endif; ?>

<?php if (!empty($this->thankyou)) : ?>
  <div class="kmessage-thankyou">
    <?php
    foreach ($this->thankyou as $userid => $thank) {
      if (!empty($this->thankyou_delete[$userid])) {
        $list[] = $thank . ' <a data-bs-toggle="tooltip" title="' . Text::_('COM_KUNENA_BUTTON_THANKYOU_REMOVE_LONG') . '" href="'
          . $this->thankyou_delete[$userid] . '">' . KunenaIcons::cancel() . '</a>';
      } else {
        $list[] = $thank;
      }
    }

    echo KunenaIcons::thumbsup() . Text::_('COM_KUNENA_THANKYOU') . ': ' . implode(', ', $list) . ' ';
    if ($this->more_thankyou) {
      echo Text::sprintf('COM_KUNENA_THANKYOU_MORE_USERS', $this->more_thankyou);
    }
    ?>
  </div>
<?php endif; ?>