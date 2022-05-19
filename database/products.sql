-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2022 at 10:08 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_flutter`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `product_price` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `created_at`) VALUES
(1, 'Keyboard Logitech', 350000, '2022-05-19 02:35:55'),
(3, 'Mouse Logitech', 50000, '2022-05-19 02:36:34'),
(4, 'Webcam M-Tech', 235000, '2022-05-19 02:37:00'),
(5, 'Keyboard Sturdy', 500000, '2022-05-19 02:37:22'),
(6, 'Hardcase HP', 2450000, '2022-05-19 02:38:22'),
(7, 'Lenovo Thinkpad 420', 7000000, '2022-05-19 07:20:50'),
(8, 'Monitor LG', 2350000, '2022-05-19 07:25:02'),
(9, 'Microphone M-Tech CM-100', 600000, '2022-05-19 07:25:35'),
(11, 'Asus Zenfone', 7000000, '2022-05-19 07:26:29'),
(12, 'Blackberry Aurora BB100', 3500000, '2022-05-19 07:29:02'),
(13, 'Smart Watch MINI', 650000, '2022-05-19 08:03:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
