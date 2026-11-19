/**
 * Shared Vue components of the Bee template fields (Colors, Typography, Layout sections).
 */
window.BeeFields = window.BeeFields || (() => {
  const {
    reactive, ref, computed, nextTick, onMounted, onBeforeUnmount,
  } = Vue;

  /**
   * Colors of the default preset, read live from the Colors tab so swatches follow unsaved edits.
   */
  const preset = reactive({ colors: {} });

  function readPresetColors() {
    const textarea = document.querySelector('textarea[name$="[color_preset]"]');

    if (!textarea) {
      return;
    }

    try {
      const data = JSON.parse(textarea.value);
      const presets = data.presets || [];
      const active = presets.find((p) => p.name === data.default) || presets[0];

      preset.colors = active ? { ...active.variables } : {};
    } catch (e) {
      // Colors tab not mounted yet
    }
  }

  readPresetColors();
  document.addEventListener('DOMContentLoaded', readPresetColors);
  setInterval(() => {
    if (!document.hidden) {
      readPresetColors();
    }
  }, 1000);

  /**
   * Palette color picker: a button showing the chosen color (swatch + name) which opens
   * a popup of the palette, grouped like the Colors tab. The chosen color is marked active.
   * groups: [{label, options: [{value, text}]}]
   */
  // Same as the max-height of .bt-color-popup
  const POPUP_MAX_HEIGHT = 420;

  const ColorSelect = {
    name: 'BtColorSelect',
    props: {
      modelValue: { type: String, default: '' },
      groups: { type: Array, default: () => [] },
      emptyText: { type: String, default: '' },
    },
    emits: ['update:modelValue'],
    setup(props, { emit }) {
      const open = ref(false);
      const alignRight = ref(false);
      const above = ref(false);
      const maxHeight = ref('');
      const root = ref(null);
      const popup = ref(null);

      const labels = computed(() => {
        const result = {};

        props.groups.forEach((group) => group.options.forEach((option) => { result[option.value] = option.text; }));

        return result;
      });

      const label = computed(() => (props.modelValue ? labels.value[props.modelValue] || props.modelValue : props.emptyText));

      function color(token) {
        return preset.colors[token] || 'transparent';
      }

      /**
       * Open below the toggle, or above it when there is not enough room below and more room above.
       * The popup height is limited to the room on the chosen side.
       */
      function place() {
        if (!root.value || !popup.value) {
          return;
        }

        const gap = 8;
        const rect = root.value.getBoundingClientRect();
        const height = Math.min(popup.value.scrollHeight, POPUP_MAX_HEIGHT);
        const below = window.innerHeight - rect.bottom - gap;
        const top = rect.top - gap;

        above.value = below < height && top > below;
        maxHeight.value = `${Math.max(Math.min(height, above.value ? top : below), 160)}px`;
      }

      function toggle() {
        if (!open.value && root.value) {
          // Open towards the left when the popup would overflow the viewport
          alignRight.value = root.value.getBoundingClientRect().left + 560 > window.innerWidth;
          above.value = false;
          maxHeight.value = '';
        }

        open.value = !open.value;

        if (open.value) {
          nextTick(place);
        }
      }

      function choose(value) {
        emit('update:modelValue', value);
        open.value = false;
      }

      function onDocumentClick(event) {
        if (root.value && !root.value.contains(event.target)) {
          open.value = false;
        }
      }

      function onKeydown(event) {
        if (event.key === 'Escape' && open.value) {
          event.stopPropagation();
          open.value = false;
        }
      }

      onMounted(() => document.addEventListener('mousedown', onDocumentClick));
      onBeforeUnmount(() => document.removeEventListener('mousedown', onDocumentClick));

      return {
        open, alignRight, above, maxHeight, root, popup, label, color, toggle, choose, onKeydown,
      };
    },
    template: `
      <div class="bt-color-select" :class="{ 'is-open': open, 'align-right': alignRight, 'is-above': above }" ref="root" @keydown="onKeydown">
        <button type="button" class="bt-color-toggle" :title="modelValue" :aria-expanded="open" @click="toggle">
          <span class="bt-color-swatch" :class="{ 'is-empty': !modelValue }" :style="{ background: color(modelValue) }"></span>
          <span class="bt-color-name" :class="{ 'is-empty': !modelValue }">{{ label }}</span>
          <i class="fas fa-chevron-down"></i>
        </button>
        <div class="bt-color-popup" v-if="open" role="listbox" ref="popup" :style="{ maxHeight }">
          <button type="button" class="bt-color-option bt-color-option-empty" :class="{ active: !modelValue }" @click="choose('')">
            <span class="bt-color-swatch is-empty"><i class="fas fa-check" v-if="!modelValue"></i></span>
            <span class="bt-color-option-name">{{ emptyText }}</span>
          </button>
          <div class="bt-color-group" v-for="group in groups" :key="group.label">
            <div class="bt-color-group-label">{{ group.label }}</div>
            <div class="bt-color-options">
              <button
                type="button"
                role="option"
                class="bt-color-option"
                v-for="option in group.options"
                :key="option.value"
                :class="{ active: option.value === modelValue }"
                :aria-selected="option.value === modelValue"
                :title="option.value"
                @click="choose(option.value)"
              >
                <span class="bt-color-swatch" :style="{ background: color(option.value) }"><i class="fas fa-check" v-if="option.value === modelValue"></i></span>
                <span class="bt-color-option-name">{{ option.text }}</span>
                <code>{{ option.value }}</code>
              </button>
            </div>
          </div>
        </div>
      </div>
    `,
  };

  let fontsCache;

  function getFonts() {
    if (!fontsCache) {
      fontsCache = Joomla.getOptions('googlefonts') || [];
    }

    return fontsCache;
  }

  function findFont(id) {
    return getFonts().find((f) => f.id === id);
  }

  /**
   * Font weights of a Google font (non italic variants), or the standard weights.
   */
  function getWeights(fontId) {
    const font = fontId && findFont(fontId);

    if (!font) {
      return ['100', '200', '300', '400', '500', '600', '700', '800', '900'];
    }

    const weights = font.variants
      .map((v) => (v === 'regular' ? '400' : v))
      .filter((v) => /^\d+$/.test(v));

    return [...new Set(weights)].sort((a, b) => a - b);
  }

  /**
   * Google font picker, value: {id, selected: [variants]}.
   */
  const FontPicker = {
    name: 'BtFontPicker',
    props: {
      modelValue: { type: Object, default: () => ({}) },
      uid: { type: String, required: true },
      text: { type: Object, default: () => ({}) },
    },
    emits: ['update:modelValue'],
    setup(props, { emit }) {
      const keyword = ref('');
      const boardShow = ref(false);

      const listFonts = computed(() => {
        const frags = keyword.value.trim().toLowerCase().split(' ').filter((str) => str);

        return getFonts()
          .filter((font) => {
            const family = font.family.toLowerCase();

            return frags.every((frag) => family.indexOf(frag) !== -1);
          })
          .slice(0, 20);
      });

      const picked = computed(() => (props.modelValue && props.modelValue.id ? findFont(props.modelValue.id) : null));
      const selected = computed(() => (props.modelValue && props.modelValue.selected) || []);

      function pickFont(font) {
        emit('update:modelValue', { id: font.id, selected: [] });
        keyword.value = '';
        boardShow.value = false;
      }

      function removeFont() {
        emit('update:modelValue', {});
      }

      function toggleVariant(variant, checked) {
        const list = selected.value.filter((v) => v !== variant);

        if (checked) {
          list.push(variant);
        }

        emit('update:modelValue', { ...props.modelValue, selected: list });
      }

      function onBlur(event) {
        if (!event.relatedTarget || !event.currentTarget.contains(event.relatedTarget)) {
          boardShow.value = false;
        }
      }

      return {
        keyword, boardShow, listFonts, picked, selected, pickFont, removeFont, toggleVariant, onBlur,
      };
    },
    template: `
      <div class="bt-font-picker">
        <div class="filter-board-container" @focusout="onBlur">
          <div class="filter-input-wrapper">
            <div class="font-selector-hint">{{ text.hint }}</div>
            <input type="text" :placeholder="text.placeholder" v-model="keyword" @focus="boardShow = true" />
          </div>
          <ul class="filter-board" style="max-height: 300px; overflow: auto;" v-if="boardShow">
            <li v-for="font in listFonts" :key="font.id">
              <div><span tabindex="-1" @mousedown.prevent="pickFont(font)">{{ font.family }}</span></div>
            </li>
          </ul>
        </div>
        <div class="picked-font" v-if="picked">
          <div class="active-font">
            <div class="font-name">
              <i class="fas fa-check-circle text-success"></i>
              <span>{{ picked.family }}</span>
              <span><button type="button" @click="removeFont" class="btn-remove-font"><i class="fa fa-times"></i> {{ text.remove }}</button></span>
            </div>
            <div class="font-variants" style="display: flex;">
              <div v-for="variant in picked.variants" :key="variant">
                <input
                  class="cb-variant"
                  type="checkbox"
                  :id="uid + '-' + picked.id + '-' + variant"
                  :checked="selected.indexOf(variant) !== -1"
                  @change="toggleVariant(variant, $event.target.checked)"
                >
                <label :for="uid + '-' + picked.id + '-' + variant">{{ variant }}</label>
              </div>
            </div>
          </div>
        </div>
      </div>
    `,
  };

  return {
    preset,
    readPresetColors,
    getWeights,
    ColorSelect,
    FontPicker,
  };
})();
