<?php

namespace Joomla\Plugin\System\Bee\Field;

use Joomla\CMS\Form\FormField;
use Joomla\CMS\Language\Text;
use Joomla\Plugin\System\Bee\Helper\BeeColorPresetHelper;
use Joomla\Plugin\System\Bee\BeeTemplate;
use Joomla\Registry\Registry;

defined('_JEXEC') or die('Restricted access');

/**
 * Colors tab: preset colors, page colors and element colors.
 *
 * Template defaults of the page / element colors (role => palette token):
 *     <field name="color_preset" type="BeeColorPreset">
 *         <role name="--bee-link-color">--bee-color-1</role>
 *     </field>
 */
class BeeColorPresetField extends FormField
{
    protected $type = 'BeeColorPreset';

    protected $base;

    public function renderfield($options = [])
    {
        $base = $this->getBase();
        $roles = $this->getDefaultRoles();

        return BeeTemplate::renderLayout('bee/fields/beecolorpreset', [
            'name' => $this->name,
            'value' => $this->formatValue($this->value, $roles),
            'id' => $this->id,
            'fieldname' => $this->fieldname,
            'basePresets' => $base['presets'],
            'baseGroups' => $base['groups'],
            'roles' => $roles,
            'roleGroups' => $this->getRoleGroups(),
            'labelTokens' => array_values(array_filter(array_keys(BeeColorPresetHelper::TOKENS), [BeeColorPresetHelper::class, 'isLabelToken'])),
        ]);
    }

    protected function formatValue($value, array $roles)
    {
        $data = new Registry($value);

        if (!$data->get('default')) {
            $data->set('default', $this->getDefaultPreset());
        }

        $base = $this->getBase();
        $presets = $data->get('presets') ?: $base['presets'];
        $data->set('presets', BeeColorPresetHelper::normalizePresets($presets, $base['presets'], $base['aliases']));

        // Roles saved here, or by the old Typography > Page colors tab
        $params = new Registry(['color_preset' => $data->toArray(), 'typography' => $this->form->getValue('typography', 'params')]);
        $saved = BeeColorPresetHelper::getSavedRoles($params);
        $result = [];

        foreach ($roles as $role => $token) {
            $value = (string) ($saved[$role] ?? '');
            $result[$role] = BeeColorPresetHelper::isVariableName($value) ? BeeColorPresetHelper::renameToken($value) : $token;
        }

        $data->set('roles', $result);

        $output = $data->toArray();

        // Keep objects in JSON even when empty
        $output['labels'] = (object) BeeColorPresetHelper::getLabels($data);

        return $output;
    }

    /**
     * Role groups for the Page colors / Elements blocks: [group => [role => label]].
     */
    protected function getRoleGroups(): array
    {
        $groups = [];

        foreach (BeeColorPresetHelper::ROLE_GROUPS as $group => $roles) {
            foreach (array_keys($roles) as $role) {
                $groups[$group][$role] = BeeColorPresetHelper::getLabel($role);
            }
        }

        return $groups;
    }

    protected function getDefaultRoles(): array
    {
        // Older templates declare the roles in the BeeTypography field
        $field = $this->element->role->count() ? $this->element : BeeColorPresetHelper::findRoleField($this->form->getXml());

        return BeeColorPresetHelper::getDefaultRoleMap($field ?: $this->element);
    }

    protected function getBase()
    {
        if ($this->base) {
            return $this->base;
        }

        $presets = BeeColorPresetHelper::readFieldPresets($this->element);

        $this->base = [
            'aliases' => BeeColorPresetHelper::getTemplateAliases($this->element),
            'presets' => $presets,
            'groups' => BeeColorPresetHelper::getGroups($presets),
        ];

        return $this->base;
    }

    protected function getDefaultPreset()
    {
        return (string) $this->element->attributes()->default_preset;
    }
}
