-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: orrs
-- ------------------------------------------------------
-- Server version	8.0.40

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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phone_number` bigint NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Darshan PM','Bhatkal','2002-08-26','Male',6360364431,'darshan@gmail.com','12345678');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Narendra DP','Davanagere','2002-11-17','Male','9845027972','nari@gmail.com','12345678'),(2,'Harshitha PM','Bhatkal','2001-04-02','Female','8088944065','harshitha@gmail.com','12345678'),(3,'Keshav Moger','Bhatkal','1999-06-16','Male','9353077530','keshav@gmail.com','12345678'),(4,'Aishu','Madikeri','2003-05-26','Female','9902400204','aishu@gmail.com','12345678'),(5,'Abhi Shetty','Shivamogga','2002-03-25','Male','7022734655','abhi@gmail.com','12345678');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pass_id` int NOT NULL,
  `pass_name` varchar(50) NOT NULL,
  `pass_phno` varchar(15) NOT NULL,
  `train_id` int NOT NULL,
  `train_no` varchar(50) NOT NULL,
  `train_name` varchar(50) NOT NULL,
  `train_dep` varchar(50) NOT NULL,
  `train_arr` varchar(50) NOT NULL,
  `train_dep_date` date NOT NULL,
  `train_dep_time` time NOT NULL,
  `train_arr_date` date NOT NULL,
  `train_arr_time` time NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_code` varchar(200) NOT NULL,
  `confirmation` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pass_id` (`pass_id`),
  KEY `train_id` (`train_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`pass_id`) REFERENCES `passenger` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,'Narendra DP','9845027972',1,'72385','Basava Express','Banglore','Mangalore','2025-03-10','08:00:00','2025-03-10','12:30:00',1500.00,'PAY123456','Confirmed'),(2,2,'Harshitha PM','8088944065',2,'67890','Super Fast','Bhatkal','Karwar','2025-03-15','15:45:00','2025-03-15','21:00:00',180.00,'PAY987654','Confirmed'),(3,3,'Keshav Moger','9353077530',3,'11223','Metro Express','Chitradurga','Tumkur','2025-03-20','06:15:00','2025-03-20','10:45:00',135.00,'PAY567890','Confirmed'),(4,4,'Aishu','9902400204',4,'63415','Udupi Express','Udupi','Mangalore','2025-04-11','08:00:00','2025-04-11','10:00:00',100.00,'PAY345678','Confirmed'),(5,5,'Abhi Shetty','7022734655',6,'90342','Dandeli Express','Dandeli','Ankola','2025-04-22','06:05:00','2025-04-22','10:45:00',150.00,'PAY112233','Confirmed'),(6,1,'Narendra DP','9845027972',8,'31245','Banglore Express','Banglore','Mangalore','2025-03-10','16:00:00','2025-03-10','02:30:00',1400.00,'PAY224466','Confirmed');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `departure` varchar(50) NOT NULL,
  `arrival` varchar(50) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_date` date NOT NULL,
  `arrival_time` time NOT NULL,
  `seats_available` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,'72385','Basava Express','Banglore','Mangalore','2025-03-10','08:00:00','2025-03-10','12:30:00',40,1500.00),(2,'67890','Super Fast','Bhatkal','Karwar','2025-03-15','15:45:00','2025-03-15','21:00:00',23,180.00),(3,'11223','Metro Express','Chitradurga','Tumkur','2025-03-20','06:15:00','2025-03-20','10:45:00',0,135.00),(4,'63415','Udupi Express','Udupi','Mangalore','2025-04-11','08:00:00','2025-04-11','10:00:00',80,100.00),(5,'80956','Kundapura Express','Kundapura','Kumuta','2025-04-25','05:45:00','2025-04-25','23:00:00',48,180.00),(6,'90342','Dandeli Express','Dandeli','Ankola','2025-04-22','06:05:00','2025-04-22','10:45:00',58,150.00),(7,'44556','Night Rider','Shivamogga','Banglore','2025-03-25','23:30:00','2025-03-26','06:00:00',60,2200.00),(8,'31245','Banglore Express','Banglore','Mangalore','2025-03-10','16:00:00','2025-03-10','02:30:00',31,1400.00),(9,'80901','Udupi Express','Udupi','Mangalore','2025-04-11','15:45:00','2025-04-14','19:30:00',0,180.00),(10,'32143','Ganga Express','Chitradurga','Tumkur','2025-03-20','16:30:00','2025-03-20','20:45:00',85,1200.00);
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-20 20:18:51
