<?php

/**
 * Kunena Component
 *
 * @package         Kunena.Template.KInfinite
 * @subpackage      Layout.Widget
 *
 * @copyright       Copyright (C) 2008 - 2023 Kunena Team. All rights reserved.
 * @license         https://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link            https://www.kunena.org
 **/

defined('_JEXEC') or die();

use Joomla\CMS\Language\Text;
use Kunena\Forum\Libraries\Icons\KunenaIcons;

?>

<div id="kstats" class="ksection">
  <div class="ksection-header">
    <h2>
      <?php if ($this->statisticsUrl) :
      ?>
        <a href="<?php echo $this->statisticsUrl; ?>">
          <?php echo Text::_('COM_KUNENA_STATISTICS'); ?>
        </a>
      <?php else :
      ?>
        <?php echo Text::_('COM_KUNENA_STATISTICS'); ?>
      <?php endif; ?>
    </h2>

    <div class="ksection-toggle" data-bs-toggle="collapse" data-bs-target="#kstats-body"><?php echo KunenaIcons::collapse(); ?></div>
  </div>

  <div id="kstats-body" class="ksection-body">
    <div class="krow">
      <div class="kcol kcol-icon">
        <span class="kicon-wrap"><?php echo KunenaIcons::stats(); ?></span>
      </div>

      <div class="kcol kcol-auto">
        <ul>
          <li>
            <?php echo Text::_('COM_KUNENA_STAT_TOTAL_MESSAGES'); ?>:
            <strong><?php echo (int) $this->messageCount; ?></strong>
          </li>
          <li>
            <?php echo Text::_('COM_KUNENA_STAT_TOTAL_SECTIONS'); ?>:
            <strong><?php echo (int) $this->sectionCount; ?></strong>
          </li>
          <li>
            <?php echo Text::_('COM_KUNENA_STAT_TODAY_OPEN_THREAD'); ?>:
            <strong><?php echo (int) $this->todayTopicCount; ?></strong>
          </li>
          <li>
            <?php echo Text::_('COM_KUNENA_STAT_TODAY_TOTAL_ANSWER'); ?>:
            <strong><?php echo (int) $this->todayReplyCount; ?></strong>
          </li>
        </ul>
        <ul>
          <li>
            <?php echo Text::_('COM_KUNENA_STAT_TOTAL_SUBJECTS'); ?>:
            <strong><?php echo (int) $this->topicCount; ?></strong>
          </li>
          <li>
            <?php echo Text::_('COM_KUNENA_STAT_TOTAL_CATEGORIES'); ?>:
            <strong><?php echo (int) $this->categoryCount; ?></strong>
          </li>
          <li>
            <?php echo Text::_('COM_KUNENA_STAT_YESTERDAY_OPEN_THREAD'); ?>:
            <strong><?php echo (int) $this->yesterdayTopicCount; ?></strong>
          </li>
          <li>
            <?php echo Text::_('COM_KUNENA_STAT_YESTERDAY_TOTAL_ANSWER'); ?>:
            <strong><?php echo (int) $this->yesterdayReplyCount; ?></strong>
          </li>
        </ul>

        <ul>
          <li>
            <?php echo Text::_('COM_KUNENA_STAT_TOTAL_USERS'); ?>:
            <strong><?php echo $this->memberCount; ?></strong>
          </li>
          <li>
            <?php echo Text::_('COM_KUNENA_STAT_LATEST_MEMBERS'); ?>:
            <strong><?php echo $this->latestMemberLink; ?></strong>
          </li>
        </ul>
      </div>

    </div>
  </div>
</div>