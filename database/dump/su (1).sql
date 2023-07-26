-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2023 at 01:33 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `su`
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
(1, 'Yahya Bakleh', 'bakleh99yahya@gmail.com', '$2y$10$0MOd1tQrQElQoDF0FxSMOeDwcVuRIailpT3vI4uu/04PQCvjIoVXi', '', '2023-01-17 06:18:29', '2023-01-17 06:18:29'),
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
  `password` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `area_id` int(11) NOT NULL,
  `parkonic_residantial` int(11) NOT NULL DEFAULT 0,
  `remember_token` text DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`id`, `name`, `password`, `location`, `area_id`, `parkonic_residantial`, `remember_token`, `updated_at`, `created_at`) VALUES
(1, 'Saad Tower', '$2y$10$0MOd1tQrQElQoDF0FxSMOeDwcVuRIailpT3vI4uu/04PQCvjIoVXi', 'test', 2, 1, '01qMYBWCKgOM6Zg9HUL9SYtK9wVV6rBY0rgCCWOezX7l65veto5OXe76V46e', '2023-04-25 10:19:38', '2023-04-25 10:19:38'),
(29, 'new building', '$2y$10$0MOd1tQrQElQoDF0FxSMOeDwcVuRIailpT3vI4uu/04PQCvjIoVXi', 'Dubai', 2, 0, NULL, '2023-05-03 09:16:05', '2023-05-03 09:16:05');

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
(68, 'Sedan', 118, '1446', 'Sharjah', '1446', '2023-02-23 11:21:13', '2023-02-23 11:21:13'),
(69, 'Hatchback', 118, '432', 'Abu Dhabi', '432', '2023-02-23 12:02:46', '2023-02-23 12:02:46'),
(70, 'Sedan', 118, '2324', 'Sharjah', '2324', '2023-02-26 07:36:42', '2023-02-26 07:36:42'),
(71, 'Sedan', 124, '45023', 'Dubai', '45023', '2023-03-07 10:28:50', '2023-03-07 10:28:50'),
(72, 'Sedan', 125, '1235', 'Dubai', '1235', '2023-03-08 05:15:34', '2023-03-08 05:15:34'),
(73, 'Sedan', 126, '1234', 'Abu Dhabi', '1234', '2023-03-08 05:55:42', '2023-03-08 05:55:42'),
(74, 'Sedan', 129, '12345', 'Dubai', '12345', '2023-03-08 12:15:12', '2023-03-08 12:15:12'),
(77, 'hyyy', 149, 'ftyt', 'Dubai', '246gg', '2023-03-29 08:30:28', '2023-03-29 08:30:28'),
(78, 'gwbveev', 149, 'gsgsbs', 'Sharjah', '14152626', '2023-03-29 08:53:53', '2023-03-29 08:53:53'),
(79, '455', 149, '234', 'Ajman', '13555', '2023-03-29 09:00:16', '2023-03-29 09:00:16'),
(80, '12345', 149, '1222', 'Umm Al Quwain', '4222', '2023-03-29 09:03:10', '2023-03-29 09:03:10'),
(81, 'ge3', 149, '5266', 'Fujairah', 'gsbsgeg', '2023-03-29 09:03:36', '2023-03-29 09:03:36'),
(82, 'gg', 149, 'ggh', 'Sharjah', 'yggg', '2023-03-29 09:17:44', '2023-03-29 09:17:44'),
(91, 'fagegeg', 138, '54845', 'Sharjah', '1234', '2023-03-31 22:33:17', '2023-03-31 22:33:17'),
(92, 'fwgege', 138, '54588', 'Sharjah', 'gshshdh', '2023-03-31 22:33:31', '2023-03-31 22:33:31'),
(93, 'g2g3h', 138, '54949', 'Ras Al Khaimah', 'feg3g', '2023-03-31 22:33:44', '2023-03-31 22:33:44');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `services_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `picture_path` varchar(255) DEFAULT NULL,
  `discription` text DEFAULT NULL,
  `time_slote` text NOT NULL,
  `multipale_staff` int(11) NOT NULL DEFAULT 0,
  `staff_price` int(11) NOT NULL DEFAULT 0,
  `multipale_houres` int(11) NOT NULL DEFAULT 0,
  `hour_price` int(11) NOT NULL DEFAULT 0,
  `is_meterial` int(11) NOT NULL DEFAULT 0,
  `meterial_price` int(11) NOT NULL DEFAULT 0,
  `is_gender` int(11) NOT NULL DEFAULT 0,
  `is_membership` int(11) NOT NULL DEFAULT 1,
  `price` float NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `services_id`, `name`, `picture_path`, `discription`, `time_slote`, `multipale_staff`, `staff_price`, `multipale_houres`, `hour_price`, `is_meterial`, `meterial_price`, `is_gender`, `is_membership`, `price`, `created_at`, `updated_at`) VALUES
(33, 2, 'Hourly-based', '/categories_images/1684130985.jpg', 'Kitchen - dishwashing, stove top, splashback, sink, and exterior appliances ,emptying the bin./emptying the bin./Bedroom - Changing bedsheets, making the bed./Bathroom - Sink and toilet bowl mirror wiping./Other chores - dusting, mopping.', '08:00/10:00/00:00', 1, 1, 1, 1, 1, 1, 0, 1, 0, '2023-05-15 10:09:45', '2023-05-15 10:09:45'),
(34, 2, 'Membership', '/categories_images/1684131251.jpg', 'Kitchen - dishwashing, stove top, splashback, sink, and exterior appliances,  emptying the bin./Balcony - Dry/Washout/Bedroom - Changing bedsheets, making the bed/Bathroom - Sink and toilet bowl mirror wiping./Other chores - dusting, mopping', '10:00/00:00/14:00/16:00', 1, 1, 1, 1, 1, 1, 0, 1, 0, '2023-05-15 10:14:11', '2023-05-15 10:14:11'),
(35, 2, 'Deep Cleaning (plus Sanitation)', '/categories_images/1684131612.jpg', 'Bathroom – tough stains such as hard water stains, yellow stains, etc./Kitchen – removal of tough oil & grease stains from floor, tiles & stove./Living room – dry vacuuming of carpet, sofa, and cushioned chairs. Dusting and  wiping of furniture and décor items./Floor – wiping and moping the entire floor./Hard-to-reach areas – Dry dusting and cobweb removal from walls, windows, and  ceilings./Professional tools & chemicals', '10:00/11:00/12:00/13:00/15:00/17:00', 1, 3, 1, 1, 1, 2, 0, 1, 0, '2023-05-15 10:20:12', '2023-05-15 10:20:12'),
(36, 2, 'Carpet Cleaning', '/categories_images/1684131753.jpg', 'Dry Vacuuming/Wet Shampooing/Wet Vacuuming/Professional tools & chemicals', '08:00/10:00/11:00/16:00/20:00', 0, 0, 0, 0, 1, 123, 0, 1, 0, '2023-05-15 10:22:33', '2023-05-15 10:22:33'),
(37, 1, 'Exterior', '/categories_images/1684220782.jpg', 'Full Exterior Wash/Windshield Cleaning/Rim & Tire Shine/Professional tools & chemicals', '10:00/10:30/11:00/11:30/12:00', 0, 0, 0, 0, 0, 0, 0, 1, 0, '2023-05-16 11:06:22', '2023-05-16 11:06:22'),
(38, 1, 'Combo (Interior and Exterior)', '/categories_images/1684221076.jpg', 'Full exterior wash/Full interior vacuuming/Dashboard wipe and polish/Interior and exterior windshield cleaning/Rim & tire shine/Professional tools & chemicals', '08:00/08:30/09:00/10:00/10:30', 0, 0, 0, 0, 0, 0, 0, 1, 0, '2023-05-16 11:11:16', '2023-05-16 11:11:16'),
(39, 1, 'Combo with deep cleaning (Interior and Exterior)', '/categories_images/1684222179.jpg', 'Full exterior wash/Full interior vacuuming/Dashboard wipe and polish/Dashboard wipe and polish/Carpet shampooing and vacuuming/Rim & tire shine/Professional tools & chemicals', '08:00/09:00/10:00/11:00/00:00/13:00/14:00', 0, 0, 0, 0, 0, 0, 0, 1, 0, '2023-05-16 11:29:40', '2023-05-16 11:29:40');

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
-- Table structure for table `e_wallet_history`
--

CREATE TABLE `e_wallet_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `transaction` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `balance` float NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE `facility` (
  `id` int(11) NOT NULL,
  `is_guest` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `facility_service_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `qr` varchar(225) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `special` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`id`, `is_guest`, `user_id`, `facility_service_id`, `building_id`, `date`, `time`, `qr`, `status`, `special`, `duration`, `updated_at`, `created_at`) VALUES
(255, 0, 126, 6, 1, '2023-05-04', '11:45:00', '126_6_6615_sl_3WYwvzDnJFXFcjYRkOfYWN2iaV6tqJiROfxKDWoznGVGBT0KMgcOwdgPa6V11CLf', 1, '6615', NULL, '2023-05-04 12:11:15', '2023-05-03 17:38:27'),
(279, 0, 126, 5, 1, NULL, NULL, '126_5_sl_zctYNVOqsCh866fqlh0Z16o8bg7B8taK6u7bJ0aHChtDRYHbQzNtZqjhuOGoFtHT', 0, NULL, NULL, '2023-05-04 13:35:20', '2023-05-04 13:35:20'),
(280, 1, 126, 5, 1, NULL, NULL, 'guest_126_5_sl_vk1K6yPJ43JKzYvdWiL4Sy0CkWCHlLafDFEBpmqIQSRpb82jKxKimLvMyCAEiRUl', 0, NULL, NULL, '2023-05-04 13:35:20', '2023-05-04 13:35:20'),
(283, 0, 126, 7, 1, NULL, NULL, '126_7_sl_OyzX7jWDlmXYkraKXmlTP8Y8us25gf7x2zyP7o8wSPKrY4pVxcLBdgUadICKfAeX', 0, NULL, NULL, '2023-05-04 13:35:58', '2023-05-04 13:35:58'),
(284, 1, 126, 7, 1, NULL, NULL, 'guest_126_7_sl_ZdQpvDpnnECUpeMU1pdUh8k5Uum7zEWoMV0oPfcAXfntPaXrEnwO9q43xaVCy3f8', 0, NULL, NULL, '2023-05-04 13:35:58', '2023-05-04 13:35:58'),
(285, 0, 161, 5, 1, NULL, NULL, '161_5_sl_xcNry98udhYGeTiNSe5w9dsItGQfKq6GJdirqZ5BIfIb0ILtE5dSnX5zxOaiDix9', 0, NULL, NULL, '2023-05-04 15:55:39', '2023-05-04 15:55:39'),
(286, 1, 161, 5, 1, NULL, NULL, 'guest_161_5_sl_Hq1nPh4YKxXJHKxEQYRKwy7tbYRvzyltcpph5NQnE8D3YOjuQ5ts31LkJ7ELbQoM', 0, NULL, NULL, '2023-05-04 15:55:39', '2023-05-04 15:55:39'),
(287, 0, 161, 6, 1, '2023-05-04', '06:00:00', '161_6_7309_sl_JxZl7PkniIcXIODDpEw5keUoJf5aYvpyZY4mxQyCJXkAbUgh3xBnNDnYDMqFm7hE', 0, '7309', NULL, '2023-05-04 15:56:32', '2023-05-04 15:56:32'),
(288, 1, 161, 6, 1, '2023-05-04', '06:00:00', '161_6_4990_sl_c4GIQOYnnVQj702Ln4SSTXmV6vayqfAywqnBHLOuDrfPjWNfB53KIiIGepnaknpZ', 0, '4990', NULL, '2023-05-04 15:56:32', '2023-05-04 15:56:32'),
(319, 0, 155, 6, 1, '2023-05-04', '16:00:00', '155_6_3492_sl_MfV3yv83P4U3lpQ96jde3JvY3xgxkrLEAfsPpCbHQc1bEQp3Fag19spJxdttnIlh', 1, '3492', NULL, '2023-05-04 16:29:19', '2023-05-04 16:27:06'),
(320, 1, 155, 6, 1, '2023-05-04', '16:00:00', '155_6_3878_sl_vsvX1TFlCniaolS280rHCrWwYhy7CJYIi5IKa5jEMwJf5kqUd2YTJdraBmyeHxhU', 0, '3878', NULL, '2023-05-04 16:27:06', '2023-05-04 16:27:06'),
(323, 0, 162, 6, 1, '2023-05-05', '07:00:00', '162_6_7411_sl_TLnVGrBO4jtLTRl9TpH16VFgJbVegCmy5zcJuq9vjwiuPw3LiRAjOggIex49KtJg', 0, '7411', NULL, '2023-05-04 16:34:22', '2023-05-04 16:34:22'),
(324, 1, 162, 6, 1, '2023-05-05', '07:00:00', '162_6_9693_sl_7jkqvCxItVgO8FSgCaRhcMjjbqwzuwQcZr4eRtbypi8B33ZRrfsh67ff340pzijs', 0, '9693', NULL, '2023-05-04 16:34:22', '2023-05-04 16:34:22'),
(327, 0, 155, 7, 1, NULL, NULL, '155_7_sl_HO9NHv9N3lfdOL7BF2iIjT9X18ic9noOSeHFsoUMVbJsAWadSg6fXmOnbjdvwXQU', 0, NULL, NULL, '2023-05-05 08:46:55', '2023-05-05 08:46:55'),
(328, 1, 155, 7, 1, NULL, NULL, 'guest_155_7_sl_gqpI5FnLGRiDRiCNqKjpeD0Rg6A52XPf3iL63rUKjHjLndY3UUZHTyrX8e3OZMiZ', 0, NULL, NULL, '2023-05-05 08:46:55', '2023-05-05 08:46:55'),
(339, 0, 155, 2, 1, NULL, NULL, '155_2_sl_hitrFpN5cMZYWWkUAWPUbUaMncTvtPCkHtxCNmZXX82MZnybzpBUvDnDN63cDB3d', 0, NULL, NULL, '2023-05-05 14:49:27', '2023-05-05 14:49:27'),
(340, 1, 155, 2, 1, NULL, NULL, 'guest_155_2_sl_xg6iSMj9xhhgiVvLkbt5bCrKF9IxojUqWPNvzJNPjI4piWBdfqFjBZtm0gQ9977K', 0, NULL, NULL, '2023-05-05 14:49:27', '2023-05-05 14:49:27'),
(341, 0, 155, 5, 1, NULL, NULL, '155_5_sl_Yd3FlngGgniWJpGcKGEVqfdmGzydoiG0XrggPRtnG1UrwPmRMRBP59LhT2GKtway', 0, NULL, NULL, '2023-05-05 14:49:32', '2023-05-05 14:49:32'),
(342, 1, 155, 5, 1, NULL, NULL, 'guest_155_5_sl_VXB0XzJVkUsnYeXVYmc9P1fnroNTaqL0HeDtOeallEuB6ZYKHWHtLsvW57mStgGT', 0, NULL, NULL, '2023-05-05 14:49:32', '2023-05-05 14:49:32'),
(343, 0, 155, 6, 1, '2023-05-06', '08:30:00', '155_6_6205_sl_SemiqTDOD3aluP6HbXNCyudD473O9ZZSj6Ketaxgz1JfipNyxRZsCpzRDg1rxQ0n', 0, '6205', '30', '2023-05-07 14:06:44', '2023-05-05 15:01:59'),
(344, 1, 155, 6, 1, '2023-05-06', '06:30:00', '155_6_6634_sl_H4xnuiy9pgmq4IZilVabI3kyajBW3S3NeqBlApwc2F1SkbWU7ncSAG6SGB2D8oE6', 0, '6634', '30', '2023-05-05 15:01:59', '2023-05-05 15:01:59'),
(347, 0, 156, 5, 1, NULL, NULL, '156_5_sl_f8fpvEFOxid5PutQxIF1xmUjfEanTX84NKFUzA5mOtRIvonPgfPYW3eiPAPnUCPn', 0, NULL, NULL, '2023-05-05 15:27:00', '2023-05-05 15:27:00'),
(348, 1, 156, 5, 1, NULL, NULL, 'guest_156_5_sl_IF6is6K3fXz04Rn7oAOTBh4msjHQt5UGSJbp2xmLYbJFxuGCnLxaUoOjXpN2OZ3j', 0, NULL, NULL, '2023-05-05 15:27:00', '2023-05-05 15:27:00'),
(349, 0, 126, 2, 1, NULL, NULL, '126_2_sl_5wX83mvXjD7co2JlJElc0EJdjLA73iNLtFaAXf4JUoCYlUin0Z8xccPxlmHmj85Q', 0, NULL, NULL, '2023-05-05 15:35:27', '2023-05-05 15:35:27'),
(350, 1, 126, 2, 1, NULL, NULL, 'guest_126_2_sl_y93Owi3AYF88xBAfHOQG8JSn3WyDD48GDlRrzr4MYc2g0S0dyXZ3eK1Ixlp1RfGx', 0, NULL, NULL, '2023-05-05 15:35:27', '2023-05-05 15:35:27'),
(361, 0, 156, 7, 1, NULL, NULL, '156_7_sl_zmcFLPOUG01Wgjcx0Pv5M0FcwP9sTAJZXSbQhm9wXzt5VsagNaVrOZsvzDsxK4wh', 0, NULL, NULL, '2023-05-05 16:07:01', '2023-05-05 16:07:01'),
(362, 1, 156, 7, 1, NULL, NULL, 'guest_156_7_sl_zrL6qCJAbtgenCFHmQwXRSlncSxjdp2OSFkeG6jn0ygVFXq5UhDbT9hs4Jtt5HVg', 0, NULL, NULL, '2023-05-05 16:07:01', '2023-05-05 16:07:01'),
(363, 0, 156, 2, 1, NULL, NULL, '156_2_sl_WHIqykckgXtgUkeUiW88ISvoqb7rrTAJ04mRK5p9634FSkhKNcOZG9F19KXZ6CPm', 0, NULL, NULL, '2023-05-05 16:07:57', '2023-05-05 16:07:57'),
(364, 1, 156, 2, 1, NULL, NULL, 'guest_156_2_sl_i3gJLF0bKMn2iO3gO0IgISjiOGVcx0rvrwuvD5FB4UbRJYgfgSlbIPvrPWsvbriH', 0, NULL, NULL, '2023-05-05 16:07:57', '2023-05-05 16:07:57'),
(365, 0, 156, 6, 1, '2023-05-05', '15:30:00', '156_6_4716_sl_BEVwkvmESCO2vSqX6oZ0xlihU1OhTWBTGG3maXDbzA2JjgcGdZmONH8vLMPlKzZo', 1, '4716', '30', '2023-05-05 16:11:44', '2023-05-05 16:10:41'),
(366, 1, 156, 6, 1, '2023-05-05', '15:30:00', '156_6_4700_sl_K4UVkYewIKOFGwY4iPagXzRQWhRHJf1PcVpo7s3O7Rzu3tbVge5Z6yVaPor5TaSK', 0, '4700', '30', '2023-05-05 16:10:41', '2023-05-05 16:10:41'),
(367, 0, 162, 6, 1, '2023-05-07', '06:00:00', '162_6_8273_sl_jfDjdDEIcJqdowjiy55L8aosHU1PwSqVi9Zfi3sBkdnewLeRlmbmhQVL01ATiK1m', 0, '8273', '30', '2023-05-07 09:34:55', '2023-05-07 09:34:55'),
(368, 1, 162, 6, 1, '2023-05-07', '06:00:00', '162_6_8517_sl_Fn9O68yGd92FgZSi7PoOVDagAQt7xbJ0roFAvldAJc91jFRmx2menU7BwzMq5Kv8', 0, '8517', '30', '2023-05-07 09:34:55', '2023-05-07 09:34:55');

-- --------------------------------------------------------

--
-- Table structure for table `facility_services`
--

CREATE TABLE `facility_services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  `building_id` int(11) NOT NULL,
  `is_booking` int(11) NOT NULL DEFAULT 0,
  `is_all_time` int(11) NOT NULL DEFAULT 0,
  `device_key` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sharing` int(11) NOT NULL DEFAULT 0,
  `duration` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `facility_services`
--

INSERT INTO `facility_services` (`id`, `name`, `start`, `end`, `building_id`, `is_booking`, `is_all_time`, `device_key`, `image_path`, `created_at`, `updated_at`, `sharing`, `duration`) VALUES
(2, 'Elevator', NULL, NULL, 1, 0, 1, 'A55QWESa2', '/facility_image/elevator.jpg', '2023-04-25 10:58:46', '2023-05-05 14:49:24', 0, NULL),
(5, 'Gym', '07:00:00', '12:00:00', 1, 0, 0, 'Aq2EU174', '/facility_image/gym.jpg', '2023-04-25 11:07:55', '2023-05-05 14:34:09', 1, NULL),
(6, 'Tennis', '06:00:00', '19:00:00', 1, 1, 0, 'LK765YGhgfw', '/facility_image/tennis.jpg', '2023-04-25 11:07:55', '2023-05-05 14:36:37', 1, '30'),
(7, 'swimming pool', '06:00:00', '19:00:00', 1, 0, 0, 'Fger432gh', '/facility_image/swimming.jpg', '2023-04-25 11:19:03', '2023-05-05 14:31:10', 1, NULL),
(8, 'Elevator', NULL, NULL, 2, 0, 1, 'asdasdawe', '/facility_image/elevator.jpg', '2023-04-27 06:10:07', '2023-04-27 06:10:07', 0, NULL);

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
-- Table structure for table `frequency`
--

CREATE TABLE `frequency` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `number_of_dates` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `frequency`
--

INSERT INTO `frequency` (`id`, `title`, `description`, `number_of_dates`, `category_id`, `price`, `created_at`, `updated_at`) VALUES
(10, 'One Time', 'this service will be delivered  only one time base on the date you choose', 1, 33, 1, '2023-05-15 10:09:45', '2023-05-15 10:09:45'),
(11, 'once a week', 'This Service will be delivered each week as 4 Times a month', 4, 34, 12, '2023-05-15 10:14:11', '2023-05-15 10:14:11'),
(12, 'Twice a week', 'This Service will be delivered 2 times each week as 8 Times a month', 8, 34, 24, '2023-05-15 10:14:11', '2023-05-15 10:14:11'),
(13, 'thrice a week', 'This Service will be delivered 3 times each week as 12 Times a month', 12, 34, 36, '2023-05-15 10:14:11', '2023-05-15 10:14:11'),
(14, 'One Time', 'This service will be delivered one time only', 1, 35, 123, '2023-05-15 10:20:12', '2023-05-15 10:20:12'),
(15, 'One Time', 'this service will be delivered  only one time base on the date you choose', 1, 36, 1, '2023-05-15 10:22:33', '2023-05-15 10:22:33'),
(16, 'once a week', 'this service will be delivered  only one time base on the date you choose', 4, 37, 0, '2023-05-16 11:06:22', '2023-05-16 11:06:22'),
(17, 'twice a week', 'This Service will be delivered 2 times each week as 8 Times a month', 8, 37, 0, '2023-05-16 11:06:22', '2023-05-16 11:06:22'),
(18, 'thrice a week', 'This Service will be delivered 3 times each week as 12 Times a month', 12, 37, 0, '2023-05-16 11:06:22', '2023-05-16 11:06:22'),
(19, 'once a week', 'this service will be delivered  only one time every weak', 4, 38, 0, '2023-05-16 11:11:16', '2023-05-16 11:11:16'),
(20, 'Twice a week', 'This Service will be delivered 2 times each week as 8 Times a month', 8, 38, 0, '2023-05-16 11:11:16', '2023-05-16 11:11:16'),
(21, 'thrice a week', 'This Service will be delivered 3 times each week as 12 Times a month', 12, 38, 0, '2023-05-16 11:11:16', '2023-05-16 11:11:16'),
(22, 'Once a week', 'This Service will be delivered each week as 4 Times a month', 4, 39, 0, '2023-05-16 11:29:40', '2023-05-16 11:29:40'),
(23, 'Twice a week', 'This Service will be delivered 2 times each week as 8 Times a month', 8, 39, 0, '2023-05-16 11:29:40', '2023-05-16 11:29:40'),
(24, 'Thrice a week', 'This Service will be delivered 3 times each week as 12 Times a month', 12, 39, 0, '2023-05-16 11:29:40', '2023-05-16 11:29:40');

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `facility_service_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`id`, `name`, `phone`, `email`, `user_id`, `facility_service_id`, `created_at`, `updated_at`) VALUES
(1, 'Yahya', '0562438455', 'bakleh99yahya@gmail.com', 3, 2, '2023-05-07 16:29:00', '2023-05-07 16:29:00'),
(2, 'Yahya', '0562438455', 'bakleh99yahya@gmail.com', 3, 2, '2023-05-07 16:29:35', '2023-05-07 16:29:35'),
(3, 'YAHYA', '0562438455', 'bakleh99yahya@gmail.com', 126, 7, '2023-05-07 16:30:44', '2023-05-07 16:30:44'),
(4, 'YAHYA', '0562438455', 'bakleh99yahya@gmail.com', 126, 7, '2023-05-07 16:31:05', '2023-05-07 16:31:05'),
(5, 'YAHYA', '0562438455', 'bakleh99yahya@gmail.com', 126, 7, '2023-05-07 16:33:10', '2023-05-07 16:33:10'),
(6, 'YAHYA', '0562438455', 'bakleh99yahya@gmail.com', 126, 7, '2023-05-07 16:34:23', '2023-05-07 16:34:23'),
(7, 'bakleh99yahya@gmail.com', '0562438455', 'bakleh99yahya@gmail.com', 126, 7, '2023-05-07 16:35:16', '2023-05-07 16:35:16'),
(8, 'bakleh99yahya@gmail.com', '0562438455', 'bakleh99yahya@gmail.com', 126, 7, '2023-05-07 16:35:59', '2023-05-07 16:35:59'),
(9, 'bakleh99yahya@gmail.com', '0562438455', 'bakleh99yahya@gmail.com', 126, 7, '2023-05-07 16:36:14', '2023-05-07 16:36:14'),
(10, 'bakleh99yahya@gmail.com', '0562438455', 'bakleh99yahya@gmail.com', 126, 7, '2023-05-07 16:36:33', '2023-05-07 16:36:33');

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
(12, 125, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-08 08:46:01', '2023-03-08 08:46:01', '2023-03-08', '12:46:01'),
(13, 125, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-08 08:47:28', '2023-03-08 08:47:28', '2023-03-08', '12:47:28'),
(14, 125, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-08 08:52:02', '2023-03-08 08:52:02', '2023-03-08', '12:52:02'),
(16, 126, 'placing an order', 'You have placed and order Successfully', 0, '2023-03-08 09:02:52', '2023-03-08 09:02:52', '2023-03-08', '13:02:52'),
(18, 129, 'placing an order', 'You have placed an order Successfully', 0, '2023-03-08 12:23:32', '2023-03-08 12:23:32', '2023-03-08', '16:23:32'),
(19, 138, 'placing an order', 'You have placed an order Successfully', 0, '2023-04-09 08:14:56', '2023-04-09 08:14:56', '2023-04-09', '12:14:56'),
(20, 138, 'placing an order', 'You have placed an order Successfully', 0, '2023-04-09 08:15:17', '2023-04-09 08:15:17', '2023-04-09', '12:15:17'),
(21, 138, 'placing an order', 'You have placed an order Successfully', 0, '2023-04-09 08:15:50', '2023-04-09 08:15:50', '2023-04-09', '12:15:50'),
(22, 138, 'placing an order', 'You have placed an order Successfully', 0, '2023-04-09 08:17:21', '2023-04-09 08:17:21', '2023-04-09', '12:17:21'),
(23, 138, 'placing an order', 'You have placed an order Successfully', 0, '2023-04-09 08:17:57', '2023-04-09 08:17:57', '2023-04-09', '12:17:57'),
(24, 138, 'placing an order', 'You have placed an order Successfully', 0, '2023-04-09 08:18:29', '2023-04-09 08:18:29', '2023-04-09', '12:18:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `frequency_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time_slote` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `houres` int(11) DEFAULT NULL,
  `proffessional` int(11) DEFAULT NULL,
  `material` int(11) DEFAULT NULL,
  `locker_id` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `frequency_status` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_car`
--

CREATE TABLE `order_car` (
  `id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_car`
--

INSERT INTO `order_car` (`id`, `car_id`, `order_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 95, 1, 0, '2023-04-09 08:14:53', '2023-04-09 08:14:53'),
(2, 95, 2, 0, '2023-04-09 08:15:16', '2023-04-09 08:15:16'),
(3, 95, 3, 0, '2023-04-09 08:15:50', '2023-04-09 08:15:50'),
(4, 95, 4, 0, '2023-04-09 08:17:20', '2023-04-09 08:17:20'),
(5, 95, 5, 0, '2023-04-09 08:17:57', '2023-04-09 08:17:57');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `phone` varchar(255) NOT NULL,
  `pin` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`phone`, `pin`, `created_at`) VALUES
('0000000000', '4039', '2023-03-27 00:56:13'),
('0000002213', '3154', '2023-03-27 01:01:10'),
('527123456', '7081', '2023-05-07 14:10:30');

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
(92, 'App\\Models\\User', 118, 'kkn@gmail.com_Token', 'ed9dc30591fbfa73caba93f51c211702fd88c9003a0c359e926453822103b514', '[\"user\"]', NULL, NULL, '2023-03-08 04:36:42', '2023-03-08 04:36:42'),
(93, 'App\\Models\\User', 118, 'kkn@gmail.com_Token', '01174b6638d6343ffe00cc7c2db75ca423e7c70c5a1b3c33aa4a46ebd9e0a228', '[\"user\"]', '2023-03-08 04:55:52', NULL, '2023-03-08 04:55:35', '2023-03-08 04:55:52'),
(97, 'App\\Models\\User', 129, 'kamalkhan@gmail.com_Token', 'd1336da5aaf4c7619f20bbd25789bc0f056a89651b6d2db7cfae1cd97b42407f', '[\"user\"]', '2023-03-08 08:23:34', NULL, '2023-03-08 08:14:15', '2023-03-08 08:23:34'),
(98, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', '2e79166e01076b4c6f204cfcedd58921c1ae40f8ee4f357b50ae6f7c890445ef', '[\"user\"]', NULL, NULL, '2023-03-15 05:58:14', '2023-03-15 05:58:14'),
(99, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', 'b6a2ad4d477b1d0a95303ec4ddef997d0fd9df161c3a7c8c5d5dcb50e378f29d', '[\"user\"]', NULL, NULL, '2023-03-16 01:57:40', '2023-03-16 01:57:40'),
(100, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', 'a7d2c00a4a4332aae1d8efc3a24c15408ff2cfe724ff1051fa75af01f1054fe8', '[\"user\"]', '2023-03-16 02:45:26', NULL, '2023-03-16 02:08:30', '2023-03-16 02:45:26'),
(101, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', '12f3a345f8f3929a9675e8ba57b73690311ee33b82b822449e4e6e352e5339d0', '[\"user\"]', NULL, NULL, '2023-03-16 02:28:13', '2023-03-16 02:28:13'),
(102, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', 'f4fae3d6f9731045e2d60c40b62fd518ed4202819db304545b36d5e2d17689a5', '[\"user\"]', '2023-03-16 08:41:06', NULL, '2023-03-16 02:35:56', '2023-03-16 08:41:06'),
(103, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', 'de062ad56bdae8053dd7c1eac84f82e4778bd5eff93394d1ac85b34262c8dbda', '[\"user\"]', NULL, NULL, '2023-03-16 03:03:36', '2023-03-16 03:03:36'),
(104, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', 'cf0ff9b084fe6e2aa868945608e871801bb1c775b65b22800d84300c8ca8ee00', '[\"user\"]', NULL, NULL, '2023-03-16 03:46:36', '2023-03-16 03:46:36'),
(105, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', '449a836d73c9e39967c06ba425de20156dc3bcaa8f366b4a607f5d693da21602', '[\"user\"]', NULL, NULL, '2023-03-16 04:18:17', '2023-03-16 04:18:17'),
(106, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', 'cb4b9de5b4efd86b3edd6f230edf04456bc93caf48416e8cc90d98dad92c0b41', '[\"user\"]', '2023-03-28 13:12:08', NULL, '2023-03-16 04:19:45', '2023-03-28 13:12:08'),
(107, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', '35000604230992e55a9d80f3b13ddaecf9a8844b227fae6ed1fd5725f48bd768', '[\"user\"]', '2023-03-16 04:39:13', NULL, '2023-03-16 04:39:08', '2023-03-16 04:39:13'),
(108, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', '32b32939fe04a61f8036fc9a6351a88f3b9a93e149a8b6df087b7e017193c925', '[\"user\"]', '2023-03-16 05:10:49', NULL, '2023-03-16 05:10:45', '2023-03-16 05:10:49'),
(109, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', '8ce2872c526ea2f65583bcfbd4f55b2014f5894c447a997343bf0cb8e7145856', '[\"user\"]', '2023-03-16 05:13:54', NULL, '2023-03-16 05:13:48', '2023-03-16 05:13:54'),
(110, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', 'ab0b6e69a571640ce5648f82eea0aa1b30999fcbaaa9705e96527adeabd9cab8', '[\"user\"]', NULL, NULL, '2023-03-16 05:29:16', '2023-03-16 05:29:16'),
(111, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', '10a2fe8ff4715a5a1fd18d470db9caf870b1e20f85a18042c1130c99eb4a7cf0', '[\"user\"]', '2023-03-29 05:29:02', NULL, '2023-03-16 05:29:20', '2023-03-29 05:29:02'),
(112, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', '859d5220fd8c7d0209fb0ea165a2587dbea1f843dbd18ce05e691232b29be2bd', '[\"user\"]', '2023-03-16 05:37:02', NULL, '2023-03-16 05:36:57', '2023-03-16 05:37:02'),
(113, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', '455151d5e626482e882813bf3071436b75192c9828e330fb1dedfad8a188fd86', '[\"user\"]', '2023-03-16 05:39:54', NULL, '2023-03-16 05:39:51', '2023-03-16 05:39:54'),
(114, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', '155731c105b54bde9eba6dc3ee42ea19edb503a2e80e66faaf058d911862e97a', '[\"user\"]', '2023-03-16 06:59:44', NULL, '2023-03-16 05:43:30', '2023-03-16 06:59:44'),
(115, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', 'ae57f3f1a6f0074dc8f6567d3ada01f05a56943a16a66c1b1eb793c5c9aaab71', '[\"user\"]', '2023-03-16 07:05:15', NULL, '2023-03-16 07:03:35', '2023-03-16 07:05:15'),
(116, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', 'f58bc52fe9c2dc6a1076b94477876e4ae5bd9ea8e7d8118f5a60f210dfca026e', '[\"user\"]', '2023-03-16 07:43:14', NULL, '2023-03-16 07:06:05', '2023-03-16 07:43:14'),
(117, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', 'bbac2e73f6cb77faf70822fcba28d491bc657b7aa0fbe8ea16160e0e3af08c22', '[\"user\"]', '2023-03-16 08:27:24', NULL, '2023-03-16 07:45:08', '2023-03-16 08:27:24'),
(118, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', 'eb7513ba95dd48a61af52eba18a06f7a892df40cb512200ae56f3f578545e3ee', '[\"user\"]', NULL, NULL, '2023-03-16 08:27:48', '2023-03-16 08:27:48'),
(119, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', 'fdfe476c9401af72739a5d0fce029d70c77b38ea5421d0207e38952829624eb0', '[\"user\"]', NULL, NULL, '2023-03-16 08:32:19', '2023-03-16 08:32:19'),
(120, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', '821670d65755fb5515137be1303ea2ad661068b1d21943f6c08b8d40b47a58d3', '[\"user\"]', '2023-03-16 08:33:46', NULL, '2023-03-16 08:32:25', '2023-03-16 08:33:46'),
(121, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', '5eef5714eaae344dae220161ffc193dd9fe23812ea4526e215201ad825623a4e', '[\"user\"]', NULL, NULL, '2023-03-16 08:32:36', '2023-03-16 08:32:36'),
(122, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', 'a58c8db0ef2c25b930361c03c9cf58cf5d4ca8a9cd81d9a752d251285ed61c43', '[\"user\"]', '2023-03-16 08:40:47', NULL, '2023-03-16 08:34:39', '2023-03-16 08:40:47'),
(123, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', 'a4c0e7a57af733eebc1e73f7188b417b7512a1fd0efe9d7bbe2d8c91dbe6ed10', '[\"user\"]', '2023-03-16 08:52:25', NULL, '2023-03-16 08:41:08', '2023-03-16 08:52:25'),
(124, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', '99af2eec3fef82da2800c59c40c3b050111f4014c7075f9f906fd55ba54a0c7e', '[\"user\"]', '2023-03-16 08:57:39', NULL, '2023-03-16 08:53:46', '2023-03-16 08:57:39'),
(125, 'App\\Models\\User', 130, 'kk22@gmail.com_Token', '39decc000e2eec0ad1dc1e5b3ce5ced900eca4c722d18d03b40757b8b5431dba', '[\"user\"]', '2023-03-19 07:07:59', NULL, '2023-03-16 08:58:02', '2023-03-19 07:07:59'),
(146, 'App\\Models\\User', 139, 'kamal2@gmail.com_Token', '10db0b964cdc2d634291ed080a3c69d9685b4f8cb95098794f28bb0c02336662', '[\"user\"]', '2023-03-22 04:41:30', NULL, '2023-03-22 04:40:57', '2023-03-22 04:41:30'),
(149, 'App\\Models\\User', 140, 'temsah@tamasiho.com_Token', '643f2c0cf34ec6de15f3727354950b10948e173157f2ee55a5fcd0f402033e21', '[\"user\"]', '2023-03-22 06:00:01', NULL, '2023-03-22 05:36:10', '2023-03-22 06:00:01'),
(151, 'App\\Models\\User', 142, 'zain@gmail.com_Token', '3495994041742b7a4a88246058faa87edba1b7923170df70d9aa0b6ef26d01b6', '[\"user\"]', '2023-03-22 06:08:42', NULL, '2023-03-22 06:08:41', '2023-03-22 06:08:42'),
(152, 'App\\Models\\User', 145, 'kamal12@gmail.com_Token', '082c60aea5860f015410fad220d6d7061405a1805c976bb5f94849e90970dcb4', '[\"user\"]', '2023-03-22 06:32:17', NULL, '2023-03-22 06:24:36', '2023-03-22 06:32:17'),
(154, 'App\\Models\\User', 140, 'temsah@tamasiho.com_Token', '329716f9fad66917a6b700478ba2bb53b9f99f63c6ca6b0d8ad93f70bad18b70', '[\"user\"]', '2023-03-22 09:00:55', NULL, '2023-03-22 08:55:24', '2023-03-22 09:00:55'),
(162, 'App\\Models\\User', 147, 'bakleh@gmail.com_Token', 'a8487320a78164d4202dd606db73f8766e28e61d3c5f6eb4581d7aa42a999681', '[\"user\"]', '2023-03-27 03:47:33', NULL, '2023-03-27 03:47:14', '2023-03-27 03:47:33'),
(163, 'App\\Models\\User', 148, 'bakleh11@gmail.com_Token', '18b74a3923e7634792428bce5bac122a830fd0cb3b787d62c57f126af5c42c7f', '[\"user\"]', '2023-03-27 03:56:17', NULL, '2023-03-27 03:54:21', '2023-03-27 03:56:17'),
(169, 'App\\Models\\User', 150, 'bakleh22@gmail.com_Token', '982136edf51a64c174947737e58ffa1ffe8994e49bef6c60265cab45698dd0dc', '[\"user\"]', '2023-03-28 03:24:34', NULL, '2023-03-28 03:24:13', '2023-03-28 03:24:34'),
(172, 'App\\Models\\User', 151, 'f@gmail.com_Token', 'caffe07c96b68e5e86b275f036f9ddf999cd4759e741444eb4b028d1893c08e7', '[\"user\"]', '2023-03-29 06:45:00', NULL, '2023-03-29 06:13:08', '2023-03-29 06:45:00'),
(176, 'App\\Models\\User', 138, 'kku@gmail.com_Token', '9fbd3b7a703c053d4c745b1ff3af3d9ce543295fd522a72648864a4845654861', '[\"user\"]', '2023-03-31 23:15:53', NULL, '2023-03-29 10:32:13', '2023-03-31 23:15:53'),
(177, 'App\\Models\\User', 138, 'kku@gmail.com_Token', 'e626912a968cdd5f0f18f25cba3788b80d6679bacf515df709d560b84490a750', '[\"user\"]', NULL, NULL, '2023-03-29 10:41:36', '2023-03-29 10:41:36'),
(178, 'App\\Models\\User', 138, 'kku@gmail.com_Token', '0860dbf156b283230ece0bb103d033703bd4561ebb411a982b8ccdbf3f3b2c8a', '[\"user\"]', '2023-03-30 06:19:11', NULL, '2023-03-29 10:42:08', '2023-03-30 06:19:11'),
(179, 'App\\Models\\User', 138, 'kku@gmail.com_Token', '20fe60c5451ad7fac9e50488ca4155a4b083c9cddc334ca19d2a0d0ce0f1ee06', '[\"user\"]', '2023-03-30 05:54:47', NULL, '2023-03-30 04:52:21', '2023-03-30 05:54:47'),
(180, 'App\\Models\\User', 138, 'kku@gmail.com_Token', '9c4ef31ef47374377c24265b27c6dbe694af7a8f471a78e020767c1e5060cef3', '[\"user\"]', '2023-03-30 07:05:40', NULL, '2023-03-30 04:57:12', '2023-03-30 07:05:40'),
(181, 'App\\Models\\User', 152, 'danielle@valtrans.org_Token', '2c84d137dcbcc483619597a0d1692e4f538347ddc8ddfe53e1ab52886713eba4', '[\"user\"]', '2023-03-30 09:58:53', NULL, '2023-03-30 06:08:54', '2023-03-30 09:58:53'),
(182, 'App\\Models\\User', 138, 'kku@gmail.com_Token', 'bbf1acd39abb139e17ba09f1db2ce442c06a1320c48cf634d5ad9149bf6033b7', '[\"user\"]', '2023-04-09 04:18:28', NULL, '2023-04-03 04:13:01', '2023-04-09 04:18:28'),
(183, 'App\\Models\\User', 138, 'kku@gmail.com_Token', '205cdcf944a122eefc405ec6dffcd6027f3b134bf344aec3f2b7b3e5bb582584', '[\"user\"]', NULL, NULL, '2023-04-06 02:00:50', '2023-04-06 02:00:50'),
(203, 'App\\Models\\User', 158, 'phone4@gmail.com_Token', 'bf3727a29b097a88f640d6dc2995010bf83d079d871c05374369c9ef9125ebc9', '[\"user\"]', '2023-05-03 15:35:36', NULL, '2023-05-03 15:34:45', '2023-05-03 15:35:36'),
(204, 'App\\Models\\User', 155, 'phone1@gmail.com_Token', 'f192ed0e32abd4e934e0619e77d02ab0161dc74f113a3d67c2a309153e9dd411', '[\"user\"]', '2023-05-03 16:02:11', NULL, '2023-05-03 15:36:14', '2023-05-03 16:02:11'),
(205, 'App\\Models\\User', 157, 'phone3@gmail.com_Token', '5661fad883cee176254bcf2b8a3249839713bd2f079dc2774a4860a46ba10751', '[\"user\"]', '2023-05-04 15:54:36', NULL, '2023-05-03 15:37:13', '2023-05-04 15:54:36'),
(206, 'App\\Models\\User', 157, 'phone3@gmail.com_Token', '99932e1fe44cb886be3caaf080d591f559f282533765c93b9025c0528c67f475', '[\"user\"]', '2023-05-05 15:56:30', NULL, '2023-05-03 15:37:47', '2023-05-05 15:56:30'),
(207, 'App\\Models\\User', 155, 'phone1@gmail.com_Token', '4796d2ff4281185fd6c73093f57a8cda709f4fe5301a631ebfb07717508b39cf', '[\"user\"]', '2023-05-04 15:55:45', NULL, '2023-05-03 16:27:51', '2023-05-04 15:55:45'),
(208, 'App\\Models\\User', 159, 'slhilaj@gmail.com_Token', '427da976e9a5e78a20e21d018994361174dc85b7ed2a7f40f0c40931372d321f', '[\"user\"]', '2023-05-03 17:18:06', NULL, '2023-05-03 17:06:13', '2023-05-03 17:18:06'),
(215, 'App\\Models\\User', 156, 'phone2@gmail.com_Token', 'da8debcda28a5817dc5a2832c4260a07560a39357385a346ab624ac89ef4d524', '[\"user\"]', '2023-05-05 16:11:28', NULL, '2023-05-04 15:55:13', '2023-05-05 16:11:28'),
(216, 'App\\Models\\User', 155, 'phone1@gmail.com_Token', '96c6164c508f68923d2f692b9c107f6eecf5849f778bdf36abffbe4a2fe83d19', '[\"user\"]', '2023-05-05 15:02:03', NULL, '2023-05-04 15:56:28', '2023-05-05 15:02:03'),
(259, 'App\\Models\\User', 126, 'kkp@gmail.com_Token', 'ed111516687395080e400eb804e401a792ec0771bce0ed5cfba17124d653ad63', '[\"user\"]', '2023-05-05 15:35:27', NULL, '2023-05-05 15:35:23', '2023-05-05 15:35:27'),
(260, 'App\\Models\\User', 126, 'kkp@gmail.com_Token', 'd8be5f268ffd5eb26df2c0042240cdaefedf5d031f26bdc5f05aaf0e6ef8dfb5', '[\"user\"]', '2023-05-05 16:02:03', NULL, '2023-05-05 16:01:47', '2023-05-05 16:02:03'),
(261, 'App\\Models\\User', 156, 'phone2@gmail.com_Token', '7618788e1613c9db828a412187e2ab981e0898d6980f15fdab0b41ec013bcf8c', '[\"user\"]', '2023-05-05 16:09:53', NULL, '2023-05-05 16:02:30', '2023-05-05 16:09:53'),
(268, 'App\\Models\\User', 163, 'waseem1@gmail.com_Token', '145587c6e1c9e8154ee943b583ff850b9004513d5c57dde6bf46130906a666eb', '[\"user\"]', '2023-05-07 11:35:57', NULL, '2023-05-07 11:10:34', '2023-05-07 11:35:57'),
(269, 'App\\Models\\User', 163, 'waseem1@gmail.com_Token', '694ff16dd995ca5384e29b15d8b56ae67f936d5ea3db6c5af3c306464414b94c', '[\"user\"]', '2023-05-07 11:16:03', NULL, '2023-05-07 11:11:58', '2023-05-07 11:16:03');

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `is_free` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`id`, `name`, `description`, `price`, `is_free`, `created_at`, `updated_at`) VALUES
(3, 'Premium', 'this is a premium  plan', 0, 1, '2023-03-12 12:17:51', '2023-03-12 12:17:51'),
(4, 'Regular', 'this is a regular plan', 0, 1, '2023-03-12 12:23:29', '2023-03-12 12:23:29');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `picture_path` varchar(255) DEFAULT NULL,
  `item_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `picture_path`, `item_type`, `created_at`, `updated_at`) VALUES
(1, 'Car Wash', '/services_images/Category_Car_Wash.jpg', 'car', '2023-01-15 09:48:16', '2023-04-13 08:06:46'),
(2, 'Cleaning Services', '/services_images/Category_Cleaning_Service.jpg', 'other', '2023-01-16 10:02:34', '2023-03-08 07:44:55'),
(3, 'Car Refuel', '/services_images/Category_Car_Refueling.jpg', 'car', '2023-01-15 10:02:34', '2023-04-13 08:13:25'),
(11, 'Part Time Services', '/services_images/Category_Staff_Service.jpg', 'other', '2023-02-06 07:44:23', '2023-04-13 08:05:56'),
(15, 'Car Rental', '/services_images/Category_Car_Rental.jpg', 'car_rental', '2023-04-13 06:59:00', '2023-04-13 06:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `service_plan`
--

CREATE TABLE `service_plan` (
  `id` int(11) NOT NULL,
  `services_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_plan`
--

INSERT INTO `service_plan` (`id`, `services_id`, `plan_id`, `created_at`, `updated_at`) VALUES
(1, 2, 4, NULL, NULL),
(7, 2, 3, NULL, NULL),
(8, 15, 3, '2023-04-13 06:59:00', '2023-04-13 06:59:00'),
(9, 15, 4, '2023-04-13 06:59:00', '2023-04-13 06:59:00'),
(12, 11, 3, '2023-04-13 08:05:56', '2023-04-13 08:05:56'),
(13, 11, 4, '2023-04-13 08:05:56', '2023-04-13 08:05:56'),
(14, 1, 3, '2023-04-13 08:06:46', '2023-04-13 08:06:46'),
(15, 1, 4, '2023-04-13 08:06:46', '2023-04-13 08:06:46'),
(16, 3, 3, '2023-04-13 08:13:25', '2023-04-13 08:13:25'),
(17, 3, 4, '2023-04-13 08:13:25', '2023-04-13 08:13:25');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `picture`, `active`, `created_at`, `updated_at`) VALUES
(3, '/promotion_images/3.jpg', 1, '2023-05-01 13:58:51', '2023-05-01 13:58:53'),
(4, '/promotion_images/4.jpg', 1, '2023-05-01 09:53:29', '2023-05-01 09:53:29'),
(5, '/promotion_images/5.jpg', 1, '2023-05-01 09:53:29', '2023-05-01 09:53:29');

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
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `services_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `picture_path` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `title`, `services_id`, `category_id`, `picture_path`, `price`, `description`, `created_at`, `updated_at`) VALUES
(4, 'Interior', 1, 1, '/categories_images/1679318564.jpg', 0, 'Kitchen - dishwashing, stove top, splashback, sink, and exterior appliances, emptying  the bin./Balcony - Dry/Washout/Bedroom - Changing bedsheets, making the bed/Bathroom - Sink and toilet bowl mirror wiping./Other chores - dusting, mopping.', '2023-03-20 09:59:39', '2023-03-20 09:59:39');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories_plan`
--

CREATE TABLE `subcategories_plan` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `subcategories_id` int(11) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subcategories_plan`
--

INSERT INTO `subcategories_plan` (`id`, `plan_id`, `subcategories_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 150, '2023-03-13 06:01:52', '2023-03-13 06:01:52'),
(2, 4, 2, 200, '2023-03-13 06:01:52', '2023-03-13 06:01:52'),
(3, 3, 3, 450, '2023-03-13 06:15:28', '2023-03-13 06:15:28'),
(4, 4, 3, 650, '2023-03-13 06:15:28', '2023-03-13 06:15:28'),
(5, 3, 4, 100, '2023-03-20 13:59:39', '2023-03-20 13:59:39'),
(6, 4, 4, 200, '2023-03-20 13:59:39', '2023-03-20 13:59:39');

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
('0896327852', '2689', '2023-02-09 06:59:00'),
('1236547890', '5673', '2023-03-22 06:06:18');

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
  `address` text DEFAULT NULL,
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
  `plan_id` int(11) DEFAULT 0,
  `is_parkonic` int(11) NOT NULL DEFAULT 0,
  `is_verfied` int(11) NOT NULL DEFAULT 0,
  `balance` double NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `appartment_number`, `building_id`, `address`, `email_verified_at`, `password`, `remember_token`, `device_key`, `created_at`, `updated_at`, `is_email_verified`, `is_phone_verified`, `agree`, `two_step`, `login_attempts`, `last_login`, `blockdatetime`, `plan_id`, `is_parkonic`, `is_verfied`, `balance`, `active`) VALUES
(118, 'kkn@gmail.com', 'kkn@gmail.com', '0852369524', 'f', 1, NULL, NULL, '$2y$10$8Yk10tjVtEjP8QpvkML16egPL/615jBPemgdpcyZdJbWNfIZGoJFa', NULL, 'cHw-aCd1SlChPrrQE4ehaG:APA91bErMfIyoDZWoUo5Y20ZTSl0Bb5WXRrcMD1bmNpci8g6vZF7MAKd0VfozVCEqpQ9GM0UqOZk6AZxbeURoIgeYPpNKtIhNwtrcvnfPCIRRaMpYAgLAA-QBorvsxImAois9t9xiUTG', '2023-02-23 03:55:57', '2023-03-07 12:09:21', 0, 0, 1, 0, 0, '2023-02-23 11:55:57', NULL, 0, 0, 0, 0, 1),
(119, 'Yahya Bakleh', 'bakleh959yahya@gmail.com', '0562438355', '2706', 1, NULL, NULL, '$2y$10$8GCEuABVnT4/J1uuEAGYMOqAHjCS1zkvkrfp6TX2f/QbSHzpIB7X2', NULL, NULL, '2023-02-26 01:32:46', '2023-02-26 01:32:46', 0, 0, 1, 0, 0, '2023-02-26 09:32:46', NULL, 0, 0, 0, 100.25, 1),
(120, 'kkop', 'kkn@gmail.con', '1538630111', '012', 1, NULL, NULL, '$2y$10$LjqgS4IvTgwxFA/AnK40tOMIpgV.FkuEtYcw8fpkRtePJNcjXLHJa', NULL, 'cHw-aCd1SlChPrrQE4ehaG:APA91bErMfIyoDZWoUo5Y20ZTSl0Bb5WXRrcMD1bmNpci8g6vZF7MAKd0VfozVCEqpQ9GM0UqOZk6AZxbeURoIgeYPpNKtIhNwtrcvnfPCIRRaMpYAgLAA-QBorvsxImAois9t9xiUTG', '2023-03-02 04:44:03', '2023-03-02 04:44:49', 0, 0, 1, 0, 0, '2023-03-02 12:44:03', NULL, 0, 0, 0, 0, 1),
(121, 'kkop', 'kknn@gmail.com', '1538630189', '012', 1, NULL, NULL, '$2y$10$j5EQIy9aQvBcMDpl8BLWG.orLURai0L0n1gX7ARXIdACv1ZR1UXtu', NULL, NULL, '2023-03-07 04:05:11', '2023-03-07 04:05:11', 0, 0, 1, 0, 0, '2023-03-07 12:05:11', NULL, 0, 0, 0, 0, 1),
(122, 'baloch@gmail.com', 'baloch@gmail.com', '0853465488', 'gggh', 1, NULL, NULL, '$2y$10$fxnxrUK5IY11ozfMAecrFeoiPQGrQOekzB2Bd0/t9T5ngAgK/hRUa', NULL, NULL, '2023-03-07 04:05:18', '2023-03-07 04:05:18', 0, 0, 1, 1, 0, '2023-03-07 12:05:18', NULL, 0, 0, 0, 0, 1),
(124, 'jibin@parkonic.com', 'jibin@parkonic.com', '0504163041', '506', 29, NULL, NULL, '$2y$10$vYgFDv1vTIPcpuMMBWGzdu3dmY0Ceh9CRXVhTJHrT0crJ8FapfITK', NULL, 'mhghgfuhbgfdeswaesertdyfughuj', '2023-03-07 06:22:50', '2023-03-07 06:37:35', 0, 0, 1, 0, 0, '2023-03-07 14:22:50', NULL, 0, 0, 0, 0, 1),
(125, 'kkz@gmail.com', 'kkz@gmail.com', '0785256358', 'jhjghhjjh', 29, NULL, NULL, '$2y$10$NNMWrAFFfN0FtIgdKgGpEe1BhtX.zLqkH1BIw6I3ds.m9dSTYv2Ze', NULL, 'fXu_ZvdcQfeBp6_mg7GnpM:APA91bEyv2w_jIR-HUCbe76F2gwU5aqDT-kJoxjhtXI9fiT80SKKXP7LwLGnty6HCaJV-GHIYYDmK_hS6loYST_DsWKLIPYX1U92B0t9Mbuildz_ccYBPetHZXKYMZYKdHWExQ9GTaNG', '2023-03-07 14:23:04', '2023-03-08 01:35:35', 0, 0, 1, 0, 0, '2023-03-07 22:23:04', NULL, 0, 0, 0, 0, 1),
(126, 'kkp@gmail.com', 'kkp@gmail.com', '0896431254', 'blue sky', 1, NULL, NULL, '$2y$10$d5Bb1Kzs1PiWxSE7bSnKA.9r1yg22PFxIYjiXqfcwx1/PWll/ekK2', NULL, 'mhghgfuhbgfdeswaesertdyfughuj', '2023-03-08 01:54:18', '2023-05-05 16:01:47', 0, 0, 1, 0, 0, '2023-03-08 09:54:18', NULL, 3, 0, 0, 0, 1),
(128, 'salman@gmail.com', 'salman@gmail.com', '0894648521', 'Blue sky', 29, NULL, NULL, '$2y$10$aFyhgAYEeIKrm3tNJ39Qg.VaIgZ/pnfIgPM14fKrguh/0kd.8GoOC', NULL, NULL, '2023-03-08 05:39:09', '2023-03-08 05:39:09', 0, 0, 1, 1, 0, '2023-03-08 13:39:09', NULL, 0, 0, 0, 0, 1),
(129, 'kamalkhan@gmail.com', 'kamalkhan@gmail.com', '0123456787', 'blue sky', 1, NULL, NULL, '$2y$10$VGHbBxL7YjV6TJf9x2tEf.NUV1B1X1/rVvrpYyahnW05T8P/hr8/i', NULL, 'fswhf2IXTReu_lheW7vn8p:APA91bHEBBe0MqJzBI2_dc0OkeyTx6GewXiGaSmS9BcwA8KkBFGSLLe_SN3cZ4hgXC93uNT71BxsOjf84vy6cWoIWYG3UJ5d928dp8e3WFc2ooZtrkRaG92dTBcQ9qWxI_fhulquEUSR', '2023-03-08 08:13:30', '2023-03-08 08:14:15', 0, 0, 1, 0, 0, '2023-03-08 16:13:30', NULL, 0, 0, 0, 0, 1),
(130, 'kk', 'kk22@gmail.com', '0003000000', '012', 1, NULL, NULL, '$2y$10$0MOd1tQrQElQoDF0FxSMOeDwcVuRIailpT3vI4uu/04PQCvjIoVXi', NULL, 'ePcspvu8RGaFA4UiqEA3qb:APA91bGW_CsQdG8RYCru6wlZARatYuipgcQk8FzXYqnWfFDDHhEfezH1UIRPjybxUgA3-oP2luYd5eHoRmBgBySjtpGwf_r9GC-KznDkZ2WjfSQZt1x0QFB8Lalea-Yf9h95WFXu6DXl', '2023-03-15 05:51:46', '2023-03-19 08:40:47', 0, 0, 1, 0, 0, '2023-03-15 13:51:46', NULL, 3, 0, 0, 0, 1),
(131, 'sajid@gmail.com', 'sajid@gmail.com', '0852365657', 'fghy', 1, NULL, NULL, '$2y$10$LBe96LOFEnZbsqghApyhF.g156GvlLchEgYjyn3OBRtl3p4Yu2G/S', NULL, NULL, '2023-03-19 07:37:23', '2023-03-19 07:37:23', 0, 0, 1, 0, 0, '2023-03-19 15:37:23', NULL, 0, 0, 0, 0, 1),
(132, 'sajidd@gmail.com', 'sajidd@gmail.com', '0852365658', 'fghy', 1, NULL, NULL, '$2y$10$nPr3AakWyfZY2xE9k1n9o.6/vI0GkygP6vxGTDriI0PyUAipQPicy', NULL, NULL, '2023-03-19 07:45:12', '2023-03-19 07:45:12', 0, 0, 1, 0, 0, '2023-03-19 15:45:12', NULL, 0, 0, 0, 0, 1),
(133, 'kkng@gmail.com', 'kkng@gmail.com', '0852364657', 'fghy', 1, NULL, NULL, '$2y$10$9UgEtDh9oKpDSUKlQznTb.QlXkFhVNsypwMt2fll7kdPT7kF9GDm2', NULL, NULL, '2023-03-19 07:49:31', '2023-03-19 07:49:31', 0, 0, 1, 0, 0, '2023-03-19 15:49:31', NULL, 0, 0, 0, 0, 1),
(134, 'gul@gmail.com', 'gul@gmail.com', '0897564558', 'gjv', 29, NULL, NULL, '$2y$10$62laUf0OmSAJ/vH1S.IkKun0ttYIwuctVsB5gCdUTZ08YtmbxJtVe', NULL, NULL, '2023-03-19 08:05:30', '2023-03-19 08:05:30', 0, 0, 1, 0, 0, '2023-03-19 16:05:30', NULL, 0, 0, 0, 0, 1),
(135, 'gula@gmail.com', 'gula@gmail.com', '0897645315', 'ka', 29, NULL, NULL, '$2y$10$q6ehHS/bgZYd1CgOwiHwru2kzSDrvUo5wUmBHh4SocknYCEznfSze', NULL, NULL, '2023-03-19 08:07:25', '2023-03-19 08:07:25', 0, 0, 1, 0, 0, '2023-03-19 16:07:25', NULL, 0, 0, 0, 0, 1),
(136, 'masood@gmail.com', 'masood@gmail.com', '1234564896', 'fjv', 29, NULL, NULL, '$2y$10$PpA7GaO.y.OfjBhPkG20OOf2.oIYqlGFt7yPLBdRCGb8Dp7RfTImi', NULL, NULL, '2023-03-19 08:09:03', '2023-03-19 08:09:03', 0, 0, 1, 0, 0, '2023-03-19 16:09:03', NULL, 0, 0, 0, 0, 1),
(137, 'sohban@gmail.com', 'sohban@gmail.com', '1234569463', 'ggghu', 29, NULL, NULL, '$2y$10$Clp5iXoG8.Ti5ChVmh/ymetnVaxuhXvdmZsLLA/UV6AEZcC7jFOpS', NULL, NULL, '2023-03-19 08:21:57', '2023-03-19 08:21:57', 0, 0, 1, 0, 0, '2023-03-19 16:21:57', NULL, 0, 0, 0, 0, 1),
(138, 'kku@gmail.com', 'kku@gmail.com', '0896574123', '4fg', 1, NULL, NULL, '$2y$10$tF4bgcyVJBwdaR25G1WFaej2CArX4tccBXjeQWptEA9uuEebXG67O', NULL, 'mhghgfuhbgfdeswaesertdyfughuj', '2023-03-19 08:25:04', '2023-04-03 04:13:01', 0, 0, 1, 0, 0, '2023-03-19 16:25:04', NULL, 4, 0, 0, 0, 1),
(139, 'kamal2@gmail.com', 'kamal2@gmail.com', '0789654123', 'Blue sky', 29, NULL, NULL, '$2y$10$bj7EyNBZkTJx2D9CeRyG5ejcmEUl/V.QxPL2xndc0/C33w1/UxiJa', NULL, 'ePcspvu8RGaFA4UiqEA3qb:APA91bGW_CsQdG8RYCru6wlZARatYuipgcQk8FzXYqnWfFDDHhEfezH1UIRPjybxUgA3-oP2luYd5eHoRmBgBySjtpGwf_r9GC-KznDkZ2WjfSQZt1x0QFB8Lalea-Yf9h95WFXu6DXl', '2023-03-22 04:40:27', '2023-03-22 04:41:21', 0, 0, 1, 0, 0, '2023-03-22 12:40:27', NULL, 4, 0, 0, 0, 1),
(140, 'temsah@tamasiho.com', 'temsah@tamasiho.com', '580741369', '5609', 29, NULL, NULL, '$2y$10$oBtScRIu3HeA.4R1gc/bqOlFqAG4gD7y0KkXMCpjBoYQOqVFnKB4K', NULL, 'ePcspvu8RGaFA4UiqEA3qb:APA91bGW_CsQdG8RYCru6wlZARatYuipgcQk8FzXYqnWfFDDHhEfezH1UIRPjybxUgA3-oP2luYd5eHoRmBgBySjtpGwf_r9GC-KznDkZ2WjfSQZt1x0QFB8Lalea-Yf9h95WFXu6DXl', '2023-03-22 05:35:32', '2023-03-22 05:36:55', 0, 0, 1, 0, 0, '2023-03-22 13:35:32', NULL, 4, 0, 0, 0, 1),
(141, 'zub@gmail.com', 'zub@gmail.com', '1236547890', 'vghhh', 1, NULL, NULL, '$2y$10$DSPy7ioVFnUtsPvd7Sm4m.rqG/BSi1JuurkIiB4ys0db2t./17ETu', NULL, NULL, '2023-03-22 06:05:50', '2023-03-22 06:05:50', 0, 0, 1, 1, 0, '2023-03-22 14:05:50', NULL, 0, 0, 0, 0, 1),
(142, 'zain@gmail.com', 'zain@gmail.com', '0589652588', 'blue sky', 29, NULL, NULL, '$2y$10$eBpQwHMxCDi/r5g9UThH7eYshaiXp/JsVJj60ApJceDBdvTWUhEye', NULL, 'ePcspvu8RGaFA4UiqEA3qb:APA91bGW_CsQdG8RYCru6wlZARatYuipgcQk8FzXYqnWfFDDHhEfezH1UIRPjybxUgA3-oP2luYd5eHoRmBgBySjtpGwf_r9GC-KznDkZ2WjfSQZt1x0QFB8Lalea-Yf9h95WFXu6DXl', '2023-03-22 06:08:18', '2023-03-22 06:08:41', 0, 0, 1, 0, 0, '2023-03-22 14:08:18', NULL, 0, 0, 0, 0, 1),
(143, 'sameer@gmail', 'sameer@gmail', '123654789', 'v', 1, NULL, NULL, '$2y$10$inMl9XPQec29OMJi7QoIlOMpIkuk98/XsZkiDC.jeSm216Z2QxcZO', NULL, NULL, '2023-03-22 06:19:53', '2023-03-22 06:19:53', 0, 0, 1, 0, 0, '2023-03-22 14:19:53', NULL, 0, 0, 0, 0, 1),
(144, 'zeer@gmail.com', 'zeer@gmail.com', '0852134526', 'ghh', 1, NULL, NULL, '$2y$10$lmE.kHRi3GLRloFQPLLUBOZvU6F1ssKsLpElp9S6LsiloeHJ45YW.', NULL, NULL, '2023-03-22 06:22:06', '2023-03-22 06:22:06', 0, 0, 1, 0, 0, '2023-03-22 14:22:06', NULL, 0, 0, 0, 0, 1),
(145, 'kamal12@gmail.com', 'kamal12@gmail.com', '0897645312', 'bbb', 1, NULL, NULL, '$2y$10$PC2VqfkQiMuuic12BZ456.CDKjy0uPvgSxLI9bOeMGW1izAlGaiQC', NULL, 'ePcspvu8RGaFA4UiqEA3qb:APA91bGW_CsQdG8RYCru6wlZARatYuipgcQk8FzXYqnWfFDDHhEfezH1UIRPjybxUgA3-oP2luYd5eHoRmBgBySjtpGwf_r9GC-KznDkZ2WjfSQZt1x0QFB8Lalea-Yf9h95WFXu6DXl', '2023-03-22 06:24:13', '2023-03-22 06:24:47', 0, 0, 1, 0, 0, '2023-03-22 14:24:13', NULL, 4, 0, 0, 0, 1),
(146, 'kamal123@gmail.com', 'kamal123@gmail.com', '0000002213', 't 12333', 1, NULL, NULL, '$2y$10$fNmmlQkqmbjK9xzB0slhqemRAvka0e9g.7ZRk7MKHKXGVFlX19NiS', NULL, NULL, '2023-03-27 01:00:42', '2023-03-27 01:00:42', 0, 0, 1, 0, 0, '2023-03-27 09:00:42', NULL, 0, 0, 0, 0, 1),
(147, 'bakleh@gmail.com', 'bakleh@gmail.com', '562438455', '4404', 1, NULL, NULL, '$2y$10$X1A.aiPiJDnOx5VPfmWGleyfp1GD9bwthP6btkF2gQKPTGwCirXHG', NULL, 'ePcspvu8RGaFA4UiqEA3qb:APA91bGW_CsQdG8RYCru6wlZARatYuipgcQk8FzXYqnWfFDDHhEfezH1UIRPjybxUgA3-oP2luYd5eHoRmBgBySjtpGwf_r9GC-KznDkZ2WjfSQZt1x0QFB8Lalea-Yf9h95WFXu6DXl', '2023-03-27 03:46:33', '2023-03-27 03:47:30', 0, 0, 1, 0, 0, '2023-03-27 11:46:33', NULL, 3, 0, 0, 0, 1),
(148, 'bakleh11@gmail.com', 'bakleh11@gmail.com', '056243588', '4404', 29, NULL, NULL, '$2y$10$6A.RWfNnnRRh5W4gGUJ4be7v4uYXSjO4K4eUU3n9L8N97XOwr4Ta.', NULL, 'ePcspvu8RGaFA4UiqEA3qb:APA91bGW_CsQdG8RYCru6wlZARatYuipgcQk8FzXYqnWfFDDHhEfezH1UIRPjybxUgA3-oP2luYd5eHoRmBgBySjtpGwf_r9GC-KznDkZ2WjfSQZt1x0QFB8Lalea-Yf9h95WFXu6DXl', '2023-03-27 03:53:28', '2023-03-27 03:54:39', 0, 0, 1, 0, 0, '2023-03-27 11:53:28', NULL, 3, 0, 0, 0, 1),
(149, 'salman1@gmail.com', 'salman1@gmail.com', '0784896451', 'gjb', 29, NULL, NULL, '$2y$10$7QBMx2qEneZE6M.E9ngYF.pK0EnWMKxh4Q98HJs63.YLn7PM24kjG', NULL, 'ePcspvu8RGaFA4UiqEA3qb:APA91bGW_CsQdG8RYCru6wlZARatYuipgcQk8FzXYqnWfFDDHhEfezH1UIRPjybxUgA3-oP2luYd5eHoRmBgBySjtpGwf_r9GC-KznDkZ2WjfSQZt1x0QFB8Lalea-Yf9h95WFXu6DXl', '2023-03-28 02:44:42', '2023-03-28 02:45:44', 0, 0, 1, 0, 0, '2023-03-28 10:44:42', NULL, 3, 0, 0, 0, 1),
(150, 'bakleh22@gmail.com', 'bakleh22@gmail.com', '524345585', '4404', 1, NULL, NULL, '$2y$10$UNOfBnHM3sC14KZQTtb4B.J8SueBRLES/1yYMJLj14ZJalKuSt0Py', NULL, 'ePcspvu8RGaFA4UiqEA3qb:APA91bGW_CsQdG8RYCru6wlZARatYuipgcQk8FzXYqnWfFDDHhEfezH1UIRPjybxUgA3-oP2luYd5eHoRmBgBySjtpGwf_r9GC-KznDkZ2WjfSQZt1x0QFB8Lalea-Yf9h95WFXu6DXl', '2023-03-28 03:22:35', '2023-03-28 03:24:31', 0, 0, 1, 0, 0, '2023-03-28 11:22:35', NULL, 3, 0, 0, 0, 1),
(151, 'f@gmail.com', 'f@gmail.com', '56874521', '4405', 1, NULL, NULL, '$2y$10$0cps1QReunTtPh0l/bKtEOhb7GMpPgmVlKs4/2D3yCoVCrI6F/1eO', NULL, 'ePcspvu8RGaFA4UiqEA3qb:APA91bGW_CsQdG8RYCru6wlZARatYuipgcQk8FzXYqnWfFDDHhEfezH1UIRPjybxUgA3-oP2luYd5eHoRmBgBySjtpGwf_r9GC-KznDkZ2WjfSQZt1x0QFB8Lalea-Yf9h95WFXu6DXl', '2023-03-29 06:12:47', '2023-03-29 06:20:01', 0, 0, 1, 0, 0, '2023-03-29 06:12:47', NULL, 3, 0, 0, 0, 1),
(152, 'danielle@valtrans.org', 'danielle@valtrans.org', '586930942', '123', 1, NULL, NULL, '$2y$10$6A.RWfNnnRRh5W4gGUJ4be7v4uYXSjO4K4eUU3n9L8N97XOwr4Ta.', NULL, 'ePcspvu8RGaFA4UiqEA3qb:APA91bGW_CsQdG8RYCru6wlZARatYuipgcQk8FzXYqnWfFDDHhEfezH1UIRPjybxUgA3-oP2luYd5eHoRmBgBySjtpGwf_r9GC-KznDkZ2WjfSQZt1x0QFB8Lalea-Yf9h95WFXu6DXl', '2023-03-29 07:36:18', '2023-03-30 06:09:40', 0, 0, 1, 0, 0, '2023-03-29 07:36:18', NULL, 3, 0, 0, 0, 1),
(153, 'dani@valtrans.org', 'dani@valtrans.org', '528147717', '123', 29, NULL, NULL, '$2y$10$pgggnlNFLoIBxeGj3AqdD.QsdjJFG4AzrqNQPMg/2DCnTof3A7KhK', NULL, NULL, '2023-03-30 06:06:36', '2023-03-30 06:06:36', 0, 0, 1, 0, 0, '2023-03-30 06:06:36', NULL, 0, 0, 0, 0, 1),
(154, 'kkbn', 'kkbn@gmail.com', '0123222222', 'ff', 1, NULL, NULL, '$2y$10$Y8PdsY0rqX16gA5z51m0b.CjXvpGOR5RfNHjzt3KAXy0Pk9MW.vTu', NULL, NULL, '2023-05-03 13:15:13', '2023-05-04 15:43:36', 0, 0, 1, 0, 0, '2023-05-03 09:15:13', NULL, 0, 0, 0, 0, 1),
(155, 'phone1', 'phone1@gmail.com', '0001844012', '012', 1, NULL, NULL, '$2y$10$I4xW7gjCF/ioD22WnL5o1uCH1vzwhfY2.Ws3IqItvEfVOFN8UzI5m', NULL, 'cHZlaRJLTEq_4xdFBtoypv:APA91bEO7cbEbXNhtP-NE5aHmQGt9kxVj9fVE0au3JdMeCUwDLSTx70uhGYwEI9ewL9ChmL3pEOLTj2Pzfa4dbliWhd_HmdBxhxT79c0YMunkFbKB3BgNFP6METD-TLaJP0nCB5iAlLP', '2023-05-03 13:15:48', '2023-05-04 16:24:26', 0, 0, 1, 0, 0, '2023-05-03 09:15:48', NULL, 3, 0, 0, 0, 1),
(156, 'phone2', 'phone2@gmail.com', '0401844012', '012', 1, NULL, NULL, '$2y$10$bBCbOIPeO3S3465Xm1IQ7uq9KLRmVQnR0gk.ajI2WIBtpoQuvtYs6', NULL, 'mhghgfuhbgfdeswaesertdyfughuj', '2023-05-03 13:17:07', '2023-05-05 16:02:30', 0, 0, 1, 0, 0, '2023-05-03 09:17:07', NULL, 3, 0, 0, 0, 1),
(157, 'phone3', 'phone3@gmail.com', '0401144012', '012', 29, NULL, NULL, '$2y$10$nWQcfVFyQVT/q7DluR81x.eUt/xTHjgP9fnYn9HtYS8em//bXopbC', NULL, 'dvfyhsanSHuGRMQ9RbahgO:APA91bGUlsAE-es_1Yc5Ifr4g3Ur9UxE20MzTBam1A2LUTU4gyRFSSZsLoRJUom02XPz7LCse3g3ieKZTbGpNt9lDnY3ygJJpO2Lmwx0nIjvMOK_Fgf7AsriKooyHMf4lLom3v6bMpDF', '2023-05-03 13:17:52', '2023-05-03 15:37:47', 0, 0, 1, 0, 0, '2023-05-03 09:17:52', NULL, 3, 0, 0, 0, 0),
(158, 'phone4', 'phone4@gmail.com', '0400144012', '012', 1, NULL, NULL, '$2y$10$/cjO5q6j1hxVAU8kusq.F.jcwIAHPrYST2GbLqt6hAdq7bbS2j7yu', NULL, 'd4E3hDSJTO2Ev57SMFjTV6:APA91bHQ1hg0vvipyAtMvgqsmHSZ9edVLmTmyMtPdWGc2yhz_zOpWTXmKLyDXDMGoxg79q_M1lXxyQxoppGD0L827NwxHqj2zBVxbORmef9WRdIKfaItyCDoTOg3Us1zs-fqXsafwdO6', '2023-05-03 13:18:10', '2023-05-04 15:43:48', 0, 0, 1, 0, 0, '2023-05-03 09:18:10', NULL, 3, 0, 0, 0, 1),
(159, 'slhilaj', 'slhilaj@gmail.com', '0564564492', 'A27', 1, NULL, NULL, '$2y$10$91yguO6/S7XBfawFjKLmSOtpg49wjVkepWj1ZGXcqI6jsaPt/Nhny', NULL, 'f92A_jGDf0knvKkGw469xG:APA91bHFHFcFhRYAJi2jvjUHzmSJ4WlUaf__WLDOr-LTHFJr-PP5xeOlfHJ3mTNga9-0nE2Hz23HWeVljmEEfHjHzoQdW8bff5dsmshyxVIsHHow2yhgD4ZSepUcji0_Ifb8vndYYwfr', '2023-05-03 17:05:56', '2023-05-03 17:06:20', 0, 0, 1, 0, 0, '2023-05-03 13:05:56', NULL, 4, 0, 0, 0, 0),
(160, 'jack', 'jack@gmail.com', '0400148012', '012', 29, NULL, NULL, '$2y$10$ZmObgexLrHhCUN7NQJL2q.SJUUA54duCmUwHVm5ogTNokCoUdTzFC', NULL, 'frZE_ZlkkUD4tK5PZCmRLw:APA91bGAXABMvYuuZIkwi3q1dzSOM42gPDEx4sw2pJ6l2Y4kpBSrbGUgI70-ncFEYYhYMoidLp3J03VZRDw3fCCQd5gPEvOeV1JzZEwn9MJy7e-uqxZdQq1UwUcu2VebsG2nMASUQLKH', '2023-05-04 15:29:14', '2023-05-04 15:29:52', 0, 0, 1, 0, 0, '2023-05-04 11:29:14', NULL, 3, 0, 0, 0, 0),
(161, 'sana', 'sana@gmail.com', '0989098789', 'kk', 1, NULL, NULL, '$2y$10$/laf18UnefED0cxNfqSDh.f36Trfa.IdAXtuE/9APDiw6B9PqfuaC', NULL, 'fbgiUSJqSfKivKOdBliMRR:APA91bEhY_ZPOTQReqyuajjqPhc7PnhN7baGwkqEusAkuj8UJVcEDOSEC8zcVSonaqWlOIFYTwDfAcBGFv-LEt5_J-3R2mfoKM1krPZcxX2UezmuCnsN3K24LHMpeVXKtfUnGBhVvNW6', '2023-05-04 15:48:53', '2023-05-04 15:53:17', 0, 0, 1, 0, 0, '2023-05-04 11:48:53', NULL, 3, 0, 0, 0, 0),
(162, 'talal', 'talal@gmail.com', '0121021232', 'Vs', 1, NULL, NULL, '$2y$10$mW.wWNMJ6aH1YWZIGA6K3u7dAxi6j2W21jgRRuIWDvDmoiyCi3oZC', NULL, 'fbgiUSJqSfKivKOdBliMRR:APA91bEhY_ZPOTQReqyuajjqPhc7PnhN7baGwkqEusAkuj8UJVcEDOSEC8zcVSonaqWlOIFYTwDfAcBGFv-LEt5_J-3R2mfoKM1krPZcxX2UezmuCnsN3K24LHMpeVXKtfUnGBhVvNW6', '2023-05-04 16:00:38', '2023-05-07 10:05:45', 0, 0, 1, 0, 0, '2023-05-04 12:00:38', NULL, 4, 0, 0, 0, 0),
(163, 'waseem', 'waseem1@gmail.com', '523255555', 'gxgx', 1, NULL, NULL, '$2y$10$1sj.yUY9V5PnbEWqgyYkV.BZVl2AOZ.dKvBLv7EEC9Q5K/yVwPLZ.', NULL, 'crn6YzA7Q46A2NOujVDQ6K:APA91bFqP0k00vaI5doj12mlWRE_eNQfouXQ6bDjh6Svt9iggn1epJEtOD2urTFEVR02TgiEoa8Wp0VJdbkIDhQVjsoUp-w9mUphu-OLnO1-HpuOrgvLQMUy6M4Bml7s5RTae4hZL_0F', '2023-05-07 09:56:41', '2023-05-07 11:11:58', 0, 0, 1, 0, 0, '2023-05-07 05:56:41', NULL, 3, 0, 0, 0, 0),
(164, 'umer', 'umer1@gmail.com', '527123456', 'bb', 1, NULL, NULL, '$2y$10$2JKTN1r2HvM0rhTrQlYM/.ZqScBUx1aMy2HipJJ7MH6Va6sKdYvPm', NULL, NULL, '2023-05-07 14:10:06', '2023-05-07 14:10:06', 0, 0, 1, 0, 0, '2023-05-07 10:10:06', NULL, 0, 0, 0, 0, 0);

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
(129, 'sQIatrXAYmChgM3TD1rSV0ILKeyhWqpv2Ju62gzLmd7AFH3jSN0LbfkhYHq7v32z', '2023-03-08 08:13:30', '2023-03-08 08:13:30'),
(130, 'AjNwPuip5P3eQOMaXAkDR5e8Ce7Y3U3lT5NvRCRDxyjSdzyFBlbVS5aLUOXlKzjD', '2023-03-15 05:51:46', '2023-03-15 05:51:46'),
(131, 'puZzbvaw3ydh4jzzU0hWtZkAUj1IogGJcuZ3SS2E1HcGhpwQiG9OOykv9IEYCjTN', '2023-03-19 07:37:23', '2023-03-19 07:37:23'),
(132, '9hE1l7EolbX9PI0Bu8psxHYlCKDBLtgdo9pCy6EKQPYaArIHtqZiZO74UQyLwGPa', '2023-03-19 07:45:12', '2023-03-19 07:45:12'),
(133, 'sqkFIU4Xhc9xiJuqPdpYhCXFhsrPayJcR4cyHM5CBc2Yml4Xb7kV4f7OHBbdRaOg', '2023-03-19 07:49:31', '2023-03-19 07:49:31'),
(134, 'yr7pYQ2j2QQHzE09nmg0HjR6iM0R8TS4dEQKjl1l6OEemBhnWftxYEyPSCUvp1Ld', '2023-03-19 08:05:30', '2023-03-19 08:05:30'),
(135, 'es9QXDYSyPQCXTA39lPN6F1RkUReK5sTLvsOKe6gERhGZ3ebzDKS4t0BFCZLcb8C', '2023-03-19 08:07:25', '2023-03-19 08:07:25'),
(136, 'dRqU6W0TyjsWAALrnvE1Xs6ubAU0XkG7GXSct9CvjcZIMxvOVCgacCsIzgD9nQIc', '2023-03-19 08:09:03', '2023-03-19 08:09:03'),
(137, 'QNe59iGJFLbB3mYFNukj2tM32jv3tnLxEISo2vln41Qj6KDZEkHVmsjOKouTZoGi', '2023-03-19 08:21:57', '2023-03-19 08:21:57'),
(138, 'hM3suSi2OSxsex995MJvumJGexlxLNPakaLFcgid3rVRlPCeDnO4vu4m7E1Uv2DC', '2023-03-19 08:25:04', '2023-03-19 08:25:04'),
(139, '5MWnaoUxJArRUU8WnItf4VhX1yQXdIQkdFMsUQONYfaYIhBTmlKeUoVX1vLoK0bU', '2023-03-22 04:40:27', '2023-03-22 04:40:27'),
(140, 'DxOt2gUW5OXh2pBpivuVQ32LWTRRlqhahYPEIY42639g7vPn4XG5EZ52FWF9I90v', '2023-03-22 05:35:32', '2023-03-22 05:35:32'),
(141, 'Eg2wb3WQeFRawyFSglZtq2k0z6Rvo1fSA8wlRsFwS2oF9IeeohD2LxI0A4hOxnGH', '2023-03-22 06:05:50', '2023-03-22 06:05:50'),
(142, '8uQMVqW5882vbTJTDxEkXlEFVgSiKRwD3BYtFEKHV1BAKkVHIYrWPq0QLo4MqebR', '2023-03-22 06:08:18', '2023-03-22 06:08:18'),
(143, 'ITcikK3lr94HjW88jy8Nugd1txjtOlPbRhfCiDhdO2yUZihVMgurdVHlQW5sjWmA', '2023-03-22 06:19:53', '2023-03-22 06:19:53'),
(144, 'ClqDuiIngYbfGswIfXmVhd0rN93OEjCJizgDJhmplbFrdInuSrpQEzVtD1qnWpAk', '2023-03-22 06:22:06', '2023-03-22 06:22:06'),
(145, 'vcO6PEf63UDIOIpRPvtTAAk6j8F8WBWbicXWHZF5wZx4o3N74YqKGjvjNgAAn1kI', '2023-03-22 06:24:13', '2023-03-22 06:24:13'),
(146, 'MWEyHpa4vnX0RAOWcU8vp69Yz1fgn5pYomlflgX7WpiJk1fdiShIZgxCjnLCSSHA', '2023-03-27 01:00:42', '2023-03-27 01:00:42'),
(147, 'gHEmoea1PLWlZc7WOWESY7OT6H8b9DkzM3xtdypniWrH9mXTYIBIUhnsatf1g9Re', '2023-03-27 03:46:33', '2023-03-27 03:46:33'),
(148, 'zieih1ifkFUrHWIBXTZ91lCxdz6HuOnVDuQPVL1dyC0iQ9WF7OROyBgb09f8oETq', '2023-03-27 03:53:28', '2023-03-27 03:53:28'),
(149, '2QvtL0Vwqdp9jtI9h3K65S9gUkNLsM3fF7Cvx0q751GYeWmvbEYOcS2JG5R4e6RM', '2023-03-28 02:44:42', '2023-03-28 02:44:42'),
(150, 'VprnGVhTJjlXlYtqit92c3XsOjqCngW9xjLVXyObBmyIpJWWSfHgmUSukp97KPLZ', '2023-03-28 03:22:35', '2023-03-28 03:22:35'),
(151, '2nDUFkjlU8a6GudR1A3cUZJmH4qM1v1L39ic8V3rgfIJhLLOPWklj87DlSLimrAX', '2023-03-29 06:12:47', '2023-03-29 06:12:47'),
(152, 'yCQ65zCrzBk5lzR1vmU3Kkl2hhdpd02ELLNJhZLseYnIwiLQaV7OSd7zAEGCPKRA', '2023-03-29 07:36:18', '2023-03-29 07:36:18'),
(153, 'Fkve21t8X10MriolnsuocR5EEEmtrrFBi1Y09rnpf9gKJratAmXbpjkYfGYzibou', '2023-03-30 06:06:36', '2023-03-30 06:06:36'),
(154, 'rYHcSUc8duUJTtscxz4SavvEEa2FhcOo9D0zP6hP8WZbyNlfYuEp7kiIdQr8Ituj', '2023-05-03 13:15:13', '2023-05-03 13:15:13'),
(155, 'PA3rvIkMF41e0wIEnXPBAWz9w6jsM977uvwVZ5yZGVkbPpolCHxu7gy9Cd42Jsd5', '2023-05-03 13:15:48', '2023-05-03 13:15:48'),
(156, 'f7kcwRG7q99g9iZTdCHzeDRgp0AQ5YacrNEyTDq4tWSDQux9rIMK9JADQ0wkLhdG', '2023-05-03 13:17:07', '2023-05-03 13:17:07'),
(157, 'MSlYNNPqOWeTwnqVTWXzdz36YglyhBh5pJjcsdH4HhH4Jerq8LeW6Uv8m4wowyfM', '2023-05-03 13:17:52', '2023-05-03 13:17:52'),
(158, 'JXgArGwqkB5oowdKPXAjFkGd8SfAcKhhTloAByGLTpwLCPVsWoT6cbOgOSVtR7e6', '2023-05-03 13:18:10', '2023-05-03 13:18:10'),
(159, 'sHHgpaBv7reGSbHyJXtQOGG3LFcepOdUmfGc6bt6efqcfZc7lEgupqjPD9QLTEAt', '2023-05-03 17:05:56', '2023-05-03 17:05:56'),
(160, 'hbOYev1XPpBePwD7gOSYFIwLrd4ylh0qydiR0BLWrG5KuAoqZRFc0Bf2O5FeAEfB', '2023-05-04 15:29:14', '2023-05-04 15:29:14'),
(161, 'PN7pm9qlCi9hsPvKTtdIxW3diWaX4Cnvdj0CApoghUC0I9ufXca2R5G7R9fd3NRa', '2023-05-04 15:48:53', '2023-05-04 15:48:53'),
(162, 'bApyJxMoE3yePAkHXRaKx7slA2Vfk4yfBar7cUjqAelxZugTm41tb5TjMJggzZnB', '2023-05-04 16:00:38', '2023-05-04 16:00:38'),
(163, 'LIUKnhYN9eVRWu7Y2cxWdFKjSVYwoqtCVwo9VPbKnrzIRwG9yHl8bl9T2EpZjzWX', '2023-05-07 09:56:41', '2023-05-07 09:56:41'),
(164, 'uX4R2lVqcrHgRYej60LTmLLk1zxr1YDoczfyZlpZK2atGlAHVyHBPnvotylbLnD2', '2023-05-07 14:10:06', '2023-05-07 14:10:06');

-- --------------------------------------------------------

--
-- Table structure for table `user_facility_bloking`
--

CREATE TABLE `user_facility_bloking` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_facility_log`
--

CREATE TABLE `user_facility_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_guest` int(11) NOT NULL DEFAULT 0,
  `guest_id` int(11) DEFAULT NULL,
  `facility_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
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
(1, 'al satwa', 'cHw-aCd1SlChPrrQE4ehaG:APA91bErMfIyoDZWoUo5Y20ZTSl0Bb5WXRrcMD1bmNpci8g6vZF7MAKd0VfozVCEqpQ9GM0UqOZk6AZxbeURoIgeYPpNKtIhNwtrcvnfPCIRRaMpYAgLAA-QBorvsxImAois9t9xiUTG', '2023-02-08 06:49:19', '2023-02-08 06:49:19'),
(2, 'kkkkk', 'cHw-aCd1SlChPrrQE4ehaG:APA91bErMfIyoDZWoUo5Y20ZTSl0Bb5WXRrcMD1bmNpci8g6vZF7MAKd0VfozVCEqpQ9GM0UqOZk6AZxbeURoIgeYPpNKtIhNwtrcvnfPCIRRaMpYAgLAA-QBorvsxImAois9t9xiUTG', '2023-02-08 06:52:11', '2023-02-08 06:52:11'),
(3, 'kkkkkkm', 'drzkfrhOQgeovKS6woQ4tW:APA91bGp1_Fi1PxRveqtToY-gdSuWEOHrB3wt4wlCGc6vJZqXoF6NYfTaZOnR-xLcKvzIHr-CwzEA4VnAtprHrt-BVO99CAiTgVx0L8sYlsTxM-7WCWbaRFKHhbBeTgV54oFQSCJ62fS', '2023-02-08 06:59:26', '2023-02-08 06:59:26'),
(4, 'kkkkkk', 'f9J88I5oQf2Ww0taxq4YUJ:APA91bGLlhO9RCtVofVouXm_P9pY6VQ2-aZLg9BhQR-GX6HuyfbHOSpfcjae-XFLdv4A4xi52CLdFAdxHl9qAq9gKVgbY2mRFvgeEnC8Y2yaMInuYCZHvosnVEwLL_mEWGC-xID_Zk_O', '2023-02-08 07:18:10', '2023-02-08 07:18:10'),
(5, 'kkkkkk', 'f9J88I5oQf2Ww0taxq4YUJ:APA91bGLlhO9RCtVofVouXm_P9pY6VQ2-aZLg9BhQR-GX6HuyfbHOSpfcjae-XFLdv4A4xi52CLdFAdxHl9qAq9gKVgbY2mRFvgeEnC8Y2yaMInuYCZHvosnVEwLL_mEWGC-xID_Zk_O', '2023-02-08 07:18:14', '2023-02-08 07:18:14'),
(6, 'kkjkhhjhh', 'cg7QZWvwQXqlxyK7XeYyJc:APA91bGcLzNHPeMpT8ILpiFEO317uilPMbg2mCz9tNmS4naSkjrWwTntSRpk7mpsy2O0vi0ESplv69LV4bKDTH4_rHkMBvENMPsO9RmgHNabKjtx6yFhTml12L60lRH_QVHlO-8wIldw', '2023-02-08 07:22:34', '2023-02-08 07:22:34'),
(7, 'fsddfsfsfhfjas', 'fsFjt5aAQgiPHkH-xDMFgn:APA91bEA-GqsmCdIH3CPkk9LgLwXTliIEqiUniPI0-uNep1wK0Z7ScSkQqeLOzPfk8dUeLG1BtyrcPZfmh7QgwwXP_z6jcrd924WBjTiaqp1W0YaN6E1Opi6pVBUQQG0U8i494Ze-TVJ', '2023-02-08 07:30:48', '2023-02-08 07:30:48'),
(8, 'kkkkkk', 'ejYkQS2vQ2C_Ss5EOLvYbQ:APA91bHT_suzMn3-i0WPVmYZuJE3mYQ_uLj_jYEihesGXy0GSZ0ZZn3-oURocctex1OIS2HIoqipWZ3dvxnw_ac0GdUCK3I_obxVXs3_-oZFli_hH5ld9fQPziQd7he_ZFe-p4d-2KTa', '2023-02-08 08:08:23', '2023-02-08 08:08:23'),
(9, 'hjggjhhghhghh', 'eB9vOL3cQT24oeoCJBt8fh:APA91bE_g2_0SV-2VgoPcKD3PioNH_HFO8qg8qgxVHJjRzkillp2OZf0dH9WOJ3Jbt4fFnh1UxUwNm3W57BAHZjSOBSTCpll_Pnz31Ot6p2MJJMV7_UL8gNCESRFaShpeAX8HX-kbQHb', '2023-02-08 08:12:29', '2023-02-08 08:12:29'),
(10, 'kkkkkk', 'dmnpKvjITp2j410DN8unOz:APA91bH8DHMu74JYGmMU_21babG_xYjj22w1DD0224e190XADpZ414TC0KvnnBH8R8LLAYeRN6L18WUQ4QZxgYnbwgyddw6N082pc2yEwmdF4RaQGBB_dyiYzB5lcjLry8OzY4Ff2Ls3', '2023-02-08 08:14:24', '2023-02-08 08:14:24'),
(11, 'kkkkkkk', 'ftQqAE6ARDaXA2o8XjU6tp:APA91bGscGWG33wPK1aCRhpI9Kh4hltbwv5bBlCJbZFEXJTZlreUdGm3OUF7w1POx8wE7-AGO5ZvwDf2tPEwYn1RS1HpjfcU89zrxZtzdxTdQLXaNwp_K_cepKpZgAI70V57UXlFVQz3', '2023-02-08 08:19:55', '2023-02-08 08:19:55'),
(12, 'jhjxvjcgxcgxvx', 'cnOEf88kSwyTOqFHqzdQxf:APA91bEabC1e9QaU-msERKyuohYV4a3aCLO2Um3-QbpCTVVHbv52utJ083InX-FeHvBEZhbITGFq5VIsx-Ud3sZtFJ05GndLZ0oH4UlH94ul675-Da5NYbQBG71ttHZPRdWlifDN8_bj', '2023-02-08 08:22:05', '2023-02-08 08:22:05'),
(13, 'llllll', 'ebo8LT0oSDOjFeW0_5f_Gu:APA91bGjbfKDJ6SE6hVwVhVgiaQhl7pLuMgIE6LXc72sUhGfURwIp0RUw7x63IIy14H9nJOGz4fLccPvYNVJh-y7uNieMJ9mc4VOovzhXeCvAWHpx_1WFfmHlYirqQbWVi-7LrRSfh3a', '2023-02-08 08:38:01', '2023-02-08 08:38:01'),
(14, 'fghhhu', 'fDTrTvlITB-o0kSDFeRIzd:APA91bHGFbKw3OdG_AZ1uzMa6Y441tFPk2fWpltFdx8HDYeLoublOHYqb4Blc8va4Z4f-wWFx5GOzgxB7x6sTfDa9z36NwsNuSBcLIAsQjfNJHFRTizRk-l_e4yDxxk5w2GlqldUtKVb', '2023-02-09 11:21:30', '2023-02-09 11:21:30'),
(15, 'dmfhsdjfjsfjfdfjs', 'duFs9ssUSlimYhnOtEW3CO:APA91bFqj_VtGWwVN3u50FLIN2NWHRJc57FmRHW_m_saX8XTHbJ9xvPnMip_-2E312Qa6z6rXma3vEWNvIp0JylRbApXMjkR-I5otRellY7R2EevzEh7m-QC9SfuBJMa-697X-Oj2Whx', '2023-02-09 11:35:51', '2023-02-09 11:35:51');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_history`
--

CREATE TABLE `wallet_history` (
  `id` int(11) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `amount` float NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD UNIQUE KEY `buildingname` (`name`),
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
-- Indexes for table `e_wallet_history`
--
ALTER TABLE `e_wallet_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facility_services`
--
ALTER TABLE `facility_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `device_key` (`device_key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `frequency`
--
ALTER TABLE `frequency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_car`
--
ALTER TABLE `order_car`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`phone`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_plan`
--
ALTER TABLE `service_plan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test` (`plan_id`),
  ADD KEY `test32` (`services_id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
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
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories_plan`
--
ALTER TABLE `subcategories_plan`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `user_facility_bloking`
--
ALTER TABLE `user_facility_bloking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_facility_log`
--
ALTER TABLE `user_facility_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_address`
--
ALTER TABLE `visitor_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_history`
--
ALTER TABLE `wallet_history`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `building_services`
--
ALTER TABLE `building_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `e_wallet_history`
--
ALTER TABLE `e_wallet_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `facility`
--
ALTER TABLE `facility`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=371;

--
-- AUTO_INCREMENT for table `facility_services`
--
ALTER TABLE `facility_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frequency`
--
ALTER TABLE `frequency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_car`
--
ALTER TABLE `order_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `service_plan`
--
ALTER TABLE `service_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subcategories_plan`
--
ALTER TABLE `subcategories_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `user_facility_bloking`
--
ALTER TABLE `user_facility_bloking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_facility_log`
--
ALTER TABLE `user_facility_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_address`
--
ALTER TABLE `visitor_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `wallet_history`
--
ALTER TABLE `wallet_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `service_plan`
--
ALTER TABLE `service_plan`
  ADD CONSTRAINT `test` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `test32` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
