<?php

/**
 * @package     Joomla.Site
 * @subpackage  mod_custom
 *
 * Masthead layout: renders the masthead from the active menu item's params
 * (Page Heading, Masthead Description, Masthead Background Color / Image).
 * On a com_dms document detail page, the heading becomes the document title
 * and the description becomes the document's short description. On a
 * com_content article page, they become the article title and intro text.
 *
 * @copyright   (C) 2009 Open Source Matters, Inc. <https://www.joomla.org>
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Uri\Uri;

$app        = Factory::getApplication();
$input      = $app->getInput();
$activeMenu = $app->getMenu()->getActive();
$menuParams = $activeMenu ? $activeMenu->getParams() : null;

$heading = $menuParams ? (string) $menuParams->get('page_heading', '') : '';
$desc    = $menuParams ? (string) $menuParams->get('masthead_desc', '') : '';
$bgColor = $menuParams ? (string) $menuParams->get('masthead_bg_color', '') : '';
$bgImage = $menuParams ? (string) $menuParams->get('masthead_bg', '') : '';

// Document detail page: use the document's title and short description
if ($input->getCmd('option') === 'com_dms' && $input->getCmd('view') === 'document' && ($docId = $input->getInt('id'))) {
    $db    = Factory::getContainer()->get('DatabaseDriver');
    $query = $db->getQuery(true)
        ->select($db->quoteName(['title', 'short_description']))
        ->from($db->quoteName('#__dms_documents'))
        ->where($db->quoteName('id') . ' = :id')
        ->where($db->quoteName('published') . ' = 1')
        ->bind(':id', $docId);
    $document = $db->setQuery($query)->loadObject();

    if ($document) {
        $heading = (string) $document->title;
        $desc    = (string) $document->short_description;
    }
}

// Article detail page: use the article's title and intro text
if ($input->getCmd('option') === 'com_content' && $input->getCmd('view') === 'article' && ($articleId = $input->getInt('id'))) {
    $db    = Factory::getContainer()->get('DatabaseDriver');
    $query = $db->getQuery(true)
        ->select($db->quoteName(['title', 'introtext']))
        ->from($db->quoteName('#__content'))
        ->where($db->quoteName('id') . ' = :id')
        ->where($db->quoteName('state') . ' = 1')
        ->bind(':id', $articleId);
    $article = $db->setQuery($query)->loadObject();

    if ($article) {
        $heading = (string) $article->title;
        $desc    = (string) $article->introtext;
    }
}

if ($heading === '' && trim(strip_tags($desc)) === '' && !$bgColor && !$bgImage) {
    return;
}

$style = [];

if ($bgColor) {
    $style[] = 'background-color: ' . $bgColor;
}

if ($bgImage) {
    $style[] = "background-image: url('" . Uri::root(true) . '/' . ltrim(HTMLHelper::_('cleanImageURL', $bgImage)->url, '/') . "')";
}
?>
<div id="mod-custom<?php echo $module->id; ?>" class="bee-menu-masthead"<?php echo $style ? ' style="' . htmlspecialchars(implode('; ', $style), ENT_QUOTES) . '"' : ''; ?>>
    <div class="container">
        <?php if ($heading !== '') : ?>
            <h1 class="bee-masthead-heading"><?php echo htmlspecialchars($heading, ENT_QUOTES, 'UTF-8'); ?></h1>
        <?php endif; ?>
        <?php if (trim(strip_tags($desc)) !== '') : ?>
            <div class="bee-masthead-desc"><?php echo $desc; ?></div>
        <?php endif; ?>
    </div>
</div>
