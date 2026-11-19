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

namespace Kunena\Forum\Site;

\defined('_JEXEC') or die();

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Session\Session;
use Kunena\Forum\Libraries\Factory\KunenaFactory;
use Kunena\Forum\Libraries\Forum\Category\KunenaCategoryHelper;
use Kunena\Forum\Libraries\Icons\KunenaIcons;
use Kunena\Forum\Libraries\Route\KunenaRoute;
use Kunena\Forum\Libraries\Template\KunenaTemplate;

$markAllReadUrl = KunenaCategoryHelper::get()->getMarkReadUrl();
$config         = KunenaFactory::getConfig();
$status         = $config->userStatus;
$tmpParams      = KunenaFactory::getTemplate()->params;
?>

<div class="klogout-wrap">

  <div class="kuser-wrap">
    <div class="kuser-avatar">
      <a href="<?php echo $this->me->getURL(); ?>">
        <?php echo $this->me->getAvatarImage(KunenaFactory::getTemplate()->params->get('avatarType'), 'post'); ?>
      </a>
    </div>

    <div class="kuser-info">
      <div class="kuser-status">
        <span class="kuser-name"><?php echo $this->me->getLink(null, null, '', '', KunenaTemplate::getInstance()->tooltips()); ?></span>
        <?php echo $this->subLayout('User/Item/Status')->set('user', $this->me); ?>
        <div class="kuser-last-visit">
          <?php echo KunenaIcons::clock(); ?>
          <?php echo $this->me->getLastVisitDate()->toKunena('config_postDateFormat'); ?>
        </div>
      </div>

      <?php if ($status) : ?>
        <div id="status-online">
          <a href="<?php echo KunenaRoute::_('index.php?option=com_kunena&view=user&task=status&status=0&' . Session::getFormToken() . '=1'); ?>" class="kbadge kbadge-success">
            <?php echo KunenaIcons::online(); ?>
            <?php echo Text::_('COM_KUNENA_ONLINE') ?>
          </a>

          <a href="<?php echo KunenaRoute::_('index.php?option=com_kunena&view=user&task=status&status=1&' . Session::getFormToken() . '=1'); ?>" class="kbadge kbadge-warning">
            <?php echo KunenaIcons::away(); ?>
            <?php echo Text::_('COM_KUNENA_AWAY') ?>
          </a>
          <a href="<?php echo KunenaRoute::_('index.php?option=com_kunena&view=user&task=status&status=2&' . Session::getFormToken() . '=1'); ?>" class="kbadge kbadge-danger">
            <?php echo KunenaIcons::busy(); ?>
            <?php echo Text::_('COM_KUNENA_BUSY') ?>
          </a>
          <a href="<?php echo KunenaRoute::_('index.php?option=com_kunena&view=user&task=status&status=3&' . Session::getFormToken() . '=1'); ?>" class="kbadge kbadge-secondary">
            <?php echo KunenaIcons::invisible(); ?>
            <?php echo Text::_('COM_KUNENA_INVISIBLE') ?>
          </a>
        </div>
      <?php endif; ?>

      <div class="klogout-action">
        <?php if ($this->plglogin) : ?>
          <?php echo $this->subLayout('Widget/Module')->set('position', 'kunena_logout'); ?>
          <form action="<?php echo KunenaRoute::_('index.php?option=com_kunena'); ?>" method="post" id="logout-form" class="form-inline">
            <div>
              <button class="kbtn kbtn-primary" name="submit" type="submit">
                <?php echo KunenaIcons::out(); ?>
                <?php echo Text::_('COM_KUNENA_PROFILEBOX_LOGOUT'); ?>
              </button>
            </div>
            <input type="hidden" name="view" value="user" />
            <input type="hidden" name="task" value="logout" />
            <?php echo HTMLHelper::_('form.token'); ?>
          </form>
        <?php endif ?>
        <?php echo $this->subLayout('Widget/Module')->set('position', 'kunena_logout_bottom'); ?>
      </div>

    </div>

    <div class="klogout-links">
      <?php if ($status) : ?>
        <div id="statustext">
          <?php HTMLHelper::_('bootstrap.renderModal', 'statusText'); ?>
          <a data-bs-toggle="modal" data-bs-target="#statusTextModal" class="">
            <?php echo KunenaIcons::edit(); ?>
            <?php echo Text::_('COM_KUNENA_STATUS') ?>
          </a>
        </div>
      <?php endif ?>

      <?php if (!empty($this->announcementsUrl)) : ?>
        <div id="announcement">
          <a href="<?php echo $this->announcementsUrl; ?>" class="">
            <?php echo KunenaIcons::pencil(); ?>
            <?php echo Text::_('COM_KUNENA_ANN_ANNOUNCEMENTS') ?>
          </a>
        </div>
      <?php endif; ?>

      <?php if (!empty($this->pm_link)) : ?>
        <div id="mail">
          <a href="<?php echo $this->pm_link; ?>" class="">
            <?php echo KunenaIcons::email(); ?>
            <?php echo $this->inboxCount; ?>
          </a>
        </div>
      <?php endif; ?>

      <div id="settings">
        <a href="<?php echo $this->me->getUrl(false, 'edit'); ?>" class="">
          <?php echo KunenaIcons::cog(); ?>
          <?php echo Text::_('COM_KUNENA_LOGOUTMENU_LABEL_PREFERENCES'); ?>
        </a>
      </div>

      <?php if ($markAllReadUrl) : ?>
        <div id="allread">
          <a href="<?php echo $markAllReadUrl; ?>" class="">
            <?php echo KunenaIcons::drawer(); ?>
            <?php echo Text::_('COM_KUNENA_MARK_ALL_READ'); ?>
          </a>
        </div>
      <?php endif ?>
    </div>
  </div>
</div>

<form action="<?php echo KunenaRoute::_('index.php?option=com_kunena'); ?>" method="post" id="status-text-form" class="form-inline">
  <?php echo $this->subLayout('Widget/Modal')
    ->set('id', 'statusTextModal')
    ->set('name', 'status_text')
    ->set('label', Text::_('COM_KUNENA_STATUS_MESSAGE'))
    ->set('description', Text::_('COM_KUNENA_STATUS_TYP'))
    ->set('data', $this->me->status_text)
    ->set('form', 'status-text-form'); ?>
  <input type="hidden" name="view" value="user" />
  <input type="hidden" name="task" value="statustext" />
  <?php echo HTMLHelper::_('form.token'); ?>
</form>
<script>
  const status = document.querySelector('input[name=status]')
  if (status !== null) {
    status.addEventListener('change', () => {
      document.getElementById('status-form').submit();
    });
  }

  const btnStatusText = document.getElementById('btn_statustext')
  if (btnStatusText) {
    btnStatusText.addEventListener('click', () => {
      document.getElementById('status-text-form').submit();
    });
  }
</script>