<?php

namespace Joomla\Plugin\System\Bee\Field;

use Joomla\CMS\Form\FormField;
use Joomla\Plugin\System\Bee\Helper\BeeColorPresetHelper;
use Joomla\Plugin\System\Bee\Helper\BeeLayoutHelper;
use Joomla\Plugin\System\Bee\BeeSection;
use Joomla\Plugin\System\Bee\BeeTemplate;
use Joomla\Registry\Registry;

defined('_JEXEC') or die('Restricted access');

/**
 * Layouts tab: sections of the selected layout and their settings.
 * The `layout_field` attribute names the BeeLayout field to follow (default: template_layout).
 */
class BeeSectionsField extends FormField
{
    protected $type = 'BeeSections';

    public function renderField($options = [])
    {
        $data = $this->form->getData();
        $template = (string) $data->get('template');
        $parent = (string) $data->get('parent');
        $layoutField = (string) $this->element['layout_field'] ?: 'template_layout';

        return BeeTemplate::renderLayout('bee/fields/beesections', [
            'name' => $this->name,
            'id' => $this->id,
            'fieldname' => $this->fieldname,
            'value' => $this->formatValue(),
            'layouts' => $template ? BeeLayoutHelper::getLayouts($template, $parent) : [],
            'layoutFieldName' => str_replace('[' . $this->fieldname . ']', '[' . $layoutField . ']', $this->name),
            'palette' => BeeColorPresetHelper::getPaletteOptions($this->getBasePresets(), BeeColorPresetHelper::getLabels($this->form->getValue('color_preset', 'params'))),
            'containers' => BeeSection::CONTAINERS,
        ]);
    }

    protected function formatValue()
    {
        $data = new Registry($this->value);
        $result = [];

        foreach ($data->toArray() as $id => $settings) {
            if (!BeeSection::isValidId((string) $id) || !is_array($settings)) {
                continue;
            }

            foreach (['bg', 'color', 'link', 'link_hover'] as $key) {
                if (!empty($settings[$key])) {
                    $settings[$key] = BeeColorPresetHelper::renameToken((string) $settings[$key]);
                }
            }

            $result[$id] = $settings;
        }

        // Keep an object in JSON even when empty
        return (object) $result;
    }

    protected function getBasePresets(): array
    {
        $field = $this->form->getXml()->xpath("//field[@name='color_preset']");

        return $field ? BeeColorPresetHelper::readFieldPresets($field[0]) : [];
    }
}
