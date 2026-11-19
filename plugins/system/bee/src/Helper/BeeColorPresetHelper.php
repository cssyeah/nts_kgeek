<?php

namespace Joomla\Plugin\System\Bee\Helper;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Log\Log;
use Joomla\Plugin\System\Bee\BeeConfig;
use Joomla\Plugin\System\Bee\BeeTemplate;
use Joomla\Registry\Registry;

class BeeColorPresetHelper
{
    /**
     * Group for template specific variables which are not part of the standard tokens.
     */
    public const EXTRA_GROUP = 'TPL_BEE_EXTRA_COLORS';

    /**
     * Standard color tokens (the palette) shared by every Bee template, in display order.
     * Each preset always outputs all of them; `light` / `dark` are the framework defaults
     * used when a template preset does not declare a token.
     */
    public const TOKENS = [
        // Brand (with neutral)
        '--bee-primary'           => ['group' => 'TPL_BEE_BRAND_COLORS', 'light' => '#0d6efd', 'dark' => '#6ea8fe'],
        '--bee-on-primary'        => ['group' => 'TPL_BEE_BRAND_COLORS', 'light' => '#ffffff', 'dark' => '#000000'],
        '--bee-secondary'         => ['group' => 'TPL_BEE_BRAND_COLORS', 'light' => '#6c757d', 'dark' => '#adb5bd'],
        '--bee-on-secondary'      => ['group' => 'TPL_BEE_BRAND_COLORS', 'light' => '#ffffff', 'dark' => '#000000'],
        '--bee-accent'            => ['group' => 'TPL_BEE_BRAND_COLORS', 'light' => '#6f42c1', 'dark' => '#a98eda'],
        '--bee-on-accent'         => ['group' => 'TPL_BEE_BRAND_COLORS', 'light' => '#ffffff', 'dark' => '#000000'],
        '--bee-neutral'           => ['group' => 'TPL_BEE_BRAND_COLORS', 'light' => '#495057', 'dark' => '#adb5bd'],
        '--bee-on-neutral'        => ['group' => 'TPL_BEE_BRAND_COLORS', 'light' => '#ffffff', 'dark' => '#121212'],
        // Status
        '--bee-info'              => ['group' => 'TPL_BEE_STATUS_COLORS', 'light' => '#0dcaf0', 'dark' => '#0dcaf0'],
        '--bee-on-info'           => ['group' => 'TPL_BEE_STATUS_COLORS', 'light' => '#000000', 'dark' => '#000000'],
        '--bee-success'           => ['group' => 'TPL_BEE_STATUS_COLORS', 'light' => '#198754', 'dark' => '#198754'],
        '--bee-on-success'        => ['group' => 'TPL_BEE_STATUS_COLORS', 'light' => '#ffffff', 'dark' => '#ffffff'],
        '--bee-warning'           => ['group' => 'TPL_BEE_STATUS_COLORS', 'light' => '#ffc107', 'dark' => '#ffc107'],
        '--bee-on-warning'        => ['group' => 'TPL_BEE_STATUS_COLORS', 'light' => '#000000', 'dark' => '#000000'],
        '--bee-danger'            => ['group' => 'TPL_BEE_STATUS_COLORS', 'light' => '#dc3545', 'dark' => '#dc3545'],
        '--bee-on-danger'         => ['group' => 'TPL_BEE_STATUS_COLORS', 'light' => '#ffffff', 'dark' => '#ffffff'],
        // Base
        '--bee-base-100'          => ['group' => 'TPL_BEE_BASE_COLORS', 'light' => '#ffffff', 'dark' => '#121212'],
        '--bee-base-200'          => ['group' => 'TPL_BEE_BASE_COLORS', 'light' => '#f8f9fa', 'dark' => '#1e1e1e'],
        '--bee-base-300'          => ['group' => 'TPL_BEE_BASE_COLORS', 'light' => '#dee2e6', 'dark' => '#343a40'],
        '--bee-base-content'      => ['group' => 'TPL_BEE_BASE_COLORS', 'light' => '#212529', 'dark' => '#dee2e6'],
        // Custom
        '--bee-color-1'           => ['group' => 'TPL_BEE_CUSTOM_COLORS', 'light' => '#0d6efd', 'dark' => '#6ea8fe'],
        '--bee-color-2'           => ['group' => 'TPL_BEE_CUSTOM_COLORS', 'light' => '#0a58ca', 'dark' => '#8bb9fe'],
        '--bee-color-3'           => ['group' => 'TPL_BEE_CUSTOM_COLORS', 'light' => '#212529', 'dark' => '#ffffff'],
        '--bee-color-4'           => ['group' => 'TPL_BEE_CUSTOM_COLORS', 'light' => '#6c757d', 'dark' => '#adb5bd'],
        '--bee-color-5'           => ['group' => 'TPL_BEE_CUSTOM_COLORS', 'light' => '#212529', 'dark' => '#000000'],
        '--bee-color-6'           => ['group' => 'TPL_BEE_CUSTOM_COLORS', 'light' => '#ffc107', 'dark' => '#ffc107'],
    ];

    /**
     * Groups of the custom tokens, whose label can be set by the user (Colors > Preset colors).
     */
    public const LABEL_GROUPS = ['TPL_BEE_CUSTOM_COLORS'];

    /**
     * Color roles (Colors > Page colors / Elements / Main menu) => default palette token.
     * A role always points to a palette token, so it follows the active preset.
     * An empty default means the role is not output until a token is chosen (the CSS default is kept).
     */
    public const ROLE_GROUPS = [
        'TPL_BEE_PAGE_COLORS' => [
            '--bee-body-bg'           => '--bee-base-100',
            '--bee-body-color'        => '--bee-base-content',
            '--bee-muted-color'       => '--bee-neutral',
            '--bee-heading-color'     => '--bee-base-content',
            '--bee-border-color'      => '--bee-base-300',
        ],
        'TPL_BEE_ELEMENT_COLORS' => [
            '--bee-btn-bg'            => '',
            '--bee-btn-text'          => '',
            '--bee-btn-hover-bg'      => '',
            '--bee-btn-hover-text'    => '',
            '--bee-link-color'        => '--bee-primary',
            '--bee-link-hover-color'  => '--bee-secondary',
            '--bee-link-active-color' => '--bee-secondary',
        ],
        'TPL_BEE_MENU_COLORS' => [
            '--bee-menu-color'                => '',
            '--bee-menu-hover-color'          => '',
            '--bee-menu-active-color'         => '',
            '--bee-submenu-bg'                => '',
            '--bee-submenu-link-color'        => '',
            '--bee-submenu-link-hover-color'  => '',
            '--bee-submenu-link-active-color' => '',
        ],
    ];

    /**
     * Button roles => Bootstrap button variables of the default button (.btn-primary) they drive.
     * Bootstrap redefines --bee-btn-* on every .btn, so these roles are output on the button itself.
     */
    public const BUTTON_ROLES = [
        '--bee-btn-bg'         => ['--bee-btn-bg', '--bee-btn-disabled-bg', '--bee-btn-disabled-border-color'],
        '--bee-btn-text'       => ['--bee-btn-text', '--bee-btn-color', '--bee-btn-disabled-color'],
        '--bee-btn-hover-bg'   => ['--bee-btn-hover-bg', '--bee-btn-active-bg'],
        '--bee-btn-hover-text' => ['--bee-btn-hover-text', '--bee-btn-hover-color', '--bee-btn-active-color'],
    ];

    public const BUTTON_SELECTOR = '[data-bt-theme] .btn-primary';

    /**
     * All color roles => default palette token, see ROLE_GROUPS.
     */
    public const ROLES = self::ROLE_GROUPS['TPL_BEE_PAGE_COLORS'] + self::ROLE_GROUPS['TPL_BEE_ELEMENT_COLORS']
        + self::ROLE_GROUPS['TPL_BEE_MENU_COLORS'];

    /**
     * Old variable names => palette token. Used to migrate presets saved before the palette,
     * and token references saved in the page colors / section settings.
     * When several old names point to the same token, the first one found wins.
     * Old role names (heading, muted, link...) are dropped: roles are now set in Colors > Page colors / Elements.
     */
    public const LEGACY = [
        '--bee-body-bg'             => '--bee-base-100',
        '--bee-surface-bg'          => '--bee-base-200',
        '--bee-mega-bg'             => '--bee-base-200',
        '--bee-base-light'          => '--bee-base-200',
        '--bee-border-color'        => '--bee-base-300',
        '--bee-body-color'          => '--bee-base-content',
        '--bee-error'               => '--bee-danger',
        '--bee-primary-content'     => '--bee-on-primary',
        '--bee-secondary-content'   => '--bee-on-secondary',
        '--bee-accent-content'      => '--bee-on-accent',
        '--bee-neutral-content'     => '--bee-on-neutral',
        '--bee-info-content'        => '--bee-on-info',
        '--bee-success-content'     => '--bee-on-success',
        '--bee-warning-content'     => '--bee-on-warning',
        '--bee-danger-content'      => '--bee-on-danger',
        '--bee-error-content'       => '--bee-on-danger',
        '--bee-custom-1'            => '--bee-color-1',
        '--bee-custom-2'            => '--bee-color-2',
        '--bee-custom-3'            => '--bee-color-3',
        '--bee-custom-4'            => '--bee-color-4',
        '--bee-custom-5'            => '--bee-color-5',
        '--bee-custom-6'            => '--bee-color-6',
    ];

    /**
     * Old variables which have no palette token any more (they were roles or footer colors).
     * They are dropped from saved presets; a template keeps them through <alias> tags.
     */
    public const DROPPED = [
        '--bee-footer-bg',
        '--bee-footer-color',
        '--bee-footer-link-color',
        '--bee-footer-link-hover-color',
        '--bee-footer-text',
        '--bee-footer-link',
        '--bee-footer-link-hover',
    ];

    /**
     * Variables derived on output: Bootstrap variables sharing the same role,
     * plus the legacy names so old CSS / custom code keeps working.
     */
    public const ALIASES = [
        '--bee-emphasis-color'    => '--bee-heading-color',
        '--bee-secondary-color'   => '--bee-muted-color',
        '--bee-logo-color'        => '--bee-heading-color',
        '--bee-surface-bg'        => '--bee-base-200',
        '--bee-mega-bg'           => '--bee-base-200',
        '--bee-base-light'        => '--bee-base-200',
        '--bee-error'             => '--bee-danger',
        '--bee-error-content'     => '--bee-on-danger',
        '--bee-primary-content'   => '--bee-on-primary',
        '--bee-secondary-content' => '--bee-on-secondary',
        '--bee-accent-content'    => '--bee-on-accent',
        '--bee-neutral-content'   => '--bee-on-neutral',
        '--bee-info-content'      => '--bee-on-info',
        '--bee-success-content'   => '--bee-on-success',
        '--bee-warning-content'   => '--bee-on-warning',
        '--bee-danger-content'    => '--bee-on-danger',
    ];

    /**
     * Current name of a palette token saved under an old name (e.g. --bee-custom-1 => --bee-color-1).
     */
    public static function renameToken(string $token): string
    {
        $target = static::LEGACY[$token] ?? '';

        return isset(static::TOKENS[$target]) ? $target : $token;
    }

    /**
     * Build the variable groups for the preset editor: standard groups first, in token order,
     * then the template specific variables.
     */
    public static function getGroups(array $presets): array
    {
        $groups = [];

        foreach (static::TOKENS as $name => $token) {
            $groups[$token['group']][$name] = '#000000';
        }

        foreach ($presets as $preset) {
            $preset = (array) $preset;

            foreach (array_keys((array) $preset['variables']) as $name) {
                if (!isset(static::TOKENS[$name])) {
                    $groups[static::EXTRA_GROUP][$name] = '#000000';
                }
            }
        }

        return $groups;
    }

    /**
     * Palette options for the color dropdowns (page colors, section colors), grouped like the preset editor.
     *
     * @return array [['label' => group label, 'options' => [['value' => var, 'text' => label], ...]], ...]
     */
    public static function getPaletteOptions(array $presets, array $labels = []): array
    {
        $result = [];

        foreach (static::getGroups($presets) as $group => $variables) {
            $options = [];

            foreach (array_keys($variables) as $name) {
                $options[] = ['value' => $name, 'text' => static::getLabel($name, $labels)];
            }

            $result[] = ['label' => Text::_($group), 'options' => $options];
        }

        return $result;
    }

    /**
     * @param   array  $labels  User labels of the custom tokens, see getLabels()
     */
    public static function getLabel(string $name, array $labels = []): string
    {
        if (!empty($labels[$name])) {
            return $labels[$name];
        }

        $key = 'TPL_BEE_COLOR' . strtoupper($name);

        return Factory::getApplication()->getLanguage()->hasKey($key) ? Text::_($key) : $name;
    }

    /**
     * Whether the user can rename the token (custom colors).
     */
    public static function isLabelToken(string $name): bool
    {
        return in_array(static::TOKENS[$name]['group'] ?? '', static::LABEL_GROUPS, true);
    }

    /**
     * User labels of the custom tokens, saved in the color_preset param: {"labels": {"--bee-color-1": "Link"}}.
     *
     * @param   mixed  $colorPreset  The color_preset param (JSON string, array, object or Registry)
     */
    public static function getLabels($colorPreset): array
    {
        $data = $colorPreset instanceof Registry ? $colorPreset : new Registry($colorPreset);
        $labels = [];

        foreach ((array) $data->get('labels', []) as $name => $label) {
            $name = static::renameToken((string) $name);
            $label = trim(strip_tags((string) $label));

            if ($label !== '' && static::isLabelToken($name)) {
                $labels[$name] = mb_substr($label, 0, 50);
            }
        }

        return $labels;
    }

    /**
     * Normalize the template base presets: migrate legacy names and fill missing tokens
     * with the framework defaults.
     */
    public static function normalizeBasePresets(array $presets, array $aliases = []): array
    {
        $result = [];

        foreach ($presets as $preset) {
            $preset = (array) $preset;
            $variables = static::migrateLegacy((array) $preset['variables'], $aliases);
            $missing = array_diff(array_keys(static::TOKENS), array_keys($variables));

            if ($missing) {
                Log::add(
                    sprintf('Bee: color preset "%s" does not declare %s, framework defaults are used.', $preset['name'], implode(', ', $missing)),
                    Log::WARNING,
                    'bee'
                );
            }

            $result[] = [
                'name' => $preset['name'],
                'variables' => static::fillTokens($variables, static::getStandardValues($preset['name']), $aliases),
            ];
        }

        return $result;
    }

    /**
     * Normalize saved presets against the (normalized) base presets.
     * Missing tokens are taken from the base preset with the same name, then the first base preset.
     */
    public static function normalizePresets(array $presets, array $basePresets, array $aliases = []): array
    {
        $baseByName = [];

        foreach ($basePresets as $base) {
            $base = (array) $base;
            $baseByName[$base['name']] = (array) $base['variables'];
        }

        $firstBase = $basePresets ? (array) ((array) reset($basePresets))['variables'] : [];
        $result = [];

        foreach ($presets as $preset) {
            $preset = (array) $preset;
            $name = (string) $preset['name'];
            $fallback = array_merge(static::getStandardValues($name), $firstBase, $baseByName[$name] ?? []);

            $result[] = [
                'name' => $name,
                'variables' => static::fillTokens(static::migrateLegacy((array) $preset['variables'], $aliases), $fallback, $aliases),
            ];
        }

        return $result;
    }

    /**
     * Move values saved under old names to their palette token. Template aliases pointing
     * to a token (e.g. --bee-footer-bg => --bee-neutral) migrate the same way.
     */
    protected static function migrateLegacy(array $variables, array $aliases = []): array
    {
        $map = array_merge(static::LEGACY, array_filter($aliases, fn ($target) => isset(static::TOKENS[$target])));

        foreach ($map as $old => $new) {
            if (!array_key_exists($old, $variables)) {
                continue;
            }

            if (!isset($variables[$new])) {
                $variables[$new] = $variables[$old];
            }

            unset($variables[$old]);
        }

        return $variables;
    }

    /**
     * Return all standard tokens in order, followed by the template specific variables.
     * Roles and aliases are derived on output, so they are never kept in a preset.
     */
    protected static function fillTokens(array $variables, array $fallback, array $aliases = []): array
    {
        $result = [];

        foreach (array_keys(static::TOKENS) as $name) {
            $result[$name] = $variables[$name] ?? $fallback[$name];
        }

        foreach ($variables as $name => $value) {
            if (!isset($result[$name]) && !static::isDerived($name, $aliases)) {
                $result[$name] = $value;
            }
        }

        return $result;
    }

    protected static function isDerived(string $name, array $aliases = []): bool
    {
        return isset(static::ROLES[$name]) || isset(static::ALIASES[$name]) || isset($aliases[$name])
            || in_array($name, static::DROPPED, true);
    }

    protected static function getStandardValues(string $presetName): array
    {
        $mode = stripos($presetName, 'dark') !== false ? 'dark' : 'light';

        return array_map(fn ($token) => $token[$mode], static::TOKENS);
    }

    protected static function getRgb(string $value): string
    {
        if (!preg_match('/^#([0-9a-f]{6})$/i', $value)) {
            return '';
        }

        list($r, $g, $b) = sscanf($value, "#%02x%02x%02x");

        return "$r,$g,$b";
    }

    public static function getActivePreset()
    {
        $doc = Factory::getDocument();
        $params = $doc->params;
        $presetConfig = new Registry($params->get('color_preset'));
        $defaultConfig = static::getDefaultConfig();
        $defaultPreset = $presetConfig->get('default', $defaultConfig->get('default'));
        $cookieKey = BeeConfig::get('cookieKey', '');

        $input = Factory::getApplication()->input;
        $active = $input->cookie->get('bee_active_preset_' . $cookieKey);

        $result = $active ?: $defaultPreset;

        $doc = Factory::getDocument();
        $doc->addScriptOptions('bee_active_preset_' . $cookieKey, $result);
        $doc->addScriptOptions('bee_preset_cookie_key', $cookieKey);

        return $result;
    }

    /**
     * Color roles => palette token: framework defaults, then the template defaults
     * (<role> tags of the color_preset field), then the Colors > Page colors / Elements config.
     */
    public static function getRoleMap(?Registry $params = null): array
    {
        $params = $params ?: Factory::getDocument()->params;
        $roles = static::getDefaultRoleMap();

        foreach (static::getSavedRoles($params) as $role => $token) {
            if (array_key_exists($role, $roles) && static::isVariableName((string) $token)) {
                $roles[$role] = static::renameToken((string) $token);
            }
        }

        return $roles;
    }

    /**
     * Roles saved in the color_preset param, or by the old Typography > Page colors tab.
     */
    public static function getSavedRoles(Registry $params): array
    {
        $roles = (array) (new Registry($params->get('color_preset')))->get('roles', []);

        if (!$roles) {
            $roles = (array) (new Registry($params->get('typography')))->get('page', []);
        }

        return $roles;
    }

    /**
     * @param   \SimpleXMLElement|null  $field  The field holding the <role> tags, read from the site template when omitted
     */
    public static function getDefaultRoleMap(?\SimpleXMLElement $field = null): array
    {
        $roles = static::ROLES;

        if (!$field) {
            $field = static::findRoleField(BeeTemplate::getTemplateXml());
        }

        if ($field) {
            foreach ($field->role as $role) {
                $name = (string) $role->attributes()->name;
                $token = static::renameToken(trim((string) $role[0]));

                if (array_key_exists($name, $roles) && static::isVariableName($token)) {
                    $roles[$name] = $token;
                }
            }
        }

        return $roles;
    }

    /**
     * Field holding the template default roles: the color_preset field, or the BeeTypography field of older templates.
     */
    public static function findRoleField($xml): ?\SimpleXMLElement
    {
        if (!$xml) {
            return null;
        }

        foreach (["//field[@name='color_preset'][role]", "//field[@type='BeeTypography'][role]"] as $path) {
            $fields = $xml->xpath($path);

            if ($fields) {
                return $fields[0];
            }
        }

        return null;
    }

    public static function isVariableName(string $name): bool
    {
        return (bool) preg_match('/^--[a-z0-9-]+$/i', $name);
    }

    public static function loadPreset()
    {
        $doc = Factory::getDocument();
        $defaultConfig = static::getDefaultConfig();

        $basePresets = $defaultConfig->get('presets', []);
        $aliases = (array) $defaultConfig->get('aliases', []);
        $presets = static::normalizePresets(BeeConfig::get('presets', []) ?: $basePresets, $basePresets, $aliases);
        $css = "\n/* Bee Color Presets */\n";

        foreach ($presets as $preset) {
            $css .= "[data-bt-theme=\"{$preset['name']}\"] {";

            foreach ($preset['variables'] as $key => $value) {
                $css .= "$key:$value;";

                $rgb = static::getRgb($value);
                if ($rgb) {
                    $css .= "$key-rgb:$rgb;";
                }
            }

            $css .= "}\n";
        }

        // Roles and aliases point to palette tokens, so they follow the active preset.
        $roles = array_filter(static::getRoleMap());
        $buttons = array_intersect_key($roles, static::BUTTON_ROLES);
        $derived = array_merge(array_diff_key($roles, static::BUTTON_ROLES), static::ALIASES, $aliases);
        $css .= "[data-bt-theme] {";

        foreach ($derived as $key => $source) {
            $css .= "$key:var($source);$key-rgb:var($source-rgb);";
        }

        $css .= "}\n";

        if ($buttons) {
            $css .= static::BUTTON_SELECTOR . " {";

            foreach ($buttons as $role => $source) {
                foreach (static::BUTTON_ROLES[$role] as $key) {
                    $css .= "$key:var($source);";
                }
            }

            $css .= "}\n";
        }
        $css .= "a:not(.btn):active {color:var(--bee-link-active-color);}\n";

        $doc->addStyleDeclaration($css);
    }

    public static function getDefaultConfig()
    {
        $xml = BeeTemplate::getTemplateXml();
        $element = $xml->xpath("//field[@name='color_preset']");

        if (!$element) {
            return new Registry();
        }

        $data = $element[0];

        $output = new Registry();
        $output->set('default', (string) $data->attributes()->default_preset);
        $output->set('aliases', static::getTemplateAliases($data));
        $output->set('presets', static::readFieldPresets($data));

        return $output;
    }

    /**
     * Normalized base presets declared in a color_preset field.
     */
    public static function readFieldPresets(\SimpleXMLElement $field): array
    {
        $presets = [];

        foreach ($field->preset as $item) {
            $variables = [];

            foreach ($item->variable as $var) {
                $variables[(string) $var->attributes()->name] = (string) $var[0];
            }

            $presets[] = [
                'name' => (string) $item->attributes()->name,
                'variables' => $variables,
            ];
        }

        return static::normalizeBasePresets($presets, static::getTemplateAliases($field));
    }

    /**
     * Template specific aliases, e.g. <alias name="--bee-footer-bg">--bee-neutral</alias>,
     * declared in the color_preset field so template CSS can keep its own variable names.
     */
    public static function getTemplateAliases(\SimpleXMLElement $field): array
    {
        $aliases = [];

        foreach ($field->alias as $alias) {
            $name = (string) $alias->attributes()->name;
            $source = static::renameToken(trim((string) $alias[0]));

            if (static::isVariableName($name) && static::isVariableName($source)) {
                $aliases[$name] = $source;
            }
        }

        return $aliases;
    }
}
