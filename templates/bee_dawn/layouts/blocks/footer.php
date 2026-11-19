<?php

/**
 * @package     Bee Framework
 *
 * @copyright   (C) 2023 Bee Framework. <https://beetemplate.com>
 * @license     GNU General Public License version 2 or later;
 */


// This is the code which will be placed in the footer section

use Joomla\CMS\Factory;
use Joomla\Plugin\System\Bee\BeeTemplate;
use Joomla\Plugin\System\Bee\BeeSection;
use Joomla\Plugin\System\Bee\Element\BeeScrollTopElement;

// No direct access.
defined('_JEXEC') or die('Restricted access');
$doc = Factory::getDocument();
$show_back_to_top = $doc->params->get('show_back_to_top', '');
?>

<?php if ($doc->countModules('footnav-1') || $doc->countModules('footnav-2') || $doc->countModules('footnav-3') || $doc->countModules('footnav-4') || $doc->countModules('footnav-5') || $doc->countModules('footnav-6')) : ?>
  <div <?php echo BeeSection::attrs('bee-footer-nav', 'bee-footer-nav section') ?>>
    <div class="<?php echo BeeSection::container('bee-footer-nav') ?>">
      <div class="row">
        <?php if ($doc->countModules('footnav-1')) : ?>
          <div class="col-xs-6 col-sm-6 col-md-5 col-lg-5 first-col">
            <jdoc:include type="modules" name="footnav-1" style="bee_style" />
          </div>
        <?php endif; ?>


        <?php if ($doc->countModules('footnav-2')) : ?>
          <div class="col-6 col-sm-6 col-md-6 col-lg-2 offset-md-3">
            <jdoc:include type="modules" name="footnav-2" style="bee_style" />
          </div>
        <?php endif; ?>

        <?php if ($doc->countModules('footnav-3')) : ?>
          <div class="col-6 col-sm-6 col-md-2 col-lg-2 last-col">
            <jdoc:include type="modules" name="footnav-3" style="bee_style" />
          </div>
        <?php endif; ?>
      </div>
    </div>
  </div>
<?php endif; ?>

<footer <?php echo BeeSection::attrs('bee-footer', 'bee-footer') ?>>
  <div class="<?php echo BeeSection::container('bee-footer') ?>">
    <div class="bee-footer-inner">
      <?php if ($doc->countModules('footer-l')) : ?>
        <div class="bee-footer-l">
          <jdoc:include type="modules" name="footer-l" style="none" />
        </div>
      <?php endif; ?>

      <?php if ($doc->countModules('footer-r')) : ?>
        <div class="bee-footer-r">
          <jdoc:include type="modules" name="footer-r" style="none" />
        </div>
      <?php endif ?>
    </div>

    <?php if ($show_back_to_top): echo BeeScrollTopElement::render();
    endif; ?>
  </div>
</footer>