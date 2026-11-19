-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table nts_kgeek.kgeek_action_logs
CREATE TABLE IF NOT EXISTS `kgeek_action_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message_language_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` datetime NOT NULL,
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int NOT NULL DEFAULT '0',
  `item_id` int NOT NULL DEFAULT '0',
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_user_id_logdate` (`user_id`,`log_date`),
  KEY `idx_user_id_extension` (`user_id`,`extension`),
  KEY `idx_extension_item_id` (`extension`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_action_logs: ~66 rows (approximately)
DELETE FROM `kgeek_action_logs`;
INSERT INTO `kgeek_action_logs` (`id`, `message_language_key`, `message`, `log_date`, `extension`, `user_id`, `item_id`, `ip_address`) VALUES
	(1, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{"action":"login","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","app":"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR"}', '2026-11-19 14:30:15', 'com_users', 688, 0, 'COM_ACTIONLOGS_DISABLED'),
	(2, 'PLG_ACTIONLOG_JOOMLA_GUIDEDTOURS_TOURSKIPPED', '{"id":12,"title":"Welcome to Joomla!","state":"skipped","step":1,"userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:30:19', 'com_guidedtours.state', 688, 12, 'COM_ACTIONLOGS_DISABLED'),
	(3, 'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_LIBRARY","id":252,"name":"Kunena Framework","extension_name":"Kunena Framework","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 252, 'COM_ACTIONLOGS_DISABLED'),
	(4, 'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_FILE","id":253,"name":"Kunena Media Files","extension_name":"Kunena Media Files","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 253, 'COM_ACTIONLOGS_DISABLED'),
	(5, 'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT","id":254,"name":"com_kunena","extension_name":"com_kunena","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 254, 'COM_ACTIONLOGS_DISABLED'),
	(6, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":255,"name":"plg_finder_kunena","extension_name":"plg_finder_kunena","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 255, 'COM_ACTIONLOGS_DISABLED'),
	(7, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":256,"name":"plg_kunena_finder","extension_name":"plg_kunena_finder","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 256, 'COM_ACTIONLOGS_DISABLED'),
	(8, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":257,"name":"plg_kunena_community","extension_name":"plg_kunena_community","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 257, 'COM_ACTIONLOGS_DISABLED'),
	(9, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":258,"name":"plg_kunena_comprofiler","extension_name":"plg_kunena_comprofiler","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 258, 'COM_ACTIONLOGS_DISABLED'),
	(10, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":259,"name":"plg_kunena_easysocial","extension_name":"plg_kunena_easysocial","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 259, 'COM_ACTIONLOGS_DISABLED'),
	(11, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":260,"name":"plg_kunena_gravatar","extension_name":"plg_kunena_gravatar","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 260, 'COM_ACTIONLOGS_DISABLED'),
	(12, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":261,"name":"plg_kunena_uddeim","extension_name":"plg_kunena_uddeim","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 261, 'COM_ACTIONLOGS_DISABLED'),
	(13, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":262,"name":"plg_kunena_joomla","extension_name":"plg_kunena_joomla","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 262, 'COM_ACTIONLOGS_DISABLED'),
	(14, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":263,"name":"plg_kunena_kunena","extension_name":"plg_kunena_kunena","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 263, 'COM_ACTIONLOGS_DISABLED'),
	(15, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":264,"name":"plg_system_kunena","extension_name":"plg_system_kunena","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 264, 'COM_ACTIONLOGS_DISABLED'),
	(16, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{"action":"add","type":"PLG_ACTIONLOG_JOOMLA_TYPE_TASK","id":4,"title":"Kunena - Remove Expired Bans","itemlink":"index.php?option=com_scheduler&task=task.edit&id=4","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_scheduler.task', 688, 4, 'COM_ACTIONLOGS_DISABLED'),
	(17, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{"action":"add","type":"PLG_ACTIONLOG_JOOMLA_TYPE_TASK","id":5,"title":"Kunena - Trash purge","itemlink":"index.php?option=com_scheduler&task=task.edit&id=5","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_scheduler.task', 688, 5, 'COM_ACTIONLOGS_DISABLED'),
	(18, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{"action":"add","type":"PLG_ACTIONLOG_JOOMLA_TYPE_TASK","id":6,"title":"Kunena - Send the mail notifications queued","itemlink":"index.php?option=com_scheduler&task=task.edit&id=6","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_scheduler.task', 688, 6, 'COM_ACTIONLOGS_DISABLED'),
	(19, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{"action":"add","type":"PLG_ACTIONLOG_JOOMLA_TYPE_TASK","id":7,"title":"Kunena - Clean pending attachments","itemlink":"index.php?option=com_scheduler&task=task.edit&id=7","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_scheduler.task', 688, 7, 'COM_ACTIONLOGS_DISABLED'),
	(20, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{"action":"add","type":"PLG_ACTIONLOG_JOOMLA_TYPE_TASK","id":8,"title":"Kunena - Unsubscribe inactive users from categories","itemlink":"index.php?option=com_scheduler&task=task.edit&id=8","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_scheduler.task', 688, 8, 'COM_ACTIONLOGS_DISABLED'),
	(21, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":265,"name":"PLG_TASK_KUNENA","extension_name":"PLG_TASK_KUNENA","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 265, 'COM_ACTIONLOGS_DISABLED'),
	(22, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":266,"name":"plg_quickicon_kunena","extension_name":"plg_quickicon_kunena","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 266, 'COM_ACTIONLOGS_DISABLED'),
	(23, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":267,"name":"plg_sampledata_kunena","extension_name":"plg_sampledata_kunena","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 267, 'COM_ACTIONLOGS_DISABLED'),
	(24, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":268,"name":"PLG_PRIVACY_KUNENA","extension_name":"PLG_PRIVACY_KUNENA","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 268, 'COM_ACTIONLOGS_DISABLED'),
	(25, 'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PACKAGE","id":269,"name":"pkg_kunena","extension_name":"pkg_kunena","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:31:17', 'com_installer', 688, 269, 'COM_ACTIONLOGS_DISABLED'),
	(26, 'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED', '{"action":"update","type":"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG","id":254,"title":"com_kunena","extension_name":"com_kunena","itemlink":"index.php?option=com_config&task=component.edit&extension_id=254","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:32:28', 'com_config.component', 688, 254, 'COM_ACTIONLOGS_DISABLED'),
	(27, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__menu"}', '2026-11-19 14:32:49', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(28, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED', '{"action":"publish","type":"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM","id":127,"title":"Forum","itemlink":"index.php?option=com_menus&task=item.edit&id=127","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:32:49', 'com_menus.item', 688, 127, 'COM_ACTIONLOGS_DISABLED'),
	(29, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{"action":"update","type":"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM","id":127,"title":"Forum","itemlink":"index.php?option=com_menus&task=item.edit&id=127","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:33:14', 'com_menus.item', 688, 127, 'COM_ACTIONLOGS_DISABLED'),
	(30, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__menu"}', '2026-11-19 14:33:14', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(31, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__menu"}', '2026-11-19 14:33:20', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(32, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UNPUBLISHED', '{"action":"unpublish","type":"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM","id":101,"title":"Home","itemlink":"index.php?option=com_menus&task=item.edit&id=101","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:33:20', 'com_menus.item', 688, 101, 'COM_ACTIONLOGS_DISABLED'),
	(33, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__modules"}', '2026-11-19 14:33:41', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(34, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UNPUBLISHED', '{"action":"unpublish","type":"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE","id":16,"title":"Login Form","itemlink":"index.php?option=com_modules&task=module.edit&id=16","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:33:41', 'com_modules.module', 688, 16, 'COM_ACTIONLOGS_DISABLED'),
	(35, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__modules"}', '2026-11-19 14:33:42', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(36, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UNPUBLISHED', '{"action":"unpublish","type":"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE","id":1,"title":"Main Menu","itemlink":"index.php?option=com_modules&task=module.edit&id=1","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:33:42', 'com_modules.module', 688, 1, 'COM_ACTIONLOGS_DISABLED'),
	(37, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__modules"}', '2026-11-19 14:33:43', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(38, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UNPUBLISHED', '{"action":"unpublish","type":"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE","id":17,"title":"Breadcrumbs","itemlink":"index.php?option=com_modules&task=module.edit&id=17","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:33:43', 'com_modules.module', 688, 17, 'COM_ACTIONLOGS_DISABLED'),
	(39, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 14:34:13', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(40, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 14:34:35', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(41, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 14:34:45', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(42, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 14:35:06', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(43, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 14:35:19', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(44, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{"action":"login","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","app":"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR"}', '2026-11-19 14:58:43', 'com_users', 688, 0, 'COM_ACTIONLOGS_DISABLED'),
	(45, 'PLG_ACTIONLOG_JOOMLA_APPLICATION_CONFIG_UPDATED', '{"action":"update","type":"PLG_ACTIONLOG_JOOMLA_TYPE_APPLICATION_CONFIG","extension_name":"com_config.application","itemlink":"index.php?option=com_config","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:58:56', 'com_config.application', 688, 0, 'COM_ACTIONLOGS_DISABLED'),
	(46, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":270,"name":"PLG_SYSTEM_BEE","extension_name":"PLG_SYSTEM_BEE","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:59:07', 'com_installer', 688, 270, 'COM_ACTIONLOGS_DISABLED'),
	(47, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__extensions"}', '2026-11-19 14:59:16', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(48, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED', '{"action":"publish","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":270,"title":"PLG_SYSTEM_BEE","itemlink":"index.php?option=com_plugins&task=plugin.edit&extension_id=270","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 14:59:16', 'com_plugins.plugin', 688, 270, 'COM_ACTIONLOGS_DISABLED'),
	(49, 'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_TEMPLATE","id":271,"name":"bee_dawn","extension_name":"bee_dawn","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 15:00:14', 'com_installer', 688, 271, 'COM_ACTIONLOGS_DISABLED'),
	(50, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{"action":"update","type":"PLG_ACTIONLOG_JOOMLA_TYPE_STYLE","id":"13","title":"bee_dawn - Default","extension_name":"bee_dawn - Default","itemlink":"index.php?option=com_templates&task=style.edit&id=13","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688"}', '2026-11-19 15:02:16', 'com_templates.style', 688, 13, 'COM_ACTIONLOGS_DISABLED'),
	(51, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 15:20:37', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(52, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 15:22:09', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(53, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 16:42:49', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(54, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 16:44:43', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(55, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 16:45:09', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(56, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 16:45:40', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(57, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 16:46:32', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(58, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 16:47:01', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(59, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 16:47:20', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(60, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 16:48:12', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(61, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 16:48:32', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(62, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 16:48:57', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(63, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 16:49:35', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(64, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 16:50:37', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(65, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 16:50:57', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(66, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 16:51:19', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED'),
	(67, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":688,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=688","userid":688,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=688","table":"#__kunena_categories"}', '2026-11-19 16:51:55', 'com_checkin', 688, 688, 'COM_ACTIONLOGS_DISABLED');

-- Dumping structure for table nts_kgeek.kgeek_action_logs_extensions
CREATE TABLE IF NOT EXISTS `kgeek_action_logs_extensions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_action_logs_extensions: ~21 rows (approximately)
DELETE FROM `kgeek_action_logs_extensions`;
INSERT INTO `kgeek_action_logs_extensions` (`id`, `extension`) VALUES
	(1, 'com_banners'),
	(2, 'com_cache'),
	(3, 'com_categories'),
	(4, 'com_config'),
	(5, 'com_contact'),
	(6, 'com_content'),
	(7, 'com_installer'),
	(8, 'com_media'),
	(9, 'com_menus'),
	(10, 'com_messages'),
	(11, 'com_modules'),
	(12, 'com_newsfeeds'),
	(13, 'com_plugins'),
	(14, 'com_redirect'),
	(15, 'com_tags'),
	(16, 'com_templates'),
	(17, 'com_users'),
	(18, 'com_checkin'),
	(19, 'com_scheduler'),
	(20, 'com_fields'),
	(21, 'com_guidedtours');

-- Dumping structure for table nts_kgeek.kgeek_action_logs_users
CREATE TABLE IF NOT EXISTS `kgeek_action_logs_users` (
  `user_id` int unsigned NOT NULL,
  `notify` tinyint unsigned NOT NULL,
  `extensions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `idx_notify` (`notify`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_action_logs_users: ~0 rows (approximately)
DELETE FROM `kgeek_action_logs_users`;

-- Dumping structure for table nts_kgeek.kgeek_action_log_config
CREATE TABLE IF NOT EXISTS `kgeek_action_log_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_action_log_config: ~23 rows (approximately)
DELETE FROM `kgeek_action_log_config`;
INSERT INTO `kgeek_action_log_config` (`id`, `type_title`, `type_alias`, `id_holder`, `title_holder`, `table_name`, `text_prefix`) VALUES
	(1, 'article', 'com_content.article', 'id', 'title', '#__content', 'PLG_ACTIONLOG_JOOMLA'),
	(2, 'article', 'com_content.form', 'id', 'title', '#__content', 'PLG_ACTIONLOG_JOOMLA'),
	(3, 'banner', 'com_banners.banner', 'id', 'name', '#__banners', 'PLG_ACTIONLOG_JOOMLA'),
	(4, 'user_note', 'com_users.note', 'id', 'subject', '#__user_notes', 'PLG_ACTIONLOG_JOOMLA'),
	(5, 'media', 'com_media.file', '', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
	(6, 'category', 'com_categories.category', 'id', 'title', '#__categories', 'PLG_ACTIONLOG_JOOMLA'),
	(7, 'menu', 'com_menus.menu', 'id', 'title', '#__menu_types', 'PLG_ACTIONLOG_JOOMLA'),
	(8, 'menu_item', 'com_menus.item', 'id', 'title', '#__menu', 'PLG_ACTIONLOG_JOOMLA'),
	(9, 'newsfeed', 'com_newsfeeds.newsfeed', 'id', 'name', '#__newsfeeds', 'PLG_ACTIONLOG_JOOMLA'),
	(10, 'link', 'com_redirect.link', 'id', 'old_url', '#__redirect_links', 'PLG_ACTIONLOG_JOOMLA'),
	(11, 'tag', 'com_tags.tag', 'id', 'title', '#__tags', 'PLG_ACTIONLOG_JOOMLA'),
	(12, 'style', 'com_templates.style', 'id', 'title', '#__template_styles', 'PLG_ACTIONLOG_JOOMLA'),
	(13, 'plugin', 'com_plugins.plugin', 'extension_id', 'name', '#__extensions', 'PLG_ACTIONLOG_JOOMLA'),
	(14, 'component_config', 'com_config.component', 'extension_id', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
	(15, 'contact', 'com_contact.contact', 'id', 'name', '#__contact_details', 'PLG_ACTIONLOG_JOOMLA'),
	(16, 'module', 'com_modules.module', 'id', 'title', '#__modules', 'PLG_ACTIONLOG_JOOMLA'),
	(17, 'access_level', 'com_users.level', 'id', 'title', '#__viewlevels', 'PLG_ACTIONLOG_JOOMLA'),
	(18, 'banner_client', 'com_banners.client', 'id', 'name', '#__banner_clients', 'PLG_ACTIONLOG_JOOMLA'),
	(19, 'application_config', 'com_config.application', '', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
	(20, 'task', 'com_scheduler.task', 'id', 'title', '#__scheduler_tasks', 'PLG_ACTIONLOG_JOOMLA'),
	(21, 'field', 'com_fields.field', 'id', 'title', '#__fields', 'PLG_ACTIONLOG_JOOMLA'),
	(22, 'guidedtour', 'com_guidedtours.state', 'id', 'title', '#__guidedtours', 'PLG_ACTIONLOG_JOOMLA'),
	(23, 'contact', 'com_contact.form', 'id', 'name', '#__contact_details', 'PLG_ACTIONLOG_JOOMLA');

-- Dumping structure for table nts_kgeek.kgeek_assets
CREATE TABLE IF NOT EXISTS `kgeek_assets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_assets: ~99 rows (approximately)
DELETE FROM `kgeek_assets`;
INSERT INTO `kgeek_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
	(1, 0, 0, 197, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.api":{"8":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
	(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
	(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
	(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
	(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
	(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
	(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
	(8, 1, 17, 38, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.edit":{"4":1},"core.edit.state":{"5":1},"core.execute.transition":{"6":1,"5":1}}'),
	(9, 1, 39, 40, 1, 'com_cpanel', 'com_cpanel', '{}'),
	(10, 1, 41, 42, 1, 'com_installer', 'com_installer', '{"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
	(11, 1, 43, 46, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1}}'),
	(12, 11, 44, 45, 2, 'com_languages.language.1', 'English (en-GB)', '{}'),
	(13, 1, 47, 48, 1, 'com_login', 'com_login', '{}'),
	(14, 1, 49, 50, 1, 'com_mails', 'com_mails', '{}'),
	(15, 1, 51, 52, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
	(16, 1, 53, 58, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1}}'),
	(17, 1, 59, 60, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
	(18, 1, 61, 134, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1}}'),
	(19, 1, 135, 138, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
	(20, 1, 139, 140, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1}}'),
	(21, 1, 141, 142, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1}}'),
	(23, 1, 143, 144, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1}}'),
	(24, 1, 149, 152, 1, 'com_users', 'com_users', '{"core.admin":{"7":1}}'),
	(26, 1, 153, 154, 1, 'com_wrapper', 'com_wrapper', '{}'),
	(27, 8, 18, 19, 2, 'com_content.category.2', 'Uncategorised', '{}'),
	(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{}'),
	(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{}'),
	(30, 19, 136, 137, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{}'),
	(32, 24, 150, 151, 2, 'com_users.category.7', 'Uncategorised', '{}'),
	(33, 1, 155, 156, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
	(34, 1, 157, 158, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{}'),
	(35, 1, 159, 160, 1, 'com_tags', 'com_tags', '{}'),
	(36, 1, 161, 162, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
	(37, 1, 163, 164, 1, 'com_ajax', 'com_ajax', '{}'),
	(38, 1, 165, 166, 1, 'com_postinstall', 'com_postinstall', '{}'),
	(39, 18, 62, 63, 2, 'com_modules.module.1', 'Main Menu', '{}'),
	(40, 18, 64, 65, 2, 'com_modules.module.2', 'Login', '{}'),
	(41, 18, 66, 67, 2, 'com_modules.module.3', 'Popular Articles', '{}'),
	(42, 18, 68, 69, 2, 'com_modules.module.4', 'Recently Added Articles', '{}'),
	(43, 18, 70, 71, 2, 'com_modules.module.8', 'Toolbar', '{}'),
	(44, 18, 72, 73, 2, 'com_modules.module.9', 'Notifications', '{}'),
	(45, 18, 74, 75, 2, 'com_modules.module.10', 'Logged-in Users', '{}'),
	(46, 18, 76, 77, 2, 'com_modules.module.12', 'Admin Menu', '{}'),
	(49, 18, 82, 83, 2, 'com_modules.module.15', 'Title', '{}'),
	(50, 18, 84, 85, 2, 'com_modules.module.16', 'Login Form', '{}'),
	(51, 18, 86, 87, 2, 'com_modules.module.17', 'Breadcrumbs', '{}'),
	(52, 18, 88, 89, 2, 'com_modules.module.79', 'Multilanguage status', '{}'),
	(53, 18, 92, 93, 2, 'com_modules.module.86', 'Joomla Version', '{}'),
	(54, 16, 54, 55, 2, 'com_menus.menu.1', 'Main Menu', '{}'),
	(55, 18, 96, 97, 2, 'com_modules.module.87', 'Sample Data', '{}'),
	(56, 8, 20, 37, 2, 'com_content.workflow.1', 'COM_WORKFLOW_BASIC_WORKFLOW', '{}'),
	(57, 56, 21, 22, 3, 'com_content.stage.1', 'COM_WORKFLOW_BASIC_STAGE', '{}'),
	(58, 56, 23, 24, 3, 'com_content.transition.1', 'UNPUBLISH', '{}'),
	(59, 56, 25, 26, 3, 'com_content.transition.2', 'PUBLISH', '{}'),
	(60, 56, 27, 28, 3, 'com_content.transition.3', 'TRASH', '{}'),
	(61, 56, 29, 30, 3, 'com_content.transition.4', 'ARCHIVE', '{}'),
	(62, 56, 31, 32, 3, 'com_content.transition.5', 'FEATURE', '{}'),
	(63, 56, 33, 34, 3, 'com_content.transition.6', 'UNFEATURE', '{}'),
	(64, 56, 35, 36, 3, 'com_content.transition.7', 'PUBLISH_AND_FEATURE', '{}'),
	(65, 1, 145, 146, 1, 'com_privacy', 'com_privacy', '{}'),
	(66, 1, 147, 148, 1, 'com_actionlogs', 'com_actionlogs', '{}'),
	(67, 18, 78, 79, 2, 'com_modules.module.88', 'Latest Actions', '{}'),
	(68, 18, 80, 81, 2, 'com_modules.module.89', 'Privacy Dashboard', '{}'),
	(70, 18, 90, 91, 2, 'com_modules.module.103', 'Site', '{}'),
	(71, 18, 94, 95, 2, 'com_modules.module.104', 'System', '{}'),
	(72, 18, 98, 99, 2, 'com_modules.module.91', 'System Dashboard', '{}'),
	(73, 18, 100, 101, 2, 'com_modules.module.92', 'Content Dashboard', '{}'),
	(74, 18, 102, 103, 2, 'com_modules.module.93', 'Menus Dashboard', '{}'),
	(75, 18, 104, 105, 2, 'com_modules.module.94', 'Components Dashboard', '{}'),
	(76, 18, 106, 107, 2, 'com_modules.module.95', 'Users Dashboard', '{}'),
	(77, 18, 108, 109, 2, 'com_modules.module.99', 'Frontend Link', '{}'),
	(78, 18, 110, 111, 2, 'com_modules.module.100', 'Messages', '{}'),
	(79, 18, 112, 113, 2, 'com_modules.module.101', 'Post Install Messages', '{}'),
	(80, 18, 114, 115, 2, 'com_modules.module.102', 'User Status', '{}'),
	(82, 18, 116, 117, 2, 'com_modules.module.105', '3rd Party', '{}'),
	(83, 18, 118, 119, 2, 'com_modules.module.106', 'Help Dashboard', '{}'),
	(84, 18, 120, 121, 2, 'com_modules.module.107', 'Privacy Requests', '{}'),
	(85, 18, 122, 123, 2, 'com_modules.module.108', 'Privacy Status', '{}'),
	(86, 18, 124, 125, 2, 'com_modules.module.96', 'Popular Articles', '{}'),
	(87, 18, 126, 127, 2, 'com_modules.module.97', 'Recently Added Articles', '{}'),
	(88, 18, 128, 129, 2, 'com_modules.module.98', 'Logged-in Users', '{}'),
	(89, 18, 130, 131, 2, 'com_modules.module.90', 'Login Support', '{}'),
	(90, 1, 167, 184, 1, 'com_scheduler', 'com_scheduler', '{}'),
	(91, 1, 185, 186, 1, 'com_associations', 'com_associations', '{}'),
	(92, 1, 187, 188, 1, 'com_categories', 'com_categories', '{}'),
	(93, 1, 189, 190, 1, 'com_fields', 'com_fields', '{}'),
	(94, 1, 191, 192, 1, 'com_workflow', 'com_workflow', '{}'),
	(95, 1, 193, 194, 1, 'com_guidedtours', 'com_guidedtours', '{}'),
	(96, 18, 132, 133, 2, 'com_modules.module.109', 'Guided Tours', '{}'),
	(97, 90, 168, 169, 2, 'com_scheduler.task.1', 'Rotate Logs', '{}'),
	(98, 90, 170, 171, 2, 'com_scheduler.task.2', 'Session GC', '{}'),
	(99, 90, 172, 173, 2, 'com_scheduler.task.3', 'Update Notification', '{}'),
	(100, 1, 195, 196, 1, 'com_kunena', 'com_kunena', '{}'),
	(101, 90, 174, 175, 2, 'com_scheduler.task.4', 'Kunena - Remove Expired Bans', '{}'),
	(102, 90, 176, 177, 2, 'com_scheduler.task.5', 'Kunena - Trash purge', '{}'),
	(103, 90, 178, 179, 2, 'com_scheduler.task.6', 'Kunena - Send the mail notifications queued', '{}'),
	(104, 90, 180, 181, 2, 'com_scheduler.task.7', 'Kunena - Clean pending attachments', '{}'),
	(105, 90, 182, 183, 2, 'com_scheduler.task.8', 'Kunena - Unsubscribe inactive users from categories', '{}'),
	(106, 16, 56, 57, 2, 'com_menus.menu.2', 'Kunena Menu', '{}');

-- Dumping structure for table nts_kgeek.kgeek_associations
CREATE TABLE IF NOT EXISTS `kgeek_associations` (
  `id` int NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_associations: ~0 rows (approximately)
DELETE FROM `kgeek_associations`;

-- Dumping structure for table nts_kgeek.kgeek_banners
CREATE TABLE IF NOT EXISTS `kgeek_banners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int NOT NULL DEFAULT '0',
  `impmade` int NOT NULL DEFAULT '0',
  `clicks` int NOT NULL DEFAULT '0',
  `clickurl` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint unsigned NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint NOT NULL DEFAULT '-1',
  `track_clicks` tinyint NOT NULL DEFAULT '-1',
  `track_impressions` tinyint NOT NULL DEFAULT '-1',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `reset` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `version` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_banners: ~0 rows (approximately)
DELETE FROM `kgeek_banners`;

-- Dumping structure for table nts_kgeek.kgeek_banner_clients
CREATE TABLE IF NOT EXISTS `kgeek_banner_clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `own_prefix` tinyint NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint NOT NULL DEFAULT '-1',
  `track_clicks` tinyint NOT NULL DEFAULT '-1',
  `track_impressions` tinyint NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_banner_clients: ~0 rows (approximately)
DELETE FROM `kgeek_banner_clients`;

-- Dumping structure for table nts_kgeek.kgeek_banner_tracks
CREATE TABLE IF NOT EXISTS `kgeek_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int unsigned NOT NULL,
  `banner_id` int unsigned NOT NULL,
  `count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_banner_tracks: ~0 rows (approximately)
DELETE FROM `kgeek_banner_tracks`;

-- Dumping structure for table nts_kgeek.kgeek_categories
CREATE TABLE IF NOT EXISTS `kgeek_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `level` int unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `published` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL,
  `modified_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL,
  `hits` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_categories: ~6 rows (approximately)
DELETE FROM `kgeek_categories`;
INSERT INTO `kgeek_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
	(1, 0, 0, 0, 11, 0, '', 'system', 'ROOT', 'root', '', '', 1, NULL, NULL, 1, '{}', '', '', '{}', 688, '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 0, '*', 1),
	(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{"category_layout":"","image":"","workflow_id":"use_default"}', '', '', '{"author":"","robots":""}', 688, '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 0, '*', 1),
	(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 688, '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 0, '*', 1),
	(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 688, '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 0, '*', 1),
	(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 688, '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 0, '*', 1),
	(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 688, '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 0, '*', 1);

-- Dumping structure for table nts_kgeek.kgeek_contact_details
CREATE TABLE IF NOT EXISTS `kgeek_contact_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint unsigned NOT NULL DEFAULT '0',
  `published` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `catid` int NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Set if contact is featured.',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `hits` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_contact_details: ~0 rows (approximately)
DELETE FROM `kgeek_contact_details`;

-- Dumping structure for table nts_kgeek.kgeek_content
CREATE TABLE IF NOT EXISTS `kgeek_content` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `ordering` int NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_alias` (`alias`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_content: ~0 rows (approximately)
DELETE FROM `kgeek_content`;

-- Dumping structure for table nts_kgeek.kgeek_contentitem_tag_map
CREATE TABLE IF NOT EXISTS `kgeek_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';

-- Dumping data for table nts_kgeek.kgeek_contentitem_tag_map: ~0 rows (approximately)
DELETE FROM `kgeek_contentitem_tag_map`;

-- Dumping structure for table nts_kgeek.kgeek_content_frontpage
CREATE TABLE IF NOT EXISTS `kgeek_content_frontpage` (
  `content_id` int NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `featured_up` datetime DEFAULT NULL,
  `featured_down` datetime DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_content_frontpage: ~0 rows (approximately)
DELETE FROM `kgeek_content_frontpage`;

-- Dumping structure for table nts_kgeek.kgeek_content_rating
CREATE TABLE IF NOT EXISTS `kgeek_content_rating` (
  `content_id` int NOT NULL DEFAULT '0',
  `rating_sum` int unsigned NOT NULL DEFAULT '0',
  `rating_count` int unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_content_rating: ~0 rows (approximately)
DELETE FROM `kgeek_content_rating`;

-- Dumping structure for table nts_kgeek.kgeek_content_types
CREATE TABLE IF NOT EXISTS `kgeek_content_types` (
  `type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_content_types: ~14 rows (approximately)
DELETE FROM `kgeek_content_types`;
INSERT INTO `kgeek_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
	(1, 'Article', 'com_content.article', '{"special":{"dbtable":"#__content","key":"id","type":"ArticleTable","prefix":"Joomla\\\\Component\\\\Content\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_user_id":"created_by","core_created_by_alias":"created_by_alias","core_created_time":"created","core_modified_time":"modified","core_body":"introtext", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"attribs", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "asset_id":"asset_id", "note":"note"}, "special":{"fulltext":"fulltext"}}', 'ContentHelperRoute::getArticleRoute', '{"formFile":"administrator\\/components\\/com_content\\/forms\\/article.xml", "hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits", "ordering"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"tags","targetTable":"#__tags","targetColumn":"id","displayColumn":"title"} ]}'),
	(2, 'Contact', 'com_contact.contact', '{"special":{"dbtable":"#__contact_details","key":"id","type":"ContactTable","prefix":"Joomla\\\\Component\\\\Contact\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"address", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"image", "core_urls":"webpage", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "asset_id":"null"}, "special":{"con_position":"con_position","suburb":"suburb","state":"state","country":"country","postcode":"postcode","telephone":"telephone","fax":"fax","misc":"misc","email_to":"email_to","default_con":"default_con","user_id":"user_id","mobile":"mobile","sortname1":"sortname1","sortname2":"sortname2","sortname3":"sortname3"}}', 'ContactHelperRoute::getContactRoute', '{"formFile":"administrator\\/components\\/com_contact\\/forms\\/contact.xml","hideFields":["default_con","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"], "displayLookup":[ {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"tags","targetTable":"#__tags","targetColumn":"id","displayColumn":"title"} ] }'),
	(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{"special":{"dbtable":"#__newsfeeds","key":"id","type":"NewsfeedTable","prefix":"Joomla\\\\Component\\\\Newsfeeds\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "asset_id":"null"}, "special":{"numarticles":"numarticles","cache_time":"cache_time","rtl":"rtl"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{"formFile":"administrator\\/components\\/com_newsfeeds\\/forms\\/newsfeed.xml","hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"tags","targetTable":"#__tags","targetColumn":"id","displayColumn":"title"} ]}'),
	(4, 'User', 'com_users.user', '{"special":{"dbtable":"#__users","key":"id","type":"User","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"null","core_alias":"username","core_created_time":"registerDate","core_modified_time":"lastvisitDate","core_body":"null", "core_hits":"null","core_publish_up":"null","core_publish_down":"null","access":"null", "core_params":"params", "core_featured":"null", "core_metadata":"null", "core_language":"null", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"null", "core_metadesc":"null", "core_catid":"null", "asset_id":"null"}, "special":{}}', '', ''),
	(5, 'Article Category', 'com_content.category', '{"special":{"dbtable":"#__categories","key":"id","type":"CategoryTable","prefix":"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContentHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"tags","targetTable":"#__tags","targetColumn":"id","displayColumn":"title"}]}'),
	(6, 'Contact Category', 'com_contact.category', '{"special":{"dbtable":"#__categories","key":"id","type":"CategoryTable","prefix":"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContactHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"tags","targetTable":"#__tags","targetColumn":"id","displayColumn":"title"}]}'),
	(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{"special":{"dbtable":"#__categories","key":"id","type":"CategoryTable","prefix":"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"tags","targetTable":"#__tags","targetColumn":"id","displayColumn":"title"}]}'),
	(8, 'Tag', 'com_tags.tag', '{"special":{"dbtable":"#__tags","key":"tag_id","type":"TagTable","prefix":"Joomla\\\\Component\\\\Tags\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"null", "asset_id":"null"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path"}}', 'TagsHelperRoute::getTagRoute', '{"formFile":"administrator\\/components\\/com_tags\\/forms\\/tag.xml", "hideFields":["checked_out","checked_out_time","version", "lft", "rgt", "level", "path", "urls", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
	(9, 'Banner', 'com_banners.banner', '{"special":{"dbtable":"#__banners","key":"id","type":"BannerTable","prefix":"Joomla\\\\Component\\\\Banners\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"null","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "asset_id":"null"}, "special":{"imptotal":"imptotal", "impmade":"impmade", "clicks":"clicks", "clickurl":"clickurl", "custombannercode":"custombannercode", "cid":"cid", "purchase_type":"purchase_type", "track_impressions":"track_impressions", "track_clicks":"track_clicks"}}', '', '{"formFile":"administrator\\/components\\/com_banners\\/forms\\/banner.xml", "hideFields":["checked_out","checked_out_time","version", "reset"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "imptotal", "impmade", "reset"], "convertToInt":["publish_up", "publish_down", "ordering"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"cid","targetTable":"#__banner_clients","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
	(10, 'Banners Category', 'com_banners.category', '{"special":{"dbtable":"#__categories","key":"id","type":"CategoryTable","prefix":"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"tags","targetTable":"#__tags","targetColumn":"id","displayColumn":"title"}]}'),
	(11, 'Banner Client', 'com_banners.client', '{"special":{"dbtable":"#__banner_clients","key":"id","type":"ClientTable","prefix":"Joomla\\\\Component\\\\Banners\\\\Administrator\\\\Table\\\\"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_banners\\/forms\\/client.xml", "hideFields":["checked_out","checked_out_time"], "ignoreChanges":["checked_out", "checked_out_time"], "convertToInt":[], "displayLookup":[]}'),
	(12, 'User Notes', 'com_users.note', '{"special":{"dbtable":"#__user_notes","key":"id","type":"NoteTable","prefix":"Joomla\\\\Component\\\\Users\\\\Administrator\\\\Table\\\\"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_users\\/forms\\/note.xml", "hideFields":["checked_out","checked_out_time", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
	(13, 'User Notes Category', 'com_users.category', '{"special":{"dbtable":"#__categories","key":"id","type":"CategoryTable","prefix":"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/forms\\/category.xml", "hideFields":["checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"tags","targetTable":"#__tags","targetColumn":"id","displayColumn":"title"}]}'),
	(14, 'Module', 'com_modules.module', '{"special":{"dbtable":"#__modules","key":"id","type":"Module","prefix":"Joomla\\\\CMS\\\\Table\\\\"}}', '', '{}', '', '{"formFile":"administrator\\/components\\/com_modules\\/forms\\/module.xml", "hideFields":["checked_out", "checked_out_time", "publish_up", "publish_down"], "ignoreChanges":["checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"checked_out", "targetTable":"#__users", "targetColumn":"id", "displayColumn":"name"}]}');

-- Dumping structure for table nts_kgeek.kgeek_extensions
CREATE TABLE IF NOT EXISTS `kgeek_extensions` (
  `extension_id` int NOT NULL AUTO_INCREMENT,
  `package_id` int NOT NULL DEFAULT '0' COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `changelogurl` text COLLATE utf8mb4_unicode_ci,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '1',
  `protected` tinyint NOT NULL DEFAULT '0' COMMENT 'Flag to indicate if the extension is protected. Protected extensions cannot be disabled.',
  `locked` tinyint NOT NULL DEFAULT '0' COMMENT 'Flag to indicate if the extension is locked. Locked extensions cannot be uninstalled.',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int DEFAULT '0',
  `state` int DEFAULT '0',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_extensions: ~251 rows (approximately)
DELETE FROM `kgeek_extensions`;
INSERT INTO `kgeek_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `changelogurl`, `folder`, `client_id`, `enabled`, `access`, `protected`, `locked`, `manifest_cache`, `params`, `custom_data`, `checked_out`, `checked_out_time`, `ordering`, `state`, `note`) VALUES
	(1, 0, 'com_wrapper', 'component', 'com_wrapper', '', '', 1, 1, 1, 0, 1, '{"name":"com_wrapper","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2007 Open Source Matters, Inc.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Wrapper","filename":"wrapper"}', '', '', NULL, NULL, 0, 0, NULL),
	(2, 0, 'com_admin', 'component', 'com_admin', '', '', 1, 1, 1, 1, 1, '{"name":"com_admin","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_ADMIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Admin"}', '', '', NULL, NULL, 0, 0, NULL),
	(3, 0, 'com_banners', 'component', 'com_banners', '', '', 1, 1, 1, 0, 1, '{"name":"com_banners","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_BANNERS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Banners","filename":"banners"}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":"","save_history":"1","history_limit":10}', '', NULL, NULL, 0, 0, NULL),
	(4, 0, 'com_cache', 'component', 'com_cache', '', '', 1, 1, 1, 1, 1, '{"name":"com_cache","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_CACHE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Cache"}', '', '', NULL, NULL, 0, 0, NULL),
	(5, 0, 'com_categories', 'component', 'com_categories', '', '', 1, 1, 1, 1, 1, '{"name":"com_categories","type":"component","creationDate":"2007-12","author":"Joomla! Project","copyright":"(C) 2007 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Categories"}', '', '', NULL, NULL, 0, 0, NULL),
	(6, 0, 'com_checkin', 'component', 'com_checkin', '', '', 1, 1, 1, 1, 1, '{"name":"com_checkin","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Checkin"}', '', '', NULL, NULL, 0, 0, NULL),
	(7, 0, 'com_contact', 'component', 'com_contact', '', '', 1, 1, 1, 0, 1, '{"name":"com_contact","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_CONTACT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Contact","filename":"contact"}', '{"contact_layout":"_:default","show_contact_category":"hide","save_history":"1","history_limit":10,"show_contact_list":"0","presentation_style":"sliders","show_tags":"1","show_info":"1","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_image":"1","show_misc":"1","image":"","allow_vcard":"0","show_articles":"0","articles_display_num":"10","show_profile":"0","show_user_custom_fields":["-1"],"show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"0","maxLevel":"-1","show_subcat_desc":"1","show_subcat_image":"0","show_empty_categories":"0","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_subcat_desc_cat":"1","show_empty_categories_cat":"0","show_cat_items_cat":"1","filter_field":"0","show_pagination_limit":"0","show_headings":"1","show_image_heading":"0","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_pagination":"2","show_pagination_results":"1","initial_sort":"ordering","captcha":"","show_email_form":"1","show_email_copy":"0","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_feed_link":"1","sef_ids":1,"custom_fields_enable":"1"}', '', NULL, NULL, 0, 0, NULL),
	(8, 0, 'com_cpanel', 'component', 'com_cpanel', '', '', 1, 1, 1, 1, 1, '{"name":"com_cpanel","type":"component","creationDate":"2007-06","author":"Joomla! Project","copyright":"(C) 2007 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_CPANEL_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Cpanel"}', '', '', NULL, NULL, 0, 0, NULL),
	(9, 0, 'com_installer', 'component', 'com_installer', '', '', 1, 1, 1, 1, 1, '{"name":"com_installer","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Installer"}', '{"cachetimeout":"6","minimum_stability":"4"}', '', NULL, NULL, 0, 0, NULL),
	(10, 0, 'com_languages', 'component', 'com_languages', '', '', 1, 1, 1, 1, 1, '{"name":"com_languages","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Languages"}', '{"administrator":"en-GB","site":"en-GB"}', '', NULL, NULL, 0, 0, NULL),
	(11, 0, 'com_login', 'component', 'com_login', '', '', 1, 1, 1, 1, 1, '{"name":"com_login","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_LOGIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Login"}', '', '', NULL, NULL, 0, 0, NULL),
	(12, 0, 'com_media', 'component', 'com_media', '', '', 1, 1, 0, 1, 1, '{"name":"com_media","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MEDIA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Media","filename":"media"}', '{"upload_maxsize":"10","file_path":"files","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","restrict_uploads_extensions":"bmp,gif,jpg,jpeg,png,webp,avif,ico,mp3,m4a,mp4a,ogg,mp4,mp4v,mpeg,mov,odg,odp,ods,odt,pdf,ppt,txt,xcf,xls,csv","check_mime":"1","image_extensions":"bmp,gif,jpg,png,jpeg,webp,avif","audio_extensions":"mp3,m4a,mp4a,ogg","video_extensions":"mp4,mp4v,mpeg,mov,webm","doc_extensions":"odg,odp,ods,odt,pdf,ppt,txt,xcf,xls,csv","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,image\\/webp,image\\/avif,audio\\/ogg,audio\\/mpeg,audio\\/mp4,video\\/mp4,video\\/webm,video\\/mpeg,video\\/quicktime,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip"}', '', NULL, NULL, 0, 0, NULL),
	(13, 0, 'com_menus', 'component', 'com_menus', '', '', 1, 1, 1, 1, 1, '{"name":"com_menus","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_MENUS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Menus","filename":"menus"}', '{"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":""}', '', NULL, NULL, 0, 0, NULL),
	(14, 0, 'com_messages', 'component', 'com_messages', '', '', 1, 1, 1, 1, 1, '{"name":"com_messages","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Messages"}', '', '', NULL, NULL, 0, 0, NULL),
	(15, 0, 'com_modules', 'component', 'com_modules', '', '', 1, 1, 1, 1, 1, '{"name":"com_modules","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_MODULES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Modules","filename":"modules"}', '', '', NULL, NULL, 0, 0, NULL),
	(16, 0, 'com_newsfeeds', 'component', 'com_newsfeeds', '', '', 1, 1, 1, 0, 1, '{"name":"com_newsfeeds","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Newsfeeds","filename":"newsfeeds"}', '{"newsfeed_layout":"_:default","save_history":"1","history_limit":5,"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_character_count":"0","feed_display_order":"des","float_first":"right","float_second":"right","show_tags":"1","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_subcat_image":"0","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_items_cat":"1","filter_field":"1","show_pagination_limit":"1","show_headings":"1","show_articles":"0","show_link":"1","show_pagination":"1","show_pagination_results":"1","sef_ids":1}', '', NULL, NULL, 0, 0, NULL),
	(17, 0, 'com_plugins', 'component', 'com_plugins', '', '', 1, 1, 1, 1, 1, '{"name":"com_plugins","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Plugins"}', '', '', NULL, NULL, 0, 0, NULL),
	(18, 0, 'com_templates', 'component', 'com_templates', '', '', 1, 1, 1, 1, 1, '{"name":"com_templates","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Templates"}', '{"template_positions_display":"0","upload_limit":"10","image_formats":"gif,bmp,jpg,jpeg,png,webp","source_formats":"txt,less,ini,xml,js,php,css,scss,sass,json","font_formats":"woff,woff2,ttf,otf","compressed_formats":"zip","difference":"SideBySide"}', '', NULL, NULL, 0, 0, NULL),
	(19, 0, 'com_content', 'component', 'com_content', '', '', 1, 1, 0, 1, 1, '{"name":"com_content","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_CONTENT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Content","filename":"content"}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","info_block_position":"0","info_block_show_title":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_associations":"0","flags":"1","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_readmore":"1","show_readmore_title":"1","readmore_limit":100,"show_tags":"1","record_hits":"1","show_hits":"1","show_noauth":"0","urls_position":0,"captcha":"","show_publishing_options":"1","show_article_options":"1","show_configure_edit_options":"1","show_permissions":"1","show_associations_edit":"1","save_history":"1","history_limit":10,"show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_category_heading_title_text":"1","show_subcat_desc":"1","show_subcat_image":"0","show_cat_num_articles":"0","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":1,"blog_class_leading":"","num_intro_articles":4,"blog_class":"","num_columns":1,"multi_column_order":"0","num_links":4,"show_subcategory_content":"0","link_intro_image":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","display_num":"10","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_featured":"show","show_feed_link":"1","feed_summary":"0","feed_show_readmore":"0","sef_ids":1,"custom_fields_enable":"1","workflow_enabled":"0"}', '', NULL, NULL, 0, 0, NULL),
	(20, 0, 'com_config', 'component', 'com_config', '', '', 1, 1, 0, 1, 1, '{"name":"com_config","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_CONFIG_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Config","filename":"config"}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"9":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', NULL, NULL, 0, 0, NULL),
	(21, 0, 'com_redirect', 'component', 'com_redirect', '', '', 1, 1, 0, 0, 1, '{"name":"com_redirect","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Redirect"}', '', '', NULL, NULL, 0, 0, NULL),
	(22, 0, 'com_users', 'component', 'com_users', '', '', 1, 1, 0, 1, 1, '{"name":"com_users","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_USERS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Users","filename":"users"}', '{"allowUserRegistration":"0","new_usertype":"2","guest_usergroup":"9","sendpassword":"0","useractivation":"2","mail_to_admin":"1","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","minimum_length":"12","minimum_integers":"0","minimum_symbols":"0","minimum_uppercase":"0","save_history":"1","history_limit":5,"mailSubjectPrefix":"","mailBodySuffix":""}', '', NULL, NULL, 0, 0, NULL),
	(23, 0, 'com_finder', 'component', 'com_finder', '', '', 1, 1, 0, 0, 1, '{"name":"com_finder","type":"component","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_FINDER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Finder","filename":"finder"}', '{"enabled":"0","show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_autosuggest":"1","show_suggested_query":"1","show_explained_query":"1","show_advanced":"1","show_advanced_tips":"1","expand_advanced":"0","show_date_filters":"0","sort_order":"relevance","sort_direction":"desc","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stem":"1","stemmer":"snowball","enable_logging":"0"}', '', NULL, NULL, 0, 0, NULL),
	(24, 0, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', '', 1, 1, 0, 1, 1, '{"name":"com_joomlaupdate","type":"component","creationDate":"2021-08","author":"Joomla! Project","copyright":"(C) 2012 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.3","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Joomlaupdate"}', '{"updatesource":"default","customurl":"","autoupdate_status":0,"autoupdate":0,"minimum_stability":"4","update_token":"magXi7mOTZb5r817Qj0oaYhgQPEtZFNa2P4fZNoy"}', '', NULL, NULL, 0, 0, NULL),
	(25, 0, 'com_tags', 'component', 'com_tags', '', '', 1, 1, 1, 0, 1, '{"name":"com_tags","type":"component","creationDate":"2013-12","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_TAGS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Tags","filename":"tags"}', '{"tag_layout":"_:default","save_history":"1","history_limit":5,"show_tag_title":"0","tag_list_show_tag_image":"0","tag_list_show_tag_description":"0","tag_list_image":"","tag_list_orderby":"title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"0","tag_list_show_item_image":"0","tag_list_show_item_description":"0","tag_list_item_maximum_characters":0,"return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_description":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"1","show_pagination_limit":"1","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"1","show_feed_link":"1"}', '', NULL, NULL, 0, 0, NULL),
	(26, 0, 'com_contenthistory', 'component', 'com_contenthistory', '', '', 1, 1, 1, 0, 1, '{"name":"com_contenthistory","type":"component","creationDate":"2013-05","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_CONTENTHISTORY_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Contenthistory","filename":"contenthistory"}', '', '', NULL, NULL, 0, 0, NULL),
	(27, 0, 'com_ajax', 'component', 'com_ajax', '', '', 1, 1, 1, 1, 1, '{"name":"com_ajax","type":"component","creationDate":"2013-08","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_AJAX_XML_DESCRIPTION","group":"","changelogurl":"","filename":"ajax"}', '', '', NULL, NULL, 0, 0, NULL),
	(28, 0, 'com_postinstall', 'component', 'com_postinstall', '', '', 1, 1, 1, 1, 1, '{"name":"com_postinstall","type":"component","creationDate":"2013-09","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_POSTINSTALL_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Postinstall"}', '', '', NULL, NULL, 0, 0, NULL),
	(29, 0, 'com_fields', 'component', 'com_fields', '', '', 1, 1, 1, 0, 1, '{"name":"com_fields","type":"component","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_FIELDS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Fields","filename":"fields"}', '', '', NULL, NULL, 0, 0, NULL),
	(30, 0, 'com_associations', 'component', 'com_associations', '', '', 1, 1, 1, 0, 1, '{"name":"com_associations","type":"component","creationDate":"2017-01","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_ASSOCIATIONS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Associations"}', '', '', NULL, NULL, 0, 0, NULL),
	(31, 0, 'com_privacy', 'component', 'com_privacy', '', '', 1, 1, 1, 0, 1, '{"name":"com_privacy","type":"component","creationDate":"2018-05","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"COM_PRIVACY_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Privacy","filename":"privacy"}', '', '', NULL, NULL, 0, 0, NULL),
	(32, 0, 'com_actionlogs', 'component', 'com_actionlogs', '', '', 1, 1, 1, 0, 1, '{"name":"com_actionlogs","type":"component","creationDate":"2018-05","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"COM_ACTIONLOGS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Actionlogs"}', '{"ip_logging":0,"csv_delimiter":",","loggable_extensions":["com_banners","com_cache","com_categories","com_checkin","com_config","com_contact","com_content","com_fields","com_guidedtours","com_installer","com_media","com_menus","com_messages","com_modules","com_newsfeeds","com_plugins","com_redirect","com_scheduler","com_tags","com_templates","com_users"]}', '', NULL, NULL, 0, 0, NULL),
	(33, 0, 'com_workflow', 'component', 'com_workflow', '', '', 1, 1, 0, 1, 1, '{"name":"com_workflow","type":"component","creationDate":"2017-06","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_WORKFLOW_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Workflow"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(34, 0, 'com_mails', 'component', 'com_mails', '', '', 1, 1, 1, 1, 1, '{"name":"com_mails","type":"component","creationDate":"2019-01","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_MAILS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Mails"}', '', '', NULL, NULL, 0, 0, NULL),
	(35, 0, 'com_scheduler', 'component', 'com_scheduler', '', '', 1, 1, 1, 0, 1, '{"name":"com_scheduler","type":"component","creationDate":"2021-07","author":"Joomla! Project","copyright":"(C) 2021 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.1.0","description":"COM_SCHEDULER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Scheduler"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(36, 0, 'com_guidedtours', 'component', 'com_guidedtours', '', '', 1, 1, 0, 0, 1, '{"name":"com_guidedtours","type":"component","creationDate":"2023-02","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.3.0","description":"COM_GUIDEDTOURS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Guidedtours"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(37, 0, 'lib_joomla', 'library', 'joomla', '', '', 0, 1, 1, 1, 1, '{"name":"lib_joomla","type":"library","creationDate":"2008-01","author":"Joomla! Project","copyright":"(C) 2008 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"https:\\/\\/www.joomla.org","version":"13.1","description":"LIB_JOOMLA_XML_DESCRIPTION","group":"","changelogurl":"","filename":"joomla"}', '', '', NULL, NULL, 0, 0, NULL),
	(38, 0, 'lib_phpass', 'library', 'phpass', '', '', 0, 1, 1, 1, 1, '{"name":"lib_phpass","type":"library","creationDate":"2004-01","author":"Solar Designer","copyright":"","authorEmail":"solar@openwall.com","authorUrl":"https:\\/\\/www.openwall.com\\/phpass\\/","version":"0.5.1","description":"LIB_PHPASS_XML_DESCRIPTION","group":"","changelogurl":"","filename":"phpass"}', '', '', NULL, NULL, 0, 0, NULL),
	(39, 0, 'mod_articles_archive', 'module', 'mod_articles_archive', '', '', 0, 1, 1, 0, 1, '{"name":"mod_articles_archive","type":"module","creationDate":"2006-07","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\ArticlesArchive","filename":"mod_articles_archive"}', '', '', NULL, NULL, 0, 0, NULL),
	(40, 0, 'mod_articles_latest', 'module', 'mod_articles_latest', '', '', 0, 1, 1, 0, 1, '{"name":"mod_articles_latest","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\ArticlesLatest","filename":"mod_articles_latest"}', '', '', NULL, NULL, 0, 0, NULL),
	(41, 0, 'mod_articles_popular', 'module', 'mod_articles_popular', '', '', 0, 1, 1, 0, 1, '{"name":"mod_articles_popular","type":"module","creationDate":"2006-07","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\ArticlesPopular","filename":"mod_articles_popular"}', '', '', NULL, NULL, 0, 0, NULL),
	(42, 0, 'mod_banners', 'module', 'mod_banners', '', '', 0, 1, 1, 0, 1, '{"name":"mod_banners","type":"module","creationDate":"2006-07","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Banners","filename":"mod_banners"}', '', '', NULL, NULL, 0, 0, NULL),
	(43, 0, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', '', 0, 1, 1, 0, 1, '{"name":"mod_breadcrumbs","type":"module","creationDate":"2006-07","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Breadcrumbs","filename":"mod_breadcrumbs"}', '', '', NULL, NULL, 0, 0, NULL),
	(44, 0, 'mod_custom', 'module', 'mod_custom', '', '', 0, 1, 1, 0, 1, '{"name":"mod_custom","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Custom","filename":"mod_custom"}', '', '', NULL, NULL, 0, 0, NULL),
	(45, 0, 'mod_feed', 'module', 'mod_feed', '', '', 0, 1, 1, 0, 1, '{"name":"mod_feed","type":"module","creationDate":"2005-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Feed","filename":"mod_feed"}', '', '', NULL, NULL, 0, 0, NULL),
	(46, 0, 'mod_footer', 'module', 'mod_footer', '', '', 0, 1, 1, 0, 1, '{"name":"mod_footer","type":"module","creationDate":"2006-07","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Footer","filename":"mod_footer"}', '', '', NULL, NULL, 0, 0, NULL),
	(47, 0, 'mod_login', 'module', 'mod_login', '', '', 0, 1, 1, 0, 1, '{"name":"mod_login","type":"module","creationDate":"2006-07","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Login","filename":"mod_login"}', '', '', NULL, NULL, 0, 0, NULL),
	(48, 0, 'mod_menu', 'module', 'mod_menu', '', '', 0, 1, 1, 0, 1, '{"name":"mod_menu","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Menu","filename":"mod_menu"}', '', '', NULL, NULL, 0, 0, NULL),
	(49, 0, 'mod_articles_news', 'module', 'mod_articles_news', '', '', 0, 1, 1, 0, 1, '{"name":"mod_articles_news","type":"module","creationDate":"2006-07","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\ArticlesNews","filename":"mod_articles_news"}', '', '', NULL, NULL, 0, 0, NULL),
	(50, 0, 'mod_random_image', 'module', 'mod_random_image', '', '', 0, 1, 1, 0, 1, '{"name":"mod_random_image","type":"module","creationDate":"2006-07","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\RandomImage","filename":"mod_random_image"}', '', '', NULL, NULL, 0, 0, NULL),
	(51, 0, 'mod_related_items', 'module', 'mod_related_items', '', '', 0, 1, 1, 0, 1, '{"name":"mod_related_items","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RELATED_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\RelatedItems","filename":"mod_related_items"}', '', '', NULL, NULL, 0, 0, NULL),
	(52, 0, 'mod_stats', 'module', 'mod_stats', '', '', 0, 1, 1, 0, 1, '{"name":"mod_stats","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Stats","filename":"mod_stats"}', '', '', NULL, NULL, 0, 0, NULL),
	(53, 0, 'mod_syndicate', 'module', 'mod_syndicate', '', '', 0, 1, 1, 0, 1, '{"name":"mod_syndicate","type":"module","creationDate":"2006-05","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Syndicate","filename":"mod_syndicate"}', '', '', NULL, NULL, 0, 0, NULL),
	(54, 0, 'mod_users_latest', 'module', 'mod_users_latest', '', '', 0, 1, 1, 0, 1, '{"name":"mod_users_latest","type":"module","creationDate":"2009-12","author":"Joomla! Project","copyright":"(C) 2009 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\UsersLatest","filename":"mod_users_latest"}', '', '', NULL, NULL, 0, 0, NULL),
	(55, 0, 'mod_whosonline', 'module', 'mod_whosonline', '', '', 0, 1, 1, 0, 1, '{"name":"mod_whosonline","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Whosonline","filename":"mod_whosonline"}', '', '', NULL, NULL, 0, 0, NULL),
	(56, 0, 'mod_wrapper', 'module', 'mod_wrapper', '', '', 0, 1, 1, 0, 1, '{"name":"mod_wrapper","type":"module","creationDate":"2004-10","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Wrapper","filename":"mod_wrapper"}', '', '', NULL, NULL, 0, 0, NULL),
	(57, 0, 'mod_articles_category', 'module', 'mod_articles_category', '', '', 0, 1, 1, 0, 1, '{"name":"mod_articles_category","type":"module","creationDate":"2010-02","author":"Joomla! Project","copyright":"(C) 2010 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\ArticlesCategory","filename":"mod_articles_category"}', '', '', NULL, NULL, 0, 0, NULL),
	(58, 0, 'mod_articles_categories', 'module', 'mod_articles_categories', '', '', 0, 1, 1, 0, 1, '{"name":"mod_articles_categories","type":"module","creationDate":"2010-02","author":"Joomla! Project","copyright":"(C) 2010 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\ArticlesCategories","filename":"mod_articles_categories"}', '', '', NULL, NULL, 0, 0, NULL),
	(59, 0, 'mod_languages', 'module', 'mod_languages', '', '', 0, 1, 1, 0, 1, '{"name":"mod_languages","type":"module","creationDate":"2010-02","author":"Joomla! Project","copyright":"(C) 2010 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Languages","filename":"mod_languages"}', '', '', NULL, NULL, 0, 0, NULL),
	(60, 0, 'mod_finder', 'module', 'mod_finder', '', '', 0, 1, 0, 0, 1, '{"name":"mod_finder","type":"module","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FINDER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Finder","filename":"mod_finder"}', '', '', NULL, NULL, 0, 0, NULL),
	(61, 0, 'mod_articles', 'module', 'mod_articles', '', '', 0, 1, 0, 0, 1, '{"name":"mod_articles","type":"module","creationDate":"2024-07","author":"Joomla! Project","copyright":"(C) 2024 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.2.0","description":"MOD_ARTICLES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Articles","filename":"mod_articles"}', '', '', NULL, NULL, 0, 0, NULL),
	(62, 0, 'mod_custom', 'module', 'mod_custom', '', '', 1, 1, 1, 0, 1, '{"name":"mod_custom","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Custom","filename":"mod_custom"}', '', '', NULL, NULL, 0, 0, NULL),
	(63, 0, 'mod_feed', 'module', 'mod_feed', '', '', 1, 1, 1, 0, 1, '{"name":"mod_feed","type":"module","creationDate":"2005-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Feed","filename":"mod_feed"}', '', '', NULL, NULL, 0, 0, NULL),
	(64, 0, 'mod_latest', 'module', 'mod_latest', '', '', 1, 1, 1, 0, 1, '{"name":"mod_latest","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Latest","filename":"mod_latest"}', '', '', NULL, NULL, 0, 0, NULL),
	(65, 0, 'mod_logged', 'module', 'mod_logged', '', '', 1, 1, 1, 0, 1, '{"name":"mod_logged","type":"module","creationDate":"2005-01","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Logged","filename":"mod_logged"}', '', '', NULL, NULL, 0, 0, NULL),
	(66, 0, 'mod_login', 'module', 'mod_login', '', '', 1, 1, 1, 0, 1, '{"name":"mod_login","type":"module","creationDate":"2005-03","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Login","filename":"mod_login"}', '', '', NULL, NULL, 0, 0, NULL),
	(67, 0, 'mod_loginsupport', 'module', 'mod_loginsupport', '', '', 1, 1, 1, 0, 1, '{"name":"mod_loginsupport","type":"module","creationDate":"2019-06","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"MOD_LOGINSUPPORT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Loginsupport","filename":"mod_loginsupport"}', '', '', NULL, NULL, 0, 0, NULL),
	(68, 0, 'mod_menu', 'module', 'mod_menu', '', '', 1, 1, 1, 0, 1, '{"name":"mod_menu","type":"module","creationDate":"2006-03","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Menu","filename":"mod_menu"}', '', '', NULL, NULL, 0, 0, NULL),
	(69, 0, 'mod_popular', 'module', 'mod_popular', '', '', 1, 1, 1, 0, 1, '{"name":"mod_popular","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Popular","filename":"mod_popular"}', '', '', NULL, NULL, 0, 0, NULL),
	(70, 0, 'mod_quickicon', 'module', 'mod_quickicon', '', '', 1, 1, 1, 0, 1, '{"name":"mod_quickicon","type":"module","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Quickicon","filename":"mod_quickicon"}', '', '', NULL, NULL, 0, 0, NULL),
	(71, 0, 'mod_frontend', 'module', 'mod_frontend', '', '', 1, 1, 1, 0, 1, '{"name":"mod_frontend","type":"module","creationDate":"2019-07","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"MOD_FRONTEND_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Frontend","filename":"mod_frontend"}', '', '', NULL, NULL, 0, 0, NULL),
	(72, 0, 'mod_messages', 'module', 'mod_messages', '', '', 1, 1, 1, 0, 1, '{"name":"mod_messages","type":"module","creationDate":"2019-07","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"MOD_MESSAGES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Messages","filename":"mod_messages"}', '', '', NULL, NULL, 0, 0, NULL),
	(73, 0, 'mod_post_installation_messages', 'module', 'mod_post_installation_messages', '', '', 1, 1, 1, 0, 1, '{"name":"mod_post_installation_messages","type":"module","creationDate":"2019-07","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"MOD_POST_INSTALLATION_MESSAGES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\PostInstallationMessages","filename":"mod_post_installation_messages"}', '', '', NULL, NULL, 0, 0, NULL),
	(74, 0, 'mod_user', 'module', 'mod_user', '', '', 1, 1, 1, 0, 1, '{"name":"mod_user","type":"module","creationDate":"2019-07","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"MOD_USER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\User","filename":"mod_user"}', '', '', NULL, NULL, 0, 0, NULL),
	(75, 0, 'mod_title', 'module', 'mod_title', '', '', 1, 1, 1, 0, 1, '{"name":"mod_title","type":"module","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TITLE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Title","filename":"mod_title"}', '', '', NULL, NULL, 0, 0, NULL),
	(76, 0, 'mod_toolbar', 'module', 'mod_toolbar', '', '', 1, 1, 1, 0, 1, '{"name":"mod_toolbar","type":"module","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Toolbar","filename":"mod_toolbar"}', '', '', NULL, NULL, 0, 0, NULL),
	(77, 0, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', '', 1, 1, 1, 0, 1, '{"name":"mod_multilangstatus","type":"module","creationDate":"2011-09","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\MultilangStatus","filename":"mod_multilangstatus"}', '{"cache":"0"}', '', NULL, NULL, 0, 0, NULL),
	(78, 0, 'mod_version', 'module', 'mod_version', '', '', 1, 1, 1, 0, 1, '{"name":"mod_version","type":"module","creationDate":"2012-01","author":"Joomla! Project","copyright":"(C) 2012 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_VERSION_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Version","filename":"mod_version"}', '{"cache":"0"}', '', NULL, NULL, 0, 0, NULL),
	(79, 0, 'mod_stats_admin', 'module', 'mod_stats_admin', '', '', 1, 1, 1, 0, 1, '{"name":"mod_stats_admin","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\StatsAdmin","filename":"mod_stats_admin"}', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', NULL, NULL, 0, 0, NULL),
	(80, 0, 'mod_tags_popular', 'module', 'mod_tags_popular', '', '', 0, 1, 1, 0, 1, '{"name":"mod_tags_popular","type":"module","creationDate":"2013-01","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_POPULAR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\TagsPopular","filename":"mod_tags_popular"}', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', NULL, NULL, 0, 0, NULL),
	(81, 0, 'mod_tags_similar', 'module', 'mod_tags_similar', '', '', 0, 1, 1, 0, 1, '{"name":"mod_tags_similar","type":"module","creationDate":"2013-01","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_SIMILAR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\TagsSimilar","filename":"mod_tags_similar"}', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', NULL, NULL, 0, 0, NULL),
	(82, 0, 'mod_sampledata', 'module', 'mod_sampledata', '', '', 1, 1, 1, 0, 1, '{"name":"mod_sampledata","type":"module","creationDate":"2017-07","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.0","description":"MOD_SAMPLEDATA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Sampledata","filename":"mod_sampledata"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(83, 0, 'mod_latestactions', 'module', 'mod_latestactions', '', '', 1, 1, 1, 0, 1, '{"name":"mod_latestactions","type":"module","creationDate":"2018-05","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"MOD_LATESTACTIONS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\LatestActions","filename":"mod_latestactions"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(84, 0, 'mod_privacy_dashboard', 'module', 'mod_privacy_dashboard', '', '', 1, 1, 1, 0, 1, '{"name":"mod_privacy_dashboard","type":"module","creationDate":"2018-06","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"MOD_PRIVACY_DASHBOARD_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\PrivacyDashboard","filename":"mod_privacy_dashboard"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(85, 0, 'mod_submenu', 'module', 'mod_submenu', '', '', 1, 1, 1, 0, 1, '{"name":"mod_submenu","type":"module","creationDate":"2006-02","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Submenu","filename":"mod_submenu"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(86, 0, 'mod_privacy_status', 'module', 'mod_privacy_status', '', '', 1, 1, 1, 0, 1, '{"name":"mod_privacy_status","type":"module","creationDate":"2019-07","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"MOD_PRIVACY_STATUS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\PrivacyStatus","filename":"mod_privacy_status"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(87, 0, 'mod_guidedtours', 'module', 'mod_guidedtours', '', '', 1, 1, 1, 0, 1, '{"name":"mod_guidedtours","type":"module","creationDate":"2023-02","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.3.0","description":"MOD_GUIDEDTOURS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\GuidedTours","filename":"mod_guidedtours"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(88, 0, 'plg_actionlog_joomla', 'plugin', 'joomla', '', 'actionlog', 0, 1, 1, 0, 1, '{"name":"plg_actionlog_joomla","type":"plugin","creationDate":"2018-05","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_ACTIONLOG_JOOMLA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Actionlog\\\\Joomla","filename":"joomla"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(89, 0, 'plg_api-authentication_basic', 'plugin', 'basic', '', 'api-authentication', 0, 0, 1, 0, 1, '{"name":"plg_api-authentication_basic","type":"plugin","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_API-AUTHENTICATION_BASIC_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\ApiAuthentication\\\\Basic","filename":"basic"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(90, 0, 'plg_api-authentication_token', 'plugin', 'token', '', 'api-authentication', 0, 1, 1, 0, 1, '{"name":"plg_api-authentication_token","type":"plugin","creationDate":"2019-11","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_API-AUTHENTICATION_TOKEN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\ApiAuthentication\\\\Token","filename":"token"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(91, 0, 'plg_authentication_cookie', 'plugin', 'cookie', '', 'authentication', 0, 1, 1, 0, 1, '{"name":"plg_authentication_cookie","type":"plugin","creationDate":"2013-07","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTHENTICATION_COOKIE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Authentication\\\\Cookie","filename":"cookie"}', '', '', NULL, NULL, 1, 0, NULL),
	(92, 0, 'plg_authentication_joomla', 'plugin', 'joomla', '', 'authentication', 0, 1, 1, 1, 1, '{"name":"plg_authentication_joomla","type":"plugin","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTHENTICATION_JOOMLA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Authentication\\\\Joomla","filename":"joomla"}', '', '', NULL, NULL, 2, 0, NULL),
	(93, 0, 'plg_authentication_ldap', 'plugin', 'ldap', '', 'authentication', 0, 0, 1, 0, 1, '{"name":"plg_authentication_ldap","type":"plugin","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LDAP_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Authentication\\\\Ldap","filename":"ldap"}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', NULL, NULL, 3, 0, NULL),
	(94, 0, 'plg_behaviour_compat6', 'plugin', 'compat6', '', 'behaviour', 0, 0, 1, 0, 1, '{"name":"plg_behaviour_compat6","type":"plugin","creationDate":"2025-04","author":"Joomla! Project","copyright":"(C) 2025 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.0.0","description":"PLG_COMPAT6_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Behaviour\\\\Compat6","filename":"compat6"}', '{"classes_aliases":"0","legacy_classes":"1"}', '', NULL, NULL, 1, 0, NULL),
	(95, 0, 'plg_behaviour_taggable', 'plugin', 'taggable', '', 'behaviour', 0, 1, 1, 0, 1, '{"name":"plg_behaviour_taggable","type":"plugin","creationDate":"2015-08","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_BEHAVIOUR_TAGGABLE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Behaviour\\\\Taggable","filename":"taggable"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(96, 0, 'plg_behaviour_versionable', 'plugin', 'versionable', '', 'behaviour', 0, 1, 1, 0, 1, '{"name":"plg_behaviour_versionable","type":"plugin","creationDate":"2015-08","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_BEHAVIOUR_VERSIONABLE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Behaviour\\\\Versionable","filename":"versionable"}', '{}', '', NULL, NULL, 3, 0, NULL),
	(97, 0, 'plg_captcha_powcaptcha', 'plugin', 'powcaptcha', '', 'captcha', 0, 1, 1, 0, 1, '{"name":"plg_captcha_powcaptcha","type":"plugin","creationDate":"2025-12","author":"Joomla! Project","copyright":"(C) 2025 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.1.0","description":"PLG_CAPTCHA_POWCAPTCHA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Captcha\\\\POWCaptcha","filename":"powcaptcha"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(98, 0, 'plg_content_confirmconsent', 'plugin', 'confirmconsent', '', 'content', 0, 0, 1, 0, 1, '{"name":"plg_content_confirmconsent","type":"plugin","creationDate":"2018-05","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_CONTENT_CONFIRMCONSENT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\ConfirmConsent","filename":"confirmconsent"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(99, 0, 'plg_content_contact', 'plugin', 'contact', '', 'content', 0, 1, 1, 0, 1, '{"name":"plg_content_contact","type":"plugin","creationDate":"2014-01","author":"Joomla! Project","copyright":"(C) 2014 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.2","description":"PLG_CONTENT_CONTACT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\Contact","filename":"contact"}', '', '', NULL, NULL, 2, 0, NULL),
	(100, 0, 'plg_content_emailcloak', 'plugin', 'emailcloak', '', 'content', 0, 1, 1, 0, 1, '{"name":"plg_content_emailcloak","type":"plugin","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\EmailCloak","filename":"emailcloak"}', '{"mode":"1"}', '', NULL, NULL, 3, 0, NULL),
	(101, 0, 'plg_content_fields', 'plugin', 'fields', '', 'content', 0, 1, 1, 0, 1, '{"name":"plg_content_fields","type":"plugin","creationDate":"2017-02","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_CONTENT_FIELDS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\Fields","filename":"fields"}', '', '', NULL, NULL, 4, 0, NULL),
	(102, 0, 'plg_content_finder', 'plugin', 'finder', '', 'content', 0, 1, 1, 0, 1, '{"name":"plg_content_finder","type":"plugin","creationDate":"2011-12","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\Finder","filename":"finder"}', '', '', NULL, NULL, 5, 0, NULL),
	(103, 0, 'plg_content_joomla', 'plugin', 'joomla', '', 'content', 0, 1, 1, 0, 1, '{"name":"plg_content_joomla","type":"plugin","creationDate":"2010-11","author":"Joomla! Project","copyright":"(C) 2010 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\Joomla","filename":"joomla"}', '', '', NULL, NULL, 6, 0, NULL),
	(104, 0, 'plg_content_loadmodule', 'plugin', 'loadmodule', '', 'content', 0, 1, 1, 0, 1, '{"name":"plg_content_loadmodule","type":"plugin","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\LoadModule","filename":"loadmodule"}', '{"style":"xhtml"}', '', NULL, NULL, 7, 0, NULL),
	(105, 0, 'plg_content_pagebreak', 'plugin', 'pagebreak', '', 'content', 0, 1, 1, 0, 1, '{"name":"plg_content_pagebreak","type":"plugin","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\PageBreak","filename":"pagebreak"}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', NULL, NULL, 8, 0, NULL),
	(106, 0, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', '', 'content', 0, 1, 1, 0, 1, '{"name":"plg_content_pagenavigation","type":"plugin","creationDate":"2006-01","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\PageNavigation","filename":"pagenavigation"}', '{"position":"1"}', '', NULL, NULL, 9, 0, NULL),
	(107, 0, 'plg_content_vote', 'plugin', 'vote', '', 'content', 0, 0, 1, 0, 1, '{"name":"plg_content_vote","type":"plugin","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_VOTE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\Vote","filename":"vote"}', '', '', NULL, NULL, 10, 0, NULL),
	(108, 0, 'plg_editors-xtd_article', 'plugin', 'article', '', 'editors-xtd', 0, 1, 1, 0, 1, '{"name":"plg_editors-xtd_article","type":"plugin","creationDate":"2009-10","author":"Joomla! Project","copyright":"(C) 2009 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\EditorsXtd\\\\Article","filename":"article"}', '', '', NULL, NULL, 1, 0, NULL),
	(109, 0, 'plg_editors-xtd_contact', 'plugin', 'contact', '', 'editors-xtd', 0, 1, 1, 0, 1, '{"name":"plg_editors-xtd_contact","type":"plugin","creationDate":"2016-10","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\EditorsXtd\\\\Contact","filename":"contact"}', '', '', NULL, NULL, 2, 0, NULL),
	(110, 0, 'plg_editors-xtd_fields', 'plugin', 'fields', '', 'editors-xtd', 0, 1, 1, 0, 1, '{"name":"plg_editors-xtd_fields","type":"plugin","creationDate":"2017-02","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\EditorsXtd\\\\Fields","filename":"fields"}', '', '', NULL, NULL, 3, 0, NULL),
	(111, 0, 'plg_editors-xtd_image', 'plugin', 'image', '', 'editors-xtd', 0, 1, 1, 0, 1, '{"name":"plg_editors-xtd_image","type":"plugin","creationDate":"2004-08","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\EditorsXtd\\\\Image","filename":"image"}', '', '', NULL, NULL, 4, 0, NULL),
	(112, 0, 'plg_editors-xtd_menu', 'plugin', 'menu', '', 'editors-xtd', 0, 1, 1, 0, 1, '{"name":"plg_editors-xtd_menu","type":"plugin","creationDate":"2016-08","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\EditorsXtd\\\\Menu","filename":"menu"}', '', '', NULL, NULL, 5, 0, NULL),
	(113, 0, 'plg_editors-xtd_module', 'plugin', 'module', '', 'editors-xtd', 0, 1, 1, 0, 1, '{"name":"plg_editors-xtd_module","type":"plugin","creationDate":"2015-10","author":"Joomla! Project","copyright":"(C) 2015 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_MODULE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\EditorsXtd\\\\Module","filename":"module"}', '', '', NULL, NULL, 6, 0, NULL),
	(114, 0, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', '', 'editors-xtd', 0, 1, 1, 0, 1, '{"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"2004-08","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\EditorsXtd\\\\PageBreak","filename":"pagebreak"}', '', '', NULL, NULL, 7, 0, NULL),
	(115, 0, 'plg_editors-xtd_readmore', 'plugin', 'readmore', '', 'editors-xtd', 0, 1, 1, 0, 1, '{"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"2006-03","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_READMORE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\EditorsXtd\\\\ReadMore","filename":"readmore"}', '', '', NULL, NULL, 8, 0, NULL),
	(116, 0, 'plg_editors_codemirror', 'plugin', 'codemirror', '', 'editors', 0, 1, 1, 0, 1, '{"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"Copyright (C) 2014 - 2021 by Marijn Haverbeke <marijnh@gmail.com> and others","authorEmail":"marijnh@gmail.com","authorUrl":"https:\\/\\/codemirror.net\\/","version":"6.0.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Editors\\\\CodeMirror","filename":"codemirror"}', '{"lineNumbers":"1","lineWrapping":"1","matchTags":"1","matchBrackets":"1","marker-gutter":"1","autoCloseTags":"1","autoCloseBrackets":"1","autoFocus":"1","theme":"default","tabmode":"indent"}', '', NULL, NULL, 1, 0, NULL),
	(117, 0, 'plg_editors_none', 'plugin', 'none', '', 'editors', 0, 1, 1, 1, 1, '{"name":"plg_editors_none","type":"plugin","creationDate":"2005-09","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_NONE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Editors\\\\None","filename":"none"}', '', '', NULL, NULL, 2, 0, NULL),
	(118, 0, 'plg_editors_tinymce', 'plugin', 'tinymce', '', 'editors', 0, 1, 1, 0, 1, '{"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-08","author":"Tiny Technologies, Inc","copyright":"Tiny Technologies, Inc","authorEmail":"N\\/A","authorUrl":"https:\\/\\/www.tiny.cloud","version":"8.9.1","description":"PLG_TINY_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Editors\\\\TinyMCE","filename":"tinymce"}', '{"configuration":{"toolbars":{"2":{"toolbar1":["bold","underline","strikethrough","|","readmore","|","undo","redo","|","bullist","numlist","|","pastetext"]},"1":{"menu":["edit","insert","view","format","table","tools"],"toolbar1":["bold","italic","underline","strikethrough","|","alignleft","aligncenter","alignright","alignjustify","|","readmore","|","blocks","|","bullist","numlist","|","outdent","indent","|","undo","redo","|","link","unlink","anchor","code","|","hr","table","|","subscript","superscript","|","charmap","pastetext","preview"]},"0":{"menu":["edit","insert","view","format","table","tools"],"toolbar1":["bold","italic","underline","strikethrough","|","alignleft","aligncenter","alignright","alignjustify","|","readmore","|","lineheight","|","styles","|","blocks","fontfamily","fontsize","|","searchreplace","|","bullist","numlist","|","outdent","indent","|","undo","redo","|","link","unlink","anchor","image","|","code","|","forecolor","backcolor","|","fullscreen","|","table","|","subscript","superscript","|","charmap","emoticons","media","hr","ltr","rtl","|","cut","copy","paste","pastetext","|","visualchars","visualblocks","nonbreaking","blockquote","jtemplate","|","print","preview","codesample","insertdatetime","removeformat","language","abbr","abbr_remove"]}},"setoptions":{"2":{"access":["1"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"1","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"0","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""},"1":{"access":["6","2"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"1","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"0","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""},"0":{"access":["7","4","8"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"1","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"1","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""}}},"sets_amount":3,"html_height":"550px","html_width":"100%"}', '', NULL, NULL, 3, 0, NULL),
	(119, 0, 'plg_extension_finder', 'plugin', 'finder', '', 'extension', 0, 1, 1, 0, 1, '{"name":"plg_extension_finder","type":"plugin","creationDate":"2018-06","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_EXTENSION_FINDER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Extension\\\\Finder","filename":"finder"}', '', '', NULL, NULL, 1, 0, NULL),
	(120, 0, 'plg_extension_joomla', 'plugin', 'joomla', '', 'extension', 0, 1, 1, 0, 1, '{"name":"plg_extension_joomla","type":"plugin","creationDate":"2010-05","author":"Joomla! Project","copyright":"(C) 2010 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Extension\\\\Joomla","filename":"joomla"}', '', '', NULL, NULL, 2, 0, NULL),
	(121, 0, 'plg_extension_joomlaupdate', 'plugin', 'joomlaupdate', '', 'extension', 0, 1, 1, 0, 1, '{"name":"plg_extension_joomlaupdate","type":"plugin","creationDate":"2025-02","author":"Joomla! Project","copyright":"(C) 2025 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.0.0","description":"PLG_EXTENSION_JOOMLAUPDATE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Extension\\\\Joomlaupdate","filename":"joomlaupdate"}', '', '', NULL, NULL, 3, 0, NULL),
	(122, 0, 'plg_extension_namespacemap', 'plugin', 'namespacemap', '', 'extension', 0, 1, 1, 1, 1, '{"name":"plg_extension_namespacemap","type":"plugin","creationDate":"2017-05","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_EXTENSION_NAMESPACEMAP_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Extension\\\\NamespaceMap","filename":"namespacemap"}', '{}', '', NULL, NULL, 4, 0, NULL),
	(123, 0, 'plg_fields_calendar', 'plugin', 'calendar', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_calendar","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_CALENDAR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Calendar","filename":"calendar"}', '', '', NULL, NULL, 1, 0, NULL),
	(124, 0, 'plg_fields_checkboxes', 'plugin', 'checkboxes', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_checkboxes","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Checkboxes","filename":"checkboxes"}', '', '', NULL, NULL, 2, 0, NULL),
	(125, 0, 'plg_fields_color', 'plugin', 'color', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_color","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_COLOR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Color","filename":"color"}', '', '', NULL, NULL, 3, 0, NULL),
	(126, 0, 'plg_fields_editor', 'plugin', 'editor', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_editor","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_EDITOR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Editor","filename":"editor"}', '{"buttons":0,"width":"100%","height":"250px","filter":"\\\\Joomla\\\\CMS\\\\Component\\\\ComponentHelper::filterText"}', '', NULL, NULL, 4, 0, NULL),
	(127, 0, 'plg_fields_imagelist', 'plugin', 'imagelist', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_imagelist","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Imagelist","filename":"imagelist"}', '', '', NULL, NULL, 5, 0, NULL),
	(128, 0, 'plg_fields_integer', 'plugin', 'integer', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_integer","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_INTEGER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Integer","filename":"integer"}', '{"multiple":"0","first":"1","last":"100","step":"1"}', '', NULL, NULL, 6, 0, NULL),
	(129, 0, 'plg_fields_list', 'plugin', 'list', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_list","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_LIST_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\ListField","filename":"list"}', '', '', NULL, NULL, 7, 0, NULL),
	(130, 0, 'plg_fields_media', 'plugin', 'media', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_media","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_MEDIA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Media","filename":"media"}', '', '', NULL, NULL, 8, 0, NULL),
	(131, 0, 'plg_fields_note', 'plugin', 'note', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_note","type":"plugin","creationDate":"2025-03","author":"Joomla! Project","copyright":"(C) 2025 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.0.0","description":"PLG_FIELDS_NOTE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Note","filename":"note"}', '{"class":"alert alert-info","heading":"h4"}', '', NULL, NULL, 9, 0, NULL),
	(132, 0, 'plg_fields_number', 'plugin', 'number', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_number","type":"plugin","creationDate":"2025-03","author":"Joomla! Project","copyright":"(C) 2025 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.0.0","description":"PLG_FIELDS_NUMBER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Number","filename":"number"}', '{"min":"1.0","max":"100.0","step":"0.1","currency":"0","symbol":"","position":"0","decimals":"2"}', '', NULL, NULL, 10, 0, NULL),
	(133, 0, 'plg_fields_radio', 'plugin', 'radio', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_radio","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_RADIO_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Radio","filename":"radio"}', '', '', NULL, NULL, 11, 0, NULL),
	(134, 0, 'plg_fields_sql', 'plugin', 'sql', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_sql","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_SQL_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\SQL","filename":"sql"}', '', '', NULL, NULL, 12, 0, NULL),
	(135, 0, 'plg_fields_subform', 'plugin', 'subform', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_subform","type":"plugin","creationDate":"2017-06","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_FIELDS_SUBFORM_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Subform","filename":"subform"}', '', '', NULL, NULL, 13, 0, NULL),
	(136, 0, 'plg_fields_text', 'plugin', 'text', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_text","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_TEXT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Text","filename":"text"}', '', '', NULL, NULL, 14, 0, NULL),
	(137, 0, 'plg_fields_textarea', 'plugin', 'textarea', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_textarea","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Textarea","filename":"textarea"}', '{"rows":10,"cols":10,"maxlength":"","filter":"\\\\Joomla\\\\CMS\\\\Component\\\\ComponentHelper::filterText"}', '', NULL, NULL, 15, 0, NULL),
	(138, 0, 'plg_fields_url', 'plugin', 'url', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_url","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_URL_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Url","filename":"url"}', '', '', NULL, NULL, 16, 0, NULL),
	(139, 0, 'plg_fields_user', 'plugin', 'user', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_user","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_USER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\User","filename":"user"}', '', '', NULL, NULL, 17, 0, NULL),
	(140, 0, 'plg_fields_usergrouplist', 'plugin', 'usergrouplist', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_usergrouplist","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\UsergroupList","filename":"usergrouplist"}', '', '', NULL, NULL, 18, 0, NULL),
	(141, 0, 'plg_filesystem_local', 'plugin', 'local', '', 'filesystem', 0, 1, 1, 0, 1, '{"name":"plg_filesystem_local","type":"plugin","creationDate":"2017-04","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_FILESYSTEM_LOCAL_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Filesystem\\\\Local","filename":"local"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(142, 0, 'plg_finder_categories', 'plugin', 'categories', '', 'finder', 0, 1, 1, 0, 1, '{"name":"plg_finder_categories","type":"plugin","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Finder\\\\Categories","filename":"categories"}', '', '', NULL, NULL, 1, 0, NULL),
	(143, 0, 'plg_finder_contacts', 'plugin', 'contacts', '', 'finder', 0, 1, 1, 0, 1, '{"name":"plg_finder_contacts","type":"plugin","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Finder\\\\Contacts","filename":"contacts"}', '', '', NULL, NULL, 2, 0, NULL),
	(144, 0, 'plg_finder_content', 'plugin', 'content', '', 'finder', 0, 1, 1, 0, 1, '{"name":"plg_finder_content","type":"plugin","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Finder\\\\Content","filename":"content"}', '', '', NULL, NULL, 3, 0, NULL),
	(145, 0, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', '', 'finder', 0, 1, 1, 0, 1, '{"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Finder\\\\Newsfeeds","filename":"newsfeeds"}', '', '', NULL, NULL, 4, 0, NULL),
	(146, 0, 'plg_finder_tags', 'plugin', 'tags', '', 'finder', 0, 1, 1, 0, 1, '{"name":"plg_finder_tags","type":"plugin","creationDate":"2013-02","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_TAGS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Finder\\\\Tags","filename":"tags"}', '', '', NULL, NULL, 5, 0, NULL),
	(147, 0, 'plg_installer_folderinstaller', 'plugin', 'folderinstaller', '', 'installer', 0, 1, 1, 0, 1, '{"name":"plg_installer_folderinstaller","type":"plugin","creationDate":"2016-05","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Installer\\\\Folder","filename":"folderinstaller"}', '', '', NULL, NULL, 2, 0, NULL),
	(148, 0, 'plg_installer_override', 'plugin', 'override', '', 'installer', 0, 1, 1, 0, 1, '{"name":"plg_installer_override","type":"plugin","creationDate":"2018-06","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_INSTALLER_OVERRIDE_PLUGIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Installer\\\\Override","filename":"override"}', '', '', NULL, NULL, 4, 0, NULL),
	(149, 0, 'plg_installer_packageinstaller', 'plugin', 'packageinstaller', '', 'installer', 0, 1, 1, 0, 1, '{"name":"plg_installer_packageinstaller","type":"plugin","creationDate":"2016-05","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Installer\\\\Package","filename":"packageinstaller"}', '', '', NULL, NULL, 1, 0, NULL),
	(150, 0, 'plg_installer_urlinstaller', 'plugin', 'urlinstaller', '', 'installer', 0, 1, 1, 0, 1, '{"name":"plg_installer_urlinstaller","type":"plugin","creationDate":"2016-05","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Installer\\\\Url","filename":"urlinstaller"}', '', '', NULL, NULL, 3, 0, NULL),
	(151, 0, 'plg_installer_webinstaller', 'plugin', 'webinstaller', '', 'installer', 0, 1, 1, 0, 1, '{"name":"plg_installer_webinstaller","type":"plugin","creationDate":"2017-04","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_INSTALLER_WEBINSTALLER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Installer\\\\Web","filename":"webinstaller"}', '{"tab_position":"1"}', '', NULL, NULL, 5, 0, NULL),
	(152, 0, 'plg_media-action_crop', 'plugin', 'crop', '', 'media-action', 0, 1, 1, 0, 1, '{"name":"plg_media-action_crop","type":"plugin","creationDate":"2017-01","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_MEDIA-ACTION_CROP_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\MediaAction\\\\Crop","filename":"crop"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(153, 0, 'plg_media-action_resize', 'plugin', 'resize', '', 'media-action', 0, 1, 1, 0, 1, '{"name":"plg_media-action_resize","type":"plugin","creationDate":"2017-01","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_MEDIA-ACTION_RESIZE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\MediaAction\\\\Resize","filename":"resize"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(154, 0, 'plg_media-action_rotate', 'plugin', 'rotate', '', 'media-action', 0, 1, 1, 0, 1, '{"name":"plg_media-action_rotate","type":"plugin","creationDate":"2017-01","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_MEDIA-ACTION_ROTATE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\MediaAction\\\\Rotate","filename":"rotate"}', '{}', '', NULL, NULL, 3, 0, NULL),
	(155, 0, 'plg_privacy_actionlogs', 'plugin', 'actionlogs', '', 'privacy', 0, 1, 1, 0, 1, '{"name":"plg_privacy_actionlogs","type":"plugin","creationDate":"2018-07","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_PRIVACY_ACTIONLOGS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Privacy\\\\Actionlogs","filename":"actionlogs"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(156, 0, 'plg_privacy_consents', 'plugin', 'consents', '', 'privacy', 0, 1, 1, 0, 1, '{"name":"plg_privacy_consents","type":"plugin","creationDate":"2018-07","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_PRIVACY_CONSENTS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Privacy\\\\Consents","filename":"consents"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(157, 0, 'plg_privacy_contact', 'plugin', 'contact', '', 'privacy', 0, 1, 1, 0, 1, '{"name":"plg_privacy_contact","type":"plugin","creationDate":"2018-07","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_PRIVACY_CONTACT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Privacy\\\\Contact","filename":"contact"}', '{}', '', NULL, NULL, 3, 0, NULL),
	(158, 0, 'plg_privacy_content', 'plugin', 'content', '', 'privacy', 0, 1, 1, 0, 1, '{"name":"plg_privacy_content","type":"plugin","creationDate":"2018-07","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_PRIVACY_CONTENT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Privacy\\\\Content","filename":"content"}', '{}', '', NULL, NULL, 4, 0, NULL),
	(159, 0, 'plg_privacy_message', 'plugin', 'message', '', 'privacy', 0, 1, 1, 0, 1, '{"name":"plg_privacy_message","type":"plugin","creationDate":"2018-07","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_PRIVACY_MESSAGE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Privacy\\\\Message","filename":"message"}', '{}', '', NULL, NULL, 5, 0, NULL),
	(160, 0, 'plg_privacy_user', 'plugin', 'user', '', 'privacy', 0, 1, 1, 0, 1, '{"name":"plg_privacy_user","type":"plugin","creationDate":"2018-05","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_PRIVACY_USER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Privacy\\\\User","filename":"user"}', '{}', '', NULL, NULL, 6, 0, NULL),
	(161, 0, 'plg_quickicon_autoupdate', 'plugin', 'autoupdate', '', 'quickicon', 0, 1, 1, 0, 1, '{"name":"plg_quickicon_autoupdate","type":"plugin","creationDate":"2025-03","author":"Joomla! Project","copyright":"(C) 2025 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.4.0","description":"PLG_QUICKICON_AUTOUPDATE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Quickicon\\\\Autoupdate","filename":"autoupdate"}', '', '', NULL, NULL, 1, 0, NULL),
	(162, 0, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', '', 'quickicon', 0, 1, 1, 0, 1, '{"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Quickicon\\\\Joomlaupdate","filename":"joomlaupdate"}', '', '', NULL, NULL, 2, 0, NULL),
	(163, 0, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', '', 'quickicon', 0, 1, 1, 0, 1, '{"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Quickicon\\\\Extensionupdate","filename":"extensionupdate"}', '', '', NULL, NULL, 3, 0, NULL),
	(164, 0, 'plg_quickicon_overridecheck', 'plugin', 'overridecheck', '', 'quickicon', 0, 1, 1, 0, 1, '{"name":"plg_quickicon_overridecheck","type":"plugin","creationDate":"2018-06","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_QUICKICON_OVERRIDECHECK_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Quickicon\\\\OverrideCheck","filename":"overridecheck"}', '', '', NULL, NULL, 4, 0, NULL),
	(165, 0, 'plg_quickicon_downloadkey', 'plugin', 'downloadkey', '', 'quickicon', 0, 1, 1, 0, 1, '{"name":"plg_quickicon_downloadkey","type":"plugin","creationDate":"2019-10","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_QUICKICON_DOWNLOADKEY_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Quickicon\\\\Downloadkey","filename":"downloadkey"}', '', '', NULL, NULL, 5, 0, NULL),
	(166, 0, 'plg_quickicon_privacycheck', 'plugin', 'privacycheck', '', 'quickicon', 0, 1, 1, 0, 1, '{"name":"plg_quickicon_privacycheck","type":"plugin","creationDate":"2018-06","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_QUICKICON_PRIVACYCHECK_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Quickicon\\\\PrivacyCheck","filename":"privacycheck"}', '{}', '', NULL, NULL, 6, 0, NULL),
	(167, 0, 'plg_quickicon_phpversioncheck', 'plugin', 'phpversioncheck', '', 'quickicon', 0, 1, 1, 0, 1, '{"name":"plg_quickicon_phpversioncheck","type":"plugin","creationDate":"2016-08","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Quickicon\\\\PhpVersionCheck","filename":"phpversioncheck"}', '', '', NULL, NULL, 7, 0, NULL),
	(168, 0, 'plg_quickicon_eos', 'plugin', 'eos', '', 'quickicon', 0, 1, 1, 0, 1, '{"name":"plg_quickicon_eos","type":"plugin","creationDate":"2023-05","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.4.0","description":"PLG_QUICKICON_EOS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Quickicon\\\\Eos","filename":"eos"}', '', '', NULL, NULL, 8, 0, NULL),
	(169, 0, 'plg_sampledata_blog', 'plugin', 'blog', '', 'sampledata', 0, 1, 1, 0, 1, '{"name":"plg_sampledata_blog","type":"plugin","creationDate":"2017-07","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.0","description":"PLG_SAMPLEDATA_BLOG_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\SampleData\\\\Blog","filename":"blog"}', '', '', NULL, NULL, 1, 0, NULL),
	(170, 0, 'plg_sampledata_multilang', 'plugin', 'multilang', '', 'sampledata', 0, 1, 1, 0, 1, '{"name":"plg_sampledata_multilang","type":"plugin","creationDate":"2018-07","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_SAMPLEDATA_MULTILANG_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\SampleData\\\\MultiLanguage","filename":"multilang"}', '', '', NULL, NULL, 2, 0, NULL),
	(171, 0, 'plg_schemaorg_article', 'plugin', 'article', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_article","type":"plugin","creationDate":"2024-01","author":"Joomla! Project","copyright":"(C) 2024 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.1.0","description":"PLG_SCHEMAORG_ARTICLE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\Article","filename":"article"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(172, 0, 'plg_schemaorg_blogposting', 'plugin', 'blogposting', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_blogposting","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_SCHEMAORG_BLOGPOSTING_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\BlogPosting","filename":"blogposting"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(173, 0, 'plg_schemaorg_book', 'plugin', 'book', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_book","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_SCHEMAORG_BOOK_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\Book","filename":"book"}', '{}', '', NULL, NULL, 3, 0, NULL),
	(174, 0, 'plg_schemaorg_event', 'plugin', 'event', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_event","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_SCHEMAORG_EVENT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\Event","filename":"event"}', '{}', '', NULL, NULL, 4, 0, NULL),
	(175, 0, 'plg_schemaorg_jobposting', 'plugin', 'jobposting', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_jobposting","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_SCHEMAORG_JOBPOSTING_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\JobPosting","filename":"jobposting"}', '{}', '', NULL, NULL, 5, 0, NULL),
	(176, 0, 'plg_schemaorg_organization', 'plugin', 'organization', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_organization","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_SCHEMAORG_ORGANIZATION_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\Organization","filename":"organization"}', '{}', '', NULL, NULL, 6, 0, NULL),
	(177, 0, 'plg_schemaorg_person', 'plugin', 'person', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_person","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_SCHEMAORG_PERSON_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\Person","filename":"person"}', '{}', '', NULL, NULL, 7, 0, NULL),
	(178, 0, 'plg_schemaorg_recipe', 'plugin', 'recipe', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_recipe","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_SCHEMAORG_RECIPE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\Recipe","filename":"recipe"}', '{}', '', NULL, NULL, 8, 0, NULL),
	(179, 0, 'plg_schemaorg_custom', 'plugin', 'custom', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_custom","type":"plugin","creationDate":"2024-03","author":"Joomla! Project","copyright":"(C) 2024 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.1.0","description":"PLG_SCHEMAORG_CUSTOM_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\Custom","filename":"custom"}', '{}', '', NULL, NULL, 9, 0, NULL),
	(180, 0, 'plg_system_accessibility', 'plugin', 'accessibility', '', 'system', 0, 0, 1, 0, 1, '{"name":"plg_system_accessibility","type":"plugin","creationDate":"2020-02-15","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_SYSTEM_ACCESSIBILITY_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Accessibility","filename":"accessibility"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(181, 0, 'plg_system_actionlogs', 'plugin', 'actionlogs', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_actionlogs","type":"plugin","creationDate":"2018-05","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_SYSTEM_ACTIONLOGS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\ActionLogs","filename":"actionlogs"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(182, 0, 'plg_system_cache', 'plugin', 'cache', '', 'system', 0, 0, 1, 0, 1, '{"name":"plg_system_cache","type":"plugin","creationDate":"2007-02","author":"Joomla! Project","copyright":"(C) 2007 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CACHE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Cache","filename":"cache"}', '{"browsercache":"0","cachetime":"15"}', '', NULL, NULL, 3, 0, NULL),
	(183, 0, 'plg_system_debug', 'plugin', 'debug', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_debug","type":"plugin","creationDate":"2006-12","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Debug","filename":"debug"}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', NULL, NULL, 4, 0, NULL),
	(184, 0, 'plg_system_fields', 'plugin', 'fields', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_fields","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_SYSTEM_FIELDS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Fields","filename":"fields"}', '', '', NULL, NULL, 5, 0, NULL),
	(185, 0, 'plg_system_highlight', 'plugin', 'highlight', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_highlight","type":"plugin","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Highlight","filename":"highlight"}', '', '', NULL, NULL, 6, 0, NULL),
	(186, 0, 'plg_system_httpheaders', 'plugin', 'httpheaders', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_httpheaders","type":"plugin","creationDate":"2017-10","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_SYSTEM_HTTPHEADERS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Httpheaders","filename":"httpheaders"}', '{}', '', NULL, NULL, 7, 0, NULL),
	(187, 0, 'plg_system_jooa11y', 'plugin', 'jooa11y', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_jooa11y","type":"plugin","creationDate":"2022-02","author":"Joomla! Project","copyright":"(C) 2021 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.2.0","description":"PLG_SYSTEM_JOOA11Y_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Jooa11y","filename":"jooa11y"}', '', '', NULL, NULL, 8, 0, NULL),
	(188, 0, 'plg_system_languagecode', 'plugin', 'languagecode', '', 'system', 0, 0, 1, 0, 1, '{"name":"plg_system_languagecode","type":"plugin","creationDate":"2011-11","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\LanguageCode","filename":"languagecode"}', '', '', NULL, NULL, 9, 0, NULL),
	(189, 0, 'plg_system_languagefilter', 'plugin', 'languagefilter', '', 'system', 0, 0, 1, 0, 1, '{"name":"plg_system_languagefilter","type":"plugin","creationDate":"2010-07","author":"Joomla! Project","copyright":"(C) 2010 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\LanguageFilter","filename":"languagefilter"}', '', '', NULL, NULL, 10, 0, NULL),
	(190, 0, 'plg_system_log', 'plugin', 'log', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_log","type":"plugin","creationDate":"2007-04","author":"Joomla! Project","copyright":"(C) 2007 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOG_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Log","filename":"log"}', '', '', NULL, NULL, 11, 0, NULL),
	(191, 0, 'plg_system_logout', 'plugin', 'logout', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_logout","type":"plugin","creationDate":"2009-04","author":"Joomla! Project","copyright":"(C) 2009 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Logout","filename":"logout"}', '', '', NULL, NULL, 12, 0, NULL),
	(192, 0, 'plg_system_privacyconsent', 'plugin', 'privacyconsent', '', 'system', 0, 0, 1, 0, 1, '{"name":"plg_system_privacyconsent","type":"plugin","creationDate":"2018-04","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_SYSTEM_PRIVACYCONSENT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\PrivacyConsent","filename":"privacyconsent"}', '{}', '', NULL, NULL, 14, 0, NULL),
	(193, 0, 'plg_system_redirect', 'plugin', 'redirect', '', 'system', 0, 0, 1, 0, 1, '{"name":"plg_system_redirect","type":"plugin","creationDate":"2009-04","author":"Joomla! Project","copyright":"(C) 2009 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Redirect","filename":"redirect"}', '', '', NULL, NULL, 15, 0, NULL),
	(194, 0, 'plg_system_remember', 'plugin', 'remember', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_remember","type":"plugin","creationDate":"2007-04","author":"Joomla! Project","copyright":"(C) 2007 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Remember","filename":"remember"}', '', '', NULL, NULL, 16, 0, NULL),
	(195, 0, 'plg_system_schedulerunner', 'plugin', 'schedulerunner', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_schedulerunner","type":"plugin","creationDate":"2021-08","author":"Joomla! Project","copyright":"(C) 2021 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.1","description":"PLG_SYSTEM_SCHEDULERUNNER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\ScheduleRunner","filename":"schedulerunner"}', '{}', '', NULL, NULL, 17, 0, NULL),
	(196, 0, 'plg_system_schemaorg', 'plugin', 'schemaorg', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_schemaorg","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_SYSTEM_SCHEMAORG_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Schemaorg","filename":"schemaorg"}', '{}', '', NULL, NULL, 18, 0, NULL),
	(197, 0, 'plg_system_sef', 'plugin', 'sef', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_sef","type":"plugin","creationDate":"2007-12","author":"Joomla! Project","copyright":"(C) 2007 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEF_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Sef","filename":"sef"}', '{"domain":"","indexphp":"1","trailingslash":"0","enforcesuffix":"1","strictrouting":"1"}', '', NULL, NULL, 19, 0, NULL),
	(198, 0, 'plg_system_shortcut', 'plugin', 'shortcut', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_shortcut","type":"plugin","creationDate":"2022-06","author":"Joomla! Project","copyright":"(C) 2022 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.2.0","description":"PLG_SYSTEM_SHORTCUT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Shortcut","filename":"shortcut"}', '{}', '', NULL, NULL, 21, 0, NULL),
	(199, 0, 'plg_system_skipto', 'plugin', 'skipto', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_skipto","type":"plugin","creationDate":"2020-02","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_SYSTEM_SKIPTO_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Skipto","filename":"skipto"}', '{}', '', NULL, NULL, 22, 0, NULL),
	(200, 0, 'plg_system_stats', 'plugin', 'stats', '', 'system', 0, 0, 1, 0, 1, '{"name":"plg_system_stats","type":"plugin","creationDate":"2013-11","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_SYSTEM_STATS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Stats","filename":"stats"}', '{"mode":3,"lastrun":1795098620,"unique_id":"4deec01cfed68eca36d54ee120e2ab63ab235313","interval":12}', '', NULL, NULL, 23, 0, NULL),
	(201, 0, 'plg_system_task_notification', 'plugin', 'tasknotification', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_task_notification","type":"plugin","creationDate":"2021-09","author":"Joomla! Project","copyright":"(C) 2021 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.1","description":"PLG_SYSTEM_TASK_NOTIFICATION_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\TaskNotification","filename":"tasknotification"}', '', '', NULL, NULL, 24, 0, NULL),
	(202, 0, 'plg_system_webauthn', 'plugin', 'webauthn', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_webauthn","type":"plugin","creationDate":"2019-07-02","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_SYSTEM_WEBAUTHN_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Webauthn","filename":"webauthn"}', '{}', '', NULL, NULL, 26, 0, NULL),
	(203, 0, 'plg_task_check_files', 'plugin', 'checkfiles', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_check_files","type":"plugin","creationDate":"2021-08","author":"Joomla! Project","copyright":"(C) 2021 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.1","description":"PLG_TASK_CHECK_FILES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\Checkfiles","filename":"checkfiles"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(204, 0, 'plg_task_deleteactionlogs', 'plugin', 'deleteactionlogs', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_deleteactionlogs","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_TASK_DELETEACTIONLOGS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\DeleteActionLogs","filename":"deleteactionlogs"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(205, 0, 'plg_task_globalcheckin', 'plugin', 'globalcheckin', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_globalcheckin","type":"plugin","creationDate":"2023-06-22","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_TASK_GLOBALCHECKIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\Globalcheckin","filename":"globalcheckin"}', '{}', '', NULL, NULL, 3, 0, NULL),
	(206, 0, 'plg_task_requests', 'plugin', 'requests', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_requests","type":"plugin","creationDate":"2021-08","author":"Joomla! Project","copyright":"(C) 2021 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.1","description":"PLG_TASK_REQUESTS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\Requests","filename":"requests"}', '{}', '', NULL, NULL, 4, 0, NULL),
	(207, 0, 'plg_task_privacyconsent', 'plugin', 'privacyconsent', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_privacyconsent","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_TASK_PRIVACYCONSENT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\PrivacyConsent","filename":"privacyconsent"}', '{}', '', NULL, NULL, 5, 0, NULL),
	(208, 0, 'plg_task_rotatelogs', 'plugin', 'rotatelogs', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_rotatelogs","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_TASK_ROTATELOGS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\RotateLogs","filename":"rotatelogs"}', '{}', '', NULL, NULL, 6, 0, NULL),
	(209, 0, 'plg_task_sessiongc', 'plugin', 'sessiongc', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_sessiongc","type":"plugin","creationDate":"2023-08","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_TASK_SESSIONGC_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\SessionGC","filename":"sessiongc"}', '{}', '', NULL, NULL, 7, 0, NULL),
	(210, 0, 'plg_task_site_status', 'plugin', 'sitestatus', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_site_status","type":"plugin","creationDate":"2021-08","author":"Joomla! Project","copyright":"(C) 2021 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.1","description":"PLG_TASK_SITE_STATUS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\SiteStatus","filename":"sitestatus"}', '{}', '', NULL, NULL, 8, 0, NULL),
	(211, 0, 'plg_task_updatenotification', 'plugin', 'updatenotification', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_updatenotification","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_TASK_UPDATENOTIFICATION_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\UpdateNotification","filename":"updatenotification"}', '{}', '', NULL, NULL, 9, 0, NULL),
	(212, 0, 'plg_multifactorauth_totp', 'plugin', 'totp', '', 'multifactorauth', 0, 1, 1, 0, 1, '{"name":"plg_multifactorauth_totp","type":"plugin","creationDate":"2013-08","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_MULTIFACTORAUTH_TOTP_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Multifactorauth\\\\Totp","filename":"totp"}', '', '', NULL, NULL, 1, 0, NULL),
	(213, 0, 'plg_multifactorauth_yubikey', 'plugin', 'yubikey', '', 'multifactorauth', 0, 1, 1, 0, 1, '{"name":"plg_multifactorauth_yubikey","type":"plugin","creationDate":"2013-09","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_MULTIFACTORAUTH_YUBIKEY_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Multifactorauth\\\\Yubikey","filename":"yubikey"}', '', '', NULL, NULL, 2, 0, NULL),
	(214, 0, 'plg_multifactorauth_webauthn', 'plugin', 'webauthn', '', 'multifactorauth', 0, 1, 1, 0, 1, '{"name":"plg_multifactorauth_webauthn","type":"plugin","creationDate":"2022-05","author":"Joomla! Project","copyright":"(C) 2022 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.2.0","description":"PLG_MULTIFACTORAUTH_WEBAUTHN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Multifactorauth\\\\Webauthn","filename":"webauthn"}', '', '', NULL, NULL, 3, 0, NULL),
	(215, 0, 'plg_multifactorauth_email', 'plugin', 'email', '', 'multifactorauth', 0, 1, 1, 0, 1, '{"name":"plg_multifactorauth_email","type":"plugin","creationDate":"2022-05","author":"Joomla! Project","copyright":"(C) 2022 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.2.0","description":"PLG_MULTIFACTORAUTH_EMAIL_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Multifactorauth\\\\Email","filename":"email"}', '', '', NULL, NULL, 4, 0, NULL),
	(216, 0, 'plg_multifactorauth_fixed', 'plugin', 'fixed', '', 'multifactorauth', 0, 0, 1, 0, 1, '{"name":"plg_multifactorauth_fixed","type":"plugin","creationDate":"2022-05","author":"Joomla! Project","copyright":"(C) 2022 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.2.0","description":"PLG_MULTIFACTORAUTH_FIXED_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Multifactorauth\\\\Fixed","filename":"fixed"}', '', '', NULL, NULL, 5, 0, NULL),
	(217, 0, 'plg_user_contactcreator', 'plugin', 'contactcreator', '', 'user', 0, 0, 1, 0, 1, '{"name":"plg_user_contactcreator","type":"plugin","creationDate":"2009-08","author":"Joomla! Project","copyright":"(C) 2009 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\User\\\\ContactCreator","filename":"contactcreator"}', '{"autowebpage":"","category":"4","autopublish":"0"}', '', NULL, NULL, 1, 0, NULL),
	(218, 0, 'plg_user_joomla', 'plugin', 'joomla', '', 'user', 0, 1, 1, 0, 1, '{"name":"plg_user_joomla","type":"plugin","creationDate":"2006-12","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\User\\\\Joomla","filename":"joomla"}', '{"autoregister":"1","mail_to_user":"1","forceLogout":"1"}', '', NULL, NULL, 2, 0, NULL),
	(219, 0, 'plg_user_profile', 'plugin', 'profile', '', 'user', 0, 0, 1, 0, 1, '{"name":"plg_user_profile","type":"plugin","creationDate":"2008-01","author":"Joomla! Project","copyright":"(C) 2008 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\User\\\\Profile","filename":"profile"}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', NULL, NULL, 3, 0, NULL),
	(220, 0, 'plg_user_terms', 'plugin', 'terms', '', 'user', 0, 0, 1, 0, 1, '{"name":"plg_user_terms","type":"plugin","creationDate":"2018-06","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_USER_TERMS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\User\\\\Terms","filename":"terms"}', '{}', '', NULL, NULL, 4, 0, NULL),
	(221, 0, 'plg_user_token', 'plugin', 'token', '', 'user', 0, 1, 1, 0, 1, '{"name":"plg_user_token","type":"plugin","creationDate":"2019-11","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_USER_TOKEN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\User\\\\Token","filename":"token"}', '{}', '', NULL, NULL, 5, 0, NULL),
	(222, 0, 'plg_webservices_banners', 'plugin', 'banners', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_banners","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_BANNERS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Banners","filename":"banners"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(223, 0, 'plg_webservices_config', 'plugin', 'config', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_config","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_CONFIG_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Config","filename":"config"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(224, 0, 'plg_webservices_contact', 'plugin', 'contact', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_contact","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_CONTACT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Contact","filename":"contact"}', '{}', '', NULL, NULL, 3, 0, NULL),
	(225, 0, 'plg_webservices_content', 'plugin', 'content', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_content","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_CONTENT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Content","filename":"content"}', '{}', '', NULL, NULL, 4, 0, NULL),
	(226, 0, 'plg_webservices_installer', 'plugin', 'installer', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_installer","type":"plugin","creationDate":"2020-06","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_INSTALLER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Installer","filename":"installer"}', '{}', '', NULL, NULL, 5, 0, NULL),
	(227, 0, 'plg_webservices_joomlaupdate', 'plugin', 'joomlaupdate', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_joomlaupdate","type":"plugin","creationDate":"2025-03","author":"Joomla! Project","copyright":"(C) 2025 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.4.0","description":"PLG_WEBSERVICES_JOOMLAUPDATE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Joomlaupdate","filename":"joomlaupdate"}', '{}', '', NULL, NULL, 6, 0, NULL),
	(228, 0, 'plg_webservices_languages', 'plugin', 'languages', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_languages","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_LANGUAGES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Languages","filename":"languages"}', '{}', '', NULL, NULL, 7, 0, NULL),
	(229, 0, 'plg_webservices_media', 'plugin', 'media', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_media","type":"plugin","creationDate":"2021-05","author":"Joomla! Project","copyright":"(C) 2021 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.1.0","description":"PLG_WEBSERVICES_MEDIA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Media","filename":"media"}', '{}', '', NULL, NULL, 8, 0, NULL),
	(230, 0, 'plg_webservices_menus', 'plugin', 'menus', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_menus","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_MENUS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Menus","filename":"menus"}', '{}', '', NULL, NULL, 9, 0, NULL),
	(231, 0, 'plg_webservices_messages', 'plugin', 'messages', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_messages","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_MESSAGES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Messages","filename":"messages"}', '{}', '', NULL, NULL, 10, 0, NULL),
	(232, 0, 'plg_webservices_modules', 'plugin', 'modules', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_modules","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_MODULES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Modules","filename":"modules"}', '{}', '', NULL, NULL, 11, 0, NULL),
	(233, 0, 'plg_webservices_newsfeeds', 'plugin', 'newsfeeds', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_newsfeeds","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_NEWSFEEDS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Newsfeeds","filename":"newsfeeds"}', '{}', '', NULL, NULL, 12, 0, NULL),
	(234, 0, 'plg_webservices_plugins', 'plugin', 'plugins', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_plugins","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_PLUGINS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Plugins","filename":"plugins"}', '{}', '', NULL, NULL, 13, 0, NULL),
	(235, 0, 'plg_webservices_privacy', 'plugin', 'privacy', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_privacy","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_PRIVACY_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Privacy","filename":"privacy"}', '{}', '', NULL, NULL, 14, 0, NULL),
	(236, 0, 'plg_webservices_redirect', 'plugin', 'redirect', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_redirect","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_REDIRECT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Redirect","filename":"redirect"}', '{}', '', NULL, NULL, 15, 0, NULL),
	(237, 0, 'plg_webservices_tags', 'plugin', 'tags', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_tags","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_TAGS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Tags","filename":"tags"}', '{}', '', NULL, NULL, 16, 0, NULL),
	(238, 0, 'plg_webservices_templates', 'plugin', 'templates', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_templates","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_TEMPLATES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Templates","filename":"templates"}', '{}', '', NULL, NULL, 17, 0, NULL),
	(239, 0, 'plg_webservices_users', 'plugin', 'users', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_users","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_USERS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Users","filename":"users"}', '{}', '', NULL, NULL, 18, 0, NULL),
	(240, 0, 'plg_workflow_featuring', 'plugin', 'featuring', '', 'workflow', 0, 1, 1, 0, 1, '{"name":"plg_workflow_featuring","type":"plugin","creationDate":"2020-03","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WORKFLOW_FEATURING_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Workflow\\\\Featuring","filename":"featuring"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(241, 0, 'plg_workflow_notification', 'plugin', 'notification', '', 'workflow', 0, 1, 1, 0, 1, '{"name":"plg_workflow_notification","type":"plugin","creationDate":"2020-05","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WORKFLOW_NOTIFICATION_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Workflow\\\\Notification","filename":"notification"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(242, 0, 'plg_workflow_publishing', 'plugin', 'publishing', '', 'workflow', 0, 1, 1, 0, 1, '{"name":"plg_workflow_publishing","type":"plugin","creationDate":"2020-03","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WORKFLOW_PUBLISHING_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Workflow\\\\Publishing","filename":"publishing"}', '{}', '', NULL, NULL, 3, 0, NULL),
	(243, 0, 'plg_system_guidedtours', 'plugin', 'guidedtours', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_guidedtours","type":"plugin","creationDate":"2023-02","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.3.0","description":"PLG_SYSTEM_GUIDEDTOURS_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\GuidedTours","filename":"guidedtours"}', '{}', '', NULL, NULL, 15, 0, NULL),
	(244, 0, 'atum', 'template', 'atum', '', '', 1, 1, 1, 0, 1, '{"name":"atum","type":"template","creationDate":"2016-09","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_ATUM_XML_DESCRIPTION","group":"","changelogurl":"","inheritable":true,"filename":"templateDetails"}', '', '', NULL, NULL, 0, 0, NULL),
	(245, 0, 'cassiopeia', 'template', 'cassiopeia', '', '', 0, 1, 1, 0, 1, '{"name":"cassiopeia","type":"template","creationDate":"2017-02","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_CASSIOPEIA_XML_DESCRIPTION","group":"","changelogurl":"","inheritable":true,"filename":"templateDetails"}', '{"brand":"1","logoFile":"","siteTitle":"","siteDescription":"","useFontScheme":"0","colorName":"colors_standard","fluidContainer":"0","stickyHeader":0,"backTop":0}', '', NULL, NULL, 0, 0, NULL),
	(246, 0, 'cassiopeia_extended', 'template', 'cassiopeia_extended', '', '', 0, 1, 1, 0, 1, '{"name":"cassiopeia_extended","type":"template","creationDate":"2025-07","author":"Joomla! Project","copyright":"(C) 2025 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_CASSIOPEIA_EXTENDED_XML_DESCRIPTION","group":"","changelogurl":"","inheritable":false,"parent":"cassiopeia","filename":"templateDetails"}', '{"brand":"1","logoFile":"","siteTitle":"","siteDescription":"","useFontScheme":"0","systemFontBody":"","systemFontHeading":"","colorName":"colors_standard","fluidContainer":"0","stickyHeader":"0","backTop":"0","colorSettings":"0","headerbg":"rgb(193, 205, 207)","headercolor":"rgb(23, 23, 23)","bodybg":"rgb(254, 254, 254)","bodycolor":"rgb(23, 23, 23)","linkcolor":"rgb(29, 121, 137)","linkcolorh":"rgb(14, 59, 67)","btnbg":"rgb(206, 60, 55)","btnbgh":"rgb(131, 35, 32)","btncolor":"rgb(254, 254, 254)","btncolorh":"rgb(254, 254, 254)","footerbg":"rgb(29, 121, 137)","footercolor":"rgb(254, 254, 254)","fontSettings":"0","bodysize":"1","h1size":"2","h2size":"1.7","h3size":"1.5"}', '', NULL, NULL, 0, 0, NULL),
	(247, 0, 'files_joomla', 'file', 'joomla', '', '', 0, 1, 1, 1, 1, '{"name":"files_joomla","type":"file","creationDate":"2026-10","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.2.0","description":"FILES_JOOMLA_XML_DESCRIPTION","group":"","changelogurl":""}', '', '', NULL, NULL, 0, 0, NULL),
	(248, 0, 'English (en-GB) Language Pack', 'package', 'pkg_en-GB', '', '', 0, 1, 1, 1, 1, '{"name":"English (en-GB) Language Pack","type":"package","creationDate":"2026-10","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.2.0.1","description":"en-GB language pack","group":"","changelogurl":"","filename":"pkg_en-GB"}', '', '', NULL, NULL, 0, 0, NULL),
	(249, 248, 'English (en-GB)', 'language', 'en-GB', '', '', 0, 1, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"2026-10","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.2.0","description":"en-GB site language","group":"","changelogurl":""}', '', '', NULL, NULL, 0, 0, NULL),
	(250, 248, 'English (en-GB)', 'language', 'en-GB', '', '', 1, 1, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"2026-10","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.2.0","description":"en-GB administrator language","group":"","changelogurl":""}', '', '', NULL, NULL, 0, 0, NULL),
	(251, 248, 'English (en-GB)', 'language', 'en-GB', '', '', 3, 1, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"2026-10","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.2.0","description":"en-GB api language","group":"","changelogurl":""}', '', '', NULL, NULL, 0, 0, NULL),
	(252, 269, 'Kunena Framework', 'library', 'kunena', 'https://update.kunena.org/changelog/7.1.1.xml', '', 0, 1, 1, 0, 0, '{"name":"Kunena Framework","type":"library","creationDate":"2026-11-10","author":"Kunena Team","copyright":"(C) 2008 - 2026 Kunena Team. All rights reserved.","authorEmail":"kunena@kunena.org","authorUrl":"https:\\/\\/www.kunena.org","version":"7.1.1","description":"Kunena Framework.","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml","namespace":"Kunena\\\\Forum\\\\Libraries","filename":"kunena"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(253, 269, 'Kunena Media Files', 'file', 'kunena_media', 'https://update.kunena.org/changelog/7.1.1.xml', '', 0, 1, 0, 0, 0, '{"name":"Kunena Media Files","type":"file","creationDate":"2026-11-10","author":"Kunena Team","copyright":"(C) 2008 - 2026 Kunena Team. All rights reserved.","authorEmail":"kunena@kunena.org","authorUrl":"https:\\/\\/www.kunena.org","version":"7.1.1","description":"Kunena media files.","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml"}', '', '', NULL, NULL, 0, 0, NULL),
	(254, 269, 'com_kunena', 'component', 'com_kunena', 'https://update.kunena.org/changelog/7.1.1.xml', '', 1, 1, 0, 0, 0, '{"name":"com_kunena","type":"component","creationDate":"2026-11-10","author":"Kunena Team","copyright":"(C) 2008 - 2026 Kunena Team. All rights reserved.","authorEmail":"kunena@kunena.org","authorUrl":"https:\\/\\/www.kunena.org","version":"7.1.1","description":"COM_KUNENA_XML_DESCRIPTION","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml","namespace":"Kunena\\\\Forum","filename":"kunena"}', '{"template":"nts_kgeek","boardTitle":"Kunena","email":"","emailSenderName":"","sendEmails":"1","boardOffline":"0","offlineMessage":"The Forum is currently offline for maintenance.\\\\nCheck back soon!>","readOnly":"0","sessionTimeOut":"1800","enableRss":"1","debug":"0","profiler":"0","fallbackEnglish":"1","timeToCreatePage":"1","sef":"1","accessComponent":"1","sefRedirect":"1","cache":"1","cacheTime":"60","threadsPerPage":"20","messagesPerPage":"6","messagesPerPageSearch":"15","showHistory":"1","historyLimit":"6","postDateFormat":"ago","postDateFormatHover":"datetime","showNew":"1","showAnnouncement":"1","avatarOnCategory":"0","listCatShowModerators":"1","showChildCatIcon":"1","enableForumJump":"1","reportMsg":"1","orderingSystem":"mesid","hideIp":"1","latestCategoryIn":"1","latestCategory":["0"],"topicIcons":"1","lightbox":"1","showListTime":"720","topicLayout":"flat","pickupCategory":"0","articleDisplay":"intro","defaultSort":"asc","searchTime":"365","allowChangeSubject":"1","ratingEnabled":"0","attachStart":"0","attachEnd":"14","quickReply":"1","disableRe":"0","displayFilenameAttachment":"0","datePickerFormat":"","username":"1","askEmail":"0","showEmail":"0","showUserStats":"1","showKarma":"1","showThankYou":"1","thankYouMax":"10","userEdit":"1","userEditTime":"0","userEditTimeGrace":"600","editMarkup":"1","allowFavorites":"1","boxGhostMessage":"0","showBannedReason":"0","showImgFilesManageProfile":"1","userReport":"1","logModeration":"0","userStatus":"1","signature":"1","maxSig":"300","personal":"1","privateMessage":"1","emailHeader":"media\\/kunena\\/email\\/hero-wide.png","emailHeaderSizeY":"560","emailHeaderSizeX":"560","allowSubscriptions":"1","mailFull":"1","plainEmail":"0","categorySubscriptions":"post","topicSubscriptions":"every","subscriptionsChecked":"1","emailBatchSize":"50","emailVisibleAddress":"","useSystemEmails":"0","utmSource":"0","sendMailUserBanned":"0","mailBodyUserBanned":"","mailBodyUserUnBanned":"","pubWrite":"0","holdGuestPosts":"0","userlistAllowed":"1","pubProfile":"1","regOnly":"0","holdNewUsersPosts":"0","userDeleteMessage":"0","modSeeDeleted":"0","floodProtection":"0","mailModerators":"0","mailAdministrators":"0","ipTracking":"1","statsLinkAllowed":"1","maxLinks":"6","teaser":"0","urlSubjectTopic":"0","moderatorPermDelete":"0","newUsersPreventPostUrlImages":"0","minimalUserPostsAddUrlImage":"10","captcha":"0","captchaPostLimit":"0","stopForumSpamKey":"","stopForumSpamNewUserCheck":"0","avatarType":"1","defaultAvatar":"nophoto.png","defaultAvatarSmall":"s_nophoto.png","avatarTypes":"gif,jpeg,jpg,png,webp,avif","allowAvatarUpload":"1","allowAvatarGallery":"1","avatarSize":"2048","avatarQuality":"75","avatarCrop":"0","avatarEdit":"0","attachmentLimit":"8","attachmentProtection":"0","attachmentUtf8":"1","imageUpload":"registered","showImgForGuest":"1","imageTypes":"jpg,jpeg,gif,png,webp,avif","checkMimeTypes":"1","imageMimeTypes":"image\\/jpeg,image\\/jpg,image\\/gif,image\\/png,image\\/webp,image\\/avif","imageSize":"150","imageWidth":"800","imageHeight":"800","thumbWidth":"32","thumbHeight":"32","imageQuality":"50","fileUpload":"registered","showFileForGuest":"1","fileTypes":"txt,rtf,pdf,zip,tar.gz,tgz,tar.bz2","fileSize":"120","showRanking":"1","rankImages":"1","trimLongUrls":"1","trimLongUrlsFront":"40","trimLongUrlsBack":"20","autoLink":"1","smartLinking":"0","autoEmbedYoutube":"1","autoEmbedEbay":"1","autoEmbedInstagram":"1","autoEmbedSoundcloud":"1","highlightCode":"0","bbcodeImgSecure":"text","ebayLanguage":"0","ebayAffiliateId":"","ebayApiKey":"","ebayCertId":"","blueskyappHandleOfApp":"","blueskyappPasswordOfApp":"","XConsumerKey":"","XConsumerSecret":"","googleMapApiKey":"","rssType":"topic","rssSpecification":"rss2.0","rssTimeLimit":"1 month","rssLimit":"100","rssIncludedCategories":["0"],"rssExcludedCategories":["0"],"rssAllowHtml":"1","rssAuthorFormat":"name","rssAuthorInTitle":"1","rssWordCount":"0","rssOldTitles":"1","rssCache":"900","rssFeedBurnerUrl":"","userlistRows":"30","userlistOnline":"1","userlistAvatar":"1","userlistPosts":"1","userlistKarma":"1","userlistEmail":"0","userlistJoinDate":"1","userlistLastVisitDate":"1","userlistUserHits":"1","superAdminUserlist":"0","userListUserType":"0","showSessionType":"2","showSessionStartTime":"1800","showWhoIsOnline":"1","showStats":"1","showGenStats":"1","showPopUserStats":"1","popUserCount":"5","showPopSubjectStats":"1","popSubjectCount":"5","showPopPollStats":"1","popPollsCount":"5","showPopThankYouStats":"1","popThanksCount":"5","userlistCountUsers":"1","pollEnabled":"1","pollNbOptions":"4","pollTimeBtVotes":"00:15:00","pollNbVotesByUser":"100","pollAllowVoteOne":"1","pollResultsUserslist":"1","allowUserEditPoll":"0","defaultPage":"recent","activeMenuItem":"","mainMenuId":"","homeId":"","indexId":"","moderatorsId":"","topicListId":"","miscId":"","profileId":"","searchId":""}', '', NULL, NULL, 0, 0, NULL),
	(255, 269, 'plg_finder_kunena', 'plugin', 'kunena', 'https://update.kunena.org/changelog/7.1.1.xml', 'finder', 0, 0, 1, 0, 0, '{"name":"plg_finder_kunena","type":"plugin","creationDate":"2026-11-10","author":"Kunena Team","copyright":"(C) 2008 - 2026 Kunena Team. All rights reserved.","authorEmail":"Kunena@kunena.org","authorUrl":"https:\\/\\/www.kunena.org","version":"7.1.1","description":"PLG_FINDER_KUNENA_DESCRIPTION","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml","namespace":"Kunena\\\\Forum\\\\Plugin\\\\Finder\\\\Kunena","filename":"kunena"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(256, 269, 'plg_kunena_finder', 'plugin', 'finder', 'https://update.kunena.org/changelog/7.1.1.xml', 'kunena', 0, 0, 1, 0, 0, '{"name":"plg_kunena_finder","type":"plugin","creationDate":"2026-11-10","author":"Kunena Team","copyright":"(C) 2008 - 2026 Kunena Team. All rights reserved.","authorEmail":"kunena@kunena.org","authorUrl":"https:\\/\\/www.kunena.org","version":"7.1.1","description":"PLG_KUNENA_FINDER_DESCRIPTION","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml","namespace":"Kunena\\\\Forum\\\\Plugin\\\\Kunena\\\\Finder","filename":"finder"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(257, 269, 'plg_kunena_community', 'plugin', 'community', 'https://update.kunena.org/changelog/7.1.1.xml', 'kunena', 0, 0, 1, 0, 0, '{"name":"plg_kunena_community","type":"plugin","creationDate":"2026-11-10","author":"Kunena Team","copyright":"www.kunena.org","authorEmail":"Kunena@kunena.org","authorUrl":"https:\\/\\/www.kunena.org","version":"7.1.1","description":"PLG_KUNENA_COMMUNITY_DESCRIPTION","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml","namespace":"Kunena\\\\Forum\\\\Plugin\\\\Kunena\\\\Community","filename":"community"}', '{"access":"1","login":"1","activity":"1","avatar":"1","profile":"1","private":"1","activity_points_limit":"0","activity_stream_limit":"0"}', '', NULL, NULL, 0, 0, NULL),
	(258, 269, 'plg_kunena_comprofiler', 'plugin', 'comprofiler', 'https://update.kunena.org/changelog/7.1.1.xml', 'kunena', 0, 0, 1, 0, 0, '{"name":"plg_kunena_comprofiler","type":"plugin","creationDate":"2026-11-10","author":"Kunena Team","copyright":"www.kunena.org","authorEmail":"Kunena@kunena.org","authorUrl":"https:\\/\\/www.kunena.org","version":"7.1.1","description":"PLG_KUNENA_COMPROFILER_DESCRIPTION","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml","namespace":"Kunena\\\\Forum\\\\Plugin\\\\Kunena\\\\Comprofiler","filename":"comprofiler"}', '{"access":"1","login":"1","activity":"1","avatar":"1","profile":"1","private":"1"}', '', NULL, NULL, 0, 0, NULL),
	(259, 269, 'plg_kunena_easysocial', 'plugin', 'easysocial', 'https://update.kunena.org/changelog/7.1.1.xml', 'kunena', 0, 0, 1, 0, 0, '{"name":"plg_kunena_easysocial","type":"plugin","creationDate":"2026-11-10","author":"StackIdeas","copyright":"https:\\/\\/stackideas.com","authorEmail":"support@stackideas.com","authorUrl":"https:\\/\\/stackideas.com","version":"7.1.1","description":"PLG_KUNENA_EASYSOCIAL_DESCRIPTION","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml","namespace":"Kunena\\\\Forum\\\\Plugin\\\\Kunena\\\\Easysocial","filename":"easysocial"}', '{"login":"1","activity":"1","avatar":"1","profile":"1","private":"1","activity_badge_limit":"0","activity_points_limit":"0"}', '', NULL, NULL, 0, 0, NULL),
	(260, 269, 'plg_kunena_gravatar', 'plugin', 'gravatar', 'https://update.kunena.org/changelog/7.1.1.xml', 'kunena', 0, 0, 1, 0, 0, '{"name":"plg_kunena_gravatar","type":"plugin","creationDate":"2026-11-10","author":"Kunena Team","copyright":"www.kunena.org","authorEmail":"Kunena@kunena.org","authorUrl":"https:\\/\\/www.kunena.org","version":"7.1.1","description":"PLG_KUNENA_GRAVATAR_DESCRIPTION","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml","namespace":"Kunena\\\\Forum\\\\Plugin\\\\Kunena\\\\Gravatar","filename":"gravatar"}', '{"avatar":"1"}', '', NULL, NULL, 0, 0, NULL),
	(261, 269, 'plg_kunena_uddeim', 'plugin', 'uddeim', 'https://update.kunena.org/changelog/7.1.1.xml', 'kunena', 0, 0, 1, 0, 0, '{"name":"plg_kunena_uddeim","type":"plugin","creationDate":"2026-11-10","author":"Kunena Team","copyright":"www.kunena.org","authorEmail":"Kunena@kunena.org","authorUrl":"https:\\/\\/www.kunena.org","version":"7.1.1","description":"PLG_KUNENA_UDDEIM_DESCRIPTION","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml","namespace":"Kunena\\\\Forum\\\\Plugin\\\\Kunena\\\\Uddeim","filename":"uddeim"}', '{"private":"1"}', '', NULL, NULL, 0, 0, NULL),
	(262, 269, 'plg_kunena_joomla', 'plugin', 'joomla', 'https://update.kunena.org/changelog/7.1.1.xml', 'kunena', 0, 1, 1, 0, 0, '{"name":"plg_kunena_joomla","type":"plugin","creationDate":"2026-11-10","author":"Kunena Team","copyright":"www.kunena.org","authorEmail":"Kunena@kunena.org","authorUrl":"https:\\/\\/www.kunena.org","version":"7.1.1","description":"PLG_KUNENA_JOOMLA_INTEGRATION_DESCRIPTION","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml","namespace":"Kunena\\\\Forum\\\\Plugin\\\\Kunena\\\\Joomla","filename":"joomla"}', '{"access":"1","login":"1"}', '', NULL, NULL, 0, 0, NULL),
	(263, 269, 'plg_kunena_kunena', 'plugin', 'kunena', 'https://update.kunena.org/changelog/7.1.1.xml', 'kunena', 0, 1, 1, 0, 0, '{"name":"plg_kunena_kunena","type":"plugin","creationDate":"2026-11-10","author":"Kunena Team","copyright":"www.kunena.org","authorEmail":"Kunena@kunena.org","authorUrl":"https:\\/\\/www.kunena.org","version":"7.1.1","description":"PLG_KUNENA_KUNENA_DESCRIPTION","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml","namespace":"Kunena\\\\Forum\\\\Plugin\\\\Kunena\\\\Kunena","filename":"kunena"}', '{"avatar":"1","profile":"1"}', '', NULL, NULL, 0, 0, NULL),
	(264, 269, 'plg_system_kunena', 'plugin', 'kunena', 'https://update.kunena.org/changelog/7.1.1.xml', 'system', 0, 1, 1, 0, 0, '{"name":"plg_system_kunena","type":"plugin","creationDate":"2026-11-10","author":"Kunena Team","copyright":"www.kunena.org","authorEmail":"Kunena@kunena.org","authorUrl":"https:\\/\\/www.kunena.org","version":"7.1.1","description":"PLG_SYSTEM_KUNENA_DESC","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml","namespace":"Kunena\\\\Forum\\\\Plugin\\\\System\\\\Kunena","filename":"kunena"}', '{"jcontentevents":"0","jcontentevent_target":"","ban_check_last":"0"}', '', NULL, NULL, 0, 0, NULL),
	(265, 269, 'PLG_TASK_KUNENA', 'plugin', 'kunena', 'https://update.kunena.org/changelog/7.1.1.xml', 'task', 0, 1, 1, 0, 0, '{"name":"PLG_TASK_KUNENA","type":"plugin","creationDate":"2026-11-10","author":"Kunena Team","copyright":"www.kunena.org","authorEmail":"Kunena@kunena.org","authorUrl":"https:\\/\\/www.kunena.org","version":"7.1.1","description":"PLG_TASK_KUNENA_DESCRIPTION","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml","namespace":"Kunena\\\\Forum\\\\Plugin\\\\Task\\\\Kunena","filename":"kunena"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(266, 269, 'plg_quickicon_kunena', 'plugin', 'kunena', 'https://update.kunena.org/changelog/7.1.1.xml', 'quickicon', 0, 1, 1, 0, 0, '{"name":"plg_quickicon_kunena","type":"plugin","creationDate":"2026-11-10","author":"Kunena Team","copyright":"www.kunena.org","authorEmail":"Kunena@kunena.org","authorUrl":"https:\\/\\/www.kunena.org","version":"7.1.1","description":"PLG_QUICKICON_KUNENA_DESC","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml","namespace":"Kunena\\\\Forum\\\\Plugin\\\\Quickicon\\\\Kunena","filename":"kunena"}', '{"context":"update_quickicon"}', '', NULL, NULL, 0, 0, NULL),
	(267, 269, 'plg_sampledata_kunena', 'plugin', 'kunena', 'https://update.kunena.org/changelog/7.1.1.xml', 'sampledata', 0, 1, 1, 0, 0, '{"name":"plg_sampledata_kunena","type":"plugin","creationDate":"2026-11-10","author":"Kunena Team","copyright":"(C) 2008 - 2026 Kunena Team. All rights reserved.","authorEmail":"kunena@kunena.org","authorUrl":"https:\\/\\/www.kunena.org","version":"7.1.1","description":"PLG_SAMPLEDATA_KUNENA_XML_DESCRIPTION","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml","namespace":"Kunena\\\\Forum\\\\Plugin\\\\Sampledata\\\\Kunena","filename":"kunena"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(268, 269, 'PLG_PRIVACY_KUNENA', 'plugin', 'kunena', 'https://update.kunena.org/changelog/7.1.1.xml', 'privacy', 0, 1, 1, 0, 0, '{"name":"PLG_PRIVACY_KUNENA","type":"plugin","creationDate":"2026-11-10","author":"Kunena Team","copyright":"www.kunena.org","authorEmail":"Kunena@kunena.org","authorUrl":"https:\\/\\/www.kunena.org","version":"7.1.1","description":"PLG_PRIVACY_KUNENA_DESCRIPTION","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml","namespace":"Kunena\\\\Forum\\\\Plugin\\\\Privacy\\\\Kunena","filename":"kunena"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(269, 0, 'pkg_kunena', 'package', 'pkg_kunena', 'https://update.kunena.org/changelog/7.1.1.xml', '', 0, 1, 1, 0, 0, '{"name":"pkg_kunena","type":"package","creationDate":"2026-11-10","author":"Kunena Team","copyright":"(C) 2008 - 2026 Kunena Team. All rights reserved.","authorEmail":"kunena@kunena.org","authorUrl":"https:\\/\\/www.kunena.org","version":"7.1.1","description":"Kunena Forum Package.","group":"","changelogurl":"https:\\/\\/update.kunena.org\\/changelog\\/7.1.1.xml","filename":"pkg_kunena"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(270, 0, 'PLG_SYSTEM_BEE', 'plugin', 'bee', '', 'system', 0, 1, 1, 0, 0, '{"name":"PLG_SYSTEM_BEE","type":"plugin","creationDate":"May 3rd, 2024","author":"Bee Framework","copyright":"All Rights Reserved.","authorEmail":"","authorUrl":"","version":"1.1.4","description":"PLG_SYSTEM_BEE_DESC","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Bee","filename":"bee"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(271, 0, 'bee_dawn', 'template', 'bee_dawn', '', '', 0, 1, 1, 0, 0, '{"name":"bee_dawn","type":"template","creationDate":"Jul 17rd, 2026","author":"Bee Theme Pro","copyright":"Copyright (C) 2009 - 2026 Bee Framework. All rights reserved.","authorEmail":"beethemepro@gmail.com","authorUrl":"www.beethemepro.com","version":"1.0.0","description":"\\n        \\n               <div id=\\"wrap1\\">\\n               <h1>Bee Cons<\\/h1>\\n               <p>Bee Cons is not just a template; it\'s the blank canvas upon which you paint your digital masterpiece. Crafted to be versatile and user-friendly, it\'s your starting point for web projects limited only by your imagination. With its clean design and robust features, Bee Blank offers you the freedom to create unique websites that leave a lasting impression. Get ready to bring your vision to life, effortlessly and brilliantly, with Bee Blank.<\\/p>\\n               \\n               <p class=\\"actions-wrap\\"><a class=\\"btn btn-success\\" href=\\"#\\" target=\\"_blank\\">Try the live demo<\\/a><a class=\\"btn btn-secondary\\" href=\\"#\\" target=\\"_blank\\">Documentation<\\/a><\\/p>\\n               <p><small class=\\"bt-version-check\\" style=\\"display:none;\\">Checking new version...<\\/small><\\/p>\\n               \\n               <\\/div>\\n               \\n               <span class=\'tooltip-content\'>Joomla! template<\\/span>\\n\\n               <style type=\\"text\\/css\\" media=\\"all\\">\\n               <!--\\n               #wrap1 {padding:0px 0px 4px 0px; font-weight: 400; text-align: justify; color: #4d4d4d; line-height: 24px; max-width: 680px; }\\n               #wrap1 p { padding: 0; }\\n               #wrap1 h1 {clear:both; font-size: 32px;margin: 0 0 8px; padding: 0;color:#333;font-weight: 600;}\\n               #wrap1 h4 { border: none;  font-weight: 300; margin: 0 20px 40px; font-size: 20px; line-height: 32px;color: #333; text-align: left }\\n               #wrap1 sup { font-style: italic; font-size: }\\n               #wrap1 .btn { margin-bottom:50px}\\n               \\n               .actions-wrap {display: flex; align-items: center; gap: 8px; margin-top: 24px; }\\n\\n               .actions-wrap a { display: flex; gap: 8px;}\\n               span.tooltip-content { display: none; }\\n               .tip-text span.readonly { display: none; }\\n               .tip-text span.tooltip-content { display: block; }\\n               .tip-text #wrap1 { display: none; }\\n               -->\\n\\n               .control-group.field-spacer .control-label { color: var(--template-link-color); padding: 0; width: 100%; }\\n               .control-group.field-spacer .control-label .spacer { display: flex; align-items: center; gap: 6px; font-size: 10px; text-transform: uppercase; font-weight: 600; letter-spacing: 0.5px; }\\n               .control-group.field-spacer .control-label .before { background: #f1f5f9; width: 234px; height: 6px;}\\n               .control-group.field-spacer .control-label .after { background: #f1f5f9; flex: 1; height: 6px; }\\n               .control-group.field-spacer .controls { display: none; }\\n<\\/style>\\n          \\n    ","group":"","changelogurl":"","inheritable":true,"filename":"templateDetails"}', '{"logo_image":"","logo_text":"","logo_slogan":"","favicon_image":"","touch_image":"","show_back_to_top":"1","menu_fixed":"0","container_width":"","section_spacing":"","gutter_spacing":"","template_layout":"","sublayout":"","offcanvas":"0","menu_trigger":"hover","mobile_menu_breakpoint":"768","btn_radius":"","btn_padding":"","global_radius":"","optimize_js":"0","js_excluded":"tinymce","optimize_css":"0","css_excluded":"tinymce"}', '{"optimize_js":"0","optimize_css":"0","js_excluded":"tinymce","css_excluded":"tinymce","custom_code_after_head":"","custom_code_before_head":"","custom_code_after_body":"","custom_code_before_body":"","presets":[{"name":"light","variables":{"--bee-primary":"#d05d5d","--bee-on-primary":"#ffffff","--bee-secondary":"#4f84b8","--bee-on-secondary":"#ffffff","--bee-accent":"#f9a813","--bee-on-accent":"#212529","--bee-neutral":"#1d1d1d","--bee-on-neutral":"#ffffff","--bee-info":"#0dcaf0","--bee-on-info":"#000000","--bee-success":"#198754","--bee-on-success":"#ffffff","--bee-warning":"#ffc107","--bee-on-warning":"#000000","--bee-danger":"#dc3545","--bee-on-danger":"#ffffff","--bee-base-100":"#ffffff","--bee-base-200":"#f1f5f9","--bee-base-300":"#dee2e6","--bee-base-content":"#212529","--bee-color-1":"#456496","--bee-color-2":"#3b5580","--bee-color-3":"#212529","--bee-color-4":"#6c757d","--bee-color-5":"#ffffff","--bee-color-6":"#ffd206"}},{"name":"dark","variables":{"--bee-primary":"#f9a813","--bee-on-primary":"#111111","--bee-secondary":"#4f84b8","--bee-on-secondary":"#ffffff","--bee-accent":"#d05d5d","--bee-on-accent":"#ffffff","--bee-neutral":"#000000","--bee-on-neutral":"#a5a5a5","--bee-info":"#0dcaf0","--bee-on-info":"#000000","--bee-success":"#198754","--bee-on-success":"#ffffff","--bee-warning":"#ffc107","--bee-on-warning":"#000000","--bee-danger":"#dc3545","--bee-on-danger":"#ffffff","--bee-base-100":"#fff","--bee-base-200":"#F8F8F8","--bee-base-300":"#eee","--bee-base-content":"#a5a5a5","--bee-color-1":"#fff","--bee-color-2":"#fff","--bee-color-3":"#fff","--bee-color-4":"#fff","--bee-color-5":"#fff","--bee-color-6":"#fff"}}],"cookieKey":"2448292918","megamenu":{}}', NULL, NULL, 0, 0, NULL);

-- Dumping structure for table nts_kgeek.kgeek_fields
CREATE TABLE IF NOT EXISTS `kgeek_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_value` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `required` tinyint NOT NULL DEFAULT '0',
  `only_use_in_subform` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldparams` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL,
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `access` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_user_id` (`created_user_id`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_fields: ~0 rows (approximately)
DELETE FROM `kgeek_fields`;

-- Dumping structure for table nts_kgeek.kgeek_fields_categories
CREATE TABLE IF NOT EXISTS `kgeek_fields_categories` (
  `field_id` int NOT NULL DEFAULT '0',
  `category_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_fields_categories: ~0 rows (approximately)
DELETE FROM `kgeek_fields_categories`;

-- Dumping structure for table nts_kgeek.kgeek_fields_groups
CREATE TABLE IF NOT EXISTS `kgeek_fields_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `access` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_fields_groups: ~0 rows (approximately)
DELETE FROM `kgeek_fields_groups`;

-- Dumping structure for table nts_kgeek.kgeek_fields_values
CREATE TABLE IF NOT EXISTS `kgeek_fields_values` (
  `field_id` int unsigned NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  KEY `idx_field_id` (`field_id`),
  KEY `idx_item_id` (`item_id`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_fields_values: ~0 rows (approximately)
DELETE FROM `kgeek_fields_values`;

-- Dumping structure for table nts_kgeek.kgeek_finder_filters
CREATE TABLE IF NOT EXISTS `kgeek_finder_filters` (
  `filter_id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `map_count` int unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `params` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_finder_filters: ~0 rows (approximately)
DELETE FROM `kgeek_finder_filters`;

-- Dumping structure for table nts_kgeek.kgeek_finder_links
CREATE TABLE IF NOT EXISTS `kgeek_finder_links` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `indexdate` datetime NOT NULL,
  `md5sum` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint NOT NULL DEFAULT '1',
  `state` int NOT NULL DEFAULT '1',
  `access` int NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `publish_start_date` datetime DEFAULT NULL,
  `publish_end_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int NOT NULL,
  `object` mediumblob,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`(100)),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_language` (`language`),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_finder_links: ~0 rows (approximately)
DELETE FROM `kgeek_finder_links`;

-- Dumping structure for table nts_kgeek.kgeek_finder_links_terms
CREATE TABLE IF NOT EXISTS `kgeek_finder_links_terms` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_finder_links_terms: ~0 rows (approximately)
DELETE FROM `kgeek_finder_links_terms`;

-- Dumping structure for table nts_kgeek.kgeek_finder_logging
CREATE TABLE IF NOT EXISTS `kgeek_finder_logging` (
  `searchterm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `md5sum` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `query` blob NOT NULL,
  `hits` int NOT NULL DEFAULT '1',
  `results` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5sum`),
  KEY `searchterm` (`searchterm`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_finder_logging: ~0 rows (approximately)
DELETE FROM `kgeek_finder_logging`;

-- Dumping structure for table nts_kgeek.kgeek_finder_taxonomy
CREATE TABLE IF NOT EXISTS `kgeek_finder_taxonomy` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `level` int unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint unsigned NOT NULL DEFAULT '1',
  `access` tinyint unsigned NOT NULL DEFAULT '1',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_access` (`access`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_level` (`level`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_finder_taxonomy: ~0 rows (approximately)
DELETE FROM `kgeek_finder_taxonomy`;
INSERT INTO `kgeek_finder_taxonomy` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `state`, `access`, `language`) VALUES
	(1, 0, 0, 1, 0, '', 'ROOT', 'root', 1, 1, '*');

-- Dumping structure for table nts_kgeek.kgeek_finder_taxonomy_map
CREATE TABLE IF NOT EXISTS `kgeek_finder_taxonomy_map` (
  `link_id` int unsigned NOT NULL,
  `node_id` int unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_finder_taxonomy_map: ~0 rows (approximately)
DELETE FROM `kgeek_finder_taxonomy_map`;

-- Dumping structure for table nts_kgeek.kgeek_finder_terms
CREATE TABLE IF NOT EXISTS `kgeek_finder_terms` (
  `term_id` int unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `links` int NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term_language` (`term`,`language`),
  KEY `idx_stem` (`stem`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_finder_terms: ~0 rows (approximately)
DELETE FROM `kgeek_finder_terms`;

-- Dumping structure for table nts_kgeek.kgeek_finder_terms_common
CREATE TABLE IF NOT EXISTS `kgeek_finder_terms_common` (
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `custom` int NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_term_language` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_finder_terms_common: ~174 rows (approximately)
DELETE FROM `kgeek_finder_terms_common`;
INSERT INTO `kgeek_finder_terms_common` (`term`, `language`, `custom`) VALUES
	('a', 'en', 0),
	('about', 'en', 0),
	('above', 'en', 0),
	('after', 'en', 0),
	('again', 'en', 0),
	('against', 'en', 0),
	('all', 'en', 0),
	('am', 'en', 0),
	('an', 'en', 0),
	('and', 'en', 0),
	('any', 'en', 0),
	('are', 'en', 0),
	('aren\'t', 'en', 0),
	('as', 'en', 0),
	('at', 'en', 0),
	('be', 'en', 0),
	('because', 'en', 0),
	('been', 'en', 0),
	('before', 'en', 0),
	('being', 'en', 0),
	('below', 'en', 0),
	('between', 'en', 0),
	('both', 'en', 0),
	('but', 'en', 0),
	('by', 'en', 0),
	('can\'t', 'en', 0),
	('cannot', 'en', 0),
	('could', 'en', 0),
	('couldn\'t', 'en', 0),
	('did', 'en', 0),
	('didn\'t', 'en', 0),
	('do', 'en', 0),
	('does', 'en', 0),
	('doesn\'t', 'en', 0),
	('doing', 'en', 0),
	('don\'t', 'en', 0),
	('down', 'en', 0),
	('during', 'en', 0),
	('each', 'en', 0),
	('few', 'en', 0),
	('for', 'en', 0),
	('from', 'en', 0),
	('further', 'en', 0),
	('had', 'en', 0),
	('hadn\'t', 'en', 0),
	('has', 'en', 0),
	('hasn\'t', 'en', 0),
	('have', 'en', 0),
	('haven\'t', 'en', 0),
	('having', 'en', 0),
	('he', 'en', 0),
	('he\'d', 'en', 0),
	('he\'ll', 'en', 0),
	('he\'s', 'en', 0),
	('her', 'en', 0),
	('here', 'en', 0),
	('here\'s', 'en', 0),
	('hers', 'en', 0),
	('herself', 'en', 0),
	('him', 'en', 0),
	('himself', 'en', 0),
	('his', 'en', 0),
	('how', 'en', 0),
	('how\'s', 'en', 0),
	('i', 'en', 0),
	('i\'d', 'en', 0),
	('i\'ll', 'en', 0),
	('i\'m', 'en', 0),
	('i\'ve', 'en', 0),
	('if', 'en', 0),
	('in', 'en', 0),
	('into', 'en', 0),
	('is', 'en', 0),
	('isn\'t', 'en', 0),
	('it', 'en', 0),
	('it\'s', 'en', 0),
	('its', 'en', 0),
	('itself', 'en', 0),
	('let\'s', 'en', 0),
	('me', 'en', 0),
	('more', 'en', 0),
	('most', 'en', 0),
	('mustn\'t', 'en', 0),
	('my', 'en', 0),
	('myself', 'en', 0),
	('no', 'en', 0),
	('nor', 'en', 0),
	('not', 'en', 0),
	('of', 'en', 0),
	('off', 'en', 0),
	('on', 'en', 0),
	('once', 'en', 0),
	('only', 'en', 0),
	('or', 'en', 0),
	('other', 'en', 0),
	('ought', 'en', 0),
	('our', 'en', 0),
	('ours', 'en', 0),
	('ourselves', 'en', 0),
	('out', 'en', 0),
	('over', 'en', 0),
	('own', 'en', 0),
	('same', 'en', 0),
	('shan\'t', 'en', 0),
	('she', 'en', 0),
	('she\'d', 'en', 0),
	('she\'ll', 'en', 0),
	('she\'s', 'en', 0),
	('should', 'en', 0),
	('shouldn\'t', 'en', 0),
	('so', 'en', 0),
	('some', 'en', 0),
	('such', 'en', 0),
	('than', 'en', 0),
	('that', 'en', 0),
	('that\'s', 'en', 0),
	('the', 'en', 0),
	('their', 'en', 0),
	('theirs', 'en', 0),
	('them', 'en', 0),
	('themselves', 'en', 0),
	('then', 'en', 0),
	('there', 'en', 0),
	('there\'s', 'en', 0),
	('these', 'en', 0),
	('they', 'en', 0),
	('they\'d', 'en', 0),
	('they\'ll', 'en', 0),
	('they\'re', 'en', 0),
	('they\'ve', 'en', 0),
	('this', 'en', 0),
	('those', 'en', 0),
	('through', 'en', 0),
	('to', 'en', 0),
	('too', 'en', 0),
	('under', 'en', 0),
	('until', 'en', 0),
	('up', 'en', 0),
	('very', 'en', 0),
	('was', 'en', 0),
	('wasn\'t', 'en', 0),
	('we', 'en', 0),
	('we\'d', 'en', 0),
	('we\'ll', 'en', 0),
	('we\'re', 'en', 0),
	('we\'ve', 'en', 0),
	('were', 'en', 0),
	('weren\'t', 'en', 0),
	('what', 'en', 0),
	('what\'s', 'en', 0),
	('when', 'en', 0),
	('when\'s', 'en', 0),
	('where', 'en', 0),
	('where\'s', 'en', 0),
	('which', 'en', 0),
	('while', 'en', 0),
	('who', 'en', 0),
	('who\'s', 'en', 0),
	('whom', 'en', 0),
	('why', 'en', 0),
	('why\'s', 'en', 0),
	('with', 'en', 0),
	('won\'t', 'en', 0),
	('would', 'en', 0),
	('wouldn\'t', 'en', 0),
	('you', 'en', 0),
	('you\'d', 'en', 0),
	('you\'ll', 'en', 0),
	('you\'re', 'en', 0),
	('you\'ve', 'en', 0),
	('your', 'en', 0),
	('yours', 'en', 0),
	('yourself', 'en', 0),
	('yourselves', 'en', 0);

-- Dumping structure for table nts_kgeek.kgeek_finder_tokens
CREATE TABLE IF NOT EXISTS `kgeek_finder_tokens` (
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint unsigned NOT NULL DEFAULT '2',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_stem` (`stem`),
  KEY `idx_context` (`context`),
  KEY `idx_language` (`language`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_finder_tokens: 0 rows
DELETE FROM `kgeek_finder_tokens`;
/*!40000 ALTER TABLE `kgeek_finder_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `kgeek_finder_tokens` ENABLE KEYS */;

-- Dumping structure for table nts_kgeek.kgeek_finder_tokens_aggregate
CREATE TABLE IF NOT EXISTS `kgeek_finder_tokens_aggregate` (
  `term_id` int unsigned NOT NULL,
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL DEFAULT '0',
  `context` tinyint unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL DEFAULT '0',
  `total_weight` float unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_finder_tokens_aggregate: 0 rows
DELETE FROM `kgeek_finder_tokens_aggregate`;
/*!40000 ALTER TABLE `kgeek_finder_tokens_aggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `kgeek_finder_tokens_aggregate` ENABLE KEYS */;

-- Dumping structure for table nts_kgeek.kgeek_finder_types
CREATE TABLE IF NOT EXISTS `kgeek_finder_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_finder_types: ~5 rows (approximately)
DELETE FROM `kgeek_finder_types`;
INSERT INTO `kgeek_finder_types` (`id`, `title`, `mime`) VALUES
	(1, 'Category', ''),
	(2, 'Contact', ''),
	(3, 'Article', ''),
	(4, 'News Feed', ''),
	(5, 'Tag', '');

-- Dumping structure for table nts_kgeek.kgeek_guidedtours
CREATE TABLE IF NOT EXISTS `kgeek_guidedtours` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uid` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `extensions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL,
  `modified_by` int NOT NULL DEFAULT '0',
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int unsigned DEFAULT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `access` int unsigned NOT NULL DEFAULT '0',
  `autostart` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_state` (`published`),
  KEY `idx_language` (`language`),
  KEY `idx_uid` (`uid`(191))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_guidedtours: ~12 rows (approximately)
DELETE FROM `kgeek_guidedtours`;
INSERT INTO `kgeek_guidedtours` (`id`, `title`, `uid`, `description`, `ordering`, `extensions`, `url`, `created`, `created_by`, `modified`, `modified_by`, `checked_out_time`, `checked_out`, `published`, `language`, `note`, `access`, `autostart`) VALUES
	(1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_TITLE', 'joomla-guidedtours', 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_DESCRIPTION', 1, '["com_guidedtours"]', 'administrator/index.php?option=com_guidedtours&view=tours', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, 1, '*', '', 1, 0),
	(2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_TITLE', 'joomla-guidedtoursteps', 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_DESCRIPTION', 2, '["com_guidedtours"]', 'administrator/index.php?option=com_guidedtours&view=tours', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, 1, '*', '', 1, 0),
	(3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_TITLE', 'joomla-articles', 'COM_GUIDEDTOURS_TOUR_ARTICLES_DESCRIPTION', 3, '["com_content","com_categories"]', 'administrator/index.php?option=com_content&view=articles', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, 1, '*', '', 1, 0),
	(4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_TITLE', 'joomla-categories', 'COM_GUIDEDTOURS_TOUR_CATEGORIES_DESCRIPTION', 4, '["com_content","com_categories"]', 'administrator/index.php?option=com_categories&view=categories&extension=com_content', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, 1, '*', '', 1, 0),
	(5, 'COM_GUIDEDTOURS_TOUR_MENUS_TITLE', 'joomla-menus', 'COM_GUIDEDTOURS_TOUR_MENUS_DESCRIPTION', 5, '["com_menus"]', 'administrator/index.php?option=com_menus&view=menus', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, 1, '*', '', 1, 0),
	(6, 'COM_GUIDEDTOURS_TOUR_TAGS_TITLE', 'joomla-tags', 'COM_GUIDEDTOURS_TOUR_TAGS_DESCRIPTION', 6, '["com_tags"]', 'administrator/index.php?option=com_tags&view=tags', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, 1, '*', '', 1, 0),
	(7, 'COM_GUIDEDTOURS_TOUR_BANNERS_TITLE', 'joomla-banners', 'COM_GUIDEDTOURS_TOUR_BANNERS_DESCRIPTION', 7, '["com_banners"]', 'administrator/index.php?option=com_banners&view=banners', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, 1, '*', '', 1, 0),
	(8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_TITLE', 'joomla-contacts', 'COM_GUIDEDTOURS_TOUR_CONTACTS_DESCRIPTION', 8, '["com_contact"]', 'administrator/index.php?option=com_contact&view=contacts', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, 1, '*', '', 1, 0),
	(9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_TITLE', 'joomla-newsfeeds', 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_DESCRIPTION', 9, '["com_newsfeeds"]', 'administrator/index.php?option=com_newsfeeds&view=newsfeeds', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, 1, '*', '', 1, 0),
	(10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_TITLE', 'joomla-smartsearch', 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_DESCRIPTION', 10, '["com_finder"]', 'administrator/index.php?option=com_finder&view=filters', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, 1, '*', '', 1, 0),
	(11, 'COM_GUIDEDTOURS_TOUR_USERS_TITLE', 'joomla-users', 'COM_GUIDEDTOURS_TOUR_USERS_DESCRIPTION', 11, '["com_users"]', 'administrator/index.php?option=com_users&view=users', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, 1, '*', '', 1, 0),
	(12, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_TITLE', 'joomla-welcome', 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_DESCRIPTION', 12, '["com_cpanel"]', 'administrator/index.php', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, 1, '*', '', 1, 1);

-- Dumping structure for table nts_kgeek.kgeek_guidedtour_steps
CREATE TABLE IF NOT EXISTS `kgeek_guidedtour_steps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tour_id` int NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int NOT NULL,
  `interactive_type` int NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int unsigned DEFAULT NULL,
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_tour` (`tour_id`),
  KEY `idx_state` (`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_guidedtour_steps: ~117 rows (approximately)
DELETE FROM `kgeek_guidedtour_steps`;
INSERT INTO `kgeek_guidedtour_steps` (`id`, `tour_id`, `title`, `published`, `description`, `ordering`, `position`, `target`, `type`, `interactive_type`, `url`, `created`, `created_by`, `modified`, `modified_by`, `checked_out_time`, `checked_out`, `language`, `note`, `params`) VALUES
	(1, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_NEW_DESCRIPTION', 1, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_guidedtours&view=tours', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(2, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_TITLE_DESCRIPTION', 2, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(3, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_URL_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_URL_DESCRIPTION', 3, 'top', '#jform_url', 2, 2, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(4, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_CONTENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_CONTENT_DESCRIPTION', 4, 'bottom', '#jform_description,#jform_description_ifr', 2, 3, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(5, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_COMPONENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_COMPONENT_DESCRIPTION', 5, 'top', 'joomla-field-fancy-select .choices', 2, 3, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(6, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_AUTOSTART_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_AUTOSTART_DESCRIPTION', 6, 'bottom', '#jform_autostart0', 2, 3, '', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(7, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_SAVECLOSE_DESCRIPTION', 7, 'top', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(8, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_CONGRATULATIONS_DESCRIPTION', 8, 'bottom', '', 0, 1, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(9, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_COUNTER_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_COUNTER_DESCRIPTION', 9, 'top', '#toursList tbody tr:nth-last-of-type(1) td:nth-of-type(5) .btn', 2, 1, '', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(10, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_NEW_DESCRIPTION', 10, 'bottom', '.button-new', 2, 1, '', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(11, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TITLE_DESCRIPTION', 11, 'bottom', '#jform_title', 2, 2, '', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(12, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_DESCRIPTION_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_DESCRIPTION_DESCRIPTION', 12, 'bottom', '#jform_description,#jform_description_ifr', 2, 3, '', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(13, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_STATUS_DESCRIPTION', 13, 'bottom', '#jform_published', 2, 3, '', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(14, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_POSITION_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_POSITION_DESCRIPTION', 14, 'top', '#jform_position', 2, 3, '', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(15, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TARGET_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TARGET_DESCRIPTION', 15, 'top', '#jform_target', 2, 3, '', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(16, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TYPE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TYPE_DESCRIPTION', 16, 'top', '#jform_type', 2, 3, '', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(17, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_SAVECLOSE_DESCRIPTION', 17, 'bottom', '#save-group-children-save .button-save', 2, 1, '', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(18, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_CONGRATULATIONS_DESCRIPTION', 18, 'bottom', '', 0, 1, '', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(19, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_NEW_DESCRIPTION', 19, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_content&view=articles', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(20, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_TITLE_DESCRIPTION', 20, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(21, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_ALIAS_DESCRIPTION', 21, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(22, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CONTENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CONTENT_DESCRIPTION', 22, 'bottom', '#jform_articletext,#jform_articletext_ifr', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(23, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_STATUS_DESCRIPTION', 23, 'bottom', '#jform_state', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(24, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CATEGORY_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CATEGORY_DESCRIPTION', 24, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(25, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_FEATURED_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_FEATURED_DESCRIPTION', 25, 'bottom', '#jform_featured0', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(26, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_ACCESS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_ACCESS_DESCRIPTION', 26, 'bottom', '#jform_access', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(27, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_TAGS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_TAGS_DESCRIPTION', 27, 'top', 'joomla-field-fancy-select .choices[data-type=select-multiple]', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(28, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_NOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_NOTE_DESCRIPTION', 28, 'top', '#jform_note', 2, 2, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(29, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_VERSIONNOTE_DESCRIPTION', 29, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(30, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_SAVECLOSE_DESCRIPTION', 30, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(31, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CONGRATULATIONS_DESCRIPTION', 31, 'bottom', '', 0, 1, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(32, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_NEW_DESCRIPTION', 32, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_categories&view=categories&extension=com_content', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(33, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_TITLE_DESCRIPTION', 33, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(34, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_ALIAS_DESCRIPTION', 34, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(35, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_CONTENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_CONTENT_DESCRIPTION', 35, 'bottom', '#jform_description,#jform_description_ifr', 2, 3, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(36, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_PARENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_PARENT_DESCRIPTION', 36, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(37, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_STATUS_DESCRIPTION', 37, 'bottom', '#jform_published', 2, 3, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(38, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_ACCESS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_ACCESS_DESCRIPTION', 38, 'bottom', '#jform_access', 2, 3, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(39, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_TAGS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_TAGS_DESCRIPTION', 39, 'top', 'joomla-field-fancy-select .choices[data-type=select-multiple]', 2, 3, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(40, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_NOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_NOTE_DESCRIPTION', 40, 'top', '#jform_note', 2, 2, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(41, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_VERSIONNOTE_DESCRIPTION', 41, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(42, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_SAVECLOSE_DESCRIPTION', 42, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(43, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_CONGRATULATIONS_DESCRIPTION', 43, 'bottom', '', 0, 1, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(44, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_NEW_DESCRIPTION', 44, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_menus&view=menus', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(45, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_TITLE_DESCRIPTION', 45, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_menus&view=menu&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(46, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_UNIQUENAME_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_UNIQUENAME_DESCRIPTION', 46, 'top', '#jform_menutype', 2, 2, 'administrator/index.php?option=com_menus&view=menu&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(47, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_DESCRIPTION_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_DESCRIPTION_DESCRIPTION', 47, 'top', '#jform_menudescription', 2, 2, 'administrator/index.php?option=com_menus&view=menu&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(48, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_SAVECLOSE_DESCRIPTION', 48, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_menus&view=menu&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(49, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_CONGRATULATIONS_DESCRIPTION', 49, 'bottom', '', 0, 1, 'administrator/index.php?option=com_menus&view=menu&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(50, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_NEW_DESCRIPTION', 50, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_tags&view=tags', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(51, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_TITLE_DESCRIPTION', 51, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(52, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_ALIAS_DESCRIPTION', 52, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(53, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_CONTENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_CONTENT_DESCRIPTION', 53, 'bottom', '#jform_description,#jform_description_ifr', 2, 3, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(54, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_PARENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_PARENT_DESCRIPTION', 54, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(55, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_STATUS_DESCRIPTION', 55, 'bottom', '#jform_published', 2, 3, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(56, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_ACCESS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_ACCESS_DESCRIPTION', 56, 'bottom', '#jform_access', 2, 3, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(57, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_NOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_NOTE_DESCRIPTION', 57, 'top', '#jform_note', 2, 2, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(58, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_VERSIONNOTE_DESCRIPTION', 58, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(59, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_SAVECLOSE_DESCRIPTION', 59, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(60, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_CONGRATULATIONS_DESCRIPTION', 60, 'bottom', '', 0, 1, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(61, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_NEW_DESCRIPTION', 61, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_banners&view=banners', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(62, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_TITLE_DESCRIPTION', 62, 'bottom', '#jform_name', 2, 2, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(63, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_ALIAS_DESCRIPTION', 63, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(64, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_DETAILS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_DETAILS_DESCRIPTION', 64, 'bottom', '.col-lg-9', 2, 3, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(65, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_STATUS_DESCRIPTION', 65, 'bottom', '#jform_state', 2, 3, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(66, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_CATEGORY_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_CATEGORY_DESCRIPTION', 66, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(67, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_PINNED_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_PINNED_DESCRIPTION', 67, 'bottom', '#jform_sticky1', 2, 3, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(68, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_VERSIONNOTE_DESCRIPTION', 68, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(69, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_SAVECLOSE_DESCRIPTION', 69, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(70, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_CONGRATULATIONS_DESCRIPTION', 70, 'bottom', '', 0, 1, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(71, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_NEW_DESCRIPTION', 71, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_contact&view=contacts', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(72, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_TITLE_DESCRIPTION', 72, 'bottom', '#jform_name', 2, 2, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(73, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_ALIAS_DESCRIPTION', 73, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(74, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_DETAILS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_DETAILS_DESCRIPTION', 74, 'bottom', '.col-lg-9', 0, 1, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(75, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_STATUS_DESCRIPTION', 75, 'bottom', '#jform_published', 2, 3, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(76, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_CATEGORY_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_CATEGORY_DESCRIPTION', 76, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(77, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_FEATURED_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_FEATURED_DESCRIPTION', 77, 'bottom', '#jform_featured0', 2, 3, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(78, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_ACCESS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_ACCESS_DESCRIPTION', 78, 'bottom', '#jform_access', 2, 3, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(79, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_TAGS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_TAGS_DESCRIPTION', 79, 'top', 'joomla-field-fancy-select .choices[data-type=select-multiple]', 2, 3, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(80, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_VERSIONNOTE_DESCRIPTION', 80, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(81, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_SAVECLOSE_DESCRIPTION', 81, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(82, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_CONGRATULATIONS_DESCRIPTION', 82, 'bottom', '', 0, 1, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(83, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_NEW_DESCRIPTION', 83, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_newsfeeds&view=newsfeeds', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(84, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_TITLE_DESCRIPTION', 84, 'bottom', '#jform_name', 2, 2, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(85, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_ALIAS_DESCRIPTION', 85, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(86, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_LINK_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_LINK_DESCRIPTION', 86, 'bottom', '#jform_link', 2, 2, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(87, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_DESCRIPTION_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_DESCRIPTION_DESCRIPTION', 87, 'bottom', '#jform_description,#jform_description_ifr', 2, 3, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(88, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_STATUS_DESCRIPTION', 88, 'bottom', '#jform_published', 2, 3, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(89, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_CATEGORY_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_CATEGORY_DESCRIPTION', 89, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(90, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_ACCESS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_ACCESS_DESCRIPTION', 90, 'bottom', '#jform_access', 2, 3, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(91, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_TAGS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_TAGS_DESCRIPTION', 91, 'top', 'joomla-field-fancy-select .choices[data-type=select-multiple]', 2, 3, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(92, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_VERSIONNOTE_DESCRIPTION', 92, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(93, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_SAVECLOSE_DESCRIPTION', 93, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(94, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_CONGRATULATIONS_DESCRIPTION', 94, 'bottom', '', 0, 1, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(95, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_NEW_DESCRIPTION', 95, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_finder&view=filters', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(96, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_TITLE_DESCRIPTION', 96, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(97, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_ALIAS_DESCRIPTION', 97, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(98, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_CONTENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_CONTENT_DESCRIPTION', 98, 'bottom', '.col-lg-9', 0, 1, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(99, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_STATUS_DESCRIPTION', 99, 'bottom', '#jform_state', 2, 3, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(100, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_SAVECLOSE_DESCRIPTION', 100, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(101, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_CONGRATULATIONS_DESCRIPTION', 101, 'bottom', '', 0, 1, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(102, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_NEW_DESCRIPTION', 102, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(103, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_NAME_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_NAME_DESCRIPTION', 103, 'bottom', '#jform_name', 2, 2, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(104, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_LOGINNAME_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_LOGINNAME_DESCRIPTION', 104, 'bottom', '#jform_username', 2, 2, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(105, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORD_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORD_DESCRIPTION', 105, 'bottom', '#jform_password', 2, 2, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(106, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORD2_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORD2_DESCRIPTION', 106, 'bottom', '#jform_password2', 2, 2, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(107, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_EMAIL_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_EMAIL_DESCRIPTION', 107, 'bottom', '#jform_email', 2, 2, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(108, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_SYSTEMEMAIL_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_SYSTEMEMAIL_DESCRIPTION', 108, 'top', '#jform_sendEmail0', 2, 3, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(109, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_STATUS_DESCRIPTION', 109, 'top', '#jform_block0', 2, 3, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(110, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORDRESET_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORDRESET_DESCRIPTION', 110, 'top', '#jform_requireReset0', 2, 3, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(111, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_SAVECLOSE_DESCRIPTION', 111, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(112, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_CONGRATULATIONS_DESCRIPTION', 112, 'bottom', '', 0, 1, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(113, 12, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_MENUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_MENUS_DESCRIPTION', 113, 'right', '#sidebarmenu', 0, 1, '', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(114, 12, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_QUICKACCESS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_QUICKACCESS_DESCRIPTION', 114, 'center', '', 0, 1, '', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(115, 12, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_NOTIFICATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_NOTIFICATIONS_DESCRIPTION', 115, 'left', '.quickicons-for-update_quickicon .card', 0, 1, '', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(116, 12, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_TOPBAR_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_TOPBAR_DESCRIPTION', 116, 'bottom', '#header', 0, 1, '', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL),
	(117, 12, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_FINALWORDS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_FINALWORDS_DESCRIPTION', 117, 'right', '#sidebarmenu nav > ul:first-of-type > li:last-child', 0, 1, '', '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL, '*', '', NULL);

-- Dumping structure for table nts_kgeek.kgeek_history
CREATE TABLE IF NOT EXISTS `kgeek_history` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL,
  `editor_user_id` int unsigned NOT NULL DEFAULT '0',
  `character_count` int unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  `is_current` tinyint NOT NULL DEFAULT '0',
  `is_legacy` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_history: ~0 rows (approximately)
DELETE FROM `kgeek_history`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_aliases
CREATE TABLE IF NOT EXISTS `kgeek_kunena_aliases` (
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  UNIQUE KEY `alias` (`alias`),
  KEY `state` (`state`),
  KEY `item` (`item`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_aliases: ~25 rows (approximately)
DELETE FROM `kgeek_kunena_aliases`;
INSERT INTO `kgeek_kunena_aliases` (`alias`, `type`, `item`, `state`) VALUES
	('1957-porsche-356', 'catid', '20', 0),
	('1959-mercedes-benz-sl-190', 'catid', '19', 0),
	('1984-mercedes-benz-sl', 'catid', '18', 0),
	('1994-lamborghini-diablo', 'catid', '13', 0),
	('1995-mercedes-benz-sl', 'catid', '17', 0),
	('1995-porsche-911', 'catid', '23', 0),
	('2011-mercedes-benz-sls-amg', 'catid', '16', 0),
	('2012-mclaren-12c', 'catid', '12', 0),
	('2016-porsche-911', 'catid', '21', 0),
	('2020-lamborghini-aventador', 'catid', '15', 0),
	('2024-porsche-taycan', 'catid', '22', 0),
	('2025-lamborghini-revuelto', 'catid', '14', 0),
	('2026-mclaren-750s', 'catid', '10', 0),
	('announcement', 'view', 'announcement', 1),
	('car', 'catid', '2', 0),
	('category', 'view', 'category', 1),
	('category/create', 'layout', 'category.create', 1),
	('category/default', 'layout', 'category.default', 1),
	('category/edit', 'layout', 'category.edit', 1),
	('category/manage', 'layout', 'category.manage', 1),
	('category/moderate', 'layout', 'category.moderate', 1),
	('category/user', 'layout', 'category.user', 1),
	('common', 'view', 'common', 1),
	('create', 'layout', 'category.create', 0),
	('credits', 'view', 'credits', 1),
	('default', 'layout', 'category.default', 0),
	('edit', 'layout', 'category.edit', 0),
	('home', 'view', 'home', 1),
	('lamborghini', 'catid', '7', 0),
	('main-forum', 'catid', '1', 1),
	('manage', 'layout', 'category.manage', 0),
	('mclaren', 'catid', '8', 0),
	('mclaren-765-lt', 'catid', '9', 0),
	('mercedes', 'catid', '4', 0),
	('misc', 'view', 'misc', 1),
	('moderate', 'layout', 'category.moderate', 0),
	('porsche', 'catid', '3', 0),
	('porsche-911', 'catid', '5', 0),
	('porsche-981', 'catid', '6', 0),
	('search', 'view', 'search', 1),
	('statistics', 'view', 'statistics', 1),
	('suggestion-box', 'catid', '3', 1),
	('topic', 'view', 'topic', 1),
	('topics', 'view', 'topics', 1),
	('user', 'view', 'user', 1),
	('welcome-mat', 'catid', '2', 1);

-- Dumping structure for table nts_kgeek.kgeek_kunena_announcement
CREATE TABLE IF NOT EXISTS `kgeek_kunena_announcement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `sdescription` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `ordering` tinyint NOT NULL DEFAULT '0',
  `showdate` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_announcement: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_announcement`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_attachments
CREATE TABLE IF NOT EXISTS `kgeek_kunena_attachments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mesid` int NOT NULL DEFAULT '0',
  `userid` int NOT NULL DEFAULT '0',
  `protected` tinyint NOT NULL DEFAULT '0',
  `hash` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `folder` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filetype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename_real` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Filename for downloads',
  `caption` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `inline` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mesid` (`mesid`),
  KEY `userid` (`userid`),
  KEY `hash` (`hash`),
  KEY `filename` (`filename`),
  KEY `filename_real` (`filename_real`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_attachments: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_attachments`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_categories
CREATE TABLE IF NOT EXISTS `kgeek_kunena_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentid` int DEFAULT '0',
  `name` tinytext COLLATE utf8mb4_unicode_ci,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_id` tinyint NOT NULL DEFAULT '0',
  `locked` tinyint NOT NULL DEFAULT '0',
  `accesstype` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'joomla.level',
  `access` int NOT NULL DEFAULT '0',
  `pubAccess` int NOT NULL DEFAULT '1',
  `pubRecurse` tinyint DEFAULT '1',
  `adminAccess` int NOT NULL DEFAULT '0',
  `adminRecurse` tinyint DEFAULT '1',
  `ordering` int NOT NULL DEFAULT '0',
  `published` tinyint NOT NULL DEFAULT '0',
  `channels` text COLLATE utf8mb4_unicode_ci,
  `checked_out` int NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `review` tinyint NOT NULL DEFAULT '0',
  `allowAnonymous` tinyint NOT NULL DEFAULT '0',
  `postAnonymous` tinyint NOT NULL DEFAULT '0',
  `hits` int NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `headerdesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `topictemplate` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_sfx` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowPolls` tinyint NOT NULL DEFAULT '0',
  `topicOrdering` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'lastpost',
  `iconset` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numTopics` mediumint NOT NULL DEFAULT '0',
  `numPosts` mediumint NOT NULL DEFAULT '0',
  `last_topic_id` int NOT NULL DEFAULT '0',
  `last_post_id` int NOT NULL DEFAULT '0',
  `last_post_time` int NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowRatings` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`),
  KEY `category_access` (`accesstype`,`access`),
  KEY `published_pubaccess_id` (`published`,`pubAccess`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_categories: ~21 rows (approximately)
DELETE FROM `kgeek_kunena_categories`;
INSERT INTO `kgeek_kunena_categories` (`id`, `parentid`, `name`, `alias`, `icon`, `icon_id`, `locked`, `accesstype`, `access`, `pubAccess`, `pubRecurse`, `adminAccess`, `adminRecurse`, `ordering`, `published`, `channels`, `checked_out`, `checked_out_time`, `review`, `allowAnonymous`, `postAnonymous`, `hits`, `description`, `headerdesc`, `topictemplate`, `class_sfx`, `allowPolls`, `topicOrdering`, `iconset`, `numTopics`, `numPosts`, `last_topic_id`, `last_post_id`, `last_post_time`, `params`, `allowRatings`) VALUES
	(1, 0, 'Main Forum', 'main-forum', '', 0, 0, 'joomla.group', 1, 1, 1, 8, 1, 1, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'This is the main forum section. It serves as a container for categories for your topics.', 'The section header is used to display additional information about the categories of topics that it contains.', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(2, 0, 'Car', 'car', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 2, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(3, 2, 'Porsche', 'porsche', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 1, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(4, 2, 'Mercedes', 'mercedes', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 2, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(5, 3, 'Porsche 911', 'porsche-911', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 1, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(6, 3, 'Porsche 981', 'porsche-981', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 2, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(7, 2, 'Lamborghini', 'lamborghini', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 3, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(8, 2, 'mclaren', 'mclaren', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 4, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(9, 8, 'McLaren 765 LT', 'mclaren-765-lt', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 1, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(10, 8, '2026 McLaren 750S', '2026-mclaren-750s', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 2, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(11, 8, '2026 McLaren 750S', '2026-mclaren-750s', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 3, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(12, 8, '2012 McLaren 12C', '2012-mclaren-12c', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 4, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(13, 7, '1994 Lamborghini Diablo', '1994-lamborghini-diablo', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 1, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(14, 7, '2025 Lamborghini Revuelto', '2025-lamborghini-revuelto', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 2, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(15, 7, '2020 Lamborghini Aventador', '2020-lamborghini-aventador', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 3, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(16, 4, '2011 Mercedes-Benz SLS AMG', '2011-mercedes-benz-sls-amg', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 1, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(17, 4, '1995 Mercedes-Benz SL', '1995-mercedes-benz-sl', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 2, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(18, 4, '1984 Mercedes-Benz SL', '1984-mercedes-benz-sl', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 3, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(19, 4, '1959 Mercedes-Benz SL 190', '1959-mercedes-benz-sl-190', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 4, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(20, 3, '1957 Porsche 356', '1957-porsche-356', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 3, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(21, 3, '2016 Porsche 911', '2016-porsche-911', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 4, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(22, 3, '2024 Porsche Taycan', '2024-porsche-taycan', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 5, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0),
	(23, 3, '1995 Porsche 911', '1995-porsche-911', '', 0, 0, 'joomla.level', 1, 1, 1, 8, 1, 6, 1, 'THIS', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '', '', '', '', 0, 'lastpost', 'default', 0, 0, 0, 0, 0, '{"display":{"index":{"parent":"3","children":"3"}}}', 0);

-- Dumping structure for table nts_kgeek.kgeek_kunena_karma
CREATE TABLE IF NOT EXISTS `kgeek_kunena_karma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `target_userid` int NOT NULL,
  `time` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_karma: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_karma`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_logs
CREATE TABLE IF NOT EXISTS `kgeek_kunena_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `topic_id` int DEFAULT NULL,
  `target_user` int DEFAULT NULL,
  `ip` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` int DEFAULT NULL,
  `operation` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `category_id` (`category_id`),
  KEY `topic_id` (`topic_id`),
  KEY `target_user` (`target_user`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_logs: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_logs`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_messages
CREATE TABLE IF NOT EXISTS `kgeek_kunena_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent` int DEFAULT '0',
  `thread` int DEFAULT '0',
  `catid` int NOT NULL DEFAULT '0',
  `name` tinytext COLLATE utf8mb4_unicode_ci,
  `userid` int NOT NULL DEFAULT '0',
  `email` tinytext COLLATE utf8mb4_unicode_ci,
  `subject` tinytext COLLATE utf8mb4_unicode_ci,
  `time` int NOT NULL DEFAULT '0',
  `ip` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `topic_emoticon` int NOT NULL DEFAULT '0',
  `locked` tinyint NOT NULL DEFAULT '0',
  `hold` tinyint NOT NULL DEFAULT '0',
  `ordering` int DEFAULT '0',
  `hits` int DEFAULT '0',
  `moved` tinyint DEFAULT '0',
  `deleted_time` int NOT NULL DEFAULT '0',
  `modified_by` int DEFAULT NULL,
  `modified_time` int DEFAULT NULL,
  `modified_reason` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `thread` (`thread`),
  KEY `ip` (`ip`),
  KEY `userid` (`userid`),
  KEY `locked` (`locked`),
  KEY `parent_hits` (`parent`,`hits`),
  KEY `catid_parent` (`catid`,`parent`),
  KEY `time_hold` (`time`,`hold`),
  KEY `hold` (`hold`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_messages: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_messages`;
INSERT INTO `kgeek_kunena_messages` (`id`, `parent`, `thread`, `catid`, `name`, `userid`, `email`, `subject`, `time`, `ip`, `topic_emoticon`, `locked`, `hold`, `ordering`, `hits`, `moved`, `deleted_time`, `modified_by`, `modified_time`, `modified_reason`) VALUES
	(1, 0, 1, 2, 'Kunena', 688, NULL, 'Welcome to Kunena!', 1795098691, '127.0.0.1', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL);

-- Dumping structure for table nts_kgeek.kgeek_kunena_messages_text
CREATE TABLE IF NOT EXISTS `kgeek_kunena_messages_text` (
  `mesid` int NOT NULL DEFAULT '0',
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`mesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_messages_text: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_messages_text`;
INSERT INTO `kgeek_kunena_messages_text` (`mesid`, `message`) VALUES
	(1, '[size=150][b]Welcome to Kunena![/b][/size] \n\n Thank you for choosing Kunena for your community forum needs in Joomla. \n\n Kunena, translated from Swahili meaning "to speak", is built by a team of open source professionals with the goal of providing a top quality, tightly unified forum solution for Joomla. \n\n\n [size=150][b]Additional Kunena Resources[/b][/size] \n\n [b]Kunena Documentation:[/b] [url=https://www.kunena.org/docs/en]www.kunena.org/docs/en[/url] \n\n [b]Kunena Support Forum[/b]: [url=https://www.kunena.org/forum]www.kunena.org/forum[/url] \n\n [b]Kunena Downloads:[/b] [url=https://www.kunena.org/download]www.kunena.org/download[/url] \n\n [b]Kunena Blog:[/b] [url=https://www.kunena.org/blog]www.kunena.org/blog[/url] \n\n [b]Follow Kunena on X:[/b] [url=https://www.kunena.org/twitter]www.kunena.org/twitter[/url]');

-- Dumping structure for table nts_kgeek.kgeek_kunena_notifications_mailsqueue
CREATE TABLE IF NOT EXISTS `kgeek_kunena_notifications_mailsqueue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `messageId` int NOT NULL DEFAULT '0',
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailListJson` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `once` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sentusers` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `send` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_notifications_mailsqueue: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_notifications_mailsqueue`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_polls
CREATE TABLE IF NOT EXISTS `kgeek_kunena_polls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `threadid` int NOT NULL,
  `polltimetolive` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `threadid` (`threadid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_polls: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_polls`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_polls_options
CREATE TABLE IF NOT EXISTS `kgeek_kunena_polls_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pollid` int DEFAULT NULL,
  `text` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `votes` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pollid` (`pollid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_polls_options: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_polls_options`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_polls_users
CREATE TABLE IF NOT EXISTS `kgeek_kunena_polls_users` (
  `pollid` int DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `votes` int DEFAULT NULL,
  `lasttime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `lastvote` int DEFAULT NULL,
  UNIQUE KEY `pollid` (`pollid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_polls_users: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_polls_users`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_private
CREATE TABLE IF NOT EXISTS `kgeek_kunena_private` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT '0',
  `author_id` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `attachments` tinyint NOT NULL DEFAULT '0',
  `subject` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `author_id` (`author_id`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_private: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_private`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_private_attachment_map
CREATE TABLE IF NOT EXISTS `kgeek_kunena_private_attachment_map` (
  `private_id` int NOT NULL,
  `attachment_id` int NOT NULL,
  PRIMARY KEY (`private_id`,`attachment_id`),
  KEY `attachment_id` (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_private_attachment_map: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_private_attachment_map`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_private_post_map
CREATE TABLE IF NOT EXISTS `kgeek_kunena_private_post_map` (
  `private_id` int NOT NULL,
  `message_id` int NOT NULL,
  PRIMARY KEY (`private_id`,`message_id`),
  KEY `message_id` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_private_post_map: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_private_post_map`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_private_user_map
CREATE TABLE IF NOT EXISTS `kgeek_kunena_private_user_map` (
  `private_id` int NOT NULL,
  `user_id` int NOT NULL,
  `read_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `replied_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`private_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_private_user_map: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_private_user_map`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_ranks
CREATE TABLE IF NOT EXISTS `kgeek_kunena_ranks` (
  `rankId` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `rankTitle` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rankMin` mediumint unsigned NOT NULL DEFAULT '0',
  `rankSpecial` tinyint unsigned NOT NULL DEFAULT '0',
  `rankImage` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rankId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_ranks: ~10 rows (approximately)
DELETE FROM `kgeek_kunena_ranks`;
INSERT INTO `kgeek_kunena_ranks` (`rankId`, `rankTitle`, `rankMin`, `rankSpecial`, `rankImage`) VALUES
	(1, 'COM_KUNENA_SAMPLEDATA_RANK1', 0, 0, 'rank1.gif'),
	(2, 'COM_KUNENA_SAMPLEDATA_RANK2', 20, 0, 'rank2.gif'),
	(3, 'COM_KUNENA_SAMPLEDATA_RANK3', 40, 0, 'rank3.gif'),
	(4, 'COM_KUNENA_SAMPLEDATA_RANK4', 80, 0, 'rank4.gif'),
	(5, 'COM_KUNENA_SAMPLEDATA_RANK5', 160, 0, 'rank5.gif'),
	(6, 'COM_KUNENA_SAMPLEDATA_RANK6', 320, 0, 'rank6.gif'),
	(7, 'COM_KUNENA_SAMPLEDATA_RANK_ADMIN', 0, 1, 'rankadmin.gif'),
	(8, 'COM_KUNENA_SAMPLEDATA_RANK_MODERATOR', 0, 1, 'rankmod.gif'),
	(9, 'COM_KUNENA_SAMPLEDATA_RANK_SPAMMER', 0, 1, 'rankspammer.gif'),
	(10, 'COM_KUNENA_SAMPLEDATA_RANK_BANNED', 0, 1, 'rankbanned.gif');

-- Dumping structure for table nts_kgeek.kgeek_kunena_rate
CREATE TABLE IF NOT EXISTS `kgeek_kunena_rate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic_id` int DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `rate` mediumint unsigned NOT NULL DEFAULT '0',
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_rate: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_rate`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_sessions
CREATE TABLE IF NOT EXISTS `kgeek_kunena_sessions` (
  `userid` int NOT NULL DEFAULT '0',
  `allowed` text COLLATE utf8mb4_unicode_ci,
  `lasttime` int NOT NULL DEFAULT '0',
  `readtopics` text COLLATE utf8mb4_unicode_ci,
  `currvisit` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `currvisit` (`currvisit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_sessions: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_sessions`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_smileys
CREATE TABLE IF NOT EXISTS `kgeek_kunena_smileys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `location` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `emoticonbar` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_smileys: ~34 rows (approximately)
DELETE FROM `kgeek_kunena_smileys`;
INSERT INTO `kgeek_kunena_smileys` (`id`, `code`, `location`, `emoticonbar`) VALUES
	(1, 'B)', '9.png', 1),
	(2, '8)', '9.png', 0),
	(3, '8-)', '9.png', 0),
	(4, ':-(', '22.png', 0),
	(5, ':(', '22.png', 1),
	(6, ':sad:', '22.png', 0),
	(7, ':cry:', '19.png', 1),
	(8, ':)', '3.png', 1),
	(9, ':-)', '3.png', 0),
	(10, ':cheer:', '2.png', 1),
	(11, ';)', '24.png', 1),
	(12, ';-)', '24.png', 0),
	(13, ':wink:', '24.png', 0),
	(14, ':kiss:', '12.png', 1),
	(15, ':P', '14.png', 1),
	(16, ':p', '14.png', 0),
	(17, ':-p', '14.png', 0),
	(18, ':-P', '14.png', 0),
	(19, ':razz:', '4.png', 1),
	(20, ':angry:', '23.png', 1),
	(21, ':mad:', '23.png', 0),
	(22, ':unsure:', '18.png', 1),
	(23, ':o', '6.png', 1),
	(24, ':D', '1.png', 1),
	(25, ':joy:', '5.png', 1),
	(26, ':grimace:', '7.png', 1),
	(27, ':neutral:', '8.png', 1),
	(28, ':angel:', '10.png', 1),
	(29, ':sweat:', '11.png', 1),
	(30, ':upside:', '13.png', 1),
	(31, ':nerd:', '15.png', 1),
	(32, ':kissing:', '16.png', 1),
	(33, ':meh:', '17.png', 1),
	(34, ':rolleyes:', '20.png', 1);

-- Dumping structure for table nts_kgeek.kgeek_kunena_thankyou
CREATE TABLE IF NOT EXISTS `kgeek_kunena_thankyou` (
  `postid` int NOT NULL,
  `userid` int NOT NULL,
  `targetuserid` int NOT NULL,
  `time` datetime NOT NULL,
  UNIQUE KEY `postid` (`postid`,`userid`),
  KEY `userid` (`userid`),
  KEY `targetuserid` (`targetuserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_thankyou: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_thankyou`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_topics
CREATE TABLE IF NOT EXISTS `kgeek_kunena_topics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL DEFAULT '0',
  `subject` tinytext COLLATE utf8mb4_unicode_ci,
  `icon_id` int NOT NULL DEFAULT '0',
  `label_id` int NOT NULL DEFAULT '0',
  `locked` tinyint NOT NULL DEFAULT '0',
  `hold` tinyint NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `posts` int NOT NULL DEFAULT '0',
  `hits` int NOT NULL DEFAULT '0',
  `attachments` int NOT NULL DEFAULT '0',
  `poll_id` int NOT NULL DEFAULT '0',
  `moved_id` int NOT NULL DEFAULT '0',
  `first_post_id` int NOT NULL DEFAULT '0',
  `first_post_time` int NOT NULL DEFAULT '0',
  `first_post_userid` int NOT NULL DEFAULT '0',
  `first_post_message` text COLLATE utf8mb4_unicode_ci,
  `first_post_guest_name` tinytext COLLATE utf8mb4_unicode_ci,
  `last_post_id` int NOT NULL DEFAULT '0',
  `last_post_time` int NOT NULL DEFAULT '0',
  `last_post_userid` int NOT NULL DEFAULT '0',
  `last_post_message` text COLLATE utf8mb4_unicode_ci,
  `last_post_guest_name` tinytext COLLATE utf8mb4_unicode_ci,
  `rating` tinyint NOT NULL DEFAULT '0',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `locked` (`locked`),
  KEY `hold` (`hold`),
  KEY `posts` (`posts`),
  KEY `hits` (`hits`),
  KEY `first_post_userid` (`first_post_userid`),
  KEY `last_post_userid` (`last_post_userid`),
  KEY `first_post_time` (`first_post_time`),
  KEY `last_post_time` (`last_post_time`),
  KEY `last_post_id` (`last_post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_topics: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_topics`;
INSERT INTO `kgeek_kunena_topics` (`id`, `category_id`, `subject`, `icon_id`, `label_id`, `locked`, `hold`, `ordering`, `posts`, `hits`, `attachments`, `poll_id`, `moved_id`, `first_post_id`, `first_post_time`, `first_post_userid`, `first_post_message`, `first_post_guest_name`, `last_post_id`, `last_post_time`, `last_post_userid`, `last_post_message`, `last_post_guest_name`, `rating`, `params`) VALUES
	(1, 2, 'Welcome to Kunena!', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1795098691, 688, '[size=150][b]Welcome to Kunena![/b][/size] \n\n Thank you for choosing Kunena for your community forum needs in Joomla. \n\n Kunena, translated from Swahili meaning "to speak", is built by a team of open source professionals with the goal of providing a top quality, tightly unified forum solution for Joomla. \n\n\n [size=150][b]Additional Kunena Resources[/b][/size] \n\n [b]Kunena Documentation:[/b] [url=https://www.kunena.org/docs/en]www.kunena.org/docs/en[/url] \n\n [b]Kunena Support Forum[/b]: [url=https://www.kunena.org/forum]www.kunena.org/forum[/url] \n\n [b]Kunena Downloads:[/b] [url=https://www.kunena.org/download]www.kunena.org/download[/url] \n\n [b]Kunena Blog:[/b] [url=https://www.kunena.org/blog]www.kunena.org/blog[/url] \n\n [b]Follow Kunena on X:[/b] [url=https://www.kunena.org/twitter]www.kunena.org/twitter[/url]', 'Kunena', 1, 1795098691, 688, '[size=150][b]Welcome to Kunena![/b][/size] \n\n Thank you for choosing Kunena for your community forum needs in Joomla. \n\n Kunena, translated from Swahili meaning "to speak", is built by a team of open source professionals with the goal of providing a top quality, tightly unified forum solution for Joomla. \n\n\n [size=150][b]Additional Kunena Resources[/b][/size] \n\n [b]Kunena Documentation:[/b] [url=https://www.kunena.org/docs/en]www.kunena.org/docs/en[/url] \n\n [b]Kunena Support Forum[/b]: [url=https://www.kunena.org/forum]www.kunena.org/forum[/url] \n\n [b]Kunena Downloads:[/b] [url=https://www.kunena.org/download]www.kunena.org/download[/url] \n\n [b]Kunena Blog:[/b] [url=https://www.kunena.org/blog]www.kunena.org/blog[/url] \n\n [b]Follow Kunena on X:[/b] [url=https://www.kunena.org/twitter]www.kunena.org/twitter[/url]', 'Kunena', 1, '');

-- Dumping structure for table nts_kgeek.kgeek_kunena_users
CREATE TABLE IF NOT EXISTS `kgeek_kunena_users` (
  `userid` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `status_text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `view` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `signature` text COLLATE utf8mb4_unicode_ci,
  `moderator` int DEFAULT '0',
  `banned` datetime DEFAULT '1000-01-01 00:00:00',
  `ordering` int DEFAULT '0',
  `posts` int DEFAULT '0',
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` int DEFAULT '0',
  `karma` int DEFAULT '0',
  `group_id` int DEFAULT '1',
  `uhits` int DEFAULT '0',
  `personalText` tinytext COLLATE utf8mb4_unicode_ci,
  `gender` tinyint NOT NULL DEFAULT '0',
  `birthdate` date DEFAULT '1000-01-01',
  `location` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `websitename` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `websiteurl` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rank` tinyint NOT NULL DEFAULT '0',
  `hideEmail` tinyint(1) NOT NULL DEFAULT '1',
  `showOnline` tinyint(1) NOT NULL DEFAULT '1',
  `canSubscribe` tinyint(1) NOT NULL DEFAULT '-1',
  `userListtime` int DEFAULT '-2',
  `thankyou` int DEFAULT '0',
  `ip` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` text COLLATE utf8mb4_unicode_ci,
  `socials` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`userid`),
  KEY `group_id` (`group_id`),
  KEY `posts` (`posts`),
  KEY `uhits` (`uhits`),
  KEY `banned` (`banned`),
  KEY `moderator` (`moderator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_users: ~1 rows (approximately)
DELETE FROM `kgeek_kunena_users`;
INSERT INTO `kgeek_kunena_users` (`userid`, `status`, `status_text`, `view`, `signature`, `moderator`, `banned`, `ordering`, `posts`, `avatar`, `timestamp`, `karma`, `group_id`, `uhits`, `personalText`, `gender`, `birthdate`, `location`, `websitename`, `websiteurl`, `rank`, `hideEmail`, `showOnline`, `canSubscribe`, `userListtime`, `thankyou`, `ip`, `language`, `socials`) VALUES
	(688, 0, '', '', NULL, 0, '1000-01-01 00:00:00', 0, 1, NULL, 0, 0, 1, 0, NULL, 0, '1000-01-01', NULL, NULL, NULL, 0, 1, 1, -1, -2, 0, NULL, NULL, NULL);

-- Dumping structure for table nts_kgeek.kgeek_kunena_users_banned
CREATE TABLE IF NOT EXISTS `kgeek_kunena_users_banned` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `ip` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blocked` tinyint NOT NULL DEFAULT '0',
  `expiration` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_time` datetime NOT NULL,
  `reason_private` text COLLATE utf8mb4_unicode_ci,
  `reason_public` text COLLATE utf8mb4_unicode_ci,
  `modified_by` int DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `params` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `ip` (`ip`),
  KEY `expiration` (`expiration`),
  KEY `created_time` (`created_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_users_banned: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_users_banned`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_user_categories
CREATE TABLE IF NOT EXISTS `kgeek_kunena_user_categories` (
  `user_id` int NOT NULL,
  `category_id` int NOT NULL,
  `role` tinyint NOT NULL DEFAULT '0',
  `allreadtime` int NOT NULL DEFAULT '0',
  `subscribed` tinyint NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`user_id`,`category_id`),
  KEY `category_subscribed` (`category_id`,`subscribed`),
  KEY `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_user_categories: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_user_categories`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_user_read
CREATE TABLE IF NOT EXISTS `kgeek_kunena_user_read` (
  `user_id` int NOT NULL,
  `topic_id` int NOT NULL,
  `category_id` int NOT NULL,
  `message_id` int NOT NULL,
  `time` int NOT NULL,
  UNIQUE KEY `user_topic_id` (`user_id`,`topic_id`),
  KEY `category_user_id` (`category_id`,`user_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_user_read: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_user_read`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_user_topics
CREATE TABLE IF NOT EXISTS `kgeek_kunena_user_topics` (
  `user_id` int NOT NULL DEFAULT '0',
  `topic_id` int NOT NULL DEFAULT '0',
  `category_id` int NOT NULL,
  `posts` mediumint NOT NULL DEFAULT '0',
  `last_post_id` int NOT NULL DEFAULT '0',
  `owner` tinyint NOT NULL DEFAULT '0',
  `favorite` tinyint NOT NULL DEFAULT '0',
  `subscribed` tinyint NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `user_topic_id` (`user_id`,`topic_id`),
  KEY `topic_id` (`topic_id`),
  KEY `posts` (`posts`),
  KEY `owner` (`owner`),
  KEY `favorite` (`favorite`),
  KEY `subscribed` (`subscribed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_user_topics: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_user_topics`;

-- Dumping structure for table nts_kgeek.kgeek_kunena_version
CREATE TABLE IF NOT EXISTS `kgeek_kunena_version` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versiondate` date NOT NULL,
  `installdate` date NOT NULL,
  `build` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versionname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sampleData` tinyint(1) NOT NULL DEFAULT '1',
  `state` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_kunena_version: ~0 rows (approximately)
DELETE FROM `kgeek_kunena_version`;
INSERT INTO `kgeek_kunena_version` (`id`, `version`, `versiondate`, `installdate`, `build`, `versionname`, `sampleData`, `state`) VALUES
	(1, '7.1.1', '2026-11-10', '2026-11-19', '7.1.1', 'Cupramontana', 1, '');

-- Dumping structure for table nts_kgeek.kgeek_languages
CREATE TABLE IF NOT EXISTS `kgeek_languages` (
  `lang_id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_languages: ~0 rows (approximately)
DELETE FROM `kgeek_languages`;
INSERT INTO `kgeek_languages` (`lang_id`, `asset_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
	(1, 0, 'en-GB', 'English (en-GB)', 'English (United Kingdom)', 'en', 'en_gb', '', '', '', '', 1, 1, 1);

-- Dumping structure for table nts_kgeek.kgeek_mail_templates
CREATE TABLE IF NOT EXISTS `kgeek_mail_templates` (
  `template_id` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `htmlbody` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`template_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_mail_templates: ~33 rows (approximately)
DELETE FROM `kgeek_mail_templates`;
INSERT INTO `kgeek_mail_templates` (`template_id`, `extension`, `language`, `subject`, `body`, `htmlbody`, `attachments`, `params`) VALUES
	('com_actionlogs.notification', 'com_actionlogs', '', 'COM_ACTIONLOGS_EMAIL_SUBJECT', 'COM_ACTIONLOGS_EMAIL_BODY', 'COM_ACTIONLOGS_EMAIL_HTMLBODY', '', '{"tags":["messages","message","date","extension","username","ip_address"]}'),
	('com_config.test_mail', 'com_config', '', 'COM_CONFIG_SENDMAIL_SUBJECT', 'COM_CONFIG_SENDMAIL_BODY', '', '', '{"tags":["sitename","method"]}'),
	('com_contact.mail', 'com_contact', '', 'COM_CONTACT_ENQUIRY_SUBJECT', 'COM_CONTACT_ENQUIRY_TEXT', '', '', '{"tags":["sitename","name","email","subject","body","url","customfields"]}'),
	('com_contact.mail.copy', 'com_contact', '', 'COM_CONTACT_COPYSUBJECT_OF', 'COM_CONTACT_COPYTEXT_OF', '', '', '{"tags":["sitename","name","email","subject","body","url","customfields","contactname"]}'),
	('com_joomlaupdate.update.failed', 'com_joomlaupdate', '', 'COM_JOOMLAUPDATE_UPDATE_FAILED_MAIL_SUBJECT', 'COM_JOOMLAUPDATE_UPDATE_FAILED_MAIL_BODY', '', '', '{"tags":["newversion","oldversion","sitename","url"]}'),
	('com_joomlaupdate.update.success', 'com_joomlaupdate', '', 'COM_JOOMLAUPDATE_UPDATE_SUCCESS_MAIL_SUBJECT', 'COM_JOOMLAUPDATE_UPDATE_SUCCESS_MAIL_BODY', '', '', '{"tags":["newversion","oldversion","sitename","url"]}'),
	('com_messages.new_message', 'com_messages', '', 'COM_MESSAGES_NEW_MESSAGE', 'COM_MESSAGES_NEW_MESSAGE_BODY', '', '', '{"tags":["subject","message","fromname","sitename","siteurl","fromemail","toname","toemail"]}'),
	('com_privacy.notification.admin.export', 'com_privacy', '', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_SUBJECT_EXPORT_REQUEST', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_BODY_EXPORT_REQUEST', '', '', '{"tags":["sitename","url","tokenurl","formurl","token"]}'),
	('com_privacy.notification.admin.remove', 'com_privacy', '', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_SUBJECT_REMOVE_REQUEST', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_BODY_REMOVE_REQUEST', '', '', '{"tags":["sitename","url","tokenurl","formurl","token"]}'),
	('com_privacy.notification.export', 'com_privacy', '', 'COM_PRIVACY_EMAIL_REQUEST_SUBJECT_EXPORT_REQUEST', 'COM_PRIVACY_EMAIL_REQUEST_BODY_EXPORT_REQUEST', '', '', '{"tags":["sitename","url","tokenurl","formurl","token"]}'),
	('com_privacy.notification.remove', 'com_privacy', '', 'COM_PRIVACY_EMAIL_REQUEST_SUBJECT_REMOVE_REQUEST', 'COM_PRIVACY_EMAIL_REQUEST_BODY_REMOVE_REQUEST', '', '', '{"tags":["sitename","url","tokenurl","formurl","token"]}'),
	('com_privacy.userdataexport', 'com_privacy', '', 'COM_PRIVACY_EMAIL_DATA_EXPORT_COMPLETED_SUBJECT', 'COM_PRIVACY_EMAIL_DATA_EXPORT_COMPLETED_BODY', '', '', '{"tags":["sitename","url"]}'),
	('com_users.massmail.mail', 'com_users', '', 'COM_USERS_MASSMAIL_MAIL_SUBJECT', 'COM_USERS_MASSMAIL_MAIL_BODY', '', '', '{"tags":["subject","body","subjectprefix","bodysuffix"]}'),
	('com_users.password_reset', 'com_users', '', 'COM_USERS_EMAIL_PASSWORD_RESET_SUBJECT', 'COM_USERS_EMAIL_PASSWORD_RESET_BODY', '', '', '{"tags":["name","email","sitename","link_text","link_html","token"]}'),
	('com_users.registration.admin.new_notification', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_NOTIFICATION_TO_ADMIN_BODY', '', '', '{"tags":["name","sitename","siteurl","username"]}'),
	('com_users.registration.admin.verification_request', 'com_users', '', 'COM_USERS_EMAIL_ACTIVATE_WITH_ADMIN_ACTIVATION_SUBJECT', 'COM_USERS_EMAIL_ACTIVATE_WITH_ADMIN_ACTIVATION_BODY', '', '', '{"tags":["name","sitename","email","username","activate"]}'),
	('com_users.registration.user.admin_activated', 'com_users', '', 'COM_USERS_EMAIL_ACTIVATED_BY_ADMIN_ACTIVATION_SUBJECT', 'COM_USERS_EMAIL_ACTIVATED_BY_ADMIN_ACTIVATION_BODY', '', '', '{"tags":["name","sitename","siteurl","username"]}'),
	('com_users.registration.user.admin_activation', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY_NOPW', '', '', '{"tags":["name","sitename","activate","siteurl","username"]}'),
	('com_users.registration.user.admin_activation_w_pw', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY', '', '', '{"tags":["name","sitename","activate","siteurl","username","password_clear"]}'),
	('com_users.registration.user.registration_mail', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_BODY_NOPW', '', '', '{"tags":["name","sitename","siteurl","username"]}'),
	('com_users.registration.user.registration_mail_w_pw', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_BODY', '', '', '{"tags":["name","sitename","siteurl","username","password_clear"]}'),
	('com_users.registration.user.self_activation', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY_NOPW', '', '', '{"tags":["name","sitename","activate","siteurl","username"]}'),
	('com_users.registration.user.self_activation_w_pw', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY', '', '', '{"tags":["name","sitename","activate","siteurl","username","password_clear"]}'),
	('com_users.reminder', 'com_users', '', 'COM_USERS_EMAIL_USERNAME_REMINDER_SUBJECT', 'COM_USERS_EMAIL_USERNAME_REMINDER_BODY', '', '', '{"tags":["name","username","sitename","email","link_text","link_html"]}'),
	('plg_content_joomla.newarticle', 'plg_content_joomla', '', 'PLG_CONTENT_JOOMLA_NEW_ARTICLE_SUBJECT', 'PLG_CONTENT_JOOMLA_NEW_ARTICLE_BODY', '', '', '{"tags":["sitename","name","email","title","url"]}'),
	('plg_multifactorauth_email.mail', 'plg_multifactorauth_email', '', 'PLG_MULTIFACTORAUTH_EMAIL_EMAIL_SUBJECT', 'PLG_MULTIFACTORAUTH_EMAIL_EMAIL_BODY', '', '', '{"tags":["code","sitename","siteurl","username","email","fullname"]}'),
	('plg_system_tasknotification.failure_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_FAILURE_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_FAILURE_MAIL_BODY', '', '', '{"tags": ["task_id", "task_title", "exit_code", "exec_data_time", "task_output"]}'),
	('plg_system_tasknotification.fatal_recovery_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_FATAL_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_FATAL_MAIL_BODY', '', '', '{"tags": ["task_id", "task_title"]}'),
	('plg_system_tasknotification.orphan_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_ORPHAN_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_ORPHAN_MAIL_BODY', '', '', '{"tags": ["task_id", "task_title"]}'),
	('plg_system_tasknotification.success_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_SUCCESS_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_SUCCESS_MAIL_BODY', '', '', '{"tags":["task_id", "task_title", "exec_data_time", "task_output"]}'),
	('plg_task_privacyconsent.request.reminder', 'plg_task_privacyconsent', '', 'PLG_TASK_PRIVACYCONSENT_EMAIL_REMIND_SUBJECT', 'PLG_TASK_PRIVACYCONSENT_EMAIL_REMIND_BODY', '', '', '{"tags":["sitename","url","tokenurl","formurl","token"]}'),
	('plg_task_updatenotification.mail', 'plg_task_updatenotification', '', 'PLG_TASK_UPDATENOTIFICATION_EMAIL_SUBJECT', 'PLG_TASK_UPDATENOTIFICATION_EMAIL_BODY', '', '', '{"tags":["newversion","curversion","sitename","url","link","releasenews"]}'),
	('plg_user_joomla.mail', 'plg_user_joomla', '', 'PLG_USER_JOOMLA_NEW_USER_EMAIL_SUBJECT', 'PLG_USER_JOOMLA_NEW_USER_EMAIL_BODY', '', '', '{"tags":["name","sitename","url","username","password","email"]}');

-- Dumping structure for table nts_kgeek.kgeek_menu
CREATE TABLE IF NOT EXISTS `kgeek_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int unsigned DEFAULT NULL COMMENT 'FK to #__users.id',
  `checked_out_time` datetime DEFAULT NULL COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint NOT NULL DEFAULT '0',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_menu: ~48 rows (approximately)
DELETE FROM `kgeek_menu`;
INSERT INTO `kgeek_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`, `publish_up`, `publish_down`) VALUES
	(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, NULL, NULL, 0, 0, '', 0, '', 0, 95, 0, '*', 0, NULL, NULL),
	(2, 'main', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 1, 1, 1, 3, NULL, NULL, 0, 0, 'class:bookmark', 0, '', 1, 10, 0, '*', 1, NULL, NULL),
	(3, 'main', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners&view=banners', 'component', 1, 2, 2, 3, NULL, NULL, 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1, NULL, NULL),
	(4, 'main', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&view=categories&extension=com_banners', 'component', 1, 2, 2, 5, NULL, NULL, 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1, NULL, NULL),
	(5, 'main', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 1, 2, 2, 3, NULL, NULL, 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1, NULL, NULL),
	(6, 'main', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 1, 2, 2, 3, NULL, NULL, 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1, NULL, NULL),
	(7, 'main', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 1, 1, 1, 7, NULL, NULL, 0, 0, 'class:address-book', 0, '', 11, 20, 0, '*', 1, NULL, NULL),
	(8, 'main', 'com_contact_contacts', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact&view=contacts', 'component', 1, 7, 2, 7, NULL, NULL, 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1, NULL, NULL),
	(9, 'main', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&view=categories&extension=com_contact', 'component', 1, 7, 2, 5, NULL, NULL, 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1, NULL, NULL),
	(10, 'main', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 1, 1, 16, NULL, NULL, 0, 0, 'class:rss', 0, '', 23, 28, 0, '*', 1, NULL, NULL),
	(11, 'main', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds&view=newsfeeds', 'component', 1, 10, 2, 16, NULL, NULL, 0, 0, 'class:newsfeeds', 0, '', 24, 25, 0, '*', 1, NULL, NULL),
	(12, 'main', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&view=categories&extension=com_newsfeeds', 'component', 1, 10, 2, 5, NULL, NULL, 0, 0, 'class:newsfeeds-cat', 0, '', 26, 27, 0, '*', 1, NULL, NULL),
	(13, 'main', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 1, 1, 1, 23, NULL, NULL, 0, 0, 'class:search-plus', 0, '', 29, 38, 0, '*', 1, NULL, NULL),
	(14, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags&view=tags', 'component', 1, 1, 1, 25, NULL, NULL, 0, 1, 'class:tags', 0, '', 39, 40, 0, '', 1, NULL, NULL),
	(15, 'main', 'com_associations', 'Multilingual Associations', '', 'Multilingual Associations', 'index.php?option=com_associations&view=associations', 'component', 1, 1, 1, 30, NULL, NULL, 0, 0, 'class:language', 0, '', 21, 22, 0, '*', 1, NULL, NULL),
	(16, 'main', 'mod_menu_fields', 'Contact Custom Fields', '', 'contact/Custom Fields', 'index.php?option=com_fields&context=com_contact.contact', 'component', 1, 7, 2, 29, NULL, NULL, 0, 0, 'class:messages-add', 0, '', 16, 17, 0, '*', 1, NULL, NULL),
	(17, 'main', 'mod_menu_fields_group', 'Contact Custom Fields Group', '', 'contact/Custom Fields Group', 'index.php?option=com_fields&view=groups&context=com_contact.contact', 'component', 1, 7, 2, 29, NULL, NULL, 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1, NULL, NULL),
	(18, 'main', 'com_finder_index', 'Smart-Search-Index', '', 'Smart Search/Index', 'index.php?option=com_finder&view=index', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder', 0, '', 30, 31, 0, '*', 1, NULL, NULL),
	(19, 'main', 'com_finder_maps', 'Smart-Search-Maps', '', 'Smart Search/Maps', 'index.php?option=com_finder&view=maps', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder-maps', 0, '', 32, 33, 0, '*', 1, NULL, NULL),
	(20, 'main', 'com_finder_filters', 'Smart-Search-Filters', '', 'Smart Search/Filters', 'index.php?option=com_finder&view=filters', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder-filters', 0, '', 34, 35, 0, '*', 1, NULL, NULL),
	(21, 'main', 'com_finder_searches', 'Smart-Search-Searches', '', 'Smart Search/Searches', 'index.php?option=com_finder&view=searches', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder-searches', 0, '', 36, 37, 0, '*', 1, NULL, NULL),
	(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', 0, 1, 1, 19, NULL, NULL, 0, 1, '', 0, '{"featured_categories":[""],"layout_type":"blog","blog_class_leading":"","blog_class":"","num_leading_articles":"1","num_intro_articles":"3","num_links":"0","link_intro_image":"","orderby_pri":"","orderby_sec":"front","order_date":"","show_pagination":"2","show_pagination_results":"1","show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"1","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"1","page_heading":"","pageclass_sfx":"","menu-meta_description":"","robots":""}', 41, 42, 0, '*', 0, NULL, NULL),
	(102, 'main', 'COM_KUNENA', 'com-kunena', '', 'com-kunena', 'index.php?option=com_kunena&view=cpanel', 'component', 1, 1, 1, 254, NULL, NULL, 0, 1, 'components/com_kunena/media/icons/favicons/kunena-logo-white.png', 0, '{}', 43, 72, 0, '', 1, NULL, NULL),
	(103, 'main', 'COM_KUNENA_DASHBOARD', 'com-kunena-dashboard', '', 'com-kunena/com-kunena-dashboard', 'index.php?option=com_kunena&view=cpanel', 'component', 1, 102, 2, 254, NULL, NULL, 0, 1, 'class:component', 0, '{}', 44, 45, 0, '', 1, NULL, NULL),
	(104, 'main', 'COM_KUNENA_CATEGORY_MANAGER', 'com-kunena-category-manager', '', 'com-kunena/com-kunena-category-manager', 'index.php?option=com_kunena&view=categories', 'component', 1, 102, 2, 254, NULL, NULL, 0, 1, 'class:component', 0, '{}', 46, 47, 0, '', 1, NULL, NULL),
	(105, 'main', 'COM_KUNENA_USER_MANAGER', 'com-kunena-user-manager', '', 'com-kunena/com-kunena-user-manager', 'index.php?option=com_kunena&view=users', 'component', 1, 102, 2, 254, NULL, NULL, 0, 1, 'class:component', 0, '{}', 48, 49, 0, '', 1, NULL, NULL),
	(106, 'main', 'COM_KUNENA_FILE_MANAGER', 'com-kunena-file-manager', '', 'com-kunena/com-kunena-file-manager', 'index.php?option=com_kunena&view=attachments', 'component', 1, 102, 2, 254, NULL, NULL, 0, 1, 'class:component', 0, '{}', 50, 51, 0, '', 1, NULL, NULL),
	(107, 'main', 'COM_KUNENA_EMOTICON_MANAGER', 'com-kunena-emoticon-manager', '', 'com-kunena/com-kunena-emoticon-manager', 'index.php?option=com_kunena&view=smilies', 'component', 1, 102, 2, 254, NULL, NULL, 0, 1, 'class:component', 0, '{}', 52, 53, 0, '', 1, NULL, NULL),
	(108, 'main', 'COM_KUNENA_RANK_MANAGER', 'com-kunena-rank-manager', '', 'com-kunena/com-kunena-rank-manager', 'index.php?option=com_kunena&view=ranks', 'component', 1, 102, 2, 254, NULL, NULL, 0, 1, 'class:component', 0, '{}', 54, 55, 0, '', 1, NULL, NULL),
	(109, 'main', 'COM_KUNENA_TEMPLATE_MANAGER', 'com-kunena-template-manager', '', 'com-kunena/com-kunena-template-manager', 'index.php?option=com_kunena&view=templates', 'component', 1, 102, 2, 254, NULL, NULL, 0, 1, 'class:component', 0, '{}', 56, 57, 0, '', 1, NULL, NULL),
	(110, 'main', 'COM_KUNENA_CONFIGURATION', 'com-kunena-configuration', '', 'com-kunena/com-kunena-configuration', 'index.php?option=com_config&view=component&component=com_kunena', 'component', 1, 102, 2, 254, NULL, NULL, 0, 1, 'class:component', 0, '{}', 58, 59, 0, '', 1, NULL, NULL),
	(111, 'main', 'COM_KUNENA_MENU_STATISTICS', 'com-kunena-menu-statistics', '', 'com-kunena/com-kunena-menu-statistics', 'index.php?option=com_kunena&view=stats', 'component', 1, 102, 2, 254, NULL, NULL, 0, 1, 'class:component', 0, '{}', 60, 61, 0, '', 1, NULL, NULL),
	(112, 'main', 'COM_KUNENA_PLUGIN_MANAGER', 'com-kunena-plugin-manager', '', 'com-kunena/com-kunena-plugin-manager', 'index.php?option=com_kunena&view=plugins', 'component', 1, 102, 2, 254, NULL, NULL, 0, 1, 'class:component', 0, '{}', 62, 63, 0, '', 1, NULL, NULL),
	(113, 'main', 'COM_KUNENA_LOG_MANAGER', 'com-kunena-log-manager', '', 'com-kunena/com-kunena-log-manager', 'index.php?option=com_kunena&view=logs', 'component', 1, 102, 2, 254, NULL, NULL, 0, 1, 'class:component', 0, '{}', 64, 65, 0, '', 1, NULL, NULL),
	(114, 'main', 'COM_KUNENA_ADMIN_MAILSQUEUE_MANAGER', 'com-kunena-admin-mailsqueue-manager', '', 'com-kunena/com-kunena-admin-mailsqueue-manager', 'index.php?option=com_kunena&view=mailsqueues', 'component', 1, 102, 2, 254, NULL, NULL, 0, 1, 'class:component', 0, '{}', 66, 67, 0, '', 1, NULL, NULL),
	(115, 'main', 'COM_KUNENA_FORUM_TOOLS', 'com-kunena-forum-tools', '', 'com-kunena/com-kunena-forum-tools', 'index.php?option=com_kunena&view=tools', 'component', 1, 102, 2, 254, NULL, NULL, 0, 1, 'class:component', 0, '{}', 68, 69, 0, '', 1, NULL, NULL),
	(116, 'main', 'COM_KUNENA_TRASH_MANAGER', 'com-kunena-trash-manager', '', 'com-kunena/com-kunena-trash-manager', 'index.php?option=com_kunena&view=trashs', 'component', 1, 102, 2, 254, NULL, NULL, 0, 1, 'class:component', 0, '{}', 70, 71, 0, '', 1, NULL, NULL),
	(117, 'kunenamenu', 'Forum', 'forum', '', 'forum', 'index.php?option=com_kunena&view=home&defaultmenu=119', 'component', 1, 1, 1, 254, NULL, NULL, 0, 1, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","robots":"","secure":0,"catids":0}', 73, 92, 0, '*', 0, NULL, NULL),
	(118, 'kunenamenu', 'Index', 'index', '', 'forum/index', 'index.php?option=com_kunena&view=category&layout=list', 'component', 1, 117, 2, 254, NULL, NULL, 0, 1, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","robots":"","secure":0}', 74, 75, 0, 'en-GB', 0, NULL, NULL),
	(119, 'kunenamenu', 'Recent Topics', 'recent', '', 'forum/recent', 'index.php?option=com_kunena&view=topics&mode=replies', 'component', 1, 117, 2, 254, NULL, NULL, 0, 1, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","robots":"","secure":0,"topics_catselection":"","topics_categories":"","topics_time":""}', 76, 77, 0, 'en-GB', 0, NULL, NULL),
	(120, 'kunenamenu', 'Unread', 'unread', '', 'forum/unread', 'index.php?option=com_kunena&view=topics&layout=unread', 'component', 1, 117, 2, 254, NULL, NULL, 0, 2, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","robots":"","secure":0}', 78, 79, 0, 'en-GB', 0, NULL, NULL),
	(121, 'kunenamenu', 'New Topic', 'newtopic', '', 'forum/newtopic', 'index.php?option=com_kunena&view=topic&layout=create', 'component', 1, 117, 2, 254, NULL, NULL, 0, 2, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","robots":"","secure":0}', 80, 81, 0, 'en-GB', 0, NULL, NULL),
	(122, 'kunenamenu', 'No Replies', 'noreplies', '', 'forum/noreplies', 'index.php?option=com_kunena&view=topics&mode=noreplies', 'component', 1, 117, 2, 254, NULL, NULL, 0, 2, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","robots":"","secure":0,"topics_catselection":"","topics_categories":"","topics_time":""}', 82, 83, 0, 'en-GB', 0, NULL, NULL),
	(123, 'kunenamenu', 'My Topics', 'mylatest', '', 'forum/mylatest', 'index.php?option=com_kunena&view=topics&layout=user&mode=default', 'component', 1, 117, 2, 254, NULL, NULL, 0, 2, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","robots":"","secure":0,"topics_catselection":"2","topics_categories":"0","topics_time":""}', 84, 85, 0, 'en-GB', 0, NULL, NULL),
	(124, 'kunenamenu', 'Profile', 'profile', '', 'forum/profile', 'index.php?option=com_kunena&view=user', 'component', 1, 117, 2, 254, NULL, NULL, 0, 2, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","robots":"","secure":0,"integration":1}', 86, 87, 0, 'en-GB', 0, NULL, NULL),
	(125, 'kunenamenu', 'Help', 'help', '', 'forum/help', 'index.php?option=com_kunena&view=misc', 'component', 1, 117, 2, 254, NULL, NULL, 0, 3, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","robots":"","secure":0,"body":"This help page is a menu item inside [b]Kunena Menu[\\/b], which allows easy navigation in your forum. \\n\\n You can use Joomla Menu Manager to edit items in this menu. Please go to [b]Administration[\\/b] >> [b]Menus[\\/b] >> [b]Kunena Menu[\\/b] >> [b]Help[\\/b] to edit or remove this menu item. \\n\\n In this menu item you can use Plain Text, BBCode or HTML. If you want to bind article into this page, you may use article BBCode (with article id): [code][article=full]123[\\/article][\\/code] \\n\\n If you want to create your own menu for Kunena, please start by creating [b]Home Page[\\/b] first. In that page you can select default menu item, which is shown when you enter to Kunena.","body_format":"bbcode"}', 88, 89, 0, 'en-GB', 0, NULL, NULL),
	(126, 'kunenamenu', 'Search', 'search', '', 'forum/search', 'index.php?option=com_kunena&view=search', 'component', 1, 117, 2, 254, NULL, NULL, 0, 1, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","robots":"","secure":0}', 90, 91, 0, 'en-GB', 0, NULL, NULL),
	(127, 'mainmenu', 'Forum', 'kunena-2026-11-19', '', 'kunena-2026-11-19', 'index.php?option=com_kunena&view=home&defaultmenu=118', 'component', 1, 1, 1, 254, NULL, NULL, 0, 1, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_icon_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","robots":""}', 93, 94, 1, '*', 0, NULL, NULL);

-- Dumping structure for table nts_kgeek.kgeek_menu_types
CREATE TABLE IF NOT EXISTS `kgeek_menu_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` int NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_menu_types: ~0 rows (approximately)
DELETE FROM `kgeek_menu_types`;
INSERT INTO `kgeek_menu_types` (`id`, `asset_id`, `menutype`, `title`, `description`, `client_id`, `ordering`) VALUES
	(1, 0, 'mainmenu', 'Main Menu', 'The main menu for the site', 0, 1),
	(2, 106, 'kunenamenu', 'Kunena Menu', 'This is the default Kunena menu. It is used as the top navigation for Kunena. It can be publish in any module position. Simply unpublish items that are not required.', 0, 0);

-- Dumping structure for table nts_kgeek.kgeek_messages
CREATE TABLE IF NOT EXISTS `kgeek_messages` (
  `message_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int unsigned NOT NULL DEFAULT '0',
  `user_id_to` int unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `priority` tinyint unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_messages: ~0 rows (approximately)
DELETE FROM `kgeek_messages`;

-- Dumping structure for table nts_kgeek.kgeek_messages_cfg
CREATE TABLE IF NOT EXISTS `kgeek_messages_cfg` (
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_messages_cfg: ~0 rows (approximately)
DELETE FROM `kgeek_messages_cfg`;

-- Dumping structure for table nts_kgeek.kgeek_modules
CREATE TABLE IF NOT EXISTS `kgeek_modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci,
  `ordering` int NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint unsigned NOT NULL DEFAULT '1',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_modules: ~36 rows (approximately)
DELETE FROM `kgeek_modules`;
INSERT INTO `kgeek_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
	(1, 39, 'Main Menu', '', '', 1, 'sidebar-right', NULL, NULL, NULL, NULL, 0, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"0","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
	(2, 40, 'Login', '', '', 1, 'login', NULL, NULL, NULL, NULL, 1, 'mod_login', 1, 1, '', 1, '*'),
	(3, 41, 'Popular Articles', '', '', 6, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0", "bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0", "bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(8, 43, 'Toolbar', '', '', 1, 'toolbar', NULL, NULL, NULL, NULL, 1, 'mod_toolbar', 3, 1, '', 1, '*'),
	(9, 44, 'Notifications', '', '', 3, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 3, 1, '{"context":"update_quickicon","header_icon":"icon-sync","show_jupdate":"1","show_eupdate":"1","show_oupdate":"1","show_privacy":"1","layout":"_:default","moduleclass_sfx":"","cache":1,"cache_time":900,"style":"0","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":""}', 1, '*'),
	(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0", "bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(12, 46, 'Admin Menu', '', '', 1, 'menu', NULL, NULL, NULL, NULL, 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
	(15, 49, 'Title', '', '', 1, 'title', NULL, NULL, NULL, NULL, 1, 'mod_title', 3, 1, '', 1, '*'),
	(16, 50, 'Login Form', '', '', 7, 'sidebar-right', NULL, NULL, NULL, NULL, 0, 'mod_login', 1, 1, '{"greeting":"1","name":"0"}', 0, '*'),
	(17, 51, 'Breadcrumbs', '', '', 1, 'breadcrumbs', NULL, NULL, NULL, NULL, 0, 'mod_breadcrumbs', 1, 1, '{"moduleclass_sfx":"","showHome":"1","homeText":"","showComponent":"1","separator":"","cache":"0","cache_time":"0","cachemode":"itemid"}', 0, '*'),
	(79, 52, 'Multilanguage status', '', '', 2, 'status', NULL, NULL, NULL, NULL, 1, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
	(86, 53, 'Joomla Version', '', '', 1, 'status', NULL, NULL, NULL, NULL, 1, 'mod_version', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
	(87, 55, 'Sample Data', '', '', 1, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_sampledata', 6, 1, '{"bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(88, 67, 'Latest Actions', '', '', 3, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_latestactions', 6, 1, '{"bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(89, 68, 'Privacy Dashboard', '', '', 5, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_privacy_dashboard', 6, 1, '{"bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(90, 89, 'Login Support', '', '', 1, 'sidebar', NULL, NULL, NULL, NULL, 1, 'mod_loginsupport', 1, 1, '{"forum_url":"https://forum.joomla.org/","documentation_url":"https://docs.joomla.org/","news_url":"https://www.joomla.org/announcements.html","automatic_title":1,"prepare_content":1,"layout":"_:default","moduleclass_sfx":"","cache":1,"cache_time":900,"module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 1, '*'),
	(91, 72, 'System Dashboard', '', '', 1, 'cpanel-system', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{"menutype":"*","preset":"system","layout":"_:default","moduleclass_sfx":"","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":"","style":"System-none"}', 1, '*'),
	(92, 73, 'Content Dashboard', '', '', 1, 'cpanel-content', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{"menutype":"*","preset":"content","layout":"_:default","moduleclass_sfx":"","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":"","style":"System-none"}', 1, '*'),
	(93, 74, 'Menus Dashboard', '', '', 1, 'cpanel-menus', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{"menutype":"*","preset":"menus","layout":"_:default","moduleclass_sfx":"","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":"","style":"System-none"}', 1, '*'),
	(94, 75, 'Components Dashboard', '', '', 1, 'cpanel-components', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{"menutype":"*","preset":"components","layout":"_:default","moduleclass_sfx":"","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":"","style":"System-none"}', 1, '*'),
	(95, 76, 'Users Dashboard', '', '', 1, 'cpanel-users', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{"menutype":"*","preset":"users","layout":"_:default","moduleclass_sfx":"","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":"","style":"System-none"}', 1, '*'),
	(96, 86, 'Popular Articles', '', '', 3, 'cpanel-content', NULL, NULL, NULL, NULL, 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0", "bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(97, 87, 'Recently Added Articles', '', '', 4, 'cpanel-content', NULL, NULL, NULL, NULL, 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0", "bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(98, 88, 'Logged-in Users', '', '', 2, 'cpanel-users', NULL, NULL, NULL, NULL, 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0", "bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(99, 77, 'Frontend Link', '', '', 5, 'status', NULL, NULL, NULL, NULL, 1, 'mod_frontend', 1, 1, '', 1, '*'),
	(100, 78, 'Messages', '', '', 4, 'status', NULL, NULL, NULL, NULL, 1, 'mod_messages', 3, 1, '', 1, '*'),
	(101, 79, 'Post Install Messages', '', '', 3, 'status', NULL, NULL, NULL, NULL, 1, 'mod_post_installation_messages', 3, 1, '', 1, '*'),
	(102, 80, 'User Status', '', '', 6, 'status', NULL, NULL, NULL, NULL, 1, 'mod_user', 3, 1, '', 1, '*'),
	(103, 70, 'Site', '', '', 1, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 1, 1, '{"context":"site_quickicon","header_icon":"icon-desktop","show_users":"1","show_articles":"1","show_categories":"1","show_media":"1","show_menuItems":"1","show_modules":"1","show_plugins":"1","show_templates":"1","layout":"_:default","moduleclass_sfx":"","cache":1,"cache_time":900,"style":"0","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":""}', 1, '*'),
	(104, 71, 'System', '', '', 2, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 1, 1, '{"context":"system_quickicon","header_icon":"icon-wrench","show_global":"1","show_checkin":"1","show_cache":"1","layout":"_:default","moduleclass_sfx":"","cache":1,"cache_time":900,"style":"0","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":""}', 1, '*'),
	(105, 82, '3rd Party', '', '', 4, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 1, 1, '{"context":"mod_quickicon","header_icon":"icon-boxes","load_plugins":"1","layout":"_:default","moduleclass_sfx":"","cache":1,"cache_time":900,"style":"0","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":""}', 1, '*'),
	(106, 83, 'Help Dashboard', '', '', 1, 'cpanel-help', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{"menutype":"*","preset":"help","layout":"_:default","moduleclass_sfx":"","style":"System-none","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":""}', 1, '*'),
	(107, 84, 'Privacy Requests', '', '', 1, 'cpanel-privacy', NULL, NULL, NULL, NULL, 1, 'mod_privacy_dashboard', 1, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":1,"cache_time":900,"cachemode":"static","style":"0","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":""}', 1, '*'),
	(108, 85, 'Privacy Status', '', '', 1, 'cpanel-privacy', NULL, NULL, NULL, NULL, 1, 'mod_privacy_status', 1, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":1,"cache_time":900,"cachemode":"static","style":"0","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":""}', 1, '*'),
	(109, 96, 'Guided Tours', '', '', 1, 'status', NULL, NULL, NULL, NULL, 1, 'mod_guidedtours', 1, 1, '', 1, '*');

-- Dumping structure for table nts_kgeek.kgeek_modules_menu
CREATE TABLE IF NOT EXISTS `kgeek_modules_menu` (
  `moduleid` int NOT NULL DEFAULT '0',
  `menuid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_modules_menu: ~39 rows (approximately)
DELETE FROM `kgeek_modules_menu`;
INSERT INTO `kgeek_modules_menu` (`moduleid`, `menuid`) VALUES
	(1, 0),
	(2, 0),
	(3, 0),
	(4, 0),
	(6, 0),
	(7, 0),
	(8, 0),
	(9, 0),
	(10, 0),
	(12, 0),
	(14, 0),
	(15, 0),
	(16, 0),
	(17, 0),
	(79, 0),
	(86, 0),
	(87, 0),
	(88, 0),
	(89, 0),
	(90, 0),
	(91, 0),
	(92, 0),
	(93, 0),
	(94, 0),
	(95, 0),
	(96, 0),
	(97, 0),
	(98, 0),
	(99, 0),
	(100, 0),
	(101, 0),
	(102, 0),
	(103, 0),
	(104, 0),
	(105, 0),
	(106, 0),
	(107, 0),
	(108, 0),
	(109, 0);

-- Dumping structure for table nts_kgeek.kgeek_newsfeeds
CREATE TABLE IF NOT EXISTS `kgeek_newsfeeds` (
  `catid` int NOT NULL DEFAULT '0',
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint NOT NULL DEFAULT '0',
  `numarticles` int unsigned NOT NULL DEFAULT '1',
  `cache_time` int unsigned NOT NULL DEFAULT '3600',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `rtl` tinyint NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_newsfeeds: ~0 rows (approximately)
DELETE FROM `kgeek_newsfeeds`;

-- Dumping structure for table nts_kgeek.kgeek_overrider
CREATE TABLE IF NOT EXISTS `kgeek_overrider` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_overrider: ~0 rows (approximately)
DELETE FROM `kgeek_overrider`;

-- Dumping structure for table nts_kgeek.kgeek_postinstall_messages
CREATE TABLE IF NOT EXISTS `kgeek_postinstall_messages` (
  `postinstall_message_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint NOT NULL DEFAULT '1',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_postinstall_messages: ~5 rows (approximately)
DELETE FROM `kgeek_postinstall_messages`;
INSERT INTO `kgeek_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
	(1, 247, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 1),
	(2, 247, 'COM_CPANEL_MSG_STATS_COLLECTION_TITLE', 'COM_CPANEL_MSG_STATS_COLLECTION_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/statscollection.php', 'admin_postinstall_statscollection_condition', '3.5.0', 1),
	(3, 247, 'PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_TITLE', 'PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_BODY', 'PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_ACTION', 'plg_system_httpheaders', 1, 'action', 'site://plugins/system/httpheaders/postinstall/introduction.php', 'httpheaders_postinstall_action', 'site://plugins/system/httpheaders/postinstall/introduction.php', 'httpheaders_postinstall_condition', '4.0.0', 1),
	(4, 247, 'COM_USERS_POSTINSTALL_MULTIFACTORAUTH_TITLE', 'COM_USERS_POSTINSTALL_MULTIFACTORAUTH_BODY', 'COM_USERS_POSTINSTALL_MULTIFACTORAUTH_ACTION', 'com_users', 1, 'action', 'admin://components/com_users/postinstall/multifactorauth.php', 'com_users_postinstall_mfa_action', 'admin://components/com_users/postinstall/multifactorauth.php', 'com_users_postinstall_mfa_condition', '4.2.0', 1),
	(5, 247, 'COM_JOOMLAUPDATE_POSTINSTALL_MSG_AUTOMATED_UPDATES_TITLE', 'COM_JOOMLAUPDATE_POSTINSTALL_MSG_AUTOMATED_UPDATES_DESCRIPTION', 'COM_JOOMLAUPDATE_POSTINSTALL_MSG_AUTOMATED_UPDATES_ACTION', 'com_joomlaupdate', 1, 'action', 'admin://components/com_joomlaupdate/postinstall/autoupdate.php', 'com_joomlaupdate_postinstall_autoupdate_action', 'admin://components/com_joomlaupdate/postinstall/autoupdate.php', 'com_joomlaupdate_postinstall_autoupdate_condition', '5.4.0', 1);

-- Dumping structure for table nts_kgeek.kgeek_privacy_consents
CREATE TABLE IF NOT EXISTS `kgeek_privacy_consents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remind` tinyint NOT NULL DEFAULT '0',
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_privacy_consents: ~0 rows (approximately)
DELETE FROM `kgeek_privacy_consents`;

-- Dumping structure for table nts_kgeek.kgeek_privacy_requests
CREATE TABLE IF NOT EXISTS `kgeek_privacy_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `requested_at` datetime NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `request_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token_created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_privacy_requests: ~0 rows (approximately)
DELETE FROM `kgeek_privacy_requests`;

-- Dumping structure for table nts_kgeek.kgeek_redirect_links
CREATE TABLE IF NOT EXISTS `kgeek_redirect_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `published` tinyint NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `header` smallint NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  KEY `idx_old_url` (`old_url`(100)),
  KEY `idx_link_modified` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_redirect_links: ~0 rows (approximately)
DELETE FROM `kgeek_redirect_links`;

-- Dumping structure for table nts_kgeek.kgeek_scheduler_logs
CREATE TABLE IF NOT EXISTS `kgeek_scheduler_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `taskname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tasktype` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'unique identifier for job defined by plugin',
  `duration` decimal(5,3) NOT NULL,
  `jobid` int unsigned NOT NULL,
  `taskid` int unsigned NOT NULL,
  `exitcode` int NOT NULL,
  `lastdate` datetime DEFAULT NULL COMMENT 'Timestamp of last run',
  `nextdate` datetime DEFAULT NULL COMMENT 'Timestamp of next (planned) run, referred for execution on trigger',
  PRIMARY KEY (`id`),
  KEY `idx_taskname` (`taskname`),
  KEY `idx_tasktype` (`tasktype`),
  KEY `idx_lastdate` (`lastdate`),
  KEY `idx_nextdate` (`nextdate`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_scheduler_logs: ~31 rows (approximately)
DELETE FROM `kgeek_scheduler_logs`;
INSERT INTO `kgeek_scheduler_logs` (`id`, `taskname`, `tasktype`, `duration`, `jobid`, `taskid`, `exitcode`, `lastdate`, `nextdate`) VALUES
	(1, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.018, 6, 1, 0, '2026-11-19 14:48:40', '2026-11-19 14:53:40'),
	(2, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.011, 6, 2, 0, '2026-11-19 14:55:53', '2026-11-19 15:00:53'),
	(3, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.012, 6, 3, 0, '2026-11-19 15:01:59', '2026-11-19 15:06:59'),
	(4, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.013, 6, 4, 0, '2026-11-19 15:07:27', '2026-11-19 15:12:27'),
	(5, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.016, 6, 5, 0, '2026-11-19 15:14:52', '2026-11-19 15:19:52'),
	(6, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.017, 6, 6, 0, '2026-11-19 15:19:53', '2026-11-19 15:24:53'),
	(7, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.014, 6, 7, 0, '2026-11-19 15:24:53', '2026-11-19 15:29:53'),
	(8, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.018, 6, 8, 0, '2026-11-19 15:29:54', '2026-11-19 15:34:54'),
	(9, 'Kunena - Remove Expired Bans', 'Kunena Remove Expired Bans', 0.014, 4, 1, 0, '2026-11-19 15:34:54', '2026-11-19 16:34:54'),
	(10, 'Kunena - Trash purge', 'Kunena Purge Trashbin.', 0.014, 5, 1, 0, '2026-11-19 15:39:55', '2026-11-19 16:39:55'),
	(11, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.016, 6, 9, 0, '2026-11-19 15:44:55', '2026-11-19 15:49:55'),
	(12, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.015, 6, 10, 0, '2026-11-19 15:49:55', '2026-11-19 15:54:55'),
	(13, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.020, 6, 11, 0, '2026-11-19 15:57:05', '2026-11-19 16:02:05'),
	(14, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.015, 6, 12, 0, '2026-11-19 16:02:08', '2026-11-19 16:07:08'),
	(15, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.015, 6, 13, 0, '2026-11-19 16:07:27', '2026-11-19 16:12:27'),
	(16, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.013, 6, 14, 0, '2026-11-19 16:12:34', '2026-11-19 16:17:34'),
	(17, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.020, 6, 15, 0, '2026-11-19 16:20:11', '2026-11-19 16:25:11'),
	(18, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.021, 6, 16, 0, '2026-11-19 16:31:47', '2026-11-19 16:36:47'),
	(19, 'Kunena - Remove Expired Bans', 'Kunena Remove Expired Bans', 0.003, 4, 2, 0, '2026-11-19 16:38:26', '2026-11-19 17:38:26'),
	(20, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.017, 6, 17, 0, '2026-11-19 16:41:18', '2026-11-19 16:46:18'),
	(21, 'Kunena - Trash purge', 'Kunena Purge Trashbin.', 0.006, 5, 2, 0, '2026-11-19 16:42:42', '2026-11-19 17:42:42'),
	(22, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.014, 6, 18, 0, '2026-11-19 16:46:27', '2026-11-19 16:51:27'),
	(23, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.013, 6, 19, 0, '2026-11-19 16:51:48', '2026-11-19 16:56:48'),
	(24, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.015, 6, 20, 0, '2026-11-19 16:58:59', '2026-11-19 17:03:59'),
	(25, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.019, 6, 21, 0, '2026-11-19 23:15:26', '2026-11-19 23:20:26'),
	(26, 'Kunena - Remove Expired Bans', 'Kunena Remove Expired Bans', 0.003, 4, 3, 0, '2026-11-19 23:20:26', '2026-11-20 00:20:26'),
	(27, 'Kunena - Trash purge', 'Kunena Purge Trashbin.', 0.008, 5, 3, 0, '2026-11-19 23:20:54', '2026-11-20 00:20:54'),
	(28, 'Kunena - Clean pending attachments', 'Kunena Clean Pending Attachments', 0.004, 7, 1, 0, '2026-11-19 23:20:58', '2026-11-20 05:20:58'),
	(29, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.011, 6, 22, 0, '2026-11-19 23:24:15', '2026-11-19 23:29:15'),
	(30, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.010, 6, 23, 0, '2026-11-19 23:29:16', '2026-11-19 23:34:16'),
	(31, 'Kunena - Send the mail notifications queued', 'Send the mail notifications queued', 0.010, 6, 24, 0, '2026-11-19 23:34:16', '2026-11-19 23:39:16');

-- Dumping structure for table nts_kgeek.kgeek_scheduler_tasks
CREATE TABLE IF NOT EXISTS `kgeek_scheduler_tasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'unique identifier for job defined by plugin',
  `execution_rules` text COLLATE utf8mb4_unicode_ci COMMENT 'Execution Rules, Unprocessed',
  `cron_rules` text COLLATE utf8mb4_unicode_ci COMMENT 'Processed execution rules, crontab-like JSON form',
  `state` tinyint NOT NULL DEFAULT '0',
  `last_exit_code` int NOT NULL DEFAULT '0' COMMENT 'Exit code when job was last run',
  `last_execution` datetime DEFAULT NULL COMMENT 'Timestamp of last run',
  `next_execution` datetime DEFAULT NULL COMMENT 'Timestamp of next (planned) run, referred for execution on trigger',
  `times_executed` int DEFAULT '0' COMMENT 'Count of successful triggers',
  `times_failed` int DEFAULT '0' COMMENT 'Count of failures',
  `locked` datetime DEFAULT NULL,
  `priority` smallint NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0' COMMENT 'Configurable list ordering',
  `cli_exclusive` smallint NOT NULL DEFAULT '0' COMMENT 'If 1, the task is only accessible via CLI',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`),
  KEY `idx_state` (`state`),
  KEY `idx_last_exit` (`last_exit_code`),
  KEY `idx_next_exec` (`next_execution`),
  KEY `idx_locked` (`locked`),
  KEY `idx_priority` (`priority`),
  KEY `idx_cli_exclusive` (`cli_exclusive`),
  KEY `idx_checked_out` (`checked_out`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_scheduler_tasks: ~8 rows (approximately)
DELETE FROM `kgeek_scheduler_tasks`;
INSERT INTO `kgeek_scheduler_tasks` (`id`, `asset_id`, `title`, `type`, `execution_rules`, `cron_rules`, `state`, `last_exit_code`, `last_execution`, `next_execution`, `times_executed`, `times_failed`, `locked`, `priority`, `ordering`, `cli_exclusive`, `params`, `note`, `created`, `created_by`, `checked_out`, `checked_out_time`) VALUES
	(1, 97, 'Rotate Logs', 'rotation.logs', '{"rule-type":"interval-days","interval-days":"30","exec-day":"19","exec-time":"14:00"}', '{"type":"interval","exp":"P30D"}', 1, 0, NULL, '2026-12-19 14:00:00', 0, 0, NULL, 0, 0, 0, '{"individual_log":false,"log_file":"","notifications":{"success_mail":"0","failure_mail":"1","fatal_failure_mail":"1","orphan_mail":"1"},"logstokeep":1}', NULL, '2026-11-19 14:29:52', 688, NULL, NULL),
	(2, 98, 'Session GC', 'session.gc', '{"rule-type":"interval-hours","interval-hours":"24","exec-day":"01","exec-time":"14:00"}', '{"type":"interval","exp":"PT24H"}', 1, 0, NULL, '2026-11-20 14:00:00', 0, 0, NULL, 0, 0, 0, '{"individual_log":false,"log_file":"","notifications":{"success_mail":"0","failure_mail":"1","fatal_failure_mail":"1","orphan_mail":"1"},"enable_session_gc":1,"enable_session_metadata_gc":1}', NULL, '2026-11-19 14:29:52', 688, NULL, NULL),
	(3, 99, 'Update Notification', 'update.notification', '{"rule-type":"interval-hours","interval-hours":"24","exec-day":"01","exec-time":"14:00"}', '{"type":"interval","exp":"PT24H"}', 1, 0, NULL, '2026-11-20 14:00:00', 0, 0, NULL, 0, 0, 0, '{"individual_log":false,"log_file":"","notifications":{"success_mail":"0","failure_mail":"1","fatal_failure_mail":"1","orphan_mail":"1"},"email":"","language_override":""}', NULL, '2026-11-19 14:29:52', 688, NULL, NULL),
	(4, 101, 'Kunena - Remove Expired Bans', 'remove.expiredbans', '{"rule-type":"interval-hours","interval-hours":1,"exec-time":"14:31","exec-day":"19"}', '{"type":"interval","exp":"PT1H"}', 1, 0, '2026-11-19 23:20:26', '2026-11-20 00:20:26', 3, 0, NULL, 0, 0, 0, '[]', NULL, '2026-11-19 14:31:17', 688, NULL, NULL),
	(5, 102, 'Kunena - Trash purge', 'purge.trash', '{"rule-type":"interval-hours","interval-hours":1,"exec-time":"14:31","exec-day":"19"}', '{"type":"interval","exp":"PT1H"}', 1, 0, '2026-11-19 23:20:54', '2026-11-20 00:20:54', 3, 0, NULL, 0, 0, 0, '[]', NULL, '2026-11-19 14:31:17', 688, NULL, NULL),
	(6, 103, 'Kunena - Send the mail notifications queued', 'add.mailsqueue', '{"rule-type":"interval-minutes","interval-minutes":5,"exec-time":"14:31","exec-day":"19"}', '{"type":"interval","exp":"PT5M"}', 1, 0, '2026-11-19 23:34:16', '2026-11-19 23:39:16', 24, 0, NULL, 0, 0, 0, '[]', NULL, '2026-11-19 14:31:17', 688, NULL, NULL),
	(7, 104, 'Kunena - Clean pending attachments', 'clean.pendingattachments', '{"rule-type":"interval-hours","interval-hours":6,"exec-time":"14:31","exec-day":"19"}', '{"type":"interval","exp":"PT6H"}', 1, 0, '2026-11-19 23:20:58', '2026-11-20 05:20:58', 1, 0, NULL, 0, 0, 0, '[]', NULL, '2026-11-19 14:31:17', 688, NULL, NULL),
	(8, 105, 'Kunena - Unsubscribe inactive users from categories', 'unsubscribe.inactiveusers', '{"rule-type":"interval-days","interval-days":1,"exec-time":"14:31","exec-day":"19"}', '{"type":"interval","exp":"P1D"}', 1, 0, NULL, '2026-11-20 14:31:00', 0, 0, NULL, 0, 0, 0, '{"years":1}', NULL, '2026-11-19 14:31:17', 688, NULL, NULL);

-- Dumping structure for table nts_kgeek.kgeek_schemaorg
CREATE TABLE IF NOT EXISTS `kgeek_schemaorg` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemId` int unsigned DEFAULT NULL,
  `context` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schemaType` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schema` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_schemaorg: ~0 rows (approximately)
DELETE FROM `kgeek_schemaorg`;

-- Dumping structure for table nts_kgeek.kgeek_schemas
CREATE TABLE IF NOT EXISTS `kgeek_schemas` (
  `extension_id` int NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_schemas: ~0 rows (approximately)
DELETE FROM `kgeek_schemas`;
INSERT INTO `kgeek_schemas` (`extension_id`, `version_id`) VALUES
	(247, '6.2.0-2026-09-15');

-- Dumping structure for table nts_kgeek.kgeek_session
CREATE TABLE IF NOT EXISTS `kgeek_session` (
  `session_id` varbinary(192) NOT NULL,
  `client_id` tinyint unsigned DEFAULT NULL,
  `guest` tinyint unsigned DEFAULT '1',
  `time` int NOT NULL DEFAULT '0',
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `userid` int DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`),
  KEY `client_id_guest` (`client_id`,`guest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_session: ~13 rows (approximately)
DELETE FROM `kgeek_session`;
INSERT INTO `kgeek_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
	(_binary 0x3431326970713734726661366a613661736e626d616d30316972, 0, 1, 1795100057, 'joomla|s:844:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzk1MTAwMDU3O3M6NDoibGFzdCI7aToxNzk1MTAwMDU3O3M6Mzoibm93IjtpOjE3OTUxMDAwNTc7fXM6NToidG9rZW4iO3M6MzI6ImIyNDEwMjE4OWRiYTI4NGFlZTRmNTI1N2Q5YWIxOWU2Ijt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6ImNvbV9rdW5lbmEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6InVzZXIwX3JlYWQiO2E6Njp7aToxO2k6MTtpOjM7aTozO2k6NTtpOjU7aToyO2k6MjtpOjQ7aTo0O2k6NjtpOjY7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO30=";', 0, ''),
	(_binary 0x363339656c34633262316f39326e696672663061646d31397567, 0, 1, 1795100057, 'joomla|s:844:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzk1MTAwMDU3O3M6NDoibGFzdCI7aToxNzk1MTAwMDU3O3M6Mzoibm93IjtpOjE3OTUxMDAwNTc7fXM6NToidG9rZW4iO3M6MzI6IjNmZmYxNmNkY2EyZTcwNzFiMDVlNmQ5ZmJhYTUwMzdhIjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6ImNvbV9rdW5lbmEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6InVzZXIwX3JlYWQiO2E6Njp7aToxO2k6MTtpOjM7aTozO2k6NTtpOjU7aToyO2k6MjtpOjQ7aTo0O2k6NjtpOjY7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO30=";', 0, ''),
	(_binary 0x65677569323532696a6532766f323961353272717072336d7570, 1, 0, 1795130454, 'joomla|s:8556:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjY6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzk1MTAwMzEwO3M6NDoibGFzdCI7aToxNzk1MTA3MTE1O3M6Mzoibm93IjtpOjE3OTUxMzA0NTQ7fXM6NToidG9rZW4iO3M6MzI6Ijc0OGJjZmRjOWNlMWM2NjY0ZDI1MWI3NDNjOWY4OGRjIjtzOjc6ImNvdW50ZXIiO2k6MTMxO31zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjM6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6NTp7czoxMzoiY29tX2luc3RhbGxlciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJtZXNzYWdlIjtzOjA6IiI7czoxNzoiZXh0ZW5zaW9uX21lc3NhZ2UiO3M6MDoiIjtzOjEyOiJyZWRpcmVjdF91cmwiO047fXM6MTA6ImNvbV9jb25maWciO086ODoic3RkQ2xhc3MiOjE6e3M6NjoiY29uZmlnIjtPOjg6InN0ZENsYXNzIjoxOntzOjY6Imdsb2JhbCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJkYXRhIjthOjEwNzp7czo3OiJjYWNoaW5nIjtpOjA7czoxMzoiY2FjaGVfaGFuZGxlciI7czo0OiJmaWxlIjtzOjIwOiJjYWNoZV9wbGF0Zm9ybXByZWZpeCI7YjowO3M6OToiY2FjaGV0aW1lIjtpOjE1O3M6MTA6ImNhY2hlX3BhdGgiO3M6MDoiIjtzOjE3OiJtZW1jYWNoZWRfcGVyc2lzdCI7YjoxO3M6MTg6Im1lbWNhY2hlZF9jb21wcmVzcyI7YjowO3M6MjE6Im1lbWNhY2hlZF9zZXJ2ZXJfaG9zdCI7czo5OiJsb2NhbGhvc3QiO3M6MjE6Im1lbWNhY2hlZF9zZXJ2ZXJfcG9ydCI7aToxMTIxMTtzOjEzOiJyZWRpc19wZXJzaXN0IjtiOjE7czoxNzoicmVkaXNfc2VydmVyX2hvc3QiO3M6OToibG9jYWxob3N0IjtzOjE3OiJyZWRpc19zZXJ2ZXJfcG9ydCI7aTo2Mzc5O3M6MTU6InJlZGlzX3NlcnZlcl9kYiI7aTowO3M6NjoiZGJ0eXBlIjtzOjY6Im15c3FsaSI7czo0OiJob3N0IjtzOjk6ImxvY2FsaG9zdCI7czo0OiJ1c2VyIjtzOjQ6InJvb3QiO3M6ODoicGFzc3dvcmQiO3M6NDoicm9vdCI7czoyOiJkYiI7czo5OiJudHNfa2dlZWsiO3M6ODoiZGJwcmVmaXgiO3M6Njoia2dlZWtfIjtzOjEyOiJkYmVuY3J5cHRpb24iO2k6MDtzOjg6ImRic3Nsa2V5IjtzOjA6IiI7czo5OiJkYnNzbGNlcnQiO3M6MDoiIjtzOjIxOiJkYnNzbHZlcmlmeXNlcnZlcmNlcnQiO2I6MDtzOjc6ImRic3NsY2EiO3M6MDoiIjtzOjExOiJkYnNzbGNpcGhlciI7czowOiIiO3M6NToiZGVidWciO2I6MDtzOjEwOiJkZWJ1Z19sYW5nIjtiOjA7czoxNjoiZGVidWdfbGFuZ19jb25zdCI7YjoxO3M6NDoiY29ycyI7YjowO3M6MTc6ImNvcnNfYWxsb3dfb3JpZ2luIjtzOjE6IioiO3M6MTg6ImNvcnNfYWxsb3dfaGVhZGVycyI7czo0MToiQ29udGVudC1UeXBlLFgtSm9vbWxhLVRva2VuLEF1dGhvcml6YXRpb24iO3M6MTg6ImNvcnNfYWxsb3dfbWV0aG9kcyI7czowOiIiO3M6MTk6ImJlaGluZF9sb2FkYmFsYW5jZXIiO2I6MDtzOjEyOiJwcm94eV9lbmFibGUiO2I6MDtzOjEwOiJwcm94eV9ob3N0IjtzOjA6IiI7czoxMDoicHJveHlfcG9ydCI7czowOiIiO3M6MTA6InByb3h5X3VzZXIiO3M6MDoiIjtzOjY6Im9mZnNldCI7czozOiJVVEMiO3M6MTA6Im1haWxvbmxpbmUiO2I6MTtzOjExOiJtYXNzbWFpbG9mZiI7YjowO3M6ODoibWFpbGZyb20iO3M6MTg6Im5vLXJlcGx5QGdtYWlsLmNvbSI7czo4OiJmcm9tbmFtZSI7czo5OiJOVFMgS0dlZWsiO3M6NzoicmVwbHl0byI7czowOiIiO3M6MTE6InJlcGx5dG9uYW1lIjtzOjA6IiI7czo2OiJtYWlsZXIiO3M6NDoibWFpbCI7czo4OiJzZW5kbWFpbCI7czoxODoiL3Vzci9zYmluL3NlbmRtYWlsIjtzOjg6InNtdHBob3N0IjtzOjk6ImxvY2FsaG9zdCI7czo4OiJzbXRwcG9ydCI7aToyNTtzOjEwOiJzbXRwc2VjdXJlIjtzOjQ6Im5vbmUiO3M6ODoic210cGF1dGgiO3M6MToiMCI7czo4OiJzbXRwdXNlciI7czowOiIiO3M6ODoic210cHBhc3MiO3M6MDoiIjtzOjIxOiJzbXRwX29hdXRoMl9jbGllbnRfaWQiO3M6MDoiIjtzOjE3OiJzbXRwX29hdXRoMl9zY29wZSI7czowOiIiO3M6MjU6InNtdHBfb2F1dGgyX2F1dGhvcml6ZV91cmwiO3M6MDoiIjtzOjIxOiJzbXRwX29hdXRoMl90b2tlbl91cmwiO3M6MDoiIjtzOjI1OiJzbXRwX29hdXRoMl9yZWZyZXNoX3Rva2VuIjtzOjA6IiI7czoyNzoic210cF9vYXV0aDJfdG9rZW5faXNzdWVkX2F0IjtzOjA6IiI7czo4OiJNZXRhRGVzYyI7czowOiIiO3M6Njoicm9ib3RzIjtzOjA6IiI7czoxMDoiTWV0YVJpZ2h0cyI7czowOiIiO3M6MTA6Ik1ldGFBdXRob3IiO2I6MTtzOjExOiJNZXRhVmVyc2lvbiI7YjowO3M6Mzoic2VmIjtiOjE7czoxMToic2VmX3Jld3JpdGUiO2I6MDtzOjEwOiJzZWZfc3VmZml4IjtiOjA7czoxMjoidW5pY29kZXNsdWdzIjtiOjA7czoxOToic2l0ZW5hbWVfcGFnZXRpdGxlcyI7aTowO3M6ODoidG1wX3BhdGgiO3M6NDM6IkQ6XExvY2FsaG9zdFxodGRvY3NcbmljZXRoZW1lXG50c19rZ2Vlay90bXAiO3M6NDoiZ3ppcCI7YjowO3M6MTU6ImVycm9yX3JlcG9ydGluZyI7czo3OiJkZWZhdWx0IjtzOjk6ImZvcmNlX3NzbCI7aTowO3M6MTU6InNlc3Npb25faGFuZGxlciI7czo4OiJkYXRhYmFzZSI7czoyMzoic2Vzc2lvbl9maWxlc3lzdGVtX3BhdGgiO3M6MDoiIjtzOjI5OiJzZXNzaW9uX21lbWNhY2hlZF9zZXJ2ZXJfaG9zdCI7czo5OiJsb2NhbGhvc3QiO3M6Mjk6InNlc3Npb25fbWVtY2FjaGVkX3NlcnZlcl9wb3J0IjtpOjExMjExO3M6MjE6InNlc3Npb25fcmVkaXNfcGVyc2lzdCI7aToxO3M6MjU6InNlc3Npb25fcmVkaXNfc2VydmVyX2hvc3QiO3M6OToibG9jYWxob3N0IjtzOjI1OiJzZXNzaW9uX3JlZGlzX3NlcnZlcl9wb3J0IjtpOjYzNzk7czoyMzoic2Vzc2lvbl9yZWRpc19zZXJ2ZXJfZGIiO2k6MDtzOjg6ImxpZmV0aW1lIjtpOjEwMDA7czoxNDoic2hhcmVkX3Nlc3Npb24iO2I6MDtzOjE2OiJzZXNzaW9uX21ldGFkYXRhIjtiOjE7czoyNjoic2Vzc2lvbl9tZXRhZGF0YV9mb3JfZ3Vlc3QiO2I6MTtzOjg6InNpdGVuYW1lIjtzOjk6Ik5UUyBLR2VlayI7czo3OiJvZmZsaW5lIjtiOjA7czoyMzoiZGlzcGxheV9vZmZsaW5lX21lc3NhZ2UiO2k6MTtzOjE1OiJvZmZsaW5lX21lc3NhZ2UiO3M6Njk6IlRoaXMgc2l0ZSBpcyBkb3duIGZvciBtYWludGVuYW5jZS48YnIgLz5QbGVhc2UgY2hlY2sgYmFjayBhZ2FpbiBzb29uLiI7czoxMzoib2ZmbGluZV9pbWFnZSI7czowOiIiO3M6MTI6ImZyb250ZWRpdGluZyI7aToxO3M6NjoiZWRpdG9yIjtzOjc6InRpbnltY2UiO3M6NzoiY2FwdGNoYSI7czoxOiIwIjtzOjY6ImFjY2VzcyI7aToxO3M6MTA6Imxpc3RfbGltaXQiO2k6MjA7czoxMDoiZmVlZF9saW1pdCI7aToxMDtzOjEwOiJmZWVkX2VtYWlsIjtzOjQ6Im5vbmUiO3M6ODoibG9nX3BhdGgiO3M6NTg6IkQ6XExvY2FsaG9zdFxodGRvY3NcbmljZXRoZW1lXG50c19rZ2Vla1xhZG1pbmlzdHJhdG9yL2xvZ3MiO3M6MTQ6ImxvZ19ldmVyeXRoaW5nIjtpOjA7czoxNDoibG9nX2RlcHJlY2F0ZWQiO2k6MDtzOjE0OiJsb2dfcHJpb3JpdGllcyI7YToxOntpOjA7czozOiJhbGwiO31zOjE0OiJsb2dfY2F0ZWdvcmllcyI7czowOiIiO3M6MTc6ImxvZ19jYXRlZ29yeV9tb2RlIjtpOjA7czoxMzoiY29va2llX2RvbWFpbiI7czowOiIiO3M6MTE6ImNvb2tpZV9wYXRoIjtzOjA6IiI7czo1OiJydWxlcyI7YToxMzp7czoxNToiY29yZS5sb2dpbi5zaXRlIjthOjI6e2k6NjtiOjE7aToyO2I6MTt9czoxNjoiY29yZS5sb2dpbi5hZG1pbiI7YToxOntpOjY7YjoxO31zOjE0OiJjb3JlLmxvZ2luLmFwaSI7YToxOntpOjg7YjoxO31zOjE4OiJjb3JlLmxvZ2luLm9mZmxpbmUiO2E6MTp7aTo2O2I6MTt9czoxMDoiY29yZS5hZG1pbiI7YToxOntpOjg7YjoxO31zOjEyOiJjb3JlLm9wdGlvbnMiO2E6MDp7fXM6MTE6ImNvcmUubWFuYWdlIjthOjE6e2k6NztiOjE7fXM6MTE6ImNvcmUuY3JlYXRlIjthOjI6e2k6NjtiOjE7aTozO2I6MTt9czoxMToiY29yZS5kZWxldGUiO2E6MTp7aTo2O2I6MTt9czo5OiJjb3JlLmVkaXQiO2E6Mjp7aTo2O2I6MTtpOjQ7YjoxO31zOjE1OiJjb3JlLmVkaXQuc3RhdGUiO2E6Mjp7aTo2O2I6MTtpOjU7YjoxO31zOjEzOiJjb3JlLmVkaXQub3duIjthOjI6e2k6NjtiOjE7aTozO2I6MTt9czoxNToiY29yZS5lZGl0LnZhbHVlIjthOjA6e319czo3OiJmaWx0ZXJzIjthOjk6e2k6MTthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6Ik5IIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6OTthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6Ik5IIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6NjthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6IkJMIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6NzthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6IkJMIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6MjthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6Ik5IIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6MzthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6IkJMIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6NDthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6IkJMIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6NTthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6IkJMIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6ODthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjQ6Ik5PTkUiO3M6MTE6ImZpbHRlcl90YWdzIjtzOjA6IiI7czoxNzoiZmlsdGVyX2F0dHJpYnV0ZXMiO3M6MDoiIjt9fXM6ODoiYXNzZXRfaWQiO3M6MToiMSI7fX19fXM6MTE6ImNvbV9wbHVnaW5zIjtPOjg6InN0ZENsYXNzIjoxOntzOjc6InBsdWdpbnMiO086ODoic3RkQ2xhc3MiOjM6e3M6NjoiZmlsdGVyIjthOjU6e3M6Njoic2VhcmNoIjtzOjM6ImJlZSI7czo3OiJlbmFibGVkIjtzOjA6IiI7czo2OiJmb2xkZXIiO3M6MDoiIjtzOjc6ImVsZW1lbnQiO3M6MDoiIjtzOjY6ImFjY2VzcyI7czowOiIiO31zOjQ6Imxpc3QiO2E6NDp7czoxMjoiZnVsbG9yZGVyaW5nIjtzOjEwOiJmb2xkZXIgQVNDIjtzOjU6ImxpbWl0IjtzOjI6IjIwIjtzOjk6InNvcnRUYWJsZSI7czo2OiJmb2xkZXIiO3M6MTQ6ImRpcmVjdGlvblRhYmxlIjtzOjM6IkFTQyI7fXM6MTA6ImxpbWl0c3RhcnQiO2k6MDt9fXM6MTM6ImNvbV90ZW1wbGF0ZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6Njoic3R5bGVzIjtPOjg6InN0ZENsYXNzIjoyOntzOjk6ImNsaWVudF9pZCI7czoxOiIwIjtzOjQ6Imxpc3QiO2E6NDp7czo5OiJkaXJlY3Rpb24iO3M6MzoiYXNjIjtzOjU6ImxpbWl0IjtpOjIwO3M6ODoib3JkZXJpbmciO3M6MTA6ImEudGVtcGxhdGUiO3M6NToic3RhcnQiO2Q6MDt9fXM6NDoiZWRpdCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJzdHlsZSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czoyOiJpZCI7YTowOnt9czo0OiJkYXRhIjtOO319fXM6MTA6ImNvbV9rdW5lbmEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTI6InVzZXI2ODhfcmVhZCI7YToyMzp7aToxMztpOjEzO2k6MTY7aToxNjtpOjE7aToxO2k6OTtpOjk7aTozO2k6MztpOjU7aTo1O2k6MTc7aToxNztpOjE0O2k6MTQ7aToxMDtpOjEwO2k6MjtpOjI7aTo0O2k6NDtpOjY7aTo2O2k6MjA7aToyMDtpOjE4O2k6MTg7aToxNTtpOjE1O2k6MTE7aToxMTtpOjc7aTo3O2k6MTk7aToxOTtpOjEyO2k6MTI7aToyMTtpOjIxO2k6ODtpOjg7aToyMjtpOjIyO2k6MjM7aToyMzt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6MTI6IgAqAHNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTo2ODg7fXM6OToiY29tX3VzZXJzIjtPOjg6InN0ZENsYXNzIjoyOntzOjExOiJtZmFfY2hlY2tlZCI7aToxO3M6MTc6InJlbWVtYmVyX2RlZmVycmVkIjtpOjA7fXM6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjoxOntzOjU6InF1ZXVlIjthOjA6e319czo4OiJvdmVycmlkZSI7Tzo4OiJzdGRDbGFzcyI6MDp7fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6MTI6IgAqAHNlcGFyYXRvciI7czoxOiIuIjt9";', 688, 'admin'),
	(_binary 0x6570717135683231643268356f346b6c337136336f6635666174, 0, 1, 1795099869, 'joomla|s:844:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzk1MDk5ODY5O3M6NDoibGFzdCI7aToxNzk1MDk5ODY5O3M6Mzoibm93IjtpOjE3OTUwOTk4Njk7fXM6NToidG9rZW4iO3M6MzI6IjU0MzA3ZmExYzI3YzAyNTc1NWRiZWNkNDU4ZDI3NTViIjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6ImNvbV9rdW5lbmEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6InVzZXIwX3JlYWQiO2E6Njp7aToxO2k6MTtpOjM7aTozO2k6NTtpOjU7aToyO2k6MjtpOjQ7aTo0O2k6NjtpOjY7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO30=";', 0, ''),
	(_binary 0x6639617131363676636737303631766b383362326f336839636c, 0, 1, 1795100057, 'joomla|s:844:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzk1MTAwMDU2O3M6NDoibGFzdCI7aToxNzk1MTAwMDU2O3M6Mzoibm93IjtpOjE3OTUxMDAwNTY7fXM6NToidG9rZW4iO3M6MzI6IjU2YjFjNGYxZGNjYTJjMDM5MWQ1NDU0NDA2MzhhYTQzIjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6ImNvbV9rdW5lbmEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6InVzZXIwX3JlYWQiO2E6Njp7aToxO2k6MTtpOjM7aTozO2k6NTtpOjU7aToyO2k6MjtpOjQ7aTo0O2k6NjtpOjY7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO30=";', 0, ''),
	(_binary 0x67323966366c6c65676a31686a31386f32743075327576707030, 0, 1, 1795100058, 'joomla|s:844:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzk1MTAwMDU4O3M6NDoibGFzdCI7aToxNzk1MTAwMDU4O3M6Mzoibm93IjtpOjE3OTUxMDAwNTg7fXM6NToidG9rZW4iO3M6MzI6IjE0OGRiN2I4Zjg3N2QyMzc2NTUyYWE0MDIyMTRmMGUwIjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6ImNvbV9rdW5lbmEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6InVzZXIwX3JlYWQiO2E6Njp7aToxO2k6MTtpOjM7aTozO2k6NTtpOjU7aToyO2k6MjtpOjQ7aTo0O2k6NjtpOjY7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO30=";', 0, ''),
	(_binary 0x6831616d6230367276726f3338346d3674666f73337476613134, 0, 1, 1795100238, 'joomla|s:844:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzk1MTAwMjM3O3M6NDoibGFzdCI7aToxNzk1MTAwMjM3O3M6Mzoibm93IjtpOjE3OTUxMDAyMzc7fXM6NToidG9rZW4iO3M6MzI6IjE3ZWZlMWFlNzViMzMzNzg3NjI5OGEwOWVjODBjMGFiIjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6ImNvbV9rdW5lbmEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6InVzZXIwX3JlYWQiO2E6Njp7aToxO2k6MTtpOjM7aTozO2k6NTtpOjU7aToyO2k6MjtpOjQ7aTo0O2k6NjtpOjY7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO30=";', 0, ''),
	(_binary 0x697276373939706a6c68646b6765337070643835377261636833, 0, 1, 1795100057, 'joomla|s:844:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzk1MTAwMDU3O3M6NDoibGFzdCI7aToxNzk1MTAwMDU3O3M6Mzoibm93IjtpOjE3OTUxMDAwNTc7fXM6NToidG9rZW4iO3M6MzI6IjcxOGYyYjNjZjU1ZTdiYTM2YzQyNDUyNjNkMDU3NGM3Ijt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6ImNvbV9rdW5lbmEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6InVzZXIwX3JlYWQiO2E6Njp7aToxO2k6MTtpOjM7aTozO2k6NTtpOjU7aToyO2k6MjtpOjQ7aTo0O2k6NjtpOjY7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO30=";', 0, ''),
	(_binary 0x6b353270733876306866767472386c726271623967746e356565, 0, 1, 1795099718, 'joomla|s:844:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzk1MDk5NzE4O3M6NDoibGFzdCI7aToxNzk1MDk5NzE4O3M6Mzoibm93IjtpOjE3OTUwOTk3MTg7fXM6NToidG9rZW4iO3M6MzI6IjZjYmI3ZjU5MjdmNGU4ZWE1MGUzNDVhNzUwOWViZjI3Ijt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6ImNvbV9rdW5lbmEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6InVzZXIwX3JlYWQiO2E6Njp7aToxO2k6MTtpOjM7aTozO2k6NTtpOjU7aToyO2k6MjtpOjQ7aTo0O2k6NjtpOjY7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO30=";', 0, ''),
	(_binary 0x6b68386c716b6439743239346f71363968356a33646e64366a6e, 0, 1, 1795099712, 'joomla|s:628:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo3OiJjb3VudGVyIjtpOjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzk1MDk5NzEyO3M6NDoibGFzdCI7aToxNzk1MDk5NzEyO3M6Mzoibm93IjtpOjE3OTUwOTk3MTI7fX1zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjM6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6MDp7fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjA7fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6MTI6IgAqAHNlcGFyYXRvciI7czoxOiIuIjt9";', 0, ''),
	(_binary 0x6f6c3839677675666a66706a617631686f6d7034336c76666463, 0, 1, 1795131360, 'joomla|s:1068:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjExMDtzOjU6InRpbWVyIjtPOjg6InN0ZENsYXNzIjozOntzOjU6InN0YXJ0IjtpOjE3OTUwOTg4MTE7czo0OiJsYXN0IjtpOjE3OTUxMzEzNTU7czozOiJub3ciO2k6MTc5NTEzMTM2MDt9czo1OiJ0b2tlbiI7czozMjoiYmJiZTZlZWM1ZDRhZDczM2U4OTNmYzYzNzcyZDU1NmYiO31zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjM6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoiY29tX2t1bmVuYSI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoidXNlcjBfcmVhZCI7YToyMzp7aToxMztpOjEzO2k6MTY7aToxNjtpOjE7aToxO2k6OTtpOjk7aTozO2k6MztpOjU7aTo1O2k6MTc7aToxNztpOjE0O2k6MTQ7aToxMDtpOjEwO2k6MjtpOjI7aTo0O2k6NDtpOjY7aTo2O2k6MjA7aToyMDtpOjE4O2k6MTg7aToxNTtpOjE1O2k6MTE7aToxMTtpOjc7aTo3O2k6MTk7aToxOTtpOjEyO2k6MTI7aToyMTtpOjIxO2k6ODtpOjg7aToyMjtpOjIyO2k6MjM7aToyMzt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6MTI6IgAqAHNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fQ==";', 0, ''),
	(_binary 0x736575767574316a70693374316c376d6c7464317471616d3367, 0, 1, 1795099718, 'joomla|s:628:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo3OiJjb3VudGVyIjtpOjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzk1MDk5NzE3O3M6NDoibGFzdCI7aToxNzk1MDk5NzE3O3M6Mzoibm93IjtpOjE3OTUwOTk3MTc7fX1zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjM6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6MDp7fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjA7fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6MTI6IgAqAHNlcGFyYXRvciI7czoxOiIuIjt9";', 0, ''),
	(_binary 0x7633676d696d6d32336f37307633616c676a756a696370756362, 0, 1, 1795100249, 'joomla|s:844:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjM7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzk1MDk5NzMyO3M6NDoibGFzdCI7aToxNzk1MDk5ODU1O3M6Mzoibm93IjtpOjE3OTUxMDAyNDk7fXM6NToidG9rZW4iO3M6MzI6IjVlZjdiYTY1ZTA2YTcwZWZmMTk5MTZkZDJlMGZkZjVjIjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6ImNvbV9rdW5lbmEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6InVzZXIwX3JlYWQiO2E6Njp7aToxO2k6MTtpOjM7aTozO2k6NTtpOjU7aToyO2k6MjtpOjQ7aTo0O2k6NjtpOjY7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO30=";', 0, '');

-- Dumping structure for table nts_kgeek.kgeek_tags
CREATE TABLE IF NOT EXISTS `kgeek_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `level` int unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL,
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_tags: ~0 rows (approximately)
DELETE FROM `kgeek_tags`;
INSERT INTO `kgeek_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
	(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, NULL, NULL, 1, '', '', '', '', 688, '2026-11-19 14:29:52', '', 688, '2026-11-19 14:29:52', '', '', 0, '*', 1, NULL, NULL);

-- Dumping structure for table nts_kgeek.kgeek_template_overrides
CREATE TABLE IF NOT EXISTS `kgeek_template_overrides` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hash_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension_id` int DEFAULT '0',
  `state` tinyint NOT NULL DEFAULT '0',
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint unsigned NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_extension_id` (`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_template_overrides: ~0 rows (approximately)
DELETE FROM `kgeek_template_overrides`;

-- Dumping structure for table nts_kgeek.kgeek_template_styles
CREATE TABLE IF NOT EXISTS `kgeek_template_styles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint unsigned NOT NULL DEFAULT '0',
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `inheritable` tinyint NOT NULL DEFAULT '0',
  `parent` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_client_id` (`client_id`),
  KEY `idx_client_id_home` (`client_id`,`home`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_template_styles: ~4 rows (approximately)
DELETE FROM `kgeek_template_styles`;
INSERT INTO `kgeek_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `inheritable`, `parent`, `params`) VALUES
	(10, 'atum', 1, '1', 'Atum - Default', 1, '', '{"hue":"hsl(214, 63%, 20%)","bg-light":"#f0f4fb","text-dark":"#495057","text-light":"#ffffff","link-color":"#2a69b8","special-color":"#001b4c","colorScheme":"os","monochrome":"0","loginLogo":"","loginLogoAlt":"","logoBrandLarge":"","logoBrandLargeAlt":"","logoBrandSmall":"","logoBrandSmallAlt":""}'),
	(11, 'cassiopeia', 0, '0', 'Cassiopeia - Default', 1, '', '{"brand":"1","logoFile":"","siteTitle":"","siteDescription":"","useFontScheme":"0","colorName":"colors_standard","fluidContainer":"0","stickyHeader":0,"backTop":0}'),
	(12, 'cassiopeia_extended', 0, '0', 'Cassiopeia Extended - Default', 0, 'cassiopeia', '{"brand":"1","logoFile":"","siteTitle":"","siteDescription":"","useFontScheme":"0","systemFontBody":"","systemFontHeading":"","colorName":"colors_standard","fluidContainer":"0","stickyHeader":"0","backTop":"0","colorSettings":"0","headerbg":"rgb(193, 205, 207)","headercolor":"rgb(23, 23, 23)","bodybg":"rgb(254, 254, 254)","bodycolor":"rgb(23, 23, 23)","linkcolor":"rgb(29, 121, 137)","linkcolorh":"rgb(14, 59, 67)","btnbg":"rgb(206, 60, 55)","btnbgh":"rgb(131, 35, 32)","btncolor":"rgb(254, 254, 254)","btncolorh":"rgb(254, 254, 254)","footerbg":"rgb(29, 121, 137)","footercolor":"rgb(254, 254, 254)","fontSettings":"0","bodysize":"1","h1size":"2","h2size":"1.7","h3size":"1.5"}'),
	(13, 'bee_dawn', 0, '1', 'bee_dawn - Default', 1, '', '{"logo_type":"text","logo_image":"","logo_text":"","logo_slogan":"","favicon_image":"","touch_image":"","show_back_to_top":"1","menu_fixed":"0","color_preset":"{\\"default\\":\\"light\\",\\"roles\\":{\\"--bee-body-bg\\":\\"--bee-base-100\\",\\"--bee-body-color\\":\\"--bee-base-content\\",\\"--bee-muted-color\\":\\"--bee-color-4\\",\\"--bee-heading-color\\":\\"--bee-color-3\\",\\"--bee-border-color\\":\\"--bee-base-300\\",\\"--bee-btn-bg\\":\\"--bee-primary\\",\\"--bee-btn-text\\":\\"--bee-on-primary\\",\\"--bee-btn-hover-bg\\":\\"\\",\\"--bee-btn-hover-text\\":\\"\\",\\"--bee-link-color\\":\\"--bee-color-1\\",\\"--bee-link-hover-color\\":\\"--bee-color-2\\",\\"--bee-link-active-color\\":\\"--bee-color-2\\",\\"--bee-menu-color\\":\\"\\",\\"--bee-menu-hover-color\\":\\"\\",\\"--bee-menu-active-color\\":\\"\\",\\"--bee-submenu-bg\\":\\"\\",\\"--bee-submenu-link-color\\":\\"\\",\\"--bee-submenu-link-hover-color\\":\\"\\",\\"--bee-submenu-link-active-color\\":\\"\\"},\\"labels\\":{}}","typography":"{\\"headings\\":{\\"sizes\\":{\\"h1\\":{\\"fs\\":\\"\\",\\"fs_sm\\":\\"\\",\\"fs_xs\\":\\"\\"},\\"h2\\":{\\"fs\\":\\"\\",\\"fs_sm\\":\\"\\",\\"fs_xs\\":\\"\\"},\\"h3\\":{\\"fs\\":\\"\\",\\"fs_sm\\":\\"\\",\\"fs_xs\\":\\"\\"},\\"h4\\":{\\"fs\\":\\"\\",\\"fs_sm\\":\\"\\",\\"fs_xs\\":\\"\\"},\\"h5\\":{\\"fs\\":\\"\\",\\"fs_sm\\":\\"\\",\\"fs_xs\\":\\"\\"},\\"h6\\":{\\"fs\\":\\"\\",\\"fs_sm\\":\\"\\",\\"fs_xs\\":\\"\\"}},\\"weight\\":\\"\\",\\"line_height\\":\\"\\",\\"font\\":{\\"id\\":\\"michroma\\",\\"selected\\":[\\"regular\\"]}},\\"base\\":{\\"size\\":\\"\\",\\"weight\\":\\"\\",\\"line_height\\":\\"\\",\\"font\\":{}},\\"nav\\":{\\"size\\":\\"\\",\\"weight\\":\\"\\",\\"line_height\\":\\"\\",\\"font\\":{}}}","container_width":"","section_spacing":"","gutter_spacing":"","template_layout":"component-only","layout_sections":"{}","sublayout":"[]","offcanvas":"0","menu_trigger":"hover","mobile_menu_breakpoint":"768","megamenu":"{}","btn_radius":"","btn_padding":"","global_radius":"","optimize_js":0,"js_excluded":"","optimize_css":0,"css_excluded":"","custom_code_after_head":"","custom_code_before_head":"","custom_code_after_body":"","custom_code_before_body":""}');

-- Dumping structure for table nts_kgeek.kgeek_tuf_metadata
CREATE TABLE IF NOT EXISTS `kgeek_tuf_metadata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `update_site_id` int DEFAULT '0',
  `root` text COLLATE utf8mb4_unicode_ci,
  `targets` text COLLATE utf8mb4_unicode_ci,
  `snapshot` text COLLATE utf8mb4_unicode_ci,
  `timestamp` text COLLATE utf8mb4_unicode_ci,
  `mirrors` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Secure TUF Updates';

-- Dumping data for table nts_kgeek.kgeek_tuf_metadata: ~0 rows (approximately)
DELETE FROM `kgeek_tuf_metadata`;
INSERT INTO `kgeek_tuf_metadata` (`id`, `update_site_id`, `root`, `targets`, `snapshot`, `timestamp`, `mirrors`) VALUES
	(1, 1, '{"signed":{"_type":"root","spec_version":"1.0","version":16,"expires":"2027-09-17T18:55:11Z","keys":{"00e432b504508246e2bd536dd6c13e55e8b3256f0be9f767fae26da6c2a28663":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"250f8d293c49817a83909dead96ad82b62f7ac16844cf589f8d2f0e0b15cab21"}},"07eb082f367c034a95878687f6648aa76d93652b6ee73e58817053d89af6c44f":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"9b2af2d9b9727227735253d795bd27ea8f0e294a5f3603e822dc5052b44802b9"}},"179d107f20a2354ac5bd9a1f32a2df1763c0059617f0c132bebeb4816a1a8637":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"159a4195cbafce2bb959f09ab2b36a2127b8967f94d389f65f1e7892fccfe8b8"}},"192ad7343e7d431533d9577fd957b6f924680177db4dc6c0e146dad6810a90a4":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"042b66e1431a1f5c2c15b4a16ea60f23f466851b58e9ff057dbfc2a5e0d821d1"}},"1b1b1dd55b2c1c7258714cf1c1ae06f23e4607b28c762d016a9d81c48ffe5669":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"a18e5ebabc19d5d5984b601a292ece61ba3662ab2d071dc520da5bd4f8948799"}},"273e94e5477e306ad6de75be1524860e219e265ff9a57c81ababd0691e45706c":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"1cb6702338830ef1c9e76a022fed27172d475bbaace754d8141ebc96dad8b15f"}},"284c8164fd395e9178dc66929787f0650cda6acff0fd769ef697203d7553c481":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"546cdff30cc1ad6dd5f3d1e173672d94bd61a9507199af064142f70cde8de4e3"}},"2dcaf3d0e552f150792f7c636d45429246dcfa34ac35b46a44f5c87cd17d457e":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"cb0a7a131961a20edea051d6dc2b091fb650bd399bd8514adb67b3c60db9f8f9"}},"31dd7c7290d664c9b88c0dead2697175293ea7df81b7f24153a37370fd3901c3":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"589d029a68b470deff1ca16dbf3eea6b5b3fcba0ae7bb52c468abc7fb058b2a2"}},"9e41a9d62d94c6a1c8a304f62c5bd72d84a9f286f27e8327cedeacb09e5156cc":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"6043c8bacc76ac5c9750f45454dd865c6ca1fc57d69e14cc192cfd420f6a66a9"}},"9eabc37383b243cd236375c66693db385911914b52556e1ec05fc70ed45e1bfe":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"a4b8509488f1c29ab0b1f610e7452fbec78b4f33f1fba5a418d6ff087c567429"}},"a1a4b7fdbeedfdeff12d7776de098a2f8de8d2ab7bfe10062a281b3819b078c1":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"ea764b0b475b3c396627ac6689cbd8f54a5f93e87b6f5e3eb44a7ccafb542ff3"}},"a599a27a3ec4d520059c591338759dc401006b1c4cb1db85a286e667253d28b6":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"45e416d24d13a60ace5ab028827d5cfc8ba177bb9466bf2acd8efa6e3547911a"}},"ba3914be50eea8ecf6d5e7a8d3564dbbad99415d9cc229b9ee081ed86f69f803":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"1cbfa7dcac9659e5a8a946ec999bd28f53b451e38ce5827980bed2686098cf19"}},"bfee044dd4574a281c9b7c0b6829913ef292c66c0512d1091a298cfca8493da9":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"6eb44460e5914e8e0df726ddb90bd1f3771b8ce5af19b40fb01ac5a85b023a6f"}},"c9fe1ff72da60a30ea5e612fa2ef4ca329fb46d9e1965b811bf9f2de44ffdf18":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"390d45fce58e41fec922092b138eaf719ed2036c8722bd694a6832ab6ca18409"}},"e2229942b0fc1e6d7f82adf258e5bdadac10046d1470b7ec459c9eb4e076026b":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"ad1950e117b29ebe7a38635a2e574123e07571e4f9a011783e053b5f15d2562a"}},"ecc851a051c8d6439331ff0a37c7727321fc39896a34f950f73638b8a7cb472e":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"5d451915bc2b93a0e4e4745bc6a8b292d58996d50e0fb66c78c7827152a65879"}}},"roles":{"root":{"keyids":["1b1b1dd55b2c1c7258714cf1c1ae06f23e4607b28c762d016a9d81c48ffe5669","2dcaf3d0e552f150792f7c636d45429246dcfa34ac35b46a44f5c87cd17d457e","192ad7343e7d431533d9577fd957b6f924680177db4dc6c0e146dad6810a90a4"],"threshold":1},"snapshot":{"keyids":["07eb082f367c034a95878687f6648aa76d93652b6ee73e58817053d89af6c44f","2dcaf3d0e552f150792f7c636d45429246dcfa34ac35b46a44f5c87cd17d457e","ecc851a051c8d6439331ff0a37c7727321fc39896a34f950f73638b8a7cb472e","e2229942b0fc1e6d7f82adf258e5bdadac10046d1470b7ec459c9eb4e076026b","bfee044dd4574a281c9b7c0b6829913ef292c66c0512d1091a298cfca8493da9","9eabc37383b243cd236375c66693db385911914b52556e1ec05fc70ed45e1bfe","273e94e5477e306ad6de75be1524860e219e265ff9a57c81ababd0691e45706c","00e432b504508246e2bd536dd6c13e55e8b3256f0be9f767fae26da6c2a28663","179d107f20a2354ac5bd9a1f32a2df1763c0059617f0c132bebeb4816a1a8637","a1a4b7fdbeedfdeff12d7776de098a2f8de8d2ab7bfe10062a281b3819b078c1","192ad7343e7d431533d9577fd957b6f924680177db4dc6c0e146dad6810a90a4","a599a27a3ec4d520059c591338759dc401006b1c4cb1db85a286e667253d28b6","284c8164fd395e9178dc66929787f0650cda6acff0fd769ef697203d7553c481","ba3914be50eea8ecf6d5e7a8d3564dbbad99415d9cc229b9ee081ed86f69f803","c9fe1ff72da60a30ea5e612fa2ef4ca329fb46d9e1965b811bf9f2de44ffdf18"],"threshold":1},"targets":{"keyids":["31dd7c7290d664c9b88c0dead2697175293ea7df81b7f24153a37370fd3901c3","ecc851a051c8d6439331ff0a37c7727321fc39896a34f950f73638b8a7cb472e","e2229942b0fc1e6d7f82adf258e5bdadac10046d1470b7ec459c9eb4e076026b","bfee044dd4574a281c9b7c0b6829913ef292c66c0512d1091a298cfca8493da9","9eabc37383b243cd236375c66693db385911914b52556e1ec05fc70ed45e1bfe","273e94e5477e306ad6de75be1524860e219e265ff9a57c81ababd0691e45706c","00e432b504508246e2bd536dd6c13e55e8b3256f0be9f767fae26da6c2a28663","179d107f20a2354ac5bd9a1f32a2df1763c0059617f0c132bebeb4816a1a8637","a1a4b7fdbeedfdeff12d7776de098a2f8de8d2ab7bfe10062a281b3819b078c1","284c8164fd395e9178dc66929787f0650cda6acff0fd769ef697203d7553c481","c9fe1ff72da60a30ea5e612fa2ef4ca329fb46d9e1965b811bf9f2de44ffdf18"],"threshold":1},"timestamp":{"keyids":["9e41a9d62d94c6a1c8a304f62c5bd72d84a9f286f27e8327cedeacb09e5156cc"],"threshold":1}},"consistent_snapshot":true},"signatures":[{"keyid":"1b1b1dd55b2c1c7258714cf1c1ae06f23e4607b28c762d016a9d81c48ffe5669","sig":"45cabce9321e0091f9a88a862d250c35f6efede25c7c6eab6cbf738d176c366308bb24cedc80812244259a0d56fd796b2ebd13f98d6aba5c8220df4f136a8504"}]}', '{"signed":{"_type":"targets","spec_version":"1.0","version":120,"expires":"2027-02-17T15:35:47Z","targets":{"Joomla_5.1.2-Stable-Upgrade_Package.zip":{"length":28134889,"hashes":{"sha512":"d6b46cdedb9b31d01a607fe4c2f3a830a3265ed6ae5c0cb7b0f836b1b016ee7c639bd8948df00baf1b61a87f2fc71368a80b39e67ef9ec2b8842ee0ab09a620f"},"custom":{"client":"site","description":"Joomla! 5.1.2 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla5/5-1-2/Joomla_5.1.2-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/5.1.2/Joomla_5.1.2-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/5.1.2/Joomla_5.1.2-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5909-joomla-5-1-2-and-joomla-4-4-6-security-and-bug-fix-release.html","title":"Joomla! 5.1.2 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 5.1.2","php_minimum":"8.1.0","channel":"6.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"11.0"},"targetplatform":{"name":"joomla","version":"(5\\\\.[0-4])|^(4\\\\.4)"},"type":"file","version":"5.1.2"}},"Joomla_5.4.10-Stable-Update_Package.zip":{"length":32022582,"hashes":{"sha512":"40ac7cc602e170c9443fe9b8aa6f798900ff8bd58bb0c0c7ef6fe915cf03f1c1088f1ca1a8c9c8c617969aeda25e6f27b5fb5cce55328e20344fdb4954aa1207"},"custom":{"client":"site","description":"Joomla! 5.4.10 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla5/5-4-10/Joomla_5.4.10-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/5.4.10/Joomla_5.4.10-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/5.4.10/Joomla_5.4.10-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/joomla-5-4-10-bugfix-release.html","title":"Joomla! 5.4.10 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 5.4.10","php_minimum":"8.1.0","channel":"5.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"11.0"},"targetplatform":{"name":"joomla","version":"(5\\\\.[0-4])|^(4\\\\.4)"},"type":"file","version":"5.4.10"}},"Joomla_6.2.0-Stable-Update_Package.zip":{"length":32555797,"hashes":{"sha512":"add35ea23140a8d095e1858a3b6744011bed193b173ff02edcf526feea3a85b6653866b3e3d8baf83bd01d1f87d5f4608de23741799e1e1925f0c3124d1125fd"},"custom":{"client":"site","description":"Joomla! 6.2.0 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla6/6-2-0/Joomla_6.2.0-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/6.2.0/Joomla_6.2.0-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/6.2.0/Joomla_6.2.0-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/joomla-6-2-is-here.html","title":"Joomla! 6.2.0 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.2.0","php_minimum":"8.3.0","channel":"6.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.2.0"}},"Joomla_6.2.1-rc1-Release_Candidate-Update_Package.zip":{"length":32999751,"hashes":{"sha512":"d4ae4176a8ee22df8be5dcd5702002c164cce9a6f5f46721ba895dc862d548c9c2fd238af33889a7200e080796e6d468cf1a7c0eb4edf48381d0e7d6edf62e68"},"custom":{"client":"site","description":"Joomla! 6.2.1-rc1 Release","downloads":[{"url":"https://github.com/joomla/joomla-cms/releases/download/6.2.1-rc1/Joomla_6.2.1-rc1-Release_Candidate-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://github.com/joomla/joomla-cms/releases/tag/6.2.1-rc1","title":"Joomla! 6.2.1-rc1 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.2.1-rc1","php_minimum":"8.3.0","channel":"6.x","stability":"RC","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.2.1-rc1"}}}},"signatures":[{"keyid":"c9fe1ff72da60a30ea5e612fa2ef4ca329fb46d9e1965b811bf9f2de44ffdf18","sig":"4f21230d6806ad5f8867ded884c7ed352370cd2f52f32af896b198ac9df3f77299b2a7dc46525a6951cd0c86b95378fe5ce9176b33179f76b9d5b442847cb105"},{"keyid":"284c8164fd395e9178dc66929787f0650cda6acff0fd769ef697203d7553c481","sig":"2ad7910becf352527411950969332d3c63e357f3bcb61ccd195a8b0df5a180618f81a45c835ee8cd376bb34165ddbbb5b76c3c8d8bb909e396729efd4f1dd70d"}]}', '{"signed":{"_type":"snapshot","spec_version":"1.0","version":136,"expires":"2027-06-15T15:48:15Z","meta":{"targets.json":{"length":5068,"hashes":{"sha512":"7ac6d10ea6deb6e65984e7dca85f0ff56699df7ee244cf25d1ce7a67c5d78271dc4b4885f6f636e9c022ed35711109a289338b1189e9c4d64fa0a5b9d73beb0e"},"version":120}}},"signatures":[{"keyid":"ba3914be50eea8ecf6d5e7a8d3564dbbad99415d9cc229b9ee081ed86f69f803","sig":"53a2fc43c76261f6ce1ad9ae4032d1b9b9b3738c3393dde153b0b1c82af026d01c81d047f77324986958be69220d1b70f65e8c6a3fe6e31b21bb712b4ab8870f"}]}', '{"signed":{"_type":"timestamp","spec_version":"1.0","version":1317,"expires":"2026-11-21T01:14:38Z","meta":{"snapshot.json":{"length":533,"hashes":{"sha512":"a1a6d3939efa6e6cfbdb32cf9383aaaa29fd73f6ef976f9261ef5a8a389ff11a50b9799570178f0f10c19f9fce05c9441aba861328ec17268591ff3d8a7f8f57"},"version":136}}},"signatures":[{"keyid":"9e41a9d62d94c6a1c8a304f62c5bd72d84a9f286f27e8327cedeacb09e5156cc","sig":"a9c2fb76213ef923ae6e2f6132b6269dc8dfb752c1995d4d32943c300c97e8c7bd902e09d39c9c265764b16fc9fc16b6893444203a575f4a78cd65fc4e43b80f"}]}', NULL);

-- Dumping structure for table nts_kgeek.kgeek_ucm_base
CREATE TABLE IF NOT EXISTS `kgeek_ucm_base` (
  `ucm_id` int unsigned NOT NULL,
  `ucm_item_id` int NOT NULL,
  `ucm_type_id` int NOT NULL,
  `ucm_language_id` int NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_ucm_base: ~0 rows (approximately)
DELETE FROM `kgeek_ucm_base`;

-- Dumping structure for table nts_kgeek.kgeek_ucm_content
CREATE TABLE IF NOT EXISTS `kgeek_ucm_content` (
  `core_content_id` int unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci,
  `core_state` tinyint NOT NULL DEFAULT '0',
  `core_checked_out_time` datetime DEFAULT NULL,
  `core_checked_out_user_id` int unsigned DEFAULT NULL,
  `core_access` int unsigned NOT NULL DEFAULT '0',
  `core_params` text COLLATE utf8mb4_unicode_ci,
  `core_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL,
  `core_modified_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL,
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_publish_up` datetime DEFAULT NULL,
  `core_publish_down` datetime DEFAULT NULL,
  `core_content_item_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'ID from the individual type table',
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci,
  `core_urls` text COLLATE utf8mb4_unicode_ci,
  `core_hits` int unsigned NOT NULL DEFAULT '0',
  `core_version` int unsigned NOT NULL DEFAULT '1',
  `core_ordering` int NOT NULL DEFAULT '0',
  `core_metakey` text COLLATE utf8mb4_unicode_ci,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci,
  `core_catid` int unsigned NOT NULL DEFAULT '0',
  `core_type_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`(100)),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`(100)),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`(100)),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';

-- Dumping data for table nts_kgeek.kgeek_ucm_content: ~0 rows (approximately)
DELETE FROM `kgeek_ucm_content`;

-- Dumping structure for table nts_kgeek.kgeek_updates
CREATE TABLE IF NOT EXISTS `kgeek_updates` (
  `update_id` int NOT NULL AUTO_INCREMENT,
  `update_site_id` int DEFAULT '0',
  `extension_id` int DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `changelogurl` text COLLATE utf8mb4_unicode_ci,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `security` tinyint DEFAULT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';

-- Dumping data for table nts_kgeek.kgeek_updates: ~57 rows (approximately)
DELETE FROM `kgeek_updates`;
INSERT INTO `kgeek_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `changelogurl`, `extra_query`, `security`) VALUES
	(1, 2, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '6.2.1.1', '', 'https://update.joomla.org/language/details6/af-ZA_details.xml', '', '', '', NULL),
	(2, 2, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '6.2.1.1', '', 'https://update.joomla.org/language/details6/ar-AA_details.xml', '', '', '', NULL),
	(3, 2, 0, 'Basque', '', 'pkg_eu-ES', 'package', '', 0, '6.1.4.1', '', 'https://update.joomla.org/language/details6/eu-ES_details.xml', '', '', '', NULL),
	(4, 2, 0, 'Belarusian', '', 'pkg_be-BY', 'package', '', 0, '6.1.4.1', '', 'https://update.joomla.org/language/details6/be-BY_details.xml', '', '', '', NULL),
	(5, 2, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '6.0.3.1', '', 'https://update.joomla.org/language/details6/bg-BG_details.xml', '', '', '', NULL),
	(6, 2, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/ca-ES_details.xml', '', '', '', NULL),
	(7, 2, 0, 'Chinese, Simplified', '', 'pkg_zh-CN', 'package', '', 0, '6.0.1.4', '', 'https://update.joomla.org/language/details6/zh-CN_details.xml', '', '', '', NULL),
	(8, 2, 0, 'Chinese, Traditional', '', 'pkg_zh-TW', 'package', '', 0, '6.0.4.1', '', 'https://update.joomla.org/language/details6/zh-TW_details.xml', '', '', '', NULL),
	(9, 2, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '6.0.3.2', '', 'https://update.joomla.org/language/details6/hr-HR_details.xml', '', '', '', NULL),
	(10, 2, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '6.2.1.1', '', 'https://update.joomla.org/language/details6/cs-CZ_details.xml', '', '', '', NULL),
	(11, 2, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/da-DK_details.xml', '', '', '', NULL),
	(12, 2, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/nl-NL_details.xml', '', '', '', NULL),
	(13, 2, 0, 'English, Australia', '', 'pkg_en-AU', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/en-AU_details.xml', '', '', '', NULL),
	(14, 2, 0, 'English, Canada', '', 'pkg_en-CA', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/en-CA_details.xml', '', '', '', NULL),
	(15, 2, 0, 'English, New Zealand', '', 'pkg_en-NZ', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/en-NZ_details.xml', '', '', '', NULL),
	(16, 2, 0, 'English, USA', '', 'pkg_en-US', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/en-US_details.xml', '', '', '', NULL),
	(17, 2, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '6.1.4.1', '', 'https://update.joomla.org/language/details6/et-EE_details.xml', '', '', '', NULL),
	(18, 2, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/fi-FI_details.xml', '', '', '', NULL),
	(19, 2, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/nl-BE_details.xml', '', '', '', NULL),
	(20, 2, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/fr-FR_details.xml', '', '', '', NULL),
	(21, 2, 0, 'French, Canada', '', 'pkg_fr-CA', 'package', '', 0, '6.1.4.2', '', 'https://update.joomla.org/language/details6/fr-CA_details.xml', '', '', '', NULL),
	(22, 2, 0, 'Georgian', '', 'pkg_ka-GE', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/ka-GE_details.xml', '', '', '', NULL),
	(23, 2, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/de-DE_details.xml', '', '', '', NULL),
	(24, 2, 0, 'German, Austria', '', 'pkg_de-AT', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/de-AT_details.xml', '', '', '', NULL),
	(25, 2, 0, 'German, Liechtenstein', '', 'pkg_de-LI', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/de-LI_details.xml', '', '', '', NULL),
	(26, 2, 0, 'German, Luxembourg', '', 'pkg_de-LU', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/de-LU_details.xml', '', '', '', NULL),
	(27, 2, 0, 'German, Switzerland', '', 'pkg_de-CH', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/de-CH_details.xml', '', '', '', NULL),
	(28, 2, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/el-GR_details.xml', '', '', '', NULL),
	(29, 2, 0, 'Hebrew', '', 'pkg_he-IL', 'package', '', 0, '6.1.4.3', '', 'https://update.joomla.org/language/details6/he-IL_details.xml', '', '', '', NULL),
	(30, 2, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/hu-HU_details.xml', '', '', '', NULL),
	(31, 2, 0, 'Irish', '', 'pkg_ga-IE', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/ga-IE_details.xml', '', '', '', NULL),
	(32, 2, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/it-IT_details.xml', '', '', '', NULL),
	(33, 2, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/ja-JP_details.xml', '', '', '', NULL),
	(34, 2, 0, 'Kazakh', '', 'pkg_kk-KZ', 'package', '', 0, '6.2.0.2', '', 'https://update.joomla.org/language/details6/kk-KZ_details.xml', '', '', '', NULL),
	(35, 2, 0, 'Laotian', '', 'pkg_lo-LA', 'package', '', 0, '6.0.4.1', '', 'https://update.joomla.org/language/details6/lo-LA_details.xml', '', '', '', NULL),
	(36, 2, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '6.0.3.1', '', 'https://update.joomla.org/language/details6/lv-LV_details.xml', '', '', '', NULL),
	(37, 2, 0, 'Lithuanian', '', 'pkg_lt-LT', 'package', '', 0, '6.1.3.2', '', 'https://update.joomla.org/language/details6/lt-LT_details.xml', '', '', '', NULL),
	(38, 2, 0, 'Malay', '', 'pkg_ms-MY', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/ms-MY_details.xml', '', '', '', NULL),
	(39, 2, 0, 'Norwegian Bokmål', '', 'pkg_nb-NO', 'package', '', 0, '6.1.4.1', '', 'https://update.joomla.org/language/details6/nb-NO_details.xml', '', '', '', NULL),
	(40, 2, 0, 'Persian Farsi', '', 'pkg_fa-IR', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/fa-IR_details.xml', '', '', '', NULL),
	(41, 2, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '6.0.0.1', '', 'https://update.joomla.org/language/details6/pl-PL_details.xml', '', '', '', NULL),
	(42, 2, 0, 'Portuguese, Brazil', '', 'pkg_pt-BR', 'package', '', 0, '6.0.3.1', '', 'https://update.joomla.org/language/details6/pt-BR_details.xml', '', '', '', NULL),
	(43, 2, 0, 'Portuguese, Portugal', '', 'pkg_pt-PT', 'package', '', 0, '6.1.0.1', '', 'https://update.joomla.org/language/details6/pt-PT_details.xml', '', '', '', NULL),
	(44, 2, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '6.0.0.1', '', 'https://update.joomla.org/language/details6/ro-RO_details.xml', '', '', '', NULL),
	(45, 2, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/ru-RU_details.xml', '', '', '', NULL),
	(46, 2, 0, 'Serbian, Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/sr-RS_details.xml', '', '', '', NULL),
	(47, 2, 0, 'Serbian, Latin', '', 'pkg_sr-YU', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/sr-YU_details.xml', '', '', '', NULL),
	(48, 2, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '6.2.1.1', '', 'https://update.joomla.org/language/details6/sk-SK_details.xml', '', '', '', NULL),
	(49, 2, 0, 'Slovenian', '', 'pkg_sl-SI', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/sl-SI_details.xml', '', '', '', NULL),
	(50, 2, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/es-ES_details.xml', '', '', '', NULL),
	(51, 2, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '6.2.0.4', '', 'https://update.joomla.org/language/details6/sv-SE_details.xml', '', '', '', NULL),
	(52, 2, 0, 'Tamil, India', '', 'pkg_ta-IN', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/ta-IN_details.xml', '', '', '', NULL),
	(53, 2, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '6.0.0.2', '', 'https://update.joomla.org/language/details6/th-TH_details.xml', '', '', '', NULL),
	(54, 2, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/tr-TR_details.xml', '', '', '', NULL),
	(55, 2, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '6.2.0.1', '', 'https://update.joomla.org/language/details6/uk-UA_details.xml', '', '', '', NULL),
	(56, 2, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '6.2.0.2', '', 'https://update.joomla.org/language/details6/cy-GB_details.xml', '', '', '', NULL),
	(57, 1, 247, 'Joomla! 6.2.0', 'Joomla! 6.2.0 Release', 'joomla', 'file', '', 0, '6.2.0', '', 'https://update.joomla.org/cms/', 'https://www.joomla.org/announcements/release-news/joomla-6-2-is-here.html', NULL, '', 0),
	(58, 4, 0, 'Kunena Language Pack', 'Language Pack for Kunena Forum', 'pkg_kunena_languages', 'package', '', 0, '7.1.1', '', 'https://update.kunena.org/7.1/pkg_kunena_languages.xml', '', '', '', NULL);

-- Dumping structure for table nts_kgeek.kgeek_update_sites
CREATE TABLE IF NOT EXISTS `kgeek_update_sites` (
  `update_site_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int DEFAULT '0',
  `last_check_timestamp` bigint DEFAULT '0',
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';

-- Dumping data for table nts_kgeek.kgeek_update_sites: ~3 rows (approximately)
DELETE FROM `kgeek_update_sites`;
INSERT INTO `kgeek_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`, `checked_out`, `checked_out_time`) VALUES
	(1, 'Joomla! Core', 'tuf', 'https://update.joomla.org/cms/', 1, 1795098633, '', NULL, NULL),
	(2, 'Accredited Joomla! Translations', 'collection', 'https://update.joomla.org/language/translationlist_6.xml', 1, 1795098596, '', NULL, NULL),
	(3, 'Joomla! Update Component', 'extension', 'https://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 1795098633, '', NULL, NULL),
	(4, 'Kunena 7.1 Update Site', 'collection', 'https://update.kunena.org/7.1/list.xml', 1, 1795100338, '', NULL, NULL),
	(5, '', 'extension', '', 1, 0, '', NULL, NULL);

-- Dumping structure for table nts_kgeek.kgeek_update_sites_extensions
CREATE TABLE IF NOT EXISTS `kgeek_update_sites_extensions` (
  `update_site_id` int NOT NULL DEFAULT '0',
  `extension_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';

-- Dumping data for table nts_kgeek.kgeek_update_sites_extensions: ~3 rows (approximately)
DELETE FROM `kgeek_update_sites_extensions`;
INSERT INTO `kgeek_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
	(1, 247),
	(2, 248),
	(3, 24),
	(4, 269),
	(5, 270);

-- Dumping structure for table nts_kgeek.kgeek_usergroups
CREATE TABLE IF NOT EXISTS `kgeek_usergroups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_usergroups: ~9 rows (approximately)
DELETE FROM `kgeek_usergroups`;
INSERT INTO `kgeek_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
	(1, 0, 1, 18, 'Public'),
	(2, 1, 8, 15, 'Registered'),
	(3, 2, 9, 14, 'Author'),
	(4, 3, 10, 13, 'Editor'),
	(5, 4, 11, 12, 'Publisher'),
	(6, 1, 4, 7, 'Manager'),
	(7, 6, 5, 6, 'Administrator'),
	(8, 1, 16, 17, 'Super Users'),
	(9, 1, 2, 3, 'Guest');

-- Dumping structure for table nts_kgeek.kgeek_users
CREATE TABLE IF NOT EXISTS `kgeek_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint NOT NULL DEFAULT '0',
  `sendEmail` tinyint DEFAULT '0',
  `registerDate` datetime NOT NULL,
  `lastvisitDate` datetime DEFAULT NULL,
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime DEFAULT NULL COMMENT 'Date of last password reset',
  `resetCount` int NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Backup Codes',
  `requireReset` tinyint NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  `authProvider` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Name of used authentication plugin',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  KEY `idx_name` (`name`(100)),
  KEY `idx_block` (`block`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=689 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_users: ~0 rows (approximately)
DELETE FROM `kgeek_users`;
INSERT INTO `kgeek_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`, `authProvider`) VALUES
	(688, 'Super User', 'admin', 'no-reply@gmail.com', '$2y$10$/TZivB1hxqP7HR3iOUgbYeewF/UY14WWZmWaPt4yYj4SnSylVqKt.', 0, 1, '2026-11-19 14:29:53', '2026-11-19 14:58:43', '0', '', NULL, 0, '', '', 0, '');

-- Dumping structure for table nts_kgeek.kgeek_user_keys
CREATE TABLE IF NOT EXISTS `kgeek_user_keys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_user_keys: ~0 rows (approximately)
DELETE FROM `kgeek_user_keys`;

-- Dumping structure for table nts_kgeek.kgeek_user_mfa
CREATE TABLE IF NOT EXISTS `kgeek_user_mfa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint NOT NULL DEFAULT '0',
  `options` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `last_used` datetime DEFAULT NULL,
  `tries` int NOT NULL DEFAULT '0',
  `last_try` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Multi-factor Authentication settings';

-- Dumping data for table nts_kgeek.kgeek_user_mfa: ~0 rows (approximately)
DELETE FROM `kgeek_user_mfa`;

-- Dumping structure for table nts_kgeek.kgeek_user_notes
CREATE TABLE IF NOT EXISTS `kgeek_user_notes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL,
  `modified_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL,
  `review_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_user_notes: ~0 rows (approximately)
DELETE FROM `kgeek_user_notes`;

-- Dumping structure for table nts_kgeek.kgeek_user_profiles
CREATE TABLE IF NOT EXISTS `kgeek_user_profiles` (
  `user_id` int NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';

-- Dumping data for table nts_kgeek.kgeek_user_profiles: ~0 rows (approximately)
DELETE FROM `kgeek_user_profiles`;
INSERT INTO `kgeek_user_profiles` (`user_id`, `profile_key`, `profile_value`, `ordering`) VALUES
	(688, 'guidedtour.id.12', '{"state":"skipped"}', 0);

-- Dumping structure for table nts_kgeek.kgeek_user_usergroup_map
CREATE TABLE IF NOT EXISTS `kgeek_user_usergroup_map` (
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_user_usergroup_map: ~0 rows (approximately)
DELETE FROM `kgeek_user_usergroup_map`;
INSERT INTO `kgeek_user_usergroup_map` (`user_id`, `group_id`) VALUES
	(688, 8);

-- Dumping structure for table nts_kgeek.kgeek_viewlevels
CREATE TABLE IF NOT EXISTS `kgeek_viewlevels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int NOT NULL DEFAULT '0',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_viewlevels: ~5 rows (approximately)
DELETE FROM `kgeek_viewlevels`;
INSERT INTO `kgeek_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
	(1, 'Public', 0, '[1]'),
	(2, 'Registered', 2, '[6,2,8]'),
	(3, 'Special', 3, '[6,3,8]'),
	(5, 'Guest', 1, '[9]'),
	(6, 'Super Users', 4, '[8]');

-- Dumping structure for table nts_kgeek.kgeek_webauthn_credentials
CREATE TABLE IF NOT EXISTS `kgeek_webauthn_credentials` (
  `id` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Credential ID',
  `user_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'User handle',
  `label` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Human readable label',
  `credential` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Credential source data, JSON format',
  PRIMARY KEY (`id`(100)),
  KEY `user_id` (`user_id`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_webauthn_credentials: ~0 rows (approximately)
DELETE FROM `kgeek_webauthn_credentials`;

-- Dumping structure for table nts_kgeek.kgeek_workflows
CREATE TABLE IF NOT EXISTS `kgeek_workflows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int DEFAULT '0',
  `published` tinyint NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL,
  `modified_by` int NOT NULL DEFAULT '0',
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_asset_id` (`asset_id`),
  KEY `idx_title` (`title`(191)),
  KEY `idx_extension` (`extension`),
  KEY `idx_default` (`default`),
  KEY `idx_created` (`created`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_modified` (`modified`),
  KEY `idx_modified_by` (`modified_by`),
  KEY `idx_checked_out` (`checked_out`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_workflows: ~1 rows (approximately)
DELETE FROM `kgeek_workflows`;
INSERT INTO `kgeek_workflows` (`id`, `asset_id`, `published`, `title`, `description`, `extension`, `default`, `ordering`, `created`, `created_by`, `modified`, `modified_by`, `checked_out_time`, `checked_out`) VALUES
	(1, 56, 1, 'COM_WORKFLOW_BASIC_WORKFLOW', '', 'com_content.article', 1, 1, '2026-11-19 14:29:52', 688, '2026-11-19 14:29:52', 688, NULL, NULL);

-- Dumping structure for table nts_kgeek.kgeek_workflow_associations
CREATE TABLE IF NOT EXISTS `kgeek_workflow_associations` (
  `item_id` int NOT NULL DEFAULT '0' COMMENT 'Extension table id value',
  `stage_id` int NOT NULL COMMENT 'Foreign Key to #__workflow_stages.id',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`item_id`,`extension`),
  KEY `idx_item_stage_extension` (`item_id`,`stage_id`,`extension`),
  KEY `idx_item_id` (`item_id`),
  KEY `idx_stage_id` (`stage_id`),
  KEY `idx_extension` (`extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_workflow_associations: ~0 rows (approximately)
DELETE FROM `kgeek_workflow_associations`;

-- Dumping structure for table nts_kgeek.kgeek_workflow_stages
CREATE TABLE IF NOT EXISTS `kgeek_workflow_stages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `workflow_id` int NOT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint NOT NULL DEFAULT '0',
  `position` text COLLATE utf8mb4_unicode_ci,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_workflow_id` (`workflow_id`),
  KEY `idx_checked_out` (`checked_out`),
  KEY `idx_title` (`title`(191)),
  KEY `idx_asset_id` (`asset_id`),
  KEY `idx_default` (`default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_workflow_stages: ~0 rows (approximately)
DELETE FROM `kgeek_workflow_stages`;
INSERT INTO `kgeek_workflow_stages` (`id`, `asset_id`, `ordering`, `workflow_id`, `published`, `title`, `description`, `default`, `position`, `checked_out_time`, `checked_out`) VALUES
	(1, 57, 1, 1, 1, 'COM_WORKFLOW_BASIC_STAGE', '', 1, NULL, NULL, NULL);

-- Dumping structure for table nts_kgeek.kgeek_workflow_transitions
CREATE TABLE IF NOT EXISTS `kgeek_workflow_transitions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `workflow_id` int NOT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_stage_id` int NOT NULL,
  `to_stage_id` int NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`(191)),
  KEY `idx_asset_id` (`asset_id`),
  KEY `idx_checked_out` (`checked_out`),
  KEY `idx_from_stage_id` (`from_stage_id`),
  KEY `idx_to_stage_id` (`to_stage_id`),
  KEY `idx_workflow_id` (`workflow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nts_kgeek.kgeek_workflow_transitions: ~7 rows (approximately)
DELETE FROM `kgeek_workflow_transitions`;
INSERT INTO `kgeek_workflow_transitions` (`id`, `asset_id`, `ordering`, `workflow_id`, `published`, `title`, `description`, `from_stage_id`, `to_stage_id`, `options`, `checked_out_time`, `checked_out`) VALUES
	(1, 58, 1, 1, 1, 'UNPUBLISH', '', -1, 1, '{"publishing":"0"}', NULL, NULL),
	(2, 59, 2, 1, 1, 'PUBLISH', '', -1, 1, '{"publishing":"1"}', NULL, NULL),
	(3, 60, 3, 1, 1, 'TRASH', '', -1, 1, '{"publishing":"-2"}', NULL, NULL),
	(4, 61, 4, 1, 1, 'ARCHIVE', '', -1, 1, '{"publishing":"2"}', NULL, NULL),
	(5, 62, 5, 1, 1, 'FEATURE', '', -1, 1, '{"featuring":"1"}', NULL, NULL),
	(6, 63, 6, 1, 1, 'UNFEATURE', '', -1, 1, '{"featuring":"0"}', NULL, NULL),
	(7, 64, 7, 1, 1, 'PUBLISH_AND_FEATURE', '', -1, 1, '{"publishing":"1","featuring":"1"}', NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
