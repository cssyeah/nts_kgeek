<?php

namespace Joomla\Plugin\System\Bee\Field;

use Joomla\CMS\Form\FormField;
use Joomla\Plugin\System\Bee\BeeTemplate;

defined('_JEXEC') or die('Restricted access');

class BeeMegamenuField extends FormField
{
    protected $type = 'beemegamenu';

    public function renderField($options = [])
    {
        return BeeTemplate::renderLayout('bee/fields/beemegamenu', [
            'name' => $this->name,
            'value' => $this->value,
            'fieldname' => $this->fieldname,
        ]);
    }
}
