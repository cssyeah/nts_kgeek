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

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Kunena\Forum\Libraries\Icons\KunenaIcons;
use Kunena\Forum\Libraries\Route\KunenaRoute;

?>
<div class="klogin-form">
  <?php echo $this->loadModuleWebauthn(); ?>
  <form id="kdesktop-loginform" action="<?php echo KunenaRoute::current('index.php?option=com_kunena'); ?>" method="post">
    <div class="kform-input-wrap">
      <input type="hidden" name="view" value="user" />
      <input type="hidden" name="task" value="login" />
      <?php echo HTMLHelper::_('form.token'); ?>

      <div id="kform-desktop-login-username" class="kform-username">
        <div class="input-group">
          <label for="kdesktop-username" class="visually-hidden"><?php echo Text::_('JGLOBAL_USERNAME'); ?></label>
          <input id="kdesktop-username" type="text" name="username" class="form-control" tabindex="1" autocomplete="username" placeholder="<?php echo Text::_('JGLOBAL_USERNAME'); ?>">
        </div>
      </div>

      <div id="kform-desktop-login-password" class="kform-password">
        <div class="input-group">
          <label for="klogin-desktop-passwd" class="visually-hidden"><?php echo Text::_('JGLOBAL_PASSWORD'); ?></label>
          <input id="klogin-desktop-passwd" type="password" name="password" class="form-control" tabindex="1" autocomplete="current-password" placeholder="<?php echo Text::_('JGLOBAL_PASSWORD'); ?>">
        </div>
      </div>

      <?php if ($this->rememberMe) : ?>
      <div class="" id="kform-login-remember">
        <div class="controls">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" name="rememberme" id="klogin-desktop-remember" value="1" />
            <label class="custom-control-label" for="klogin-desktop-remember"><?php echo Text::_('JGLOBAL_REMEMBER_ME'); ?></label>
          </div>
        </div>
      </div>
      <?php endif; ?>

      <div id="kform-login-desktop-submit" class="">
        <button type="submit" tabindex="3" name="submit" class="kbtn kbtn-primary">
          <?php echo Text::_('JLOGIN'); ?>
        </button>
      </div>
    </div>

    <ul class="kform-links">
      <?php if ($this->resetPasswordUrl) : ?>
        <li><a href="<?php echo $this->resetPasswordUrl; ?>">
          <?php echo Text::_('COM_KUNENA_PROFILEBOX_FORGOT_PASSWORD'); ?>
        </a></li>
      <?php endif ?>

      <?php if ($this->remindUsernameUrl) : ?>
        <li><a href="<?php echo $this->remindUsernameUrl; ?>">
          <?php echo Text::_('COM_KUNENA_PROFILEBOX_FORGOT_USERNAME'); ?>
        </a></li>
      <?php endif ?>

      <?php if ($this->registrationUrl) : ?>
        <li><a href="<?php echo $this->registrationUrl; ?>">
          <?php echo Text::_('COM_KUNENA_PROFILEBOX_CREATE_ACCOUNT'); ?>
        </a></li>
      <?php endif ?>
    </ul>
  </form>
  <?php echo $this->subLayout('Widget/Module')->set('position', 'kunena_login'); ?>

</div>