-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2023 at 02:06 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parkonichomeservices`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Yahya Bakleh', 'bakleh99yahya@gmail.com', '$2y$10$xNX6..3YUF1Nr0eL8vVQAeGePFpopA5iiriJqytcxmF7U80YAkF7O', '', '2023-01-17 06:18:29', '2023-01-17 06:18:29'),
(2, 'kamal', 'kamal@gmail.com', '$2y$10$xNX6..3YUF1Nr0eL8vVQAeGePFpopA5iiriJqytcxmF7U80YAkF7O', NULL, '2023-01-25 12:48:21', '2023-01-25 12:48:21');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'jlt', '2023-02-02 08:05:58', '2023-02-02 00:00:00'),
(2, 'Dmcc', NULL, NULL),
(3, 'Central points', NULL, '2023-02-05 11:59:49'),
(4, 'ibn batota', NULL, NULL),
(5, 'Gardens', NULL, NULL),
(6, 'marina', NULL, NULL),
(7, 'jumira', NULL, NULL),
(8, 'jvc', NULL, NULL),
(9, 'union', NULL, NULL),
(10, 'others', NULL, NULL),
(12, 'news', '2023-02-12 12:02:51', '2023-02-12 12:02:51');

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `area_id` int(11) NOT NULL,
  `parkonic_residantial` int(11) NOT NULL DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`id`, `name`, `location`, `area_id`, `parkonic_residantial`, `updated_at`, `created_at`) VALUES
(1, 'G tower', 'jvc', 1, 0, '2023-03-05 11:28:06', '2023-01-12 14:53:19'),
(2, 'HDS', 'jlt', 1, 0, '2023-03-02 04:15:10', '2023-01-16 08:20:18'),
(3, 'f tower', 'jvc', 1, 0, '2023-03-02 04:14:31', NULL),
(5, 't tower', 't area', 1, 0, NULL, NULL),
(6, 'n tawer', 'n area', 1, 0, NULL, NULL),
(7, 's tawer', 's area', 1, 0, NULL, NULL),
(8, 'k tower', 'k area', 1, 0, '2023-03-02 04:15:50', NULL),
(9, 'y tower', 'y area', 1, 0, NULL, NULL),
(10, 'g building', 's area', 1, 0, '2023-03-02 04:14:44', NULL),
(12, 'b tower', 'b area', 1, 1, '2023-03-02 04:14:20', NULL),
(13, 't tower', 't area', 1, 0, NULL, NULL),
(14, 'n tawer', 'n area', 1, 0, NULL, NULL),
(15, 's tawer', 's area', 1, 0, NULL, NULL),
(16, 'k tower', 'k area', 1, 0, NULL, NULL),
(17, 'y tower', 'y area', 1, 0, NULL, NULL),
(19, 'news', '...', 1, 0, '2023-01-19 05:37:37', '2023-01-19 05:37:37'),
(20, 'wwwwwwww', 'wwwww', 1, 0, '2023-01-19 05:40:47', '2023-01-19 05:40:47'),
(21, 'news', 'wwwww', 3, 0, '2023-02-05 13:45:32', '2023-02-05 13:45:32'),
(22, 'rrtrtrtrtrtrt', '...qewrwerwdf', 8, 0, '2023-02-05 13:46:37', '2023-02-05 13:46:37'),
(23, 'asdfasdasd', 'asdasdawd', 3, 1, '2023-03-02 04:14:08', '2023-02-05 13:47:43'),
(24, 'HDS', 'DMCC', 2, 1, '2023-03-02 04:15:24', '2023-02-26 08:14:03'),
(25, 'HDS', 'DMCC', 2, 1, '2023-03-02 04:15:38', '2023-02-26 08:20:51'),
(26, 'HDS', 'DMCC', 2, 1, '2023-03-02 04:13:54', '2023-02-26 08:21:38'),
(27, 'International Building', 'DMCC', 4, 1, '2023-03-08 07:08:54', '2023-03-08 07:07:55');

-- --------------------------------------------------------

--
-- Table structure for table `building_services`
--

CREATE TABLE `building_services` (
  `id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `building_services`
--

INSERT INTO `building_services` (`id`, `building_id`, `service_id`, `created_at`, `updated_at`) VALUES
(6, 26, 1, '2023-03-02 04:13:54', '2023-03-02 04:13:54'),
(7, 26, 2, '2023-03-02 04:13:54', '2023-03-02 04:13:54'),
(8, 26, 3, '2023-03-02 04:13:54', '2023-03-02 04:13:54'),
(9, 26, 11, '2023-03-02 04:13:54', '2023-03-02 04:13:54'),
(10, 26, 12, '2023-03-02 04:13:54', '2023-03-02 04:13:54'),
(11, 23, 1, '2023-03-02 04:14:08', '2023-03-02 04:14:08'),
(12, 23, 2, '2023-03-02 04:14:08', '2023-03-02 04:14:08'),
(13, 23, 3, '2023-03-02 04:14:08', '2023-03-02 04:14:08'),
(14, 23, 11, '2023-03-02 04:14:08', '2023-03-02 04:14:08'),
(15, 23, 12, '2023-03-02 04:14:08', '2023-03-02 04:14:08'),
(16, 12, 1, '2023-03-02 04:14:20', '2023-03-02 04:14:20'),
(17, 12, 2, '2023-03-02 04:14:20', '2023-03-02 04:14:20'),
(18, 12, 3, '2023-03-02 04:14:20', '2023-03-02 04:14:20'),
(19, 12, 11, '2023-03-02 04:14:20', '2023-03-02 04:14:20'),
(20, 12, 12, '2023-03-02 04:14:20', '2023-03-02 04:14:20'),
(21, 3, 1, '2023-03-02 04:14:31', '2023-03-02 04:14:31'),
(22, 3, 2, '2023-03-02 04:14:31', '2023-03-02 04:14:31'),
(23, 3, 3, '2023-03-02 04:14:31', '2023-03-02 04:14:31'),
(24, 3, 11, '2023-03-02 04:14:31', '2023-03-02 04:14:31'),
(25, 3, 12, '2023-03-02 04:14:31', '2023-03-02 04:14:31'),
(26, 10, 1, '2023-03-02 04:14:44', '2023-03-02 04:14:44'),
(27, 10, 2, '2023-03-02 04:14:44', '2023-03-02 04:14:44'),
(28, 10, 3, '2023-03-02 04:14:44', '2023-03-02 04:14:44'),
(29, 10, 11, '2023-03-02 04:14:44', '2023-03-02 04:14:44'),
(30, 10, 12, '2023-03-02 04:14:44', '2023-03-02 04:14:44'),
(36, 2, 1, '2023-03-02 04:15:10', '2023-03-02 04:15:10'),
(37, 2, 2, '2023-03-02 04:15:10', '2023-03-02 04:15:10'),
(38, 2, 3, '2023-03-02 04:15:10', '2023-03-02 04:15:10'),
(39, 2, 11, '2023-03-02 04:15:10', '2023-03-02 04:15:10'),
(40, 2, 12, '2023-03-02 04:15:10', '2023-03-02 04:15:10'),
(41, 24, 1, '2023-03-02 04:15:24', '2023-03-02 04:15:24'),
(42, 24, 2, '2023-03-02 04:15:24', '2023-03-02 04:15:24'),
(43, 24, 3, '2023-03-02 04:15:24', '2023-03-02 04:15:24'),
(44, 24, 11, '2023-03-02 04:15:24', '2023-03-02 04:15:24'),
(45, 24, 12, '2023-03-02 04:15:24', '2023-03-02 04:15:24'),
(46, 25, 1, '2023-03-02 04:15:38', '2023-03-02 04:15:38'),
(47, 25, 2, '2023-03-02 04:15:38', '2023-03-02 04:15:38'),
(48, 25, 3, '2023-03-02 04:15:38', '2023-03-02 04:15:38'),
(49, 25, 11, '2023-03-02 04:15:38', '2023-03-02 04:15:38'),
(50, 25, 12, '2023-03-02 04:15:38', '2023-03-02 04:15:38'),
(51, 8, 1, '2023-03-02 04:15:50', '2023-03-02 04:15:50'),
(52, 8, 2, '2023-03-02 04:15:50', '2023-03-02 04:15:50'),
(53, 8, 3, '2023-03-02 04:15:50', '2023-03-02 04:15:50'),
(54, 8, 11, '2023-03-02 04:15:50', '2023-03-02 04:15:50'),
(55, 8, 12, '2023-03-02 04:15:50', '2023-03-02 04:15:50'),
(61, 1, 1, '2023-03-05 11:28:06', '2023-03-05 11:28:06'),
(62, 1, 2, '2023-03-05 11:28:06', '2023-03-05 11:28:06'),
(63, 1, 3, '2023-03-05 11:28:06', '2023-03-05 11:28:06'),
(64, 1, 11, '2023-03-05 11:28:06', '2023-03-05 11:28:06'),
(65, 1, 12, '2023-03-05 11:28:06', '2023-03-05 11:28:06'),
(76, 27, 1, '2023-03-08 07:08:54', '2023-03-08 07:08:54'),
(77, 27, 2, '2023-03-08 07:08:54', '2023-03-08 07:08:54'),
(78, 27, 3, '2023-03-08 07:08:54', '2023-03-08 07:08:54'),
(79, 27, 11, '2023-03-08 07:08:54', '2023-03-08 07:08:54'),
(80, 27, 12, '2023-03-08 07:08:54', '2023-03-08 07:08:54');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `plate_number` varchar(255) NOT NULL,
  `emirate` varchar(255) DEFAULT NULL,
  `plate_code` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `type`, `user_id`, `plate_number`, `emirate`, `plate_code`, `created_at`, `updated_at`) VALUES
(67, 'suv', 116, '12312', 'Dubai', 'v', '2023-02-22 11:48:04', '2023-02-22 11:48:04'),
(68, 'Sedan', 118, '1446', 'Sharjah', '1446', '2023-02-23 11:21:13', '2023-02-23 11:21:13'),
(69, 'Hatchback', 118, '432', 'Abu Dhabi', '432', '2023-02-23 12:02:46', '2023-02-23 12:02:46'),
(70, 'Sedan', 118, '2324', 'Sharjah', '2324', '2023-02-26 07:36:42', '2023-02-26 07:36:42'),
(71, 'Sedan', 124, '45023', 'Dubai', '45023', '2023-03-07 10:28:50', '2023-03-07 10:28:50'),
(72, 'Sedan', 125, '1235', 'Dubai', '1235', '2023-03-08 05:15:34', '2023-03-08 05:15:34'),
(73, 'Sedan', 126, '1234', 'Abu Dhabi', '1234', '2023-03-08 05:55:42', '2023-03-08 05:55:42'),
(74, 'Sedan', 129, '12345', 'Dubai', '12345', '2023-03-08 12:15:12', '2023-03-08 12:15:12');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `services_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `picture_url` varchar(255) DEFAULT NULL,
  `picture_path` varchar(255) DEFAULT NULL,
  `discription` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `services_id`, `name`, `picture_url`, `picture_path`, `discription`, `created_at`, `updated_at`) VALUES
(1, 1, 'packages', 'https://32d8-94-200-29-94.in.ngrok.io/categories_images/1675753378.png', '/categories_images/Image_a.png', 'now we give new services/but here we give the same services', '2023-01-22 09:30:32', '2023-01-22 09:30:32'),
(2, 1, 'Exterior', 'https://f2ec-94-200-29-94.in.ngrok.io/categories_images/Image_b.png', '/categories_images/Image_b.png', 'we provide multiple services/second of all ', '2023-01-24 08:36:26', '2023-03-08 10:30:30'),
(4, 1, 'interior', 'https://32d8-94-200-29-94.in.ngrok.io/categories_images/Image_c.png', '/categories_images/Image_c.png', 'thired/fifth', '2023-01-24 12:47:14', '2023-01-24 13:19:47'),
(5, 1, 'add ons', 'https://32d8-94-200-29-94.in.ngrok.io/categories_images/Image_e.png', '/categories_images/1675753378.png', 'non paid service/paid services', '2023-01-26 11:04:08', '2023-02-07 07:02:58'),
(7, 3, 'test', 'https://32d8-94-200-29-94.in.ngrok.io/categories_images/1676376063.png', '/categories_images/1676376063.png', 'test/test', '2023-02-14 12:01:03', '2023-02-14 12:01:03'),
(8, 2, 'Hourly', 'https://f2ec-94-200-29-94.in.ngrok.io/categories_images/1678271753.png', '/categories_images/1678271753.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry./Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-02-14 12:02:01', '2023-03-08 10:35:53'),
(9, 3, 'Full Gas', 'https://32d8-94-200-29-94.in.ngrok.io/categories_images/1677477908.jpeg', '/categories_images/1677477908.jpeg', 'provide fulling your car with gas', '2023-02-27 06:05:08', '2023-02-27 06:05:08'),
(10, 11, 'one hand made', 'https://32d8-94-200-29-94.in.ngrok.io/categories_images/1677478220.jpeg', '/categories_images/1677478220.jpeg', '1/2', '2023-02-27 06:10:20', '2023-02-27 06:10:20'),
(11, 12, 'SUV', 'https://32d8-94-200-29-94.in.ngrok.io/categories_images/1677478220.jpeg', '/categories_images/1677669858.png', 'family car/big sized car', '2023-03-01 11:24:18', '2023-03-01 11:24:18'),
(12, 12, 'Sports Car', 'https://32d8-94-200-29-94.in.ngrok.io/categories_images/1677669963.png', '/categories_images/1677669963.png', 'Fast car/good looking car', '2023-03-01 11:26:03', '2023-03-01 11:26:03'),
(13, 12, 'Sedan', 'https://32d8-94-200-29-94.in.ngrok.io/categories_images/1677670026.png', '/categories_images/1677670026.png', 'regular car/gas saving car', '2023-03-01 11:27:06', '2023-03-01 11:27:06'),
(14, 12, 'Luxury', 'https://32d8-94-200-29-94.in.ngrok.io/categories_images/1677670120.png', '/categories_images/1677670120.png', 'Comfortable car/reach people car', '2023-03-01 11:28:40', '2023-03-01 11:28:40'),
(15, 2, 'Subscription', 'https://f2ec-94-200-29-94.in.ngrok.io/categories_images/1678271868.png', '/categories_images/1678271868.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry./Lorem Ipsum is simply dummy text of the printing and typesetting industry./Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-03-08 10:37:48', '2023-03-08 10:37:48'),
(16, 2, 'Deep-Cleaning', 'https://f2ec-94-200-29-94.in.ngrok.io/categories_images/1678272126.png', '/categories_images/1678272126.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry./Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-03-08 10:42:06', '2023-03-08 10:42:06'),
(17, 2, 'Carpet Cleaning', 'https://f2ec-94-200-29-94.in.ngrok.io/categories_images/1678272165.png', '/categories_images/1678272165.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry./Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-03-08 10:42:45', '2023-03-08 10:42:45'),
(18, 11, 'Driver', 'https://f2ec-94-200-29-94.in.ngrok.io/categories_images/1678272235.png', '/categories_images/1678272235.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry./Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-03-08 10:43:55', '2023-03-08 10:43:55'),
(19, 11, 'Nanny', 'https://f2ec-94-200-29-94.in.ngrok.io/categories_images/1678272295.png', '/categories_images/1678272295.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry./Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-03-08 10:44:55', '2023-03-08 10:44:55'),
(20, 11, 'Server (Private event)', 'https://f2ec-94-200-29-94.in.ngrok.io/categories_images/1678272362.png', '/categories_images/1678272362.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry./Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-03-08 10:46:02', '2023-03-08 10:46:02'),
(21, 11, 'Butler', 'https://f2ec-94-200-29-94.in.ngrok.io/categories_images/1678272422.png', '/categories_images/1678272422.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry./Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-03-08 10:47:02', '2023-03-08 10:47:02');

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `locker_charge_for_services` varchar(255) NOT NULL DEFAULT '0',
  `show_staff` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `locker_charge_for_services`, `show_staff`) VALUES
(1, '10', 0);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locker`
--

CREATE TABLE `locker` (
  `id` int(11) NOT NULL,
  `number` varchar(255) NOT NULL,
  `building_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locker_user`
--

CREATE TABLE `locker_user` (
  `id` bigint(20) NOT NULL,
  `locker_id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_12_22_172801_create_users_verify_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notificationmangment`
--

CREATE TABLE `notificationmangment` (
  `id` int(11) NOT NULL,
  `event` varchar(255) NOT NULL,
  `notify` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notificationmangment`
--

INSERT INTO `notificationmangment` (`id`, `event`, `notify`, `created_at`, `updated_at`) VALUES
(1, 'services', 1, NULL, '2023-03-01 08:44:48'),
(2, 'categories', 1, NULL, '2023-03-01 08:44:48'),
(3, 'subservices', 1, NULL, '2023-03-01 08:44:48'),
(4, 'area', 1, NULL, '2023-03-01 08:44:48'),
(5, 'promotion', 1, NULL, '2023-03-01 08:44:48'),
(6, 'building', 1, NULL, '2023-03-01 08:44:48');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `time` time NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `status`, `created_at`, `updated_at`, `date`, `time`) VALUES
(1, 118, 'Placed an order', 'you have placed an order successfully', 0, '2023-03-06 17:57:31', '2023-03-06 00:00:00', '2023-03-07', '09:35:28'),
(2, 118, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22', '2023-03-07', '09:35:28'),
(3, 118, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-06 14:16:45', '2023-03-06 14:16:45', '2023-03-07', '09:35:28'),
(4, 124, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-07 10:31:30', '2023-03-07 10:31:30', '2023-03-07', '14:31:30'),
(5, 124, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-07 10:32:19', '2023-03-07 10:32:19', '2023-03-07', '14:32:19'),
(6, 124, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-07 10:33:56', '2023-03-07 10:33:56', '2023-03-07', '14:33:56'),
(7, 118, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-07 11:03:00', '2023-03-07 11:03:00', '2023-03-07', '15:03:00'),
(8, 118, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-07 11:08:16', '2023-03-07 11:08:16', '2023-03-07', '15:08:16'),
(9, 125, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-08 05:16:41', '2023-03-08 05:16:41', '2023-03-08', '09:16:41'),
(10, 125, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-08 05:36:10', '2023-03-08 05:36:10', '2023-03-08', '09:36:10'),
(11, 126, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-08 05:56:14', '2023-03-08 05:56:14', '2023-03-08', '09:56:14'),
(12, 125, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-08 08:46:01', '2023-03-08 08:46:01', '2023-03-08', '12:46:01'),
(13, 125, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-08 08:47:28', '2023-03-08 08:47:28', '2023-03-08', '12:47:28'),
(14, 125, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-08 08:52:02', '2023-03-08 08:52:02', '2023-03-08', '12:52:02'),
(15, 126, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-08 09:01:49', '2023-03-08 09:01:49', '2023-03-08', '13:01:49'),
(16, 126, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-08 09:02:52', '2023-03-08 09:02:52', '2023-03-08', '13:02:52'),
(17, 126, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-08 09:06:06', '2023-03-08 09:06:06', '2023-03-08', '13:06:06'),
(18, 129, 'placing an order', 'You have placed an order Successfully', 0, '2023-03-08 12:23:32', '2023-03-08 12:23:32', '2023-03-08', '16:23:32');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` int(11) NOT NULL,
  `total_price` varchar(255) NOT NULL DEFAULT '0',
  `discount` int(11) NOT NULL DEFAULT 0,
  `is_promotion` int(11) NOT NULL DEFAULT 0,
  `payment_status` int(11) NOT NULL DEFAULT 1,
  `reference_number` varchar(255) DEFAULT NULL,
  `number_of_dates` int(11) NOT NULL DEFAULT 1,
  `special_number` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `service_id`, `total_price`, `discount`, `is_promotion`, `payment_status`, `reference_number`, `number_of_dates`, `special_number`, `created_at`, `updated_at`) VALUES
(235, 118, 12, '110.0', 0, 0, 1, NULL, 0, 'PVVSVNQD', '2023-03-06 13:02:17', '2023-03-06 13:02:17'),
(236, 118, 1, '26.0', 0, 0, 1, NULL, 0, 'XNGE4OW0', '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(237, 118, 1, '26.0', 0, 0, 1, NULL, 0, 'DNQFJZTH', '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(238, 118, 1, '26.0', 0, 0, 1, NULL, 0, 'OSRT9S8S', '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(239, 118, 2, '105.0', 0, 0, 1, NULL, 0, 'BQFV7LLV', '2023-03-06 14:16:43', '2023-03-06 14:16:43'),
(240, 124, 2, '105.0', 0, 0, 1, NULL, 0, 'F9TMGU6J', '2023-03-07 10:31:28', '2023-03-07 10:31:28'),
(241, 124, 2, '105.0', 0, 0, 1, NULL, 0, 'PWVBDJED', '2023-03-07 10:32:18', '2023-03-07 10:32:18'),
(242, 124, 2, '105.0', 0, 0, 1, NULL, 0, 'LKQ5B1BM', '2023-03-07 10:33:55', '2023-03-07 10:33:55'),
(243, 118, 1, '21.0', 0, 0, 1, NULL, 0, 'P76DZTH0', '2023-03-07 11:02:59', '2023-03-07 11:02:59'),
(244, 118, 1, '21.0', 0, 0, 1, NULL, 0, '8ULGHZ8C', '2023-03-07 11:08:16', '2023-03-07 11:08:16'),
(245, 125, 1, '26.0', 0, 0, 1, NULL, 0, '1FADFBKR', '2023-03-08 05:16:40', '2023-03-08 05:16:40'),
(246, 125, 1, '21.0', 0, 0, 1, NULL, 0, '6OCADR5V', '2023-03-08 05:36:09', '2023-03-08 05:36:09'),
(247, 126, 1, '21.0', 0, 0, 1, NULL, 0, '0XS4SSC2', '2023-03-08 05:56:14', '2023-03-08 05:56:14'),
(248, 125, 1, '26.0', 0, 0, 1, NULL, 0, '2GMSEXT7', '2023-03-08 08:46:00', '2023-03-08 08:46:00'),
(249, 125, 1, '26.0', 0, 0, 1, NULL, 0, 'ODX4WKAS', '2023-03-08 08:47:28', '2023-03-08 08:47:28'),
(250, 125, 1, '21.0', 0, 1, 1, NULL, 0, '2WJUNZNI', '2023-03-08 08:52:01', '2023-03-08 08:52:01'),
(251, 126, 1, '47.0', 0, 0, 1, NULL, 0, 'NY8SX2ND', '2023-03-08 09:01:47', '2023-03-08 09:01:47'),
(252, 126, 1, '47.0', 0, 1, 1, NULL, 0, 'ZNYTWL3L', '2023-03-08 09:02:51', '2023-03-08 09:02:51'),
(253, 126, 1, '21.0', 0, 0, 1, NULL, 0, 'XEWOFHQX', '2023-03-08 09:06:05', '2023-03-08 09:06:05'),
(254, 129, 1, '31.0', 0, 0, 1, NULL, 0, 'HODZ8FLN', '2023-03-08 12:23:29', '2023-03-08 12:23:29');

-- --------------------------------------------------------

--
-- Table structure for table `order_date_time`
--

CREATE TABLE `order_date_time` (
  `id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_date_time`
--

INSERT INTO `order_date_time` (`id`, `order_detail_id`, `date`, `time_from`, `time_to`, `status`, `created_at`, `updated_at`) VALUES
(322, 224, '2023-03-22', '15:00:00', '00:00:00', 0, '2023-03-06 13:02:17', '2023-03-06 13:02:17'),
(323, 225, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(324, 225, '2023-03-14', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(325, 225, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(326, 225, '2023-03-20', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(327, 225, '2023-03-15', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(328, 225, '2023-03-16', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(329, 225, '2023-03-21', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(330, 225, '2023-03-24', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(331, 226, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(332, 226, '2023-03-14', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(333, 226, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(334, 226, '2023-03-20', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(335, 226, '2023-03-15', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(336, 226, '2023-03-16', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(337, 226, '2023-03-21', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(338, 226, '2023-03-24', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(339, 227, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(340, 227, '2023-03-14', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(341, 227, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(342, 227, '2023-03-20', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(343, 227, '2023-03-15', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(344, 227, '2023-03-16', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(345, 227, '2023-03-21', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(346, 227, '2023-03-24', '15:00:00', '00:00:00', 0, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(347, 228, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(348, 228, '2023-03-14', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(349, 228, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(350, 228, '2023-03-20', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(351, 228, '2023-03-15', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(352, 228, '2023-03-16', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(353, 228, '2023-03-21', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(354, 228, '2023-03-24', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(355, 229, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(356, 229, '2023-03-14', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(357, 229, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(358, 229, '2023-03-20', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(359, 229, '2023-03-15', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(360, 229, '2023-03-16', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(361, 229, '2023-03-21', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(362, 229, '2023-03-24', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(363, 230, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(364, 230, '2023-03-14', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(365, 230, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(366, 230, '2023-03-20', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(367, 230, '2023-03-15', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(368, 230, '2023-03-16', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(369, 230, '2023-03-21', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(370, 230, '2023-03-24', '15:00:00', '00:00:00', 0, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(371, 231, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(372, 231, '2023-03-14', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(373, 231, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(374, 231, '2023-03-20', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(375, 231, '2023-03-15', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(376, 231, '2023-03-16', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(377, 231, '2023-03-21', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(378, 231, '2023-03-24', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(379, 232, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(380, 232, '2023-03-14', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(381, 232, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(382, 232, '2023-03-20', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(383, 232, '2023-03-15', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(384, 232, '2023-03-16', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(385, 232, '2023-03-21', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(386, 232, '2023-03-24', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(387, 233, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(388, 233, '2023-03-14', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(389, 233, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(390, 233, '2023-03-20', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(391, 233, '2023-03-15', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(392, 233, '2023-03-16', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(393, 233, '2023-03-21', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(394, 233, '2023-03-24', '15:00:00', '00:00:00', 0, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(395, 234, '2023-03-16', '18:00:00', '00:00:00', 0, '2023-03-06 14:16:43', '2023-03-06 14:16:43'),
(396, 234, '2023-03-22', '18:00:00', '00:00:00', 0, '2023-03-06 14:16:43', '2023-03-06 14:16:43'),
(397, 234, '2023-03-09', '18:00:00', '00:00:00', 0, '2023-03-06 14:16:43', '2023-03-06 14:16:43'),
(398, 235, '2023-03-16', '18:00:00', '00:00:00', 0, '2023-03-06 14:16:43', '2023-03-06 14:16:43'),
(399, 235, '2023-03-22', '18:00:00', '00:00:00', 0, '2023-03-06 14:16:43', '2023-03-06 14:16:43'),
(400, 235, '2023-03-09', '18:00:00', '00:00:00', 0, '2023-03-06 14:16:43', '2023-03-06 14:16:43'),
(401, 236, '2023-03-07', '18:00:00', '00:00:00', 0, '2023-03-07 10:31:28', '2023-03-07 10:31:28'),
(402, 237, '2023-03-07', '18:00:00', '00:00:00', 0, '2023-03-07 10:32:18', '2023-03-07 10:32:18'),
(403, 238, '2023-03-07', '18:00:00', '00:00:00', 0, '2023-03-07 10:33:55', '2023-03-07 10:33:55'),
(404, 239, '2023-03-16', '15:00:00', '00:00:00', 0, '2023-03-07 11:02:59', '2023-03-07 11:02:59'),
(405, 240, '2023-03-15', '15:00:00', '00:00:00', 0, '2023-03-07 11:08:16', '2023-03-07 11:08:16'),
(406, 241, '2023-03-15', '15:00:00', '00:00:00', 0, '2023-03-08 05:16:40', '2023-03-08 05:16:40'),
(407, 242, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-08 05:36:09', '2023-03-08 05:36:09'),
(408, 243, '2023-03-22', '15:00:00', '00:00:00', 0, '2023-03-08 05:56:14', '2023-03-08 05:56:14'),
(409, 243, '2023-03-13', '15:00:00', '00:00:00', 0, '2023-03-08 05:56:14', '2023-03-08 05:56:14'),
(410, 244, '2023-03-10', '15:00:00', '00:00:00', 0, '2023-03-08 08:46:00', '2023-03-08 08:46:00'),
(411, 244, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-08 08:46:00', '2023-03-08 08:46:00'),
(412, 245, '2023-03-10', '15:00:00', '00:00:00', 0, '2023-03-08 08:47:28', '2023-03-08 08:47:28'),
(413, 245, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-08 08:47:28', '2023-03-08 08:47:28'),
(414, 246, '2023-03-23', '15:00:00', '00:00:00', 0, '2023-03-08 08:52:01', '2023-03-08 08:52:01'),
(415, 247, '2023-03-16', '15:00:00', '00:00:00', 0, '2023-03-08 09:01:47', '2023-03-08 09:01:47'),
(416, 247, '2023-03-16', '15:00:00', '00:00:00', 0, '2023-03-08 09:01:47', '2023-03-08 09:01:47'),
(417, 247, '2023-03-22', '15:00:00', '00:00:00', 0, '2023-03-08 09:01:47', '2023-03-08 09:01:47'),
(418, 248, '2023-03-16', '15:00:00', '00:00:00', 0, '2023-03-08 09:02:51', '2023-03-08 09:02:51'),
(419, 248, '2023-03-16', '15:00:00', '00:00:00', 0, '2023-03-08 09:02:51', '2023-03-08 09:02:51'),
(420, 248, '2023-03-22', '15:00:00', '00:00:00', 0, '2023-03-08 09:02:51', '2023-03-08 09:02:51'),
(421, 248, '2023-03-24', '15:00:00', '00:00:00', 0, '2023-03-08 09:02:51', '2023-03-08 09:02:51'),
(422, 249, '2023-03-22', '15:00:00', '00:00:00', 0, '2023-03-08 09:06:05', '2023-03-08 09:06:05'),
(423, 249, '2023-03-24', '15:00:00', '00:00:00', 0, '2023-03-08 09:06:05', '2023-03-08 09:06:05'),
(424, 250, '2023-03-14', '15:00:00', '00:00:00', 0, '2023-03-08 12:23:29', '2023-03-08 12:23:29');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `subservice_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `is_locker` int(11) NOT NULL DEFAULT 0,
  `locker_id` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `service_type` varchar(255) DEFAULT NULL,
  `car_id` bigint(20) UNSIGNED DEFAULT NULL,
  `appartment_number` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `orders_id`, `subservice_id`, `categories_id`, `staff_id`, `is_locker`, `locker_id`, `phone`, `status`, `service_type`, `car_id`, `appartment_number`, `price`, `created_at`, `updated_at`) VALUES
(224, 235, 27, 11, NULL, 0, NULL, '1234568758', 0, 'car_rental', 0, 'f', 1, '2023-03-06 13:02:17', '2023-03-06 13:02:17'),
(225, 236, 1, 1, NULL, 0, NULL, '0852436456', 0, 'car', 68, 'f', 1, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(226, 236, 1, 1, NULL, 0, NULL, '0852436456', 0, 'car', 70, 'f', 1, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(227, 236, 1, 1, NULL, 0, NULL, '0852436456', 0, 'car', 69, 'f', 1, '2023-03-06 13:40:49', '2023-03-06 13:40:49'),
(228, 237, 1, 1, NULL, 0, NULL, '0852436456', 0, 'car', 68, 'f', 1, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(229, 237, 1, 1, NULL, 0, NULL, '0852436456', 0, 'car', 70, 'f', 1, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(230, 237, 1, 1, NULL, 0, NULL, '0852436456', 0, 'car', 69, 'f', 1, '2023-03-06 13:41:07', '2023-03-06 13:41:07'),
(231, 238, 1, 1, NULL, 0, NULL, '0852436456', 0, 'car', 68, 'f', 1, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(232, 238, 1, 1, NULL, 0, NULL, '0852436456', 0, 'car', 70, 'f', 1, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(233, 238, 1, 1, NULL, 0, NULL, '0852436456', 0, 'car', 69, 'f', 1, '2023-03-06 14:12:22', '2023-03-06 14:12:22'),
(234, 239, 24, 8, NULL, 0, NULL, '2555555555', 0, 'other', 0, 'f', 1, '2023-03-06 14:16:43', '2023-03-06 14:16:43'),
(235, 239, 24, 8, NULL, 0, NULL, '2555555555', 0, 'other', 0, 'f', 1, '2023-03-06 14:16:43', '2023-03-06 14:16:43'),
(236, 240, 24, 8, NULL, 0, NULL, '0504163041', 1, 'other', 0, '506', 1, '2023-03-07 10:31:28', '2023-03-07 10:34:23'),
(237, 241, 24, 8, NULL, 0, NULL, '0504163041', 0, 'other', 0, '506', 1, '2023-03-07 10:32:18', '2023-03-07 10:32:18'),
(238, 242, 24, 8, NULL, 0, NULL, '0504163041', 0, 'other', 0, '506', 1, '2023-03-07 10:33:55', '2023-03-07 10:33:55'),
(239, 243, 1, 1, NULL, 0, NULL, '0852465856', 0, 'car', 68, 'f', 1, '2023-03-07 11:02:59', '2023-03-07 11:02:59'),
(240, 244, 1, 1, NULL, 0, NULL, '1234565258', 0, 'car', 68, 'f', 20, '2023-03-07 11:08:16', '2023-03-07 11:08:16'),
(241, 245, 1, 1, NULL, 0, NULL, '0964588455', 0, 'car', 72, 'jhjghhjjh', 20, '2023-03-08 05:16:40', '2023-03-08 05:16:40'),
(242, 246, 1, 1, NULL, 0, NULL, '1234568486', 0, 'car', 72, 'jhjghhjjh', 20, '2023-03-08 05:36:09', '2023-03-08 05:36:09'),
(243, 247, 1, 1, NULL, 0, NULL, '1234584855', 0, 'car', 73, 'blue sky', 20, '2023-03-08 05:56:14', '2023-03-08 05:56:14'),
(244, 248, 1, 1, NULL, 0, NULL, '1234568788', 0, 'car', 72, 'jhjghhjjh', 20, '2023-03-08 08:46:00', '2023-03-08 08:46:00'),
(245, 249, 1, 1, NULL, 0, NULL, '1234568788', 0, 'car', 72, 'jhjghhjjh', 20, '2023-03-08 08:47:28', '2023-03-08 08:47:28'),
(246, 250, 1, 1, NULL, 0, NULL, '1234568588', 0, 'car', 72, 'jhjghhjjh', 20, '2023-03-08 08:52:01', '2023-03-08 08:52:01'),
(247, 251, 2, 2, NULL, 0, NULL, '1236545588', 0, 'car', 73, 'blue sky', 40, '2023-03-08 09:01:47', '2023-03-08 09:01:47'),
(248, 252, 2, 2, NULL, 0, NULL, '1236545588', 0, 'car', 73, 'blue sky', 40, '2023-03-08 09:02:51', '2023-03-08 09:02:51'),
(249, 253, 1, 1, NULL, 0, NULL, '1234564855', 0, 'car', 73, 'blue sky', 20, '2023-03-08 09:06:05', '2023-03-08 09:06:05'),
(250, 254, 1, 1, NULL, 0, NULL, '0562342342', 0, 'car', 74, 'blue sky', 20, '2023-03-08 12:23:29', '2023-03-08 12:23:29');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `pin` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `pin`, `created_at`) VALUES
('kamalbaloch9000@gmail.com', '3951', '2023-01-17 06:59:28'),
('masoodkhan11@gmail.com', '7527', '2023-01-19 02:20:25'),
('yahya@gmail.com', '3930', '2023-01-17 04:50:21');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(29, 'App\\Models\\User', 116, 'bakleh99yahya@gmail.com_Token', 'aefc2e7453dafff6dff88c908364ec9639146f5aedc1712faa8e876dae23a2c0', '[\"user\"]', '2023-02-23 07:25:08', NULL, '2023-02-22 03:04:18', '2023-02-23 07:25:08'),
(30, 'App\\Models\\User', 117, 'kk@gmail.com_Token', '797e64dc0a31532894261a556518437b62094659368d653eea9b3ae279064280', '[\"user\"]', '2023-02-23 07:43:27', NULL, '2023-02-22 04:52:46', '2023-02-23 07:43:27'),
(32, 'App\\Models\\User', 116, 'bakleh99yahya@gmail.com_Token', '3a4421539466b81500a8b85d590718c31de688ee1d626de6adaa8c85f0f6d453', '[\"user\"]', '2023-03-07 04:58:27', NULL, '2023-02-23 06:06:15', '2023-03-07 04:58:27'),
(46, 'App\\Models\\User', 120, 'kkn@gmail.con_Token', '1e7b3fabe590860422ee6202e1507404d86cc366d3e3188f418f8f63b062beb2', '[\"user\"]', '2023-03-07 14:18:30', NULL, '2023-03-02 04:44:49', '2023-03-07 14:18:30'),
(48, 'App\\Models\\User', 120, 'kkn@gmail.con_Token', '06f438254ce470477ab88d4cf0d54811fa6aadffee64d696eace74161fa4b18e', '[\"user\"]', '2023-03-05 07:53:41', NULL, '2023-03-05 07:53:11', '2023-03-05 07:53:41'),
(49, 'App\\Models\\User', 120, 'kkn@gmail.con_Token', 'fb5081fded48164d19bba1caf71db4a230121211164f9e74ef6b3cb7d39205f2', '[\"user\"]', '2023-03-05 07:57:38', NULL, '2023-03-05 07:55:01', '2023-03-05 07:57:38'),
(74, 'App\\Models\\User', 124, 'jibin@parkonic.com_Token', '05d00cb939cdcdc773ef5118186d9a2528863412ba6ac44d57459c4f2f20a2ca', '[\"user\"]', '2023-03-07 09:33:13', NULL, '2023-03-07 07:11:38', '2023-03-07 09:33:13'),
(90, 'App\\Models\\User', 126, 'kkp@gmail.com_Token', '56317e507b9ccff7137aa3d8c97f9f3fbb591045a458120303e592d52f690de4', '[\"user\"]', '2023-03-08 07:25:24', NULL, '2023-03-08 01:54:59', '2023-03-08 07:25:24'),
(92, 'App\\Models\\User', 118, 'kkn@gmail.com_Token', 'ed9dc30591fbfa73caba93f51c211702fd88c9003a0c359e926453822103b514', '[\"user\"]', NULL, NULL, '2023-03-08 04:36:42', '2023-03-08 04:36:42'),
(93, 'App\\Models\\User', 118, 'kkn@gmail.com_Token', '01174b6638d6343ffe00cc7c2db75ca423e7c70c5a1b3c33aa4a46ebd9e0a228', '[\"user\"]', '2023-03-08 04:55:52', NULL, '2023-03-08 04:55:35', '2023-03-08 04:55:52'),
(94, 'App\\Models\\User', 126, 'kkp@gmail.com_Token', '9bc35bc7e3d431b9b0456b82b63067a518b021d34948ad3012883bdc14208cb1', '[\"user\"]', '2023-03-08 05:20:32', NULL, '2023-03-08 04:57:03', '2023-03-08 05:20:32'),
(95, 'App\\Models\\User', 126, 'kkp@gmail.com_Token', 'a912a81c42f28d3298141845d82b69632cd672ed48d94945fe72e656d8f86fc0', '[\"user\"]', '2023-03-08 04:57:48', NULL, '2023-03-08 04:57:30', '2023-03-08 04:57:48'),
(96, 'App\\Models\\User', 126, 'kkp@gmail.com_Token', 'd69a9ba58a597533c376af9df0f452150c0afae45afe15c01f8215fc22b638f3', '[\"user\"]', NULL, NULL, '2023-03-08 07:19:10', '2023-03-08 07:19:10'),
(97, 'App\\Models\\User', 129, 'kamalkhan@gmail.com_Token', 'd1336da5aaf4c7619f20bbd25789bc0f056a89651b6d2db7cfae1cd97b42407f', '[\"user\"]', '2023-03-08 08:23:34', NULL, '2023-03-08 08:14:15', '2023-03-08 08:23:34');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `picture_url` varchar(255) NOT NULL,
  `picture_path` varchar(255) DEFAULT NULL,
  `discount` varchar(255) NOT NULL,
  `total_price` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`id`, `title`, `picture_url`, `picture_path`, `discount`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 'this is a test promotion', 'https://32d8-94-200-29-94.in.ngrok.io/promotion_images/promotions_salon_at_home.png', '/promotion_images/promotions_salon_at_home.png', '20', '160', '2023-02-05 09:08:00', '2023-02-19 13:57:57'),
(2, 'this is a test promotion2', 'https://32d8-94-200-29-94.in.ngrok.io/promotion_images/promotions_part_time.png', '/promotion_images/promotions_part_time.png', '20', '80', '2023-02-05 09:08:00', '2023-02-09 05:54:49'),
(5, 'news', 'https://32d8-94-200-29-94.in.ngrok.io/promotion_images/1675777917.png', '/promotion_images/1675777917.png', '20', '160', '2023-02-07 13:51:57', '2023-02-08 07:19:12'),
(6, 'test', 'https://32d8-94-200-29-94.in.ngrok.io/promotion_images/1675778137.png', '/promotion_images/1675778137.png', '10', '198', '2023-02-07 13:55:37', '2023-02-09 05:54:41'),
(8, '50 off', 'https://32d8-94-200-29-94.in.ngrok.io/promotion_images/1675944784.png', '/promotion_images/1675944784.png', '50', '50', '2023-02-09 12:13:04', '2023-02-09 12:13:04');

-- --------------------------------------------------------

--
-- Table structure for table `promotion_subservices`
--

CREATE TABLE `promotion_subservices` (
  `id` int(11) NOT NULL,
  `promotions_id` int(11) NOT NULL,
  `subservice_id` int(11) NOT NULL,
  `price` varchar(200) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotion_subservices`
--

INSERT INTO `promotion_subservices` (`id`, `promotions_id`, `subservice_id`, `price`, `created_at`, `updated_at`) VALUES
(39, 5, 1, '16', '2023-02-08 13:49:43', '2023-02-08 13:49:43'),
(40, 5, 2, '32', '2023-02-08 13:49:43', '2023-02-08 13:49:43'),
(41, 5, 3, '48', '2023-02-08 13:49:43', '2023-02-08 13:49:43'),
(42, 5, 15, '64', '2023-02-08 13:49:43', '2023-02-08 13:49:43'),
(43, 6, 1, '18', '2023-02-09 05:54:41', '2023-02-09 05:54:41'),
(44, 6, 2, '36', '2023-02-09 05:54:41', '2023-02-09 05:54:41'),
(45, 6, 3, '54', '2023-02-09 05:54:41', '2023-02-09 05:54:41'),
(46, 6, 15, '72', '2023-02-09 05:54:41', '2023-02-09 05:54:41'),
(47, 6, 16, '18', '2023-02-09 05:54:41', '2023-02-09 05:54:41'),
(48, 2, 2, '32', '2023-02-09 05:54:49', '2023-02-09 05:54:49'),
(49, 2, 3, '48', '2023-02-09 05:54:49', '2023-02-09 05:54:49'),
(50, 8, 1, '10', '2023-02-09 12:13:04', '2023-02-09 12:13:04'),
(51, 8, 3, '30', '2023-02-09 12:13:04', '2023-02-09 12:13:04'),
(52, 8, 16, '10', '2023-02-09 12:13:04', '2023-02-09 12:13:04'),
(53, 1, 2, '32', '2023-02-19 13:57:57', '2023-02-19 13:57:57'),
(54, 1, 3, '48', '2023-02-19 13:57:57', '2023-02-19 13:57:57'),
(55, 1, 15, '64', '2023-02-19 13:57:57', '2023-02-19 13:57:57');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `picture_url` varchar(255) DEFAULT NULL,
  `picture_path` varchar(255) DEFAULT NULL,
  `item_type` varchar(255) DEFAULT NULL,
  `comming_soon` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `picture_url`, `picture_path`, `item_type`, `comming_soon`, `created_at`, `updated_at`) VALUES
(1, 'Car Wash', 'https://f2ec-94-200-29-94.in.ngrok.io/services_images/1678262131.png', '/services_images/1678262131.png', 'car', 0, '2023-01-15 09:48:16', '2023-03-08 07:55:31'),
(2, 'Cleaning Services', 'https://f2ec-94-200-29-94.in.ngrok.io/services_images/1678261495.png', '/services_images/1678261495.png', 'other', 0, '2023-01-16 10:02:34', '2023-03-08 07:44:55'),
(3, 'Car Refuel', 'https://f2ec-94-200-29-94.in.ngrok.io/services_images/1678261462.png', '/services_images/1678261462.png', 'car', 0, '2023-01-15 10:02:34', '2023-03-08 07:44:22'),
(6, 'spa and massage', 'https://f2ec-94-200-29-94.in.ngrok.io/services_images/1678263750.png', '/services_images/1678263750.png', 'other', 1, '2023-02-06 07:32:20', '2023-03-08 08:22:30'),
(7, 'salon for man', 'https://f2ec-94-200-29-94.in.ngrok.io/services_images/1678263221.png', '/services_images/1678263221.png', 'other', 1, '2023-02-06 07:35:04', '2023-03-08 08:13:41'),
(8, 'salon for women', 'https://f2ec-94-200-29-94.in.ngrok.io/services_images/1678263430.png', '/services_images/1678263430.png', 'other', 1, '2023-02-06 07:40:24', '2023-03-08 08:17:10'),
(9, 'Spa', 'https://f2ec-94-200-29-94.in.ngrok.io/services_images/1678263574.png', '/services_images/1678263574.png', 'other', 1, '2023-02-06 07:41:40', '2023-03-08 08:19:34'),
(10, 'Handyman', 'https://f2ec-94-200-29-94.in.ngrok.io/services_images/1678262700.png', '/services_images/1678262700.png', 'other', 1, '2023-02-06 07:43:28', '2023-03-08 08:05:00'),
(11, 'Part Time Services', 'https://f2ec-94-200-29-94.in.ngrok.io/services_images/1678262948.png', '/services_images/1678262948.png', 'other', 0, '2023-02-06 07:44:23', '2023-03-08 08:09:08'),
(12, 'Rent A Car', 'https://f2ec-94-200-29-94.in.ngrok.io/services_images/1678261512.png', '/services_images/1678261512.png', 'car_rental', 0, '2023-03-01 11:22:33', '2023-03-08 07:45:12');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `services_id` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rate` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `email`, `phone`, `services_id`, `password`, `rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Yahya Bakleh', 'bakleh99yahya@gmail.com', '0562438455', 1, '$2y$10$dB83bVMz8Eg4Sr5k/peUqe8nWGHHdrX9VL0RoEs.t1byci/UbZLEi', 4, 0, '2023-02-06 06:59:16', '2023-02-06 06:59:16'),
(2, 'Yahya Bakleh', 'bakleh909yahya@gmail.com', '0562438466', 1, '$2y$10$VgHW1AWXxcdsCxHLGcD0n.t/S4xKk83Pexb7b1Vzvnygs5tYg10b.', 4, 0, '2023-02-20 07:34:04', '2023-02-20 07:34:04'),
(3, 'test', 'test@test.com', '0562412345', 1, '$2y$10$jruJ8G7UJcd4d5AdU4KTZ.z8g4Sa3aOE93thpDl77AA45ab74J1/y', 3, 0, '2023-02-20 10:23:15', '2023-02-20 10:23:15');

-- --------------------------------------------------------

--
-- Table structure for table `stuff_password_resets`
--

CREATE TABLE `stuff_password_resets` (
  `email` varchar(255) NOT NULL,
  `pin` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stuff_password_resets`
--

INSERT INTO `stuff_password_resets` (`email`, `pin`, `created_at`) VALUES
('kk22@gm.com', '2289', '2023-01-26 07:18:06'),
('stuff@suitelife.com', '1182', '2023-01-26 04:42:05');

-- --------------------------------------------------------

--
-- Table structure for table `sub_services`
--

CREATE TABLE `sub_services` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(225) NOT NULL,
  `number_of_dates` int(11) NOT NULL DEFAULT 1,
  `promotion_from` time DEFAULT NULL,
  `promotion_to` time DEFAULT NULL,
  `discount` varchar(255) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_services`
--

INSERT INTO `sub_services` (`id`, `service_id`, `category_id`, `name`, `price`, `number_of_dates`, `promotion_from`, `promotion_to`, `discount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'one time', '20', 1, '06:41:00', '18:42:00', '11', NULL, '2023-02-14 13:41:27'),
(2, 1, 2, '1 per week', '40', 1, '05:10:00', '23:10:00', '20', NULL, '2023-02-13 12:10:03'),
(3, 1, 4, '2 per week', '60', 2, '04:10:00', '20:10:00', '8', NULL, '2023-02-13 12:10:35'),
(15, 1, 5, '1 per month', '80', 1, '16:18:00', '15:17:00', '45', '2023-01-26 11:04:23', '2023-02-14 13:42:21'),
(16, 1, 2, 'one time', '20', 1, '05:41:00', '14:41:00', '22', '2023-02-07 10:05:18', '2023-02-14 13:41:53'),
(21, 1, 5, 'news', '250', 1, '07:40:00', '21:40:00', '20', '2023-02-08 12:59:26', '2023-02-14 13:40:47'),
(22, 1, 1, 'news', '250', 1, '05:42:00', '14:42:00', '44', '2023-02-08 13:02:04', '2023-02-14 13:43:36'),
(24, 2, 8, '1 hour', '100', 1, '07:00:00', '17:00:00', '10', '2023-02-27 06:01:02', '2023-03-08 11:17:43'),
(25, 3, 9, 'two times per month', '250', 1, '17:00:00', '22:00:00', '20', '2023-02-27 06:06:30', '2023-02-27 06:06:30'),
(26, 11, 10, '1 hour', '250', 1, '10:10:00', '10:11:00', '0', '2023-02-27 06:11:08', '2023-02-27 06:11:08'),
(27, 12, 11, 'Daily', '100', 1, '00:00:00', '15:00:00', '0', NULL, '2023-03-05 09:43:49'),
(28, 12, 11, 'Monthly', '300', 1, '15:56:00', '15:56:00', '0', '2023-03-01 11:56:39', '2023-03-01 12:03:29'),
(29, 12, 11, 'Weekly', '200', 1, '16:00:00', '04:00:00', '0', '2023-03-01 12:00:36', '2023-03-01 12:00:36'),
(30, 2, 8, '2 houres', '100', 1, '17:00:00', '19:00:00', '0', '2023-03-08 10:54:41', '2023-03-08 10:54:41'),
(31, 2, 8, '3 houres', '200', 1, '16:00:00', '16:00:00', '0', '2023-03-08 10:55:56', '2023-03-08 10:55:56'),
(32, 2, 15, '1 per week', '400', 4, '15:00:00', '15:30:00', '0', '2023-03-08 11:01:52', '2023-03-08 11:01:52'),
(33, 2, 15, '2 per month', '200', 2, '16:03:00', '04:04:00', '0', '2023-03-08 11:02:48', '2023-03-08 11:02:48'),
(34, 2, 16, '1 room', '300', 1, '18:00:00', '20:00:00', '0', '2023-03-08 11:05:05', '2023-03-08 11:05:05'),
(35, 2, 16, '2 room', '300', 1, '15:00:00', '19:00:00', '0', '2023-03-08 11:06:12', '2023-03-08 11:06:12'),
(36, 2, 17, '1 carpet', '250', 1, '15:07:00', '03:07:00', '0', '2023-03-08 11:07:14', '2023-03-08 11:07:14'),
(37, 2, 17, '5 carpet and less', '600', 1, '15:13:00', '19:13:00', '0', '2023-03-08 11:13:30', '2023-03-08 11:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `time_slote`
--

CREATE TABLE `time_slote` (
  `id` int(11) NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `time_slote`
--

INSERT INTO `time_slote` (`id`, `time_from`, `time_to`, `updated_at`, `created_at`) VALUES
(1, '09:00:00', '00:00:00', NULL, NULL),
(11, '10:00:00', '00:00:00', NULL, NULL),
(12, '11:00:00', '00:00:00', NULL, NULL),
(15, '12:00:00', '00:00:00', '2023-02-08 10:59:22', '2023-02-08 10:59:22'),
(16, '15:00:00', '00:00:00', '2023-02-08 10:59:43', '2023-02-08 10:59:43'),
(17, '18:00:00', '00:00:00', '2023-02-08 10:59:56', '2023-02-08 10:59:56'),
(18, '08:00:00', '00:00:00', '2023-02-09 12:17:31', '2023-02-09 12:17:31'),
(19, '00:00:00', '03:00:00', '2023-02-28 08:31:04', '2023-02-28 08:31:04');

-- --------------------------------------------------------

--
-- Table structure for table `time_slote_subservices`
--

CREATE TABLE `time_slote_subservices` (
  `id` int(11) NOT NULL,
  `sub_services_id` int(11) NOT NULL,
  `time_slote_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `time_slote_subservices`
--

INSERT INTO `time_slote_subservices` (`id`, `sub_services_id`, `time_slote_id`, `created_at`, `updated_at`) VALUES
(33, 2, 11, '2023-02-13 12:10:03', '2023-02-13 12:10:03'),
(34, 2, 15, '2023-02-13 12:10:03', '2023-02-13 12:10:03'),
(35, 2, 16, '2023-02-13 12:10:03', '2023-02-13 12:10:03'),
(36, 3, 1, '2023-02-13 12:10:35', '2023-02-13 12:10:35'),
(37, 3, 12, '2023-02-13 12:10:35', '2023-02-13 12:10:35'),
(38, 3, 17, '2023-02-13 12:10:35', '2023-02-13 12:10:35'),
(39, 21, 1, '2023-02-14 13:40:47', '2023-02-14 13:40:47'),
(40, 21, 11, '2023-02-14 13:40:47', '2023-02-14 13:40:47'),
(41, 21, 12, '2023-02-14 13:40:47', '2023-02-14 13:40:47'),
(42, 21, 15, '2023-02-14 13:40:47', '2023-02-14 13:40:47'),
(43, 21, 16, '2023-02-14 13:40:47', '2023-02-14 13:40:47'),
(44, 21, 17, '2023-02-14 13:40:47', '2023-02-14 13:40:47'),
(45, 1, 1, '2023-02-14 13:41:27', '2023-02-14 13:41:27'),
(46, 1, 11, '2023-02-14 13:41:27', '2023-02-14 13:41:27'),
(47, 1, 12, '2023-02-14 13:41:27', '2023-02-14 13:41:27'),
(48, 1, 16, '2023-02-14 13:41:27', '2023-02-14 13:41:27'),
(49, 16, 12, '2023-02-14 13:41:53', '2023-02-14 13:41:53'),
(50, 16, 16, '2023-02-14 13:41:53', '2023-02-14 13:41:53'),
(56, 15, 1, '2023-02-14 13:42:21', '2023-02-14 13:42:21'),
(57, 15, 11, '2023-02-14 13:42:21', '2023-02-14 13:42:21'),
(58, 15, 12, '2023-02-14 13:42:21', '2023-02-14 13:42:21'),
(59, 22, 11, '2023-02-14 13:43:36', '2023-02-14 13:43:36'),
(60, 22, 12, '2023-02-14 13:43:36', '2023-02-14 13:43:36'),
(61, 22, 15, '2023-02-14 13:43:36', '2023-02-14 13:43:36'),
(62, 22, 16, '2023-02-14 13:43:36', '2023-02-14 13:43:36'),
(63, 22, 17, '2023-02-14 13:43:36', '2023-02-14 13:43:36'),
(67, 25, 1, '2023-02-27 06:06:30', '2023-02-27 06:06:30'),
(68, 25, 11, '2023-02-27 06:06:30', '2023-02-27 06:06:30'),
(69, 25, 15, '2023-02-27 06:06:30', '2023-02-27 06:06:30'),
(70, 25, 16, '2023-02-27 06:06:30', '2023-02-27 06:06:30'),
(71, 26, 1, '2023-02-27 06:11:08', '2023-02-27 06:11:08'),
(72, 26, 16, '2023-02-27 06:11:08', '2023-02-27 06:11:08'),
(75, 29, 1, '2023-03-01 12:00:36', '2023-03-01 12:00:36'),
(76, 29, 12, '2023-03-01 12:00:36', '2023-03-01 12:00:36'),
(77, 29, 15, '2023-03-01 12:00:36', '2023-03-01 12:00:36'),
(78, 28, 12, '2023-03-01 12:03:29', '2023-03-01 12:03:29'),
(79, 28, 18, '2023-03-01 12:03:29', '2023-03-01 12:03:29'),
(80, 27, 1, '2023-03-05 09:43:49', '2023-03-05 09:43:49'),
(81, 27, 11, '2023-03-05 09:43:49', '2023-03-05 09:43:49'),
(82, 27, 12, '2023-03-05 09:43:49', '2023-03-05 09:43:49'),
(83, 27, 16, '2023-03-05 09:43:49', '2023-03-05 09:43:49'),
(84, 30, 1, '2023-03-08 10:54:41', '2023-03-08 10:54:41'),
(85, 30, 12, '2023-03-08 10:54:41', '2023-03-08 10:54:41'),
(86, 30, 16, '2023-03-08 10:54:41', '2023-03-08 10:54:41'),
(87, 31, 11, '2023-03-08 10:55:56', '2023-03-08 10:55:56'),
(88, 31, 16, '2023-03-08 10:55:56', '2023-03-08 10:55:56'),
(89, 32, 1, '2023-03-08 11:01:52', '2023-03-08 11:01:52'),
(90, 32, 11, '2023-03-08 11:01:52', '2023-03-08 11:01:52'),
(91, 32, 12, '2023-03-08 11:01:52', '2023-03-08 11:01:52'),
(92, 32, 15, '2023-03-08 11:01:52', '2023-03-08 11:01:52'),
(93, 33, 1, '2023-03-08 11:02:48', '2023-03-08 11:02:48'),
(94, 33, 11, '2023-03-08 11:02:48', '2023-03-08 11:02:48'),
(95, 33, 12, '2023-03-08 11:02:48', '2023-03-08 11:02:48'),
(96, 33, 15, '2023-03-08 11:02:48', '2023-03-08 11:02:48'),
(97, 33, 16, '2023-03-08 11:02:48', '2023-03-08 11:02:48'),
(98, 34, 11, '2023-03-08 11:05:05', '2023-03-08 11:05:05'),
(99, 34, 12, '2023-03-08 11:05:05', '2023-03-08 11:05:05'),
(100, 34, 15, '2023-03-08 11:05:05', '2023-03-08 11:05:05'),
(101, 35, 11, '2023-03-08 11:06:12', '2023-03-08 11:06:12'),
(102, 35, 16, '2023-03-08 11:06:12', '2023-03-08 11:06:12'),
(103, 35, 17, '2023-03-08 11:06:12', '2023-03-08 11:06:12'),
(104, 36, 1, '2023-03-08 11:07:14', '2023-03-08 11:07:14'),
(105, 36, 11, '2023-03-08 11:07:14', '2023-03-08 11:07:14'),
(106, 37, 1, '2023-03-08 11:13:30', '2023-03-08 11:13:30'),
(107, 37, 15, '2023-03-08 11:13:30', '2023-03-08 11:13:30'),
(108, 37, 17, '2023-03-08 11:13:30', '2023-03-08 11:13:30'),
(109, 24, 1, '2023-03-08 11:17:43', '2023-03-08 11:17:43'),
(110, 24, 16, '2023-03-08 11:17:43', '2023-03-08 11:17:43'),
(111, 24, 17, '2023-03-08 11:17:43', '2023-03-08 11:17:43');

-- --------------------------------------------------------

--
-- Table structure for table `two_step_verification`
--

CREATE TABLE `two_step_verification` (
  `phone` varchar(255) NOT NULL,
  `pin` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `two_step_verification`
--

INSERT INTO `two_step_verification` (`phone`, `pin`, `created_at`) VALUES
('0000007586', '6229', '2023-01-30 02:04:52'),
('0008589643', '8920', '2023-01-30 02:15:35'),
('0050008000', '7461', '2023-02-09 08:00:27'),
('0562438455', '4205', '2023-01-30 07:14:36'),
('0852654713', '1817', '2023-02-02 08:56:54'),
('0894648521', '7844', '2023-03-08 05:39:38'),
('0896327852', '2689', '2023-02-09 06:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `appartment_number` varchar(200) NOT NULL,
  `building_id` int(11) NOT NULL DEFAULT 0,
  `area_id` int(11) DEFAULT 0,
  `address` text DEFAULT NULL,
  `area_address` text DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `device_key` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `agree` tinyint(4) NOT NULL DEFAULT 0,
  `two_step` tinyint(4) NOT NULL DEFAULT 0,
  `login_attempts` int(11) NOT NULL DEFAULT 0,
  `last_login` datetime DEFAULT current_timestamp(),
  `blockdatetime` datetime DEFAULT NULL,
  `user_level_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `appartment_number`, `building_id`, `area_id`, `address`, `area_address`, `email_verified_at`, `password`, `remember_token`, `device_key`, `created_at`, `updated_at`, `is_email_verified`, `is_phone_verified`, `agree`, `two_step`, `login_attempts`, `last_login`, `blockdatetime`, `user_level_id`) VALUES
(116, 'Yahya Bakleh', 'bakleh99yahya@gmail.com', '0562438455', '4404', 5, 1, NULL, NULL, NULL, '$2y$10$sWL7louAZKvRgB6boaJD3.py6HXvWNPGx.etcXnl1gedhwnT3156G', NULL, 'cHw-aCd1SlChPrrQE4ehaG:APA91bErMfIyoDZWoUo5Y20ZTSl0Bb5WXRrcMD1bmNpci8g6vZF7MAKd0VfozVCEqpQ9GM0UqOZk6AZxbeURoIgeYPpNKtIhNwtrcvnfPCIRRaMpYAgLAA-QBorvsxImAois9t9xiUTG', '2023-02-22 01:41:40', '2023-02-22 03:04:18', 0, 0, 1, 0, 0, '2023-02-22 09:41:40', NULL, 0),
(117, 'kk@gmail.com', 'kk@gmail.com', '0000000000', 'm', 1, 2, NULL, NULL, NULL, '$2y$10$/jWjc9gvObrJIbguVKPo4edyRKPMki31g/A5TqpoImO56WAHo4Coy', NULL, 'ePcspvu8RGaFA4UiqEA3qb:APA91bGW_CsQdG8RYCru6wlZARatYuipgcQk8FzXYqnWfFDDHhEfezH1UIRPjybxUgA3-oP2luYd5eHoRmBgBySjtpGwf_r9GC-KznDkZ2WjfSQZt1x0QFB8Lalea-Yf9h95WFXu6DXl', '2023-02-22 04:52:27', '2023-02-22 04:52:46', 0, 0, 1, 0, 0, '2023-02-22 12:52:27', NULL, 0),
(118, 'kkn@gmail.com', 'kkn@gmail.com', '0852369524', 'f', 1, 1, NULL, NULL, NULL, '$2y$10$8Yk10tjVtEjP8QpvkML16egPL/615jBPemgdpcyZdJbWNfIZGoJFa', NULL, 'cHw-aCd1SlChPrrQE4ehaG:APA91bErMfIyoDZWoUo5Y20ZTSl0Bb5WXRrcMD1bmNpci8g6vZF7MAKd0VfozVCEqpQ9GM0UqOZk6AZxbeURoIgeYPpNKtIhNwtrcvnfPCIRRaMpYAgLAA-QBorvsxImAois9t9xiUTG', '2023-02-23 03:55:57', '2023-03-07 12:09:21', 0, 0, 1, 0, 0, '2023-02-23 11:55:57', NULL, 0),
(119, 'Yahya Bakleh', 'bakleh959yahya@gmail.com', '0562438355', '2706', 1, 1, NULL, NULL, NULL, '$2y$10$8GCEuABVnT4/J1uuEAGYMOqAHjCS1zkvkrfp6TX2f/QbSHzpIB7X2', NULL, NULL, '2023-02-26 01:32:46', '2023-02-26 01:32:46', 0, 0, 1, 0, 0, '2023-02-26 09:32:46', NULL, 0),
(120, 'kkop', 'kkn@gmail.con', '1538630111', '012', 1, 1, NULL, NULL, NULL, '$2y$10$LjqgS4IvTgwxFA/AnK40tOMIpgV.FkuEtYcw8fpkRtePJNcjXLHJa', NULL, 'cHw-aCd1SlChPrrQE4ehaG:APA91bErMfIyoDZWoUo5Y20ZTSl0Bb5WXRrcMD1bmNpci8g6vZF7MAKd0VfozVCEqpQ9GM0UqOZk6AZxbeURoIgeYPpNKtIhNwtrcvnfPCIRRaMpYAgLAA-QBorvsxImAois9t9xiUTG', '2023-03-02 04:44:03', '2023-03-02 04:44:49', 0, 0, 1, 0, 0, '2023-03-02 12:44:03', NULL, 0),
(121, 'kkop', 'kknn@gmail.com', '1538630189', '012', 1, 1, NULL, NULL, NULL, '$2y$10$j5EQIy9aQvBcMDpl8BLWG.orLURai0L0n1gX7ARXIdACv1ZR1UXtu', NULL, NULL, '2023-03-07 04:05:11', '2023-03-07 04:05:11', 0, 0, 1, 0, 0, '2023-03-07 12:05:11', NULL, NULL),
(122, 'baloch@gmail.com', 'baloch@gmail.com', '0853465488', 'gggh', 1, 1, NULL, NULL, NULL, '$2y$10$fxnxrUK5IY11ozfMAecrFeoiPQGrQOekzB2Bd0/t9T5ngAgK/hRUa', NULL, NULL, '2023-03-07 04:05:18', '2023-03-07 04:05:18', 0, 0, 1, 1, 0, '2023-03-07 12:05:18', NULL, NULL),
(124, 'jibin@parkonic.com', 'jibin@parkonic.com', '0504163041', '506', 2, 1, NULL, NULL, NULL, '$2y$10$vYgFDv1vTIPcpuMMBWGzdu3dmY0Ceh9CRXVhTJHrT0crJ8FapfITK', NULL, 'mhghgfuhbgfdeswaesertdyfughuj', '2023-03-07 06:22:50', '2023-03-07 06:37:35', 0, 0, 1, 0, 0, '2023-03-07 14:22:50', NULL, NULL),
(125, 'kkz@gmail.com', 'kkz@gmail.com', '0785256358', 'jhjghhjjh', 2, 1, NULL, NULL, NULL, '$2y$10$NNMWrAFFfN0FtIgdKgGpEe1BhtX.zLqkH1BIw6I3ds.m9dSTYv2Ze', NULL, 'fXu_ZvdcQfeBp6_mg7GnpM:APA91bEyv2w_jIR-HUCbe76F2gwU5aqDT-kJoxjhtXI9fiT80SKKXP7LwLGnty6HCaJV-GHIYYDmK_hS6loYST_DsWKLIPYX1U92B0t9Mbuildz_ccYBPetHZXKYMZYKdHWExQ9GTaNG', '2023-03-07 14:23:04', '2023-03-08 01:35:35', 0, 0, 1, 0, 0, '2023-03-07 22:23:04', NULL, NULL),
(126, 'kkp@gmail.com', 'kkp@gmail.com', '0896431254', 'blue sky', 1, 1, NULL, NULL, NULL, '$2y$10$W4LD.ImgFpX3d19PU0e2Q.B7REAa2.UMr76IfRT.tsEMjUb82JdTS', NULL, 'cHw-aCd1SlChPrrQE4ehaG:APA91bErMfIyoDZWoUo5Y20ZTSl0Bb5WXRrcMD1bmNpci8g6vZF7MAKd0VfozVCEqpQ9GM0UqOZk6AZxbeURoIgeYPpNKtIhNwtrcvnfPCIRRaMpYAgLAA-QBorvsxImAois9t9xiUTG', '2023-03-08 01:54:18', '2023-03-08 04:57:30', 0, 0, 1, 0, 0, '2023-03-08 09:54:18', NULL, NULL),
(128, 'salman@gmail.com', 'salman@gmail.com', '0894648521', 'Blue sky', 2, 1, NULL, NULL, NULL, '$2y$10$aFyhgAYEeIKrm3tNJ39Qg.VaIgZ/pnfIgPM14fKrguh/0kd.8GoOC', NULL, NULL, '2023-03-08 05:39:09', '2023-03-08 05:39:09', 0, 0, 1, 1, 0, '2023-03-08 13:39:09', NULL, NULL),
(129, 'kamalkhan@gmail.com', 'kamalkhan@gmail.com', '0123456787', 'blue sky', 1, 1, NULL, NULL, NULL, '$2y$10$VGHbBxL7YjV6TJf9x2tEf.NUV1B1X1/rVvrpYyahnW05T8P/hr8/i', NULL, 'fswhf2IXTReu_lheW7vn8p:APA91bHEBBe0MqJzBI2_dc0OkeyTx6GewXiGaSmS9BcwA8KkBFGSLLe_SN3cZ4hgXC93uNT71BxsOjf84vy6cWoIWYG3UJ5d928dp8e3WFc2ooZtrkRaG92dTBcQ9qWxI_fhulquEUSR', '2023-03-08 08:13:30', '2023-03-08 08:14:15', 0, 0, 1, 0, 0, '2023-03-08 16:13:30', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_verify`
--

CREATE TABLE `users_verify` (
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_verify`
--

INSERT INTO `users_verify` (`user_id`, `token`, `created_at`, `updated_at`) VALUES
(6, 'G7QNciOBy1G0a3wjTkhvTTJcm4fUO2hamhrZqS1iBmyZAVahTW22fXjHwjaUpKaB', '2023-01-12 04:11:30', '2023-01-12 04:11:30'),
(7, 'z6cHYQTN1yHBDlpJ6xeWZ5SwxSp4edDFQlJWsctrJGrwMsDeO5sCBE4PVUD9Xgj9', '2023-01-12 04:11:55', '2023-01-12 04:11:55'),
(8, 'Qwu6SnA9hVr3w89AHKPDOHg1vY6fet0jon3cYHgwhXoyrLnhBxcQ1IzyKYeSfDIp', '2023-01-12 07:13:11', '2023-01-12 07:13:11'),
(9, 'IOClR39W7app0HGPEOchQbkVOI22DZoHF4q8lu1hyqVljCIt3uMkup8BrtmwOQWC', '2023-01-12 08:07:12', '2023-01-12 08:07:12'),
(17, 'mey6WUGrvi6RP9MfWraaIRlXdR0v7aszAVBrqXmtDjOxNzGEgBUe2scSf52p4pQB', '2023-01-12 08:32:56', '2023-01-12 08:32:56'),
(18, 'SmJUORMJqLOAHQFggd7GtedWT1hKOQRvaVlwNyoijoCmIGPaQeQ92dHBCwF8nlTE', '2023-01-12 08:33:53', '2023-01-12 08:33:53'),
(19, 'Gr6GS6MIF7ermisjpLXnR7Q2MzFhaNSoFNfFbCpVMc3ImTz2B1MNk2CmiDtCkWNx', '2023-01-12 08:33:59', '2023-01-12 08:33:59'),
(20, 'Yx1ErmA5yuCOnmyEyGgD9RcSIgP549LD6nSA5M1b2D4l4f7wMCw4X5BkCMhe2mBQ', '2023-01-12 08:34:40', '2023-01-12 08:34:40'),
(21, 'gKX1rzQMWgWY79gaTjiB8i6o0Zf7rmFrd0uDOQzF8ZxcYiPs9WzbLRLAiexbkZi7', '2023-01-12 08:37:37', '2023-01-12 08:37:37'),
(22, 'cmK4SkzPSZ0hrjHF0sjoRGSgJlojJ345uCaYwSnWr9zAObMGc3QkKgDVWhwOofXH', '2023-01-12 08:47:54', '2023-01-12 08:47:54'),
(23, 'zE1ggKRW4GTw5fmLjuTUO2MFGIJVQLN1idF5bqsK7CeF48DHj1yHtyGulApXl27q', '2023-01-12 09:34:13', '2023-01-12 09:34:13'),
(24, 'LPIMxfAKHEwJPNk4hctit0ggKyW0KmKU3Wmwb6x9wkrI9Ox17skOtcVRoBjBjFut', '2023-01-12 09:34:54', '2023-01-12 09:34:54'),
(25, 'DbXexcE87N277OYOwfPj3ppVAml3ieOOMrGB9TDbD0jqOOiW98pAhW7ZY57Hq4VD', '2023-01-12 09:38:45', '2023-01-12 09:38:45'),
(26, 'C49PagoLn9xIqMKUQH2ppXozQOSccyfqKwNKTA0e8wUaszwKEpO9r5SyHu1RsitL', '2023-01-12 09:40:10', '2023-01-12 09:40:10'),
(27, 'NJ3beDXJFKhtaIUyZLPxj2zXUla3ssbcGiHmv40MIPuWCcnZo3EUwXqv4HL8cqvv', '2023-01-12 09:41:11', '2023-01-12 09:41:11'),
(28, '4xxcuXu4s92oUcHBw5FVYPXNKFcSTpAmvoZH6uoZVDuY9EyRtvfcoCJgOBSHA45R', '2023-01-12 09:47:24', '2023-01-12 09:47:24'),
(29, '2gw5inzY6iCMB9FO00mVijZUvtdp4c44kwnGx3oOocDPX2HVWxyQl2DUzWm5qhnA', '2023-01-12 09:48:11', '2023-01-12 09:48:11'),
(30, 'Fxc3qPKdSnNsYYvkuSXV7Rr3jrOJjfelRgfNY75v9PQdRtaCTdUadgtkMPReBqOY', '2023-01-15 01:54:37', '2023-01-15 01:54:37'),
(31, '3nhdtbnTYT50o4UIYPsAhJuG39IiSgOGRRgiINO2mCSB4uTZl4isflApYsyLY7Jh', '2023-01-15 02:22:52', '2023-01-15 02:22:52'),
(32, 'x7wjtReV5rEljhIWf1tJzYMXYywXpnV5Cr4ec5DmujrdWQyGE8zEVxKv5blJatsZ', '2023-01-15 02:24:06', '2023-01-15 02:24:06'),
(33, '188sJ7BsQAVeUuPgvwbkQn1cfsHlXfk1XWMKgxt1f952CJjXEwpNIpgsPAoGkv9z', '2023-01-15 02:45:01', '2023-01-15 02:45:01'),
(34, 'gtoY6qCqfSycTzVJZecEXPqw8CW4YykkeZt2W8EEDALetP8qDiZVG0EhpzySzhwA', '2023-01-15 02:53:26', '2023-01-15 02:53:26'),
(35, 'cyxQwr31ibMgtbBsNzoPW7zTEAzyK6zGem33i7DaSeV08Dvs6aAqEwdU22bp839s', '2023-01-15 03:02:29', '2023-01-15 03:02:29'),
(36, '1KpHwaMxrdH9uGYK3YDCc7P8jD6jBFBwqoixngcurJcEhtCMHPzNrTitxBsX3ZmY', '2023-01-15 03:05:05', '2023-01-15 03:05:05'),
(37, 'iDwN8jjZ6grstPFe1RJj4xDJ8b4xxcNi3fK0rxzwu3r4SvXV0ZLE1GF6lsXQHV7j', '2023-01-15 03:05:55', '2023-01-15 03:05:55'),
(38, 'xlyHRu5nEkm3tYwIQiid4wg5G7lEXaYr6ziDoVSaj2uCHRd1eaA7iHpLU9lJepB6', '2023-01-15 03:18:04', '2023-01-15 03:18:04'),
(39, '4CH9EEt7QaGfWn7ireH4COHGq80rxjMaHx6S8rXN91qTXS9yErq6OwkK21G6gnkr', '2023-01-15 03:21:25', '2023-01-15 03:21:25'),
(40, 'UqTcZINGeqKfE7FXs7fGF0sJ9YYA78QWRv7vcxdaTJM5RVtKBLkBTJ44LD9XHPg3', '2023-01-15 03:26:01', '2023-01-15 03:26:01'),
(41, 'Ls6ES16FLG0VPkbEoz93oy5e1k3vT8cOOGxWXLSumYU88f6UnheqAochjL4JZxs0', '2023-01-15 03:29:56', '2023-01-15 03:29:56'),
(42, 'dxVCXecZeKCjUTYcxtIhlPfhhsnnng2oqHSDd8VBqvEK1y9pNWpP4KXUPQLT8Tkf', '2023-01-15 03:32:00', '2023-01-15 03:32:00'),
(43, 'l9uAXJrbEEYkbfmoUmu5dQnMiyGCqCwPAhahNdFihGey0ypwdtkO9vUrJik0znqz', '2023-01-15 03:38:24', '2023-01-15 03:38:24'),
(44, 'XsKF1YAcdtpQbP3O0QODRZUlLeZR7cyisjCis04klFxyrqApz9qPm5kVRdYq0N69', '2023-01-15 03:40:22', '2023-01-15 03:40:22'),
(45, '0p34oBzZ8T16qyIvyVKRfLx9xa3v82WdXV90lMpYpXtvI8Nz0SbsF7NiaXwkblcT', '2023-01-15 03:51:14', '2023-01-15 03:51:14'),
(46, 'X6FpNtArMoB56dWhW7KDrN7xaNOSI7YvAHgDqSEFEj3Lz7jsO75OlltOY7M4cOXi', '2023-01-15 05:58:17', '2023-01-15 05:58:17'),
(47, 'Gz3gpwhjjHIVATNl9fjD3dJi1hVSRZGpVVnQ53zTVGxv2QDi9e1d7dEuZ7ej9CzM', '2023-01-15 06:01:57', '2023-01-15 06:01:57'),
(48, '6qmvxATZ34vlTz0Yxb8yr9Oj6AMW3AtUQo8euKb5hQ92vqer9wbCWNYPyl0m9yQc', '2023-01-15 06:25:15', '2023-01-15 06:25:15'),
(49, 'CDtJ8hdX956zwGdpIUCySW6E6tUb5Od4lrvtgFz6jT1z6SJgv0EYvMOaJ0remAxo', '2023-01-15 06:56:05', '2023-01-15 06:56:05'),
(50, 'weEMQZVbRTtMPIGqVLu6R2IPpPM7sMOW6Ns1LwLBmz2q21apbIkf1njhfOqXTq00', '2023-01-15 07:00:10', '2023-01-15 07:00:10'),
(51, 'mEn92sFtdOFuK5AcvcD0KeTfgTDE1mygiU9wTsYTD0VtrNELrk9E2hYH0LpKgnmA', '2023-01-15 07:04:51', '2023-01-15 07:04:51'),
(52, 'QFaB0SwcSaBcLQ0PHIMSmcRR5WMBvsRYHqUFRKHqfRyiOjJeRw3KJAIng2q3fLjV', '2023-01-15 07:06:42', '2023-01-15 07:06:42'),
(53, 'SckhCBjLJKhWj8WYoxWgJiyd8W3e7LmTco2Fc4A9YbdcsDEBORgJ00OIuTOAcgT2', '2023-01-15 07:32:10', '2023-01-15 07:32:10'),
(54, 'lRtBGGTBDfGzdA4K34C23NVGBzHWHMoyYAJ5i865zh08CjLbOkTqaHqnjjpJsMXT', '2023-01-16 06:32:40', '2023-01-16 06:32:40'),
(55, 'OI39HelwArMZmvuQObNCT5zp7EbWaG0Vwi788LADKg2QyFpw1PSZSavaVGgEoRwb', '2023-01-16 06:38:51', '2023-01-16 06:38:51'),
(56, 'cjrBSqGWdKje9cICe7kOr03DoiAw8LM2mJNf1OFC8O5HLcwRBwhLZjAT21CvkIYr', '2023-01-18 08:00:30', '2023-01-18 08:00:30'),
(57, 'k6cZLogia3yNEX5LRopkN2254ZHXl2KR0W9zsr3D1d4nnkrB6a7XyRf6Gmx9iSpf', '2023-01-19 03:44:02', '2023-01-19 03:44:02'),
(58, 'mFYxSzE4K3U1atnjc83VHX54y3m0b23DDeNjAytC5Q1cCS00bRVt9J0lzTlspSlO', '2023-01-19 04:30:05', '2023-01-19 04:30:05'),
(61, 'b06scXkM4iTR6fdMKiV8C92ZRQq4Zri3s0KzoMaukcVpRJMCValiyFpgvQiKooMA', '2023-01-19 06:50:07', '2023-01-19 06:50:07'),
(62, '1FBb6R5vPJX3CSt3xcumsdeEnJgZB6LmeaXWUlvF0SRrZnKX3g6TtCNlLKwGXYWI', '2023-01-22 03:32:15', '2023-01-22 03:32:15'),
(63, 'BtiuH3yelWKuivZ6vIKq3myUepUVAEZwIySUFC5mRudCoSeDU8CTZqBUfFZbjYCb', '2023-01-22 04:36:01', '2023-01-22 04:36:01'),
(64, 'u7nb907IyZrZ8dddPkI7OhFa9DZVa6YSy6cowM6o66vFLGyVwnlIqCNVFxLlWuwW', '2023-01-22 06:19:26', '2023-01-22 06:19:26'),
(65, 'HLNqW099H3Ml97Wls2Y2srQu1FzopmMSB45bfSNtnTc8WNpBGVCLMES8DiPhcDGc', '2023-01-22 07:47:43', '2023-01-22 07:47:43'),
(66, 'js8qb8ztV4rs1DBZ6ImbCvatxCflIac3OSzOe9ovisV357tU4e3FziXl3W6ICErM', '2023-01-22 07:55:34', '2023-01-22 07:55:34'),
(67, 'Yj9MaaqQmXFNVqMdrhG5DfO7qs9IDNK9pcDogqM9WyACRJgleP79JK4ffuXGDXSw', '2023-01-22 08:21:43', '2023-01-22 08:21:43'),
(68, 'OTYP4CGYF2bLT6ASVzSvpBoUpMie8ANcXWdjtiNIX38aD4xXgcl8PA2BZvRk5Er5', '2023-01-23 01:45:56', '2023-01-23 01:45:56'),
(69, 'Uxgefjp3mm24qLmsoHB7uHaTmYyCvbuBb9jczdkKXBEWK2nfYvEGtlk2kmpxPGZc', '2023-01-26 06:08:58', '2023-01-26 06:08:58'),
(70, 'PFCVcqIYgdOnzLvyqthuWXr6jSjtKVnqPhNS3qKjLjiMV4BAOGONiWr0kjC80Ekj', '2023-01-29 07:17:29', '2023-01-29 07:17:29'),
(71, 'UHX9LH75saFNHXQ6r50XjYWjXQDCYXnTji6s0HGVkU8rA8nkdJOGyAhawj6z2vjg', '2023-01-29 07:22:45', '2023-01-29 07:22:45'),
(72, 'rv4k6ufJ4BCQbrHpJFmcdTRpEkmsJgN1gJ92VzkR7OQnGR67HlLHoBx0SKjdKCPX', '2023-01-29 07:24:53', '2023-01-29 07:24:53'),
(73, '7dFTv245QRB50rPdpV4ysDnzg6X3lWF87lJRvY7ksBtTaruSAhviQNVLlzLGeu1j', '2023-01-29 07:38:03', '2023-01-29 07:38:03'),
(74, 'R5cGH46rPonJR8om4JGMB1BtuYAYmPj64pZWX3iOhAloA8DI0QYnrjTUKo1gi4WW', '2023-01-29 07:48:19', '2023-01-29 07:48:19'),
(75, 'NP3SSagt2lCKH3WTrvA7WQqIiHWdFHaTmDzT3jhLHppeMENTZoxcLLsrY2cxIX6c', '2023-01-29 07:57:23', '2023-01-29 07:57:23'),
(76, 'gjIn5HJIHyXDph9WTOXB3LzhaQvLTnPKc1MWdITRC9DTUdmpeKjXyCqLcAKK8EAT', '2023-01-29 08:21:30', '2023-01-29 08:21:30'),
(77, 'ONy4K3h2yLijC89fo6emPS3hy2s0oBUuWp62p5lpkK8wdqbgE1J9I45GRdvdrbNI', '2023-01-29 08:41:56', '2023-01-29 08:41:56'),
(78, 'u9oMVdrEXztnJCmoV3nAMYV2Mt6Q4EtCsOl4ssLdGQ8rzbFVRqDlBI5aqXEAENgg', '2023-01-29 08:46:59', '2023-01-29 08:46:59'),
(79, 'gji0utjPwYq5SffIDjx4m9uE0W9CZwBrHpsH52nZW7QOAknMzjIo10J0bvAYbH8W', '2023-01-29 08:57:48', '2023-01-29 08:57:48'),
(80, '48JVRk9xCB3ywuEUC20xktOzvhNPXgUECz0Dinen5bi3wC3Cm6hymWXv07zh30lU', '2023-01-29 09:06:48', '2023-01-29 09:06:48'),
(81, 'lPYuYi03iZwiBHxmHtb8Mw34y2INdec9FT8LVWivsaeSWdPX9hLNKaE2GsBpy5OV', '2023-01-29 09:41:45', '2023-01-29 09:41:45'),
(82, 'XxkSYDtMUkuPblLILWHF0Nzdbm4hUxh33SAxNhKglkQ7XJUxkegmp9laNhzupVIY', '2023-01-29 09:53:06', '2023-01-29 09:53:06'),
(83, 'zzSdWZauHCrFDyYV4ukyHgVGQwIUUNHmToZm4yjxTQlEXgTlweLBP537uniAoEbK', '2023-01-29 09:56:36', '2023-01-29 09:56:36'),
(84, 'av15bJKFJhh8wEONhR59G1aX0k1rqRDPLtvT2xY5m7IoHHK44WWp30vQGdBGw6kb', '2023-01-30 01:53:46', '2023-01-30 01:53:46'),
(85, 'HV4rTWI5e71zfyHxd7BzcxUYXBF3ji3RX9ljQ9ErgUKtCVuRPlkr1hfIMJSG7izf', '2023-01-30 02:15:06', '2023-01-30 02:15:06'),
(86, 'zgKbI2caVjK55d4P2gV30sAkj4GyJxeODT3Gytp9ZMikDZ5l9eV36OfAwQyzG3AV', '2023-01-30 02:18:22', '2023-01-30 02:18:22'),
(87, 'G0maK5sMnUhFaTYbgVRzw8rkQgEtb5OlUfZF2b282woFQaqnBcbWQ20of9MSCtEQ', '2023-01-30 02:23:11', '2023-01-30 02:23:11'),
(88, 'mog2AL6ZZ3IQvU9mqW1To6yEJjKhT3PzocB7ilf4Jmqhp4hrcz4FVcFUpLlKXSZB', '2023-01-30 02:28:50', '2023-01-30 02:28:50'),
(89, 'KueOgH0EWn4lG9ImipGWWG9BJ5IijLPq9mrLiSKkOC62sORo3rTKz67hDwlN3gRx', '2023-01-30 02:33:14', '2023-01-30 02:33:14'),
(90, 'gZDyZweoDw3bORvjnqMPe7metUBG4O5Hjjd5hFEO3VIdbUw0waYdfhqkHXKIihER', '2023-01-30 02:41:31', '2023-01-30 02:41:31'),
(91, '16rDYXq3LI4HXLGmNQadrf4f5EB7kZxtYQk2BuZy2WJGH4vdPO0iHI18iZ8uHeoi', '2023-01-30 04:19:31', '2023-01-30 04:19:31'),
(92, 'qKKXuw3tI7r6NRtgBnZBujj7N2SKmCEMVJm8LKJC0ajNkEEirNSYcTsHZQBHYWpS', '2023-01-30 08:31:49', '2023-01-30 08:31:49'),
(93, 'GkOex7ZhAoOe2dRgzOWAQr8l3jLWqkYZZAXToaR6wpqTc3WMONxQVB0ePWq3r6dE', '2023-01-30 08:48:36', '2023-01-30 08:48:36'),
(94, 'ixUtUyty0GLdotacclf1uXpG6AS77rilIL4jaQciNr1dyVoMkUp3n6guqRexZZ2c', '2023-01-30 09:13:26', '2023-01-30 09:13:26'),
(95, 'BSwZ3DjNPV8pbmMr2XlDupg3AoLD4ILm7dSIIHacOVUIvpGp4p1jESjoWqDIdfAY', '2023-02-05 01:49:59', '2023-02-05 01:49:59'),
(96, 'kV3uEIgXd0zOZgvcDqXXmUngdkctKZAVSGIGdv8vGDzki2lxpPeLKy4YIxKkjKQQ', '2023-02-08 10:00:31', '2023-02-08 10:00:31'),
(97, 'RR9O8s2JIHBRQ3YlSoU2GfNjN6Cz6xNccx8bmO43E3NxWeLXbrD1C8wL23bkInsD', '2023-02-09 02:11:45', '2023-02-09 02:11:45'),
(98, 'sDzCEllLx80LAmeKKDAuC5GFUYpOGW04ufC0T5DIEqEYtecigRJcN6BQrEdnRfzY', '2023-02-09 03:22:46', '2023-02-09 03:22:46'),
(99, '1cUcpg5MRi4QtlPOkpIXZ1TMNkAqwAQErdACA9nNnDPshhEyjij9vMbrcyjaUbZA', '2023-02-09 03:28:25', '2023-02-09 03:28:25'),
(100, 'D7ZCyjL4ZaWOHHqJ5AE6At7Xf6yzinEm85ySZvP1WOec27jadKvhJpnLe1XL7ZYe', '2023-02-09 03:29:09', '2023-02-09 03:29:09'),
(101, 'vQxVKKlJ5QI0PcZHwJFdSeuzkur0QIHbrQjgV0PfqMAmK9ZZD0JAR3go4Ya7gEzn', '2023-02-09 03:40:01', '2023-02-09 03:40:01'),
(102, '78jnXylVqruiIYFQVm7svrG07kXiVIdDPZRwkSEVE5Nk00G2imJU7TrySueAOQIC', '2023-02-09 03:42:59', '2023-02-09 03:42:59'),
(103, 'nt1mPWqu30iqeb8ws4dymjAwArtiTUhGuLJTEc9i0mx3OYOc5TfTrKQqgTQ5BUzM', '2023-02-09 04:20:26', '2023-02-09 04:20:26'),
(104, 'Fy2VqYNJ8vHMs1H6tuoZXmwp8ozfL5AM1JXbvm2YFuSLnYIsw9gyNV1YMZ2vwGov', '2023-02-09 04:25:37', '2023-02-09 04:25:37'),
(105, 'kIeVi79kJVyV8zTxp5M1swfRNFlCHFDnfNWR1CCf4lkErOETSQB1iANO1j0jFsuV', '2023-02-09 05:08:20', '2023-02-09 05:08:20'),
(106, 'uwKSv86L0XnT3tK9FkYhYWcVSCSMZhZoXvfwWQFlHZWQlM3Bj2z2qPEpNl4rMnCc', '2023-02-09 06:46:01', '2023-02-09 06:46:01'),
(107, 'mDZKvlqB2iLPVpVeC3fanSPpDGMV6U6nhYqNmoPa8s9suMDQ3W7RkDsh91vsoQlD', '2023-02-09 07:59:29', '2023-02-09 07:59:29'),
(108, 'zIr0EHmAj5EOrBQxeXtHE624PrEPpLS2x2htvu61heVo0SvqnR386fR1iOgTmGGJ', '2023-02-12 02:25:17', '2023-02-12 02:25:17'),
(110, 'jku9yXd8Q5AwxO64fWYlMLHerObCWNkW2cO5ONA9A3UJiRg1L3kHZ4wcRdk18LaC', '2023-02-15 03:18:54', '2023-02-15 03:18:54'),
(111, 'NWWHybGwlqQyZk1XUazoWzfP80YlCWttuhUwUZcBOcVXCdK9jNUUmMacX1c0SU9d', '2023-02-15 06:44:58', '2023-02-15 06:44:58'),
(112, 'xiWEKZyZ8583L9gEc8Eoq0tS0aeSKc8uxgpjJv34CLo3DvswEYkrpI1Dns8BaxYs', '2023-02-15 06:47:15', '2023-02-15 06:47:15'),
(113, 'VJkSvgBq1R1m9IVd28mNW65oeW1sIrXn3POfdrX0QJVx0EcPo20BZS0FLxRegif8', '2023-02-15 07:07:28', '2023-02-15 07:07:28'),
(114, 'dZY7cchuTVuTTpIIBncxbJ7M1g6DHO2d7kizkLWmTcIGEULwua63B4OP0uBPnhL4', '2023-02-16 01:36:24', '2023-02-16 01:36:24'),
(115, 'QfqCVHkcuUqPy0YeFbVelSwSU8CWJr2KEHa5zQsu5c8oMUQXMV43zIJ3jPirQoEL', '2023-02-21 03:57:23', '2023-02-21 03:57:23'),
(117, 'UboveOBS7fBin3r4mu1womdGGFXJIYlB3UcVYNOe9RW3iMyoxfoZm1RNuyrCMD79', '2023-02-22 04:52:27', '2023-02-22 04:52:27'),
(118, '3sFtJslVPBBBgsPSY27YJPz3Pgou6Xg7Vf4m44GtWqypap0Vy4l1Lx9Ey7HBjUnj', '2023-02-23 03:55:57', '2023-02-23 03:55:57'),
(120, 'nhEwVn3kN1i9CZDb4ztYXHudRWLxl5rbvUQ0u2QxZNuClHAPdh7qyWU91vn0Q0aF', '2023-03-02 04:44:03', '2023-03-02 04:44:03'),
(121, 'ZAXJtGoPODz5FWVYyaUWvFru0hnJXLEIYskhQHarVu0B21YecNGwSTiTiXbLCAzu', '2023-03-07 04:05:11', '2023-03-07 04:05:11'),
(122, 'Xwj5iXSXduiImRAFhWemISdKsJ9beot1HBzI6StUyQHx7LkvJBqHrY6YklJs0GcO', '2023-03-07 04:05:18', '2023-03-07 04:05:18'),
(123, 'le2xCsrzTdRcRNpbFfQ5AQ6dz66mstbGs65rg3BdDsW5PtmPKJCBhMeL0532kwnC', '2023-03-07 04:12:10', '2023-03-07 04:12:10'),
(124, 'g7vOySap18gGTMRcHa1bT4G4kitlNcYFOBpo9UHBR7SYzZvXM0v8X7YYEJApCjTM', '2023-03-07 06:22:50', '2023-03-07 06:22:50'),
(125, 'rz3gzS5kwDq1ZqBd92WZv4Iv0EblFdARrEmWKhXKYunn79d4NCej1JeExWh39rKn', '2023-03-07 14:23:04', '2023-03-07 14:23:04'),
(126, 'AnkhGCs37iGli4e8ThPrtdmbIgvyRqkk686jzIC9XNFfSzIn6EXyqzuV5NiTRAwM', '2023-03-08 01:54:18', '2023-03-08 01:54:18'),
(128, '9Pe5JlGldcwnjPcPoLzrEsRmqCgp7ekQN17T1Y7U6slyMVrbxJLspBDLxRjNj7tJ', '2023-03-08 05:39:09', '2023-03-08 05:39:09'),
(129, 'sQIatrXAYmChgM3TD1rSV0ILKeyhWqpv2Ju62gzLmd7AFH3jSN0LbfkhYHq7v32z', '2023-03-08 08:13:30', '2023-03-08 08:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE `user_level` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_address`
--

CREATE TABLE `visitor_address` (
  `id` int(11) NOT NULL,
  `address` text NOT NULL,
  `fcm` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visitor_address`
--

INSERT INTO `visitor_address` (`id`, `address`, `fcm`, `created_at`, `updated_at`) VALUES
(5, 'al satwa', 'cHw-aCd1SlChPrrQE4ehaG:APA91bErMfIyoDZWoUo5Y20ZTSl0Bb5WXRrcMD1bmNpci8g6vZF7MAKd0VfozVCEqpQ9GM0UqOZk6AZxbeURoIgeYPpNKtIhNwtrcvnfPCIRRaMpYAgLAA-QBorvsxImAois9t9xiUTG', '2023-02-08 06:49:19', '2023-02-08 06:49:19'),
(6, 'kkkkk', 'cHw-aCd1SlChPrrQE4ehaG:APA91bErMfIyoDZWoUo5Y20ZTSl0Bb5WXRrcMD1bmNpci8g6vZF7MAKd0VfozVCEqpQ9GM0UqOZk6AZxbeURoIgeYPpNKtIhNwtrcvnfPCIRRaMpYAgLAA-QBorvsxImAois9t9xiUTG', '2023-02-08 06:52:11', '2023-02-08 06:52:11'),
(7, 'kkkkkkm', 'drzkfrhOQgeovKS6woQ4tW:APA91bGp1_Fi1PxRveqtToY-gdSuWEOHrB3wt4wlCGc6vJZqXoF6NYfTaZOnR-xLcKvzIHr-CwzEA4VnAtprHrt-BVO99CAiTgVx0L8sYlsTxM-7WCWbaRFKHhbBeTgV54oFQSCJ62fS', '2023-02-08 06:59:26', '2023-02-08 06:59:26'),
(8, 'kkkkkk', 'f9J88I5oQf2Ww0taxq4YUJ:APA91bGLlhO9RCtVofVouXm_P9pY6VQ2-aZLg9BhQR-GX6HuyfbHOSpfcjae-XFLdv4A4xi52CLdFAdxHl9qAq9gKVgbY2mRFvgeEnC8Y2yaMInuYCZHvosnVEwLL_mEWGC-xID_Zk_O', '2023-02-08 07:18:10', '2023-02-08 07:18:10'),
(9, 'kkkkkk', 'f9J88I5oQf2Ww0taxq4YUJ:APA91bGLlhO9RCtVofVouXm_P9pY6VQ2-aZLg9BhQR-GX6HuyfbHOSpfcjae-XFLdv4A4xi52CLdFAdxHl9qAq9gKVgbY2mRFvgeEnC8Y2yaMInuYCZHvosnVEwLL_mEWGC-xID_Zk_O', '2023-02-08 07:18:14', '2023-02-08 07:18:14'),
(10, 'kkjkhhjhh', 'cg7QZWvwQXqlxyK7XeYyJc:APA91bGcLzNHPeMpT8ILpiFEO317uilPMbg2mCz9tNmS4naSkjrWwTntSRpk7mpsy2O0vi0ESplv69LV4bKDTH4_rHkMBvENMPsO9RmgHNabKjtx6yFhTml12L60lRH_QVHlO-8wIldw', '2023-02-08 07:22:34', '2023-02-08 07:22:34'),
(11, 'fsddfsfsfhfjas', 'fsFjt5aAQgiPHkH-xDMFgn:APA91bEA-GqsmCdIH3CPkk9LgLwXTliIEqiUniPI0-uNep1wK0Z7ScSkQqeLOzPfk8dUeLG1BtyrcPZfmh7QgwwXP_z6jcrd924WBjTiaqp1W0YaN6E1Opi6pVBUQQG0U8i494Ze-TVJ', '2023-02-08 07:30:48', '2023-02-08 07:30:48'),
(12, 'kkkkkk', 'ejYkQS2vQ2C_Ss5EOLvYbQ:APA91bHT_suzMn3-i0WPVmYZuJE3mYQ_uLj_jYEihesGXy0GSZ0ZZn3-oURocctex1OIS2HIoqipWZ3dvxnw_ac0GdUCK3I_obxVXs3_-oZFli_hH5ld9fQPziQd7he_ZFe-p4d-2KTa', '2023-02-08 08:08:23', '2023-02-08 08:08:23'),
(13, 'hjggjhhghhghh', 'eB9vOL3cQT24oeoCJBt8fh:APA91bE_g2_0SV-2VgoPcKD3PioNH_HFO8qg8qgxVHJjRzkillp2OZf0dH9WOJ3Jbt4fFnh1UxUwNm3W57BAHZjSOBSTCpll_Pnz31Ot6p2MJJMV7_UL8gNCESRFaShpeAX8HX-kbQHb', '2023-02-08 08:12:29', '2023-02-08 08:12:29'),
(14, 'kkkkkk', 'dmnpKvjITp2j410DN8unOz:APA91bH8DHMu74JYGmMU_21babG_xYjj22w1DD0224e190XADpZ414TC0KvnnBH8R8LLAYeRN6L18WUQ4QZxgYnbwgyddw6N082pc2yEwmdF4RaQGBB_dyiYzB5lcjLry8OzY4Ff2Ls3', '2023-02-08 08:14:24', '2023-02-08 08:14:24'),
(15, 'kkkkkkk', 'ftQqAE6ARDaXA2o8XjU6tp:APA91bGscGWG33wPK1aCRhpI9Kh4hltbwv5bBlCJbZFEXJTZlreUdGm3OUF7w1POx8wE7-AGO5ZvwDf2tPEwYn1RS1HpjfcU89zrxZtzdxTdQLXaNwp_K_cepKpZgAI70V57UXlFVQz3', '2023-02-08 08:19:55', '2023-02-08 08:19:55'),
(16, 'jhjxvjcgxcgxvx', 'cnOEf88kSwyTOqFHqzdQxf:APA91bEabC1e9QaU-msERKyuohYV4a3aCLO2Um3-QbpCTVVHbv52utJ083InX-FeHvBEZhbITGFq5VIsx-Ud3sZtFJ05GndLZ0oH4UlH94ul675-Da5NYbQBG71ttHZPRdWlifDN8_bj', '2023-02-08 08:22:05', '2023-02-08 08:22:05'),
(17, 'llllll', 'ebo8LT0oSDOjFeW0_5f_Gu:APA91bGjbfKDJ6SE6hVwVhVgiaQhl7pLuMgIE6LXc72sUhGfURwIp0RUw7x63IIy14H9nJOGz4fLccPvYNVJh-y7uNieMJ9mc4VOovzhXeCvAWHpx_1WFfmHlYirqQbWVi-7LrRSfh3a', '2023-02-08 08:38:01', '2023-02-08 08:38:01'),
(18, 'fghhhu', 'fDTrTvlITB-o0kSDFeRIzd:APA91bHGFbKw3OdG_AZ1uzMa6Y441tFPk2fWpltFdx8HDYeLoublOHYqb4Blc8va4Z4f-wWFx5GOzgxB7x6sTfDa9z36NwsNuSBcLIAsQjfNJHFRTizRk-l_e4yDxxk5w2GlqldUtKVb', '2023-02-09 11:21:30', '2023-02-09 11:21:30'),
(19, 'dmfhsdjfjsfjfdfjs', 'duFs9ssUSlimYhnOtEW3CO:APA91bFqj_VtGWwVN3u50FLIN2NWHRJc57FmRHW_m_saX8XTHbJ9xvPnMip_-2E312Qa6z6rXma3vEWNvIp0JylRbApXMjkR-I5otRellY7R2EevzEh7m-QC9SfuBJMa-697X-Oj2Whx', '2023-02-09 11:35:51', '2023-02-09 11:35:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buildingarea` (`area_id`);

--
-- Indexes for table `building_services`
--
ALTER TABLE `building_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servicesbuilding` (`service_id`),
  ADD KEY `buildingservices` (`building_id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usercar` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servicescategories` (`services_id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `locker`
--
ALTER TABLE `locker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `building_locker` (`building_id`);

--
-- Indexes for table `locker_user`
--
ALTER TABLE `locker_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locker` (`locker_id`),
  ADD KEY `user` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notificationmangment`
--
ALTER TABLE `notificationmangment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderuser` (`user_id`),
  ADD KEY `serviceorder` (`service_id`);

--
-- Indexes for table `order_date_time`
--
ALTER TABLE `order_date_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderdetailtime` (`order_detail_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderdetail` (`orders_id`),
  ADD KEY `subservicesorder` (`subservice_id`),
  ADD KEY `stafforder` (`staff_id`),
  ADD KEY `ordercategory` (`categories_id`),
  ADD KEY `carorder` (`car_id`),
  ADD KEY `lockerorder` (`locker_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion_subservices`
--
ALTER TABLE `promotion_subservices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promotion` (`promotions_id`),
  ADD KEY `subservices12` (`subservice_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `stuffofservice` (`services_id`);

--
-- Indexes for table `stuff_password_resets`
--
ALTER TABLE `stuff_password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sub_services`
--
ALTER TABLE `sub_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subservices` (`service_id`),
  ADD KEY `subservicescategories` (`category_id`);

--
-- Indexes for table `time_slote`
--
ALTER TABLE `time_slote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_slote_subservices`
--
ALTER TABLE `time_slote_subservices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_slote` (`time_slote_id`),
  ADD KEY `subservices_time_slote` (`sub_services_id`);

--
-- Indexes for table `two_step_verification`
--
ALTER TABLE `two_step_verification`
  ADD PRIMARY KEY (`phone`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`) USING BTREE;

--
-- Indexes for table `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_address`
--
ALTER TABLE `visitor_address`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `building`
--
ALTER TABLE `building`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `building_services`
--
ALTER TABLE `building_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locker`
--
ALTER TABLE `locker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `locker_user`
--
ALTER TABLE `locker_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notificationmangment`
--
ALTER TABLE `notificationmangment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT for table `order_date_time`
--
ALTER TABLE `order_date_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `promotion_subservices`
--
ALTER TABLE `promotion_subservices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_services`
--
ALTER TABLE `sub_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `time_slote`
--
ALTER TABLE `time_slote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `time_slote_subservices`
--
ALTER TABLE `time_slote_subservices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_address`
--
ALTER TABLE `visitor_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `building`
--
ALTER TABLE `building`
  ADD CONSTRAINT `buildingarea` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `building_services`
--
ALTER TABLE `building_services`
  ADD CONSTRAINT `buildingservices` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `servicesbuilding` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `usercar` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `servicescategories` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `locker`
--
ALTER TABLE `locker`
  ADD CONSTRAINT `building_locker` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `locker_user`
--
ALTER TABLE `locker_user`
  ADD CONSTRAINT `locker` FOREIGN KEY (`locker_id`) REFERENCES `locker` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orderuser` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `serviceorder` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_date_time`
--
ALTER TABLE `order_date_time`
  ADD CONSTRAINT `orderdetailtime` FOREIGN KEY (`order_detail_id`) REFERENCES `order_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `promotion_subservices`
--
ALTER TABLE `promotion_subservices`
  ADD CONSTRAINT `promotion` FOREIGN KEY (`promotions_id`) REFERENCES `promotion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `subservices12` FOREIGN KEY (`subservice_id`) REFERENCES `sub_services` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sub_services`
--
ALTER TABLE `sub_services`
  ADD CONSTRAINT `subservices` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `subservicescategories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `time_slote_subservices`
--
ALTER TABLE `time_slote_subservices`
  ADD CONSTRAINT `subservices_time_slote` FOREIGN KEY (`sub_services_id`) REFERENCES `sub_services` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `time_slote` FOREIGN KEY (`time_slote_id`) REFERENCES `time_slote` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
