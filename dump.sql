-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: housing
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Alok','alok'),(2,'Harika','harika'),(3,'Nishita','nishita'),(4,'Varshini','varshini'),(5,'Eppa','eppa'),(6,'Hemanth','hemanth'),(7,'Elon','elon');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apartment`
--

DROP TABLE IF EXISTS `apartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apartment` (
  `apt_id` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sid` int NOT NULL,
  `apt_detail_code` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doorno` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_per_id` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `img` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`apt_id`,`sid`),
  KEY `sid` (`sid`),
  KEY `owner_per_id` (`owner_per_id`),
  KEY `apt_detail_code` (`apt_detail_code`),
  CONSTRAINT `apartment_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `society` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apartment_ibfk_2` FOREIGN KEY (`owner_per_id`) REFERENCES `person` (`per_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apartment_ibfk_3` FOREIGN KEY (`apt_detail_code`) REFERENCES `apt_detail` (`apt_detail_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartment`
--

LOCK TABLES `apartment` WRITE;
/*!40000 ALTER TABLE `apartment` DISABLE KEYS */;
INSERT INTO `apartment` VALUES ('A001',1,'adc1','A10',3,100000,'n','image.jpg'),('A002',1,'adc2','A20',1,15600,'n','image1.jpg'),('A003',1,'adc1','A15',3,17800,'n','image2.jpg'),('A004',2,'adc3','A09',2,19800,'n','image3.jpg'),('A005',3,'adc4','A22',4,18600,'n','image4.jpg'),('B001',5,'adc2','11',1,10000,'a','apartmentt.jpg');
/*!40000 ALTER TABLE `apartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apt_book`
--

DROP TABLE IF EXISTS `apt_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apt_book` (
  `apt_id` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sid` int NOT NULL,
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_date` date DEFAULT NULL,
  PRIMARY KEY (`apt_id`,`sid`,`booking_id`),
  UNIQUE KEY `booking_id` (`booking_id`),
  KEY `sid` (`sid`),
  CONSTRAINT `apt_book_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `society` (`sid`),
  CONSTRAINT `apt_book_ibfk_2` FOREIGN KEY (`apt_id`) REFERENCES `apartment` (`apt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apt_book`
--

LOCK TABLES `apt_book` WRITE;
/*!40000 ALTER TABLE `apt_book` DISABLE KEYS */;
INSERT INTO `apt_book` VALUES ('A001',1,1,'1','2018-11-27'),('A001',1,2,'1','2018-11-27'),('A001',1,6,'1','2023-08-04'),('A001',1,9,'1','2023-08-04'),('A001',1,14,'1','2023-08-04'),('A001',1,21,'1','2023-08-04'),('A001',1,26,'1','2023-08-04'),('A001',1,32,'1','2023-08-04'),('A001',1,35,'1','2023-08-04'),('A001',1,40,'1','2023-08-04'),('A001',1,44,'1','2023-08-04'),('A001',1,48,'1','2023-08-04'),('A001',1,56,'1','2023-08-04'),('A001',1,59,'1','2023-08-04'),('A001',1,65,'1','2023-08-04'),('A001',1,68,'1','2023-08-04'),('A001',1,72,'1','2023-08-04'),('A001',1,77,'1','2023-08-04'),('A001',1,86,'1','2023-08-04'),('A001',1,93,'1','2023-08-04'),('A001',1,97,'1','2023-08-04'),('A001',1,103,'1','2023-08-04'),('A001',1,107,'1','2023-08-04'),('A001',1,113,'1','2023-08-04'),('A002',1,5,'1','2018-11-27'),('A002',1,10,'1','2023-08-04'),('A002',1,15,'1','2023-08-04'),('A002',1,19,'1','2023-08-04'),('A002',1,24,'1','2023-08-04'),('A002',1,28,'1','2023-08-04'),('A002',1,34,'1','2023-08-04'),('A002',1,38,'1','2023-08-04'),('A002',1,45,'1','2023-08-04'),('A002',1,49,'1','2023-08-04'),('A002',1,54,'1','2023-08-04'),('A002',1,61,'1','2023-08-04'),('A002',1,63,'1','2023-08-04'),('A002',1,69,'1','2023-08-04'),('A002',1,73,'1','2023-08-04'),('A002',1,78,'1','2023-08-04'),('A002',1,83,'1','2023-08-04'),('A002',1,87,'1','2023-08-04'),('A002',1,91,'1','2023-08-04'),('A002',1,95,'1','2023-08-04'),('A002',1,100,'1','2023-08-04'),('A002',1,105,'1','2023-08-04'),('A002',1,110,'1','2023-08-04'),('A003',1,3,'1','2018-11-27'),('A003',1,8,'1','2023-08-04'),('A003',1,11,'1','2023-08-04'),('A003',1,16,'1','2023-08-04'),('A003',1,20,'1','2023-08-04'),('A003',1,25,'1','2023-08-04'),('A003',1,29,'1','2023-08-04'),('A003',1,36,'1','2023-08-04'),('A003',1,39,'1','2023-08-04'),('A003',1,46,'1','2023-08-04'),('A003',1,50,'1','2023-08-04'),('A003',1,55,'1','2023-08-04'),('A003',1,60,'1','2023-08-04'),('A003',1,64,'1','2023-08-04'),('A003',1,70,'1','2023-08-04'),('A003',1,74,'1','2023-08-04'),('A003',1,79,'1','2023-08-04'),('A003',1,84,'1','2023-08-04'),('A003',1,88,'1','2023-08-04'),('A003',1,92,'1','2023-08-04'),('A003',1,96,'1','2023-08-04'),('A003',1,101,'1','2023-08-04'),('A003',1,106,'1','2023-08-04'),('A003',1,111,'1','2023-08-04'),('A004',2,7,'1','2023-08-04'),('A004',2,12,'1','2023-08-04'),('A004',2,17,'1','2023-08-04'),('A004',2,22,'1','2023-08-04'),('A004',2,27,'1','2023-08-04'),('A004',2,31,'1','2023-08-04'),('A004',2,37,'1','2023-08-04'),('A004',2,41,'1','2023-08-04'),('A004',2,47,'1','2023-08-04'),('A004',2,52,'1','2023-08-04'),('A004',2,57,'1','2023-08-04'),('A004',2,58,'1','2023-08-04'),('A004',2,66,'1','2023-08-04'),('A004',2,71,'1','2023-08-04'),('A004',2,75,'1','2023-08-04'),('A004',2,80,'1','2023-08-04'),('A004',2,85,'1','2023-08-04'),('A004',2,89,'1','2023-08-04'),('A004',2,90,'1','2023-08-04'),('A004',2,98,'1','2023-08-04'),('A004',2,102,'1','2023-08-04'),('A004',2,108,'1','2023-08-04'),('A004',2,112,'1','2023-08-04'),('A005',3,4,'2','2018-11-27'),('A005',3,13,'1','2023-08-04'),('A005',3,18,'1','2023-08-04'),('A005',3,23,'1','2023-08-04'),('A005',3,30,'1','2023-08-04'),('A005',3,33,'1','2023-08-04'),('A005',3,42,'1','2023-08-04'),('A005',3,43,'1','2023-08-04'),('A005',3,51,'1','2023-08-04'),('A005',3,53,'1','2023-08-04'),('A005',3,62,'1','2023-08-04'),('A005',3,67,'1','2023-08-04'),('A005',3,76,'1','2023-08-04'),('A005',3,81,'1','2023-08-04'),('A005',3,82,'1','2023-08-04'),('A005',3,94,'1','2023-08-04'),('A005',3,99,'1','2023-08-04'),('A005',3,104,'1','2023-08-04'),('A005',3,109,'1','2023-08-04'),('A005',3,114,'1','2023-08-04');
/*!40000 ALTER TABLE `apt_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apt_detail`
--

DROP TABLE IF EXISTS `apt_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apt_detail` (
  `apt_detail_code` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bhk` int DEFAULT NULL,
  `bathroom` int DEFAULT NULL,
  `size` int DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`apt_detail_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apt_detail`
--

LOCK TABLES `apt_detail` WRITE;
/*!40000 ALTER TABLE `apt_detail` DISABLE KEYS */;
INSERT INTO `apt_detail` VALUES ('adc1',2,1,1856,'1 hall, 2 bed, 1 bath'),('adc2',3,2,1650,'1 hall, 3 bed, 2 bath'),('adc3',4,2,10650,'1 hall, 4 bed, 2 bath'),('adc4',2,2,9570,'1 hall, 2 bed , 2 bath'),('adc5',2,1,1900,'1 hall, 2 bed , 1 bath'),('adc6',5,2,2000,'2 hall, 5 bed, 2 bath');
/*!40000 ALTER TABLE `apt_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_room`
--

DROP TABLE IF EXISTS `chat_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roomName` varchar(100) NOT NULL,
  `owner` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roomName` (`roomName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_room`
--

LOCK TABLES `chat_room` WRITE;
/*!40000 ALTER TABLE `chat_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatroom`
--

DROP TABLE IF EXISTS `chatroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatroom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roomName` varchar(255) NOT NULL,
  `userCreated` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roomName` (`roomName`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatroom`
--

LOCK TABLES `chatroom` WRITE;
/*!40000 ALTER TABLE `chatroom` DISABLE KEYS */;
INSERT INTO `chatroom` VALUES (18,'Marketplace','mark@gmail.com'),(19,'UAB Housing','alok@g.com');
/*!40000 ALTER TABLE `chatroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facility` (
  `sid` int NOT NULL,
  `facility` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `sid` (`sid`),
  CONSTRAINT `facility_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `society` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (1,'24 hrs Water & Electricity','https://w7.pngwing.com/pngs/1005/418/png-transparent-russia-gazprom-neft-natural-gas-company-gas-text-logo-world-thumbnail.png'),(1,'Laundry & Dry Cleaning','https://t3.ftcdn.net/jpg/04/27/57/28/360_F_427572855_RhQYKzH4mAzkzIYhnGngBA4h4x5kUwnm.jpg'),(1,'Complimentary WiFi','https://w7.pngwing.com/pngs/686/190/png-transparent-black-wifi-logo-wi-fi-computer-icons-wifi-symbol-white-computer-network-internet-black-and-white-thumbnail.png'),(1,'Key Card Security Access','https://media.istockphoto.com/id/928549262/vector/opening-the-electronic-lock.jpg?s=2048x2048&w=is&k=20&c=T4n1PVTWLRaB4t3625SNksovX8ESokRCwJHZZze82iM='),(1,'Swimming Pool','https://media.istockphoto.com/id/874204060/vector/swimming-icon.jpg?s=612x612&w=0&k=20&c=FuqtWI9DhoBRnNXsszshRMWfYwiYVatXb-NoDfQxteA='),(1,'Gymnasium','https://uploads-ssl.webflow.com/63695e3c58fff2340c868780/6378b4d9523c296e0f122539_61f39f335c183809d1ca3085_429d631659a11a9eb666b103d811470a.jpeg'),(1,'In-house Cafe','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDbYAEBHTT5cQYfCv1CpQqFCr-Ay1-y50SuOTdJsdWuw&s'),(1,'Tennis Court','https://t3.ftcdn.net/jpg/03/19/97/72/240_F_319977248_uFxqK12OD7oG8VEq2DqRSweasxmsg62Q.jpg'),(1,'Jogging Track','https://t4.ftcdn.net/jpg/02/74/16/21/360_F_274162164_Oy35v6hOXqs0PRclDSs3OYNhcGzvyrYD.jpg'),(1,'Complimentary Parking','https://signcovers.com/wp-content/uploads/2019/10/DSC00894-2.jpg'),(2,'24 hrs Water & Electricity','https://w7.pngwing.com/pngs/1005/418/png-transparent-russia-gazprom-neft-natural-gas-company-gas-text-logo-world-thumbnail.png'),(2,'Laundry & Dry Cleaning','https://t3.ftcdn.net/jpg/04/27/57/28/360_F_427572855_RhQYKzH4mAzkzIYhnGngBA4h4x5kUwnm.jpg'),(2,'Complimentary WiFi','https://w7.pngwing.com/pngs/686/190/png-transparent-black-wifi-logo-wi-fi-computer-icons-wifi-symbol-white-computer-network-internet-black-and-white-thumbnail.png'),(2,'Gymnasium','https://uploads-ssl.webflow.com/63695e3c58fff2340c868780/6378b4d9523c296e0f122539_61f39f335c183809d1ca3085_429d631659a11a9eb666b103d811470a.jpeg'),(2,'In-house Cafe','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDbYAEBHTT5cQYfCv1CpQqFCr-Ay1-y50SuOTdJsdWuw&s'),(2,'Jogging Track','https://t4.ftcdn.net/jpg/02/74/16/21/360_F_274162164_Oy35v6hOXqs0PRclDSs3OYNhcGzvyrYD.jpg'),(2,'Complimentary Parking','https://signcovers.com/wp-content/uploads/2019/10/DSC00894-2.jpg'),(3,'24 hrs Water & Electricity','https://w7.pngwing.com/pngs/1005/418/png-transparent-russia-gazprom-neft-natural-gas-company-gas-text-logo-world-thumbnail.png'),(3,'Laundry & Dry Cleaning','https://t3.ftcdn.net/jpg/04/27/57/28/360_F_427572855_RhQYKzH4mAzkzIYhnGngBA4h4x5kUwnm.jpg'),(3,'Complimentary WiFi','https://w7.pngwing.com/pngs/686/190/png-transparent-black-wifi-logo-wi-fi-computer-icons-wifi-symbol-white-computer-network-internet-black-and-white-thumbnail.png'),(3,'Key Card Security Access','https://media.istockphoto.com/id/1056299634/vector/hand-holding-identification-card-line-icon.jpg?s=612x612&w=0&k=20&c=9XzEVJqNjo0-VfVPeer6JtmmJMFVArjpMCx1ohqoklM='),(3,'Swimming Pool','https://media.istockphoto.com/id/874204060/vector/swimming-icon.jpg?s=612x612&w=0&k=20&c=FuqtWI9DhoBRnNXsszshRMWfYwiYVatXb-NoDfQxteA='),(3,'Gymnasium','https://uploads-ssl.webflow.com/63695e3c58fff2340c868780/6378b4d9523c296e0f122539_61f39f335c183809d1ca3085_429d631659a11a9eb666b103d811470a.jpeg'),(3,'Tennis Court','https://t3.ftcdn.net/jpg/03/19/97/72/240_F_319977248_uFxqK12OD7oG8VEq2DqRSweasxmsg62Q.jpg'),(5,'Gym',NULL);
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_log`
--

DROP TABLE IF EXISTS `message_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userSent` varchar(100) NOT NULL,
  `roomName` varchar(100) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_log`
--

LOCK TABLES `message_log` WRITE;
/*!40000 ALTER TABLE `message_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messagelog`
--

DROP TABLE IF EXISTS `messagelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messagelog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `userSent` varchar(255) NOT NULL,
  `roomName` varchar(255) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messagelog`
--

LOCK TABLES `messagelog` WRITE;
/*!40000 ALTER TABLE `messagelog` DISABLE KEYS */;
INSERT INTO `messagelog` VALUES (3,'mark','mark@gmail.com','Marketplace','Hi all, I am looking to sell my Sofa for 20$. If any one is interested please contact me mark@uab.edu'),(4,'Elon Musk','elon@gmail.com','Marketplace','Hey Mark, I am interested in buying the Sofa, Please check your DM.'),(5,'varshni','varshini@gmail.com','Marketplace','I am planning to buy a bicycle for low price, Help me out If any Leads'),(6,'varshni','varshini@gmail.com','Marketplace','Hey Mark, I am also interested in buying the Sofa. '),(7,'alok','alok@g.com','UAB Housing','Hey All, I am looking for a 2 Bed 2 Bath House nearby UAB'),(8,'alok','alok@g.com','UAB Housing','Please let me know If you have any Leads.'),(9,'Elon Musk','elon@gmail.com','UAB Housing','Hey Alok, I am planning to change my room first week of september.  Let me know If you are interested');
/*!40000 ALTER TABLE `messagelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `per_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`per_id`),
  UNIQUE KEY `per_id` (`per_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'handa','7975451889'),(2,'sam','8792056398'),(3,'ram','9739245136'),(4,'Shivansh','843512132'),(5,'trial','411321564'),(6,'Elon','123456');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `society`
--

DROP TABLE IF EXISTS `society`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `society` (
  `sid` int NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mgr_per_id` int DEFAULT NULL,
  `img` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `sid` (`sid`),
  KEY `mgr_per_id` (`mgr_per_id`),
  CONSTRAINT `society_ibfk_1` FOREIGN KEY (`mgr_per_id`) REFERENCES `person` (`per_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `society`
--

LOCK TABLES `society` WRITE;
/*!40000 ALTER TABLE `society` DISABLE KEYS */;
INSERT INTO `society` VALUES (1,'Idle Wild','13th St S , Birmingham, Alabama-35208',1,'society1.jpg'),(2,'Elements 60','14th St S, 1320, Birmingham, Alabama-35208',2,'society2.jpg'),(3,'Melrose','17th St S, Near UAB campus, Birmingham , Alabama-35205 ',3,'society3.jpg'),(5,'Merry Roe','1608 14th AVE S',3,'society.jpg');
/*!40000 ALTER TABLE `society` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'alok','alok@g.com','alok'),(2,'capeta','capeta@gmail.com','capeta'),(3,'aa','alok.capeta@gmail.com','aa'),(4,'daa','ada@g.com','adada'),(5,'q','q@g.com','q'),(6,'b','b@gmail.com','b'),(7,'taira','taira@gmail.com','taira'),(8,'Elon Musk','elon@gmail.com','elon'),(9,'uab','uab@uab.com','uab'),(10,'mark','mark@gmail.com','mark'),(13,'w','w@gmail.com','w'),(14,'e','e@gmail.com','e'),(15,'i','i@g.com','i'),(16,'re','re@g.com','re'),(17,'de','de@g.com','de'),(18,'qwq','123@gmail.com','123'),(19,'reree','reere@gmail.com','rereee'),(20,'varshni','varshini@gmail.com','varshini');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-04 21:49:34
