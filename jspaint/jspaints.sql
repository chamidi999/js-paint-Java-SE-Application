-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Nov 21, 2021 at 06:29 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jspaints`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(75) DEFAULT NULL,
  `password` varchar(75) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `status`) VALUES
(1, 'amigosjspaint@gmails.com', 'PPAjspaint', 1),
(2, 'ama', '1234', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `nic` varchar(15) DEFAULT NULL,
  `mobile_no` varchar(15) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `address` text,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `customer_id`, `name`, `nic`, `mobile_no`, `email`, `address`, `status`) VALUES
(1, 'CUS1000', 'sddffg ', ' fgfhgh', ' hyhh', ' yyyyyyyyyyyyy', 'ytrfgrg', 1),
(2, 'CUS1001', ' ddddddddddd', ' ddddddddd', ' ddddddd', ' ddddddddd', 'dddddddddd', 1),
(5, 'CUS1004', 'Ayo', '987220287', ' 7657568', 'Moragahahena', 'Millewa', 1),
(6, 'CUS1005', 'ssdd ', 'dss ', ' dfsf', ' dsffs', 'dsfdssf', 1),
(14, 'CUS1013', 'ppppp', 'pppp', 'pppp', 'pppp', 'ppppp', 0),
(15, 'CUS1014', 'oooovvvvv', '73478365', '0712321456', 'oooovvvvv@gmail.com', 'hfgyergfrygyhgtugooooovvvvvvooooooooooo', 0),
(16, 'CUS1015', 'fwfrg', 'aaaaaaaaaa', 'aaaaaaa', 'egreg', 'erger', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_has_offer`
--

DROP TABLE IF EXISTS `customer_has_offer`;
CREATE TABLE IF NOT EXISTS `customer_has_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_customer_has_offer_offer1_idx` (`offer_id`),
  KEY `fk_customer_has_offer_customer1_idx` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_has_offer`
--

INSERT INTO `customer_has_offer` (`id`, `customer_id`, `offer_id`, `status`) VALUES
(1, 14, 3, 1),
(2, 14, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `offer_id` int(11) DEFAULT NULL,
  `invoice_id` varchar(45) DEFAULT NULL,
  `order_status` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `required_date` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_customer_has_product_customer1_idx` (`customer_id`),
  KEY `fk_invoice_admin1_idx` (`admin_id`),
  KEY `fk_invoice_offer1_idx` (`offer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `customer_id`, `admin_id`, `offer_id`, `invoice_id`, `order_status`, `price`, `required_date`, `date`, `status`) VALUES
(1, 14, 1, NULL, 'INV1000', 'asdd', 25200, '2012-06-18 00:00:00', '2012-06-18 00:00:00', 0),
(2, 14, 1, NULL, 'INV1001', 'asdd', 261500, '2012-06-18 00:00:00', '2012-06-18 00:00:00', 1),
(3, 14, 1, NULL, 'INV1002', 'dscsd', 80300, '2012-06-18 00:00:00', '2012-06-18 00:00:00', 1),
(4, 14, 1, NULL, 'INV1003', 'dfdf', 160100, '2012-06-18 00:00:00', '2012-06-18 00:00:00', 0),
(5, 14, 1, 1, 'INV1004', 'fsdf', 59290, '2012-06-18 00:00:00', '2012-06-18 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_has_product`
--

DROP TABLE IF EXISTS `invoice_has_product`;
CREATE TABLE IF NOT EXISTS `invoice_has_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_invoice_has_product_product1_idx` (`product_id`),
  KEY `fk_invoice_has_product_invoice1_idx` (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice_has_product`
--

INSERT INTO `invoice_has_product` (`id`, `invoice_id`, `product_id`, `qty`, `status`) VALUES
(1, 1, 2, 12, 1),
(2, 1, 4, 3, 1),
(3, 2, 3, 33, 1),
(4, 2, 4, 30, 1),
(5, 3, 2, 40, 1),
(6, 3, 2, 11, 1),
(7, 4, 2, 11, 1),
(8, 4, 4, 55, 1),
(9, 5, 3, 10, 1),
(10, 5, 2, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
CREATE TABLE IF NOT EXISTS `offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_id` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `description` text,
  `exp_date` date DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `offer`
--

INSERT INTO `offer` (`id`, `offer_id`, `name`, `value`, `description`, `exp_date`, `status`) VALUES
(1, 'OFF1000', 'fffff', 3, 'ffff', '2012-06-18', 1),
(2, 'OFF1001', 'ooo', 5, 'oooooo', '2012-06-18', 1),
(3, 'OFF1002', 'sdfd', 2, 'vsdvwf', '2012-06-18', 1),
(4, 'OFF1003', 'sdfsdf', 10, 'fghfdh', '2012-06-18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(45) DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `size` varchar(15) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_id`, `name`, `size`, `category`, `price`, `qty`, `status`) VALUES
(1, 'PRO1000', ' dfdsgg', '3', ' ddsv', 3545, 5454, 0),
(2, 'PRO1001', 'Paint', '5', 'Nipolac', 1100, 1000, 1),
(3, 'PRO1002', 'Nipolac', '2', 'Nipolac', 5500, 757, 1),
(4, 'PRO1003', 'Orange Gold', ' 4', 'nipolac', 4000, 340, 1),
(5, 'PRO1004', 'aaaaa', '3333', 'nbraaaa', 333, 323, 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE IF NOT EXISTS `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `purchase_id` varchar(45) DEFAULT NULL,
  `vender_name` varchar(45) DEFAULT NULL,
  `vender_email` varchar(75) DEFAULT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_purchase_product_idx` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`id`, `product_id`, `purchase_id`, `vender_name`, `vender_email`, `purchase_date`, `qty`, `unit_price`, `status`) VALUES
(3, 1, 'PUR1000', 'viswa', 'redsubo@gmail.com', '2012-06-18 00:00:00', 300, 4500, 1),
(5, 3, 'PUR1001', 'fdfgdg', ' fdbdfb@gmail.com', '2012-06-18 00:00:00', 400, 4000, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_has_offer`
--
ALTER TABLE `customer_has_offer`
  ADD CONSTRAINT `fk_customer_has_offer_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `fk_customer_has_offer_offer1` FOREIGN KEY (`offer_id`) REFERENCES `offer` (`id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `fk_customer_has_product_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `fk_invoice_admin1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  ADD CONSTRAINT `fk_invoice_offer1` FOREIGN KEY (`offer_id`) REFERENCES `offer` (`id`);

--
-- Constraints for table `invoice_has_product`
--
ALTER TABLE `invoice_has_product`
  ADD CONSTRAINT `fk_invoice_has_product_invoice1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  ADD CONSTRAINT `fk_invoice_has_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `fk_purchase_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
