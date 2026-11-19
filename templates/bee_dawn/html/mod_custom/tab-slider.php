<?php

/**
 * @package     Joomla.Site
 * @subpackage  mod_custom
 *
 * Tab slider layout: vertical tabs on one side, a crossfading image on the other.
 * Tabs auto-advance after a delay (with a progress bar) and can also be clicked.
 *
 * Content format (module editor, use Toggle Editor to paste the HTML):
 *   <div class="bee-ts-wrapper content-left">            <- content-left | content-right
 *     <div class="bee-ts-content-wrap">
 *       <div class="bee-ts-heading"><h2>...</h2><p class="lead">...</p></div>   <- optional
 *       <div class="bee-ts-content">
 *         <div class="bee-ts-item">
 *           <span class="bee-ts-item-icon"><i class="fas fa-car"></i></span>   <- optional icon
 *           <h3>Tab title</h3>                           <- first heading = tab title
 *           <div class="bee-ts-item-img"><img ...></div> <- slide image
 *           <p>Description...</p>                        <- everything else = description
 *         </div>
 *         ...
 *       </div>
 *     </div>
 *     <div class="bee-ts-media"></div>                   <- filled with the item images
 *   </div>
 *
 * Auto-advance delay in milliseconds (default 6000): data-interval="5000" on .bee-ts-wrapper,
 * or "interval-5000" in the Module Class field (Advanced tab).
 *
 * @copyright   (C) 2009 Open Source Matters, Inc. <https://www.joomla.org>
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Uri\Uri;

$modId = 'mod-custom' . $module->id;

/** @var Joomla\CMS\WebAsset\WebAssetManager $wa */
$wa = Factory::getApplication()->getDocument()->getWebAssetManager();

if ($params->get('backgroundimage')) {
    $wa->addInlineStyle('
#' . $modId . '{background-image: url("' . Uri::root(true) . '/' . HTMLHelper::_('cleanImageURL', $params->get('backgroundimage'))->url . '");}
', ['name' => $modId]);
}

$classSfx = (string) $params->get('moduleclass_sfx', '');
$interval = preg_match('/\binterval-(\d+)\b/', $classSfx, $m) ? (int) $m[1] : 6000;

// Turn each .bee-ts-wrapper of the editor content into a tab slider (the DOM is transformed in place)
$html    = '';
$sliders = 0;

if (trim((string) $module->content) !== '' && class_exists('DOMDocument')) {
    $dom        = new DOMDocument();
    $prevErrors = libxml_use_internal_errors(true);
    $dom->loadHTML('<?xml encoding="utf-8"?><div>' . $module->content . '</div>', LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);
    libxml_clear_errors();
    libxml_use_internal_errors($prevErrors);

    $root  = $dom->getElementsByTagName('div')->item(0);
    $xpath = new DOMXPath($dom);

    $hasClass = fn ($class) => "contains(concat(' ', normalize-space(@class), ' '), ' $class ')";
    $heading  = 'self::h1 or self::h2 or self::h3 or self::h4 or self::h5 or self::h6';

    $addClass = function (DOMElement $el, $class) {
        $el->setAttribute('class', trim($el->getAttribute('class') . ' ' . $class));
    };

    $element = function ($tag, $class) use ($dom) {
        $el = $dom->createElement($tag);
        $el->setAttribute('class', $class);

        return $el;
    };

    $wrappers = $root ? iterator_to_array($xpath->query('.//*[' . $hasClass('bee-ts-wrapper') . ']', $root)) : [];

    foreach ($wrappers as $n => $wrapper) {
        $items = iterator_to_array($xpath->query('.//*[' . $hasClass('bee-ts-item') . ']', $wrapper));

        if (!$items) {
            continue;
        }

        $media = $xpath->query('.//*[' . $hasClass('bee-ts-media') . ']', $wrapper)->item(0);

        if (!$media) {
            $media = $wrapper->appendChild($element('div', 'bee-ts-media'));
        }

        while ($media->firstChild) {
            $media->removeChild($media->firstChild);
        }

        $tabIndex  = 0;
        $hasImages = false;

        foreach ($items as $item) {
            $title = $xpath->query('./*[' . $heading . ']', $item)->item(0);

            // An item without heading cannot be a tab: render it as a normal block
            if (!$title) {
                $item->setAttribute('class', trim(preg_replace('/(^|\s)bee-ts-item(?=\s|$)/', ' ', $item->getAttribute('class'))));
                continue;
            }

            $tabId  = $modId . '-ts' . $n . '-tab' . $tabIndex;
            $active = $tabIndex === 0;

            // Slide image: .bee-ts-item-img > img, or the first image of the item
            $imgBox = $xpath->query('./*[' . $hasClass('bee-ts-item-img') . ']', $item)->item(0);
            $img    = $xpath->query('.//img', $imgBox ?: $item)->item(0);
            $slide  = $media->appendChild($element('figure', 'bee-ts-slide' . ($active ? ' is-active' : '')));
            $slide->setAttribute('aria-hidden', $active ? 'false' : 'true');

            if ($img) {
                $hasImages = true;
                $parent    = $img->parentNode;

                $addClass($img, 'bee-ts-img');
                $img->setAttribute('loading', $active ? 'eager' : 'lazy');
                $img->setAttribute('decoding', 'async');

                if (!$img->hasAttribute('alt')) {
                    $img->setAttribute('alt', '');
                }

                $slide->appendChild($img);

                // Drop the image wrapper (.bee-ts-item-img, or a <p> left empty)
                if ($imgBox) {
                    $imgBox->parentNode->removeChild($imgBox);
                } elseif ($parent !== $item && trim($parent->textContent) === '' && !$xpath->query('.//*', $parent)->length) {
                    $parent->parentNode->removeChild($parent);
                }
            }

            // Icon: stays visible next to the title
            $icon = $xpath->query('./*[' . $hasClass('bee-ts-item-icon') . ']', $item)->item(0);

            if ($icon) {
                $icon->setAttribute('aria-hidden', 'true');
                $addClass($item, 'has-icon');
            }

            // Title: heading > button
            $addClass($title, 'bee-ts-title');
            $trigger = $element('button', 'bee-ts-trigger');
            $trigger->setAttribute('type', 'button');
            $trigger->setAttribute('id', $tabId);
            $trigger->setAttribute('aria-controls', $tabId . '-panel');
            $trigger->setAttribute('aria-expanded', $active ? 'true' : 'false');

            while ($title->firstChild) {
                $trigger->appendChild($title->firstChild);
            }

            $title->appendChild($trigger);

            // Description: everything else in the item, inside a collapsible panel
            $panel = $element('div', 'bee-ts-panel');
            $panel->setAttribute('id', $tabId . '-panel');
            $panel->setAttribute('role', 'region');
            $panel->setAttribute('aria-labelledby', $tabId);
            $panel->setAttribute('aria-hidden', $active ? 'false' : 'true');

            if (!$active) {
                $panel->setAttribute('inert', '');
            }

            $desc = $element('div', 'bee-ts-desc');

            foreach (iterator_to_array($item->childNodes) as $child) {
                if ($child !== $title && $child !== $icon) {
                    $desc->appendChild($child);
                }
            }

            $panel->appendChild($element('div', 'bee-ts-panel-inner'))->appendChild($desc);
            $item->appendChild($panel);

            $bar = $item->appendChild($element('span', 'bee-ts-bar'));
            $bar->setAttribute('aria-hidden', 'true');

            if ($active) {
                $addClass($item, 'is-active');
            }

            $tabIndex++;
        }

        if (!$tabIndex) {
            continue;
        }

        if (!$hasImages) {
            $media->parentNode->removeChild($media);
            $addClass($wrapper, 'bee-ts-no-media');
        }

        if (!preg_match('/(^|\s)content-(left|right)(\s|$)/', $wrapper->getAttribute('class'))) {
            $addClass($wrapper, 'content-left');
        }

        $delay = (int) $wrapper->getAttribute('data-interval') ?: $interval;
        $wrapper->setAttribute('style', trim('--bee-ts-duration: ' . max(1500, $delay) . 'ms; ' . $wrapper->getAttribute('style')));
        $wrapper->setAttribute('data-bee-ts', '');
        $sliders++;
    }

    if ($sliders) {
        foreach ($root->childNodes as $child) {
            $html .= $dom->saveHTML($child);
        }
    }
}

// No .bee-ts-wrapper with items in the content: render it like the default layout
if (!$sliders) : ?>
<div id="<?php echo $modId; ?>" class="mod-custom custom">
    <?php echo $module->content; ?>
</div>
<?php return; endif;

if (!$wa->assetExists('style', 'bee.tab-slider')) {
    $wa->addInlineStyle(<<<'CSS'
.bee-ts-wrapper{--bee-ts-duration:6000ms;--bee-ts-accent:var(--bee-primary,#0d6efd);--bee-ts-line:var(--bee-border-color,#dee2e6);--bee-ts-ease:cubic-bezier(.22,.61,.36,1);display:grid;grid-template-columns:minmax(0,1fr) minmax(0,1.1fr);gap:clamp(2rem,6vw,6rem);align-items:center}
.bee-ts-wrapper.content-left .bee-ts-media{order:1}
.bee-ts-wrapper.content-right{grid-template-columns:minmax(0,1.1fr) minmax(0,1fr)}
.bee-ts-wrapper.content-right .bee-ts-media{order:-1}
.bee-ts-wrapper.bee-ts-no-media{grid-template-columns:minmax(0,1fr)}
.bee-ts-heading{margin-bottom:1.5rem}
.bee-ts-heading >:last-child{margin-bottom:0}
.bee-ts-item{position:relative;padding:1.75rem 0;border-bottom:1px solid var(--bee-ts-line)}
.bee-ts-item.has-icon{display:grid;grid-template-columns:auto minmax(0,1fr);column-gap:1.25rem;align-items:start}
.bee-ts-item.has-icon>.bee-ts-item-icon{grid-column:1;grid-row:1/span 2}
.bee-ts-item.has-icon>.bee-ts-title{grid-column:2;grid-row:1}
.bee-ts-item.has-icon>.bee-ts-panel{grid-column:2;grid-row:2}
.bee-ts-item-icon{display:inline-flex;align-items:center;justify-content:center;flex-shrink:0;width:3rem;height:3rem;border-radius:50%;font-size:1.25rem;line-height:1;color:var(--bee-ts-accent);background:rgba(var(--bee-primary-rgb,13,110,253),.1);cursor:pointer;transition:background-color .4s var(--bee-ts-ease),color .4s var(--bee-ts-ease)}
.bee-ts-item.is-active .bee-ts-item-icon{color:#fff;background:var(--bee-ts-accent)}
.bee-ts-bar{position:absolute;left:0;bottom:-1px;width:100%;height:2px;background:var(--bee-ts-accent);transform:scaleX(0);transform-origin:left center;pointer-events:none}
.bee-ts-item.is-active .bee-ts-bar.is-running{animation:bee-ts-progress var(--bee-ts-duration) linear forwards}
.bee-ts-wrapper.is-paused .bee-ts-bar{animation-play-state:paused!important}
.bee-ts-wrapper.is-single .bee-ts-bar{display:none}
@keyframes bee-ts-progress{from{transform:scaleX(0)}to{transform:scaleX(1)}}
.bee-ts-title{margin:0;font-size:clamp(1.5rem,1.1rem + 1.4vw,2.5rem);line-height:1.15}
.bee-ts-trigger{display:block;width:100%;padding:0;margin:0;border:0;background:none;font:inherit;line-height:inherit;color:inherit;text-align:left;cursor:pointer;opacity:.45;transition:opacity .4s var(--bee-ts-ease)}
.bee-ts-trigger:hover,.bee-ts-item.is-active .bee-ts-trigger{opacity:1}
.bee-ts-trigger:focus-visible{outline:2px solid var(--bee-ts-accent);outline-offset:4px;border-radius:2px}
.bee-ts-panel{display:grid;grid-template-rows:0fr;transition:grid-template-rows .6s var(--bee-ts-ease)}
.bee-ts-item.is-active .bee-ts-panel{grid-template-rows:1fr}
.bee-ts-panel-inner{min-height:0;overflow:hidden}
.bee-ts-desc{padding-top:1rem;font-size:1.125rem;opacity:0;transform:translateY(.5rem);transition:opacity .3s ease,transform .5s var(--bee-ts-ease)}
.bee-ts-item.is-active .bee-ts-desc{opacity:1;transform:none;transition-delay:.2s}
.bee-ts-desc>:last-child{margin-bottom:0}
.bee-ts-media{position:relative;aspect-ratio:5/5;border-radius:1.5rem;overflow:hidden;isolation:isolate;background:rgba(var(--bee-emphasis-color-rgb,0,0,0),.05)}
.bee-ts-slide{position:absolute;inset:0;margin:0;opacity:0;transform:scale(1.06);transition:opacity .9s ease,transform 1.6s var(--bee-ts-ease)}
.bee-ts-slide.is-active{z-index:1;opacity:1;transform:scale(1)}
.bee-ts-img{display:block;width:100%;height:100%;max-width:none;object-fit:cover}
@media (max-width:767.98px){.bee-ts-wrapper,.bee-ts-wrapper.content-right{grid-template-columns:minmax(0,1fr);gap:2rem}.bee-ts-wrapper .bee-ts-media,.bee-ts-wrapper.content-left .bee-ts-media{order:-1;aspect-ratio:4/3}.bee-ts-item{padding:1.25rem 0}.bee-ts-item.has-icon{column-gap:1rem}.bee-ts-item-icon{width:2.5rem;height:2.5rem;font-size:1rem}}
@media (prefers-reduced-motion:reduce){.bee-ts-panel,.bee-ts-desc,.bee-ts-slide,.bee-ts-trigger,.bee-ts-item-icon{transition-duration:.01ms!important;transition-delay:0s!important}.bee-ts-slide{transform:none}}
CSS, ['name' => 'bee.tab-slider']);

    $wa->addInlineScript(<<<'JS'
(() => {
  const init = (root) => {
    if (root.beeTs) return;
    root.beeTs = true;

    const items  = [...root.querySelectorAll('.bee-ts-item')].filter((item) => item.querySelector('.bee-ts-trigger'));
    const slides = [...root.querySelectorAll('.bee-ts-slide')];
    if (!items.length) return;

    const triggers = items.map((item) => item.querySelector('.bee-ts-trigger'));
    const panels   = items.map((item) => item.querySelector('.bee-ts-panel'));
    const bars     = items.map((item) => item.querySelector('.bee-ts-bar'));
    const pause    = { hover: false, focus: false, offscreen: false, hidden: document.hidden };
    let current    = Math.max(0, items.findIndex((item) => item.classList.contains('is-active')));

    if (items.length < 2) root.classList.add('is-single');

    const updatePause = () => root.classList.toggle('is-paused', Object.values(pause).some(Boolean));

    const go = (index) => {
      current = (index + items.length) % items.length;

      items.forEach((item, i) => {
        const on = i === current;
        item.classList.toggle('is-active', on);
        triggers[i].setAttribute('aria-expanded', on ? 'true' : 'false');
        panels[i].setAttribute('aria-hidden', on ? 'false' : 'true');
        panels[i].inert = !on;
        bars[i].classList.remove('is-running');
      });

      slides.forEach((slide, i) => {
        slide.classList.toggle('is-active', i === current);
        slide.setAttribute('aria-hidden', i === current ? 'false' : 'true');
      });

      // Restart the progress bar of the active tab
      if (items.length > 1) {
        void bars[current].offsetWidth;
        bars[current].classList.add('is-running');
      }
    };

    bars.forEach((bar, i) => bar.addEventListener('animationend', () => {
      if (i === current) go(current + 1);
    }));

    items.forEach((item, i) => item.querySelector(':scope > .bee-ts-item-icon')?.addEventListener('click', () => go(i)));

    triggers.forEach((trigger, i) => {
      trigger.addEventListener('click', () => go(i));
      trigger.addEventListener('keydown', (e) => {
        const step = { ArrowDown: 1, ArrowRight: 1, ArrowUp: -1, ArrowLeft: -1 }[e.key];
        if (e.key === 'Home' || e.key === 'End' || step) {
          e.preventDefault();
          const next = e.key === 'Home' ? 0 : e.key === 'End' ? items.length - 1 : (i + step + items.length) % items.length;
          go(next);
          triggers[next].focus();
        }
      });
    });

    // Pause while the user reads (hover / keyboard focus), when off-screen or the browser tab is hidden
    root.addEventListener('mouseenter', () => { pause.hover = true; updatePause(); });
    root.addEventListener('mouseleave', () => { pause.hover = false; updatePause(); });
    root.addEventListener('focusin', (e) => { try { pause.focus = e.target.matches(':focus-visible'); } catch (err) { pause.focus = false; } updatePause(); });
    root.addEventListener('focusout', (e) => { if (!root.contains(e.relatedTarget)) { pause.focus = false; updatePause(); } });
    document.addEventListener('visibilitychange', () => { pause.hidden = document.hidden; updatePause(); });

    if ('IntersectionObserver' in window) {
      new IntersectionObserver(([entry]) => { pause.offscreen = !entry.isIntersecting; updatePause(); }, { threshold: 0.25 }).observe(root);
    }

    updatePause();
    go(current);
  };

  const boot = () => document.querySelectorAll('[data-bee-ts]').forEach(init);
  document.readyState === 'loading' ? document.addEventListener('DOMContentLoaded', boot) : boot();
})();
JS, ['name' => 'bee.tab-slider']);
}

?>
<div id="<?php echo $modId; ?>" class="mod-custom custom">
    <?php echo $html; ?>
</div>
