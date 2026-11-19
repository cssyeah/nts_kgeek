<?php

/**
 * @package     Joomla.Site
 * @subpackage  mod_login
 *
 * @copyright   (C) 2006 Open Source Matters, Inc. <https://www.joomla.org>
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Plugin\PluginHelper;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Uri\Uri;

$app->getDocument()->getWebAssetManager()
    ->useScript('core')
    ->useScript('keepalive')
    ->useScript('field.passwordview');

// Size the sliding pill indicator to each button's text (see .bee-user-actions in _style.scss)
$app->getDocument()->getWebAssetManager()->addInlineScript(<<<'JS'
document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('.bee-user-actions').forEach(function (list) {
    var login = list.querySelector('li:first-child .btn');
    var signup = list.querySelector('li:last-child .btn');

    if (!login || !signup) {
      return;
    }

    var measure = function () {
      if (!signup.offsetWidth) {
        return;
      }

      list.style.setProperty('--bee-ua-login-x', login.offsetLeft + 'px');
      list.style.setProperty('--bee-ua-login-w', login.offsetWidth + 'px');
      list.style.setProperty('--bee-ua-signup-x', signup.offsetLeft + 'px');
      list.style.setProperty('--bee-ua-signup-w', signup.offsetWidth + 'px');

      if (!list.classList.contains('has-indicator')) {
        list.classList.add('has-indicator');

        // Turn on the slide transition once the first position has been painted
        requestAnimationFrame(function () {
          requestAnimationFrame(function () {
            list.classList.add('is-animated');
          });
        });
      }
    };

    // Re-measure whenever the layout, web fonts or stylesheets change the button sizes
    if ('ResizeObserver' in window) {
      new ResizeObserver(measure).observe(list);
    } else {
      ['resize', 'load'].forEach(function (type) {
        window.addEventListener(type, measure);
      });
    }

    measure();
  });
});
JS);

// The indicator rests behind "Log In" on the /log-in page, behind "Sign Up" everywhere else
$currentPath = rtrim(Uri::getInstance()->getPath(), '/');
$isLogin     = str_ends_with($currentPath, '/log-in');
$isSignup    = str_ends_with($currentPath, '/sign-up');
?>

<ul class="d-none d-lg-flex bee-user-actions<?php echo $isLogin ? ' is-login' : ''; ?>">
  <li><a href="index.php/log-in" title="Log In" class="btn btn-light"<?php echo $isLogin ? ' aria-current="page"' : ''; ?>>Log In</a></li>
  <li><a href="index.php/sign-up" title="Sign Up" class="btn btn-secondary"<?php echo $isSignup ? ' aria-current="page"' : ''; ?>>Sign Up</a></li>
</ul>

<ul class="d-flex d-lg-none bee-user-actions-mobile">
  <li><a href="index.php/log-in" title="Log In" class=""><i class="fa-duotone fa-thin fa-user-unlock"></i></a></li>
  <li><a href="index.php/sign-up" title="Sign Up" class=""><i class="fa-duotone fa-thin fa-user-plus"></i></a></li>
</ul>