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
<ul class="kprofile-info">
  <li class="kuser-name">
    <strong><?php echo $user->getLink(null, null, '', '', null, $this->category_id); ?></strong>
  </li>
  <?php if ($optional_username) : ?>
    <li>
      [<?php echo $user->getLinkNoStyle('', '', 'kpost-username-optional') ?>]
    </li>
  <?php endif; ?>

  <?php if ($avatar) : ?>
    <li class="kuser-avatar">
      <?php echo $user->getLink($avatar, null, '', '', null, 0, $this->config->avatarEdit); ?>
      <?php if (isset($this->topic_starter) && $this->topic_starter) : ?>
        <span class="ktopic-starter"><?php echo Text::_('COM_KUNENA_TOPIC_AUTHOR') ?></span>
      <?php endif; ?>
      <?php /*if (!$this->topic_starter && $user->isModerator()) : */ ?><!--
            <span class="topic-moderator"><?php /*echo Text::_('COM_KUNENA_MODERATOR') */ ?></span>
        --><?php /*endif;*/ ?>
    </li>
  <?php endif; ?>

  <?php if ($user->exists() && $this->config->userStatus) : ?>
    <li class="kuser-status">
      <?php echo $this->subLayout('User/Item/Status')->set('user', $user); ?>
    </li>
  <?php endif; ?>

  <?php if (!empty($rankTitle)) : ?>
    <li class="kuser-rank-title">
      <?php echo $this->escape($rankTitle); ?>
    </li>
  <?php endif; ?>

  <?php if (!empty($rankImage)) : ?>
    <li class="kuser-rank-image">
      <?php echo $rankImage; ?>
    </li>
  <?php endif; ?>

  <?php if (!empty($personalText)) : ?>
    <li class="kpersonal-text">
      <?php echo $personalText; ?>
    </li>
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

    <?php if ($canseekarma && $this->config->showKarma) : ?>
      <li class="kuser-karma">
        <?php if ($user->karma > 0) :
          $karmanumber = $user->karma;
        else :
          $karmanumber = '';
        endif;

        echo Text::_('COM_KUNENA_KARMA') . ': ' . $karmanumber . $this->subLayout('Widget/Karma')->set('topicicontype', $this->ktemplate->params->get('topicicontype'))->set('userid', $user->userid)->set('karmatype', 'karmadown') . $this->subLayout('Widget/Karma')->set('topicicontype', $this->ktemplate->params->get('topicicontype'))->set('userid', $user->userid)->set('karmatype', 'karmaup'); ?>
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
