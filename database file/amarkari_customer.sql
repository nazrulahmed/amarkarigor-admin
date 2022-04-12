-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 07, 2022 at 01:44 AM
-- Server version: 10.3.34-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amarkari_customer`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `area` varchar(50) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `attribute` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`id`, `area`, `postcode`, `country_id`, `city_id`, `attribute`, `status`, `created`) VALUES
(1, 'Ambarkhana', '3100', 2, 1, NULL, 1, '2021-12-09 07:27:14'),
(2, 'Zindabazar', '3100', 2, 1, NULL, 1, '2021-12-10 04:39:47');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `img` varchar(150) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT 'visible=1, hidden=0',
  `attribute` varchar(150) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `img`, `status`, `attribute`, `created`) VALUES
(1, 'img1.png', 1, NULL, '2021-12-06 07:54:16'),
(2, 'img1.png', 1, NULL, '2021-12-06 07:54:16');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(50) DEFAULT 'default_category_icon.png',
  `status` int(11) NOT NULL DEFAULT 1,
  `attribute` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `icon`, `status`, `attribute`, `created`) VALUES
(2, 'Cleaning', 'home.png', 1, '{}', '2021-12-09 06:35:42'),
(3, 'Electric', 'home.png', 1, NULL, '2021-12-09 06:35:42'),
(4, 'Test', 'home.png', 1, NULL, '2021-12-09 06:35:42');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `country_id` int(11) NOT NULL,
  `attribute` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `country_id`, `attribute`, `status`, `created`) VALUES
(1, 'Sylhet', 2, NULL, 1, '2021-12-10 04:26:11'),
(2, 'Dhaka', 2, NULL, 1, '2022-03-04 13:24:07');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `attribute` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `attribute`, `status`, `created`) VALUES
(2, 'Bangladesh', NULL, 1, '2021-12-09 07:24:19'),
(3, 'India', NULL, 1, '2022-03-04 13:26:13');

-- --------------------------------------------------------

--
-- Table structure for table `guest_booking_info`
--

CREATE TABLE `guest_booking_info` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `consumer_name` varchar(50) NOT NULL,
  `consumer_address` varchar(150) NOT NULL,
  `consumer_phone` varchar(50) NOT NULL,
  `consumer_email` varchar(150) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guest_booking_info`
--

INSERT INTO `guest_booking_info` (`id`, `booking_id`, `consumer_name`, `consumer_address`, `consumer_phone`, `consumer_email`, `created`) VALUES
(1, 98, 'abc', '', '333', '', '2022-03-26 15:24:41'),
(2, 60, 'abc', '', '333', '', '2022-03-26 15:24:42'),
(3, 61, 'test', '', '123', 'abc@abc.com', '2022-03-26 16:52:05'),
(4, 62, '', 'abc', '333', '', '2022-03-26 16:55:36'),
(5, 100, 'c1', '', 'c3', 'c4', '2022-03-26 17:30:17'),
(6, 107, '', '', '', '', '2022-04-06 09:47:33');

-- --------------------------------------------------------

--
-- Table structure for table `provider_info`
--

CREATE TABLE `provider_info` (
  `id` int(11) NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL,
  `whatsapp` text NOT NULL,
  `address` text NOT NULL,
  `logo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provider_info`
--

INSERT INTO `provider_info` (`id`, `phone`, `email`, `whatsapp`, `address`, `logo`) VALUES
(1, '+8801745267119', 'info@amarkarigor.com', '+8801745267119', 'test address', '');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `start_price` double NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `attribute` varchar(255) DEFAULT NULL,
  `option` text DEFAULT NULL,
  `cat_id` int(11) NOT NULL DEFAULT 0,
  `sub_cat_id` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(50) NOT NULL DEFAULT 'default_service_icon.png',
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `name`, `start_price`, `description`, `status`, `attribute`, `option`, `cat_id`, `sub_cat_id`, `icon`, `created`) VALUES
(1, 'clean s1', 44, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, NULL, '[{\r\n		\"label\": \"Apartment size\",\r\n		\"field_type\": \"slider\",\r\n		\"value\": \"1,2,3,4,5,6\",\r\n		\"extra_cost_per_unit\": 10,\r\n		\"extra_cost_applicable_from\": 2\r\n	},\r\n	{\r\n		\"label\": \"Wash type\",\r\n		\"field_type\": \"radio\",\r\n		\"value\": \"Dry,Normal\",\r\n		\"extra_cost_per_unit\": 10,\r\n		\"extra_cost_applicable_from\": 1\r\n	}, {\r\n		\"label\": \"Dropdown test\",\r\n		\"field_type\": \"dropdown\",\r\n		\"value\": \"Dry,Normal\",\r\n		\"extra_cost_per_unit\": 10,\r\n		\"extra_cost_applicable_from\": 1\r\n	}, {\r\n		\"label\": \"Text test\",\r\n		\"field_type\": \"text\",\r\n		\"value\": \"Hint text\",\r\n		\"extra_cost_per_unit\": 10,\r\n		\"extra_cost_applicable_from\": 1\r\n	}\r\n]\r\n', 2, 1, 'default_service_icon.png', '2021-12-17 13:05:56'),
(2, 'clean s2', 44, 'clean', 1, NULL, NULL, 2, 2, 'default_service_icon.png', '2021-12-17 13:05:56'),
(3, 'clean s3', 44, 'clean', 1, NULL, NULL, 2, 2, 'default_service_icon.png', '2021-12-17 13:05:56'),
(4, 'electric', 44, 'electric', 1, NULL, NULL, 3, 3, 'default_service_icon.png', '2021-12-17 13:05:56'),
(5, 'electric', 44, 'electric', 1, NULL, NULL, 3, 3, 'default_service_icon.png', '2021-12-17 13:05:56'),
(6, 'electric - all', 44, 'electric', 1, NULL, NULL, 3, 0, 'default_service_icon.png', '2021-12-17 13:05:56');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `attribute` varchar(255) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`id`, `name`, `status`, `attribute`, `cat_id`, `created`) VALUES
(1, 'test sub category', 1, '', 2, '2021-12-18 19:44:11'),
(2, 'test sub category 2 ', 1, '', 2, '2021-12-18 19:44:11'),
(3, 'test sub category 3', 1, '', 3, '2021-12-18 19:44:11');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `phone`, `password`, `status`, `created`) VALUES
(25, '+8801745267119', '7d8f98220ec5f4ba662c2e13c546bbe6', 1, '2022-01-22 13:51:28'),
(26, '+88033333', '1a100d2c0dab19c4430e7d73762b3423', 1, '2021-11-25 06:49:03'),
(27, '+8801636273565', '258ed87b7e47645b8227de6862bc7bc4', 1, '2021-12-11 17:27:04'),
(28, '01711222333', '7d8f98220ec5f4ba662c2e13c546bbe6', 1, '2021-12-29 15:16:53'),
(29, '123456', '7d8f98220ec5f4ba662c2e13c546bbe6', 1, '2022-01-10 16:16:05'),
(30, '223322', '7d8f98220ec5f4ba662c2e13c546bbe6', 1, '2022-01-29 13:04:11'),
(31, '2233223', '7d8f98220ec5f4ba662c2e13c546bbe6', 1, '2022-01-29 13:04:31');

-- --------------------------------------------------------

--
-- Table structure for table `user_booking`
--

CREATE TABLE `user_booking` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `options` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_to_pay` double NOT NULL,
  `booking_type` int(11) NOT NULL DEFAULT 0 COMMENT 'self = 1; other = 2',
  `payment_method` int(11) NOT NULL DEFAULT 0 COMMENT 'not-def = 0, cash = 1, online = 2',
  `attribute` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT 'incomplete = 1; orderplaced = 2;accepted = 3; cancelled = 4',
  `date_time` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_booking`
--

INSERT INTO `user_booking` (`id`, `uid`, `options`, `created`, `total_to_pay`, `booking_type`, `payment_method`, `attribute`, `status`, `date_time`) VALUES
(107, 25, '{\"service_id\":1,\"service_name\":\"clean s1\",\"service_icon\":\"default_service_icon.png\",\"selected_attributes\":\"{\\\"Apartment size\\\":1,\\\"Wash type\\\":\\\"Dry\\\",\\\"Dropdown test\\\":\\\"Dry\\\",\\\"Text test\\\":\\\"\\\"}\",\"total_price\":44.0,\"booking_date\":\"6-4-2022\",\"booking_time\":\"04:00 PM\"}', '2022-04-06 09:47:33', 0, 2, 0, '', 1, ''),
(108, 25, '{\"service_id\":1,\"service_name\":\"clean s1\",\"service_icon\":\"default_service_icon.png\",\"selected_attributes\":\"{\\\"Apartment size\\\":2,\\\"Wash type\\\":\\\"Dry\\\",\\\"Dropdown test\\\":\\\"Dry\\\",\\\"Text test\\\":\\\"\\\"}\",\"total_price\":54.0,\"booking_date\":\"6-4-2022\",\"booking_time\":\"05:30 PM\"}', '2022-04-06 10:08:56', 0, 1, 0, '', 1, ''),
(109, 25, '{\"service_id\":1,\"service_name\":\"clean s1\",\"service_icon\":\"default_service_icon.png\",\"selected_attributes\":\"{\\\"Apartment size\\\":2,\\\"Wash type\\\":\\\"Dry\\\",\\\"Dropdown test\\\":\\\"Dry\\\",\\\"Text test\\\":\\\"\\\"}\",\"total_price\":54.0,\"booking_date\":\"6-4-2022\",\"booking_time\":\"05:30 PM\"}', '2022-04-06 10:12:32', 0, 1, 0, '', 1, ''),
(110, 25, '{\"service_id\":1,\"service_name\":\"clean s1\",\"service_icon\":\"default_service_icon.png\",\"selected_attributes\":\"{\\\"Apartment size\\\":1,\\\"Wash type\\\":\\\"Dry\\\",\\\"Dropdown test\\\":\\\"Dry\\\",\\\"Text test\\\":\\\"\\\"}\",\"total_price\":44.0,\"booking_date\":\"6-4-2022\",\"booking_time\":\"05:00 PM\"}', '2022-04-06 10:17:05', 0, 1, 0, '', 1, ''),
(111, 25, '{\"service_id\":1,\"service_name\":\"clean s1\",\"service_icon\":\"default_service_icon.png\",\"selected_attributes\":\"{\\\"Apartment size\\\":2,\\\"Wash type\\\":\\\"Dry\\\",\\\"Dropdown test\\\":\\\"Dry\\\",\\\"Text test\\\":\\\"\\\"}\",\"total_price\":54.0,\"booking_date\":\"6-4-2022\",\"booking_time\":\"05:30 PM\"}', '2022-04-06 10:21:53', 0, 1, 0, '', 1, ''),
(112, 25, '{\"service_id\":1,\"service_name\":\"clean s1\",\"service_icon\":\"default_service_icon.png\",\"selected_attributes\":\"{\\\"Apartment size\\\":1,\\\"Wash type\\\":\\\"Dry\\\",\\\"Dropdown test\\\":\\\"Dry\\\",\\\"Text test\\\":\\\"\\\"}\",\"total_price\":44.0,\"booking_date\":\"6-4-2022\",\"booking_time\":\"05:30 PM\"}', '2022-04-06 10:25:35', 44, 1, 1, '', 2, ''),
(113, 25, '{\"service_id\":1,\"service_name\":\"clean s1\",\"service_icon\":\"default_service_icon.png\",\"selected_attributes\":\"{\\\"Apartment size\\\":3,\\\"Wash type\\\":\\\"Dry\\\",\\\"Dropdown test\\\":\\\"Dry\\\",\\\"Text test\\\":\\\"\\\"}\",\"total_price\":64.0,\"booking_date\":\"6-4-2022\",\"booking_time\":\"05:00 PM\"}', '2022-04-06 10:28:42', 64, 1, 0, '', 1, ''),
(114, 25, '{\"service_id\":1,\"service_name\":\"clean s1\",\"service_icon\":\"default_service_icon.png\",\"selected_attributes\":\"{\\\"Apartment size\\\":1,\\\"Wash type\\\":\\\"Dry\\\",\\\"Dropdown test\\\":\\\"Dry\\\",\\\"Text test\\\":\\\"\\\"}\",\"total_price\":44.0,\"booking_date\":\"6-4-2022\",\"booking_time\":\"06:00 PM\"}', '2022-04-06 10:34:43', 44, 1, 0, '', 1, ''),
(115, 25, '{\"service_id\":1,\"service_name\":\"clean s1\",\"service_icon\":\"default_service_icon.png\",\"selected_attributes\":\"{\\\"Apartment size\\\":1,\\\"Wash type\\\":\\\"Dry\\\",\\\"Dropdown test\\\":\\\"Dry\\\",\\\"Text test\\\":\\\"\\\"}\",\"total_price\":44.0,\"booking_date\":\"6-4-2022\",\"booking_time\":\"06:30 PM\"}', '2022-04-06 11:12:19', 44, 1, 0, '', 1, ''),
(116, 25, '{\"service_id\":1,\"service_name\":\"clean s1\",\"service_icon\":\"default_service_icon.png\",\"selected_attributes\":\"{\\\"Apartment size\\\":1,\\\"Wash type\\\":\\\"Dry\\\",\\\"Dropdown test\\\":\\\"Dry\\\",\\\"Text test\\\":\\\"\\\"}\",\"total_price\":44.0,\"booking_date\":\"6-4-2022\",\"booking_time\":\"06:00 PM\"}', '2022-04-06 11:16:32', 44, 1, 0, '', 1, ''),
(117, 25, '{\"service_id\":1,\"service_name\":\"clean s1\",\"service_icon\":\"default_service_icon.png\",\"selected_attributes\":\"{\\\"Apartment size\\\":1,\\\"Wash type\\\":\\\"Dry\\\",\\\"Dropdown test\\\":\\\"Dry\\\",\\\"Text test\\\":\\\"\\\"}\",\"total_price\":44.0,\"booking_date\":\"6-4-2022\",\"booking_time\":\"07:00 PM\"}', '2022-04-06 11:41:24', 44, 1, 0, '', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`id`, `uid`, `first_name`, `last_name`, `address`, `email`, `modified`) VALUES
(1, 25, 'Nazrul Ahmed', '', '25/3 Fazilchist, Subidbazar, Sylhet', 'nazrulahmed.se@gmail.com', '2022-01-29 13:12:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guest_booking_info`
--
ALTER TABLE `guest_booking_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_info`
--
ALTER TABLE `provider_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_booking`
--
ALTER TABLE `user_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `guest_booking_info`
--
ALTER TABLE `guest_booking_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `provider_info`
--
ALTER TABLE `provider_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `user_booking`
--
ALTER TABLE `user_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
