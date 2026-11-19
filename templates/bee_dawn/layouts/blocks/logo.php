<?php
/**
 * @package     Bee Framework
 *
 * @copyright   (C) 2023 Bee Framework. <https://beetemplate.com>
 * @license     GNU General Public License version 2 or later;
 */

use Joomla\CMS\Factory;
use Joomla\CMS\Uri\Uri;

// No direct access.
defined('_JEXEC') or die;

$doc = Factory::getDocument();
$params = $doc->params;
$logo_image = $params->get('logo_image','');

if(($logo_image == '') || ($params->get('logo_type', '') == 'css')) {
  $logo_image = Uri::root() . 'images/logo.png';
} else {
  $logo_image = Uri::root() . $logo_image;
}

$logo_text = $params->get('logo_text', '');
$logo_slogan = $params->get('logo_slogan', '');
?>

<?php if ($params->get('logo_type', 'image') !== 'none'): ?>
  <?php if($params->get('logo_type', 'image') == 'text') : ?>
    <a href="<?php echo Uri::root(); ?>" class="bt-logo text">
      <span><?php echo $params->get('logo_text', ''); ?></span>
        
      <?php if($params->get('logo_slogan', '') != '') : ?>
        <small class="bt-logo-slogan"><?php echo $params->get('logo_slogan', ''); ?></small>
      <?php endif; ?>
    </a>
    <?php elseif($params->get('logo_type', 'image') == 'image') : ?>
    <a href="<?php echo Uri::root(); ?>" class="bt-logo">
      <img 
        src="<?php echo $logo_image; ?>" 
        alt="" 
        />
     </a>
  <?php endif; ?>
<?php endif; ?>