/**
 * NTS KGeek - Top menu sliding background.
 *
 * A single background element sits under the active top-level menu item and
 * slides to whichever item is hovered (or focused), taking that item's exact
 * width and height. When the pointer leaves the menu it slides back to the
 * active item (or fades out if there is no active item).
 *
 * Only enabled on screens >= 992px ($screen-lg). Below that the menu keeps
 * its normal static styling.
 *
 * The color comes from the template setting "Navigation sliding background"
 * (CSS variable --kmenu-slider-bg).
 *
 * Kept as a separate file so Kunena core script updates do not overwrite it.
 */
(function () {
	'use strict';

	var SELECTOR = '#ktopmenu > .navbar-nav';
	var MEDIA = '(min-width: 992px)';

	function initMenu(nav, mq) {
		if (nav.dataset.kmenuSlider) {
			return;
		}

		nav.dataset.kmenuSlider = '1';

		var items = Array.prototype.filter.call(nav.children, function (el) {
			return el.tagName === 'LI' && el.querySelector(':scope > a');
		});

		if (!items.length) {
			return;
		}

		var slider = null;
		var enabled = false;
		var activeItem = items.filter(function (li) {
			return li.classList.contains('active');
		})[0] || null;
		var currentItem = null;

		function moveTo(li) {
			if (!enabled) {
				return;
			}

			if (currentItem && currentItem !== li) {
				currentItem.classList.remove('kslider-on');
			}

			currentItem = li;

			if (!li) {
				slider.classList.remove('is-visible');
				return;
			}

			var link = li.querySelector(':scope > a');
			var navRect = nav.getBoundingClientRect();
			var linkRect = link.getBoundingClientRect();
			var x = linkRect.left - navRect.left - nav.clientLeft;
			var y = linkRect.top - navRect.top - nav.clientTop;

			slider.style.width = linkRect.width + 'px';
			slider.style.height = linkRect.height + 'px';
			slider.style.transform = 'translate(' + x + 'px, ' + y + 'px)';
			slider.classList.add('is-visible');
			li.classList.add('kslider-on');
		}

		function reset() {
			moveTo(activeItem);
		}

		// Reposition without animation (initial placement, resize, font load).
		function snap() {
			if (!enabled) {
				return;
			}

			nav.classList.remove('kmenu-slider-animate');
			moveTo(currentItem || activeItem);
			requestAnimationFrame(function () {
				requestAnimationFrame(function () {
					if (enabled) {
						nav.classList.add('kmenu-slider-animate');
					}
				});
			});
		}

		function enable() {
			if (enabled) {
				return;
			}

			enabled = true;

			if (!slider) {
				slider = document.createElement('span');
				slider.className = 'kmenu-slider';
				slider.setAttribute('aria-hidden', 'true');
			}

			nav.appendChild(slider);
			nav.classList.add('kmenu-slider-ready');
			currentItem = null;
			snap();
		}

		function disable() {
			if (!enabled) {
				return;
			}

			enabled = false;
			nav.classList.remove('kmenu-slider-ready', 'kmenu-slider-animate');
			items.forEach(function (li) {
				li.classList.remove('kslider-on');
			});

			if (slider && slider.parentNode) {
				slider.parentNode.removeChild(slider);
			}

			currentItem = null;
		}

		items.forEach(function (li) {
			li.addEventListener('mouseenter', function () {
				moveTo(li);
			});
			li.addEventListener('focusin', function () {
				moveTo(li);
			});
		});

		nav.addEventListener('mouseleave', reset);
		nav.addEventListener('focusout', function (e) {
			if (!nav.contains(e.relatedTarget)) {
				reset();
			}
		});

		// Keep size/position correct when the layout changes (resize, wrap).
		if ('ResizeObserver' in window) {
			new ResizeObserver(snap).observe(nav);
		} else {
			window.addEventListener('resize', snap);
		}

		if (document.fonts && document.fonts.ready) {
			document.fonts.ready.then(snap);
		}

		function onMediaChange() {
			if (mq.matches) {
				enable();
			} else {
				disable();
			}
		}

		if (mq.addEventListener) {
			mq.addEventListener('change', onMediaChange);
		} else if (mq.addListener) {
			mq.addListener(onMediaChange);
		}

		onMediaChange();
	}

	function init() {
		var mq = window.matchMedia(MEDIA);

		Array.prototype.forEach.call(document.querySelectorAll(SELECTOR), function (nav) {
			initMenu(nav, mq);
		});
	}

	if (document.readyState === 'loading') {
		document.addEventListener('DOMContentLoaded', init);
	} else {
		init();
	}
})();
