<?php

/**
 * Kunena Component
 *
 * @package         Kunena.Template
 * @subpackage      Template
 *
 * @copyright       Copyright (C) 2008 - 2023 Kunena Team. All rights reserved.
 * @license         https://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link            https://www.kunena.org
 **/

defined('_JEXEC') or die();

use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Kunena\Forum\Libraries\Factory\KunenaFactory;
use Kunena\Forum\Libraries\Template\KunenaTemplate;
use Kunena\Forum\Libraries\User\KunenaUserHelper;

// Convert hexa color to rgb
function hex_to_rgb($hex)
{
  list($r, $g, $b) = sscanf($hex, "#%02x%02x%02x");
  return str_replace(' ', ',', "$r $g $b");
}

/**
 * Aurelia template.
 *
 * @since   Kunena 4.0
 */
class KunenaTemplateNts_kgeek extends KunenaTemplate
{
  /**
   * List of parent template names.
   *
   * This template will automatically search for missing files from listed parent templates.
   * The feature allows you to create one base template and only override changed files.
   *
   * @var array
   * @since   Kunena 6.0
   */
  protected $default = ['nts_kgeek'];

  /**
   * Relative paths to various file types in this template.
   *
   * These will override default files in JROOT/media/kunena
   *
   * @var array
   * @since   Kunena 6.0
   */
  protected $pathTypes = [
    'emoticons'     => 'media/kunena/emoticons',
    'ranks'         => 'media/kunena/ranks',
    'icons'         => 'media/kunena/icons',
    'categoryIcons' => 'media/kunena/category_icons',
    'images'        => 'media/kunena/core/images',
    'js'            => 'media/kunena/core/js',
    'css'           => 'media/kunena/core/css',
  ];

  /**
   * User group initialization.
   *
   * @return  void
   *
   * @since   Kunena 6.0
   */
  protected $userClasses = [
    'kwho-',
    'admin'     => 'kwho-admin',
    'globalmod' => 'kwho-globalmoderator',
    'moderator' => 'kwho-moderator',
    'user'      => 'kwho-user',
    'guest'     => 'kwho-guest',
    'banned'    => 'kwho-banned',
    'blocked'   => 'kwho-blocked',
  ];

  /**
   * Logic to load language strings for the template.
   *
   * By default language files are also loaded from the parent templates.
   *
   * @return  void
   *
   * @throws  Exception
   * @since   Kunena 6.0
   */
  public function loadLanguage(): void
  {
    $lang = Factory::getApplication()->getLanguage();
    KunenaFactory::loadLanguage('kunena_tmpl_nts_kgeek');

    foreach (array_reverse($this->default) as $template) {
      $file = "kunena_tmpl_nts_kgeek";
      $lang->load($file, JPATH_SITE) || $lang->load($file, KPATH_SITE) || $lang->load($file, KPATH_SITE . "/template/{$template}");
    }
  }

  /**
   * Template initialization.
   *
   * @return  void
   *
   * @since   Kunena 6.0
   * @throws \ScssPhp\ScssPhp\Exception\SassException
   */
  public function initialize(): void
  {
    $bootstrap = $this->params->get('bootstrap');

    if ($bootstrap) {
      HTMLHelper::_('bootstrap.loadCss');
      HTMLHelper::_('bootstrap.dropdown');
      HTMLHelper::_('bootstrap.tooltip');
      HTMLHelper::_('bootstrap.renderModal');
      HTMLHelper::_('bootstrap.collapse');
      HTMLHelper::_('bootstrap.offcanvas');
      HTMLHelper::_('bootstrap.alert');
    }

    $doc = Factory::getApplication()->getDocument();

    /** @var Joomla\CMS\WebAsset\WebAssetManager $wa */
    $wa = $doc->getWebAssetManager();
    $wa->useScript('jquery');

    // The owner of the draft of the editor: the text is only handed back to the member who wrote it.
    $this->addScriptOptions('com_kunena.draftowner', (int) KunenaUserHelper::getMyself()->userid);
    $this->addScript('assets/js/draft.js');
    $this->addScript('assets/js/main.js');
    $this->addScript('assets/js/tooltips.js');
    // Sliding background for the top menu (kept in its own file, outside the core scripts)
    $this->addScript('assets/js/menu-slider.js');

    // Recompile here SCSS and create cache dir only if doesnt exist
    if (!file_exists(JPATH_SITE . 'media/kunena/cache/')) {
      $this->createCacheDir();
    }

    if ($bootstrap) {
      $this->addScript('assets/js/offcanvas.js');
    }

    $this->addStyleSheet('kunena.css');

    $storage = $this->params->get('localstorage');

    if ($storage) {
      $this->addScript('localstorage.js');
    }

    $filenamescss = JPATH_SITE . '/components/com_kunena/template/nts_kgeek/assets/scss/custom.scss';

    if (file_exists($filenamescss) && 0 != fileSize($filenamescss)) {
      $this->addStyleSheet('kunena-custom.css');
    }

    $filename = KPATH_MEDIA . '/core/css/custom.css';

    if (file_exists($filename)) {
      $this->addStyleSheet('custom.css');
    }

    // $this->loadFontawesome();
    $this->addStyleSheet('assets/fonts/fw-6/css/all.min.css');

		$kPrimary			 			= $this->params->get('kPrimary');
    $kPrimaryRgb			 	= hex_to_rgb($kPrimary);
		$kAccent			 			= $this->params->get('kAccent');
    $kAccentRgb			 	  = hex_to_rgb($kAccent);
		$kSuccess			 			= $this->params->get('kSuccess');
    $kSuccessRgb			 	= hex_to_rgb($kSuccess);
		$kWarning			 			= $this->params->get('kWarning');
    $kWarningRgb			 	= hex_to_rgb($kWarning);
		$kDanger			 			= $this->params->get('kDanger');
		$kDangerRgb			 	  = hex_to_rgb($kDanger);
		$kText 						  = $this->params->get('kText');
    $kTextRgb			 	    = hex_to_rgb($kText);
		$kLink 						  = $this->params->get('kLink');
		$kLinkHover 			  = $this->params->get('kLinkHover');
		$kNavInactiveBg 		= $this->params->get('kNavInactiveBg');
		$kNavInactive			 	= $this->params->get('kNavInactive');
		$kNavHoverBg			 	= $this->params->get('kNavHoverBg');
		$kNavHover			 	  = $this->params->get('kNavHover');
		$kNavActiveBg			 	= $this->params->get('kNavActiveBg');
		$kNavActive			 	  = $this->params->get('kNavActive');
		$kNavSliderBg			 	= $this->params->get('kNavSliderBg', $kNavActiveBg);

		$kHeaderBg 				  = $this->params->get('kHeaderBg');
		$kHeaderText		    = $this->params->get('kheaderText');
		$kHeaderLink 			  = $this->params->get('kHeaderLink');
		$kHeaderLinkHover 	= $this->params->get('kHeaderLinkHover');

		$kIconBg 				    = $this->params->get('kIconBg');
		$kIcon 		          = $this->params->get('kIcon');
		$kIconHover 			  = $this->params->get('kIconHover');


    // Load template colors settings
    $styles    = <<<EOF
		/* Kunena Custom CSS */
		:root {
			--kprimary: 							{$kPrimary};
			--kprimary-rgb:						{$kPrimaryRgb};
			--kaccent:   							{$kAccent};
			--kaccent-rgb:						{$kAccentRgb};
			--ksuccess: 							{$kSuccess};
			--ksuccess-rgb:						{$kSuccessRgb};
			--kwarning: 							{$kWarning};
			--kwarning-rgb:						{$kWarningRgb};
			--kdanger: 							  {$kDanger};
			--kdanger-rgb:						{$kDangerRgb};

			--ktext: 						      {$kText};
			--ktext-rgb: 						  {$kTextRgb};
			--klink: 						      {$kLink};
			--klink-hover:			      {$kLinkHover};

			--kmenu-bg: 				      {$kNavInactiveBg};
			--kmenu-color:	          {$kNavInactive};
			--kmenu-hover-bg: 			  {$kNavHoverBg};
			--kmenu-hover-color: 			{$kNavHover};
			--kmenu-active-bg: 				{$kNavActiveBg};
			--kmenu-active-color: 		{$kNavActive};
			--kmenu-slider-bg: 				{$kNavSliderBg};

			--ksec-header-bg: 				{$kHeaderBg};
			--ksec-header-text: 			{$kHeaderText};
			--ksec-header-link: 			{$kHeaderLink};
			--ksec-header-link-hover: {$kHeaderLinkHover};

			--kicon-bg: 					    {$kIconBg};
			--kicon-color: 		        {$kIcon};
			--kicon-hover-color: 				    {$kIconHover};

		}
EOF;
    $iconcolor = $this->params->get('IconColor');

    if ($iconcolor) {
      $styles .= <<<EOF
		.layout#kunena [class*="category"] i,
		.layout#kunena .glyphicon-topic,
		.layout#kunena #kwho i.icon-users,
		.layout#kunena#kstats i.icon-bars { color: {$iconcolor}; }
EOF;
    }

    $iconcolornew = $this->params->get('IconColorNew');

    if ($iconcolornew) {
      $styles .= <<<EOF
		.layout#kunena [class*="category"] .knewchar { color: {$iconcolornew} !important; }
		.layout#kunena sup.knewchar { color: {$iconcolornew} !important; }
		.layout#kunena .topic-item-unread { border-left-color: {$iconcolornew} !important;}
		.layout#kunena .topic-item-unread .glyphicon { color: {$iconcolornew} !important;}
		.layout#kunena .topic-item-unread i.fa { color: {$iconcolornew} !important;}
		.layout#kunena .topic-item-unread svg { color: {$iconcolornew} !important;}
EOF;
    }

		$kPreset = $this->params->get('kPreset') . ".css";
		if ($kPreset)
		{
			$fileName = "components/com_kunena/template/nts_kgeek/assets/presets/".$kPreset;
			$doc->addStyleSheet($fileName);
		}

    $doc->addStyleDeclaration($styles);

    $this->addScriptOptions('com_kunena.tooltips', $this->params->get('tooltips'));

		// Get custom for template
		$app    = Factory::getApplication();
		$filePath   = JPATH_SITE.'/templates/'.$app->getTemplate().'/css/nts_kgeek_custom.css';
		$customFilePath   = 'templates/'.$app->getTemplate().'/css/nts_kgeek_custom.css';

		if(file_exists($filePath)) {
			$doc->addStyleSheet($customFilePath);
		}

    parent::initialize();
  }

  /**
   * @param         $link
   * @param         $name
   * @param         $scope
   * @param         $type
   * @param   null  $id  id
   *
   * @return  string
   *
   * @since   Kunena 6.0
   */
  public function getButton($link, $name, $scope, $type, $id = null): string
  {
    // Need special style for buttons in drop-down list
    $buttonsDropdown = ['reply', 'quote', 'edit', 'delete', 'subscribe', 'unsubscribe', 'unfavorite', 'favorite', 'unsticky', 'sticky', 'unlock', 'lock', 'moderate', 'undelete', 'permdelete', 'flat', 'threaded', 'indented'];

    $text  = Text::_("COM_KUNENA_BUTTON_{$scope}_{$name}");
    $title = Text::_("COM_KUNENA_BUTTON_{$scope}_{$name}_LONG");

    if ($title == "COM_KUNENA_BUTTON_{$scope}_{$name}_LONG") {
      $title = '';
    }

    if ($id) {
      $id = 'id="' . $id . '"';
    }

    if (in_array($name, $buttonsDropdown)) {
      return <<<HTML
				<a {$id} style="" href="{$link}" rel="nofollow" data-bs-toggle="tooltip" title="{$title}">
				{$text}
				</a>
HTML;
    } else {
      return <<<HTML
				<a {$id} style="" href="{$link}" rel="nofollow" data-bs-toggle="tooltip" title="{$title}">
				<span class="{$name}"></span>
				{$text}
				</a>
HTML;
    }
  }

  /**
   * @param           $name
   * @param   string  $title  title
   *
   * @return  string
   *
   * @since   Kunena 6.0
   */
  public function getIcon($name, $title = ''): string
  {
    return '<span class="kicon ' . $name . '" data-bs-toggle="tooltip" title="' . $title . '"></span>';
  }

  /**
   * @param           $image
   * @param   string  $alt  alt
   *
   * @return  string
   *
   * @since   Kunena 6.0
   */
  public function getImage($image, $alt = ''): string
  {
    return '<img loading=lazy src="' . $this->getImagePath($image) . '" alt="' . $alt . '" />';
  }
}
