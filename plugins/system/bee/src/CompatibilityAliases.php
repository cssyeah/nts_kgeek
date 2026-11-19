<?php
/** Transitional aliases for templates migrated from the original framework. */
namespace Joomla\Plugin\System\Bee;

defined('_JEXEC') or die;

if (!class_exists(__NAMESPACE__ . '\\GKTemplate', false) && class_exists(BeeTemplate::class)) {
    class_alias(BeeTemplate::class, __NAMESPACE__ . '\\GKTemplate');
}
if (!class_exists(__NAMESPACE__ . '\\GKConfig', false) && class_exists(BeeConfig::class)) {
    class_alias(BeeConfig::class, __NAMESPACE__ . '\\GKConfig');
}
