/**
 * @package     Bee Framework
 *
 * @copyright   (C) 2023 Bee Framework. <https://beetemplate.com>
 * @license     GNU General Public License version 2 or later;
 */

(() => {
  let showTimer = 0;
  const mobileBreakpoint = +Joomla.getOptions('bee_mobile_menu_breakpoint');
  const menuTrigger = Joomla.getOptions('bee_menu_trigger') || 'hover';

  document.querySelectorAll('.bt-menu > .bt-nav').forEach($el => {
    initMenu($el);
  })

  if (useClickTrigger() && !isMobileScreen()) {
    document.addEventListener('click', event => {
      const $target = event.target;

      if ($target.classList.contains('bt-menu-caret')) {
        return;
      }

      const $level0 = event.target.closest('.bt-menu-item.level0');

      hideOtherDropdowns($level0);
    })
  }

  function isMobileScreen() {
    const htmlWidth = document.querySelector('html').clientWidth;

    return mobileBreakpoint > htmlWidth;
  }

  function isTouchDevice() {
    return (('ontouchstart' in window) ||
      (navigator.maxTouchPoints > 0) ||
      (navigator.msMaxTouchPoints > 0));
  }

  // Click when configured, or when hover is configured but the device has no hover-capable pointer
  function useClickTrigger() {
    if (menuTrigger === 'click') {
      return true;
    }

    if (window.matchMedia) {
      return !window.matchMedia('(hover: hover)').matches;
    }

    return isTouchDevice();
  }

  function updateMobileMenu($el) {
    const $menu = $el.closest('.bt-menu-wrapper');

    if (isMobileScreen()) {
      $menu.classList.add('bt-menu-mobile');
    } else {
      $menu.classList.remove('bt-menu-mobile');
    }
  }

  function initMenu($el) {
    updateMobileMenu($el);
    window.addEventListener('resize', () => updateMobileMenu($el));

    initMenuToggleButton($el);

    $el.querySelectorAll(':scope > .deeper').forEach($item => {
      intDropdownMainMenu($item);
    })
  }

  function initMenuToggleButton($el) {
    if (!isMobileScreen()) {
      return;
    }

    const $container = $el.parentElement;
    const $btn = document.querySelector('.bt-menu-toggle-btn');

    let working = false;

    if (!$btn) {
      return;
    }

    $container.addEventListener('transitionend', () => {
      if (!working) {
        return;
      }

      if ($container.classList.contains('bt-dropdown-opened')) {
        $container.classList.remove('bt-dropdown-opened');
      } else {
        $container.classList.add('bt-dropdown-opened');
      }

      $container.classList.remove('bt-dropdown-ready');

      css($container, {
        'height': '',
      });

      working = false;
    })

    $btn.addEventListener('click', () => {
      if (working) {
        return;
      }

      working = true;

      $container.classList.add('bt-dropdown-ready');

      const menuHeight = $el.offsetHeight;

      css($container, {
        'height': menuHeight + 'px',
      });

      if ($container.classList.contains('bt-dropdown-opened')) {
        setTimeout(() => {
          css($container, {
            'height': '0px',
          });
        });
      }
    })
  }

  function intDropdownMainMenu($el) {
    const $link = $el.querySelector(':scope > a');
    const $dropdown = $el.querySelector(':scope > .bt-menu-sub');

    if (useClickTrigger()) {
      $link.addEventListener('click', event => {
        if ($dropdown.classList.contains('bt-show')) {
          hideDropdown($dropdown);
          return;
        }

        event.stopPropagation();
        event.preventDefault();

        const $currentMain = $dropdown.closest('.bt-menu-item.level0');

        if (!isMobileScreen()) {
          hideOtherDropdowns($currentMain);
        }

        showDropdown($dropdown);
      })
    } else {
      $el.addEventListener('mouseenter', () => {
        showDropdown($dropdown);
      })

      $el.addEventListener('mouseleave', () => {
        hideDropdown($dropdown);
      })
    }

    $el.querySelectorAll('.bt-menu-item.deeper').forEach($deeperSubmenu => {
      initDeeperDropdownMenu($deeperSubmenu);
    })
  }

  function hideOtherDropdowns($current) {
    document.querySelectorAll('.bt-menu-item.level0').forEach($el => {
      if ($current && $current.isSameNode($el)) {
        return;
      }

      $el.querySelectorAll('.bt-ready.bt-show').forEach($sub => {
        $sub.classList.remove('bt-ready', 'bt-show');
      });

      $el.querySelectorAll('.bt-parent-active').forEach($item => {
        $item.classList.remove('bt-parent-active');
      })
    })
  }

  function initDeeperDropdownMenu($el) {
    const $link = $el.querySelector(':scope > a');
    const $dropdown = $el.querySelector(':scope > .bt-menu-sub');

    if (useClickTrigger()) {
      $link.addEventListener('click', event => {
        if ($dropdown.classList.contains('bt-show')) {
          hideDropdown($dropdown);
          return;
        }

        event.stopPropagation();
        event.preventDefault();

        if (!isMobileScreen()) {
          hideOtherDeeperDropdowns($el);
        }

        showDeeperDropdown($dropdown);
      })
    } else {
      $el.addEventListener('mouseenter', () => {
        showDeeperDropdown($dropdown);
      })

      $el.addEventListener('mouseleave', () => {
        hideDropdown($dropdown);
      })
    }
  }

  function hideOtherDeeperDropdowns($item) {
    const $parent = $item.parentElement;

    for (let i = 0; i < $parent.children.length; i++) {
      const $child = $parent.children[i];

      if ($item.isSameNode($child)) {
        continue;
      }

      $child.querySelectorAll('.bt-ready.bt-show').forEach($sub => {
        $sub.classList.remove('bt-ready', 'bt-show');
      });

      $child.classList.remove('bt-parent-active');
    }
  }

  function showDeeperDropdown($dropdown) {
    const htmlWidth = document.querySelector('html').clientWidth;
    const $parent = $dropdown.parentElement;

    $parent.classList.add('bt-parent-active');
    $dropdown.classList.add('bt-ready');

    css($dropdown, {
      top: '0',
      left: $parent.offsetWidth + 'px',
    });

    const bounding = $dropdown.getBoundingClientRect();
    const maxWindowWidth = htmlWidth - 40;

    if (bounding.right > maxWindowWidth || $dropdown.closest('.bt-deeper-right')) {
      css($dropdown, {
        left: '-' + $dropdown.offsetWidth + 'px',
      });

      $dropdown.classList.add('bt-deeper-right');
    }

    showTimer = setTimeout(() => {
      $dropdown.classList.add('bt-show');
    }, 10);
  }

  function showDropdown($dropdown) {
    const margin = 20;
    const htmlWidth = document.querySelector('html').clientWidth;
    const $parent = $dropdown.parentElement;
    const parentBouding = $parent.getBoundingClientRect();
    const top = $parent.offsetHeight;

    $dropdown.classList.add('bt-ready');

    const maxDropdownWidth = htmlWidth - margin * 2;

    if ($dropdown.offsetWidth > maxDropdownWidth) {
      css($dropdown, {
        width: maxDropdownWidth + 'px',
      });
    }

    css($dropdown, {
      top: top + 'px',
    });

    if ($dropdown.classList.contains('bt-mega-fluid')) {
      css($dropdown, {
        width: htmlWidth + 'px',
        left: `-${parentBouding.x}px`
      })
    } else {
      if ($dropdown.classList.contains('bt-menu-mega-wrapper')) {
        const left = $dropdown.offsetWidth / 2 - $parent.offsetWidth / 2;

        css($dropdown, {
          left: '-' + left + 'px',
        });
      } else {
        css($dropdown, {
          left: 0,
        });
      }

      const bounding = $dropdown.getBoundingClientRect();
      const maxWindowWidth = htmlWidth - margin;

      if (bounding.right > maxWindowWidth) {
        const spacer = bounding.right - maxWindowWidth;
        const targetX = bounding.x - spacer;
        const finalLeft = -(parentBouding.x - targetX);

        css($dropdown, {
          left: finalLeft + 'px',
        });
      } else if (bounding.x < margin) {
        const finalLeft = parentBouding.x > margin
          ? -(parentBouding.x - margin)
          : margin - parentBouding.x;

        css($dropdown, {
          left: finalLeft + 'px',
        });
      }
    }

    showTimer = setTimeout(() => {
      $dropdown.classList.add('bt-show');
    }, 10);
  }

  function hideDropdown($dropdown) {
    clearTimeout(showTimer);
    $dropdown.classList.remove('bt-ready', 'bt-show');
  }

  function css($el, data) {
    for (const key in data) {
      $el.style.setProperty(key, data[key]);
    }
  }
})();

(() => {
  const body = document.querySelector('body');

  if (!body.hasAttribute('data-bt-onepage')) {
    return;
  }

  const $menuItems = document.querySelectorAll('.bt-menu-item.level0')
  const sections = []

  $menuItems.forEach($item => {
    const href = $item.firstChild.getAttribute('href');

    if (!/^#.+/.test(href)) {
      return;
    }

    if (sections.includes(href)) {
      return;
    }

    if (document.querySelector(href)) {
      sections.push({
        id: href,
        el: document.querySelector(href),
      })
    }
  })

  let timer = 0;

  updateLinkActive()

  window.addEventListener('scroll', updateLinkActive)

  function updateLinkActive() {
    clearTimeout(timer);

    timer = setTimeout(() => {
      let activeSection;

      for (let i = 0; i < sections.length; i++) {
        const sec = sections[i];
        const $el = sec.el;
        const offsetTop = $el.offsetTop;
        const offsetBot = offsetTop + $el.offsetHeight;

        if (window.scrollY >= offsetTop && window.scrollY < offsetBot) {
          activeSection = sec;
          break;
        }
      }

      $menuItems.forEach($item => {
        if (!activeSection) {
          $item.classList.remove('onepage-active')
          return;
        }

        const $link = $item.firstChild;
        const _href = $link.getAttribute('href');

        if (_href === activeSection.id) {
          $item.classList.add('onepage-active')
        } else {
          $item.classList.remove('onepage-active')
        }
      })
    }, 100);
  }
})();