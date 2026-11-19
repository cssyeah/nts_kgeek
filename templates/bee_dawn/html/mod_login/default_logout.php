<?php

/**
 * @package     Joomla.Site
 * @subpackage  mod_login
 *
 * @copyright   (C) 2006 Open Source Matters, Inc. <https://www.joomla.org>
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use BeeTheme\Plugin\System\BeeAvatar\Helper\AvatarHelper;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Filter\OutputFilter;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Plugin\PluginHelper;
use Joomla\CMS\Router\Route;

/** @var Joomla\CMS\WebAsset\WebAssetManager $wa */
$wa = \Joomla\CMS\Factory::getApplication()->getDocument()->getWebAssetManager();
$wa->useScript('keepalive');

// Titles of the groups the user is directly assigned to (not inherited parent groups).
$groupIds    = array_map('intval', array_values($user->groups ?? []));
$groupTitles = [];

if ($groupIds) {
    $db    = \Joomla\CMS\Factory::getContainer()->get(\Joomla\Database\DatabaseInterface::class);
    $query = $db->getQuery(true)
        ->select($db->quoteName('title'))
        ->from($db->quoteName('#__usergroups'))
        ->whereIn($db->quoteName('id'), $groupIds)
        ->order($db->quoteName('lft'));

    $groupTitles = $db->setQuery($query)->loadColumn();
}

?>
<form class="mod-login-logout form-vertical" action="<?php echo Route::_('index.php', true); ?>" method="post" id="login-form-<?php echo $module->id; ?>">
<?php // Avatar from the "System - Bee Avatar" plugin (only when it is installed and enabled). ?>
<?php $hasAvatar = PluginHelper::isEnabled('system', 'beeavatar') && class_exists(AvatarHelper::class); ?>
<?php if ($hasAvatar || $params->get('greeting', 1)) : ?>
    <div class="mod-login-logout__user">
    <?php if ($hasAvatar) : ?>
        <?php echo AvatarHelper::render((int) $user->id, $user->name, 40); ?>
    <?php endif; ?>
    <div class="mod-login-logout__user-info">
    <?php if ($params->get('greeting', 1)) : ?>
        <div class="mod-login-logout__login-greeting login-greeting">
        <?php if (!$params->get('name', 0)) : ?>
            <?php echo htmlspecialchars($user->name, ENT_COMPAT, 'UTF-8'); ?>
        <?php else : ?>
            <?php echo Text::sprintf('MOD_LOGIN_HINAME', htmlspecialchars($user->username, ENT_COMPAT, 'UTF-8')); ?>
        <?php endif; ?>
        </div>
    <?php endif; ?>
    <?php if ($groupTitles) : ?>
        <div class="bee-user-group">
        <?php foreach ($groupTitles as $groupTitle) : ?>
            <?php // Group title as CSS class, e.g. "Super Users" => "super-users", "Registered" => "registered". ?>
            <span class="bee-user-group__item <?php echo OutputFilter::stringURLSafe($groupTitle); ?>"><?php echo htmlspecialchars($groupTitle, ENT_COMPAT, 'UTF-8'); ?></span>
        <?php endforeach; ?>
        </div>
    <?php endif; ?>
    </div>
    </div>
<?php endif; ?>
<?php if ($params->get('profilelink', 0)) : ?>
    <ul class="mod-login-logout__options list-unstyled">
        <li>
            <a href="<?php echo Route::_('index.php?option=com_users&view=profile'); ?>">
            <?php echo Text::_('MOD_LOGIN_PROFILE'); ?></a>
        </li>
    </ul>
<?php endif; ?>
    <div class="mod-login-logout__button logout-button">
        <button type="submit" name="Submit" class="btn btn-logout"><i class="fa-duotone fa-thin fa-power-off"></i></button>
        <input type="hidden" name="option" value="com_users">
        <input type="hidden" name="task" value="user.logout">
        <input type="hidden" name="return" value="<?php echo $return; ?>">
        <?php echo HTMLHelper::_('form.token'); ?>
    </div>
</form>
