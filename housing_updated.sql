-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 27, 2018 at 05:09 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `housing`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(5) NOT NULL,
  `password` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `password`) VALUES
(0, ''),
(1, 'samanyu'),
(2, 'as');

-- --------------------------------------------------------

--
-- Table structure for table `apartment`
--

CREATE TABLE `apartment` (
  `apt_id` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sid` int(5) NOT NULL,
  `apt_detail_code` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doorno` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_per_id` int(5) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `img` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `apartment`
--

INSERT INTO `apartment` (`apt_id`, `sid`, `apt_detail_code`, `doorno`, `owner_per_id`, `price`, `status`, `img`) VALUES
('A001', 1, 'adc1', 'A10', 3, 100000, 'y', 'image.jpg'),
('A002', 1, 'adc2', 'A20', 1, 15600, 'n', 'image1.jpg'),
('A003', 1, 'adc1', 'A15', 3, 17800, 'y', 'image2.jpg'),
('A004', 2, 'adc3', 'A09', 2, 19800, 'y', 'image3.jpg'),
('A005', 3, 'adc4', 'A22', 4, 18600, 'n', 'image4.jpg');


-- --------------------------------------------------------

--
-- Table structure for table `apt_book`
--

CREATE TABLE `apt_book` (
  `apt_id` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sid` int(5) NOT NULL,
  `booking_id` int(6) NOT NULL,
  `uid` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_date` date DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `apt_book`
--

INSERT INTO `apt_book` (`apt_id`, `sid`, `booking_id`, `uid`, `book_date`) VALUES
('A001', 1, 1, '1', '2018-11-27'),
('A001', 1, 2, '1', '2018-11-27'),
('A002', 1, 5, '1', '2018-11-27'),
('A003', 1, 3, '1', '2018-11-27'),
('A005', 3, 4, '2', '2018-11-27');

--
-- Triggers `apt_book`
--
DELIMITER $$
CREATE TRIGGER `before_booking_insert` BEFORE INSERT ON `apt_book` FOR EACH ROW BEGIN
	UPDATE apartment a SET status="n" WHERE a.apt_id = NEW.apt_id and a.sid = NEW.sid;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `apt_detail`
--

CREATE TABLE `apt_detail` (
  `apt_detail_code` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bhk` int(1) DEFAULT NULL,
  `bathroom` int(1) DEFAULT NULL,
  `size` int(6) DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `apt_detail`
--

INSERT INTO `apt_detail` (`apt_detail_code`, `bhk`, `bathroom`, `size`, `description`) VALUES
('adc1', 2, 1, 1856, '1 hall, 2 bed, 1 bath'),
('adc2', 3, 2, 1650, '1 hall, 3 bed, 2 bath'),
('adc3', 4, 2, 10650, '1 hall, 4 bed, 2 bath'),
('adc4', 2, 2, 9570, '1 hall, 2 bed , 2 bath'),
('adc5', 2, 1, 1900, '1 hall, 2 bed , 1 bath');


update apt_detail set description='1 hall, 2 bed, 1 bath' where apt_detail_code='adc5';


-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE `facility` (
  `sid` int(5) NOT NULL,
  `facility` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`sid`, `facility`, `image`) VALUES
(1, '24 hrs Electricity and Water supply', 'https://png.icons8.com/color/50/000000/light-off.png'),
(1, 'Laundry, Dry Cleaning & Pressing', 'https://png.icons8.com/color/50/000000/cloakroom.png'),
(1, 'Complimentary Wireless Internet Access', 'https://png.icons8.com/color/50/000000/wifi.png'),
(1, 'Key Card Security Access', 'https://png.icons8.com/ultraviolet/50/000000/keyhole-shield.png'),
(1, 'Swimming Pool', 'https://png.icons8.com/color/50/000000/icons8-logo.png'),
(1, 'Gymnasium', 'https://png.icons8.com/color/50/000000/dumbbell.png'),
(1, 'In-house Cafe', 'https://png.icons8.com/color/50/000000/restaurant-table.png'),
(1, 'Tennis Court', 'https://png.icons8.com/ultraviolet/50/000000/tennis.png'),
(1, 'Jogging Track', 'https://png.icons8.com/color/50/000000/exercise.png'),
(1, 'Complimentary Parking', 'https://png.icons8.com/color/50/000000/parking.png'),
(2, '24 hrs Electricity and Water supply', 'https://png.icons8.com/color/50/000000/light-off.png'),
(2, 'Laundry, Dry Cleaning & Pressing', 'https://png.icons8.com/color/50/000000/cloakroom.png'),
(2, 'Complimentary Wireless Internet Access', 'https://png.icons8.com/color/50/000000/wifi.png'),
(2, 'Key Card Security Access', 'https://png.icons8.com/ultraviolet/50/000000/keyhole-shield.png'),
(2, 'Swimming Pool', 'https://png.icons8.com/color/50/000000/icons8-logo.png'),
(2, 'Gymnasium', 'https://png.icons8.com/color/50/000000/dumbbell.png'),
(2, 'In-house Cafe', 'https://png.icons8.com/color/50/000000/restaurant-table.png'),
(2, 'Tennis Court', 'https://png.icons8.com/ultraviolet/50/000000/tennis.png'),
(2, 'Jogging Track', 'https://png.icons8.com/color/50/000000/exercise.png'),
(2, 'Complimentary Parking', 'https://png.icons8.com/color/50/000000/parking.png'),
(3, '24 hrs Electricity and Water supply', 'https://png.icons8.com/color/50/000000/light-off.png'),
(3, 'Laundry, Dry Cleaning & Pressing', 'https://png.icons8.com/color/50/000000/cloakroom.png'),
(3, 'Complimentary Wireless Internet Access', 'https://png.icons8.com/color/50/000000/wifi.png'),
(3, 'Key Card Security Access', 'https://png.icons8.com/ultraviolet/50/000000/keyhole-shield.png'),
(3, 'Swimming Pool', 'https://png.icons8.com/color/50/000000/icons8-logo.png'),
(3, 'Gymnasium', 'https://png.icons8.com/color/50/000000/dumbbell.png'),
(3, 'In-house Cafe', 'https://png.icons8.com/color/50/000000/restaurant-table.png'),
(3, 'Tennis Court', 'https://png.icons8.com/ultraviolet/50/000000/tennis.png'),
(3, 'Jogging Track', 'https://png.icons8.com/color/50/000000/exercise.png'),
(3, 'Complimentary Parking', 'https://png.icons8.com/color/50/000000/parking.png');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `per_id` int(5) NOT NULL,
  `name` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`per_id`, `name`, `phone`) VALUES
(1, 'handa', '7975451889'),
(2, 'sam', '8792056398'),
(3, 'ram', '9739245136'),
(4, 'Shivansh', '843512132'),
(5, 'trial', '411321564');

-- --------------------------------------------------------

--
-- Table structure for table `society`
--

CREATE TABLE `society` (
  `sid` int(5) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mgr_per_id` int(5) DEFAULT NULL,
  `img` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `society`
--

INSERT INTO `society` (`sid`, `name`, `address`, `mgr_per_id`, `img`) VALUES
(1, 'SJR Verity', 'Konapanna Agrahara, Hosa Road, Bangalore-76', 1, 'society1.jpg'),
(2, 'Petal Flower', 'Near Bellandur, off Sarjapur Road, Bangalore-72', 2, 'society2.jpg'),
(3, 'Home Fiesta', 'Hosa Junction, near Electronic City, Bangalore-75', 3, 'society3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(5) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `name`, `email`, `password`) VALUES
(1, 'a', 'a@gmail.com', 'a'),
(2, 'b', 'b@gmail.com', 'b'),
(555, 'trial', 'asd@asd', 'a'),
(556, 'trial2', 'a2@gmail.com', 'a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `apartment`
--
ALTER TABLE `apartment`
  ADD PRIMARY KEY (`apt_id`,`sid`),
  ADD KEY `sid` (`sid`),
  ADD KEY `owner_per_id` (`owner_per_id`),
  ADD KEY `apt_detail_code` (`apt_detail_code`);

--
-- Indexes for table `apt_book`
--
ALTER TABLE `apt_book`
  ADD PRIMARY KEY (`apt_id`,`sid`,`booking_id`),
  ADD UNIQUE KEY `booking_id` (`booking_id`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `apt_detail`
--
ALTER TABLE `apt_detail`
  ADD PRIMARY KEY (`apt_detail_code`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`per_id`),
  ADD UNIQUE KEY `per_id` (`per_id`);

--
-- Indexes for table `society`
--
ALTER TABLE `society`
  ADD PRIMARY KEY (`sid`),
  ADD UNIQUE KEY `sid` (`sid`),
  ADD KEY `mgr_per_id` (`mgr_per_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apt_book`
--
ALTER TABLE `apt_book`
  MODIFY `booking_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `per_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=557;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apartment`
--
ALTER TABLE `apartment`
  ADD CONSTRAINT `apartment_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `society` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `apartment_ibfk_2` FOREIGN KEY (`owner_per_id`) REFERENCES `personpersonperson` (`per_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `apartment_ibfk_3` FOREIGN KEY (`apt_detail_code`) REFERENCES `apt_detail` (`apt_detail_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `apt_book`
--
ALTER TABLE `apt_book`
  ADD CONSTRAINT `apt_book_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `society` (`sid`),
  ADD CONSTRAINT `apt_book_ibfk_2` FOREIGN KEY (`apt_id`) REFERENCES `apartment` (`apt_id`);

--
-- Constraints for table `facility`
--
ALTER TABLE `facility`
  ADD CONSTRAINT `facility_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `society` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `society`
--
ALTER TABLE `society`
  ADD CONSTRAINT `society_ibfk_1` FOREIGN KEY (`mgr_per_id`) REFERENCES `person` (`per_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;