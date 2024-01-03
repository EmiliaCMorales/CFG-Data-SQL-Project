CREATE DATABASE  IF NOT EXISTS `getaways` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `getaways`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: getaways
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Temporary view structure for view `bookingdetails2`
--

DROP TABLE IF EXISTS `bookingdetails2`;
/*!50001 DROP VIEW IF EXISTS `bookingdetails2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bookingdetails2` AS SELECT 
 1 AS `Booking_ID`,
 1 AS `Customer_ID`,
 1 AS `CustomerName`,
 1 AS `Agent_ID`,
 1 AS `AgentName`,
 1 AS `Date_of_journey`,
 1 AS `Destination`,
 1 AS `Mode_of_transport`,
 1 AS `No_of_persons`,
 1 AS `Price`,
 1 AS `Package_ID`,
 1 AS `Season`,
 1 AS `Activity`,
 1 AS `Location`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `Booking_ID` varchar(20) NOT NULL,
  `CUSTOMER_ID` int DEFAULT NULL,
  `Agent_ID` int DEFAULT NULL,
  `Date_of_journey` date DEFAULT NULL,
  `Destination` varchar(20) DEFAULT NULL,
  `Mode_of_transport` varchar(25) DEFAULT NULL,
  `Transport_ID` varchar(10) DEFAULT NULL,
  `No_of_persons` int DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`Booking_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `Agent_ID` (`Agent_ID`),
  KEY `Transport_ID` (`Transport_ID`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customers` (`CUSTOMER_ID`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`Agent_ID`) REFERENCES `travelagents` (`Agent_ID`),
  CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`Transport_ID`) REFERENCES `transport` (`Transport_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES ('ADM021',1,105,'2024-06-09','Amsterdam','Eurorail','AM3',2,900),('CAI024',6,102,'2024-02-12','Cairo','Air','CI8',2,850),('LON008',2,103,'2024-07-01','London','Eurorail','LD21',1,300),('MX010',5,104,'2023-10-28','Mexico City','Air','MX17',5,1000),('NY005',3,103,'2024-06-25','New York','Air','NY11',2,650),('NY015',8,101,'2024-01-15','New York','Air','NY11',3,1250),('QUI011',9,105,'2024-08-30','Quito','Air','QU14',1,400);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CUSTOMER_ID` int NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John','Doe','john.doe@example.com','123-456-7890'),(2,'Jane','Smith','jane.smith@example.com','987-654-3210'),(3,'Bob','Johnson','bob.johnson@example.com','555-123-4567'),(4,'Alice','Williams','alice.williams@example.com','333-999-8888'),(5,'Charlie','Brown','charlie.brown@example.com','111-222-3333'),(6,'Eva','Miller','eva.miller@example.com','777-888-9999'),(7,'David','Clark','david.clark@example.com','444-555-6666'),(8,'Sophia','Lee','sophia.lee@example.com','999-888-7777'),(9,'Daniel','Wilson','daniel.wilson@example.com','222-333-4444'),(10,'Olivia','Moore','olivia.moore@example.com','666-777-8888'),(11,'Liam','Anderson','liam.anderson@example.com','888-999-0000'),(12,'Ava','Thomas','ava.thomas@example.com','444-333-2222');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `Hotel_ID` varchar(20) NOT NULL,
  `HotelName` varchar(100) NOT NULL,
  `HotelAddress` varchar(255) DEFAULT NULL,
  `RoomsAvailable` tinyint(1) DEFAULT '1',
  `City` varchar(100) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) NOT NULL,
  PRIMARY KEY (`Hotel_ID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `idx_city` (`City`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES ('CLI','City Lights Inn','Herengracht 341, 1016 AZ',1,'Amsterdam','info@citylights.nl','+310205550222'),('ESR','Eternal Sunshine Resort','Jl. Gunung Soputan No.88, Bali - Indonesia, 80361',1,'Denpasar','stay@eternalsunshine.com','+623618466220'),('GOH','Golden Oasis Hotel','234 Desert Highway',1,'Cairo','reservation.cairo@go.com','+20227980000'),('GPH','Grand Plaza Hotel','123 Main Street',1,'New York','bookings@grandplaza.com','+15551234567'),('MVL','Mountain View Lodge','Av. Gonzalez Suarez N27-142',1,'Quito','reservaciones@mountainview.ec','+59323964900'),('SRE','Sunset Resort','Orizaba 95, Roma Norte, CDMX 6700,',1,'Mexico City','reservaciones@sunsetresort.com','+552345678'),('URH','Urban Retreat Hotel','Bedford Avenue, London WC1B 3GH',1,'London','bookings@urbanretreat.co.uk','02084571254');
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `Payment_ID` int NOT NULL,
  `Booking_ID` varchar(20) DEFAULT NULL,
  `Payment_Date` date DEFAULT NULL,
  `Amount` decimal(10,0) DEFAULT NULL,
  `Payment_method` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `Booking_ID` (`Booking_ID`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`Booking_ID`) REFERENCES `bookings` (`Booking_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (111,'ADM021','2023-12-12',900,'credit_card'),(222,'LON008','2023-12-05',300,'credit_Card'),(333,'MX010','2023-11-30',1000,'bank_transfer'),(444,'NY015','2023-12-10',1250,'bank_transfer'),(555,'CAI024','2023-12-06',850,'credit_card');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `Room_ID` int NOT NULL,
  `Hotel_ID` varchar(20) DEFAULT NULL,
  `RoomType` varchar(20) DEFAULT NULL,
  `RoomRate` decimal(5,2) DEFAULT NULL,
  `Status` varchar(20) DEFAULT 'Available',
  `CUSTOMER_ID` int DEFAULT NULL,
  PRIMARY KEY (`Room_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `fk_Hotel_ID` (`Hotel_ID`),
  CONSTRAINT `fk_Hotel_ID` FOREIGN KEY (`Hotel_ID`) REFERENCES `hotels` (`Hotel_ID`) ON UPDATE CASCADE,
  CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customers` (`CUSTOMER_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (123,'SRE','Single',25.00,'Available',NULL),(222,'CLI','Double',100.00,'Available',NULL),(238,'GPH','Single',200.00,'Occupied',3),(333,'CLI','Single',70.00,'Occupied',1),(444,'GOH','Single',30.00,'Available',NULL),(456,'MVL','Double',50.00,'Occupied',9),(543,'URH','Villa',500.00,'Available',NULL),(564,'GPH','Double',300.00,'Occupied',8),(678,'URH','Double',250.00,'Occupied',2),(789,'SRE','Villa',40.00,'Occupied',5),(876,'ESR','Double',75.00,'Available',NULL),(888,'GOH','Villa',50.00,'Occupied',6),(890,'MVL','Villa',70.00,'Available',NULL),(901,'ESR','Single',50.00,'Available',NULL);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_packages`
--

DROP TABLE IF EXISTS `season_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `season_packages` (
  `Package_ID` varchar(10) NOT NULL,
  `Season` varchar(50) DEFAULT NULL,
  `Agent_ID` int DEFAULT NULL,
  `Activity` varchar(50) DEFAULT NULL,
  `Location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Package_ID`),
  KEY `Agent_ID` (`Agent_ID`),
  CONSTRAINT `season_packages_ibfk_1` FOREIGN KEY (`Agent_ID`) REFERENCES `travelagents` (`Agent_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_packages`
--

LOCK TABLES `season_packages` WRITE;
/*!40000 ALTER TABLE `season_packages` DISABLE KEYS */;
INSERT INTO `season_packages` VALUES ('PKG1','WINTER',101,'Adventure','Amsterdam'),('PKG2','WINTER',102,'Luxury','New York'),('PKG3','AUTUMN',104,'Spa','Mexico City'),('PKG4','AUTUMN',105,'Luxury','Denpasar'),('PKG5','SUMMER',101,'Safari','Quito'),('PKG6','SUMMER',103,'Spa','Denpasar'),('PKG7','SPRING',101,'Adventure','Cairo'),('PKG8','SPRING',102,'Luxury','London');
/*!40000 ALTER TABLE `season_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transport` (
  `Transport_ID` varchar(10) NOT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Transport_type` varchar(25) DEFAULT NULL,
  `Company_name` varchar(50) DEFAULT NULL,
  `Price_per_person` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`Transport_ID`),
  KEY `City` (`City`),
  CONSTRAINT `transport_ibfk_1` FOREIGN KEY (`City`) REFERENCES `hotels` (`City`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES ('AM1','Amsterdam','Bus','CityLink ',10),('AM2','Amsterdam','Air','KLM',150),('AM3','Amsterdam','Rail','Eurorail',25),('CI7','Cairo','Bus','SwiftTrans',5),('CI8','Cairo','Air','Nimbus Flights',100),('CI9','Cairo','Rail','HorizonExpress Rails',10),('DP4','Denpasar','Bus','Travel Ride',2),('DP5','Denpasar','Air','SkyQuest',200),('DP6','Denpasar','Rail','SwiftRail Express',10),('LD19','London','Bus','TFL',10),('LD20','London','Air','British Airways',250),('LD21','London','Rail','Eurorail',20),('MX16','Mexico City','Bus','Urban Transit',5),('MX17','Mexico City','Air','HorizonAir Express',170),('MX18','Mexico City','Rail','InterCity Rail Co',5),('NY10','New York','Bus','SkyHopper',10),('NY11','New York','Air','United Airlines',250),('NY12','New York','Rail','MetroLink Trains',20),('QU13','Quito','Bus','Horizon Busways',2),('QU14','Quito','Air','StarCruise Airlines',150),('QU15','Quito','Rail','CityConnect Railways',10);
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelagents`
--

DROP TABLE IF EXISTS `travelagents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travelagents` (
  `Agent_ID` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `CommisionRate` decimal(5,2) DEFAULT '0.10',
  PRIMARY KEY (`Agent_ID`),
  UNIQUE KEY `Agent_ID` (`Agent_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelagents`
--

LOCK TABLES `travelagents` WRITE;
/*!40000 ALTER TABLE `travelagents` DISABLE KEYS */;
INSERT INTO `travelagents` VALUES (101,'Adam','Smith','smith.adam@getaways.com','07485266890',0.10),(102,'Naushad','Khan','khan.naushad@getaways.com','07265893251',0.10),(103,'Daniel','Hood','hood.daniel@getaways.com','07389456219',0.10),(104,'Abigail','Lawrence','lawrence.abigail@getaways.com','07534210890',0.08),(105,'Roma','Shood','shood.roma@getaways.com','07563210089',0.08);
/*!40000 ALTER TABLE `travelagents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'getaways'
--

--
-- Dumping routines for database 'getaways'
--
/*!50003 DROP FUNCTION IF EXISTS `GetTotalBookingsPerAgent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetTotalBookingsPerAgent`(agentID INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE totalBookings INT;

    SELECT COUNT(*) INTO totalBookings
    FROM Bookings
    WHERE Agent_ID = agentID;

    RETURN totalBookings;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetHotelInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetHotelInfo`(IN hotelID VARCHAR (20))
BEGIN
	SELECT *
    FROM Hotels
    WHERE Hotel_ID = hotelID;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `bookingdetails2`
--

/*!50001 DROP VIEW IF EXISTS `bookingdetails2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bookingdetails2` AS select `b`.`Booking_ID` AS `Booking_ID`,`c`.`CUSTOMER_ID` AS `Customer_ID`,concat(`c`.`FirstName`,' ',`c`.`LastName`) AS `CustomerName`,`b`.`Agent_ID` AS `Agent_ID`,concat(`ta`.`FirstName`,' ',`ta`.`LastName`) AS `AgentName`,`b`.`Date_of_journey` AS `Date_of_journey`,`b`.`Destination` AS `Destination`,`b`.`Mode_of_transport` AS `Mode_of_transport`,`b`.`No_of_persons` AS `No_of_persons`,`b`.`Price` AS `Price`,`sp`.`Package_ID` AS `Package_ID`,`sp`.`Season` AS `Season`,`sp`.`Activity` AS `Activity`,`sp`.`Location` AS `Location` from (((`bookings` `b` join `customers` `c` on((`b`.`CUSTOMER_ID` = `c`.`CUSTOMER_ID`))) join `travelagents` `ta` on((`b`.`Agent_ID` = `ta`.`Agent_ID`))) left join `season_packages` `sp` on((`b`.`Agent_ID` = `sp`.`Agent_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-20 12:00:59
