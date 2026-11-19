<?php

/**
 * Kunena Component
 *
 * @package         Kunena.Template.KInfinite
 * @subpackage      Layout.Message
 *
 * @copyright       Copyright (C) 2008 - 2023 Kunena Team. All rights reserved.
 * @license         https://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link            https://www.kunena.org
 **/

namespace Kunena\Forum\Site;

\defined('_JEXEC') or die();

require_once dirname(__DIR__, 3) . '/helpers/avatar.php';

use Joomla\CMS\Language\Text;
use Kunena\Forum\Libraries\Config\KunenaConfig;
use Kunena\Forum\Libraries\Factory\KunenaFactory;
use Kunena\Forum\Libraries\Icons\KunenaIcons;
use Kunena\Forum\Libraries\Template\KunenaTemplate;

$this->addStyleSheet('rating.css');

$message         = $this->message;
$author          = $message->getAuthor();
$topic           = $message->getTopic();
$userTopic       = $topic->getUserTopic();
$category        = $message->getCategory();
$this->ktemplate = KunenaFactory::getTemplate();
$config          = KunenaFactory::getConfig();
$avatar          = $config->avatarOnCategory ? \beeKunenaAvatarImage($topic->getLastPostAuthor(), KunenaFactory::getTemplate()->params->get('avatarType'), 'thumb') : null;
$cols            = empty($this->checkbox) ? 5 : 6;
$txt             = $topic->getActions();
$topicPages      = $topic->getPagination(null, KunenaConfig::getInstance()->messagesPerPage, 3);

?>

<?php
// Avatar of the user who started the topic; fall back to the first letter of the username.
$firstAuthor     = $topic->getFirstPostAuthor();
$firstAuthorName = $firstAuthor->username ?: $firstAuthor->getName($topic->first_post_guest_name, false);

if (!empty($firstAuthor->avatar)) {
  $topicIcon = '<span class="kuser-avatar-icon"><img src="' . $this->escape(\beeKunenaAvatarUrl($firstAuthor) ?? $firstAuthor->getAvatarURL('thumb')) . '" alt="' . $this->escape($firstAuthorName) . '" loading="lazy" /></span>';
} else {
  $initial   = $firstAuthorName !== '' ? mb_strtoupper(mb_substr(trim($firstAuthorName), 0, 1, 'UTF-8'), 'UTF-8') : '?';
  $topicIcon = '<span class="kuser-avatar-icon kuser-avatar-initial" title="' . $this->escape($firstAuthorName) . '">' . $this->escape($initial) . '</span>';
}
?>
<div class="krow category<?php echo $this->escape($category->class_sfx) . $txt; ?>">
  <?php if ($topic->unread) : ?>
    <div class="kcol kcol-icon topic-item-unread">
      <?php echo $this->getTopicLink($topic, 'unread', $topicIcon, '', null, $category, true, true); ?>
    </div>
  <?php else : ?>
    <div class="kcol kcol-icon">
      <?php echo $this->getTopicLink($topic, null, $topicIcon, '', null, $category, true, false); ?>
    </div>
  <?php endif; ?>
  <div class="kcol kcol-subject kcol-auto">
    <div class="ktopic-title-wrap">
      <h3>
      <?php
      if ($this->ktemplate->params->get('labels') != 0) {
        echo $this->subLayout('Widget/Label')->set('topic', $topic)->setLayout('default');
      }

      if ($topic->unread) {
        echo $this->getTopicLink(
          $topic,
          'unread',
          $this->escape($topic->subject) .
            '<sup class="knewchar" dir="ltr">(' . (int) $topic->unread . ' ' . Text::_('COM_KUNENA_A_GEN_NEWCHAR') . ')</sup>',
          null,
          KunenaTemplate::getInstance()->tooltips() . ' topictitle',
          $category,
          true,
          true
        );
      } else {
        echo $this->getTopicLink($topic, $this->message, null, null, KunenaTemplate::getInstance()->tooltips() . ' topictitle', $category, true, false);
      }

      echo $this->subLayout('Widget/Rating')->set('config', $config)->set('category', $category)->set('topic', $topic)->setLayout('default'); ?>
      </h3>
      <div class="ktopic-badge">
        <?php if ($userTopic->favorite) :
        ?>
          <span class="badge-favorite" <?php echo KunenaTemplate::getInstance()->tooltips(true); ?> data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_FAVORITE'); ?>"><?php echo KunenaIcons::star(); ?></span>
        <?php endif; ?>

        <?php if ($userTopic->posts) :
        ?>
          <span class="badge-myposts" <?php echo KunenaTemplate::getInstance()->tooltips(true); ?> data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_MYPOSTS'); ?>"><?php echo KunenaIcons::flag(); ?></span>
        <?php endif; ?>

        <?php if ($topic->attachments) :
        ?>
          <span class="badge-attach" <?php echo KunenaTemplate::getInstance()->tooltips(true); ?> data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_ATTACH'); ?>"><?php echo KunenaIcons::attach(); ?></span>
        <?php endif; ?>

        <?php if ($topic->poll_id && $category->allowPolls) :
        ?>
          <span class="badge-poll" <?php echo KunenaTemplate::getInstance()->tooltips(true); ?> data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_ADMIN_POLLS'); ?>"><?php echo KunenaIcons::poll(); ?></span>
        <?php endif; ?>
      </div>
    </div>

    <div class="kpost-info">
      <span class="last-post-link">
        <i class="fa-duotone fa-thin fa-reply"></i>
        <strong><?php echo $topic->getLastPostAuthor()->getLink(null, Text::sprintf('COM_KUNENA_VIEW_USER_LINK_TITLE', $topic->getLastPostAuthor()->getName()), '', '', KunenaTemplate::getInstance()->tooltips(), $category->id); ?></strong>
      </span>
      <span class="date-post"> - Replied <?php echo $topic->getLastPostTime()->toKunena('config_postDateFormat'); ?></span>
    </div>

    <div class="kpagination-small">
      <?php echo $this->subLayout('Widget/Pagination/List')->set('pagination', $topicPages)->setLayout('simple'); ?>
    </div>
  </div>

    <div class="kcol kcol-topic-info">
    <div class="ktopic-category"><?php echo $this->getCategoryLink($topic->getCategory(), null, $topic->getCategory()->description, KunenaTemplate::getInstance()->tooltips()) ?></div>

    <div class="ktopic-stats">
      <span class="kstats-label"><i class="fa-duotone fa-thin fa-comments"></i></span>
      <span class="kstats-value"><?php echo $this->formatLargeNumber($topic->getReplies()); ?></span>      
    </div>

    <div class="ktopic-stats">
      <span class="kstats-label"><i class="fa-duotone fa-thin fa-eye"></i></span>
      <span class="kstats-value"><?php echo $this->formatLargeNumber($topic->hits); ?></span>
    </div>
  </div>

  <?php if (!empty($this->checkbox)) : ?>
    <div class="kcol kcol-checkbox">
      <label>
        <input class="kcheck" type="checkbox" name="posts[<?php echo $message->id; ?>]" value="1" />
      </label>
    </div>
  <?php endif; ?>

  <?php
  if (!empty($this->position)) {
    echo $this->subLayout('Widget/Module')
      ->set('position', $this->position)
      ->set('cols', $cols)
      ->setLayout('table_row');
  }
  ?>
</div>