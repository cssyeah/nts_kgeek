<?php

/**
 * Kunena Component
 *
 * @package         Kunena.Template.KBee
 * @subpackage      Layout.Statistics
 *
 * @copyright       Copyright (C) 2008 - 2023 Kunena Team. All rights reserved.
 * @license         https://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link            https://www.kunena.org
 **/

namespace Kunena\Forum\Site;

\defined('_JEXEC') or die();

use Joomla\CMS\Language\Text;
?>

<div class="kpage-header">
  <h1><?php echo Text::_('COM_KUNENA_STATISTICS'); ?></h1>
</div>

<div class="statistics">
  <?php foreach ($this->top as $top) : ?>
    <h3><?php echo $top[0]->title; ?></h3>

    <table class="ktable">
      <thead>
        <tr>
          <th class="center" style="width: 10%;">#</th>
          <th style="width: 40%;"><?php echo $top[0]->titleName; ?></th>
          <th style="width: 50%;"><?php echo $top[0]->titleCount; ?></th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($top as $id => $item) :?>
          <tr>
            <td class="center">
              <?php echo $id + 1; ?>
            </td>
            <td>
              <?php echo $item->link; ?>
            </td>
            <td>
              <div class="progress">
                <div class="progress-bar" role="progressbar" style="width: <?php echo $item->percent; ?>%;"><?php echo $item->count; ?></div>
              </div>
            </td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  <?php endforeach; ?>

  <?php if ($this->config->showGenStats) : ?>
    <div id="kstats" class="ksection">
      <div class="ksection-header">
        <h2><?php echo Text::_('COM_KUNENA_STATISTICS'); ?></h2>
      </div>


      <div class="ksection-body">
        <div class="krow">
          <div class="kcol kcol-full">
            <ul>
              <li>
              <?php echo Text::_('COM_KUNENA_STAT_TOTAL_USERS'); ?>:
              <?php if ($this->userlistUrl) : ?>
                <a href="<?php echo $this->userlistUrl; ?>"><?php echo $this->memberCount; ?></a>
              <?php else : ?>
                <?php echo $this->memberCount; ?>
              <?php endif; ?>
            </li>
            <li>
              <?php echo Text::_('COM_KUNENA_STAT_LATEST_MEMBERS'); ?>:
              <?php echo $this->latestMemberLink ?>
            </li>
            <li>
              <?php echo Text::_('COM_KUNENA_STAT_TOTAL_MESSAGES'); ?>:
              <?php echo (int) $this->messageCount; ?>
            </li>
            <li>
              <?php echo Text::_('COM_KUNENA_STAT_TOTAL_SUBJECTS'); ?>:
              <?php echo (int) $this->topicCount; ?>
            </li>
            <li>
              <?php echo Text::_('COM_KUNENA_STAT_TOTAL_SECTIONS'); ?>:
              <?php echo (int) $this->sectionCount; ?>
            </li>
            <li>
              <?php echo Text::_('COM_KUNENA_STAT_TOTAL_CATEGORIES'); ?>:
              <?php echo (int) $this->categoryCount; ?>
            </li>
            <li>
              <?php echo Text::_('COM_KUNENA_STAT_TODAY_OPEN_THREAD'); ?>:
              <?php echo (int) $this->todayTopicCount; ?>
            </li>
            <li>
              <?php echo Text::_('COM_KUNENA_STAT_YESTERDAY_OPEN_THREAD'); ?>:
              <?php echo (int) $this->yesterdayTopicCount; ?>
            </li>
            <li>
              <?php echo Text::_('COM_KUNENA_STAT_TODAY_TOTAL_ANSWER'); ?>:
              <?php echo (int) $this->todayReplyCount; ?>
            </li>
            <li>
              <?php echo Text::_('COM_KUNENA_STAT_YESTERDAY_TOTAL_ANSWER'); ?>:
              <?php echo (int) $this->yesterdayReplyCount; ?>
            </li>
          </ul>
          </div>
        </div>

      </div>
    </div>
  <?php endif; ?>
</div>