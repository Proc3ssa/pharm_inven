-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 10, 2021 at 02:22 AM
-- Server version: 10.3.31-MariaDB-log-cll-lve
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adomhzbe_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `position` int(11) NOT NULL,
  `status` tinyint(5) NOT NULL DEFAULT 1,
  `androidToken` varchar(1000) DEFAULT NULL,
  `webToken` varchar(1000) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `image`, `position`, `status`, `androidToken`, `webToken`, `timestamp`) VALUES
(219, 'Admin', 'admin@gmail.com', '$2y$10$WDKfPgNYKO/XfGJjD8Zry.O6JtxrJwHrpAulwDHiQVYp.sCn7ymAK', '', 1, 1, NULL, NULL, '2021-11-10 07:17:49');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `created_at`) VALUES
(6, 'Earnest chemist', '2021-07-19 22:40:47'),
(7, 'DANNY CHEMIST', '2021-07-19 22:44:21'),
(8, 'tOBINCO PHARMACEUTICALS', '2021-08-30 23:25:29');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `created_at`) VALUES
(6, 'Capsules', '2021-07-19 22:41:02'),
(7, 'TABLET', '2021-07-19 22:44:28'),
(8, 'tonic', '2021-08-30 23:25:39');

-- --------------------------------------------------------

--
-- Table structure for table `creditors`
--

CREATE TABLE `creditors` (
  `creditorId` int(11) NOT NULL,
  `creditorName` varchar(50) NOT NULL,
  `creditorMobile` varchar(15) NOT NULL,
  `creditorAddress` varchar(700) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `creditors`
--

INSERT INTO `creditors` (`creditorId`, `creditorName`, `creditorMobile`, `creditorAddress`, `timestamp`) VALUES
(4, 'Afabuy Ghana', '0545744420', 'p.o.box ay 426', '2021-07-19 22:48:26');

-- --------------------------------------------------------

--
-- Table structure for table `creditpayments`
--

CREATE TABLE `creditpayments` (
  `paymentId` int(11) NOT NULL,
  `paymentMode` varchar(100) NOT NULL,
  `paymentDate` datetime NOT NULL,
  `paymentAmount` int(100) NOT NULL,
  `paymentReciever` int(200) NOT NULL,
  `creditId` int(100) NOT NULL,
  `creditorId` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `credits`
--

CREATE TABLE `credits` (
  `creditId` int(11) NOT NULL,
  `creditorId` int(44) NOT NULL,
  `salesId` varchar(500) NOT NULL,
  `creditDescription` varchar(1000) NOT NULL,
  `creditTime` datetime NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `credits`
--

INSERT INTO `credits` (`creditId`, `creditorId`, `salesId`, `creditDescription`, `creditTime`, `timestamp`) VALUES
(5, 4, '[\"137\"]', '', '2021-07-20 04:18:26', '2021-07-19 22:48:26');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `invoice_number` varchar(100) NOT NULL,
  `seller_id` int(100) NOT NULL,
  `invoice_date` date NOT NULL,
  `invoice_url` varchar(600) NOT NULL DEFAULT '',
  `total_amount` int(100) NOT NULL DEFAULT 0,
  `paid_amount` int(100) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `invoice_number`, `seller_id`, `invoice_date`, `invoice_url`, `total_amount`, `paid_amount`, `created_at`) VALUES
(10, 'STM10001', 5, '2021-07-20', 'uploads/invoices/STM1000140220589856.pdf', 0, 0, '2021-07-19 22:52:30');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `itemId` int(11) NOT NULL,
  `itemName` varchar(60) NOT NULL,
  `itemDescription` varchar(1000) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`itemId`, `itemName`, `itemDescription`, `created_at`, `updated_at`) VALUES
(9, 'Jerefan 2', 'For Coughs in adults and Children', '2021-07-19 18:40:14', '2021-07-19 22:40:14'),
(10, 'PRO COLD', 'FOR COLD TREATMENT', '2021-07-19 18:44:10', '2021-07-19 22:44:10'),
(11, 'BLOOD TONIC', '', '2021-08-30 19:25:06', '2021-08-30 23:25:06');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `location_name`, `created_at`) VALUES
(6, 'ASAFO', '2021-07-19 22:41:29'),
(7, 'ATONSU', '2021-07-19 22:44:42'),
(8, 'abuakwa', '2021-08-30 23:26:02');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `payment_date` datetime NOT NULL,
  `payment_amount` int(100) NOT NULL,
  `payment_receiver` int(200) NOT NULL,
  `invoice_number` varchar(200) NOT NULL,
  `seller_id` int(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(200) NOT NULL,
  `item_id` int(200) NOT NULL,
  `size_id` int(200) NOT NULL,
  `brand_id` int(200) NOT NULL,
  `product_price` int(200) NOT NULL,
  `product_quantity` int(200) NOT NULL,
  `location_id` int(200) NOT NULL,
  `product_manufacture` date NOT NULL,
  `product_expire` date NOT NULL,
  `barCode` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `item_id`, `size_id`, `brand_id`, `product_price`, `product_quantity`, `location_id`, `product_manufacture`, `product_expire`, `barCode`, `created_at`) VALUES
(9, 6, 9, 8, 7, 10, 293, 6, '2020-04-01', '2023-04-01', '', '2021-07-19 23:27:47'),
(10, 6, 10, 8, 7, 23, 49, 7, '2020-03-01', '2021-08-01', '', '2021-07-24 09:44:12'),
(11, 6, 10, 7, 6, 20, 100, 6, '2020-02-01', '2024-04-01', '', '2021-07-21 15:35:20'),
(12, 6, 9, 8, 7, 10, 10, 6, '2020-04-01', '2023-04-01', '', '2021-07-21 15:55:50'),
(13, 8, 11, 9, 8, 30, 400, 8, '2020-02-01', '2022-02-01', '', '2021-08-30 23:33:50');

-- --------------------------------------------------------

--
-- Table structure for table `products_record`
--

CREATE TABLE `products_record` (
  `product_id` int(11) NOT NULL,
  `category_id` int(200) NOT NULL,
  `item_id` int(200) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `size_id` int(200) NOT NULL,
  `brand_id` int(200) NOT NULL,
  `product_price` int(200) NOT NULL,
  `product_quantity` int(200) NOT NULL,
  `location_id` int(200) NOT NULL,
  `product_manufacture` date NOT NULL,
  `product_expire` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_record`
--

INSERT INTO `products_record` (`product_id`, `category_id`, `item_id`, `product_name`, `size_id`, `brand_id`, `product_price`, `product_quantity`, `location_id`, `product_manufacture`, `product_expire`, `created_at`) VALUES
(9, 6, 9, '', 7, 6, 10, 50, 6, '2020-04-01', '2023-04-01', '2021-07-19 22:42:37'),
(10, 7, 10, '', 8, 7, 23, 20, 7, '2020-03-01', '2021-08-01', '2021-07-19 22:46:13'),
(11, 6, 10, '', 7, 6, 20, 100, 6, '2020-02-01', '2024-04-01', '2021-07-21 15:35:20'),
(12, 6, 9, '', 8, 7, 10, 10, 6, '2020-04-01', '2023-04-01', '2021-07-21 15:55:50'),
(13, 8, 11, '', 9, 8, 30, 400, 8, '2020-02-01', '2022-02-01', '2021-08-30 23:33:50');

-- --------------------------------------------------------

--
-- Table structure for table `quantities`
--

CREATE TABLE `quantities` (
  `quantity_id` int(11) NOT NULL,
  `quantity` int(200) NOT NULL,
  `product_id` int(200) NOT NULL,
  `size_id` int(200) NOT NULL,
  `brand_id` int(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `sellerId` int(11) NOT NULL,
  `sellerName` varchar(50) NOT NULL,
  `sellerEmail` varchar(50) NOT NULL,
  `sellerContact` varchar(12) NOT NULL,
  `sellerContact1` varchar(12) NOT NULL,
  `sellerImage` varchar(100) NOT NULL,
  `sellerAddress` varchar(1000) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`sellerId`, `sellerName`, `sellerEmail`, `sellerContact`, `sellerContact1`, `sellerImage`, `sellerAddress`, `createdAt`) VALUES
(5, 'Aziah Daniel', 'aziahdaniel42@gmail.com', '0545744420', '0545744420', '', 'p.o.box ay 426\r\nasuoyeboah-kumasi', '2021-07-19 22:50:39');

-- --------------------------------------------------------

--
-- Table structure for table `sellers_sells`
--

CREATE TABLE `sellers_sells` (
  `sellers_sell_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `invoice_number` varchar(100) NOT NULL,
  `product_id` int(200) NOT NULL,
  `sell_quantity` int(200) NOT NULL,
  `sell_discount` float NOT NULL DEFAULT 0,
  `sell_price` int(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sellers_sells`
--

INSERT INTO `sellers_sells` (`sellers_sell_id`, `seller_id`, `invoice_number`, `product_id`, `sell_quantity`, `sell_discount`, `sell_price`, `created_at`, `updated_at`) VALUES
(31, 5, 'STM10001', 9, 20, 0, 200, '2021-07-19 22:51:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sells`
--

CREATE TABLE `sells` (
  `sell_id` int(11) NOT NULL,
  `product_id` int(200) NOT NULL,
  `sell_quantity` int(200) NOT NULL,
  `sell_discount` int(200) NOT NULL DEFAULT 0,
  `sell_price` int(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sells`
--

INSERT INTO `sells` (`sell_id`, `product_id`, `sell_quantity`, `sell_discount`, `sell_price`, `created_at`, `updated_at`) VALUES
(134, 9, 1, 0, 10, '2021-07-19 22:43:18', NULL),
(135, 10, 1, 0, 23, '2021-07-19 22:46:37', NULL),
(136, 9, 1, 0, 10, '2021-07-19 22:46:44', NULL),
(137, 10, 15, 0, 345, '2021-07-19 22:47:50', NULL),
(138, 9, 1, 0, 10, '2021-07-19 23:01:42', NULL),
(139, 10, 1, 0, 23, '2021-07-19 23:01:49', NULL),
(140, 9, 1, 0, 10, '2021-07-20 09:38:35', NULL),
(141, 10, 1, 0, 23, '2021-07-20 09:38:42', NULL),
(143, 9, 10, 0, 100, '2021-07-21 15:38:20', NULL),
(144, 10, 1, 0, 23, '2021-07-21 15:39:11', NULL),
(145, 9, 1, 0, 10, '2021-07-22 21:47:30', NULL),
(146, 11, 1, 0, 20, '2021-07-22 21:47:36', NULL),
(147, 12, 1, 0, 10, '2021-07-22 21:47:41', NULL),
(148, 11, 5, 0, 100, '2021-07-22 21:48:54', NULL),
(149, 9, 10, 0, 100, '2021-07-22 21:49:27', NULL),
(150, 9, 1, 5, 10, '2021-07-24 14:55:46', NULL),
(151, 9, 1, 0, 10, '2021-07-27 15:48:46', NULL),
(152, 9, 1, 0, 10, '2021-08-04 15:36:38', NULL),
(153, 11, 1, 0, 20, '2021-08-04 15:36:44', NULL),
(154, 9, 1, 0, 10, '2021-08-12 16:09:17', NULL),
(155, 10, 1, 0, 23, '2021-08-12 16:09:25', NULL),
(156, 9, 1, 0, 10, '2021-08-29 01:26:36', NULL),
(157, 9, 1, 0, 10, '2021-08-29 01:26:45', NULL),
(158, 12, 1, 0, 10, '2021-08-29 01:27:54', NULL),
(159, 9, 1, 0, 10, '2021-09-01 14:10:03', NULL),
(160, 12, 1, 0, 10, '2021-09-01 14:10:11', NULL),
(161, 9, 1, 0, 10, '2021-09-02 09:24:28', NULL),
(162, 10, 1, 0, 23, '2021-09-02 09:24:38', NULL),
(163, 12, 5, 0, 50, '2021-09-02 09:27:46', NULL),
(164, 9, 1, 0, 10, '2021-11-10 07:05:20', NULL),
(165, 10, 1, 0, 23, '2021-11-10 07:05:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settingId` int(11) NOT NULL,
  `productNoticeCount` int(55) NOT NULL DEFAULT 8
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settingId`, `productNoticeCount`) VALUES
(1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `size_id` int(11) NOT NULL,
  `size_name` varchar(200) NOT NULL,
  `size_type` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`size_id`, `size_name`, `size_type`, `created_at`) VALUES
(7, '2grAM', 0, '2021-07-19 22:41:38'),
(8, '14GRM', 0, '2021-07-19 22:44:36'),
(9, '200ml', 0, '2021-08-30 23:25:55');

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `updateId` int(11) NOT NULL,
  `updateTitle` varchar(200) NOT NULL,
  `updateDescription` varchar(2000) NOT NULL,
  `updateVersion` float NOT NULL,
  `updateUrl` varchar(200) NOT NULL,
  `updateTimestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`updateId`, `updateTitle`, `updateDescription`, `updateVersion`, `updateUrl`, `updateTimestamp`) VALUES
(1, 'Updated Released 1.3', 'Fixed Bugs', 1.3, 'https://www.youtube.com/channel/UCPCmuZrfxit5HyLFU6f6_nw/', '2021-07-18 20:09:45'),
(2, 'Updated Released 1.4', 'Fixed Bugs, And Improved User Interface', 1.4, 'https://www.youtube.com/channel/UCPCmuZrfxit5HyLFU6f6_nw/', '2021-07-18 20:09:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `creditors`
--
ALTER TABLE `creditors`
  ADD PRIMARY KEY (`creditorId`);

--
-- Indexes for table `creditpayments`
--
ALTER TABLE `creditpayments`
  ADD PRIMARY KEY (`paymentId`);

--
-- Indexes for table `credits`
--
ALTER TABLE `credits`
  ADD PRIMARY KEY (`creditId`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`itemId`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `products_record`
--
ALTER TABLE `products_record`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `quantities`
--
ALTER TABLE `quantities`
  ADD PRIMARY KEY (`quantity_id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`sellerId`);

--
-- Indexes for table `sellers_sells`
--
ALTER TABLE `sellers_sells`
  ADD PRIMARY KEY (`sellers_sell_id`);

--
-- Indexes for table `sells`
--
ALTER TABLE `sells`
  ADD PRIMARY KEY (`sell_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settingId`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`size_id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`updateId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `creditors`
--
ALTER TABLE `creditors`
  MODIFY `creditorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `creditpayments`
--
ALTER TABLE `creditpayments`
  MODIFY `paymentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `credits`
--
ALTER TABLE `credits`
  MODIFY `creditId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products_record`
--
ALTER TABLE `products_record`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `quantities`
--
ALTER TABLE `quantities`
  MODIFY `quantity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `sellerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sellers_sells`
--
ALTER TABLE `sellers_sells`
  MODIFY `sellers_sell_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `sells`
--
ALTER TABLE `sells`
  MODIFY `sell_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `updateId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
