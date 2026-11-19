<?php

/**
 * @package            Joomla
 * @subpackage         Documents Seller
 * @author             Tuan Pham Ngoc
 * @license            GNU/GPL, see LICENSE.php
 */

defined('_JEXEC') or die;

use Bee\Component\Dmsreviews\Site\Helper\ReviewsHelper;
use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Uri\Uri;

DMSHelperJquery::colorbox('a.dms-modal');

$item      = $this->item;
$url       = Route::_(DMSHelperRoute::getDocumentRoute($item->id, $this->categoryId, $this->Itemid), false);
$rootUri   = Uri::root(true);
$siteUrl   = Uri::base();
$socialUrl = substr($siteUrl, 0, strlen($siteUrl) - 1) . Route::_(DMSHelperRoute::getDocumentRoute($item->id, 0, $this->Itemid), false);
$user      = Factory::getApplication()->getIdentity();
$userId    = $user->id;

$rowFluid = $this->uiHelper->getClassMapping('row-fluid');
$clearFix = $this->uiHelper->getClassMapping('clearfix');
$span11   = $this->uiHelper->getClassMapping('span11');

if ($this->config->enable_cart) {
  Factory::getApplication()
    ->getDocument()
    ->getWebAssetManager()
    ->registerAndUseScript('com_dms.jquery.colorbox', 'media/com_dms/assets/js/colorbox/jquery.colorbox.min.js')
    ->registerAndUseScript('com_dms.cart', 'media/com_dms/assets/js/cart.min.js');
}
?>
<div id="dms-document-page" class="dms-container dms-document">
  <div id="dms-document-details" class="dms-description">
    <?php if ($this->config->show_social_sharing_buttons !== '0') { ?>
      <div class="sharing">
        <!-- FB -->
        <div style="float:left;" id="rsep_fb_like">
          <div id="fb-root"></div>
          <script src="https://connect.facebook.net/en_US/all.js" type="text/javascript"></script>
          <script type="text/javascript">
            FB.init({
              appId: '340486642645761',
              status: true,
              cookie: true,
              xfbml: true
            });
          </script>
          <fb:like href="<?php echo $socialUrl; ?>" send="true" layout="button_count" width="150" show_faces="false"></fb:like>
        </div>

        <!-- Twitter -->
        <div style="float:left;" id="rsep_twitter">
          <a href="https://twitter.com/share" class="twitter-share-button" data-text="<?php echo $this->item->title . ' ' . $socialUrl; ?>">Tweet</a>
          <script>
            ! function(d, s, id) {
              var js, fjs = d.getElementsByTagName(s)[0];
              if (!d.getElementById(id)) {
                js = d.createElement(s);
                js.id = id;
                js.src = "//platform.twitter.com/widgets.js";
                fjs.parentNode.insertBefore(js, fjs);
              }
            }(document, "script", "twitter-wjs");
          </script>
        </div>
      </div>
    <?php } ?>

    <div class="bee-inline-demo">
      <div class="container">
        
        <div class="bee-demo-browser">
          <div class="bee-browser-header">
            <div class="bee-browser-dot">
            </div>
            <div class="bee-browser-add"><?php echo $item->title; ?></div>
          </div>
          <iframe src="<?php echo $item->demo_url; ?>" title="<?php echo $item->title; ?>" border="0" loading="lazy" allowfullscreen></iframe>
        </div>

      </div>
    </div>

    <?php
    // A description without text (e.g. only a slide mockup) is replaced by the short description in the model,
    // which the masthead already shows, so only render it when it is real content.
    $descriptionText = trim(strip_tags((string) $item->description));

    if ($descriptionText !== '' && $descriptionText !== trim(strip_tags((string) $item->short_description))) {
    ?>
      <div class="dms-desc" style="display: none;">
        <div class="container">
          <!-- <?php echo $item->description; ?> -->
        </div>
      </div>
    <?php } ?>

    <?php
    if ($this->showTaskBar) {
    ?>
      <div class="bee-doc-info-wrapper">
        <div class="container">
          <?php echo DMSHelperHtml::loadCommonLayout('common/taskbar.php', ['item' => $item, 'config' => $this->config, 'layout' => 'default', 'showDetailsLink' => false, 'Itemid' => $this->Itemid]); ?>
        </div>
      </div>
    <?php } ?>

    <?php
    $hasDataTabs = trim($item->tab_1_title) || strlen(trim(strip_tags($item->tab_1_data, '<img>')));

    // Customer reviews are provided by com_dmsreviews, so the tab disappears if the component is disabled or uninstalled.
    $hasReviews = ComponentHelper::isEnabled('com_dmsreviews') && class_exists(ReviewsHelper::class);
    ?>
    <div class="bee-doc-tabs">
      <div class="container">
      <?php
      if ($hasDataTabs || $hasReviews) {
        echo HTMLHelper::_('bootstrap.startTabSet', 'document-data', ['active' => $hasDataTabs ? 'tab-1' : 'tab-reviews']);

        for ($i = 1; $i <= 6; $i++) {
          $tabTitle = $item->{'tab_' . $i . '_title'};
          $tabData  = $item->{'tab_' . $i . '_data'};

          if (trim($tabTitle) != '' && strlen(trim(strip_tags($tabData, '<img>'))) > 0) {
            echo HTMLHelper::_('bootstrap.addTab', 'document-data', 'tab-' . $i, Text::_($tabTitle, true));
            echo HTMLHelper::_('content.prepare', $tabData);
            echo HTMLHelper::_('bootstrap.endTab');
          }
        }

        if ($hasReviews) {
          // Render first: it loads the com_dmsreviews language used by the tab title.
          $reviewsHtml = ReviewsHelper::render((int) $item->id, (string) $item->title, ['showHeading' => false]);

          echo HTMLHelper::_('bootstrap.addTab', 'document-data', 'tab-reviews', ReviewsHelper::getTabTitle((int) $item->id));
          echo $reviewsHtml;
          echo HTMLHelper::_('bootstrap.endTab');
        }

        echo HTMLHelper::_('bootstrap.endTabSet');

        // Slide a pill indicator behind the active tab. Joomla builds the tab buttons with JS, so wait for them.
        Factory::getApplication()->getDocument()->getWebAssetManager()->addInlineScript(<<<'JS'
document.addEventListener('DOMContentLoaded', function () {
  var list = document.querySelector('.bee-doc-tabs .joomla-tabs');

  if (!list) {
    return;
  }

  var indicator = document.createElement('span');
  indicator.className = 'bee-tabs-indicator';
  indicator.setAttribute('aria-hidden', 'true');

  var move = function (link, animate) {
    if (!link || !link.offsetWidth) {
      return;
    }

    if (!animate) {
      indicator.style.transition = 'none';
    }

    indicator.style.width = link.offsetWidth + 'px';
    indicator.style.height = link.offsetHeight + 'px';
    indicator.style.transform = 'translate(' + link.offsetLeft + 'px, ' + link.offsetTop + 'px)';

    if (!animate) {
      indicator.offsetWidth;
      indicator.style.transition = '';
    }
  };

  var init = function () {
    var active = list.querySelector('.nav-link.active');

    if (!active || list.contains(indicator)) {
      return;
    }

    list.prepend(indicator);
    list.classList.add('has-indicator');
    move(active, false);
  };

  // Start sliding as soon as a tab is chosen, not after its pane is shown
  list.addEventListener('show.bs.tab', function (event) {
    move(event.target, true);
  });

  // Re-measure when the layout or web fonts change the tab sizes
  ['resize', 'load'].forEach(function (type) {
    window.addEventListener(type, function () {
      move(list.querySelector('.nav-link.active'), false);
    });
  });

  new MutationObserver(init).observe(list, { childList: true, subtree: true, attributes: true, attributeFilter: ['class'] });
  init();
});
JS);

        // FAQ accordion in tab content: one item open at a time, with the body sliding open and closed.
        // Without JS the <details name="..."> items still work, just without the animation.
        Factory::getApplication()->getDocument()->getWebAssetManager()->addInlineScript(<<<'JS'
document.addEventListener('DOMContentLoaded', function () {
  var reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  var options = { duration: 350, easing: 'cubic-bezier(.4, 0, .2, 1)' };

  var animate = function (item, open) {
    var body = item.querySelector('.bee-faq-body');

    // Start from the current height so reversing mid-animation does not jump.
    // A closed item still reports its full height in some browsers, so treat it as 0.
    var from = body && item.open ? body.offsetHeight : 0;

    if (item.beeAnimation) {
      item.beeAnimation.cancel();
    }

    item.classList.toggle('is-open', open);

    if (!body || reduceMotion) {
      item.open = open;
      return;
    }

    if (open) {
      item.open = true;
    }

    // Clip first: it also makes the body's height include the last child's bottom margin
    body.style.overflow = 'hidden';

    var to = open ? body.scrollHeight : 0;

    item.beeAnimation = body.animate({ height: [from + 'px', to + 'px'], opacity: [open ? 0 : 1, open ? 1 : 0] }, options);
    item.beeAnimation.onfinish = function () {
      item.open = open;
      body.style.overflow = '';
      item.beeAnimation = null;
    };
    item.beeAnimation.oncancel = function () {
      body.style.overflow = '';
    };
  };

  document.querySelectorAll('.bee-faq').forEach(function (faq) {
    faq.classList.add('is-ready');

    var items = Array.prototype.slice.call(faq.querySelectorAll('.bee-faq-item'));

    items.forEach(function (item, index) {
      // The script closes the other items itself, so the native exclusive group would skip their animation
      item.removeAttribute('name');
      item.open = index === 0;
      item.classList.toggle('is-open', item.open);

      item.querySelector('summary').addEventListener('click', function (event) {
        event.preventDefault();

        var open = !item.classList.contains('is-open');

        if (open) {
          items.forEach(function (other) {
            if (other !== item && other.classList.contains('is-open')) {
              animate(other, false);
            }
          });
        }

        animate(item, open);
      });
    });
  });
});
JS);
      }
      ?>
      </div>
    </div>

  </div>
</div>