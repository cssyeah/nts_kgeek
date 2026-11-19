<?php

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;

defined('_JEXEC') or die('Restricted access');

HTMLHelper::script('plugins/system/bee/media/vendor/vue/vue.global.min.js');
HTMLHelper::script('plugins/system/bee/media/js/bee-fields.js');

extract($displayData);

$language = [];

foreach ($baseGroups as $key => $group) {
    $language[$key] = Text::_($key);
}

foreach ($basePresets as $preset) {
    foreach ($preset['variables'] as $key => $_value) {
        $language[$key] = Text::_('TPL_BEE_COLOR' . strtoupper($key));
    }
}

$blocks = [];

foreach ($roleGroups as $group => $roleLabels) {
    $blocks[] = [
        'key' => $group,
        'label' => Text::_($group),
        'desc' => Text::_($group . '_DESC'),
        'roles' => $roleLabels,
    ];
}

$text = [
    'default' => Text::_('TPL_BEE_DEFAULT'),
    'auto' => Text::_('TPL_BEE_COLOR_AUTO'),
];
?>
<template id="<?php echo $id ?>-app-tpl">
    <textarea style="display: none;" name="<?php echo $name ?>">{{JSON.stringify(data)}}</textarea>
    <div class="bt-color-blocks">
    <div class="bt-color-block bt-color-block-preset">
    <div class="bt-color-block-head">
        <h3><?php echo Text::_('TPL_BEE_PRESET_COLORS'); ?></h3>
        <p><?php echo Text::_('TPL_BEE_PRESET_COLORS_DESC'); ?></p>
    </div>
    <div class="color-preset-head">
        <small><?php echo Text::_('TPL_BEE_RESET_COOKIE_KEY_DESC'); ?></small>
        <button type="button" @click="resetCookieKey"><?php echo Text::_('TPL_BEE_RESET_COOKIE_KEY'); ?></button>
    </div>
    <div class="color-preset-wrap">
        <div class="preset-list-sidebar">
            <div 
                class="preset-item"
                v-for="preset in presetList" 
                :class="{'active-preset': preset.name === activePreset, 'default-preset': preset.name === defaultPreset}" 
                :key="preset.name"
            >
                <div class="preset-name" @click="setActivePreset(preset.name)">
                    <h3>{{preset.name}}</h3>
                    <div v-if="baseKeys.indexOf(preset.name) !== -1"><i class="fa fa-lock"></i></div>
                </div>
                <div class="preset-set-default">
                    <input 
                        type="radio" 
                        :id="`preset-default-${preset.name}`" 
                        :value="preset.name"
                        :checked = "preset.name === defaultPreset"
                        @change="setDefaultPreset(preset.name)"
                    >
                    <label :for="`preset-default-${preset.name}`"><?php echo Text::_('TPL_BEE_DEFAULT'); ?></label>
                </div>
                <div class="preset-actions">
                    <button type="button" @click="clonePreset(preset)" class="btn btn-primary"><i class="fa fa-copy"></i><span><?php echo Text::_('TPL_BEE_COPY'); ?></span></button>
                    <button 
                        type="button" 
                        :disabled="baseKeys.indexOf(preset.name) !== -1 || preset.name === defaultPreset"
                        @click="deletePreset(preset)" class="btn btn-danger"
                    ><i class="fa fa-trash"></i><span><?php echo Text::_('TPL_BEE_DELETE'); ?></span></button>
                </div>
            </div>
            <div class="add-new-preset" v-if="!showNewPresetNameInput">
                <button type="button" @click="toggleNameInput(true)" class="btn btn-success"><i class="fas fa-plus"></i><span><?php echo Text::_('TPL_BEE_ADD_NEW'); ?></span></button>
            </div>
            <div v-if="showNewPresetNameInput" class="preset-item preset-add-new">
                <input class="new-preset-name-input" type="text" v-model="newPresetName">
                <div class="preset-actions">
                    <button type="button" @click="saveNewPreset" class="btn btn-success"><i class="fas fa-save"></i><span><?php echo Text::_('TPL_BEE_SAVE'); ?></span></button>
                    <button type="button" @click="toggleNameInput(false)" class="btn btn-danger"><i class="fas fa-times"></i><span><?php echo Text::_('TPL_BEE_CANCEL'); ?></span></button>
                </div>
            </div>
        </div>
        <div class="preset-details">
            <template v-for="preset in presetList" :key="preset.name">
                <template v-if="preset.name === activePreset">
                    <div class="preset-head">
                        <h3>
                            <span class="preset-name">
                                <span v-if="!showEditNameInput">{{preset.name}}</span>
                                <button type="button" v-if="!showEditNameInput" @click="toggleEditNameInput(true)" :disabled="baseKeys.indexOf(preset.name) !== -1" class="btn btn-secondary"><i class="fas fa-pen"></i><?php echo Text::_('TPL_BEE_EDIT'); ?></button>
                            </span>
                            <span class="preset-edit">
                                <input class="temp-preset-name-input" type="text" v-if="showEditNameInput" v-model="tempPresetName">
                                <button type="button" v-if="showEditNameInput" @click="saveEditPresetName(preset)"><?php echo Text::_('TPL_BEE_SAVE'); ?></button>
                                <button type="button" v-if="showEditNameInput" @click="toggleEditNameInput(false)"><?php echo Text::_('TPL_BEE_CANCEL'); ?></button>
                            </span>
                        </h3>
                        <button type="button" @click="resetPreset(preset)" class="btn btn-reset"><i class="fas fa-history"></i><?php echo Text::_('TPL_BEE_RESET_COLORS'); ?></button>
                    </div>
                    <div class="color-wrap">
                        <div v-for="(group, gKey) in variableGroups" :key="gKey">
                            <div class="bt-spacer"><span>{{getLanguage(gKey)}}</span></div>
                            <div v-for="(varValue, varKey) in group" :key="varKey">
                                <input
                                    v-if="isLabelToken(varKey)"
                                    type="text"
                                    class="color-label color-label-input"
                                    maxlength="50"
                                    :data-css-var="varKey"
                                    :value="data.labels[varKey] || ''"
                                    :placeholder="language[varKey] || varKey"
                                    :title="<?php echo htmlspecialchars(json_encode(Text::_('TPL_BEE_COLOR_LABEL_EDIT')), ENT_QUOTES) ?>"
                                    @change="event => setLabel(varKey, event.target.value)"
                                >
                                <div v-else class="color-label" :data-css-var="varKey">{{getLanguage(varKey)}}</div>
                                <div class="color-value">
                                    <bt-color-picker :value="varValue" @change="value => setColor(preset.name, varKey, value)"></bt-color-picker>
                                    <input type="text" :value="varValue" @change="event => setColor(preset.name, varKey, event.target.value)">
                                </div>
                            </div>
                        </div>
                    </div>
                </template>
            </template>
        </div>
    </div>
    </div>

    <div class="bt-color-block" v-for="block in blocks" :key="block.key" :class="`bt-color-block-${block.key.toLowerCase().replace(/_/g, '-')}`">
        <div class="bt-color-block-head">
            <h3>{{block.label}}</h3>
            <p v-if="block.desc">{{block.desc}}</p>
        </div>
        <div class="bt-typo-grid">
            <div class="bt-typo-row" v-for="(label, role) in block.roles" :key="role">
                <label class="bt-typo-label" :data-css-var="role">{{label}}</label>
                <bt-color-select v-model="data.roles[role]" :groups="palette" :empty-text="defaultText(role)"></bt-color-select>
            </div>
        </div>
    </div>
    </div>
</template>
<template id="<?php echo $id ?>-picker-tpl">
    <div class="bt-picker" :class="{'is-open': open}" ref="root">
        <button
            type="button"
            class="bt-picker-swatch"
            :style="{background: current}"
            :aria-expanded="open"
            @click="toggle"
        ></button>
        <div v-if="open" class="bt-picker-panel" :class="{'is-above': above, 'is-right': right}" ref="panel">
            <div
                class="bt-picker-sv"
                tabindex="0"
                :style="{backgroundColor: hueColor}"
                @pointerdown="event => startDrag(event, 'sv')"
                @keydown="keySv"
            >
                <div class="bt-picker-thumb" :style="{left: (hsv.s * 100) + '%', top: ((1 - hsv.v) * 100) + '%', background: current}"></div>
            </div>
            <div
                class="bt-picker-hue"
                tabindex="0"
                @pointerdown="event => startDrag(event, 'hue')"
                @keydown="keyHue"
            >
                <div class="bt-picker-thumb" :style="{left: (hsv.h / 360 * 100) + '%', background: hueColor}"></div>
            </div>
        </div>
    </div>
</template>
<div id="<?php echo $id ?>-app"></div>
<script>
    (() => {
        const {
            createApp,
            ref,
            watch,
            computed,
            nextTick,
            onBeforeUnmount,
        } = Vue;

        // Color picker whose panel opens right below (or above) its swatch
        const ColorPicker = {
            props: {
                value: {type: String, default: '#000000'},
            },
            emits: ['change'],
            template: '#<?php echo $id ?>-picker-tpl',
            setup(props, {emit}) {
                const root = ref(null);
                const panel = ref(null);
                const open = ref(false);
                const above = ref(false);
                const right = ref(false);
                const hsv = ref(hexToHsv(props.value, 0));
                let dragging = false;

                const current = computed(() => hsvToHex(hsv.value));
                const hueColor = computed(() => hsvToHex({h: hsv.value.h, s: 1, v: 1}));

                watch(() => props.value, value => {
                    if (!dragging && value !== current.value) {
                        hsv.value = hexToHsv(value, hsv.value.h);
                    }
                });

                function hexToHsv(hex, fallbackHue) {
                    const m = /^#?([a-f\d]{6})$/i.exec(hex || '');

                    if (!m) {
                        return {h: fallbackHue, s: 0, v: 0};
                    }

                    const n = parseInt(m[1], 16);
                    const r = (n >> 16 & 255) / 255;
                    const g = (n >> 8 & 255) / 255;
                    const b = (n & 255) / 255;
                    const max = Math.max(r, g, b);
                    const d = max - Math.min(r, g, b);
                    let h = fallbackHue;

                    if (d) {
                        if (max === r) {
                            h = ((g - b) / d + 6) % 6;
                        } else if (max === g) {
                            h = (b - r) / d + 2;
                        } else {
                            h = (r - g) / d + 4;
                        }

                        h *= 60;
                    }

                    return {h, s: max ? d / max : 0, v: max};
                }

                function hsvToHex({h, s, v}) {
                    const f = n => {
                        const k = (n + h / 60) % 6;

                        return v - v * s * Math.max(0, Math.min(k, 4 - k, 1));
                    };

                    return '#' + [f(5), f(3), f(1)]
                        .map(c => Math.round(c * 255).toString(16).padStart(2, '0'))
                        .join('');
                }

                function clamp(n) {
                    return Math.min(1, Math.max(0, n));
                }

                function commit() {
                    if (current.value !== props.value) {
                        emit('change', current.value);
                    }
                }

                // Open below the swatch, flip above / align right when there is no room
                function place() {
                    const rect = root.value.getBoundingClientRect();
                    const box = panel.value.getBoundingClientRect();
                    const gap = 8;

                    above.value = window.innerHeight - rect.bottom < box.height + gap && rect.top > box.height + gap;
                    right.value = rect.left + box.width > document.documentElement.clientWidth - gap;
                }

                function toggle() {
                    open.value ? close() : show();
                }

                function show() {
                    above.value = false;
                    right.value = false;
                    open.value = true;

                    nextTick(place);
                    document.addEventListener('pointerdown', onOutside, true);
                    document.addEventListener('keydown', onEscape);
                }

                function close() {
                    open.value = false;

                    document.removeEventListener('pointerdown', onOutside, true);
                    document.removeEventListener('keydown', onEscape);
                }

                function onOutside(event) {
                    if (!root.value.contains(event.target)) {
                        close();
                    }
                }

                function onEscape(event) {
                    if (event.key === 'Escape') {
                        close();
                    }
                }

                function update(event, area) {
                    const rect = area.el.getBoundingClientRect();
                    const x = clamp((event.clientX - rect.left) / rect.width);

                    if (area.type === 'hue') {
                        hsv.value = {...hsv.value, h: x * 359.99};
                    } else {
                        hsv.value = {...hsv.value, s: x, v: 1 - clamp((event.clientY - rect.top) / rect.height)};
                    }
                }

                // Preview while dragging, save the color on release
                function startDrag(event, type) {
                    const area = {el: event.currentTarget, type};

                    event.preventDefault();
                    area.el.focus();
                    dragging = true;
                    update(event, area);

                    const move = e => update(e, area);
                    const end = () => {
                        dragging = false;
                        commit();

                        window.removeEventListener('pointermove', move);
                        window.removeEventListener('pointerup', end);
                    };

                    window.addEventListener('pointermove', move);
                    window.addEventListener('pointerup', end);
                }

                function keySv(event) {
                    const step = event.shiftKey ? .1 : .01;
                    const moves = {
                        ArrowLeft: ['s', -step],
                        ArrowRight: ['s', step],
                        ArrowUp: ['v', step],
                        ArrowDown: ['v', -step],
                    };
                    const move = moves[event.key];

                    if (move) {
                        event.preventDefault();
                        hsv.value = {...hsv.value, [move[0]]: clamp(hsv.value[move[0]] + move[1])};
                        commit();
                    }
                }

                function keyHue(event) {
                    const step = event.shiftKey ? 10 : 1;
                    const delta = {ArrowLeft: -step, ArrowRight: step}[event.key];

                    if (delta) {
                        event.preventDefault();
                        hsv.value = {...hsv.value, h: Math.min(359.99, Math.max(0, hsv.value.h + delta))};
                        commit();
                    }
                }

                onBeforeUnmount(close);

                return {
                    root,
                    panel,
                    open,
                    above,
                    right,
                    hsv,
                    current,
                    hueColor,
                    toggle,
                    startDrag,
                    keySv,
                    keyHue,
                };
            },
        };

        function setup() {
            const sessionAtivePresetKey = location.pathname + location.search + '-bt-color-active-preset'
            const sessionActivePreset = sessionStorage.getItem(sessionAtivePresetKey);
            const newPresetName = ref('');
            const showNewPresetNameInput = ref(false);
            const showEditNameInput = ref(false);
            const language = <?php echo json_encode($language) ?>;
            const baseGroups = <?php echo json_encode($baseGroups) ?>;
            const basePresets = <?php echo json_encode($basePresets) ?>;
            const baseKeys = basePresets.map(p => p.name);
            const firstBasePreset = basePresets[0];
            const firstBaseKey = firstBasePreset.name;
            const roles = <?php echo json_encode($roles) ?>;
            const blocks = <?php echo json_encode($blocks) ?>;
            const labelTokens = <?php echo json_encode($labelTokens) ?>;
            const text = <?php echo json_encode($text) ?>;
            const raw = <?php echo json_encode($value) ?>;

            // Registry turns empty objects into arrays
            ['labels', 'roles'].forEach(key => {
                if (!raw[key] || Array.isArray(raw[key])) {
                    raw[key] = {};
                }
            });

            const data = ref(raw);

            syncBasePresets();

            if (!data.value.default) {
                setDefaultPreset(firstBaseKey);
            }

            if (!data.value.cookieKey) {
                data.value.cookieKey = getCookieKey();
            }

            const presetList = computed(() => {
                return data.value.presets;
            })

            const presetKeys = computed(() => {
                return data.value.presets.map(p => p.name);
            })

            const activePreset = ref(presetKeys.value.indexOf(sessionActivePreset) !== -1 ? sessionActivePreset : firstBaseKey);

            const defaultPreset = computed(() => {
                return data.value.default;
            })

            const variableGroups = computed(() => {
                const preset = presetList.value.find(p => p.name === activePreset.value);
                const groups = JSON.parse(JSON.stringify(baseGroups));

                for (const key in groups) {
                    const group = groups[key];

                    for (const varKey in group) {
                        group[varKey] = preset.variables[varKey];
                    }
                }

                return groups;
            })

            function getCookieKey() {
                const array = new Uint32Array(1);
                window.crypto.getRandomValues(array);

                for (const num of array) {
                    return String(num);
                }
            }

            function syncBasePresets() {
                const presets = data.value.presets;
                const list = [];

                basePresets.forEach(preset => {
                    const saved = presets.find(p => p.name === preset.name) || {};
                    const variables = {
                        ...preset.variables,
                        ...saved.variables,
                    };

                    list.push({
                        name: preset.name,
                        variables,
                    })
                })

                presets.forEach(preset => {
                    if (baseKeys.indexOf(preset.name) !== -1) {
                        return;
                    }

                    list.push({
                        name: preset.name,
                        variables: {
                            ...firstBasePreset.variables,
                            ...preset.variables,
                        },
                    })
                })

                data.value.presets = list;
            }

            function setActivePreset(key) {
                activePreset.value = key;
                showEditNameInput.value = false;

                sessionStorage.setItem(sessionAtivePresetKey, key);
            }

            function setColor(name, varKey, value) {
                if (!/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/.test(value)) {
                    return alert(<?php echo json_encode(Text::_('TPL_BEE_ERROR_WRONG_COLOR_FORMAT')); ?>);
                }

                const matches = value.match(/^#([A-Fa-f0-9]{3})$/);

                if (matches) {
                    const shortForm = matches[1];
                    const frags = shortForm.split('');
                    const longForm = frags.map(f => f.repeat(2)).join('');

                    value = '#' + longForm;
                }

                const preset = data.value.presets.find(item => item.name === name);

                if (preset) {
                    preset.variables[varKey] = value;
                } else {
                    const newPreset = {
                        name: name,
                        variables: {
                        },
                    }

                    newPreset.variables[varKey] = value;

                    data.value.presets.push(newPreset);
                }
            }

            function getLanguage(variable) {
                return data.value.labels[variable] || language[variable] || variable;
            }

            function isLabelToken(variable) {
                return labelTokens.indexOf(variable) !== -1;
            }

            function setLabel(variable, value) {
                const label = value.trim();

                if (label) {
                    data.value.labels[variable] = label;
                } else {
                    delete data.value.labels[variable];
                }
            }

            // Palette of the page colors / elements dropdowns, following the custom labels
            const palette = computed(() => Object.keys(baseGroups).map(group => ({
                label: getLanguage(group),
                options: Object.keys(baseGroups[group]).map(variable => ({
                    value: variable,
                    text: getLanguage(variable),
                })),
            })));

            function defaultText(role) {
                const token = roles[role];

                return token ? `${text.default}: ${getLanguage(token)}` : text.auto;
            }

            function clonePreset(preset) {
                const key = preset.name;
                const str = generateCloneName(key);
                const name = str.trim().replaceAll(' ', '+');

                if (!validatePresetName(name)) {
                    return;
                }

                const presets = data.value.presets;
                const newPreset = {
                    name: name,
                    variables: {
                        ...preset.variables,
                    },
                };

                presets.push(newPreset);

                setActivePreset(name);
            }

            function saveNewPreset() {
                const str = newPresetName.value;
                const name = str.trim().replaceAll(' ', '+');

                if (!validatePresetName(name)) {
                    return;
                }

                const presets = data.value.presets;
                const newPreset = {
                    name: name,
                    variables: {
                        ...firstBasePreset.variables,
                    },
                };

                presets.push(newPreset);

                setActivePreset(name);

                newPresetName.value = '';
                showNewPresetNameInput.value = false;
            }

            function generateCloneName(name) {
                let result = `${name}-1`;
                let next = 1;
                let base = name;
                const matches = name.match(/-(\d+)$/);

                if (matches) {
                    base = name.slice(0, matches.index);

                    next = +matches[1] + 1;
                    result = `${base}-${next}`;
                }

                while (presetKeys.value.indexOf(result) !== -1) {
                    next++;

                    result = `${base}-${next}`;
                }

                return result;
            }

            function validatePresetName(name) {
                if (!name) {
                    alert(<?php echo json_encode(Text::_('TPL_BEE_ERROR_EMPTY_PRESET_NAME')); ?>);
                    return false;
                }

                if (!/^[a-zA-Z\d\-\+]*$/.test(name)) {
                    alert(<?php echo json_encode(Text::_('TPL_BEE_ERROR_INVALID_PRESET_NAME')); ?>);
                    return false
                }

                const presets = data.value.presets;

                if (presets.find(item => item.name === name)) {
                    alert(<?php echo json_encode(Text::_('TPL_BEE_ERROR_PRESET_NAME_EXISTS')); ?>);
                    return;
                }

                return true;
            }

            function deletePreset(preset) {
                const {name} = preset;
                const ok = confirm(<?php echo json_encode(Text::_('TPL_BEE_CONFIRM_DELETE_PRESET')); ?>.replace('%s', name));

                if (!ok) {
                    return;
                }

                const idx = data.value.presets.findIndex(item => item.name === name);

                data.value.presets.splice(idx, 1);

                if (name === activePreset.value) {
                    setActivePreset(firstBaseKey);
                }
            }

            function setDefaultPreset(name) {
                data.value.default = name;
            }

            function toggleNameInput(state) {
                showNewPresetNameInput.value = state;

                if (state) {
                    nextTick(() => {
                        document.querySelector('.new-preset-name-input').focus();
                    });
                } else {
                    newPresetName.value = '';
                }
            }

            function resetPreset(preset) {
                const basePreset = basePresets.find(p => p.name === preset.name);

                if (basePreset) {
                    preset.variables = {
                        ...basePreset.variables,
                    };
                } else {
                    preset.variables = {
                        ...firstBasePreset.variables,
                    }
                }
            }

            const tempPresetName = ref('');

            function toggleEditNameInput(state) {
                showEditNameInput.value = state;

                if (state) {
                    tempPresetName.value = activePreset.value;

                    nextTick(() => {
                        document.querySelector('.temp-preset-name-input').focus();
                    })
                } else {
                    tempPresetName.value = '';
                }
            }

            function saveEditPresetName(preset) {
                const str = tempPresetName.value;
                const name = str.trim().replaceAll(' ', '+');

                if (preset.name === name) {
                    toggleEditNameInput();
                    return;
                }

                if (!validatePresetName(name)) {
                    return;
                }

                const oldName = preset.name;

                if (oldName === defaultPreset.value) {
                    setDefaultPreset(tempPresetName.value);
                }

                preset.name = tempPresetName.value;
                setActivePreset(tempPresetName.value);
            }

            function resetCookieKey() {
                const ok = confirm(<?php echo json_encode(Text::_('TPL_BEE_CONFIRM_RESET_COOKIE_KEY')); ?>);

                if (!ok) {
                    return;
                }

                data.value.cookieKey = getCookieKey();

                nextTick(() => {
                    Joomla.submitform('style.apply', document.adminForm);
                })
            }

            return {
                baseKeys,
                data,
                presetList,
                activePreset,
                defaultPreset,
                setActivePreset,
                setDefaultPreset,
                setColor,
                getLanguage,
                clonePreset,
                deletePreset,
                showNewPresetNameInput,
                toggleNameInput,
                newPresetName,
                saveNewPreset,
                resetPreset,
                showEditNameInput,
                toggleEditNameInput,
                saveEditPresetName,
                tempPresetName,
                variableGroups,
                resetCookieKey,
                language,
                isLabelToken,
                setLabel,
                blocks,
                palette,
                defaultText,
            }
        }

        const app = createApp({
            setup,
            template: '#<?php echo $id ?>-app-tpl',
            name: '<?php echo $fieldname ?>',
        });

        app.component('bt-color-picker', ColorPicker);
        app.component('bt-color-select', BeeFields.ColorSelect);
        app.mount('#<?php echo $id ?>-app');
    })()
</script>
