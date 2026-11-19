<?php

namespace Joomla\Plugin\System\Bee\Helper;

use Joomla\CMS\Factory;
use Joomla\Registry\Registry;

/**
 * Typography tab (fonts base, headings, main navigation) => CSS variables and rules.
 * Page colors are handled by BeeColorPresetHelper::loadPreset().
 */
class BeeTypographyHelper
{
    public const HEADINGS = ['h1', 'h2', 'h3', 'h4', 'h5', 'h6'];

    /**
     * Breakpoints of the heading font sizes: Tablet (-sm) and Phone (-xs).
     */
    public const TABLET_MAX = '991.98px';
    public const PHONE_MAX = '767.98px';

    public const NAV_SELECTOR = '.bt-nav > .bt-menu-item > a, .bt-nav > .bt-menu-item > span';

    public static function render()
    {
        $doc = Factory::getDocument();
        $params = $doc->params;
        $config = new Registry($params->get('typography'));

        $vars = [];
        $rules = [];

        // Fonts base
        $base = new Registry($config->get('base'));
        $baseFont = static::getFont($base, $params->get('body_font'));
        static::addVar($vars, '--bee-body-font-size', static::size($base->get('size')));
        static::addVar($vars, '--bee-body-font-weight', static::weight($base->get('weight')));
        static::addVar($vars, '--bee-body-line-height', static::value($base->get('line_height')));

        if ($baseFont) {
            static::addVar($vars, '--bee-body-font-family', static::family($baseFont, [$base->get('weight')]));
        }

        // Headings
        $headings = new Registry($config->get('headings'));
        $headingFont = static::getFont($headings, $params->get('heading_font'));
        $headingSelector = implode(',', array_map(fn ($h) => "$h,.$h", static::HEADINGS));
        $headingRule = [];

        if ($headingFont && static::addVar($vars, '--bee-heading-font-family', static::family($headingFont, [$headings->get('weight')]))) {
            $headingRule[] = 'font-family:var(--bee-heading-font-family)';
        }

        if (static::addVar($vars, '--bee-heading-font-weight', static::weight($headings->get('weight')))) {
            $headingRule[] = 'font-weight:var(--bee-heading-font-weight)';
        }

        if (static::addVar($vars, '--bee-heading-line-height', static::value($headings->get('line_height')))) {
            $headingRule[] = 'line-height:var(--bee-heading-line-height)';
        }

        if ($headingRule) {
            $rules[] = "$headingSelector{" . implode(';', $headingRule) . '}';
        }

        $tablet = [];
        $phone = [];

        foreach (static::HEADINGS as $h) {
            $size = new Registry($headings->get("sizes.$h"));

            if (static::addVar($vars, "--bee-$h-fs", static::size($size->get('fs')))) {
                $rules[] = "$h,.$h{font-size:var(--bee-$h-fs)}";
            }

            if (static::addVar($vars, "--bee-$h-fs-sm", static::size($size->get('fs_sm')))) {
                $tablet[] = "$h,.$h{font-size:var(--bee-$h-fs-sm)}";
            }

            if (static::addVar($vars, "--bee-$h-fs-xs", static::size($size->get('fs_xs')))) {
                $phone[] = "$h,.$h{font-size:var(--bee-$h-fs-xs)}";
            }
        }

        if ($tablet) {
            $rules[] = '@media (max-width:' . static::TABLET_MAX . '){' . implode('', $tablet) . '}';
        }

        if ($phone) {
            $rules[] = '@media (max-width:' . static::PHONE_MAX . '){' . implode('', $phone) . '}';
        }

        // Main navigation
        $nav = new Registry($config->get('nav'));
        $navFont = static::getFont($nav);
        $navRule = [];

        if ($navFont && static::addVar($vars, '--bee-mainnav-font-family', static::family($navFont, [$nav->get('weight')]))) {
            $navRule[] = 'font-family:var(--bee-mainnav-font-family)';
        }

        if (static::addVar($vars, '--bee-mainnav-fs', static::size($nav->get('size')))) {
            $navRule[] = 'font-size:var(--bee-mainnav-fs)';
        }

        if (static::addVar($vars, '--bee-mainnav-fw', static::weight($nav->get('weight')))) {
            $navRule[] = 'font-weight:var(--bee-mainnav-fw)';
        }

        if (static::addVar($vars, '--bee-mainnav-lh', static::value($nav->get('line_height')))) {
            $navRule[] = 'line-height:var(--bee-mainnav-lh)';
        }

        if ($navRule) {
            $rules[] = static::NAV_SELECTOR . '{' . implode(';', $navRule) . '}';
        }

        if (!$vars && !$rules) {
            return;
        }

        $css = "\n/* Bee Typography */\n";

        if ($vars) {
            $css .= ':root{' . implode(';', $vars) . "}\n";
        }

        $css .= implode("\n", $rules) . "\n";

        $doc->addStyleDeclaration($css);
    }

    /**
     * Font of a typography group, falling back to the legacy BeeGoogleFont param.
     */
    protected static function getFont(Registry $group, $legacy = null): ?Registry
    {
        $font = new Registry($group->get('font'));

        if (!$font->get('id') && $legacy) {
            $font = new Registry($legacy);
        }

        return $font->get('id') ? $font : null;
    }

    protected static function family(Registry $font, array $weights): string
    {
        return BeeGoogleFontHelper::loadFont($font, array_filter(array_map('strval', $weights)));
    }

    protected static function addVar(array &$vars, string $name, string $value): bool
    {
        if ($value === '') {
            return false;
        }

        $vars[] = "$name:$value";

        return true;
    }

    /**
     * A plain number is a bee size.
     */
    public static function size($value): string
    {
        $value = static::value($value);

        return preg_match('/^\d+(\.\d+)?$/', $value) ? $value . 'px' : $value;
    }

    protected static function weight($value): string
    {
        $value = trim((string) $value);

        return preg_match('/^([1-9]00|normal|bold|lighter|bolder)$/', $value) ? $value : '';
    }

    /**
     * Free CSS value (16px, 1.5, 1rem, clamp(...)...) without characters able to break out of the declaration.
     */
    public static function value($value): string
    {
        $value = trim((string) $value);

        return preg_match('/^[a-z0-9.,%()\s+\-*\/]+$/i', $value) ? $value : '';
    }
}
