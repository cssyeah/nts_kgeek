<?php

/**
 * NTS KGeek (Kunena template) - avatar helpers.
 *
 * Kunena serves avatars from media/kunena/avatars/resized/size<N>/..., re-encoded with the "avatarQuality"
 * setting, which makes them look blurry on high-density screens. These helpers return the original uploaded
 * file instead; the display size is still controlled by width/height attributes and CSS.
 *
 * Usage in a template layout (layouts/<view>/<layout>/<file>.php):
 *   require_once dirname(__DIR__, 3) . '/helpers/avatar.php';
 */

defined('_JEXEC') or die();

use Joomla\CMS\Language\Text;
use Kunena\Forum\Libraries\Factory\KunenaFactory;
use Kunena\Forum\Libraries\User\KunenaAvatarPath;
use Kunena\Forum\Libraries\User\KunenaUser;

if (!function_exists('ntsKunenaAvatarUrl')) {
  /**
   * URL of the user's original (not resized) avatar, or null when it cannot be used
   * (no avatar, another avatar integration such as Gravatar, or a missing file).
   */
  function ntsKunenaAvatarUrl(KunenaUser $user): ?string
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

if (!function_exists('ntsKunenaAvatarImage')) {
  /**
   * Same markup as KunenaUser::getAvatarImage(), but pointing to the original avatar file.
   * Falls back to Kunena's own output (default avatar / icon) when there is no original file.
   *
   * @param   KunenaUser  $user   User
   * @param   string      $class  CSS class (Kunena "avatarType" template param)
   * @param   string|int  $sizex  Size name ('thumb', 'post', 'profile', ...) or width in px
   * @param   int         $sizey  Height in px when $sizex is a number
   */
  function ntsKunenaAvatarImage(KunenaUser $user, $class = '', $sizex = 'thumb', int $sizey = 90): string
  {
    $url = ntsKunenaAvatarUrl($user);

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

if (!function_exists('ntsKunenaAvatarOrInitial')) {
  /**
   * Avatar of a user as a <span class="kuser-avatar-icon">: the original avatar image, or the first letter
   * of the username when the user has no avatar.
   *
   * @param   KunenaUser  $user  User
   * @param   string      $name  Name to show (alt / title / initial); defaults to the username
   */
  function ntsKunenaAvatarOrInitial(KunenaUser $user, string $name = ''): string
  {
    $name = trim($name !== '' ? $name : ((string) $user->username ?: $user->getName('', false)));
    $attr = htmlspecialchars($name, ENT_QUOTES, 'UTF-8');

    if (!empty($user->avatar)) {
      $src = htmlspecialchars(ntsKunenaAvatarUrl($user) ?? $user->getAvatarURL('thumb'), ENT_QUOTES, 'UTF-8');

      return '<span class="kuser-avatar-icon"><img src="' . $src . '" alt="' . $attr . '" loading="lazy" decoding="async" /></span>';
    }

    $initial = $name !== '' ? mb_strtoupper(mb_substr($name, 0, 1, 'UTF-8'), 'UTF-8') : '?';

    return '<span class="kuser-avatar-icon kuser-avatar-initial" title="' . $attr . '">'
      . htmlspecialchars($initial, ENT_QUOTES, 'UTF-8') . '</span>';
  }
}

if (!function_exists('ntsKunenaTopicParticipants')) {
  /**
   * Users who posted in a topic (author first, then the most recent repliers), without duplicates.
   *
   * Only $limit users are read and loaded, whatever the number of participants, so a topic with
   * hundreds of repliers costs the same as a small one. Reads #__kunena_user_topics (indexed on
   * topic_id) directly, because KunenaTopicUserHelper::getUserIds() has no limit.
   *
   * @param   \Kunena\Forum\Libraries\Forum\Topic\KunenaTopic  $topic  Topic
   * @param   int                                                $limit  Max number of users to return
   *
   * @return  array{users: KunenaUser[], total: int}  Users to display, and the total number of participants
   */
  function ntsKunenaTopicParticipants($topic, int $limit = 5): array
  {
    $topicId  = (int) $topic->id;
    $authorId = (int) $topic->first_post_userid;
    $limit    = max(1, $limit);
    $result   = ['users' => [], 'total' => 0];

    if ($topicId <= 0) {
      return $result;
    }

    $db    = \Joomla\CMS\Factory::getContainer()->get('DatabaseDriver');
    $where = [
      $db->quoteName('topic_id') . ' = ' . $topicId,
      $db->quoteName('posts') . ' > 0',
      $db->quoteName('user_id') . ' > 0',
    ];

    try {
      // Total number of participants (for the "+N" item).
      $query = $db->createQuery()
        ->select('COUNT(*)')
        ->from($db->quoteName('#__kunena_user_topics'))
        ->where($where);
      $total = (int) $db->setQuery($query)->loadResult();

      // Author first, then the users who posted most recently.
      $query = $db->createQuery()
        ->select($db->quoteName('user_id'))
        ->from($db->quoteName('#__kunena_user_topics'))
        ->where($where)
        ->order('(' . $db->quoteName('user_id') . ' = ' . $authorId . ') DESC')
        ->order($db->quoteName('owner') . ' DESC')
        ->order($db->quoteName('last_post_id') . ' DESC');
      $ids = array_map('intval', (array) $db->setQuery($query, 0, $limit)->loadColumn());
    } catch (\Exception $e) {
      return $result;
    }

    // The author may have no #__kunena_user_topics row (e.g. topics created by the installer or imported):
    // always show them first and count them.
    if ($authorId > 0 && !\in_array($authorId, $ids, true)) {
      array_unshift($ids, $authorId);
      $ids = \array_slice($ids, 0, $limit);
      $total++;
    }

    $ids = array_values(array_unique(array_filter($ids)));

    if ($ids) {
      \Kunena\Forum\Libraries\User\KunenaUserHelper::loadUsers($ids);

      foreach ($ids as $id) {
        $result['users'][] = \Kunena\Forum\Libraries\User\KunenaUserHelper::get($id);
      }
    }

    $result['total'] = max($total, \count($result['users']));

    return $result;
  }
}

if (!function_exists('ntsKunenaTopicIconName')) {
  /**
   * Name of the topic icon Kunena shows for a topic, read from an attribute of the icon in
   * media/kunena/topic_icons/<iconset>/topicicons.xml (or systemicons.xml when topic icons are disabled).
   * Same rules as KunenaTemplate::getTopicIcon().
   *
   * - 'fa'   (default): Font Awesome name without the "fa-" prefix (heart, check, lock, map-pin, ...)
   * - 'name': Kunena icon name (love, solved, locked, sticky, ...)
   *
   * @param   \Kunena\Forum\Libraries\Forum\Topic\KunenaTopic  $topic  Topic
   * @param   string                                             $attr   XML attribute to read
   */
  function ntsKunenaTopicIconName($topic, string $attr = 'fa'): string
  {
    static $xmlCache = [];

    $config  = \Kunena\Forum\Libraries\Config\KunenaConfig::getInstance();
    $iconset = (string) ($topic->getCategory()->iconset ?: 'default');
    $system  = !$config->topicIcons;
    $file    = $system ? 'systemicons.xml' : 'topicicons.xml';
    $path    = JPATH_ROOT . '/media/kunena/topic_icons/' . $iconset . '/' . $file;

    if (!is_file($path)) {
      $path = JPATH_ROOT . '/media/kunena/topic_icons/default/' . $file;
    }

    if (!array_key_exists($path, $xmlCache)) {
      $xmlCache[$path] = is_file($path) ? @simplexml_load_file($path) : false;
    }

    $xml = $xmlCache[$path];

    if (!$xml) {
      return '';
    }

    if ($system) {
      $id = 0;
      if ($topic->posts < 2) { $id = 6; }
      if ($topic->ordering) { $id = 3; }
      if ($topic->locked) { $id = 4; }
      if ($topic->ordering && $topic->locked) { $id = 7; }
      if ($topic->moved_id) { $id = 5; }
      if ($topic->hold == 1) { $id = 1; }
      if ($topic->hold == 2 || $topic->hold == 3) { $id = 2; }
    } else {
      $id = (int) $topic->icon_id;
      if ($topic->ordering) { $id = 504; }
      if ($topic->locked) { $id = 505; }
      if ($topic->ordering && $topic->locked) { $id = 503; }
      if ($topic->hold == 2 || $topic->hold == 3) { $id = 501; }
      if ($topic->moved_id > 0) { $id = 500; }
    }

    $icon = $xml->xpath('//icons/icon[@id=' . (int) $id . ']') ?: $xml->xpath('//icons/icon[@id=0]');
    $name = $icon ? (string) $icon[0][$attr] : '';
    $name = preg_replace('/^fa-/', '', $name);

    // Safe as a CSS class.
    return strtolower(preg_replace('/[^A-Za-z0-9_-]+/', '-', $name));
  }
}
