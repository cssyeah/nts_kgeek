<?php
/**
 * @package            Joomla
 * @subpackage         Documents Seller
 * @author             Tuan Pham Ngoc
 * @license            GNU/GPL, see LICENSE.php
 */

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Uri\Uri;

/**
 * Layout variables
 *
 * @var array $categories
 * @var int   $categoryId
 * @var int   $Itemid
 */

if (empty($uiHelper))
{
    $uiHelper = DMSHelperUi::getInstance();
}

$config = DMSHelper::getConfig();

if (count($categories)) { ?>
    <div id="dms-categories">
        <?php
        $rootUri = Uri::root(true);

        for ($i = 0, $n = count($categories); $i < $n; $i++)
        {
	        $category     = $categories[$i];
	        $imgUrl       = $category->imgSrc;
	        $categoryLink = Route::_(DMSHelperRoute::getCategoryRoute($category->id, $Itemid));
            ?>
            <div class="dms-category">
                <div class="dms-box-heading">
                    <h3 class="dms-category-title">
                        <a href="<?php echo $categoryLink; ?>" class="dms-category-title-link">
                            <?php echo $category->name; ?>
                        </a>
	                    <?php
	                    if ($config->show_number_documents)
	                    {
		                ?>
		                    <span class="<?php echo $uiHelper->getClassMapping('badge badge-info'); ?>"><?php echo $category->total_documents; ?></span>
		                <?php
	                    }
	                    ?>
                    </h3>
                </div>
                <?php
                if($category->description)
                {
                ?>
                    <div class="dms-description">
                        <?php
                            if ($imgUrl)
                            {
                            ?>
                                <a href="<?php echo $categoryLink ?>"><img class="dms-thumb-left img-polaroid" src="<?php echo $imgUrl; ?>" alt="<?php echo $category->name; ?>" /></a>
                            <?php
                            }

                            echo $category->description;
                        ?>
                    </div>
                <?php
                }
                ?>
            </div>
        <?php
        }
        ?>
    </div>
<?php
}