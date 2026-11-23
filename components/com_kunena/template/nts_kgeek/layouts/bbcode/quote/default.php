<?php

/**
 * Kunena Component
 * @package         Kunena.Template.KGeek
 * @subpackage      Layout.BBCode
 *
 * @copyright       Copyright (C) 2008 - 2023 Kunena Team. All rights reserved.
 * @license         https://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link            https://www.kunena.org
 **/

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;

// [quote ="username post=messageid"]text content of the quote[/quote]

// Display message quoted by user.
if (!empty($this->msglink)) {
?>
  <blockquote>
    <div class="kmsgtext-quote">
      <div class="kquote-source">
        <a href="<?php echo $this->escape($this->msglink); ?>"> <?php echo $this->username . " " . Text::_('COM_KUNENA_POST_WROTE'); ?>: <i class="fas fa-arrow-circle-up"></i></a>
      </div>
      <div class="kquote-content">
        <?php echo $this->content; ?>
      </div>
    </div>
  </blockquote>
<?php } else { ?>
  <blockquote>
    <div class="kmsgtext-quote"><?php echo $this->username . $this->content ?></div>
  </blockquote>
<?php }  ?>