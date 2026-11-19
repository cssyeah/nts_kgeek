<?php
/**
 * @package     Bee Framework
 *
 * @copyright   (C) 2023 Bee Framework. <https://beetemplate.com>
 * @license     GNU General Public License version 2 or later;
 */
?>

<?php if($doc->countModules('breadcrumb')): ?>
<div id="bt-breadcrumb" class="bt-breadcrumb">
  <div class="container">
    <jdoc:include type="modules" name="breadcrumb" style="none" />
  </div>
</div>
<?php endif; ?>