<?php

/**
 * Kunena Component
 *
 * @package         Kunena.Template.KÌninite
 * @subpackage      Layout.Widget
 *
 * @copyright       Copyright (C) 2008 - 2023 Kunena Team. All rights reserved.
 * @license         https://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link            https://www.kunena.org
 **/

defined('_JEXEC') or die();
?>
<div class="kpage-wrap">
  <div class="kpage-header">
    <h1 class="kpage-title"><?php echo $this->header; ?></h1>
  </div>

  <?php echo $this->subLayout('Widget/Module')->set('position', 'kunena_custom_top'); ?>
  <div class="kpage-body">
    <?php echo $this->body; ?>
  </div>
  <?php echo $this->subLayout('Widget/Module')->set('position', 'kunena_custom_bottom'); ?>
</div>