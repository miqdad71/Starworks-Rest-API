-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2020 at 02:07 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `starworks`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `ac_id` int(11) UNSIGNED NOT NULL,
  `ac_name` varchar(50) NOT NULL,
  `ac_email` varchar(50) NOT NULL,
  `ac_phone` varchar(20) NOT NULL,
  `ac_password` longtext NOT NULL,
  `ac_level` tinyint(1) DEFAULT NULL,
  `ac_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `ac_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`ac_id`, `ac_name`, `ac_email`, `ac_phone`, `ac_password`, `ac_level`, `ac_created_at`, `ac_updated_at`) VALUES
(1, 'Miqdad', 'miqdad.ihbs71777@gmail.com', '081298892112', '$2b$10$V.2q1oMG0qvUbv7bUulG5OF9GOf2hapPIlgx58mDSMgzy5bZKmMu6', 0, '2020-11-22 11:50:51', '2020-11-22 11:50:51'),
(2, 'Royid Rosadi', 'rosyidrosadigmail.com', '081298892120', '$2b$10$6BwEmPGRyREI4tpnwoJVJux2m2RULuzPtbXlF7ijt9OpAMZ7vtOl6', 0, '2020-11-22 11:59:32', '2020-11-22 11:59:32'),
(3, 'Indra David Pesik', 'ndradavid@gmail.com', '081298892130', '$2b$10$SJlRcSZ03NvFrqvN0N64k.dOSLePMtPZzkIBQUNnrvNqCshKfL/MW', 0, '2020-11-22 12:00:06', '2020-11-22 12:00:06'),
(4, 'Isram Rasal', 'isramrasal@gmail.com', '082987651234', '$2b$10$ao/M2P196hr2Hl4JI6P3ROimejs9O0EEfq8jbra9O3JYQrEvmjeLi', 1, '2020-11-22 12:08:20', '2020-11-22 12:08:20'),
(5, 'Engelbertus Hendro', 'hendro@gmail.com', '082987651121', '$2b$10$TF7PArSAiwWzxQbuvonOD.TeJiJsaG5QlRNRgl5T.g1UpBBeiIWZK', 1, '2020-11-22 12:09:56', '2020-11-22 12:09:56'),
(6, 'Ahmad Farhan', 'farhan@gmail.com', '082987651222', '$2b$10$YakRc1kLNElFpU6AaD1YJuAOd2kV0gZKV2YvxTdSCHTx.7QHKamtm', 1, '2020-11-22 12:11:06', '2020-11-22 12:11:06');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `cn_id` int(11) UNSIGNED NOT NULL,
  `ac_id` int(11) UNSIGNED NOT NULL,
  `cn_company` varchar(100) NOT NULL,
  `cn_position` varchar(50) NOT NULL,
  `cn_field` varchar(50) DEFAULT NULL,
  `cn_city` varchar(50) DEFAULT NULL,
  `cn_description` text DEFAULT NULL,
  `cn_instagram` varchar(50) DEFAULT NULL,
  `cn_linkedin` varchar(50) DEFAULT NULL,
  `cn_profile` text DEFAULT NULL,
  `cn_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `cn_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`cn_id`, `ac_id`, `cn_company`, `cn_position`, `cn_field`, `cn_city`, `cn_description`, `cn_instagram`, `cn_linkedin`, `cn_profile`, `cn_created_at`, `cn_updated_at`) VALUES
(1, 4, 'CV. FORKINDO', 'CEO', 'Pondok Gede', 'Bekasi', 'Komplek kologad no.17', 'cv_forkindo', 'cvforkindos', 'IMG-1606048186483.jpg', '2020-11-22 12:08:20', '2020-11-22 12:29:46'),
(2, 5, 'E-Recruitment Corp', 'CEO', 'Jembrana', 'Bali', 'Desa Banyu Biru', 'e_rec', 'erecruitment', 'IMG-1606048373263.jpg', '2020-11-22 12:09:56', '2020-11-22 12:32:53'),
(3, 6, 'Lokeren Corp', 'CEO', 'Cikini', 'Jakarta', 'Pasar Senen', 'lo_keren', 'loker_en', 'IMG-1606048532674.jpg', '2020-11-22 12:11:06', '2020-11-22 12:35:32');

-- --------------------------------------------------------

--
-- Table structure for table `engineer`
--

CREATE TABLE `engineer` (
  `en_id` int(11) UNSIGNED NOT NULL,
  `ac_id` int(11) UNSIGNED NOT NULL,
  `en_job_title` varchar(50) DEFAULT NULL,
  `en_job_type` enum('freelance','full time') DEFAULT NULL,
  `en_domicile` varchar(50) DEFAULT NULL,
  `en_description` text DEFAULT NULL,
  `en_profile` text DEFAULT NULL,
  `en_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `en_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `engineer`
--

INSERT INTO `engineer` (`en_id`, `ac_id`, `en_job_title`, `en_job_type`, `en_domicile`, `en_description`, `en_profile`, `en_created_at`, `en_updated_at`) VALUES
(1, 1, 'Backend', 'full time', 'Bekasi', 'Very Good', 'IMG-1606047862698.jpg', '2020-11-22 11:50:51', '2020-11-22 12:24:22'),
(2, 2, 'Frontend', 'freelance', 'Mojokerto', 'Very Good', 'IMG-1606047904134.jpg', '2020-11-22 11:59:32', '2020-11-22 12:25:04'),
(3, 3, 'Fullstack Android', 'full time', 'Manado', 'Expert', 'IMG-1606048071665.jpg', '2020-11-22 12:00:06', '2020-11-22 12:27:51');

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE `experience` (
  `ex_id` int(11) UNSIGNED NOT NULL,
  `en_id` int(11) UNSIGNED NOT NULL,
  `ex_position` varchar(50) NOT NULL,
  `ex_company` varchar(100) NOT NULL,
  `ex_start` date NOT NULL,
  `ex_end` date NOT NULL,
  `ex_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`ex_id`, `en_id`, `ex_position`, `ex_company`, `ex_start`, `ex_end`, `ex_description`) VALUES
(1, 3, 'Staff IT', 'Bank BNI', '2020-10-01', '2020-11-01', 'Membuat aplikasi bank'),
(2, 3, 'Manager', 'Kompas', '2018-10-12', '2020-11-30', 'Membuat web berita kompas'),
(3, 1, 'Staff Engineer', 'PT. Wasa Mitra Engineering', '2020-10-01', '2020-11-30', 'Membuat web pendataan gudang'),
(4, 1, 'IT Support', 'Gunadarma University Computing Center', '2018-07-11', '2020-11-22', 'Maintenance jaringan'),
(5, 2, 'IT Desaigner', 'Mangaku', '2018-07-11', '2020-11-22', 'Merender gambar dan resolusi');

-- --------------------------------------------------------

--
-- Table structure for table `hire`
--

CREATE TABLE `hire` (
  `hr_id` int(11) UNSIGNED NOT NULL,
  `en_id` int(11) UNSIGNED NOT NULL,
  `pj_id` int(11) UNSIGNED NOT NULL,
  `hr_price` bigint(12) UNSIGNED NOT NULL,
  `hr_message` text NOT NULL,
  `hr_status` enum('wait','reject','approve') NOT NULL DEFAULT 'wait',
  `hr_date_confirm` datetime DEFAULT NULL,
  `hr_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hire`
--

INSERT INTO `hire` (`hr_id`, `en_id`, `pj_id`, `hr_price`, `hr_message`, `hr_status`, `hr_date_confirm`, `hr_created_at`) VALUES
(1, 1, 1, 10000000, 'Kami tunggu persetujuannya', 'approve', '2020-11-22 20:05:39', '2020-11-22 13:05:19'),
(2, 3, 2, 10000000, 'Kami tunggu persetujuannya', 'wait', '2020-11-22 20:06:18', '2020-11-22 13:05:29'),
(4, 2, 2, 10000000, 'Kami tunggu persetujuannya', 'wait', NULL, '2020-11-22 13:06:01');

-- --------------------------------------------------------

--
-- Table structure for table `portofolio`
--

CREATE TABLE `portofolio` (
  `pr_id` int(11) UNSIGNED NOT NULL,
  `en_id` int(11) UNSIGNED NOT NULL,
  `pr_app` varchar(50) NOT NULL,
  `pr_description` text NOT NULL,
  `pr_link_pub` varchar(100) NOT NULL,
  `pr_link_repo` varchar(100) NOT NULL,
  `pr_work_place` varchar(100) NOT NULL,
  `pr_type` enum('aplikasi mobile','aplikasi web') NOT NULL,
  `pr_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `portofolio`
--

INSERT INTO `portofolio` (`pr_id`, `en_id`, `pr_app`, `pr_description`, `pr_link_pub`, `pr_link_repo`, `pr_work_place`, `pr_type`, `pr_image`) VALUES
(1, 1, 'EAM WME', 'Web pendataan barang', '-', '-', '-', '', 'IMG-1606049701878.png'),
(2, 3, 'Kompas News', 'Aplikasi berita', '-', '-', '-', '', 'IMG-1606049886521.png');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `pj_id` int(11) UNSIGNED NOT NULL,
  `cn_id` int(11) UNSIGNED NOT NULL,
  `pj_project_name` varchar(100) NOT NULL,
  `pj_description` text NOT NULL,
  `pj_deadline` date NOT NULL,
  `pj_image` text NOT NULL,
  `pj_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `pj_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`pj_id`, `cn_id`, `pj_project_name`, `pj_description`, `pj_deadline`, `pj_image`, `pj_created_at`, `pj_updated_at`) VALUES
(1, 3, 'Aplikasi Android E-Gaji Berkala', 'Membuat Aplikasi Android Untuk Pengelolaan Gaji Berkala', '2021-03-01', 'IMG-1606050058662.jpg', '2020-11-22 13:00:58', '2020-11-22 13:00:58'),
(2, 1, 'Web Pendataan Barang', 'Membuat Website Pendataan dan Pemeliharaan Asset', '2020-11-30', 'IMG-1606050161005.jpg', '2020-11-22 13:02:41', '2020-11-22 13:02:41');

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `sk_id` int(11) UNSIGNED NOT NULL,
  `en_id` int(11) UNSIGNED NOT NULL,
  `sk_skill_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`sk_id`, `en_id`, `sk_skill_name`) VALUES
(1, 1, 'Kotlin'),
(3, 2, 'Javascript'),
(4, 3, 'PHP'),
(5, 1, 'PHP'),
(6, 1, 'Javascript'),
(7, 3, 'Golang'),
(8, 3, 'Kotlin'),
(9, 2, 'Kotlin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ac_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`cn_id`),
  ADD KEY `ac_id` (`ac_id`);

--
-- Indexes for table `engineer`
--
ALTER TABLE `engineer`
  ADD PRIMARY KEY (`en_id`),
  ADD KEY `ac_id` (`ac_id`);

--
-- Indexes for table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`ex_id`),
  ADD KEY `en_id` (`en_id`) USING BTREE;

--
-- Indexes for table `hire`
--
ALTER TABLE `hire`
  ADD PRIMARY KEY (`hr_id`),
  ADD KEY `en_id` (`en_id`),
  ADD KEY `pj_id` (`pj_id`);

--
-- Indexes for table `portofolio`
--
ALTER TABLE `portofolio`
  ADD PRIMARY KEY (`pr_id`),
  ADD KEY `en_id` (`en_id`) USING BTREE;

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`pj_id`),
  ADD KEY `cn_id` (`cn_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`sk_id`),
  ADD KEY `en_id` (`en_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `ac_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `cn_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `engineer`
--
ALTER TABLE `engineer`
  MODIFY `en_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `ex_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hire`
--
ALTER TABLE `hire`
  MODIFY `hr_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `portofolio`
--
ALTER TABLE `portofolio`
  MODIFY `pr_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `pj_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `sk_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ac_id_fk` FOREIGN KEY (`ac_id`) REFERENCES `account` (`ac_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `engineer`
--
ALTER TABLE `engineer`
  ADD CONSTRAINT `engineer_ac_id_fk` FOREIGN KEY (`ac_id`) REFERENCES `account` (`ac_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `experience_en_id_fk` FOREIGN KEY (`en_id`) REFERENCES `engineer` (`en_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hire`
--
ALTER TABLE `hire`
  ADD CONSTRAINT `hire_en_id_fk` FOREIGN KEY (`en_id`) REFERENCES `engineer` (`en_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hire_pj_id_fk` FOREIGN KEY (`pj_id`) REFERENCES `project` (`pj_id`);

--
-- Constraints for table `portofolio`
--
ALTER TABLE `portofolio`
  ADD CONSTRAINT `portfolio_en_id_fk` FOREIGN KEY (`en_id`) REFERENCES `engineer` (`en_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_cn_id_fk` FOREIGN KEY (`cn_id`) REFERENCES `company` (`cn_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `skill`
--
ALTER TABLE `skill`
  ADD CONSTRAINT `skill_en_id_fk` FOREIGN KEY (`en_id`) REFERENCES `engineer` (`en_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
