-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Feb 2021 pada 05.13
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.10

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
-- Struktur dari tabel `account`
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
-- Dumping data untuk tabel `account`
--

INSERT INTO `account` (`ac_id`, `ac_name`, `ac_email`, `ac_phone`, `ac_password`, `ac_level`, `ac_created_at`, `ac_updated_at`) VALUES
(1, 'Miqdad', 'miqdad.ihbs71777@gmail.com', '081298892112', '$2b$10$V.2q1oMG0qvUbv7bUulG5OF9GOf2hapPIlgx58mDSMgzy5bZKmMu6', 0, '2020-11-22 11:50:51', '2020-11-22 11:50:51'),
(2, 'Royid Rosadi', 'rosyidrosadi@gmail.com', '081298892120', '$2b$10$6BwEmPGRyREI4tpnwoJVJux2m2RULuzPtbXlF7ijt9OpAMZ7vtOl6', 0, '2020-11-22 11:59:32', '2021-01-05 03:59:21'),
(3, 'Indra David Pesik', 'ndradavid@gmail.com', '081298892130', '$2b$10$SJlRcSZ03NvFrqvN0N64k.dOSLePMtPZzkIBQUNnrvNqCshKfL/MW', 0, '2020-11-22 12:00:06', '2020-11-22 12:00:06'),
(4, 'Ali Rohmansyah', 'ra@gmail.com', '082987651234', '$2b$10$ao/M2P196hr2Hl4JI6P3ROimejs9O0EEfq8jbra9O3JYQrEvmjeLi', 1, '2020-11-22 12:08:20', '2021-01-10 08:30:47'),
(5, 'Luqman', 'luqman@gmail.com', '082987651121', '$2b$10$TF7PArSAiwWzxQbuvonOD.TeJiJsaG5QlRNRgl5T.g1UpBBeiIWZK', 1, '2020-11-22 12:09:56', '2021-01-15 14:34:34'),
(6, 'Ahmad Farhan', 'farhan@gmail.com', '082987651222', '$2b$10$YakRc1kLNElFpU6AaD1YJuAOd2kV0gZKV2YvxTdSCHTx.7QHKamtm', 1, '2020-11-22 12:11:06', '2020-11-22 12:11:06'),
(7, 'Zaki Maulana', 'zakimaulana08@gmail.com', '0812988921234', '$2b$10$ki9nsvCZT20yUkc/sBAX9u37mB0uAf.bXodu1/aq.S99aufLLShCm', 0, '2020-11-22 14:51:19', '2021-01-05 06:25:32'),
(8, 'Engelbertus Hendro', 'henddro@gmail.com', '082987651222', '$2b$10$fbX6Cq/LCqvFvSxA7hPl9ele1B9bOPh2g.WGg27kVkKki/ILF/wsC', 1, '2020-11-22 14:55:18', '2020-11-22 14:55:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `company`
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
-- Dumping data untuk tabel `company`
--

INSERT INTO `company` (`cn_id`, `ac_id`, `cn_company`, `cn_position`, `cn_field`, `cn_city`, `cn_description`, `cn_instagram`, `cn_linkedin`, `cn_profile`, `cn_created_at`, `cn_updated_at`) VALUES
(1, 4, 'CV. FORKINDO', 'Worker', 'Pondok Gede', 'Bekasi', 'Komplek kologad no.17', 'cv_forkindo', 'cvforkindos', 'IMG-1606047551201.jpg', '2020-11-22 12:08:20', '2021-01-18 04:25:01'),
(2, 5, 'Go-Hire', 'CEO', 'Tambun', 'Bekasi', 'Regensi II', 'gohire', 'go_hire', 'IMG-1606048186483.jpg', '2020-11-22 12:09:56', '2021-01-18 04:25:15'),
(3, 6, 'E-Hire', 'CEO', 'Cikini', 'Jakarta', 'Pasar Senen', 'e_hire', 'ehire', 'IMG-1606048373263.jpg', '2020-11-22 12:11:06', '2021-01-18 04:25:24'),
(4, 8, 'E-recruitment', 'HRD', 'Jembrana', 'Bali', 'Desa Banyu Biru', 'e_rec', 'erecruitment', 'IMG-1610617791239.jpeg', '2020-11-22 14:55:18', '2021-01-18 04:25:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `engineer`
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
-- Dumping data untuk tabel `engineer`
--

INSERT INTO `engineer` (`en_id`, `ac_id`, `en_job_title`, `en_job_type`, `en_domicile`, `en_description`, `en_profile`, `en_created_at`, `en_updated_at`) VALUES
(1, 1, 'Android Developer', 'full time', 'Pondok Gede', 'Very Good', 'IMG-1606046108860.jpg', '2020-11-22 11:50:51', '2021-01-15 09:07:04'),
(2, 2, 'Web Developer', 'freelance', 'Mojokerto', 'Very Good', 'IMG-1606047904134.jpg', '2020-11-22 11:59:32', '2021-01-05 06:28:44'),
(3, 3, 'Fullstack Android', 'full time', 'Manado', 'Expert', 'IMG-1606048071665.jpg', '2020-11-22 12:00:06', '2020-11-22 12:27:51'),
(4, 7, 'Devops', 'freelance', 'Duta Indah', 'Good', 'IMG-1606048373263.jpg', '2020-11-22 14:51:19', '2021-01-17 16:36:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `experience`
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
-- Dumping data untuk tabel `experience`
--

INSERT INTO `experience` (`ex_id`, `en_id`, `ex_position`, `ex_company`, `ex_start`, `ex_end`, `ex_description`) VALUES
(1, 3, 'Staff IT', 'Bank BNI', '2020-10-01', '2020-11-01', 'Membuat aplikasi bank'),
(2, 3, 'Manager', 'Kompas', '2018-10-12', '2020-11-30', 'Membuat web berita kompas'),
(3, 1, 'Staff Engineer', 'PT. Wasa Mitra Engineering', '2020-10-01', '2020-11-30', 'Membuat web pendataan gudang'),
(4, 1, 'IT Support', 'Gunadarma University Computing Center', '2018-07-11', '2020-11-22', 'Maintenance jaringan'),
(5, 2, 'IT Desaigner', 'Mangaku', '2018-07-11', '2020-11-22', 'Merender gambar dan resolusi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hire`
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
-- Dumping data untuk tabel `hire`
--

INSERT INTO `hire` (`hr_id`, `en_id`, `pj_id`, `hr_price`, `hr_message`, `hr_status`, `hr_date_confirm`, `hr_created_at`) VALUES
(1, 1, 1, 10000000, 'Project 1', 'approve', '2021-01-12 21:33:27', '2020-11-22 13:05:19'),
(2, 1, 2, 20000000, 'Project 2', 'reject', '2021-01-12 21:37:12', '2020-11-22 13:05:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `portfolio`
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
-- Dumping data untuk tabel `portfolio`
--

INSERT INTO `portfolio` (`pr_id`, `en_id`, `pr_app`, `pr_description`, `pr_link_pub`, `pr_link_repo`, `pr_work_place`, `pr_type`, `pr_image`) VALUES
(1, 1, 'EAM WME', 'Web pendataan barang', 'pub1', 'repo1', 'wp1', 'aplikasi mobile', 'IMG-1606050161005.jpg'),
(2, 3, 'Kompas News', 'Aplikasi berita', 'pub3', 'repo3', 'wp3', 'aplikasi mobile', 'IMG-1606049886521.jpg'),
(3, 1, 'Web App', 'Web Application', 'pub1', 'repo1', 'wp1', 'aplikasi web', 'IMG-1606050058662.jpg'),
(4, 1, 'Devops App', 'Devops 1', 'pub1', 'repo1', 'wp1', 'aplikasi web', 'IMG-1606050161005.jpg'),
(5, 2, 'Mangaku App', 'Aplikasi baca komik', 'pub2', 'repo2', 'wp2', 'aplikasi mobile', 'IMG-1610617791239.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `project`
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
-- Dumping data untuk tabel `project`
--

INSERT INTO `project` (`pj_id`, `cn_id`, `pj_project_name`, `pj_description`, `pj_deadline`, `pj_image`, `pj_created_at`, `pj_updated_at`) VALUES
(1, 1, 'Aplikasi Android E-Gaji Berkala', 'Membuat Aplikasi Android Untuk Pengelolaan Gaji Berkala', '2021-03-01', 'IMG-1606050058662.jpg', '2020-11-22 13:00:58', '2021-01-05 02:39:03'),
(2, 1, 'Web Pendataan Barang', 'Membuat Website Pendataan dan Pemeliharaan Asset', '2020-11-30', 'IMG-1606050161005.jpg', '2020-11-22 13:02:41', '2020-11-22 13:02:41'),
(3, 2, 'DevOps', 'Desc Devops', '2020-11-30', 'IMG-1606050161005.jpg', '2020-11-22 13:02:41', '2021-01-15 13:38:03'),
(4, 4, 'Kotlin', 'Desc Kotlin', '2020-11-30', 'IMG-1606050161005.jpg', '2020-11-22 13:02:41', '2021-01-15 13:37:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `skill`
--

CREATE TABLE `skill` (
  `sk_id` int(11) UNSIGNED NOT NULL,
  `en_id` int(11) UNSIGNED NOT NULL,
  `sk_skill_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `skill`
--

INSERT INTO `skill` (`sk_id`, `en_id`, `sk_skill_name`) VALUES
(1, 1, 'Kotlin'),
(3, 2, 'Javascript'),
(4, 3, 'PHP'),
(5, 1, 'PHP'),
(6, 1, 'Javascript'),
(7, 3, 'Golang'),
(8, 3, 'Kotlin'),
(9, 2, 'Kotlin'),
(10, 4, 'Kotlin'),
(13, 1, 'Devops');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ac_id`);

--
-- Indeks untuk tabel `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`cn_id`),
  ADD KEY `ac_id` (`ac_id`);

--
-- Indeks untuk tabel `engineer`
--
ALTER TABLE `engineer`
  ADD PRIMARY KEY (`en_id`),
  ADD KEY `ac_id` (`ac_id`);

--
-- Indeks untuk tabel `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`ex_id`),
  ADD KEY `en_id` (`en_id`) USING BTREE;

--
-- Indeks untuk tabel `hire`
--
ALTER TABLE `hire`
  ADD PRIMARY KEY (`hr_id`),
  ADD KEY `en_id` (`en_id`),
  ADD KEY `pj_id` (`pj_id`);

--
-- Indeks untuk tabel `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`pr_id`),
  ADD KEY `en_id` (`en_id`) USING BTREE;

--
-- Indeks untuk tabel `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`pj_id`),
  ADD KEY `cn_id` (`cn_id`);

--
-- Indeks untuk tabel `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`sk_id`),
  ADD KEY `en_id` (`en_id`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `account`
--
ALTER TABLE `account`
  MODIFY `ac_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `company`
--
ALTER TABLE `company`
  MODIFY `cn_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `engineer`
--
ALTER TABLE `engineer`
  MODIFY `en_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `experience`
--
ALTER TABLE `experience`
  MODIFY `ex_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `hire`
--
ALTER TABLE `hire`
  MODIFY `hr_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `pr_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `project`
--
ALTER TABLE `project`
  MODIFY `pj_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `skill`
--
ALTER TABLE `skill`
  MODIFY `sk_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ac_id_fk` FOREIGN KEY (`ac_id`) REFERENCES `account` (`ac_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `engineer`
--
ALTER TABLE `engineer`
  ADD CONSTRAINT `engineer_ac_id_fk` FOREIGN KEY (`ac_id`) REFERENCES `account` (`ac_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `experience_en_id_fk` FOREIGN KEY (`en_id`) REFERENCES `engineer` (`en_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `hire`
--
ALTER TABLE `hire`
  ADD CONSTRAINT `hire_en_id_fk` FOREIGN KEY (`en_id`) REFERENCES `engineer` (`en_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hire_pj_id_fk` FOREIGN KEY (`pj_id`) REFERENCES `project` (`pj_id`);

--
-- Ketidakleluasaan untuk tabel `portfolio`
--
ALTER TABLE `portfolio`
  ADD CONSTRAINT `portfolio_en_id_fk` FOREIGN KEY (`en_id`) REFERENCES `engineer` (`en_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_cn_id_fk` FOREIGN KEY (`cn_id`) REFERENCES `company` (`cn_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `skill`
--
ALTER TABLE `skill`
  ADD CONSTRAINT `skill_en_id_fk` FOREIGN KEY (`en_id`) REFERENCES `engineer` (`en_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
