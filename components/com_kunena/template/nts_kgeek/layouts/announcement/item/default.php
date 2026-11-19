<?php

/**
 * Kunena Component
 *
 * @package         Kunena.Template.KInfinite
 * @subpackage      Layout.Announcement
 *
 * @copyright       Copyright (C) 2008 - 2023 Kunena Team. All rights reserved.
 * @license         https://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link            https://www.kunena.org
 **/

defined('_JEXEC') or die();

$actions      = $this->getActions();
?>
<div class="kann-header">
  <h3>
    <?php echo $this->announcement->displayField('title'); ?>

    <?php if ($this->announcement->showdate) :
    ?>
      <small data-bs-toggle="tooltip" title="<?php echo $this->announcement->displayField('created', 'ago'); ?>">
        <?php echo $this->announcement->displayField('created', 'date_today'); ?>
      </small>
    <?php endif; ?>
  </h3>

  <?php if (!empty($actions)) : ?>
    <div class="kann-actions">
      <?php echo implode(' ', $actions); ?>
    </div>
  <?php endif; ?>
</div>

<div class="kann-body">
  <div class="kann-desc"><?php echo $this->announcement->displayField('sdescription'); ?></div>
  <div class="kann-content"><?php echo $this->announcement->displayField('description'); ?></div>
</div>