<?php

/**
 * Bee Dawn - Kunena avatar helpers.
 *
 * Kunena serves avatars from media/kunena/avatars/resized/size<N>/..., re-encoded with the "avatarQuality"
 * setting, which makes them look blurry on high-density screens. These helpers return the original uploaded
 * file instead; the display size is still controlled by width/height attributes and CSS.
 *
 * Usage in an override: require_once dirname(__DIR__, 3) . '/helpers/avatar.php';
 */

defined('_JEXEC') or die();

use Joomla\CMS\Language\Text;
use Kunena\Forum\Libraries\Factory\KunenaFactory;
use Kunena\Forum\Libraries\User\KunenaAvatarPath;
use Kunena\Forum\Libraries\User\KunenaUser;

if (!function_exists('beeKunenaAvatarUrl')) {
  /**
   * URL of the user's original (not resized) avatar, or null when it cannot be used
   * (no avatar, another avatar integration such as Gravatar, or a missing file).
   */
  function beeKunenaAvatarUrl(KunenaUser $user): ?string
  {
    $avatar = (string) $user->avatar;

    if ($avatar === '' || !class_exists(KunenaAvatarPath::class) || !KunenaAvatarPath::isValid($avatar)) {
      return null;
    }

    // Only the built-in Kunena avatar integration stores files in media/kunena/avatars.
    $integration = KunenaFactory::getAvatarIntegration();

    if (!$integration || substr(get_class($integration), -strlen('KunenaAvatarKunena')) !== 'KunenaAvatarKunena') {
      return null;
    }

    $file = KPATH_MEDIA . '/avatars/' . $avatar;

    if (!is_file($file)) {
      return null;
    }

    $version = $user->timestamp ?: (int) @filemtime($file);

    return KURL_MEDIA . 'avatars/' . $avatar . ($version ? '?' . $version : '');
  }
}

if (!function_exists('beeKunenaAvatarImage')) {
  /**
   * Same markup as KunenaUser::getAvatarImage(), but pointing to the original avatar file.
   * Falls back to Kunena's own output (default avatar / icon) when there is no original file.
   *
   * @param   KunenaUser  $user   User
   * @param   string      $class  CSS class (Kunena "avatarType" template param)
   * @param   string|int  $sizex  Size name ('thumb', 'post', 'profile', ...) or width in px
   * @param   int         $sizey  Height in px when $sizex is a number
   */
  function beeKunenaAvatarImage(KunenaUser $user, $class = '', $sizex = 'thumb', int $sizey = 90): string
  {
    $url = beeKunenaAvatarUrl($user);

    if ($url === null) {
      return $user->getAvatarImage($class, $sizex, $sizey);
    }

    $size  = KunenaFactory::getAvatarIntegration()->getSize($sizex, $sizey);
    $title = htmlspecialchars(Text::sprintf('COM_KUNENA_LIB_AVATAR_TITLE', $user->getName()), ENT_QUOTES, 'UTF-8');
    $src   = htmlspecialchars($url, ENT_QUOTES, 'UTF-8');
    $img   = '<img loading="lazy" decoding="async" src="' . $src . '" width="' . $size->x . '" height="' . $size->y
      . '" style="object-fit:cover"';

    if ($class === 'none') {
      $class = 'kavatar';
    }

    $classAttr = $class ? ' class="' . htmlspecialchars($class, ENT_QUOTES, 'UTF-8') . '"' : '';

    if (KunenaFactory::getTemplate()->params->get('topicicontype') == 'svg') {
      return '<span' . $classAttr . ' data-bs-toggle="tooltip" title="' . $title . '">' . $img . ' alt=""></span>';
    }

    return $img . $classAttr . ' alt="' . $title . '" />';
  }
}
