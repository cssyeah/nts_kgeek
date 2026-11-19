<?php

namespace Joomla\Plugin\System\Bee\Helper;

use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\Plugin\System\Bee\BeeTemplate;
use Joomla\Registry\Registry;

class BeeGoogleFontHelper
{
    protected static $preconnected = false;

    public static function initFont()
    {
        $doc = Factory::getDocument();
        $params = $doc->params;
        $xml = BeeTemplate::getTemplateXml();
        $xmlFields = $xml->xpath('//field[@type="BeeGoogleFont"]');
        $fields = array_map(function ($field) {
            return [
                'name' => (string) $field->attributes()->name,
                'variable' => (string) $field->attributes()->variable,
            ];
        }, $xmlFields);

        if (!$fields) {
            return;
        }

        $fontFamilies = [];
        $fontSelectors = [];

        foreach ($fields as $field) {
            $data = new Registry($params->get($field['name']));

            if (!$data->get('id')) {
                continue;
            }

            $fontFamilies[] = static::addFont($field['variable'], $data);

            if ($data->get('selectors') && $field['variable']) {
                $fontSelectors[] = static::applyFontSelectors($data->get('selectors', ''), $field['variable']);
            }
        }

        $css = "\n/* Bee Google Fonts */\n";
        $css .= ":root {";
        $css .= implode("", $fontFamilies);
        $css .= "}\n";
        $css .= implode("", $fontSelectors);

        $doc->addStyleDeclaration($css);
    }

    protected static function applyFontSelectors($selectors, $var)
    {
        $selectors = trim($selectors);
        $selectors = trim($selectors, ',');
        $css = '';

        if ($selectors) {
            $css .= "$selectors {";
            $css .= "font-family: var($var);";
            $css .= "}\n";
        }

        return $css;
    }

    protected static $googleFonts = [];

    public static function getFontData(string $id)
    {
        if (!static::$googleFonts) {
            // fonts json from https://gwfh.mranftl.com/api/fonts/
            $jsonPath = JPATH_PLUGINS . '/system/bee/media/vendor/googfonts/fonts.json';
            $data = json_decode(file_get_contents($jsonPath));

            foreach ($data as $item) {
                static::$googleFonts[$item->id] = $item;
            }
        }

        return static::$googleFonts[$id] ?? false;
    }

    public static function preconnect()
    {
        if (static::$preconnected) {
            return;
        }

        static::$preconnected = true;

        HTMLHelper::stylesheet('https://fonts.googleapis.com', [], ['rel' => 'preconnect']);
        HTMLHelper::stylesheet('https://fonts.gstatic.com', [], ['rel' => 'preconnect', 'crossorigin' => true]);
    }

    protected static function addFont(string $variable, Registry $font)
    {
        $family = static::loadFont($font);

        return $family ? "$variable: $family;" : '';
    }

    /**
     * Load a Google font and return its CSS font family, e.g. `'Roboto', sans-serif`.
     *
     * @param   Registry  $font          {id, selected: [variants]}
     * @param   array     $extraWeights  Weights used by the config (e.g. Typography font weight) which must be loaded too
     */
    public static function loadFont(Registry $font, array $extraWeights = []): string
    {
        $data = static::getFontData((string) $font->get('id'));

        if (!$data) {
            return '';
        }

        static::preconnect();

        $fontFamily = urlencode($data->family);
        $selected = (array) $font->get('selected', []);
        $variants = (array) $data->variants;
        $extraWeights = array_filter($extraWeights, fn ($w) => in_array($w === '400' ? 'regular' : (string) $w, $variants, true));

        if (!$selected && $extraWeights && in_array('regular', $variants, true)) {
            // Without selected variants Google only serves 400: keep it next to the extra weights.
            $selected[] = 'regular';
        }

        foreach ($extraWeights as $value) {
            $value = $value === '400' ? 'regular' : (string) $value;

            if (!in_array($value, $selected, true)) {
                $selected[] = $value;
            }
        }

        if (!$selected) {
            $familyString = $fontFamily;
        }

        if ($selected) {
            $weight = [];

            foreach ($selected as $value) {
                if ($value === 'regular') {
                    $weight[] = '0,400';
                }

                if ($value === 'italic') {
                    $weight[] = '1,400';
                }

                if (preg_match('/^\d+$/', $value)) {
                    $weight[] = "0,$value";
                }

                if (preg_match('/^(\d+)italic/', $value, $match)) {
                    $weight[] = "1," . $match[1];
                }
            }

            $weight = array_unique($weight);
            sort($weight);

            $weightString = implode(';', $weight);
            $familyString = "$fontFamily:ital,wght@$weightString";
        }

        $link = "https://fonts.googleapis.com/css2?family=$familyString&display=swap";

        HTMLHelper::stylesheet($link);

        return "'{$data->family}', {$data->category}";
    }
}
