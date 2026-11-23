<?php

/**
 * Kunena Component
 *
 * @package         Kunena.Template.KGeek
 * @subpackage      Layout.Category
 *
 * @copyright       Copyright (C) 2008 - 2023 Kunena Team. All rights reserved.
 * @license         https://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link            https://www.kunena.org
 **/

namespace Kunena\Forum\Site;

\defined('_JEXEC') or die();

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Kunena\Forum\Libraries\Forum\Topic\KunenaTopic;
use Kunena\Forum\Libraries\Icons\KunenaIcons;
use Kunena\Forum\Libraries\Route\KunenaRoute;
use Kunena\Forum\Libraries\Template\KunenaTemplate;

$categoryActions = $this->getCategoryActions();
$this->addStyleSheet('rating.css');
?>

<?php if ($this->category->headerdesc) : ?>
  <div id="category-headerdesc<?php echo $this->category->id; ?>" class="alert alert-info alert-dismissible fade show">
    <?php echo $this->category->displayField('headerdesc'); ?>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
<?php endif; ?>

<?php if (!$this->category->isSection()) : ?>
  <?php if (!empty($this->topics)) : ?>
    <div class="ktopic-filter">
      <div class="kpagination-wrap">
        <?php echo $this->subLayout('Widget/Pagination/List')
          ->set('pagination', $this->pagination)
          ->set('display', true); ?>
      </div>

      <div class="ktopic-search-wrap">
        <?php echo $this->subLayout('Widget/Search')
          ->set('catid', $this->category->id)
          ->setLayout('topic'); ?>
      </div>
    </div>
  <?php endif; ?>

  <form action="<?php echo KunenaRoute::_('index.php?option=com_kunena'); ?>" method="post" id="categoryactions">
    <input type="hidden" name="view" value="topics" />
    <?php echo HTMLHelper::_('form.token'); ?>
    <div class="kactions-wrap align-left">
      <?php if ($categoryActions) : ?>
        <?php echo implode($categoryActions); ?>
      <?php endif; ?>
    </div>
    <?php if ($this->topics) : ?>
      <div class="ktopic-list-wrap">
        <div class="ktopic-list-header">
          <div class="krow">
            <div class="kcol kcol-icon">
              <a id="forumtop"> </a>
              <a href="#forumbottom" rel="nofollow">
                <?php echo KunenaIcons::arrowdown(); ?>
              </a>
            </div>

            <?php if (!empty($this->topicActions)) : ?>
              <div class="kcol kcol-checkbox">
                <input class="kcheckall" type="checkbox" name="toggle" value="" />
              </div>
            <?php endif; ?>
          </div>
        </div>

        <div class="category-item ktopic-list">
          <?php
          /** @var KunenaTopic $previous */
          $previous = null;

          foreach ($this->topics as $position => $topic) {
            echo $this->subLayout('Topic/Row')
              ->set('topic', $topic)
              ->set('spacing', $previous && $previous->ordering != $topic->ordering)
              ->set('position', 'kunena_topic_' . $position)
              ->set('checkbox', !empty($this->topicActions))
              ->setLayout('category');
            $previous = $topic;
          }
          ?>
        </div>

        <div class="ktopic-list-footer">
          <?php if ($this->topics) : ?>
            <div class="krow">
              <div class="kcol kcol-icon">
                <a id="forumbottom"> </a>
                <a href="#forumtop" rel="nofollow">
                  <span class="dropdown-divider"></span>
                  <?php echo KunenaIcons::arrowup(); ?>
                </a>
              </div>
              <div class="kcol kcol-auto">
                <div class="form-group">
                  <div class="input-group" role="group">
                    <?php if (!empty($this->moreUri)) {
                      echo HTMLHelper::_(
                        'kunenaforum.link',
                        $this->moreUri,
                        Text::_('COM_KUNENA_MORE'),
                        null,
                        null,
                        'follow'
                      );
                    } ?>

                    <?php if (!empty($this->topicActions)) : ?>
                      <?php echo HTMLHelper::_(
                        'select.genericlist',
                        $this->topicActions,
                        'task',
                        'class="form-select kchecktask"',
                        'value',
                        'text',
                        0,
                        'kchecktask'
                      ); ?>

                      <?php if ($this->actionMove) : ?>
                        <?php
                        $options = [HTMLHelper::_('select.option', '0', Text::_('COM_KUNENA_BULK_CHOOSE_DESTINATION'))];
                        echo HTMLHelper::_(
                          'kunenaforum.categorylist',
                          'target',
                          0,
                          $options,
                          [],
                          'class="form-select fbs" disabled="disabled"',
                          'value',
                          'text',
                          0,
                          'kchecktarget'
                        );
                        ?>
                        <button class="kbtn kbtn-primary" name="kcheckgo" type="submit"><?php echo Text::_('COM_KUNENA_GO') ?></button>
                      <?php endif; ?>
                    <?php endif; ?>
                  </div>
                </div>
              </div>
            </div>
          <?php endif; ?>
        </div>

      </div>
      <?php endif; ?>
  </form>

  <?php if ($this->topics) : ?>
    <div class="kpagination-wrap kpagination-bot">
      <?php echo $this->subLayout('Widget/Pagination/List')
        ->set('pagination', $this->pagination)
        ->set('display', true); ?>
    </div>
  <?php endif; ?>

  <?php if (!empty($this->moderators)) {
    echo $this->subLayout('Category/Moderators')
      ->set('moderators', $this->moderators);
  } ?>

  <?php if ($this->ktemplate->params->get('writeaccess')) : ?>
    <div class="kwriteaccess"><?php echo $this->subLayout('Widget/Writeaccess')->set('id', $this->category->id); ?></div>
  <?php endif; ?>

<?php endif; ?>