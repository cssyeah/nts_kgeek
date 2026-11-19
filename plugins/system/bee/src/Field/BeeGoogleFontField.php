<?php

namespace Joomla\Plugin\System\Bee\Field;

use Joomla\CMS\Factory;
use Joomla\CMS\Form\FormField;
use Joomla\Plugin\System\Bee\BeeTemplate;

defined('_JEXEC') or die('Restricted access');

class BeeGoogleFontField extends FormField
{
    protected $type = 'BeeGoogleFont';

    public function getLabel()
    {
        $label = parent::getLabel();
        $variable = (string) $this->element->attributes()->variable;

        if ($variable === '') {
            return $label;
        }

        // Show the CSS variable as a tooltip when hovering the label
        $attr = 'data-css-var="' . htmlspecialchars($variable, ENT_QUOTES, 'UTF-8') . '"';

        return preg_replace('/<label/', '<label ' . $attr, $label, 1);
    }

    public function getInput()
    {
        // fonts json from https://gwfh.mranftl.com/api/fonts/
        $json = JPATH_PLUGINS . '/system/bee/media/vendor/googfonts/fonts.json';
        $rawFonts = (array) json_decode(file_get_contents($json));
        $fonts = array_map(function ($font) {

            return [
                'id' => $font->id,
                'family' => $font->family,
                'variants' => $font->variants,
            ];
        }, $rawFonts);

        $doc = Factory::getDocument();
        $doc->addScriptOptions('googlefonts', $fonts);

        $data = [
            'id' => $this->id,
            'value' => $this->value,
            'name' => $this->name,
            'fieldname' => $this->fieldname,
            'variable' => (string) $this->element->attributes()->variable,
        ];

        return BeeTemplate::renderLayout('bee/fields/beegooglefont', $data);
    }
}
