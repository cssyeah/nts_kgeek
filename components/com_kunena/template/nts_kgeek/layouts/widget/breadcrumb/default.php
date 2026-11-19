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

use Kunena\Forum\Libraries\Icons\KunenaIcons;

$pathway  = $this->breadcrumb->getPathway();
$item     = array_shift($pathway);
$position = 2;

if ($item) : ?>
  <nav class="kbreadcrumbs" aria-label="breadcrumbs">
    <ol class="breadcrumb" itemtype="https://schema.org/BreadcrumbList" itemscope="">
      <li class="breadcrumb-item active" aria-current="page" itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
        <?php echo KunenaIcons::home(); ?>
        <a itemprop="item" href="<?php echo $item->link; ?>"><span itemprop="name"><?php echo $this->escape($item->name); ?></span></a>
        <meta itemprop="position" content="1" />
      </li>

      <?php foreach ($pathway as $item) : ?>
        <li class="breadcrumb-item" itemtype="https://schema.org/ListItem" itemscope="" itemprop="itemListElement">
          <a itemprop="item" href="<?php echo $item->link; ?>"><span itemprop="name"><?php echo $this->escape($item->name); ?></span></a>
          <meta itemprop="position" content="<?php echo $position++; ?>" />
        </li>
      <?php endforeach; ?>
    </ol>
  </nav>
<?php endif;
