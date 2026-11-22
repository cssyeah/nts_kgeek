<?php

/**
 * Kunena Component
 *
 * @package         Kunena.Template.KInfinite
 * @subpackage      Layout.Widget
 *
 * @copyright       Copyright (C) 2008 - 2023 Kunena Team. All rights reserved.
 * @license         https://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link            https://www.kunena.org
 **/

defined('_JEXEC') or die();

use Joomla\CMS\Language\Text;
?>

<nav id="ktopnav" class="navbar">
  <div id="ktopmenu">
    <button class="btn btn-light dropdown-toggle d-lg-none" id="kmainnav" type="button" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
      <span class="kmenu-bars"></span>
    </button>
    <div id="kmainnav-dropdown" class="dropdown-menu dropdown-menu-start">
      <?php echo $this->subRequest('Widget/Menu'); ?>
    </div>
    <?php //echo $this->subRequest('Widget/Menu'); ?>
  </div>

  <div class="kuser-area">
    <?php echo $this->subRequest('Widget/Login'); ?>
  </div>
</nav>