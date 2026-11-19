<?php

/**
 * @package     Joomla.Site
 * @subpackage  com_users
 *
 * @copyright   (C) 2009 Open Source Matters, Inc. <https://www.joomla.org>
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
use Joomla\CMS\Uri\Uri;
use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Plugin\PluginHelper;
use Joomla\CMS\Router\Route;

/** @var \Joomla\Component\Users\Site\View\Login\HtmlView $this */

/** @var Joomla\CMS\WebAsset\WebAssetManager $wa */
$wa = $this->getDocument()->getWebAssetManager();
$wa->useScript('keepalive')
  ->useScript('form.validate');

$usersConfig = ComponentHelper::getParams('com_users');

?>

<div class="bee-login-form login">

  <div class="bee-login-form-wrap">

    <div class="bee-login-header form-header">
      <a href="<?php echo Uri::root(); ?>" title="BeeThemePro" class="bee-brand-link">
      <span class="bee-logo-ico">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 120 100" fill="none">
        <title>Hand-drawn BeeTheme bee</title>
        <!-- Hand-drawn wings -->
        <path d="M55 42 C42 42 28 31 28 19 C28 8 39 8 49 16 C56 21 60 31 63 38" fill="#fff" stroke="#111" stroke-width="4.5" stroke-linecap="round" stroke-linejoin="round"/>
        <path d="M60 40 C58 29 60 18 66 13 C71 9 76 13 75 21" stroke="#111" stroke-width="4.5" stroke-linecap="round"/>
        <path d="M64 38 C65 32 70 30 73 33 C76 36 72 42 67 43" stroke="#111" stroke-width="3.7" stroke-linecap="round"/>
        <!-- Body silhouette -->
        <path d="M64 38 C49 37 36 44 30 57 C24 68 28 79 40 84 C51 91 66 90 77 83 L82 88 L82 78 C90 67 85 49 74 42 Z" fill="#111" stroke="#111" stroke-width="3.5" stroke-linejoin="round"/>
        <!-- Yellow body stripes -->
        <path d="M38 52 C32 62 31 73 38 80 C42 84 46 85 50 86 C43 77 38 66 38 52Z" fill="#ffda00"/>
        <path d="M52 41 C47 45 45 50 46 58 C47 70 55 82 63 85 C69 85 73 83 76 80 C63 73 54 55 52 41Z" fill="#ffda00"/>
        <!-- Face and head -->
        <path d="M74 34 C84 26 98 28 106 37 C114 46 112 60 102 68 C93 76 80 76 71 68 C61 60 61 44 74 34Z" fill="#ffda00" stroke="#111" stroke-width="4.5" stroke-linejoin="round"/>
        <path d="M70 60 C73 66 80 71 88 72" stroke="#fff" stroke-width="2" opacity=".9" stroke-linecap="round"/>
        <path d="M77 35 C86 31 96 33 102 40" stroke="#fff" stroke-width="2" opacity=".85" stroke-linecap="round"/>
        <path d="M92 46 C95 43 98 46 98 49 C97 53 92 54 90 50 C89 48 90 47 92 46Z" fill="#111"/>
        <!-- Sketch motion marks -->
        <g stroke="#111" stroke-width="4.5" stroke-linecap="round"><path d="M20 54 L10 49"/><path d="M16 65 L5 65"/><path d="M20 76 L11 83"/><path d="M99 16 L103 9"/></g>
        </svg>
      </span>
      <span class="bee-logo-text"><strong>BeeTheme</strong><small>Pro</small></span>
      </a>
    </div>

    <div class="bee-login-form">
      <form action="<?php echo Route::_('index.php?task=user.login'); ?>" method="post" id="com-users-login__form" class="com-users-login__form form-validate form-horizontal">
        <fieldset>
          <?php echo $this->form->renderFieldset('credentials', ['class' => 'com-users-login__input']); ?>

          <?php if (PluginHelper::isEnabled('system', 'remember')) : ?>
            <div class="com-users-login__remember">
              <div class="form-check">
                <input class="form-check-input" id="remember" type="checkbox" name="remember" value="yes">
                <label class="form-check-label" for="remember">
                  <?php echo Text::_('COM_USERS_LOGIN_REMEMBER_ME'); ?>
                </label>
              </div>
            </div>
          <?php endif; ?>

          <?php foreach ($this->extraButtons as $button) :
            $dataAttributeKeys = array_filter(array_keys($button), function ($key) {
              return substr($key, 0, 5) == 'data-';
            });
          ?>
            <div class="com-users-login__submit control-group">
              <div class="controls">
                <button type="button"
                  class="btn btn-secondary w-100 <?php echo $button['class'] ?? '' ?>"
                  <?php foreach ($dataAttributeKeys as $key) : ?>
                  <?php echo $key ?>="<?php echo $button[$key] ?>"
                  <?php endforeach; ?>
                  <?php if ($button['onclick']) : ?>
                  onclick="<?php echo $button['onclick'] ?>"
                  <?php endif; ?>
                  title="<?php echo Text::_($button['label']) ?>"
                  id="<?php echo $button['id'] ?>">
                  <?php if (!empty($button['icon'])) : ?>
                    <span class="<?php echo $button['icon'] ?>"></span>
                  <?php elseif (!empty($button['image'])) : ?>
                    <?php echo HTMLHelper::_('image', $button['image'], Text::_($button['tooltip'] ?? ''), [
                      'class' => 'icon',
                    ], true) ?>
                  <?php elseif (!empty($button['svg'])) : ?>
                    <?php echo $button['svg']; ?>
                  <?php endif; ?>
                  <?php echo Text::_($button['label']) ?>
                </button>
              </div>
            </div>
          <?php endforeach; ?>

          <div class="com-users-login__submit control-group">
            <div class="controls">
              <button type="submit" class="btn btn-primary">
                <?php echo Text::_('JLOGIN'); ?>
              </button>
            </div>
          </div>

          <?php echo $this->form->renderControlFields(); ?>
        </fieldset>
      </form>
      <div class="bee-login-links">
        <a class="com-users-login__reset list-group-item" href="<?php echo Route::_('index.php?option=com_users&view=reset'); ?>">
          <?php echo Text::_('COM_USERS_LOGIN_RESET'); ?>
        </a>
        <a class="com-users-login__remind list-group-item" href="<?php echo Route::_('index.php?option=com_users&view=remind'); ?>">
          <?php echo Text::_('COM_USERS_LOGIN_REMIND'); ?>
        </a>
        <?php
        if ($usersConfig->get('allowUserRegistration')) :
          $regLinkMenuId = $this->params->get('customRegLinkMenu');
          $regLink = 'index.php?option=com_users&view=registration';

          if ($regLinkMenuId) {
            $menu = Factory::getApplication()->getMenu();
            $item = $menu->getItem($regLinkMenuId);

            if ($item) {
              $regLink = 'index.php?Itemid=' . $regLinkMenuId;
            }
          }
        ?>
          <a class="com-users-login__register list-group-item" href="<?php echo Route::_($regLink); ?>">
            <?php echo Text::_('COM_USERS_LOGIN_REGISTER'); ?>
          </a>
        <?php endif; ?>
      </div>
    </div>
  <div class="bee-registratrtion-footer form-footer">
    <ul>
      <li>
        <i class="fa-duotone fa-thin fa-arrow-left"></i>
        <a href="javascript:history.back()" title="Previous page">
          Previous page
        </a>
      </li>
      <li>
        <i class="fa-duotone fa-thin fa-house-chimney-heart"></i>
        <a href="<?php echo Uri::root(); ?>" title="Home page">
          Home page
        </a>
      </li>
    </ul>
  </div>
  </div>
</div>