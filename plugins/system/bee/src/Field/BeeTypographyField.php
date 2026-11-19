<?php

namespace Joomla\Plugin\System\Bee\Field;

use Joomla\CMS\Factory;
use Joomla\CMS\Form\FormField;
use Joomla\Plugin\System\Bee\Helper\BeeTypographyHelper;
use Joomla\Plugin\System\Bee\BeeTemplate;
use Joomla\Registry\Registry;

defined('_JEXEC') or die('Restricted access');

/**
 * Typography tab: body, heading and menu fonts.
 * Page colors moved to the Colors tab, see BeeColorPresetField.
 */
class BeeTypographyField extends FormField
{
    protected $type = 'BeeTypography';

    public function renderField($options = [])
    {
        static::addGoogleFonts();

        return BeeTemplate::renderLayout('bee/fields/beetypography', [
            'name' => $this->name,
            'id' => $this->id,
            'fieldname' => $this->fieldname,
            'value' => $this->formatValue(),
            'headings' => BeeTypographyHelper::HEADINGS,
        ]);
    }

    public static function addGoogleFonts()
    {
        static $added = false;

        if ($added) {
            return;
        }

        $added = true;

        // fonts json from https://gwfh.mranftl.com/api/fonts/
        $json = JPATH_PLUGINS . '/system/bee/media/vendor/googfonts/fonts.json';
        $rawFonts = (array) json_decode(file_get_contents($json));
        $fonts = array_map(fn ($font) => [
            'id' => $font->id,
            'family' => $font->family,
            'variants' => $font->variants,
        ], array_values($rawFonts));

        Factory::getDocument()->addScriptOptions('googlefonts', $fonts);
    }

    protected function formatValue(): array
    {
        $data = new Registry($this->value);

        // Fonts saved by the old Fonts tab
        $legacy = [
            'base.font' => 'body_font',
            'headings.font' => 'heading_font',
        ];

        foreach ($legacy as $path => $param) {
            $old = new Registry($this->form->getValue($param, 'params'));

            if (!$data->get("$path.id") && $old->get('id')) {
                $data->set($path, ['id' => $old->get('id'), 'selected' => (array) $old->get('selected', [])]);
            }
        }

        foreach (BeeTypographyHelper::HEADINGS as $h) {
            foreach (['fs', 'fs_sm', 'fs_xs'] as $key) {
                $data->def("headings.sizes.$h.$key", '');
            }
        }

        foreach (['base.size', 'base.weight', 'base.line_height', 'headings.weight', 'headings.line_height', 'nav.size', 'nav.weight', 'nav.line_height'] as $path) {
            $data->def($path, '');
        }

        return $data->toArray();
    }
}
