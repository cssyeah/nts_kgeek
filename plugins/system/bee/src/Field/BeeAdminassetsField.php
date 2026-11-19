<?php

namespace Joomla\Plugin\System\Bee\Field;

use Joomla\CMS\Form\FormField;
use Joomla\CMS\HTML\HTMLHelper;

defined('_JEXEC') or die('Restricted access');

class BeeAdminassetsField extends FormField
{
    protected $type = 'gkadminassets';

    public function renderfield($options = [])
    {
        HTMLHelper::stylesheet('plugins/system/bee/media/css/admin-style.css');
        HTMLHelper::script('plugins/system/bee/media/js/admin-description.js', [], ['defer' => true]);

        return '';
    }
}
