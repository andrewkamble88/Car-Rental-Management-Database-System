-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: car_rental
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Admin_User`
--

DROP TABLE IF EXISTS `Admin_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admin_User` (
  `userId` varchar(100) NOT NULL,
  `fName` varchar(100) DEFAULT NULL,
  `lName` varchar(100) DEFAULT NULL,
  `emailId` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `registration_Date` varchar(100) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL,
  `reset_Question` varchar(100) DEFAULT NULL,
  `reset_Ans_Type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin_User`
--

LOCK TABLES `Admin_User` WRITE;
/*!40000 ALTER TABLE `Admin_User` DISABLE KEYS */;
INSERT INTO `Admin_User` VALUES ('root','root','root','root@gmail.com','00000','23-9-2018','$pbkdf2-sha256$29000$0xqjdO4dAyCEsDamNEbovQ$0qf0ZTkqFJQMC/iTF.ubmKqGt83PC7vtgnYTsDKek0Q','1','gUhd9TxpnQppnZVAf7cv9goqpTziSI7U5rK+pzpRWDw=');
/*!40000 ALTER TABLE `Admin_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Assign`
--

DROP TABLE IF EXISTS `Assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Assign` (
  `driverId` int(50) DEFAULT NULL,
  `bookingId` int(50) DEFAULT NULL,
  KEY `driverId` (`driverId`),
  KEY `bookingId` (`bookingId`),
  CONSTRAINT `Assign_ibfk_1` FOREIGN KEY (`driverId`) REFERENCES `Driver` (`driverId`),
  CONSTRAINT `Assign_ibfk_2` FOREIGN KEY (`bookingId`) REFERENCES `Booking` (`bookingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assign`
--

LOCK TABLES `Assign` WRITE;
/*!40000 ALTER TABLE `Assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `Assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Booking` (
  `bookingId` int(50) NOT NULL AUTO_INCREMENT,
  `userId` varchar(100) DEFAULT NULL,
  `fName` varchar(100) DEFAULT NULL,
  `lName` varchar(100) DEFAULT NULL,
  `phone_no` varchar(100) DEFAULT NULL,
  `emailId` varchar(100) DEFAULT NULL,
  `Cab` varchar(100) DEFAULT NULL,
  `startDate` varchar(100) DEFAULT NULL,
  `endDate` varchar(100) DEFAULT NULL,
  `Pickup_time` varchar(100) DEFAULT NULL,
  `Pickup_location` varchar(100) DEFAULT NULL,
  `Drop_off_location` varchar(100) DEFAULT NULL,
  `rate_per_km` varchar(100) DEFAULT NULL,
  `driverId` int(50) DEFAULT NULL,
  `carid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bookingId`),
  KEY `userId` (`userId`),
  KEY `driverId` (`driverId`),
  CONSTRAINT `Booking_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Cust_User` (`userId`),
  CONSTRAINT `Booking_ibfk_2` FOREIGN KEY (`driverId`) REFERENCES `Driver` (`driverId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES (5,'andrew88','andrew','kamble','8421985646','andrew@gmail.com','Hatchback','22/08/20118','30/08/2018','10.30','Nashik','Pune','16',3,'101'),(6,'Mayur1092','Mayur','Deshmukh','8421985646','mayur@gmail.com','Sedan','22/08/2018','23/08/2018','10.30','Nashik','Mumbai','12',3,'100');
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books` (
  `userId` varchar(100) DEFAULT NULL,
  `bookingId` int(50) DEFAULT NULL,
  KEY `userId` (`userId`),
  KEY `bookingId` (`bookingId`),
  CONSTRAINT `Books_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Cust_User` (`userId`),
  CONSTRAINT `Books_ibfk_2` FOREIGN KEY (`bookingId`) REFERENCES `Booking` (`bookingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Car`
--

DROP TABLE IF EXISTS `Car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Car` (
  `Car_id` varchar(100) NOT NULL,
  `model_name` varchar(100) DEFAULT NULL,
  `registeration_no` varchar(100) DEFAULT NULL,
  `seating_capacity` varchar(100) DEFAULT NULL,
  `Car_type` varchar(100) DEFAULT NULL,
  `price_per_km` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Available',
  PRIMARY KEY (`Car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Car`
--

LOCK TABLES `Car` WRITE;
/*!40000 ALTER TABLE `Car` DISABLE KEYS */;
INSERT INTO `Car` VALUES ('100','Honda Civic','5468465','5','Sedan','20','BOOKED');
/*!40000 ALTER TABLE `Car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Car_used`
--

DROP TABLE IF EXISTS `Car_used`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Car_used` (
  `Car_id` varchar(100) DEFAULT NULL,
  `bookingId` int(50) DEFAULT NULL,
  KEY `Car_id` (`Car_id`),
  KEY `bookingId` (`bookingId`),
  CONSTRAINT `Car_used_ibfk_1` FOREIGN KEY (`Car_id`) REFERENCES `Car` (`Car_id`),
  CONSTRAINT `Car_used_ibfk_2` FOREIGN KEY (`bookingId`) REFERENCES `Booking` (`bookingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Car_used`
--

LOCK TABLES `Car_used` WRITE;
/*!40000 ALTER TABLE `Car_used` DISABLE KEYS */;
/*!40000 ALTER TABLE `Car_used` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cust_User`
--

DROP TABLE IF EXISTS `Cust_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cust_User` (
  `userId` varchar(100) NOT NULL,
  `fName` varchar(100) DEFAULT NULL,
  `lName` varchar(100) DEFAULT NULL,
  `emailId` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `registration_Date` varchar(100) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL,
  `reset_Question` varchar(100) DEFAULT NULL,
  `reset_Ans_Type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cust_User`
--

LOCK TABLES `Cust_User` WRITE;
/*!40000 ALTER TABLE `Cust_User` DISABLE KEYS */;
INSERT INTO `Cust_User` VALUES ('andrew88','Andrew','Kamble','andrewkamble88@gmail.com','8421985646','23-9-2018','$pbkdf2-sha256$29000$QOids9aaMyZEqNWaM2bMmQ$w2BRlEStRYGk2PxwHzCNGA12WSKro4gWzNtOelqbHJM','3','gUhd9TxpnQppnZVAf7cv9iPzGKR1GxOtJo3fPVRTLiU='),('Mayur1092','Mayur','Deshmukh','mayur@gmail.com','8421985646','23-9-2018','$pbkdf2-sha256$29000$AaD0nnOuFSKk9F7L.b9Xig$/w2twC.JUyeAuaMxjWmvx7.ngP2KD6qPGzgzB00/MAw','2','gUhd9TxpnQppnZVAf7cv9iYaC3fxyIZ5KsyoqHKRVRM=');
/*!40000 ALTER TABLE `Cust_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Driver`
--

DROP TABLE IF EXISTS `Driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Driver` (
  `driverId` int(50) NOT NULL AUTO_INCREMENT,
  `fName` varchar(100) DEFAULT NULL,
  `lName` varchar(100) DEFAULT NULL,
  `phone_no` varchar(100) DEFAULT NULL,
  `licence_no` varchar(50) DEFAULT NULL,
  `age` int(10) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Available',
  PRIMARY KEY (`driverId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Driver`
--

LOCK TABLES `Driver` WRITE;
/*!40000 ALTER TABLE `Driver` DISABLE KEYS */;
INSERT INTO `Driver` VALUES (3,'Abiali','Hussain','518484','26846846',20,'BOOKED');
/*!40000 ALTER TABLE `Driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feedback`
--

DROP TABLE IF EXISTS `Feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Feedback` (
  `userId` varchar(100) DEFAULT NULL,
  `fName` varchar(100) DEFAULT NULL,
  `lName` varchar(100) DEFAULT NULL,
  `emailId` varchar(100) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `Date` varchar(100) DEFAULT NULL,
  KEY `userId` (`userId`),
  CONSTRAINT `Feedback_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Cust_User` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feedback`
--

LOCK TABLES `Feedback` WRITE;
/*!40000 ALTER TABLE `Feedback` DISABLE KEYS */;
INSERT INTO `Feedback` VALUES ('andrew88','Andrew','Kamble','andrewkamble88@gmail.com','Excellent','Excellent Service','23-9-2018');
/*!40000 ALTER TABLE `Feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login_History`
--

DROP TABLE IF EXISTS `Login_History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login_History` (
  `user` varchar(100) DEFAULT NULL,
  `userId` varchar(100) DEFAULT NULL,
  `Date` varchar(100) DEFAULT NULL,
  `Time` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login_History`
--

LOCK TABLES `Login_History` WRITE;
/*!40000 ALTER TABLE `Login_History` DISABLE KEYS */;
INSERT INTO `Login_History` VALUES ('Admin','root','23-9-2018','09:49:04'),('Customer','andrew88','23-9-2018','09:57:48'),('Admin','root','23-9-2018','09:59:51'),('Admin','root','23-9-2018','10:04:39'),('Admin','root','23-9-2018','10:05:21'),('Customer','andrew88','23-9-2018','10:07:48'),('Customer','andrew88','23-9-2018','10:10:01'),('Customer','andrew88','23-9-2018','10:11:51'),('Customer','andrew88','23-9-2018','10:12:17'),('Customer','andrew88','23-9-2018','10:12:58'),('Admin','root','23-9-2018','10:16:58'),('Admin','root','23-9-2018','10:53:24'),('Admin','root','23-9-2018','11:12:23'),('Admin','root','23-9-2018','11:13:17'),('Admin','root','23-9-2018','11:14:36'),('Admin','root','23-9-2018','11:19:15'),('Admin','root','23-9-2018','11:24:53'),('Admin','root','23-9-2018','11:28:06'),('Admin','root','23-9-2018','11:36:42'),('Admin','root','23-9-2018','11:38:37'),('Admin','root','23-9-2018','12:18:43'),('Admin','root','23-9-2018','12:23:05'),('Admin','root','23-9-2018','12:31:32'),('Admin','root','23-9-2018','12:51:45'),('Customer','andrew88','23-9-2018','12:58:29'),('Customer','andrew88','23-9-2018','17:37:51'),('Customer','andrew88','23-9-2018','17:40:46'),('Customer','andrew88','23-9-2018','17:42:36'),('Customer','andrew88','23-9-2018','17:47:36'),('Customer','andrew88','23-9-2018','17:50:21'),('Admin','root','23-9-2018','18:40:16'),('Admin','root','23-9-2018','18:40:48'),('Admin','root','23-9-2018','19:15:11'),('Admin','root','23-9-2018','19:41:11'),('Admin','root','23-9-2018','19:44:13'),('Admin','root','23-9-2018','19:45:13'),('Admin','root','23-9-2018','20:23:27'),('Admin','root','23-9-2018','20:26:11'),('Admin','root','23-9-2018','20:33:55'),('Admin','root','23-9-2018','20:52:47'),('Admin','root','23-9-2018','20:54:12'),('Admin','root','23-9-2018','21:06:53'),('Customer','Mayur1092','23-9-2018','21:12:23'),('Admin','root','23-9-2018','21:16:16'),('Admin','root','23-9-2018','21:18:43'),('Admin','root','23-9-2018','21:56:52'),('Customer','andrew88','23-9-2018','21:57:12'),('Customer','andrew88','23-9-2018','22:08:10');
/*!40000 ALTER TABLE `Login_History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment` (
  `Payment_id` int(50) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `bookingId` int(50) DEFAULT NULL,
  PRIMARY KEY (`Payment_id`),
  KEY `bookingId` (`bookingId`),
  CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`bookingId`) REFERENCES `Booking` (`bookingId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (1,'Credit Card','P',5),(2,'Credit Card','Paid',5),(3,'Credit Card','Paid',6);
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pays`
--

DROP TABLE IF EXISTS `Pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pays` (
  `Payment_id` int(50) DEFAULT NULL,
  `bookingId` int(50) DEFAULT NULL,
  KEY `Payment_id` (`Payment_id`),
  KEY `bookingId` (`bookingId`),
  CONSTRAINT `Pays_ibfk_1` FOREIGN KEY (`Payment_id`) REFERENCES `Payment` (`Payment_id`),
  CONSTRAINT `Pays_ibfk_2` FOREIGN KEY (`bookingId`) REFERENCES `Booking` (`bookingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pays`
--

LOCK TABLES `Pays` WRITE;
/*!40000 ALTER TABLE `Pays` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `userId` varchar(100) NOT NULL,
  `fName` varchar(100) DEFAULT NULL,
  `lName` varchar(100) DEFAULT NULL,
  `emailId` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `registration_Date` varchar(100) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL,
  `reset_Question` varchar(100) DEFAULT NULL,
  `reset_Ans_Type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-23 23:24:27
