<?php

namespace Joomla\Plugin\System\Bee\Helper;

use Joomla\CMS\Factory;
use Joomla\Plugin\System\Bee\BeeTemplate;
use Joomla\Registry\Registry;

/**
 * Layout tab (container width, section spacing, gutter) and Elements tab (radius, button padding)
 * => CSS variables and rules. Nothing is output for an empty setting, so the template CSS applies.
 *
 * A template can change the elements a setting applies to with a `selector` attribute:
 *     <field name="section_spacing" type="text" selector=".section, .bt-landing" />
 */
class BeeStyleHelper
{
    /**
     * Setting => [CSS variable, default selector, declarations applied to the selector].
     * `%s` in a declaration is replaced by `var(<CSS variable>)`.
     */
    public const SETTINGS = [
        'container_width' => ['--bee-container-width', '.container', ['max-width:%s']],
        'section_spacing' => ['--bee-section-spacing', '.section', ['padding-top:%s', 'padding-bottom:%s']],
        'gutter_spacing'  => ['--bee-block-gutter', '.row, .row > *', ['--bee-gutter-x:%s', '--bee-gutter-y:%s']],
        'btn_radius'      => ['--bee-btn-radius', '.btn', ['--bee-btn-border-radius:%s', 'border-radius:%s']],
        'btn_padding'     => ['--bee-btn-padding', '.btn:not(.btn-sm):not(.btn-lg)', ['padding:%s']],
        'global_radius'   => ['--bee-border-radius', '', []],
    ];

    /**
     * The container width only applies from this breakpoint, smaller screens keep the Bootstrap widths.
     */
    public const CONTAINER_MIN = '1200px';

    public static function render()
    {
        $params = Factory::getDocument()->params;
        $vars = [];
        $rules = [];

        foreach (static::SETTINGS as $name => list($var, $selector, $declarations)) {
            $value = $name === 'btn_padding' ? static::spacing($params->get($name)) : BeeTypographyHelper::size($params->get($name));

            if ($value === '') {
                continue;
            }

            $vars[] = "$var:$value";
            $selector = static::getSelector($name, $selector);

            if (!$selector || !$declarations) {
                continue;
            }

            $rule = $selector . '{' . implode(';', array_map(fn ($d) => sprintf($d, "var($var)"), $declarations)) . '}';

            if ($name === 'container_width') {
                $rule = '@media (min-width:' . static::CONTAINER_MIN . '){' . $rule . '}';
            }

            $rules[] = $rule;
        }

        if (!$vars) {
            return;
        }

        Factory::getDocument()->addStyleDeclaration("\n/* Bee Layout & Elements */\n:root{" . implode(';', $vars) . "}\n" . implode("\n", $rules) . "\n");
    }

    /**
     * Selector of a setting: the `selector` attribute of its field in the template, or the default one.
     */
    protected static function getSelector(string $name, string $default): string
    {
        $xml = BeeTemplate::getTemplateXml();
        $fields = $xml ? $xml->xpath("//field[@name='$name'][@selector]") : [];
        $selector = $fields ? trim((string) $fields[0]['selector']) : '';

        // No braces or comments able to break out of the rule
        return $selector !== '' && !preg_match('/[{}<>;]|\/\*/', $selector) ? $selector : $default;
    }

    /**
     * Padding shorthand: 1 to 4 sizes, a plain number is a pixel size.
     */
    protected static function spacing($value): string
    {
        $parts = preg_split('/\s+/', trim((string) $value), -1, PREG_SPLIT_NO_EMPTY);

        if (!$parts || count($parts) > 4) {
            return '';
        }

        $parts = array_map([BeeTypographyHelper::class, 'size'], $parts);

        return in_array('', $parts, true) ? '' : implode(' ', $parts);
    }
}
