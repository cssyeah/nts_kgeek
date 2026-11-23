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

defined('_JEXEC') or die();

use Joomla\CMS\Language\Text;
use Kunena\Forum\Libraries\Factory\KunenaFactory;
use Kunena\Forum\Libraries\Icons\KunenaIcons;

$user            = $this->user;
$avatar          = $user->getAvatarImage($this->ktemplate->params->get('avatarType'), 'post');
$show            = $this->config->showUserStats;

$optional_username   = $this->ktemplate->params->get('optional_username');

$canseekarma = false;

if ($this->config->showKarma) {
  $canseekarma = $user->canSeeKarma();
}

$rankImage    = $user->getRank($this->category_id, 'image');
$rankTitle    = $user->getRank($this->category_id, 'title');
$personalText = $user->getPersonalText();
?>
<ul class="ktopic-author-wrap">
  <li class="kuser-avatar">
    <?php if ($avatar) : ?>
      <?php echo $user->getLink($avatar, null, '', '', null, 0, $this->config->avatarEdit); ?>
    <?php endif; ?>

    <?php if ($user->exists() && $this->config->userStatus) : ?>
      <span class="kuser-status">
        <?php echo $this->subLayout('User/Item/Status')->set('user', $user); ?>
      </span>
    <?php endif; ?>

    <div class="kprofile-full-info">
      <div class="kuser-info-head">
        <?php if ($avatar) : ?>
          <div class="kuser-avatar">
            <?php echo $user->getLink($avatar, null, '', '', null, 0, $this->config->avatarEdit); ?>
          </div>
        <?php endif; ?>

        <div class="kuser-meta">
          <div class="kuser-name">
            <?php echo $user->getLink(null, null, '', '', null, $this->category_id); ?>
          </div>
          <?php if ($optional_username) : ?>
            <div class="kusername-optional">[<?php echo $user->getLinkNoStyle('', '', 'kpost-username-optional') ?>]</div>
          <?php endif; ?>


          <?php if (!empty($rankImage)) : ?>
            <div class="kuser-rank-image">
              <?php echo $rankImage; ?>
            </div>
          <?php endif; ?>

          <?php if ($canseekarma && $this->config->showKarma) : ?>
            <div class="kuser-karma">
              <?php if ($user->karma > 0) :
                $karmanumber = $user->karma;
              else :
                $karmanumber = '';
              endif;

              echo Text::_('COM_KUNENA_KARMA') . ': ' . $karmanumber . $this->subLayout('Widget/Karma')->set('topicicontype', $this->ktemplate->params->get('topicicontype'))->set('userid', $user->userid)->set('karmatype', 'karmadown') . $this->subLayout('Widget/Karma')->set('topicicontype', $this->ktemplate->params->get('topicicontype'))->set('userid', $user->userid)->set('karmatype', 'karmaup'); ?>
            </div>
          <?php endif; ?>

          <?php if (!empty($personalText)) : ?>
            <div class="kpersonal-text">
              <?php echo $personalText; ?>
            </div>
          <?php endif; ?>

        </div>
      </div>

      <ul class="kuser-profile-badge">
        <?php if (isset($this->topic_starter) && $this->topic_starter) : ?>
          <li class="ktopic-starter"><?php echo Text::_('COM_KUNENA_TOPIC_AUTHOR') ?></li>
        <?php endif; ?>

        <?php echo $this->subLayout('Widget/Module')->set('position', 'kunena_profile_default'); ?>
        <?php echo $this->subLayout('Widget/Module')->set('position', 'kunena_profile_default_' . $user->userid); ?>
        <?php echo $this->subLayout('Widget/Module')->set('position', 'kunena_profile_default_' . $user->rank); ?>
        <?php echo $this->subLayout('Widget/Module')->set('position', 'kunena_topicprofile'); ?>
        <?php if ($user->userid > 1) : ?>
          <?php if ($user->posts >= 1) : ?>
            <li class="kuser-posts">
              <?php echo Text::_('COM_KUNENA_POSTS') . ' ' . (int) $user->posts; ?>
            </li>
          <?php endif; ?>

          <?php if ($show && isset($user->thankyou) && $this->config->showThankYou) : ?>
            <li class="kuser-thankyou">
              <?php echo Text::_('COM_KUNENA_MYPROFILE_THANKYOU_RECEIVED') . ' ' . (int) $user->thankyou; ?>
            </li>
          <?php endif; ?>

          <?php if ($show && !empty($points)) : ?>
            <li class="kuser-points">
              <?php echo Text::_('COM_KUNENA_AUP_POINTS') . ' ' . $this->points; ?>
            </li>
          <?php endif; ?>

          <?php if ($show && !empty($medals)) : ?>
            <li class="kuser-medals">
              <?php echo implode(' ', $this->medals); ?>
            </li>
          <?php endif; ?>

        <?php endif; ?>
      </ul>

      <ul class="kprofile-links">
        <?php if ($user->userid > 1) : ?>

          <?php if ($user->gender) : ?>
            <li>
              <?php echo $user->profileIcon('gender'); ?>
            </li>
          <?php endif; ?>

          <?php if ($user->birthdate) : ?>
            <li>
              <?php echo $user->profileIcon('birthdate'); ?>
            </li>
          <?php endif; ?>

          <?php if ($user->location) : ?>
            <li>
              <?php echo $user->profileIcon('location'); ?>
            </li>
          <?php endif; ?>

          <?php if ($user->websiteurl) : ?>
            <li>
              <?php echo $user->profileIcon('website'); ?>
            </li>
          <?php endif; ?>

          <?php if (KunenaFactory::getPrivateMessaging()) : ?>
            <li>
              <?php echo $user->profileIcon('private'); ?>
            </li>
          <?php endif; ?>

          <?php if ($this->candisplaymail) : ?>
            <li>
              <?php echo $user->profileIcon('email'); ?>
            </li>
          <?php endif; ?>

          <?php echo $this->subLayout('Widget/Module')->set('position', 'kunena_topicprofilemore'); ?>
        <?php endif; ?>
      </ul>
    </div>
  </li>

  <li class="kuser-name">
    <strong><?php echo $user->getLink(null, null, '', '', null, $this->category_id); ?></strong>
  </li>
  <?php if ($optional_username) : ?>
    <li>
      [<?php echo $user->getLinkNoStyle('', '', 'kpost-username-optional') ?>]
    </li>
  <?php endif; ?>

  <?php if (!empty($rankTitle)) : ?>
    <li class="kuser-rank-title">
      <?php echo $this->escape($rankTitle); ?>
    </li>
  <?php endif; ?>
</ul>