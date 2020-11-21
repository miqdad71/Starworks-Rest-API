-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2020 at 03:33 AM
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
(1, 'Miqdad', 'miqdad.ihbs71777@gmail.com', '081298892112', '$2b$10$3KuBysVKgkVYbLVh6du9fuGwI/1icExWsj/zmSc59tiB0lLE8QYtC', 0, '2020-11-19 15:37:39', '2020-11-19 16:27:23'),
(2, 'Isram Rasal', 'isramrasal@gmail.com', '082987651234', '$2b$10$/CHzMkiKAchaUWwpJukvruTwvGOqo7ExaGiuOo1QkGmu7ekBkxGmu', 1, '2020-11-19 15:38:47', '2020-11-19 16:27:27'),
(3, 'Indra David Pesik', 'indra123@gmail.com', '089609960946', '$2b$10$/BfswUxHEz8Vw7fBRGtZzu/Dj9xpbxrXweLKqnXa2RYassnnGNsQm', 0, '2020-11-20 05:26:39', '2020-11-20 15:44:26');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `cn_id` int(11) UNSIGNED NOT NULL,
  `ac_id` int(11) UNSIGNED NOT NULL,
  `cn_perusahaan` varchar(100) NOT NULL,
  `cn_jabatan` varchar(50) NOT NULL,
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

INSERT INTO `company` (`cn_id`, `ac_id`, `cn_perusahaan`, `cn_jabatan`, `cn_field`, `cn_city`, `cn_description`, `cn_instagram`, `cn_linkedin`, `cn_profile`, `cn_created_at`, `cn_updated_at`) VALUES
(1, 2, 'CV. FORKINDO', 'CEO', 'Pondok Gede', 'Bekasi', 'Komplek kologad no.17', 'cv_forkindo', 'cvforkindos', 'image-1605878042630.jpg', '2020-11-19 15:38:47', '2020-11-20 13:14:02');

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
(1, 1, 'Android Developer', 'full time', 'Jakarta', '-', 'image-1605889012669.jpg', '2020-11-19 15:37:39', '2020-11-20 16:16:52'),
(2, 3, 'Fullstack Android Developer', 'full time', 'Jogja', '-', NULL, '2020-11-20 05:26:39', '2020-11-20 05:29:53');

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
(1, 1, 'Staff IT', 'Bank BNI', '2020-10-01', '2020-11-01', 'Membuat aplikasi bank');

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
(1, 1, 1, 10000000, 'Kami tunggu persetujuannya', 'wait', NULL, '2020-11-19 17:26:51');

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
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
-- Dumping data for table `portfolio`
--

INSERT INTO `portfolio` (`pr_id`, `en_id`, `pr_app`, `pr_description`, `pr_link_pub`, `pr_link_repo`, `pr_work_place`, `pr_type`, `pr_image`) VALUES
(1, 1, 'SSS', 'Aplikasi SSS', '-', '-', 'SSS', 'aplikasi mobile', 'image-1605889270165.jpg');

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
(1, 1, 'Aplikasi Android E-Gaji Berkala', 'Membuat Aplikasi Android Untuk Pengelolaan Gaji Berkala', '2021-03-01', 'image-1605889332907.jpg', '2020-11-19 17:25:36', '2020-11-20 16:22:12');

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
(1, 1, 'Kotlin');

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
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
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
  MODIFY `ac_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `cn_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `engineer`
--
ALTER TABLE `engineer`
  MODIFY `en_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `ex_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hire`
--
ALTER TABLE `hire`
  MODIFY `hr_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `pr_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `pj_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `sk_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Constraints for table `portfolio`
--
ALTER TABLE `portfolio`
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
