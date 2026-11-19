<?php

/**
 * Kunena Component
 *
 * @package         Kunena.Template.KInfinite
 * @subpackage      Layout.User
 *
 * @copyright       Copyright (C) 2008 - 2023 Kunena Team. All rights reserved.
 * @license         https://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link            https://www.kunena.org
 **/

namespace Kunena\Forum\Site;

\defined('_JEXEC') or die();

use Joomla\CMS\Language\Text;
use Kunena\Forum\Libraries\Date\KunenaDate;
use Kunena\Forum\Libraries\Icons\KunenaIcons;
use Kunena\Forum\Libraries\Template\KunenaTemplate;

if ($this->config->showUserStats) {
  $rankImage = $this->profile->getRank(0, 'image');
  $rankTitle = $this->profile->getRank(0, 'title');
}
?>

<div class="kuser-profile-wrap">
  <div class="kuser-profile-inner">

  <div class="kuser-profile-left">
    <div class="kuser-avatar kwho-<?php echo $this->profile->getType(0, true); ?>">
      <?php echo $this->profile->getLink($this->avatar, Text::sprintf('COM_KUNENA_VIEW_USER_LINK_TITLE', $this->profile->getName()), '', '', KunenaTemplate::getInstance()->tooltips(), null, $this->config->avatarEdit); ?>

      <?php if ($this->config->userStatus) : ?>
        <span class="kuser-status"><?php echo $this->subLayout('User/Item/Status')->set('user', $this->profile); ?></span>
      <?php endif; ?>
    </div>

    <div class="kuser-links">
      <?php if ($this->private) : ?>
        <?php echo $this->private->showNewIcon($this->profile->userid, 'kbtn kbtn-primary btn-sm', 'glyphicon glyphicon-comment'); ?>
      <?php endif; ?>
      <?php if ($this->candisplaymail) : ?>
        <a class="kbtn kbtn-sm" href="mailto:<?php echo $this->escape($this->profile->email); ?>" rel="nofollow"><?php echo KunenaIcons::email(); ?></a>
      <?php endif; ?>
      <?php if (!empty($this->profile->getWebsiteName()) && !empty($this->profile->getWebsiteURL())) : ?>
        <a class="kbtn kbtn-sm" rel="nofollow noopener noreferrer" target="_blank" href="<?php echo htmlspecialchars($this->profile->getWebsiteURL(), ENT_COMPAT, 'UTF-8')  ?>"><?php echo KunenaIcons::globe(); ?></a>
      <?php elseif (empty($this->profile->getWebsiteName()) && !empty($this->profile->getWebsiteURL())) : ?>
        <a class="kbtn btn-sm" rel="nofollow noopener noreferrer" target="_blank" href="<?php echo htmlspecialchars($this->profile->getWebsiteURL(), ENT_COMPAT, 'UTF-8')  ?>"><?php echo KunenaIcons::globe(); ?></a>
      <?php elseif (!empty($this->profile->getWebsiteName()) && empty($this->profile->getWebsiteURL())) : ?>
        <button class="kbtn btn-sm"><?php echo KunenaIcons::globe(); ?></button>
      <?php endif; ?>
    </div>

    <div class="kuser-intro">
      <?php if ($this->profile->getPersonalText()) : ?>
        <h4><span><?php echo Text::_('COM_KUNENA_MYPROFILE_ABOUTME'); ?></span></h4>
        <p><?php echo $this->profile->getPersonalText(); ?></p>
      <?php endif; ?>
    </div>
  </div> <!-- End: User profile left -->

  <div class="kuser-profile-right">

    <ul class="kuser-info">
      <li>
        <strong><?php echo Text::_('COM_KUNENA_USERTYPE'); ?>:</strong>
        <span class="<?php echo $this->profile->getType(0, true); ?>"><?php echo Text::_($this->profile->getType()); ?></span>
      </li>
      <?php if ($this->banInfo && $this->banInfo->reason_public) : ?>
        <li>
          <strong><?php echo Text::_('COM_KUNENA_MYPROFILE_BANINFO'); ?>:</strong>
          <span><?php echo $this->escape($this->banInfo->reason_public); ?></span>
        </li>        
      <?php endif ?>

      <?php if ($this->config->showUserStats && $this->config->showRanking) : ?>
        <li>
          <strong><?php echo Text::_('COM_KUNENA_MYPROFILE_RANK'); ?>:</strong>
          <span>
            <?php echo $this->escape($rankTitle); ?>
            <?php echo $rankImage; ?>
          </span>
        </li>
      <?php endif; ?>

      <?php if ($this->config->userlistJoinDate || $this->me->isModerator()) : ?>
        <li>
          <strong><?php echo Text::_('COM_KUNENA_MYPROFILE_REGISTERDATE'); ?>:</strong>
          <span data-bs-toggle="tooltip" title="<?php echo $this->profile->getRegisterDate()->toKunena('ago'); ?>"><?php echo $this->profile->getRegisterDate()->toKunena('date_today', 'utc'); ?></span>
        </li>
      <?php endif; ?>

      <?php if ($this->config->userlistLastVisitDate || $this->me->isModerator()) : ?>
        <li>
          <strong><?php echo Text::_('COM_KUNENA_MYPROFILE_LASTLOGIN'); ?>:</strong>
          <span data-bs-toggle="tooltip" title="<?php echo $this->profile->getLastVisitDate()->toKunena('ago'); ?>"><?php echo $this->profile->getLastVisitDate()->toKunena('config_postDateFormat'); ?></span>
        </li>
      <?php endif; ?>

      <li>
        <strong><?php echo Text::_('COM_KUNENA_MYPROFILE_TIMEZONE'); ?>:</strong>
        <span> UTC <?php echo $this->profile->getTime()->toTimezone(); ?></span>
      </li>
      <li>
        <strong><?php echo Text::_('COM_KUNENA_MYPROFILE_LOCAL_TIME'); ?>:</strong>
        <span><?php echo $this->profile->getTime()->toKunena('time'); ?></span>
      </li>

      <?php if (!empty($this->profile->posts)) : ?>
        <li>
          <strong><?php echo Text::_('COM_KUNENA_POSTS'); ?></strong>
          <span><?php echo Text::sprintf((int) $this->profile->posts); ?></span>
        </li>
      <?php endif; ?>

      <?php if ($this->config->showUserStats && !empty($this->profile->karma) && $this->config->showKarma) : ?>
        <li>
          <strong><?php echo Text::_('COM_KUNENA_KARMA'); ?>:</strong>
          <span><?php echo Text::sprintf((int) $this->profile->karma); ?></span>
        </li>
      <?php endif; ?>

      <?php if (!empty($this->profile->uhits)) : ?>
        <li>
          <strong><?php echo Text::_('COM_KUNENA_PROFILE_VIEWS'); ?>:</strong>
          <span><?php echo Text::sprintf((int) $this->profile->uhits); ?></span>
        </li>
      <?php endif; ?>

      <?php if (!empty($this->profile->thankyou) && $this->config->showThankYou) : ?>
        <li>
          <strong><?php echo Text::_('COM_KUNENA_THANK_YOU_RECEIVED'); ?>:</strong>
          <span><?php echo Text::sprintf((int) $this->profile->thankyou); ?></span>
        </li>
      <?php endif; ?>

      <?php if (!empty($this->points)) : ?>
        <li>
          <strong><?php echo Text::_('COM_KUNENA_AUP_POINTS'); ?></strong>
          <span><?php echo $this->points; ?></span>
        </li>
      <?php endif; ?>

      <?php if (!empty($this->profile->location)) : ?>
        <li>
          <strong><?php echo Text::_('COM_KUNENA_MYPROFILE_LOCATION') ?>:</strong>
          <span>
            <?php if ($this->profile->location) : ?>
              <a href="https://maps.google.com?q=<?php echo $this->escape($this->profile->location); ?>" target="_blank" rel="nofollow noopener noreferrer"><?php echo $this->escape($this->profile->location); ?></a>
            <?php else :
            ?>
              <?php echo Text::_('COM_KUNENA_LOCATION_UNKNOWN'); ?>
            <?php endif; ?>
          </span>
        </li>
      <?php endif; ?>

      <?php if ($this->profile->getGender()) : ?>
        <li>
          <strong><?php echo Text::_('COM_KUNENA_MYPROFILE_GENDER'); ?>:</strong>
          <span><?php echo $this->profile->getGender(); ?></span>
        </li>
      <?php endif; ?>

      <?php if ($this->profile->birthdate) : ?>
        <li>
          <strong><?php echo Text::_('COM_KUNENA_MYPROFILE_BIRTHDATE'); ?>:</strong>
          <span><?php echo KunenaDate::getInstance($this->profile->birthdate)->toSpan('date', 'ago', 'utc'); ?></span>
        </li>
      <?php endif; ?>

      <?php if (!empty($this->medals)) : ?>
        <li>
          <strong><?php echo Text::_('COM_KUNENA_AUP_MEDALS'); ?> </strong>
          <span><?php echo implode(' ', $this->medals); ?></span>
        </li>
      <?php endif; ?>
    </ul>

    <div class="kuser-socials">
      <?php echo $this->subLayout('User/Item/Socials')->set('socials', $this->socials); ?>
    </div>

    <div class="kuser-signature">
      <?php if ($this->profile->getSignature()) : ?>
        <?php echo $this->profile->getSignature(); ?>
      <?php endif; ?>
    </div>

  </div> <!-- End: User profile right -->

  </div>
</div>