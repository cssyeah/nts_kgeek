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

use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Uri\Uri;
use Kunena\Forum\Libraries\Factory\KunenaFactory;
use Kunena\Forum\Libraries\Forum\Category\KunenaCategory;
use Kunena\Forum\Libraries\Icons\KunenaIcons;
use Kunena\Forum\Libraries\Profiler\KunenaProfiler;
use Kunena\Forum\Libraries\Route\KunenaRoute;

// Display time it took to create the entire page in the footer.
$kunena_profiler = KunenaProfiler::instance();
$kunena_profiler->start('Total Time');
KUNENA_PROFILER ? $kunena_profiler->mark('afterLoad') : null;

if ($this->config->enableForumJump) {
  echo $this->subLayout('Widget/Forumjump')->set('categorylist', $this->categorylist);
}

$mmm             = 0;

if ($this->templateParams->get('displayModule')) {
  echo $this->subLayout('Widget/Module')->set('position', 'kunena_index_top');
}

foreach ($this->sections as $section) :
  $Itemid      = KunenaRoute::getCategoryItemid($section);

  if ($this->templateParams->get('displayModule')) {
    echo $this->subLayout('Widget/Module')->set('position', 'kunena_section_top_' . ++$mmm);
  } ?>
  <div class="kfrontend ksection">
    <div class="ksection-header">
      <h2>
        <?php echo $this->getCategoryLink($section, $this->escape($section->name), null, $this->ktemplate->tooltips(), true, false); ?>
      </h2>

      <?php if (!empty($section->description)) : ?>
      <div class="ksec-desc"><?php echo $section->displayField('description'); ?></div>
      <?php endif; ?>

      <div class="ksection-toggle">
      <?php if (\count($this->sections) > 0) : ?>
        <?php if ($this->me->isAdmin()) : ?>
          <a class="kbtn kbtn-primary btn-sm" href="<?php echo Route::_('index.php?option=com_kunena&view=category&catid=' . (int) $section->id . '&layout=manage&Itemid=' . $Itemid); ?>"><?php echo KunenaIcons::pencil(); ?></a>
        <?php endif; ?>

        <button class="kbtn-toggle-collapse" type="button" aria-expanded="false" aria-controls="section<?php echo $section->id; ?>" data-bs-toggle="collapse" data-bs-target="#section<?php echo $section->id; ?>">
          <i class="fa-solid fa-plus"></i>
          <i class="fa-solid fa-minus"></i>
        </button>
      <?php endif; ?>
      </div>
    </div>

    <div class="ksection-body <?php if (!empty($section->class)) : ?>ksection<?php echo $this->escape($section->class_sfx); ?><?php endif; ?> collapse show" id="section<?php echo $section->id; ?>">

      <div class="kcat-list <?php echo $this->escape($section->class_sfx); ?>">
        <?php if ($section->isSection() && empty($this->categories[$section->id]) && empty($this->more[$section->id])) : ?>
          <div class="krow">
            <div class="kcol kcol-full">
              <div class="kmsg-noforum"><?php echo Text::_('COM_KUNENA_GEN_NOFORUMS'); ?></div>
            </div>
          </div>
        <?php else : ?>

          <?php foreach ($this->categories[$section->id] as $category) : ?>
          <div class="krow category<?php echo $this->escape($category->class_sfx); ?>" id="category<?php echo $category->id; ?>">

            <?php
            // Category thumbnail: images/kunena/categories/{category id}.webp|.png|.jpg, in that order of priority.
            $thumb = '';
            foreach (['webp', 'png', 'jpg'] as $ext) {
              $thumbFile = 'images/kunena/categories/' . (int) $category->id . '.' . $ext;

              if (is_file(JPATH_ROOT . '/' . $thumbFile)) {
                // The version suffix makes a replaced image show up straight away.
                $thumb = Uri::root(true) . '/' . $thumbFile . '?v=' . filemtime(JPATH_ROOT . '/' . $thumbFile);
                break;
              }
            }
            ?>

            
            <div class="kcat-head">
              <?php if ($thumb) : ?>              
              <div class="kcat-thumb">
                <img class="kcat-thumb" loading="lazy" src="<?php echo htmlspecialchars($thumb, ENT_QUOTES, 'UTF-8'); ?>" alt="<?php echo htmlspecialchars((string) $category->name, ENT_QUOTES, 'UTF-8'); ?>" />
              </div>
              <?php else : ?>
              <div class="kcol kcol-icon">
                <?php echo $this->getCategoryLink($category, $this->getCategoryIcon($category), '', null, true, false); ?>
              </div>
              <?php endif; ?>

              <div class="kcat-stats">
                <div class="kcat-topics">
                  <span class="kstats-value"><?php echo $this->formatLargeNumber($category->getTopics()) ?></span>
                  <span class="kstats-label">
                    <?php if($this->formatLargeNumber($category->getTopics()) > 1) {
                      echo Text::_('COM_KUNENA_TOPICS');
                    } else {
                      echo Text::_('COM_KUNENA_TOPICS');
                    } ?>
                  </span>
                </div> <!-- End: Post -->

                <div class="kcat-replies">
                  <span class="kstats-value"><?php echo $this->formatLargeNumber($category->getReplies()) ?></span>
                  <span class="kstats-label">
                    <?php if($this->formatLargeNumber($category->getReplies()) > 1) { 
                      echo Text::_('COM_KUNENA_GEN_REPLIES');
                    } else {
                      echo Text::_('COM_KUNENA_GEN_REPLIES');
                    } ?>					
                  </span>
                </div> <!-- End: Replies -->
              </div>
            </div>


            
            <div class="kcol kcol-title kcol-auto">
              <h3>
                <?php $catName = $this->escape($category->name); ?>
                <?php echo $this->getCategoryLink($category, '<span class="kroll" data-text="' . $catName . '">' . $catName . '</span>', null, $this->ktemplate->tooltips(), true, false); ?>
                <small class="nowrap">
                  <span>
                    <?php if (($new = $category->getNewCount()) > 0) : ?>
                      <sup class="knewchar"> (<?php echo $new . ' ' . Text::_('COM_KUNENA_A_GEN_NEWCHAR') ?>)</sup>
                    <?php endif; ?>
                    <?php if ($category->locked) : ?>
                      <span <?php echo $this->ktemplate->tooltips(true); ?> data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_LOCKED_CATEGORY') ?>"><?php echo KunenaIcons::lock(); ?></span>
                    <?php endif; ?>
                    <?php if ($category->review) : ?>
                      <span <?php echo $this->ktemplate->tooltips(true); ?> data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_GEN_MODERATED') ?>"><?php echo KunenaIcons::shield(); ?></span>
                    <?php endif; ?>

                    <?php if ($this->config->enableRss) : ?>
                      <a href="<?php echo $this->getCategoryRSSURL($category->id); ?>" rel="alternate" type="application/rss+xml">
                        <?php echo KunenaIcons::rss(); ?>
                      </a>
                    <?php endif; ?>
                  </span>
                </small>
              </h3>

              <?php if (!empty($category->description)) : ?>
                <div class="kcat-desc"><?php echo $category->displayField('description'); ?></div>
              <?php endif; ?>

              <?php
              // Display subcategories
              if (!empty($this->categories[$category->id])) : ?>
                <div class="ksub-cat-list">
                  <ul>
                    <?php
                    // Render each subcategory item, then show at most $subcatLimit inline;
                    // the rest go into a "..." dropdown shown on hover.
                    $subcatLimit = 5;
                    $subcatItems = [];

                    foreach ($this->categories[$category->id] as $subcategory) {
                      $totaltopics = KunenaCategory::getInstance()->totalCount($subcategory->getTopics());
                      $item        = '';

                      if ($this->config->showChildCatIcon) {
                        $item .= $this->getCategoryLink($subcategory, $this->getSmallCategoryIcon($subcategory), '', null, true, false);
                      }

                      $item .= $this->getCategoryLink($subcategory, '', null, $this->ktemplate->tooltips(), true, false)
                        . '<small class="d-none d-sm-block muted"> (' . $totaltopics . ')</small>';

                      if (($new = $subcategory->getNewCount()) > 0) {
                        $item .= '<sup class="knewchar">(' . $new . ' ' . Text::_('COM_KUNENA_A_GEN_NEWCHAR') . ')</sup>';
                      }

                      $subcatItems[] = $item;
                    }

                    $subcatVisible = array_slice($subcatItems, 0, $subcatLimit);
                    $subcatHidden  = array_slice($subcatItems, $subcatLimit);
                    ?>

                    <?php foreach ($subcatVisible as $item) : ?>
                      <li><?php echo $item; ?></li>
                    <?php endforeach; ?>

                    <?php if ($subcatHidden) : ?>
                      <li class="ksub-cat-more" tabindex="0" aria-haspopup="true"
                          aria-label="<?php echo count($subcatHidden); ?> more">
                        <span class="ksub-cat-more-toggle">...</span>
                        <ul class="ksub-cat-more-list">
                          <?php foreach ($subcatHidden as $item) : ?>
                            <li><?php echo $item; ?></li>
                          <?php endforeach; ?>
                        </ul>
                      </li>
                    <?php endif; ?>

                    <?php if (!empty($this->more[$category->id])) : ?>
                      <li>
                        <?php echo $this->getCategoryLink($category, Text::_('COM_KUNENA_SEE_MORE'), null, $this->ktemplate->tooltips(), true, false); ?>
                        <small class="d-none d-sm-block muted">
                          (<?php echo Text::sprintf('COM_KUNENA_X_HIDDEN', (int) $this->more[$category->id]); ?>
                          )
                        </small>
                      </li>
                    <?php endif; ?>

                  </ul>
                </div>
              <?php endif; ?>

              <?php if ($category->getmoderators() && $this->config->listCatShowModerators) : ?>
                <div class="moderators">
                  <?php
                  // get the Moderator list for display
                  $modslist = [];
                  foreach ($category->getmoderators() as $moderator) {
                    $modslist[] = KunenaFactory::getUser($moderator)->getLink(null, null, '', null, $this->ktemplate->tooltips());
                  }

                  echo Text::_('COM_KUNENA_MODERATORS') . ': ' . implode(', ', $modslist);
                  ?>
                </div>
              <?php endif; ?>

              <?php if (!empty($this->pending[$category->id])) : ?>
                <div class="alert alert-warning" role="alert" style="margin-top:10px;">
                  <a class="alert-link" href="<?php echo KunenaRoute::_('index.php?option=com_kunena&view=topics&layout=posts&mode=unapproved&userid=0&catid=' . \intval($category->id)); ?>" data-bs-toggle="tooltip" title="<?php echo Text::_('COM_KUNENA_SHOWCAT_PENDING') ?>" rel="nofollow"><?php echo \intval($this->pending[$category->id]) . ' ' . Text::_('COM_KUNENA_SHOWCAT_PENDING') ?></a>
                </div>
              <?php endif; ?>
            </div> <!-- End: Title -->


            <?php $last = $category->getLastTopic(); ?>

            <?php if ($last->exists()) :
              $author = $last->getLastPostAuthor();
              $time = $last->getLastPostTime();
              $this->ktemplate = KunenaFactory::getTemplate();
              $avatar = $this->config->avatarOnCategory ? $author->getAvatarImage($this->ktemplate->params->get('avatarType'), 'thumb') : null;
            ?>
              <div class="kcol kcol-latest-post">
                <?php if ($avatar) : ?>
                <div class="kcat-avatar">
                  <?php echo $author->getLink($avatar, null, '', '', $this->ktemplate->tooltips(), $category->id, $this->config->avatarEdit); ?>
                </div>
                <?php endif; ?>
                <div class="kcat-last">
                  <span class="klast-post-link"><?php echo $this->getLastPostLink($category, null, null, $this->ktemplate->tooltips(), 30, false, true) ?></span>
                  <div class="klast-post-meta">
                    <span class="klast-post-by"><?php echo Text::sprintf('COM_KUNENA_BY_X', $author->getLink(null, null, '', '', $this->ktemplate->tooltips(), $category->id)); ?></span>
                    <span class="kdate-post"><?php echo $time->toKunena('config_postDateFormat'); ?></span>
                  </div>
                </div>
              </div>
            <?php else : ?>
              <div class="kcol kcol-latest-post">
                <div class="last-post-message">
                  <?php echo Text::_('COM_KUNENA_X_TOPICS_0'); ?>
                </div>
              </div>
            <?php endif; ?>
          </div>
          <?php endforeach; ?>
        <?php endif; ?>

        <?php if (!empty($this->more[$section->id])) : ?>
          <div class="krow">
            <div class="kcol kcol-full">
              <?php echo $this->getCategoryLink($section, Text::sprintf('COM_KUNENA_SEE_ALL_SUBJECTS')); ?>
              <small>(<?php echo Text::sprintf('COM_KUNENA_X_HIDDEN', (int) $this->more[$section->id]); ?>)</small>
            </div>
          </div>
        <?php endif; ?>
      </div> <!-- // KCat list -->

    </div>
  </div>
  <!-- Begin: Category Module Position -->
  <?php
  if ($this->templateParams->get('displayModule')) {
    echo $this->subLayout('Widget/Module')->set('position', 'kunena_section_' . ++$mmm);
  } ?>
  <!-- Finish: Category Module Position -->
<?php endforeach;

if ($this->templateParams->get('displayModule')) {
  echo $this->subLayout('Widget/Module')->set('position', 'kunena_index_bottom');
}

// Display profiler information.
if (KUNENA_PROFILER) {
  $kunena_profiler->stop('Total Time');

  echo '<div class="kprofiler">';
  echo "<h3>Kunena Profile Information</h3>";

  foreach ($kunena_profiler->getAll() as $item) {
    echo sprintf(
      "Kunena %s: %0.3f / %0.3f seconds (%d calls)<br/>",
      $item->name,
      $item->getInternalTime(),
      $item->getTotalTime(),
      $item->calls
    );
  }

  echo '</div>';
}
