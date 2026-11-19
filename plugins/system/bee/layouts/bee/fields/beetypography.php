<?php

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;

defined('_JEXEC') or die('Restricted access');

HTMLHelper::script('plugins/system/bee/media/vendor/vue/vue.global.min.js');
HTMLHelper::script('plugins/system/bee/media/js/bee-fields.js');

extract($displayData);

$text = [
    'hint' => Text::_('TPL_BEE_FONT_SEARCH_HINT'),
    'placeholder' => Text::_('TPL_BEE_FONT_SEARCH_PLACEHOLDER'),
    'remove' => Text::_('TPL_BEE_REMOVE'),
    'inherit' => Text::_('TPL_BEE_INHERIT'),
    'default' => Text::_('TPL_BEE_DEFAULT'),
];
?>
<template id="<?php echo $id ?>-app-tpl">
    <textarea style="display: none;" name="<?php echo $name ?>">{{JSON.stringify(data)}}</textarea>
    <div class="bt-typography">
        <div class="bt-subtabs" role="tablist">
            <button
                type="button"
                role="tab"
                v-for="tab in tabs"
                :key="tab.key"
                :class="{active: activeTab === tab.key}"
                :aria-selected="activeTab === tab.key"
                @click="setTab(tab.key)"
            >{{tab.label}}</button>
        </div>

        <!-- Body -->
        <div class="bt-subtab-pane" v-show="activeTab === 'base'">
            <div class="bt-typo-grid">
                <div class="bt-typo-row bt-typo-row-full">
                    <label class="bt-typo-label" data-css-var="--bee-body-font-family"><?php echo Text::_('TPL_BEE_GOOGLE_FONT'); ?></label>
                    <bt-font-picker v-model="data.base.font" uid="<?php echo $id ?>-base" :text="text"></bt-font-picker>
                </div>
                <div class="bt-typo-row">
                    <label class="bt-typo-label" data-css-var="--bee-body-font-size"><?php echo Text::_('TPL_BEE_FONT_SIZE'); ?></label>
                    <input type="text" class="form-control" v-model.trim="data.base.size" placeholder="16px">
                </div>
                <div class="bt-typo-row">
                    <label class="bt-typo-label" data-css-var="--bee-body-font-weight"><?php echo Text::_('TPL_BEE_FONT_WEIGHT'); ?></label>
                    <select class="form-select" v-model="data.base.weight">
                        <option value="">{{text.default}}</option>
                        <option v-for="w in weights(data.base.font)" :key="w" :value="w">{{w}}</option>
                    </select>
                </div>
                <div class="bt-typo-row">
                    <label class="bt-typo-label" data-css-var="--bee-body-line-height"><?php echo Text::_('TPL_BEE_LINE_HEIGHT'); ?></label>
                    <input type="text" class="form-control" v-model.trim="data.base.line_height" placeholder="1.5">
                </div>
            </div>
        </div>

        <!-- Heading -->
        <div class="bt-subtab-pane" v-show="activeTab === 'headings'">
            <div class="bt-typo-grid">
                <div class="bt-typo-row bt-typo-row-full">
                    <label class="bt-typo-label" data-css-var="--bee-heading-font-family"><?php echo Text::_('TPL_BEE_GOOGLE_FONT'); ?></label>
                    <bt-font-picker v-model="data.headings.font" uid="<?php echo $id ?>-headings" :text="text"></bt-font-picker>
                </div>
                <div class="bt-typo-row">
                    <label class="bt-typo-label" data-css-var="--bee-heading-font-weight"><?php echo Text::_('TPL_BEE_FONT_WEIGHT'); ?></label>
                    <select class="form-select" v-model="data.headings.weight">
                        <option value="">{{text.default}}</option>
                        <option v-for="w in weights(data.headings.font, data.base.font)" :key="w" :value="w">{{w}}</option>
                    </select>
                </div>
                <div class="bt-typo-row">
                    <label class="bt-typo-label" data-css-var="--bee-heading-line-height"><?php echo Text::_('TPL_BEE_LINE_HEIGHT'); ?></label>
                    <input type="text" class="form-control" v-model.trim="data.headings.line_height" placeholder="1.2">
                </div>
            </div>

            <table class="table bt-heading-sizes">
                <thead>
                    <tr>
                        <th><?php echo Text::_('TPL_BEE_FONT_SIZE'); ?></th>
                        <th><i class="fas fa-desktop"></i> <?php echo Text::_('TPL_BEE_DESKTOP'); ?></th>
                        <th><i class="fas fa-tablet-alt"></i> <?php echo Text::_('TPL_BEE_TABLET'); ?></th>
                        <th><i class="fas fa-mobile-alt"></i> <?php echo Text::_('TPL_BEE_PHONE'); ?></th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="h in headings" :key="h">
                        <th>{{h.toUpperCase()}}</th>
                        <td v-for="size in sizeKeys" :key="size.key" :data-css-var="`--bee-${h}-fs${size.suffix}`">
                            <input type="text" class="form-control" v-model.trim="data.headings.sizes[h][size.key]" :placeholder="size.placeholder">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Menu fonts -->
        <div class="bt-subtab-pane" v-show="activeTab === 'nav'">
            <div class="bt-typo-grid">
                <div class="bt-typo-row bt-typo-row-full">
                    <label class="bt-typo-label" data-css-var="--bee-mainnav-font-family"><?php echo Text::_('TPL_BEE_FONT_FAMILY'); ?></label>
                    <bt-font-picker v-model="data.nav.font" uid="<?php echo $id ?>-nav" :text="text"></bt-font-picker>
                </div>
                <div class="bt-typo-row">
                    <label class="bt-typo-label" data-css-var="--bee-mainnav-fs"><?php echo Text::_('TPL_BEE_FONT_SIZE'); ?></label>
                    <input type="text" class="form-control" v-model.trim="data.nav.size" placeholder="16px">
                </div>
                <div class="bt-typo-row">
                    <label class="bt-typo-label" data-css-var="--bee-mainnav-fw"><?php echo Text::_('TPL_BEE_FONT_WEIGHT'); ?></label>
                    <select class="form-select" v-model="data.nav.weight">
                        <option value="">{{text.default}}</option>
                        <option v-for="w in weights(data.nav.font, data.base.font)" :key="w" :value="w">{{w}}</option>
                    </select>
                </div>
                <div class="bt-typo-row">
                    <label class="bt-typo-label" data-css-var="--bee-mainnav-lh"><?php echo Text::_('TPL_BEE_LINE_HEIGHT'); ?></label>
                    <input type="text" class="form-control" v-model.trim="data.nav.line_height" placeholder="1.5">
                </div>
            </div>
        </div>
    </div>
</template>
<div id="<?php echo $id ?>-app"></div>
<script>
    (() => {
        const { createApp, ref } = Vue;
        const { FontPicker, getWeights } = BeeFields;

        function setup() {
            const sessionTabKey = location.pathname + location.search + '-bt-typography-tab';
            const raw = <?php echo json_encode($value) ?>;
            const headings = <?php echo json_encode($headings) ?>;
            const text = <?php echo json_encode($text) ?>;

            // Registry turns empty objects into arrays
            ['base', 'headings', 'nav'].forEach(group => {
                if (!raw[group].font || Array.isArray(raw[group].font)) {
                    raw[group].font = {};
                }
            });

            const data = ref(raw);

            const tabs = [
                {key: 'base', label: <?php echo json_encode(Text::_('TPL_BEE_TYPO_BODY')); ?>},
                {key: 'headings', label: <?php echo json_encode(Text::_('TPL_BEE_TYPO_HEADING')); ?>},
                {key: 'nav', label: <?php echo json_encode(Text::_('TPL_BEE_TYPO_MENU_FONTS')); ?>},
            ];

            const savedTab = sessionStorage.getItem(sessionTabKey);
            const activeTab = ref(tabs.some(tab => tab.key === savedTab) ? savedTab : 'base');

            const sizeKeys = [
                {key: 'fs', suffix: '', placeholder: '40px'},
                {key: 'fs_sm', suffix: '-sm', placeholder: '32px'},
                {key: 'fs_xs', suffix: '-xs', placeholder: '28px'},
            ];

            function setTab(key) {
                activeTab.value = key;
                sessionStorage.setItem(sessionTabKey, key);
            }

            // Weights of the font of this group, or of the inherited font
            function weights(font, fallback) {
                const id = (font && font.id) || (fallback && fallback.id) || '';

                return getWeights(id);
            }

            return {
                data,
                tabs,
                activeTab,
                setTab,
                headings,
                sizeKeys,
                text,
                weights,
            };
        }

        const app = createApp({
            setup,
            template: '#<?php echo $id ?>-app-tpl',
            name: '<?php echo $fieldname ?>',
        });

        app.component('bt-font-picker', FontPicker);
        app.mount('#<?php echo $id ?>-app');
    })()
</script>
