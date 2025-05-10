-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 08, 2025 at 11:50 AM
-- Server version: 8.0.40
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `idAdmin` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Surname` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`idAdmin`, `Name`, `Surname`, `Password`) VALUES
(1, 'John', 'Smith', '1234'),
(2, 'Emily', 'Johnson', '1234'),
(3, 'Michael', 'Brown', '1234'),
(4, 'Sarah', 'Davis', '1234'),
(5, 'David', 'Wilson', '1234'),
(6, 'Anna', 'Taylor', '1234'),
(7, 'James', 'Anderson', '1234'),
(8, 'Laura', 'Thomas', '1234'),
(9, 'Robert', 'Moore', '1234'),
(10, 'Linda', 'Jackson', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
CREATE TABLE IF NOT EXISTS `catalog` (
  `Catakog_id` int NOT NULL AUTO_INCREMENT,
  `Catalog_name` varchar(255) NOT NULL,
  `Catalog_data` date NOT NULL,
  PRIMARY KEY (`Catakog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`Catakog_id`, `Catalog_name`, `Catalog_data`) VALUES
(7, 'Spring Collection', '2025-04-10'),
(8, 'Summer Trends', '2025-05-01'),
(9, 'Autumn Essentials', '2025-09-01'),
(10, 'Winter Styles', '2025-12-01');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_cloth`
--

DROP TABLE IF EXISTS `catalog_cloth`;
CREATE TABLE IF NOT EXISTS `catalog_cloth` (
  `catalog_cloth_id` int NOT NULL AUTO_INCREMENT,
  `catalog_id` int NOT NULL,
  `cloth_id` int NOT NULL,
  PRIMARY KEY (`catalog_cloth_id`),
  KEY `fk_catalog_id_idx` (`catalog_id`),
  KEY `fk_cloth_id_6_idx` (`cloth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `catalog_cloth`
--

INSERT INTO `catalog_cloth` (`catalog_cloth_id`, `catalog_id`, `cloth_id`) VALUES
(53, 7, 1),
(54, 7, 6),
(55, 7, 3),
(56, 7, 4),
(57, 8, 5),
(58, 8, 6),
(59, 8, 7),
(60, 8, 8),
(61, 9, 9),
(62, 9, 10),
(63, 9, 1),
(64, 9, 6),
(65, 10, 3),
(66, 10, 4),
(67, 10, 5),
(68, 10, 6);

-- --------------------------------------------------------

--
-- Table structure for table `cloth`
--

DROP TABLE IF EXISTS `cloth`;
CREATE TABLE IF NOT EXISTS `cloth` (
  `Cloth_ID` int NOT NULL AUTO_INCREMENT,
  `Cloth_Name` varchar(45) NOT NULL,
  `Cloth_photo` varchar(255) DEFAULT NULL,
  `Cloth_color` varchar(45) DEFAULT NULL,
  `Price` double NOT NULL,
  `Type_id` int NOT NULL,
  PRIMARY KEY (`Cloth_ID`),
  UNIQUE KEY `Cloth_ID_UNIQUE` (`Cloth_ID`),
  KEY `fk_cloth_id_1` (`Type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cloth`
--

INSERT INTO `cloth` (`Cloth_ID`, `Cloth_Name`, `Cloth_photo`, `Cloth_color`, `Price`, `Type_id`) VALUES
(1, 'Making', 'https://images.pexels.com/photos/31875056/pexels-photo-31875056/free-photo-of-young-woman-with-umbrella-outdoors-in-uniform.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'Making', 475, 1),
(3, '', '', '', 651, 1),
(4, 'Basic White Tee', 'https://media.istockphoto.com/id/482948743/photo/blank-white-t-shirt-front-with-clipping-path.jpg?s=612x612&w=0&k=20&c=cJG_B0mOIG42FKtC_rqIeZCClYOj7UCFNNs9WTkYEEE=', 'White', 19.99, 1),
(5, 'Slim Fit Jeans', 'https://media.istockphoto.com/id/1659075879/photo/blue-jeans-on-white-background.jpg?s=612x612&w=0&k=20&c=tpVp6AlqHv3JjB9ofKH0SibCnEFWxVKmSlOHdA5_Mrw=', 'Blue', 49.99, 2),
(6, 'Leather Jacket', 'https://media.istockphoto.com/id/1659075879/photo/blue-jeans-on-white-background.jpg?s=612x612&w=0&k=20&c=tpVp6AlqHv3JjB9ofKH0SibCnEFWxVKmSlOHdA5_Mrw=', 'Black', 129.99, 3),
(7, 'Summer Dress', 'https://media.istockphoto.com/id/152971391/photo/red-dress-on-hanger-isolated.jpg?s=612x612&w=0&k=20&c=YtS4KDKQxoj3_fPaXvxjxJLa_yQ64UiQ2DsQJGyaA5c=', 'Red', 39.99, 4),
(8, 'Running Shoes', 'https://media.istockphoto.com/id/171148392/photo/sports-shoe-series.jpg?s=612x612&w=0&k=20&c=cgVormQPBlidue6ZJ7QFi-RmS8XoG5f32FdymywVU2w=', 'Gray', 59.99, 5),
(9, 'Wool Sweater', 'https://thumbs.dreamstime.com/b/beige-cable-knit-sweater-folded-white-background-laying-showcasing-its-warm-comfortable-texture-332973424.jpg', 'Beige', 44.99, 6),
(10, 'Graphic T-Shirt', 'https://media.gettyimages.com/id/483960103/photo/blank-black-t-shirt-front-with-clipping-path.jpg?s=612x612&w=gi&k=20&c=KiBIOouPYE8XU7Ph8E7qNnMY1K1pebL3p2fkyfAH3Vg=', 'Black', 22.5, 1),
(11, 'Denim Jacket', 'https://www.shutterstock.com/image-photo/blue-denim-jacket-isolated-over-600nw-310155074.jpg', 'Blue', 89.99, 3),
(12, 'Floral Dress', 'https://prettykittyfashion.co.uk/cdn/shop/files/1b_c02aea51-8182-4f06-b112-b56a4494992c.jpg?v=1683728875', 'Pink', 42, 4),
(13, 'High Top Sneakers', 'https://media.gettyimages.com/id/175537625/photo/sneakers-with-clipping-path.jpg?s=612x612&w=gi&k=20&c=OmzGjvz7QJDjN9YlYRBPUEFs0EwGcu6sxSIIB1A0Lak=', 'White', 65, 5),
(14, 'Bliuzona', NULL, 'Black', 34, 6);

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
CREATE TABLE IF NOT EXISTS `discount` (
  `discount_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `discount_percent` decimal(5,2) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL,
  `status` tinyint NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`discount_id`, `description`, `discount_percent`, `valid_from`, `valid_to`, `status`, `code`) VALUES
(1, 'Summer Sale', 15.00, '2025-06-01', '2025-06-30', 1, 'SUMMER15'),
(2, 'New User Discount', 10.00, '2025-05-01', '2025-12-31', 1, 'WELCOME10'),
(3, 'Black Friday', 50.00, '2025-11-29', '2025-11-29', 1, 'BLACK50'),
(4, 'Christmas Sale', 25.00, '2025-12-20', '2025-12-27', 1, 'XMAS25'),
(5, 'Clearance Sale', 40.00, '2025-07-01', '2025-07-15', 0, 'CLEAR40'),
(6, 'Birthday Special', 20.00, '2025-01-01', '2025-12-31', 1, 'BDAY20'),
(7, 'Flash Sale', 30.00, '2025-05-05', '2025-05-05', 1, 'FLASH30'),
(8, 'Weekend Deal', 18.00, '2025-05-03', '2025-05-04', 0, 'WEEKEND18'),
(9, 'Spring Promotion', 12.50, '2025-03-01', '2025-03-31', 0, 'SPRING12'),
(10, 'Referral Bonus', 10.00, '2025-01-01', '2025-12-31', 1, 'REFER10');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `inventory_id` int NOT NULL AUTO_INCREMENT,
  `cloth_id` int NOT NULL,
  `size_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `fk_cloth_id_3` (`cloth_id`),
  KEY `fk_size_id_1` (`size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `cloth_id`, `size_id`, `quantity`) VALUES
(1, 1, 1, 15),
(2, 1, 2, 20),
(3, 1, 3, 18),
(4, 1, 4, 22),
(5, 1, 5, 14),
(6, 1, 6, 16),
(13, 3, 1, 13),
(14, 3, 2, 18),
(15, 3, 3, 20),
(16, 3, 4, 24),
(17, 3, 5, 15),
(18, 3, 6, 26),
(19, 4, 1, 14),
(20, 4, 2, 22),
(21, 4, 3, 16),
(22, 4, 4, 19),
(23, 4, 5, 28),
(24, 4, 6, 12),
(25, 5, 1, 10),
(26, 5, 2, 15),
(27, 5, 3, 18),
(28, 5, 4, 25),
(29, 5, 5, 21),
(30, 5, 6, 13),
(31, 6, 1, 11),
(32, 6, 2, 14),
(33, 6, 3, 27),
(34, 6, 4, 19),
(35, 6, 5, 16),
(36, 6, 6, 22),
(37, 7, 1, 17),
(38, 7, 2, 20),
(39, 7, 3, 22),
(40, 7, 4, 18),
(41, 7, 5, 12),
(42, 7, 6, 25),
(43, 8, 1, 16),
(44, 8, 2, 13),
(45, 8, 3, 24),
(46, 8, 4, 20),
(47, 8, 5, 19),
(48, 8, 6, 11),
(49, 9, 1, 15),
(50, 9, 2, 23),
(51, 9, 3, 12),
(52, 9, 4, 28),
(53, 9, 5, 18),
(54, 9, 6, 14),
(55, 10, 1, 13),
(56, 10, 2, 17),
(57, 10, 3, 26),
(58, 10, 4, 20),
(59, 10, 5, 15),
(60, 10, 6, 30),
(61, 1, 2, 20),
(62, 1, 2, 20),
(63, 1, 2, 50);

-- --------------------------------------------------------

--
-- Table structure for table `methods`
--

DROP TABLE IF EXISTS `methods`;
CREATE TABLE IF NOT EXISTS `methods` (
  `methods_id` int NOT NULL AUTO_INCREMENT,
  `methods_type` varchar(45) NOT NULL,
  PRIMARY KEY (`methods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `methods`
--

INSERT INTO `methods` (`methods_id`, `methods_type`) VALUES
(1, 'Credit Card'),
(2, 'PayPal'),
(3, 'Bank Transfer'),
(4, 'Cash on Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `oder_date` date NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_user_1` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `oder_date`) VALUES
(3, 7, '2025-04-10'),
(4, 8, '2025-04-15'),
(5, 9, '2025-04-20'),
(6, 10, '2025-04-25'),
(7, 12, '2025-04-28'),
(13, 13, '2025-04-10'),
(14, 14, '2025-04-10'),
(15, 15, '2025-04-10'),
(16, 19, '2025-04-20'),
(17, 17, '2025-04-20'),
(18, 7, '2025-04-10');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `order_items_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `cloth_id` int NOT NULL,
  `size_id` int NOT NULL,
  PRIMARY KEY (`order_items_id`),
  KEY `fk_cloth_id` (`cloth_id`),
  KEY `fk_order_id` (`order_id`),
  KEY `fk_size_id` (`size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_items_id`, `order_id`, `cloth_id`, `size_id`) VALUES
(1, 3, 1, 2),
(2, 3, 3, 5),
(3, 4, 4, 1),
(5, 4, 6, 4),
(6, 5, 5, 2),
(7, 5, 7, 6),
(8, 6, 8, 3),
(9, 6, 9, 1),
(10, 7, 1, 4),
(11, 7, 10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `method_id` int NOT NULL,
  `amount` decimal(5,0) NOT NULL,
  `status` tinyint NOT NULL,
  `payment_date` date NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_method_id` (`method_id`),
  KEY `fk_order_id_2` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `order_id`, `method_id`, `amount`, `status`, `payment_date`) VALUES
(31, 3, 1, 150, 1, '2025-04-10'),
(32, 4, 2, 90, 0, '2025-04-15'),
(33, 5, 3, 210, 1, '2025-04-20'),
(34, 6, 1, 66, 0, '2025-04-25'),
(35, 7, 4, 121, 1, '2025-04-28');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `cloth_id` int NOT NULL,
  `rating` decimal(5,2) NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `fk_user_id_4` (`user_id`),
  KEY `fk_cloth_id_4` (`cloth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `user_id`, `cloth_id`, `rating`, `created_at`) VALUES
(13, 7, 3, 8.75, '2025-04-21'),
(14, 10, 5, 9.20, '2025-04-22'),
(15, 9, 7, 7.50, '2025-04-24'),
(16, 12, 1, 6.80, '2025-04-26');

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
CREATE TABLE IF NOT EXISTS `shipping` (
  `shipping_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(45) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `country` varchar(45) NOT NULL,
  `shipping_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`shipping_id`),
  KEY `fk_order_id_3` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`shipping_id`, `order_id`, `address`, `city`, `postal_code`, `country`, `shipping_date`, `delivery_date`, `status`) VALUES
(1, 3, '123 Maple St', 'Vilnius', 'LT-01100', 'Lithuania', '2025-04-20', '2025-04-24', 'STORES'),
(2, 4, '45 Green Rd', 'Kaunas', 'LT-44200', 'Lithuania', '2025-04-21', '2025-04-25', 'SEND'),
(3, 5, '9 Oak Ave', 'Klaipėda', 'LT-91200', 'Lithuania', '2025-04-22', '2025-04-26', 'SHIPPING'),
(4, 6, '17 Birch Ln', 'Šiauliai', 'LT-76200', 'Lithuania', '2025-04-23', '2025-04-27', 'COURIER'),
(5, 7, '88 Pine Blvd', 'Panevėžys', 'LT-35100', 'Lithuania', '2025-04-24', '2025-04-28', 'DONE'),
(6, 13, '31 Elm Dr', 'Alytus', 'LT-62100', 'Lithuania', '2025-04-25', '2025-04-29', 'SHIPPING'),
(7, 14, '6 Spruce Ct', 'Marijampolė', 'LT-68300', 'Lithuania', '2025-04-26', '2025-04-30', 'COURIER');

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
CREATE TABLE IF NOT EXISTS `shop` (
  `Shop_id` int NOT NULL,
  `Admin_id` int NOT NULL,
  `Shop_name` varchar(45) NOT NULL,
  PRIMARY KEY (`Shop_id`),
  KEY `fk_admin_idx` (`Admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
CREATE TABLE IF NOT EXISTS `size` (
  `Size_Id` int NOT NULL AUTO_INCREMENT,
  `Size_name` varchar(45) NOT NULL,
  PRIMARY KEY (`Size_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`Size_Id`, `Size_name`) VALUES
(1, 'XS'),
(2, 'S'),
(3, 'M'),
(4, 'L'),
(5, 'XL'),
(6, 'XXL');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type_name`) VALUES
(1, 'T-Shirt'),
(2, 'Jeans'),
(3, 'Jacket'),
(4, 'Dress'),
(5, 'Shoes'),
(6, 'Sweater');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `User_name` varchar(45) NOT NULL,
  `User_surname` varchar(45) NOT NULL,
  `User_password` varchar(45) NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `User_name`, `User_surname`, `User_password`) VALUES
(7, 'Fred', 'Ford', '1233'),
(8, 'Anton', 'D', '1233'),
(9, 'Solid', 'Snake', '1233'),
(10, 'Alice', 'Morgan', '1233'),
(11, 'Brian', 'Hughes', '1233'),
(12, 'Catherine', 'Lopez', '1233'),
(13, 'Daniel', 'Kim', '1233'),
(14, 'Eva', 'Turner', '1233'),
(15, 'Frank', 'Bennett', '1233'),
(16, 'Grace', 'Wong', '1233'),
(17, 'Henry', 'Scott', '1233'),
(18, 'Isabella', 'Reed', '1233'),
(19, 'Jack', 'Foster', '1233');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `wishlist_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `added_date` datetime NOT NULL,
  PRIMARY KEY (`wishlist_id`),
  KEY `fk_user_id_5` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `user_id`, `added_date`) VALUES
(1, 7, '2025-04-20 00:00:00'),
(2, 8, '2025-04-21 00:00:00'),
(3, 10, '2025-04-22 00:00:00'),
(4, 12, '2025-04-23 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist items`
--

DROP TABLE IF EXISTS `wishlist items`;
CREATE TABLE IF NOT EXISTS `wishlist items` (
  `Wishlist_item_id` int NOT NULL,
  `Wishlist_id` int NOT NULL,
  `cloth_id` int NOT NULL,
  PRIMARY KEY (`Wishlist_item_id`),
  KEY `fk_cloth_ok_idx` (`cloth_id`),
  KEY `fk_wish_of_idx` (`Wishlist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catalog_cloth`
--
ALTER TABLE `catalog_cloth`
  ADD CONSTRAINT `fk_catalog_id` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`Catakog_id`),
  ADD CONSTRAINT `fk_cloth_id_6` FOREIGN KEY (`cloth_id`) REFERENCES `cloth` (`Cloth_ID`);

--
-- Constraints for table `cloth`
--
ALTER TABLE `cloth`
  ADD CONSTRAINT `fk_cloth_id_1` FOREIGN KEY (`Type_id`) REFERENCES `type` (`type_id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `fk_cloth_id_2_1` FOREIGN KEY (`cloth_id`) REFERENCES `cloth` (`Cloth_ID`),
  ADD CONSTRAINT `fk_size_id_2_1` FOREIGN KEY (`size_id`) REFERENCES `size` (`Size_Id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_user_1` FOREIGN KEY (`customer_id`) REFERENCES `user` (`idUser`),
  ADD CONSTRAINT `fk_user_id_2_2` FOREIGN KEY (`customer_id`) REFERENCES `user` (`idUser`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_cloth_id_2_2` FOREIGN KEY (`cloth_id`) REFERENCES `cloth` (`Cloth_ID`),
  ADD CONSTRAINT `fk_order_id_2_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `fk_size_id_2_2` FOREIGN KEY (`size_id`) REFERENCES `size` (`Size_Id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_method_id_1_1` FOREIGN KEY (`method_id`) REFERENCES `methods` (`methods_id`),
  ADD CONSTRAINT `fk_order_id_2_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_cloth_id_2_9` FOREIGN KEY (`cloth_id`) REFERENCES `cloth` (`Cloth_ID`),
  ADD CONSTRAINT `fk_user_id_2_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`idUser`);

--
-- Constraints for table `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `fk_order_id_2_4` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `shop`
--
ALTER TABLE `shop`
  ADD CONSTRAINT `fk_admin` FOREIGN KEY (`Admin_id`) REFERENCES `admin` (`idAdmin`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `fk_user_id_2_7` FOREIGN KEY (`user_id`) REFERENCES `user` (`idUser`);

--
-- Constraints for table `wishlist items`
--
ALTER TABLE `wishlist items`
  ADD CONSTRAINT `fk_cloth_ok` FOREIGN KEY (`cloth_id`) REFERENCES `cloth` (`Cloth_ID`),
  ADD CONSTRAINT `fk_wish_of` FOREIGN KEY (`Wishlist_id`) REFERENCES `wishlist` (`wishlist_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
