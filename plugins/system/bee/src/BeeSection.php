<?php

namespace Joomla\Plugin\System\Bee;

use Joomla\CMS\Factory;
use Joomla\Plugin\System\Bee\Helper\BeeColorPresetHelper;
use Joomla\Registry\Registry;

defined('_JEXEC') or die('Restricted access');

/**
 * Layout sections configured in the Layouts tab.
 *
 * A layout (or block) declares a section on its wrapper element:
 *
 *     <footer <?php echo BeeSection::attrs('bt-footer', 'bt-footer') ?>>
 *         <div class="<?php echo BeeSection::container('bt-footer') ?>">
 *             <jdoc:include type="modules" name="footer" style="none" />
 *
 * The Layouts tab lists every section of a layout with the positions it contains.
 */
class BeeSection
{
    public const CONTAINERS = ['container', 'container-fluid', 'container-full'];

    protected static $config;

    public static function getConfig(): array
    {
        if (static::$config === null) {
            $params = Factory::getDocument()->params;
            $data = new Registry($params->get('layout_sections'));
            static::$config = [];

            foreach ($data->toArray() as $id => $settings) {
                if (static::isValidId((string) $id) && is_array($settings)) {
                    static::$config[$id] = $settings;
                }
            }
        }

        return static::$config;
    }

    public static function get(string $id): array
    {
        return static::getConfig()[$id] ?? [];
    }

    /**
     * `id="..." class="..."` attributes of a section wrapper, including the extra class from the settings.
     */
    public static function attrs(string $id, string $class = ''): string
    {
        $settings = static::get($id);
        $classes = trim($class . ' ' . static::sanitizeClass($settings['class'] ?? ''));
        $attrs = 'id="' . htmlspecialchars($id, ENT_QUOTES, 'UTF-8') . '"';

        if ($classes !== '') {
            $attrs .= ' class="' . htmlspecialchars($classes, ENT_QUOTES, 'UTF-8') . '"';
        }

        return $attrs;
    }

    /**
     * Container class of a section: the one from the settings, or the layout default.
     */
    public static function container(string $id, string $default = 'container'): string
    {
        $container = static::get($id)['container'] ?? '';

        return in_array($container, static::CONTAINERS, true) ? $container : $default;
    }

    /**
     * Section colors => `#section_id {...}`.
     */
    public static function renderCss()
    {
        $css = '';
        $hasFull = false;

        foreach (static::getConfig() as $id => $settings) {
            $rules = [];
            $bg = static::token($settings['bg'] ?? '');
            $color = static::token($settings['color'] ?? '');
            $link = static::token($settings['link'] ?? '');
            $linkHover = static::token($settings['link_hover'] ?? '');

            if ($bg) {
                $rules[] = "background-color:var($bg)";
            }

            if ($color) {
                // Headings follow the section text color, otherwise they would keep the page heading color.
                $rules[] = "--bee-body-color:var($color)";
                $rules[] = "--bee-body-color-rgb:var($color-rgb)";
                $rules[] = "--bee-heading-color:var($color)";
                $rules[] = "color:var($color)";
            }

            if ($link) {
                $rules[] = "--bee-link-color:var($link)";
                $rules[] = "--bee-link-color-rgb:var($link-rgb)";
            }

            if ($linkHover) {
                $rules[] = "--bee-link-hover-color:var($linkHover)";
                $rules[] = "--bee-link-hover-color-rgb:var($linkHover-rgb)";
                $rules[] = "--bee-link-active-color:var($linkHover)";
            }

            if ($rules) {
                $css .= "#$id{" . implode(';', $rules) . "}\n";
            }

            if (($settings['container'] ?? '') === 'container-full') {
                $hasFull = true;
            }
        }

        if ($hasFull) {
            $css .= ".container-full{width:100%;}\n";
        }

        if ($css) {
            Factory::getDocument()->addStyleDeclaration("\n/* Bee Sections */\n" . $css);
        }
    }

    public static function isValidId(string $id): bool
    {
        return (bool) preg_match('/^[a-z][\w-]*$/i', $id);
    }

    protected static function token($value): string
    {
        $value = (string) $value;

        return BeeColorPresetHelper::isVariableName($value) ? BeeColorPresetHelper::renameToken($value) : '';
    }

    protected static function sanitizeClass($value): string
    {
        return trim(preg_replace('/[^\w\- ]+/', '', (string) $value));
    }
}
