<?php

namespace Joomla\Plugin\System\Bee\Field;

use Joomla\CMS\Form\FormField;

defined('_JEXEC') or die('Restricted access');

/**
 * Wraps the following fields of a fieldset in a div, so a group of fields can be styled on its own.
 * Fields of a fieldset are rendered one after the other, so an opening field and a closing field
 * surround the group:
 *     <field name="spacing_start" type="BeeWrapper" class="layout-spacing" />
 *     ...
 *     <field name="spacing_end" type="BeeWrapper" end="true" />
 */
class BeeWrapperField extends FormField
{
    protected $type = 'BeeWrapper';

    public function renderField($options = [])
    {
        if ((string) $this->element['end'] === 'true') {
            return '</div>';
        }

        $class = trim(preg_replace('/[^\w\- ]+/', '', (string) $this->class));

        return '<div class="' . htmlspecialchars($class, ENT_QUOTES, 'UTF-8') . '">';
    }

    protected function getInput()
    {
        return '';
    }
}
