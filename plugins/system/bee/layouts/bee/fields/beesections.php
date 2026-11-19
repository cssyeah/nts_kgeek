<?php

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;

defined('_JEXEC') or die('Restricted access');

HTMLHelper::script('plugins/system/bee/media/vendor/vue/vue.global.min.js');
HTMLHelper::script('plugins/system/bee/media/js/bee-fields.js');

extract($displayData);

$containerLabels = [
    '' => Text::_('TPL_BEE_CONTAINER_DEFAULT'),
    'container' => Text::_('TPL_BEE_CONTAINER_FIX'),
    'container-fluid' => Text::_('TPL_BEE_CONTAINER_FLUID'),
    'container-full' => Text::_('TPL_BEE_CONTAINER_NONE'),
];
?>
<template id="<?php echo $id ?>-app-tpl">
    <textarea style="display: none;" name="<?php echo $name ?>">{{JSON.stringify(output)}}</textarea>
    <div class="bt-sections">
        <div class="bt-sections-head">
            <h3><?php echo Text::_('TPL_BEE_LAYOUT_SECTIONS'); ?> <small v-if="layout">{{layout}}</small></h3>
            <small><?php echo Text::_('TPL_BEE_LAYOUT_SECTIONS_DESC'); ?></small>
        </div>

        <div class="bt-sections-empty" v-if="!sections.length">
            <i><?php echo Text::_('TPL_BEE_NO_SECTION_FOUND'); ?></i>
        </div>

        <div class="bt-section" v-for="section in sections" :key="section.id || '-outside'" :class="{'bt-section-outside': !section.id}">
            <div class="bt-section-head">
                <div class="bt-section-id">
                    <template v-if="section.id">#{{section.id}}</template>
                    <template v-else><?php echo Text::_('TPL_BEE_POSITIONS_OUTSIDE_SECTIONS'); ?></template>
                </div>
                <div class="bt-section-summary" v-if="section.id && config[section.id]">
                    <span
                        v-for="key in colorKeys"
                        :key="key"
                        v-show="config[section.id][key]"
                        class="bt-color-swatch"
                        :title="colorTitles[key] + ': ' + config[section.id][key]"
                        :style="{background: swatch(config[section.id][key])}"
                    ></span>
                    <code v-if="config[section.id].container">.{{config[section.id].container}}</code>
                    <code v-if="config[section.id].class">.{{config[section.id].class.split(' ').join(' .')}}</code>
                </div>
                <button type="button" class="btn btn-sm btn-secondary" v-if="section.id" @click="openSettings(section.id)">
                    <i class="fas fa-cog"></i> <?php echo Text::_('TPL_BEE_SETTINGS'); ?>
                </button>
            </div>
            <div class="bt-section-body">
                <span class="bt-section-position" v-for="position in section.positions" :key="position">{{position}}</span>
                <i v-if="!section.positions.length"><?php echo Text::_('TPL_BEE_NO_POSITION'); ?></i>
            </div>
        </div>
    </div>

    <div class="bt-modal-backdrop" v-if="editing" @click.self="closeSettings">
        <div class="bt-modal" role="dialog" aria-modal="true">
            <div class="bt-modal-head">
                <h3><?php echo Text::_('TPL_BEE_SECTION_SETTINGS'); ?> <code>#{{editing}}</code></h3>
                <button type="button" class="btn-close" @click="closeSettings" aria-label="<?php echo Text::_('JCLOSE'); ?>"></button>
            </div>
            <div class="bt-modal-body">
                <div class="bt-typo-row" v-for="key in colorKeys" :key="key">
                    <label class="bt-typo-label">{{colorTitles[key]}}</label>
                    <bt-color-select v-model="form[key]" :groups="palette" empty-text="<?php echo Text::_('TPL_BEE_INHERIT'); ?>"></bt-color-select>
                </div>

                <hr>

                <div class="bt-typo-row">
                    <label class="bt-typo-label"><?php echo Text::_('TPL_BEE_CONTAINER_WIDTH'); ?></label>
                    <div class="bt-container-options">
                        <label v-for="(label, value) in containerLabels" :key="value" :class="{active: form.container === value}">
                            <input type="radio" :value="value" v-model="form.container">
                            <span>{{label}}</span>
                        </label>
                    </div>
                </div>

                <hr>

                <div class="bt-typo-row">
                    <label class="bt-typo-label" :for="'<?php echo $id ?>-extra-class'"><?php echo Text::_('TPL_BEE_EXTRA_CLASS'); ?></label>
                    <input type="text" class="form-control" :id="'<?php echo $id ?>-extra-class'" v-model="form.class" placeholder="my-section bg-image">
                </div>
            </div>
            <div class="bt-modal-foot">
                <button type="button" class="btn btn-danger" @click="resetSettings"><i class="fas fa-history"></i> <?php echo Text::_('TPL_BEE_RESET'); ?></button>
                <span class="flex-fill"></span>
                <button type="button" class="btn btn-secondary" @click="closeSettings"><?php echo Text::_('TPL_BEE_CANCEL'); ?></button>
                <button type="button" class="btn btn-success" @click="saveSettings"><i class="fas fa-check"></i> <?php echo Text::_('TPL_BEE_APPLY'); ?></button>
            </div>
        </div>
    </div>
</template>
<div id="<?php echo $id ?>-app"></div>
<script>
    (() => {
        const { createApp, ref, computed, onMounted, onBeforeUnmount } = Vue;
        const { ColorSelect, preset } = BeeFields;

        function setup() {
            const layouts = <?php echo json_encode((object) $layouts) ?>;
            const palette = <?php echo json_encode($palette) ?>;
            const containerLabels = <?php echo json_encode($containerLabels) ?>;
            const layoutFieldName = <?php echo json_encode($layoutFieldName) ?>;
            const config = ref(<?php echo json_encode($value) ?>);
            const colorKeys = ['bg', 'color', 'link', 'link_hover'];
            const colorTitles = {
                bg: <?php echo json_encode(Text::_('TPL_BEE_SECTION_BG_COLOR')); ?>,
                color: <?php echo json_encode(Text::_('TPL_BEE_SECTION_TEXT_COLOR')); ?>,
                link: <?php echo json_encode(Text::_('TPL_BEE_SECTION_LINK_COLOR')); ?>,
                link_hover: <?php echo json_encode(Text::_('TPL_BEE_SECTION_LINK_HOVER_COLOR')); ?>,
            };
            const emptyForm = () => ({bg: '', color: '', link: '', link_hover: '', container: '', class: ''});

            const layout = ref('');
            const editing = ref('');
            const form = ref(emptyForm());

            const layoutSelect = document.querySelector(`[name="${layoutFieldName}"]`);

            function syncLayout() {
                layout.value = layoutSelect ? layoutSelect.value : Object.keys(layouts)[0] || '';
            }

            syncLayout();

            const sections = computed(() => layouts[layout.value] || []);

            // Drop empty settings so the saved config only holds configured sections
            const output = computed(() => {
                const result = {};

                Object.keys(config.value).forEach(id => {
                    const settings = {};

                    Object.entries(config.value[id] || {}).forEach(([key, value]) => {
                        if (typeof value === 'string' && value.trim()) {
                            settings[key] = value.trim();
                        }
                    });

                    if (Object.keys(settings).length) {
                        result[id] = settings;
                    }
                });

                return result;
            });

            function swatch(token) {
                return preset.colors[token] || 'transparent';
            }

            function openSettings(id) {
                form.value = {...emptyForm(), ...(config.value[id] || {})};
                editing.value = id;
            }

            function closeSettings() {
                editing.value = '';
            }

            function saveSettings() {
                form.value.class = form.value.class.replace(/[^\w\- ]+/g, '').replace(/\s+/g, ' ').trim();
                config.value[editing.value] = {...form.value};
                closeSettings();
            }

            function resetSettings() {
                form.value = emptyForm();
            }

            function onKeydown(event) {
                if (event.key === 'Escape' && editing.value) {
                    closeSettings();
                }
            }

            onMounted(() => {
                if (layoutSelect) {
                    layoutSelect.addEventListener('change', syncLayout);
                }

                document.addEventListener('keydown', onKeydown);
            });

            onBeforeUnmount(() => {
                if (layoutSelect) {
                    layoutSelect.removeEventListener('change', syncLayout);
                }

                document.removeEventListener('keydown', onKeydown);
            });

            return {
                layout,
                sections,
                config,
                output,
                palette,
                colorKeys,
                colorTitles,
                containerLabels,
                editing,
                form,
                swatch,
                openSettings,
                closeSettings,
                saveSettings,
                resetSettings,
            };
        }

        const app = createApp({
            setup,
            template: '#<?php echo $id ?>-app-tpl',
            name: '<?php echo $fieldname ?>',
        });

        app.component('bt-color-select', ColorSelect);
        app.mount('#<?php echo $id ?>-app');
    })()
</script>
