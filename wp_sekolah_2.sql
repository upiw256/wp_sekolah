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


-- Dumping database structure for db_cms_sekolahku
DROP DATABASE IF EXISTS `db_cms_sekolahku`;
CREATE DATABASE IF NOT EXISTS `db_cms_sekolahku` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_cms_sekolahku`;

-- Dumping structure for table db_cms_sekolahku.academic_years
DROP TABLE IF EXISTS `academic_years`;
CREATE TABLE IF NOT EXISTS `academic_years` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `academic_year` varchar(9) NOT NULL COMMENT 'Tahun Pelajaran',
  `semester` enum('odd','even') NOT NULL DEFAULT 'odd' COMMENT 'odd = Ganjil, even = Genap',
  `current_semester` enum('true','false') NOT NULL DEFAULT 'false',
  `admission_semester` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `academic_year` (`academic_year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.academic_years: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.achievements
DROP TABLE IF EXISTS `achievements`;
CREATE TABLE IF NOT EXISTS `achievements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint DEFAULT '0',
  `achievement_description` varchar(255) NOT NULL,
  `achievement_type` bigint DEFAULT '0',
  `achievement_level` smallint NOT NULL DEFAULT '0',
  `achievement_year` year NOT NULL,
  `achievement_organizer` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  KEY `achievements_student_id__idx` (`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.achievements: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.admission_phases
DROP TABLE IF EXISTS `admission_phases`;
CREATE TABLE IF NOT EXISTS `admission_phases` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `academic_year_id` bigint DEFAULT '0' COMMENT 'Tahun Pelajaran',
  `phase_name` varchar(255) NOT NULL COMMENT 'Gelombang Pendaftaran',
  `phase_start_date` date DEFAULT NULL COMMENT 'Tanggal Mulai',
  `phase_end_date` date DEFAULT NULL COMMENT 'Tanggal Selesai',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_field` (`academic_year_id`,`phase_name`),
  KEY `admission_phases_academic_year_id__idx` (`academic_year_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.admission_phases: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.admission_quotas
DROP TABLE IF EXISTS `admission_quotas`;
CREATE TABLE IF NOT EXISTS `admission_quotas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `academic_year_id` bigint DEFAULT '0' COMMENT 'Tahun Pelajaran',
  `admission_type_id` bigint DEFAULT '0' COMMENT 'Jalur Pendaftaran',
  `major_id` bigint DEFAULT '0' COMMENT 'Program Keahlian',
  `quota` smallint NOT NULL DEFAULT '0' COMMENT 'Kuota Pendaftaran',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_field` (`academic_year_id`,`admission_type_id`,`major_id`),
  KEY `admission_quotas_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  KEY `admission_quotas_admission_type_id__idx` (`admission_type_id`) USING BTREE,
  KEY `admission_quotas_major_id__idx` (`major_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.admission_quotas: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.albums
DROP TABLE IF EXISTS `albums`;
CREATE TABLE IF NOT EXISTS `albums` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `album_title` varchar(255) NOT NULL,
  `album_description` varchar(255) DEFAULT NULL,
  `album_slug` varchar(255) DEFAULT NULL,
  `album_cover` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `album_title` (`album_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.albums: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.answers
DROP TABLE IF EXISTS `answers`;
CREATE TABLE IF NOT EXISTS `answers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question_id` bigint DEFAULT '0',
  `answer` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_field` (`question_id`,`answer`),
  KEY `answers_question_id__idx` (`question_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.answers: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `category_slug` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `category_type` enum('post','file') DEFAULT 'post',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_field` (`category_name`,`category_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.categories: ~2 rows (approximately)
REPLACE INTO `categories` (`id`, `category_name`, `category_slug`, `category_description`, `category_type`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
	(1, 'Uncategorized', 'uncategorized', 'Uncategorized', 'post', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(2, 'Uncategorized', 'uncategorized', 'Uncategorized', 'file', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false');

-- Dumping structure for table db_cms_sekolahku.class_groups
DROP TABLE IF EXISTS `class_groups`;
CREATE TABLE IF NOT EXISTS `class_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_group` varchar(100) DEFAULT NULL,
  `sub_class_group` varchar(100) DEFAULT NULL,
  `major_id` bigint DEFAULT '0' COMMENT 'Program Keahlian',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_field` (`class_group`,`sub_class_group`,`major_id`),
  KEY `class_groups_major_id__idx` (`major_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.class_groups: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.class_group_settings
DROP TABLE IF EXISTS `class_group_settings`;
CREATE TABLE IF NOT EXISTS `class_group_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `academic_year_id` bigint DEFAULT '0' COMMENT 'FK dari academic_years',
  `class_group_id` bigint DEFAULT '0' COMMENT 'Kelas, FK dari class_groups',
  `employee_id` bigint DEFAULT '0' COMMENT 'Wali Kelas, FK dari employees',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_field` (`academic_year_id`,`class_group_id`),
  KEY `class_group_settings_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  KEY `class_group_settings_class_group_id__idx` (`class_group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.class_group_settings: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.class_group_students
DROP TABLE IF EXISTS `class_group_students`;
CREATE TABLE IF NOT EXISTS `class_group_students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_group_setting_id` bigint DEFAULT '0',
  `student_id` bigint DEFAULT '0',
  `is_class_manager` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Ketua Kelas ?',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_field` (`class_group_setting_id`,`student_id`),
  KEY `class_group_students_class_group_setting_id__idx` (`class_group_setting_id`) USING BTREE,
  KEY `class_group_students_student_id__idx` (`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.class_group_students: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.comments
DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_id` bigint DEFAULT '0',
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) DEFAULT NULL,
  `comment_url` varchar(255) DEFAULT NULL,
  `comment_ip_address` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_subject` varchar(255) DEFAULT NULL,
  `comment_reply` text,
  `comment_status` enum('approved','unapproved','spam') DEFAULT 'approved',
  `comment_agent` varchar(255) DEFAULT NULL,
  `comment_parent_id` varchar(255) DEFAULT NULL,
  `comment_type` enum('post','message') DEFAULT 'post',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  KEY `comments_comment_post_id__idx` (`comment_post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.comments: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.employees
DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `assignment_letter_number` varchar(255) DEFAULT NULL COMMENT 'Nomor Surat Tugas',
  `assignment_letter_date` date DEFAULT NULL COMMENT 'Tanggal Surat Tugas',
  `assignment_start_date` date DEFAULT NULL COMMENT 'TMT Tugas',
  `parent_school_status` enum('true','false') NOT NULL DEFAULT 'true' COMMENT 'Status Sekolah Induk',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `nik` varchar(50) DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `mother_name` varchar(150) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Rukun Tetangga',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Rukun Warga',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kota/Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `religion_id` bigint DEFAULT '0',
  `marriage_status_id` bigint DEFAULT '0',
  `spouse_name` varchar(255) DEFAULT NULL COMMENT 'Nama Pasangan : Suami / Istri',
  `spouse_employment_id` bigint DEFAULT '0' COMMENT 'Pekerjaan Pasangan : Suami / Istri',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `npwp` varchar(100) DEFAULT NULL,
  `employment_status_id` bigint DEFAULT '0' COMMENT 'Status Kepegawaian',
  `nip` varchar(100) DEFAULT NULL,
  `niy` varchar(100) DEFAULT NULL COMMENT 'NIY/NIGK',
  `nuptk` varchar(100) DEFAULT NULL,
  `employment_type_id` bigint DEFAULT '0' COMMENT 'Jenis Guru dan Tenaga Kependidikan (GTK)',
  `decree_appointment` varchar(255) DEFAULT NULL COMMENT 'SK Pengangkatan',
  `appointment_start_date` date DEFAULT NULL COMMENT 'TMT Pengangkatan',
  `institution_lifter_id` bigint DEFAULT '0' COMMENT 'Lembaga Pengangkat',
  `decree_cpns` varchar(100) DEFAULT NULL COMMENT 'SK CPNS',
  `pns_start_date` date DEFAULT NULL COMMENT 'TMT CPNS',
  `rank_id` bigint DEFAULT '0' COMMENT 'Pangkat/Golongan',
  `salary_source_id` bigint DEFAULT '0' COMMENT 'Sumber Gaji',
  `headmaster_license` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Punya Lisensi Kepala Sekolah?',
  `laboratory_skill_id` bigint DEFAULT '0' COMMENT 'Keahlian Lab oratorium',
  `special_need_id` bigint DEFAULT '0' COMMENT 'Mampu Menangani Kebutuhan Khusus',
  `braille_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Braile ?',
  `sign_language_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Bahasa Isyarat ?',
  `phone` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  KEY `employees_nik__idx` (`nik`) USING BTREE,
  KEY `employees_full_name__idx` (`full_name`) USING BTREE,
  KEY `employees_email__idx` (`email`) USING BTREE,
  KEY `employees_religion_id__idx` (`religion_id`) USING BTREE,
  KEY `employees_marriage_status_id__idx` (`marriage_status_id`) USING BTREE,
  KEY `employees_spouse_employment_id__idx` (`spouse_employment_id`) USING BTREE,
  KEY `employees_employment_status_id__idx` (`employment_status_id`) USING BTREE,
  KEY `employees_employment_type_id__idx` (`employment_type_id`) USING BTREE,
  KEY `employees_institution_lifter_id__idx` (`institution_lifter_id`) USING BTREE,
  KEY `employees_rank_id__idx` (`rank_id`) USING BTREE,
  KEY `employees_salary_source_id__idx` (`salary_source_id`) USING BTREE,
  KEY `employees_laboratory_skill_id__idx` (`laboratory_skill_id`) USING BTREE,
  KEY `employees_special_need_id__idx` (`special_need_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.employees: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.files
DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_title` varchar(255) DEFAULT NULL,
  `file_description` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_category_id` bigint DEFAULT '0',
  `file_path` varchar(255) DEFAULT NULL,
  `file_ext` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `file_visibility` enum('public','private') DEFAULT 'public',
  `file_counter` bigint DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  KEY `files_file_category_id__idx` (`file_category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.files: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.image_sliders
DROP TABLE IF EXISTS `image_sliders`;
CREATE TABLE IF NOT EXISTS `image_sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `caption` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.image_sliders: ~2 rows (approximately)
REPLACE INTO `image_sliders` (`id`, `caption`, `image`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
	(1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '1.png', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '2.png', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false');

-- Dumping structure for table db_cms_sekolahku.links
DROP TABLE IF EXISTS `links`;
CREATE TABLE IF NOT EXISTS `links` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `link_title` varchar(255) NOT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_target` enum('_blank','_self','_parent','_top') DEFAULT '_blank',
  `link_image` varchar(100) DEFAULT NULL,
  `link_type` enum('link','banner') DEFAULT 'link',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_field` (`link_url`,`link_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.links: ~2 rows (approximately)
REPLACE INTO `links` (`id`, `link_title`, `link_url`, `link_target`, `link_image`, `link_type`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
	(1, 'CMS Sekolahku', 'https://sekolahku.web.id', '_blank', NULL, 'link', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(2, 'CMS Sekolahku', 'https://sekolahku.web.id', '_blank', '1.png', 'banner', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false');

-- Dumping structure for table db_cms_sekolahku.login_attempts
DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `counter` int unsigned NOT NULL DEFAULT '1',
  `datetime` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.login_attempts: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.majors
DROP TABLE IF EXISTS `majors`;
CREATE TABLE IF NOT EXISTS `majors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `major_name` varchar(255) DEFAULT NULL COMMENT 'Program Keahlian / Jurusan',
  `major_short_name` varchar(255) DEFAULT NULL COMMENT 'Nama Singkat',
  `is_active` enum('true','false') DEFAULT 'true',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `major_name` (`major_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.majors: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.menus
DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(150) NOT NULL,
  `menu_url` varchar(150) NOT NULL,
  `menu_target` enum('_blank','_self','_parent','_top') DEFAULT '_self',
  `menu_type` varchar(100) NOT NULL DEFAULT 'pages',
  `menu_parent_id` bigint DEFAULT '0',
  `menu_position` bigint DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.menus: ~18 rows (approximately)
REPLACE INTO `menus` (`id`, `menu_title`, `menu_url`, `menu_target`, `menu_type`, `menu_parent_id`, `menu_position`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
	(1, 'Hubungi Kami', 'hubungi-kami', '_self', 'modules', 0, 7, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(2, 'Galeri Foto', 'galeri-foto', '_self', 'modules', 9, 1, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(3, 'Galeri Video', 'galeri-video', '_self', 'modules', 9, 2, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(4, 'Formulir PPDB', 'formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 1, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(5, 'Hasil Seleksi', 'hasil-seleksi-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 2, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(6, 'Cetak Formulir', 'cetak-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 3, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(7, 'Download Formulir', 'download-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 4, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(8, 'PPDB 2022', '#', '', 'links', 0, 5, '2023-01-15 21:23:22', '2023-01-26 15:12:29', '2023-01-26 22:12:29', NULL, 0, 1, 1, 0, 'true'),
	(9, 'Galeri', '#', '_self', 'links', 0, 6, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(10, 'Kategori', '#', '_self', 'links', 0, 2, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(11, 'Uncategorized', 'kategori/uncategorized', '_self', 'post_categories', 10, 1, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(12, 'Direktori', '#', '', 'links', 0, 3, '2023-01-15 21:23:22', '2023-01-26 15:23:46', '2023-01-26 22:23:46', NULL, 0, 1, 1, 0, 'true'),
	(13, 'Direktori Alumni', 'direktori-alumni', '_self', 'modules', 12, 1, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(14, 'Direktori Peserta Didik', 'direktori-peserta-didik', '_self', 'modules', 12, 3, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(15, 'Direktori Guru dan Tenaga Kependidikan', 'direktori-guru-dan-tenaga-kependidikan', '_self', 'modules', 12, 2, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(16, 'Pendaftaran Alumni', 'pendaftaran-alumni', '', 'modules', 0, 4, '2023-01-15 21:23:22', '2023-01-26 15:24:13', '2023-01-26 22:24:13', NULL, 0, 1, 1, 0, 'true'),
	(17, 'Profil', 'read/2/profil', '_self', 'pages', 0, 1, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(18, 'Visi dan Misi', 'read/3/visi-dan-misi', '_self', 'pages', 0, 1, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false');

-- Dumping structure for table db_cms_sekolahku.modules
DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) NOT NULL,
  `module_description` varchar(255) DEFAULT NULL,
  `module_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_name` (`module_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.modules: ~10 rows (approximately)
REPLACE INTO `modules` (`id`, `module_name`, `module_description`, `module_url`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
	(1, 'Pengguna', 'Pengguna', 'users', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(2, 'PPDB / PMB', 'PPDB / PMB', 'admission', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(3, 'Tampilan', 'Tampilan', 'appearance', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(4, 'Blog', 'Blog', 'blog', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(5, 'GTK / Staff / Dosen', 'GTK / Staff / Dosen', 'employees', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(6, 'Media', 'Media', 'media', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(7, 'Plugins', 'Plugins', 'plugins', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(8, 'Data Referensi', 'Data Referensi', 'reference', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(9, 'Pengaturan', 'Pengaturan', 'settings', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(10, 'Akademik', 'Akademik', 'academic', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false');

-- Dumping structure for table db_cms_sekolahku.options
DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_group` varchar(100) NOT NULL,
  `option_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_field` (`option_group`,`option_name`),
  KEY `options_option_group__idx` (`option_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.options: ~169 rows (approximately)
REPLACE INTO `options` (`id`, `option_group`, `option_name`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
	(1, 'student_status', 'Aktif', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(2, 'student_status', 'Lulus', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(3, 'student_status', 'Mutasi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(4, 'student_status', 'Dikeluarkan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(5, 'student_status', 'Mengundurkan Diri', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(6, 'student_status', 'Putus Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(7, 'student_status', 'Meninggal', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(8, 'student_status', 'Hilang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(9, 'student_status', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(10, 'employments', 'Tidak bekerja', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(11, 'employments', 'Nelayan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(12, 'employments', 'Petani', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(13, 'employments', 'Peternak', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(14, 'employments', 'PNS/TNI/POLRI', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(15, 'employments', 'Karyawan Swasta', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(16, 'employments', 'Pedagang Kecil', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(17, 'employments', 'Pedagang Besar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(18, 'employments', 'Wiraswasta', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(19, 'employments', 'Wirausaha', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(20, 'employments', 'Buruh', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(21, 'employments', 'Pensiunan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(22, 'employments', 'Lain-lain', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(23, 'special_needs', 'Tidak', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(24, 'special_needs', 'Tuna Netra', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(25, 'special_needs', 'Tuna Rungu', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(26, 'special_needs', 'Tuna Grahita ringan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(27, 'special_needs', 'Tuna Grahita Sedang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(28, 'special_needs', 'Tuna Daksa Ringan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(29, 'special_needs', 'Tuna Daksa Sedang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(30, 'special_needs', 'Tuna Laras', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(31, 'special_needs', 'Tuna Wicara', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(32, 'special_needs', 'Tuna ganda', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(33, 'special_needs', 'Hiper aktif', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(34, 'special_needs', 'Cerdas Istimewa', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(35, 'special_needs', 'Bakat Istimewa', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(36, 'special_needs', 'Kesulitan Belajar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(37, 'special_needs', 'Narkoba', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(38, 'special_needs', 'Indigo', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(39, 'special_needs', 'Down Sindrome', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(40, 'special_needs', 'Autis', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(41, 'special_needs', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(42, 'educations', 'Tidak sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(43, 'educations', 'Putus SD', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(44, 'educations', 'SD Sederajat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(45, 'educations', 'SMP Sederajat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(46, 'educations', 'SMA Sederajat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(47, 'educations', 'D1', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(48, 'educations', 'D2', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(49, 'educations', 'D3', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(50, 'educations', 'D4/S1', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(51, 'educations', 'S2', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(52, 'educations', 'S3', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(53, 'scholarships', 'Anak berprestasi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(54, 'scholarships', 'Anak Miskin', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(55, 'scholarships', 'Pendidikan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(56, 'scholarships', 'Unggulan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(57, 'scholarships', 'Lain-lain', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(58, 'achievement_types', 'Sains', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(59, 'achievement_types', 'Seni', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(60, 'achievement_types', 'Olahraga', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(61, 'achievement_types', 'Lain-lain', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(62, 'achievement_levels', 'Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(63, 'achievement_levels', 'Kecamatan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(64, 'achievement_levels', 'Kota/Kabupaten', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(65, 'achievement_levels', 'Propinsi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(66, 'achievement_levels', 'Nasional', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(67, 'achievement_levels', 'Internasional', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(68, 'monthly_incomes', 'Kurang dari 500,000', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(69, 'monthly_incomes', '500.000 - 999.9999', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(70, 'monthly_incomes', '1 Juta - 1.999.999', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(71, 'monthly_incomes', '2 Juta - 4.999.999', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(72, 'monthly_incomes', '5 Juta - 20 Juta', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(73, 'monthly_incomes', 'Lebih dari 20 Juta', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(74, 'residences', 'Bersama orang tua', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(75, 'residences', 'Wali', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(76, 'residences', 'Kos', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(77, 'residences', 'Asrama', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(78, 'residences', 'Panti Asuhan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(79, 'residences', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(80, 'transportations', 'Jalan kaki', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(81, 'transportations', 'Kendaraan pribadi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(82, 'transportations', 'Kendaraan Umum / angkot / Pete-pete', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(83, 'transportations', 'Jemputan Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(84, 'transportations', 'Kereta Api', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(85, 'transportations', 'Ojek', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(86, 'transportations', 'Andong / Bendi / Sado / Dokar / Delman / Beca', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(87, 'transportations', 'Perahu penyebrangan / Rakit / Getek', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(88, 'transportations', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(89, 'religions', 'Islam', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(90, 'religions', 'Kristen / protestan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(91, 'religions', 'Katholik', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(92, 'religions', 'Hindu', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(93, 'religions', 'Budha', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(94, 'religions', 'Khong Hu Chu', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(95, 'religions', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(96, 'school_levels', '1 - Sekolah Dasar (SD) / Sederajat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(97, 'school_levels', '2 - Sekolah Menengah Pertama (SMP) / Sederajat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(98, 'school_levels', '3 - Sekolah Menengah Atas (SMA) / Aliyah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(99, 'school_levels', '4 - Sekolah Menengah Kejuruan (SMK)', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(100, 'school_levels', '5 - Universitas', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(101, 'school_levels', '6 - Sekolah Tinggi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(102, 'school_levels', '7 - Politeknik', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(103, 'marriage_status', 'Kawin', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(104, 'marriage_status', 'Belum Kawin', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(105, 'marriage_status', 'Berpisah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(106, 'institution_lifters', 'Pemerintah Pusat', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(107, 'institution_lifters', 'Pemerintah Provinsi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(108, 'institution_lifters', 'Pemerintah Kab/Kota', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(109, 'institution_lifters', 'Ketua yayasan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(110, 'institution_lifters', 'Kepala Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(111, 'institution_lifters', 'Komite Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(112, 'institution_lifters', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(113, 'employment_status', 'PNS ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(114, 'employment_status', 'PNS Diperbantukan ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(115, 'employment_status', 'PNS DEPAG ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(116, 'employment_status', 'GTY/PTY ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(117, 'employment_status', 'GTT/PTT Provinsi ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(118, 'employment_status', 'GTT/PTT Kota/Kabupaten', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(119, 'employment_status', 'Guru Bantu Pusat ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(120, 'employment_status', 'Guru Honor Sekolah ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(121, 'employment_status', 'Tenaga Honor Sekolah ', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(122, 'employment_status', 'CPNS', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(123, 'employment_status', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(124, 'employment_types', 'Guru Kelas', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(125, 'employment_types', 'Guru Mata Pelajaran', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(126, 'employment_types', 'Guru BK', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(127, 'employment_types', 'Guru Inklusi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(128, 'employment_types', 'Tenaga Administrasi Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(129, 'employment_types', 'Guru Pendamping', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(130, 'employment_types', 'Guru Magang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(131, 'employment_types', 'Guru TIK', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(132, 'employment_types', 'Laboran', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(133, 'employment_types', 'Pustakawan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(134, 'employment_types', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(135, 'ranks', 'I/A', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(136, 'ranks', 'I/B', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(137, 'ranks', 'I/C', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(138, 'ranks', 'I/D', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(139, 'ranks', 'II/A', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(140, 'ranks', 'II/B', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(141, 'ranks', 'II/C', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(142, 'ranks', 'II/D', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(143, 'ranks', 'III/A', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(144, 'ranks', 'III/B', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(145, 'ranks', 'III/C', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(146, 'ranks', 'III/D', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(147, 'ranks', 'IV/A', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(148, 'ranks', 'IV/B', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(149, 'ranks', 'IV/C', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(150, 'ranks', 'IV/D', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(151, 'ranks', 'IV/E', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(152, 'salary_sources', 'APBN', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(153, 'salary_sources', 'APBD Provinsi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(154, 'salary_sources', 'APBD Kab/Kota', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(155, 'salary_sources', 'Yayasan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(156, 'salary_sources', 'Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(157, 'salary_sources', 'Lembaga Donor', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(158, 'salary_sources', 'Lainnya', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(159, 'laboratory_skills', 'Lab IPA', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(160, 'laboratory_skills', 'Lab Fisika', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(161, 'laboratory_skills', 'Lab Biologi', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(162, 'laboratory_skills', 'Lab Kimia', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(163, 'laboratory_skills', 'Lab Bahasa', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(164, 'laboratory_skills', 'Lab Komputer', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(165, 'laboratory_skills', 'Teknik Bangunan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(166, 'laboratory_skills', 'Teknik Survei & Pemetaan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(167, 'laboratory_skills', 'Teknik Ketenagakerjaan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(168, 'laboratory_skills', 'Teknik Pendinginan & Tata Udara', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(169, 'laboratory_skills', 'Teknik Mesin', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false');

-- Dumping structure for table db_cms_sekolahku.photos
DROP TABLE IF EXISTS `photos`;
CREATE TABLE IF NOT EXISTS `photos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `photo_album_id` bigint DEFAULT '0',
  `photo_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  KEY `photos_photo_album_id__idx` (`photo_album_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.photos: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.pollings
DROP TABLE IF EXISTS `pollings`;
CREATE TABLE IF NOT EXISTS `pollings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `answer_id` bigint DEFAULT '0',
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  KEY `pollings_answer_id__idx` (`answer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.pollings: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.posts
DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_title` varchar(255) DEFAULT NULL,
  `post_content` longtext,
  `post_image` varchar(100) DEFAULT NULL,
  `post_author` bigint DEFAULT '0',
  `post_categories` varchar(255) DEFAULT NULL,
  `post_type` varchar(50) NOT NULL DEFAULT 'post',
  `post_status` enum('publish','draft') DEFAULT 'draft',
  `post_visibility` enum('public','private') DEFAULT 'public',
  `post_comment_status` enum('open','close') DEFAULT 'close',
  `post_slug` varchar(255) DEFAULT NULL,
  `post_tags` varchar(255) DEFAULT NULL,
  `post_counter` bigint DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  KEY `posts_post_author__idx` (`post_author`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.posts: ~8 rows (approximately)
REPLACE INTO `posts` (`id`, `post_title`, `post_content`, `post_image`, `post_author`, `post_categories`, `post_type`, `post_status`, `post_visibility`, `post_comment_status`, `post_slug`, `post_tags`, `post_counter`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
	(1, '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'headmaster_photo.png', 0, '', 'opening_speech', 'publish', 'public', 'open', '', '', 0, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(2, 'Profil', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, 1, '+1+', 'page', 'publish', 'public', 'open', 'profil', 'berita, pengumuman, sekilas-info', 11, '2023-01-15 21:23:22', '2023-01-26 15:31:41', NULL, NULL, 0, 0, 0, 0, 'false'),
	(3, 'Visi dan Misi', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, 1, '+1+', 'page', 'publish', 'public', 'open', 'visi-dan-misi', 'berita, pengumuman, sekilas-info', 6, '2023-01-15 21:23:22', '2023-01-27 12:39:27', NULL, NULL, 0, 0, 0, 0, 'false'),
	(4, 'Sample Post 1', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-1', 'berita, pengumuman, sekilas-info', 6, '2023-01-15 21:23:22', '2023-01-26 15:31:45', NULL, NULL, 0, 0, 0, 0, 'false'),
	(5, 'Sample Post 2', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-2', 'berita, pengumuman, sekilas-info', 1, '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(6, 'Sample Post 3', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-3', 'berita, pengumuman, sekilas-info', 1, '2023-01-15 21:23:22', '2023-01-26 15:10:33', '2023-01-26 22:10:33', NULL, 0, 0, 1, 0, 'true'),
	(7, 'Sample Post 4', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-4', 'berita, pengumuman, sekilas-info', 1, '2023-01-15 21:23:22', '2023-01-26 15:10:33', '2023-01-26 22:10:33', NULL, 0, 0, 1, 0, 'true'),
	(8, 'Sample Post 5', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-5', 'berita, pengumuman, sekilas-info', 1, '2023-01-15 21:23:22', '2023-01-26 15:10:33', '2023-01-26 22:10:33', NULL, 0, 0, 1, 0, 'true');

-- Dumping structure for table db_cms_sekolahku.questions
DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `question` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.questions: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.quotes
DROP TABLE IF EXISTS `quotes`;
CREATE TABLE IF NOT EXISTS `quotes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quote` varchar(255) DEFAULT NULL,
  `quote_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_field` (`quote`,`quote_by`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.quotes: ~3 rows (approximately)
REPLACE INTO `quotes` (`id`, `quote`, `quote_by`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
	(1, 'Pendidikan merupakan tiket untuk masa depan. Hari esok untuk orang-orang yang telah mempersiapkan dirinya hari ini', 'Anonim', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 1, 0, 0, 0, 'false'),
	(2, 'Agama tanpa ilmu pengetahuan adalah buta. Dan ilmu pengetahuan tanpa agama adalah lumpuh', 'Anonim', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 1, 0, 0, 0, 'false'),
	(3, 'Hiduplah seakan-akan kau akan mati besok. Belajarlah seakan-akan kau akan hidup selamanya', 'Anonim', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 1, 0, 0, 0, 'false');

-- Dumping structure for table db_cms_sekolahku.scholarships
DROP TABLE IF EXISTS `scholarships`;
CREATE TABLE IF NOT EXISTS `scholarships` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint DEFAULT '0',
  `scholarship_type` bigint DEFAULT '0',
  `scholarship_description` varchar(255) NOT NULL,
  `scholarship_start_year` year NOT NULL,
  `scholarship_end_year` year NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  KEY `scholarships_student_id__idx` (`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.scholarships: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.settings
DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `setting_group` varchar(100) NOT NULL,
  `setting_variable` varchar(255) DEFAULT NULL,
  `setting_value` text,
  `setting_default_value` text,
  `setting_access_group` varchar(255) DEFAULT NULL,
  `setting_description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_field` (`setting_group`,`setting_variable`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.settings: ~93 rows (approximately)
REPLACE INTO `settings` (`id`, `setting_group`, `setting_variable`, `setting_value`, `setting_default_value`, `setting_access_group`, `setting_description`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
	(1, 'general', 'site_maintenance', NULL, 'false', 'public', 'Pemeliharaan situs', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(2, 'general', 'site_maintenance_end_date', NULL, '2022-01-01', 'public', 'Tanggal Berakhir Pemeliharaan Situs', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(3, 'general', 'site_cache', NULL, 'false', 'public', 'Cache situs', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(4, 'general', 'site_cache_time', NULL, '10', 'public', 'Lama Cache Situs', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(5, 'general', 'meta_description', 'sman1margaasih, SMAN 1 MARGAASIH, disdikjabar, dinas pendidikan, kcd8, kcd VIII', 'CMS Sekolahku adalah Content Management System dan PPDB Online gratis untuk SD SMP/Sederajat SMA/Sederajat', 'public', 'Deskripsi Meta', '2023-01-15 21:23:22', '2023-01-26 15:21:00', NULL, NULL, 0, 1, 0, 0, 'false'),
	(6, 'general', 'meta_keywords', NULL, 'CMS, Website Sekolah Gratis, Cara Membuat Website Sekolah, membuat web sekolah, contoh website sekolah, fitur website sekolah, Sekolah, Website, Internet,Situs, CMS Sekolah, Web Sekolah, Website Sekolah Gratis, Website Sekolah, Aplikasi Sekolah, PPDB Online, PSB Online, PSB Online Gratis, Penerimaan Siswa Baru Online, Raport Online, Kurikulum 2013, SD, SMP, SMA, Aliyah, MTs, SMK', 'public', 'Kata Kunci Meta', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(7, 'general', 'map_location', NULL, '', 'public', 'Lokasi di Google Maps', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(8, 'general', 'favicon', NULL, 'favicon.png', 'public', 'Favicon', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(9, 'general', 'header', 'b3d3d66ee169d9b89007f8792e30e8dc.png', 'header.png', 'public', 'Gambar Header', '2023-01-15 21:23:22', '2023-01-26 15:30:23', NULL, NULL, 0, 0, 0, 0, 'false'),
	(10, 'general', 'recaptcha_status', NULL, 'disable', 'public', 'reCAPTCHA Status', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(11, 'general', 'recaptcha_site_key', NULL, '6LeNCTAUAAAAAADTbL1rDw8GT1DF2DUjVtEXzdMu', 'public', 'Recaptcha Site Key', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(12, 'general', 'recaptcha_secret_key', NULL, '6LeNCTAUAAAAAGq8O0ItkzG8fsA9KeJ7mFMMFF1s', 'public', 'Recaptcha Secret Key', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(13, 'general', 'timezone', NULL, 'Asia/Jakarta', 'public', 'Time Zone', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(14, 'media', 'file_allowed_types', NULL, 'jpg, jpeg, png, gif', 'public', 'Tipe file yang diizinkan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(15, 'media', 'upload_max_filesize', NULL, '0', 'public', 'Maksimal Ukuran File yang Diupload', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(16, 'media', 'thumbnail_size_height', NULL, '100', 'public', 'Tinggi Gambar Thumbnail', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(17, 'media', 'thumbnail_size_width', NULL, '150', 'public', 'Lebar Gambar Thumbnail', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(18, 'media', 'medium_size_height', NULL, '308', 'public', 'Tinggi Gambar Sedang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(19, 'media', 'medium_size_width', NULL, '460', 'public', 'Lebar Gambar Sedang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(20, 'media', 'large_size_height', NULL, '600', 'public', 'Tinggi Gambar Besar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(21, 'media', 'large_size_width', NULL, '800', 'public', 'Lebar Gambar Besar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(22, 'media', 'album_cover_height', NULL, '250', 'public', 'Tinggi Cover Album Foto', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(23, 'media', 'album_cover_width', NULL, '400', 'public', 'Lebar Cover Album Foto', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(24, 'media', 'banner_height', NULL, '81', 'public', 'Tinggi Iklan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(25, 'media', 'banner_width', NULL, '245', 'public', 'Lebar Iklan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(26, 'media', 'image_slider_height', NULL, '400', 'public', 'Tinggi Gambar Slide', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(27, 'media', 'image_slider_width', NULL, '900', 'public', 'Lebar Gambar Slide', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(28, 'media', 'student_photo_height', NULL, '400', 'public', 'Tinggi Photo Peserta Didik', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(29, 'media', 'student_photo_width', NULL, '300', 'public', 'Lebar Photo Peserta Didik', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(30, 'media', 'employee_photo_height', NULL, '400', 'public', 'Tinggi Photo Guru dan Tenaga Kependidikan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(31, 'media', 'employee_photo_width', NULL, '300', 'public', 'Lebar Photo Guru dan Tenaga Kependidikan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(32, 'media', 'headmaster_photo_height', NULL, '400', 'public', 'Tinggi Photo Kepala Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(33, 'media', 'headmaster_photo_width', NULL, '300', 'public', 'Lebar Photo Kepala Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(34, 'media', 'header_height', NULL, '80', 'public', 'Tinggi Gambar Header', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(35, 'media', 'header_width', NULL, '200', 'public', 'Lebar Gambar Header', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(36, 'media', 'logo_height', NULL, '120', 'public', 'Tinggi Logo Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(37, 'media', 'logo_width', NULL, '120', 'public', 'Lebar Logo Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(38, 'writing', 'default_post_category', NULL, '1', 'public', 'Default Kategori Tulisan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(39, 'writing', 'default_post_status', NULL, 'publish', 'public', 'Default Status Tulisan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(40, 'writing', 'default_post_visibility', NULL, 'public', 'public', 'Default Akses Tulisan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(41, 'writing', 'default_post_discussion', NULL, 'open', 'public', 'Default Komentar Tulisan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(42, 'writing', 'post_image_thumbnail_height', NULL, '100', 'public', 'Tinggi Gambar Kecil', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(43, 'writing', 'post_image_thumbnail_width', NULL, '150', 'public', 'Lebar Gambar Kecil', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(44, 'writing', 'post_image_medium_height', NULL, '250', 'public', 'Tinggi Gambar Sedang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(45, 'writing', 'post_image_medium_width', NULL, '400', 'public', 'Lebar Gambar Sedang', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(46, 'writing', 'post_image_large_height', NULL, '450', 'public', 'Tinggi Gambar Besar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(47, 'writing', 'post_image_large_width', NULL, '840', 'public', 'Lebar Gambar Besar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(48, 'reading', 'post_per_page', NULL, '10', 'public', 'Tulisan per halaman', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(49, 'reading', 'post_rss_count', NULL, '10', 'public', 'Jumlah RSS', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(50, 'reading', 'post_related_count', NULL, '10', 'public', 'Jumlah Tulisan Terkait', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(51, 'reading', 'comment_per_page', NULL, '10', 'public', 'Komentar per halaman', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(52, 'discussion', 'comment_moderation', NULL, 'false', 'public', 'Komentar harus disetujui secara manual', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(53, 'discussion', 'comment_registration', NULL, 'false', 'public', 'Pengguna harus terdaftar dan login untuk komentar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(54, 'discussion', 'comment_blacklist', NULL, 'kampret', 'public', 'Komentar disaring', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(55, 'discussion', 'comment_order', NULL, 'asc', 'public', 'Urutan Komentar', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(56, 'social_account', 'facebook', NULL, '', 'public', 'Facebook', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(57, 'social_account', 'twitter', NULL, '', 'public', 'Twitter', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(58, 'social_account', 'linked_in', NULL, '', 'public', 'Linked In', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(59, 'social_account', 'youtube', 'https://www.youtube.com/@SMAN1Margaasih', '', 'public', 'Youtube', '2023-01-15 21:23:22', '2023-01-26 15:15:13', NULL, NULL, 0, 1, 0, 0, 'false'),
	(60, 'social_account', 'instagram', 'https://www.instagram.com/sman1margaasih/', '', 'public', 'Instagram', '2023-01-15 21:23:22', '2023-01-26 15:14:49', NULL, NULL, 0, 1, 0, 0, 'false'),
	(65, 'school_profile', 'npsn', '20227907', '123', 'public', 'NPSN', '2023-01-15 21:23:22', '2023-01-26 15:18:13', NULL, NULL, 0, 1, 0, 0, 'false'),
	(66, 'school_profile', 'school_name', 'SMAN 1 MARGAASIH', 'SMA Negeri 9 Kuningan', 'public', 'Nama Sekolah', '2023-01-15 21:23:22', '2023-01-26 15:18:47', NULL, NULL, 0, 1, 0, 0, 'false'),
	(67, 'school_profile', 'headmaster', 'Toteng Suhara', 'Anton Sofyan', 'public', 'Kepala Sekolah', '2023-01-15 21:23:22', '2023-01-26 15:17:12', NULL, NULL, 0, 1, 0, 0, 'false'),
	(68, 'school_profile', 'headmaster_photo', 'aa29e145627a5d619ea50105e96b1d8c.png', 'headmaster_photo.png', 'public', 'Photo Kepala Sekolah', '2023-01-15 21:23:22', '2023-01-26 15:30:39', NULL, NULL, 0, 0, 0, 0, 'false'),
	(69, 'school_profile', 'school_level', '98', '3', 'public', 'Bentuk Pendidikan', '2023-01-15 21:23:22', '2023-01-26 15:18:37', NULL, NULL, 0, 1, 0, 0, 'false'),
	(70, 'school_profile', 'school_status', NULL, '1', 'public', 'Status Sekolah', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(71, 'school_profile', 'ownership_status', '107', '1', 'public', 'Status Kepemilikan', '2023-01-15 21:23:22', '2023-01-26 15:18:21', NULL, NULL, 0, 1, 0, 0, 'false'),
	(72, 'school_profile', 'decree_operating_permit', NULL, '-', 'public', 'SK Izin Operasional', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(73, 'school_profile', 'decree_operating_permit_date', NULL, '2023-01-15', 'public', 'Tanggal SK Izin Operasional', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(74, 'school_profile', 'tagline', NULL, 'Where Tomorrow\'s Leaders Come Together', 'public', 'Slogan', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(75, 'school_profile', 'rt', NULL, '12', 'public', 'RT', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(76, 'school_profile', 'rw', NULL, '06', 'public', 'RW', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(77, 'school_profile', 'sub_village', '-', 'Wage', 'public', 'Dusun', '2023-01-15 21:23:22', '2023-01-26 15:19:23', NULL, NULL, 0, 1, 0, 0, 'false'),
	(78, 'school_profile', 'village', 'Mekarrahayu', 'Kadugede', 'public', 'Kelurahan / Desa', '2023-01-15 21:23:22', '2023-01-26 15:19:35', NULL, NULL, 0, 1, 0, 0, 'false'),
	(79, 'school_profile', 'sub_district', 'Margaasih', 'Kadugede', 'public', 'Kecamatan', '2023-01-15 21:23:22', '2023-01-26 15:19:14', NULL, NULL, 0, 1, 0, 0, 'false'),
	(80, 'school_profile', 'district', 'Bandung', 'Kuningan', 'public', 'Kota/Kabupaten', '2023-01-15 21:23:22', '2023-01-26 15:16:05', NULL, NULL, 0, 1, 0, 0, 'false'),
	(81, 'school_profile', 'postal_code', '40218', '45561', 'public', 'Kode Pos', '2023-01-15 21:23:22', '2023-01-26 15:18:28', NULL, NULL, 0, 1, 0, 0, 'false'),
	(82, 'school_profile', 'street_address', 'Jl. Terusan Taman Kopo Indah III', 'Jalan Raya Kadugede No. 11', 'public', 'Alamat Jalan', '2023-01-15 21:23:22', '2023-01-26 15:19:04', NULL, NULL, 0, 1, 0, 0, 'false'),
	(83, 'school_profile', 'phone', NULL, '0232123456', 'public', 'Telepon', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(84, 'school_profile', 'fax', '-', '0232123456', 'public', 'Fax', '2023-01-15 21:23:22', '2023-01-26 15:16:24', NULL, NULL, 0, 1, 0, 0, 'false'),
	(85, 'school_profile', 'email', 'admin@sman1margaasih.sch.id', 'info@sman9kuningan.sch.id', 'public', 'Email', '2023-01-15 21:23:22', '2023-01-26 15:16:18', NULL, NULL, 0, 1, 0, 0, 'false'),
	(86, 'school_profile', 'website', 'sman1margaasih.sch.id', 'http://www.sman9kuningan.sch.id', 'public', 'Website', '2023-01-15 21:23:22', '2023-01-26 15:19:46', NULL, NULL, 0, 1, 0, 0, 'false'),
	(87, 'school_profile', 'logo', '9496a3db2fcbfa6e30617e745874ebc7.png', 'logo.png', 'public', 'Logo', '2023-01-15 21:23:22', '2023-01-26 15:17:52', NULL, NULL, 0, 0, 0, 0, 'false'),
	(88, 'admission', 'admission_status', NULL, 'open', 'public', 'Status Penerimaan Peserta Didik Baru', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(89, 'admission', 'admission_year', NULL, '2023', 'public', 'Tahun Penerimaan Peserta Didik Baru', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(90, 'admission', 'admission_start_date', NULL, '2022-01-01', 'public', 'Tanggal Mulai PPDB', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(91, 'admission', 'admission_end_date', NULL, '2022-12-31', 'public', 'Tanggal Selesai PPDB', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(92, 'admission', 'announcement_start_date', NULL, '2022-01-01', 'public', 'Tanggal Mulai Pengumuman Hasil Seleksi PPDB', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(93, 'admission', 'announcement_end_date', NULL, '2022-12-31', 'public', 'Tanggal Selesai Pengumuman Hasil Seleksi PPDB', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(94, 'mail_server', 'smtp_host', '', '', 'private', 'SMTP Server Address', NULL, '2023-01-26 15:02:45', NULL, NULL, 0, 0, 0, 0, 'false'),
	(95, 'mail_server', 'smtp_user', '', '', 'private', 'SMTP Username', NULL, '2023-01-26 15:02:45', NULL, NULL, 0, 0, 0, 0, 'false'),
	(96, 'mail_server', 'smtp_pass', '', '', 'private', 'SMTP Password', NULL, '2023-01-26 15:02:45', NULL, NULL, 0, 0, 0, 0, 'false'),
	(97, 'mail_server', 'smtp_port', '', '', 'private', 'SMTP Port', NULL, '2023-01-26 15:02:45', NULL, NULL, 0, 0, 0, 0, 'false');

-- Dumping structure for table db_cms_sekolahku.students
DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `major_id` bigint DEFAULT '0' COMMENT 'Program Keahlian',
  `first_choice_id` bigint DEFAULT '0' COMMENT 'Pilihan Pertama PPDB',
  `second_choice_id` bigint DEFAULT '0' COMMENT 'Pilihan Kedua PPDB',
  `registration_number` varchar(10) DEFAULT NULL COMMENT 'Nomor Pendaftaran',
  `admission_exam_number` varchar(10) DEFAULT NULL COMMENT 'Nomor Ujian Tes Tulis',
  `selection_result` varchar(100) DEFAULT NULL COMMENT 'Hasil Seleksi PPDB/PMB',
  `admission_phase_id` bigint DEFAULT '0' COMMENT 'Gelombang Pendaftaran',
  `admission_type_id` bigint DEFAULT '0' COMMENT 'Jalur Pendaftaran',
  `photo` varchar(100) DEFAULT NULL,
  `achievement` text COMMENT 'Prestasi Calon Peserta Didik / Mahasiswa',
  `is_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Apakah Siswa Aktif ? Set true jika lolos seleksi PPDB dan set FALSE jika sudah lulus',
  `is_prospective_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Apakah Calon Siswa Baru ?',
  `is_alumni` enum('true','false','unverified') NOT NULL DEFAULT 'false' COMMENT 'Apakah Alumni?',
  `is_transfer` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Jenis Pendaftaran : Baru / Pindahan ?',
  `re_registration` enum('true','false') DEFAULT NULL COMMENT 'Konfirmasi Pendaftaran Ulang Calon Siswa Baru',
  `start_date` date DEFAULT NULL COMMENT 'Tanggal Masuk Sekolah',
  `identity_number` varchar(50) DEFAULT NULL COMMENT 'NIS/NIM',
  `nisn` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Siswa Nasional',
  `nik` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Kependudukan/KTP',
  `prev_exam_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Peserta Ujian Sebelumnya',
  `prev_diploma_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Ijazah Sebelumnya',
  `paud` enum('true','false') DEFAULT NULL COMMENT 'Apakah Pernah PAUD',
  `tk` enum('true','false') DEFAULT NULL COMMENT 'Apakah Pernah TK',
  `skhun` varchar(50) DEFAULT NULL COMMENT 'No. Seri Surat Keterangan Hasil Ujian Nasional Sebelumnya',
  `prev_school_name` varchar(255) DEFAULT NULL COMMENT 'Nama Sekolah Sebelumnya',
  `prev_school_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Sekolah Sebelumnya',
  `hobby` varchar(255) DEFAULT NULL,
  `ambition` varchar(255) DEFAULT NULL COMMENT 'Cita-Cita',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `religion_id` bigint DEFAULT '0',
  `special_need_id` bigint DEFAULT '0' COMMENT 'Berkeburuhan Khusus',
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kota/Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `residence_id` bigint DEFAULT '0' COMMENT 'Tempat Tinggal',
  `transportation_id` bigint DEFAULT '0' COMMENT 'Moda Transportasi',
  `phone` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `sktm` varchar(100) DEFAULT NULL COMMENT 'Surat Keterangan Tidak Mampu (SKTM)',
  `kks` varchar(100) DEFAULT NULL COMMENT 'Kartu Keluarga Sejahtera (KKS)',
  `kps` varchar(100) DEFAULT NULL COMMENT 'Kartu Pra Sejahtera (KPS)',
  `kip` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Pintar (KIP)',
  `kis` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Sehat (KIS)',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `father_name` varchar(150) DEFAULT NULL,
  `father_birth_year` year DEFAULT NULL,
  `father_education_id` bigint DEFAULT '0',
  `father_employment_id` bigint DEFAULT '0',
  `father_monthly_income_id` bigint DEFAULT '0',
  `father_special_need_id` bigint DEFAULT '0',
  `mother_name` varchar(150) DEFAULT NULL,
  `mother_birth_year` year DEFAULT NULL,
  `mother_education_id` bigint DEFAULT '0',
  `mother_employment_id` bigint DEFAULT '0',
  `mother_monthly_income_id` bigint DEFAULT '0',
  `mother_special_need_id` bigint DEFAULT '0',
  `guardian_name` varchar(150) DEFAULT NULL,
  `guardian_birth_year` year DEFAULT NULL,
  `guardian_education_id` bigint DEFAULT '0',
  `guardian_employment_id` bigint DEFAULT '0',
  `guardian_monthly_income_id` bigint DEFAULT '0',
  `mileage` smallint DEFAULT NULL COMMENT 'Jarak tempat tinggal ke sekolah',
  `traveling_time` smallint DEFAULT NULL COMMENT 'Waktu Tempuh',
  `height` smallint DEFAULT NULL COMMENT 'Tinggi Badan',
  `weight` smallint DEFAULT NULL COMMENT 'Berat Badan',
  `sibling_number` smallint DEFAULT '0' COMMENT 'Jumlah Saudara Kandung',
  `student_status_id` bigint DEFAULT '0' COMMENT 'Status siswa',
  `end_date` date DEFAULT NULL COMMENT 'Tanggal Keluar',
  `reason` varchar(255) DEFAULT NULL COMMENT 'Diisi jika peserta didik sudah keluar',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  KEY `students_registration_number__idx` (`registration_number`) USING BTREE,
  KEY `students_identity_number__idx` (`identity_number`) USING BTREE,
  KEY `students_full_name__idx` (`full_name`) USING BTREE,
  KEY `students_first_choice_id__idx` (`first_choice_id`) USING BTREE,
  KEY `students_second_choice_id__idx` (`second_choice_id`) USING BTREE,
  KEY `students_major_id__idx` (`major_id`) USING BTREE,
  KEY `students_admission_phase_id__idx` (`admission_phase_id`) USING BTREE,
  KEY `students_admission_type_id__idx` (`admission_type_id`) USING BTREE,
  KEY `students_student_status_id__idx` (`student_status_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.students: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.subscribers
DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE IF NOT EXISTS `subscribers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.subscribers: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.tags
DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.tags: ~3 rows (approximately)
REPLACE INTO `tags` (`id`, `tag`, `slug`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
	(1, 'Berita', 'berita', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(2, 'Pengumuman', 'pengumuman', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false'),
	(3, 'Sekilas Info', 'sekilas-info', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 0, 0, 0, 0, 'false');

-- Dumping structure for table db_cms_sekolahku.themes
DROP TABLE IF EXISTS `themes`;
CREATE TABLE IF NOT EXISTS `themes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(255) NOT NULL,
  `theme_folder` varchar(255) DEFAULT NULL,
  `theme_author` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `theme_name` (`theme_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.themes: ~3 rows (approximately)
REPLACE INTO `themes` (`id`, `theme_name`, `theme_folder`, `theme_author`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
	(1, 'Sky Light', 'sky_light', 'Anton Sofyan', 'false', '2023-01-15 21:23:22', '2023-01-27 12:46:18', NULL, NULL, 1, 0, 0, 0, 'false'),
	(2, 'Blue Sky', 'blue_sky', 'Anton Sofyan', 'false', '2023-01-15 21:23:22', '2023-01-15 14:23:22', NULL, NULL, 1, 0, 0, 0, 'false'),
	(3, 'Green Land', 'green_land', 'Anton Sofyan', 'false', '2023-01-15 21:23:22', '2023-01-27 12:54:58', NULL, NULL, 1, 1, 0, 0, 'false'),
	(4, 'margaasih', 'margaasih', 'luthfi', 'true', '2023-01-27 19:46:18', '2023-01-27 12:54:58', NULL, NULL, 1, 1, 0, 0, 'false');

-- Dumping structure for table db_cms_sekolahku.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_full_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_url` varchar(100) DEFAULT NULL,
  `user_group_id` bigint DEFAULT '0',
  `user_type` enum('super_user','administrator','employee','student') NOT NULL DEFAULT 'administrator',
  `user_profile_id` bigint unsigned DEFAULT NULL COMMENT 'student_id OR employee_id',
  `user_biography` text,
  `user_forgot_password_key` varchar(100) DEFAULT NULL,
  `user_forgot_password_request_date` date DEFAULT NULL,
  `has_login` enum('true','false') DEFAULT 'false',
  `last_logged_in` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`),
  KEY `users_user_group_id__idx` (`user_group_id`) USING BTREE,
  KEY `users_user_profile_id__idx` (`user_profile_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.users: ~0 rows (approximately)
REPLACE INTO `users` (`id`, `user_name`, `user_password`, `user_full_name`, `user_email`, `user_url`, `user_group_id`, `user_type`, `user_profile_id`, `user_biography`, `user_forgot_password_key`, `user_forgot_password_request_date`, `has_login`, `last_logged_in`, `ip_address`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
	(1, 'administrator', '$2y$10$6jtRndlVjf7yTXeZy7kuZ.RLf2lYMsSiuYJ3uvclHRm573Yzd3MA.', 'Administrator', 'admin@admin.com', 'sekolahku.web.id', 0, 'super_user', NULL, NULL, NULL, NULL, 'true', '2023-01-27 12:45:16', '::1', '2023-01-15 21:23:22', '2023-01-27 12:45:16', NULL, NULL, 0, 0, 0, 0, 'false');

-- Dumping structure for table db_cms_sekolahku.user_groups
DROP TABLE IF EXISTS `user_groups`;
CREATE TABLE IF NOT EXISTS `user_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_group` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_group` (`user_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.user_groups: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku.user_privileges
DROP TABLE IF EXISTS `user_privileges`;
CREATE TABLE IF NOT EXISTS `user_privileges` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` bigint DEFAULT '0',
  `module_id` bigint DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT '0',
  `updated_by` bigint DEFAULT '0',
  `deleted_by` bigint DEFAULT '0',
  `restored_by` bigint DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_field` (`user_group_id`,`module_id`),
  KEY `user_privileges_user_group_id__idx` (`user_group_id`) USING BTREE,
  KEY `user_privileges_module_id__idx` (`module_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku.user_privileges: ~0 rows (approximately)

-- Dumping structure for table db_cms_sekolahku._sessions
DROP TABLE IF EXISTS `_sessions`;
CREATE TABLE IF NOT EXISTS `_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_TIMESTAMP` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table db_cms_sekolahku._sessions: ~1 rows (approximately)
REPLACE INTO `_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
	('4bk5evea5q810nvm44o3lef2898rh2lr', '::1', 1674824100, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313637343832343033323b746f6b656e7c733a33323a226639346439333133646165333537323333373161383762623031616336326561223b637372665f746f6b656e7c733a33323a226639346439333133646165333537323333373161383762623031616336326561223b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323032322d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a37393a22736d616e316d61726761617369682c20534d414e2031204d41524741415349482c2064697364696b6a616261722c2064696e61732070656e646964696b616e2c206b6364382c206b63642056494949223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b6d61705f6c6f636174696f6e7c733a303a22223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a33363a2262336433643636656531363964396238393030376638373932653330653864632e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a33393a2268747470733a2f2f7777772e796f75747562652e636f6d2f40534d414e314d6172676161736968223b696e7374616772616d7c733a34313a2268747470733a2f2f7777772e696e7374616772616d2e636f6d2f736d616e316d61726761617369682f223b6e70736e7c733a383a223230323237393037223b7363686f6f6c5f6e616d657c733a31363a22534d414e2031204d4152474141534948223b686561646d61737465727c733a31333a22546f74656e6720537568617261223b686561646d61737465725f70686f746f7c733a33363a2261613239653134353632376135643631396561353031303565393662316438632e706e67223b7363686f6f6c5f6c6576656c7c733a313a2233223b7363686f6f6c5f7374617475737c733a313a2231223b6f776e6572736869705f7374617475737c733a333a22313037223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323032332d30312d3135223b7461676c696e657c733a33383a22576865726520546f6d6f72726f772773204c65616465727320436f6d6520546f676574686572223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a313a222d223b76696c6c6167657c733a31313a224d656b6172726168617975223b7375625f64697374726963747c733a393a224d6172676161736968223b64697374726963747c733a373a2242616e64756e67223b706f7374616c5f636f64657c733a353a223430323138223b7374726565745f616464726573737c733a33323a224a6c2e205465727573616e2054616d616e204b6f706f20496e64616820494949223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a313a222d223b656d61696c7c733a32373a2261646d696e40736d616e316d61726761617369682e7363682e6964223b776562736974657c733a32313a22736d616e316d61726761617369682e7363682e6964223b6c6f676f7c733a33363a2239343936613364623266636266613665333036313765373435383734656263372e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303233223b61646d697373696f6e5f73746172745f646174657c733a31303a22323032322d30312d3031223b61646d697373696f6e5f656e645f646174657c733a31303a22323032322d31322d3331223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323032322d30312d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323032322d31322d3331223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a373a224a75727573616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a393a226d6172676161736968223b6d616a6f725f636f756e747c623a303b757365725f69647c733a313a2231223b757365725f6e616d657c733a31333a2261646d696e6973747261746f72223b757365725f656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f747970657c733a31303a2273757065725f75736572223b757365725f70726f66696c655f69647c4e3b6861735f6c6f67696e7c623a313b757365725f70726976696c656765737c613a31343a7b693a303b733a393a2264617368626f617264223b693a313b733a31353a226368616e67655f70617373776f7264223b693a323b733a31313a226d61696e74656e616e6365223b693a333b733a353a227573657273223b693a343b733a393a2261646d697373696f6e223b693a353b733a31303a22617070656172616e6365223b693a363b733a343a22626c6f67223b693a373b733a393a22656d706c6f79656573223b693a383b733a353a226d65646961223b693a393b733a373a22706c7567696e73223b693a31303b733a393a227265666572656e6365223b693a31313b733a383a2273657474696e6773223b693a31323b733a383a2261636164656d6963223b693a31333b733a373a2270726f66696c65223b7d736d74705f686f73747c733a303a22223b736d74705f757365727c733a303a22223b736d74705f706173737c733a303a22223b736d74705f706f72747c733a303a22223b);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
