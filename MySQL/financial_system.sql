CREATE DATABASE IF NOT EXISTS `financial_system` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;

USE `financial_system`;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `financial_registers_enterprises`;
DROP TABLE IF EXISTS `financial_groups_enterprises`;
DROP TABLE IF EXISTS `financial_users_modal`;
DROP TABLE IF EXISTS `financial_users_groups`;
DROP TABLE IF EXISTS `financial_users_enterprises`;
DROP TABLE IF EXISTS `financial_registers`;
DROP TABLE IF EXISTS `financial_pins_code_access`;
DROP TABLE IF EXISTS `financial_administrators_users`;
DROP TABLE IF EXISTS `financial_modal`;
DROP TABLE IF EXISTS `financial_groups`;
DROP TABLE IF EXISTS `financial_enterprises`;
DROP TABLE IF EXISTS `financial_users`;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `financial_users` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`email` varchar(255) COLLATE latin1_general_ci NOT NULL,
	`active` tinyint(1) DEFAULT '1' COMMENT '1=active, 0=inactive',
	`created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	UNIQUE KEY `email` (`email`),
	KEY `idx_financial_users_active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=1729 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `financial_enterprises` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`cnpj` varchar(20) COLLATE latin1_general_ci NOT NULL,
	`company_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
	`zip_code` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
	`road` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
	`number` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
	`complement` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
	`neighborhood` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
	`cidade` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
	`estado` varchar(2) COLLATE latin1_general_ci DEFAULT NULL,
	`created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=491 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `financial_groups` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`group_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
	`description` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
	`created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	UNIQUE KEY `group_name` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `financial_modal` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`acronym` varchar(10) COLLATE latin1_general_ci NOT NULL,
	`description` varchar(100) COLLATE latin1_general_ci NOT NULL,
	`created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	UNIQUE KEY `acronym` (`acronym`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `financial_administrators_users` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`email` varchar(255) COLLATE latin1_general_ci NOT NULL,
	`created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `financial_pins_code_access` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`pin` int(11) NOT NULL,
	`email` varchar(255) COLLATE latin1_general_ci NOT NULL,
	`created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	KEY `idx_financial_pins_code_access_email` (`email`),
	KEY `idx_financial_pins_code_access_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=866 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `financial_registers` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`created_by_user_id` int(11) DEFAULT NULL,
	`invoiced` tinyint(1) DEFAULT '0',
	`observations` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
	`created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	KEY `idx_financial_registers_created_by_user_id` (`created_by_user_id`),
	KEY `idx_financial_registers_invoiced` (`invoiced`),
	CONSTRAINT `financial_registers_ibfk_1` FOREIGN KEY (`created_by_user_id`) REFERENCES `financial_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=662 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `financial_users_enterprises` (
	`user_id` int(11) NOT NULL,
	`cnpj_id` int(11) NOT NULL,
	PRIMARY KEY (`user_id`,`cnpj_id`),
	KEY `idx_financial_users_enterprises_user_id` (`user_id`),
	KEY `idx_financial_users_enterprises_cnpj_id` (`cnpj_id`),
	CONSTRAINT `financial_users_enterprises_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `financial_users` (`id`) ON DELETE CASCADE,
	CONSTRAINT `financial_users_enterprises_ibfk_2` FOREIGN KEY (`cnpj_id`) REFERENCES `financial_enterprises` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `financial_users_groups` (
	`user_id` int(11) NOT NULL,
	`group_id` int(11) NOT NULL,
	PRIMARY KEY (`user_id`,`group_id`),
	KEY `idx_financial_users_groups_user_id` (`user_id`),
	KEY `idx_financial_users_groups_group_id` (`group_id`),
	CONSTRAINT `financial_users_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `financial_users` (`id`) ON DELETE CASCADE,
	CONSTRAINT `financial_users_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `financial_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `financial_users_modal` (
	`user_id` int(11) NOT NULL,
	`modal_id` int(11) NOT NULL,
	`active` tinyint(1) DEFAULT '1' COMMENT '1=active, 0=inactive',
	`created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`user_id`,`modal_id`),
	KEY `idx_financial_users_modal_user_id` (`user_id`),
	KEY `idx_financial_users_modal_modal_id` (`modal_id`),
	KEY `idx_financial_users_modal_active` (`active`),
	CONSTRAINT `financial_users_modal_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `financial_users` (`id`) ON DELETE CASCADE,
	CONSTRAINT `financial_users_modal_ibfk_2` FOREIGN KEY (`modal_id`) REFERENCES `financial_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `financial_groups_enterprises` (
	`group_id` int(11) NOT NULL,
	`cnpj_id` int(11) NOT NULL,
	PRIMARY KEY (`group_id`,`cnpj_id`),
	KEY `idx_financial_groups_enterprises_cnpj_id` (`cnpj_id`),
	CONSTRAINT `financial_groups_enterprises_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `financial_groups` (`id`) ON DELETE CASCADE,
	CONSTRAINT `financial_groups_enterprises_ibfk_2` FOREIGN KEY (`cnpj_id`) REFERENCES `financial_enterprises` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `financial_registers_enterprises` (
	`register_id` int(11) NOT NULL,
	`cnpj_id` int(11) NOT NULL,
	PRIMARY KEY (`register_id`,`cnpj_id`),
	KEY `idx_financial_registers_enterprises_cnpj_id` (`cnpj_id`),
	CONSTRAINT `financial_registers_enterprises_ibfk_1` FOREIGN KEY (`register_id`) REFERENCES `financial_registers` (`id`) ON DELETE CASCADE,
	CONSTRAINT `financial_registers_enterprises_ibfk_2` FOREIGN KEY (`cnpj_id`) REFERENCES `financial_enterprises` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;