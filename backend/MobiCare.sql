CREATE DATABASE  IF NOT EXISTS `mobicare` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mobicare`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mobicare
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `patient_symptoms`
--

DROP TABLE IF EXISTS `patient_symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_symptoms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `symptom` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id_idx` (`patient_id`),
  CONSTRAINT `patient_id` FOREIGN KEY (`patient_id`) REFERENCES `sys_patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_symptoms`
--

LOCK TABLES `patient_symptoms` WRITE;
/*!40000 ALTER TABLE `patient_symptoms` DISABLE KEYS */;
INSERT INTO `patient_symptoms` VALUES (1,1,'Diabetes'),(2,3,'Juandice'),(3,2,'Nausea'),(4,6,'Laryngitis'),(5,5,'Diarrhea'),(6,4,'Pneumonia'),(7,1,'Juandice'),(8,1,'Nausea'),(9,2,'Juandice'),(10,2,'Diabetes'),(11,2,'Diarrhea');
/*!40000 ALTER TABLE `patient_symptoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_admin`
--

DROP TABLE IF EXISTS `sys_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_admin` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `F_Name` varchar(15) NOT NULL,
  `L_Name` varchar(15) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Pass` varchar(450) NOT NULL,
  `Gender` varchar(15) NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `Refresh_Token_Value` varchar(450) DEFAULT NULL,
  `Photo` varchar(200) DEFAULT NULL,
  `Admin_Status` enum('Active','Disabled') NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_admin`
--

LOCK TABLES `sys_admin` WRITE;
/*!40000 ALTER TABLE `sys_admin` DISABLE KEYS */;
INSERT INTO `sys_admin` VALUES (1,'Samer','Hesham','samerhesham12@yahoo.com','$2b$10$wFUF/Xl6XRhkQU2gJIotHeRdobreRT.CT3C34RRzbfs86LQizZbVe','male','1996-12-08','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MywiQWRtaW5fRW1haWxfViI6Im1vaGFtbWVkbW9hdGF6QGdtYWlsLmNvbSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTY4NTczODAzMH0.xh9OFfwX0DHB3emg89omzfZeE7dITOkq9FUmW22iN_s',NULL,'Active');
/*!40000 ALTER TABLE `sys_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_doctor`
--

DROP TABLE IF EXISTS `sys_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_doctor` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Doctor_Status` enum('Active','Disabled') NOT NULL,
  `FUID` varchar(250) DEFAULT NULL,
  `Admin_ID` int NOT NULL,
  `F_Name` varchar(200) NOT NULL,
  `L_Name` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Pass` varchar(250) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Gender` tinyint NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `Specialization` varchar(45) NOT NULL,
  `Phone` varchar(200) NOT NULL,
  `Refresh_Token_Value` varchar(450) DEFAULT NULL,
  `Photo` varchar(200) DEFAULT NULL,
  `Bio` varchar(255) DEFAULT NULL,
  `Video` varchar(255) DEFAULT NULL,
  `Rate` int DEFAULT NULL,
  `Experince` int DEFAULT NULL,
  `PatientsNo` int DEFAULT NULL,
  `ReviewsNo` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_Doctor_Admin1_idx` (`Admin_ID`),
  CONSTRAINT `fk_Doctor_Admin1` FOREIGN KEY (`Admin_ID`) REFERENCES `sys_admin` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_doctor`
--

LOCK TABLES `sys_doctor` WRITE;
/*!40000 ALTER TABLE `sys_doctor` DISABLE KEYS */;
INSERT INTO `sys_doctor` VALUES (1,'Active','null',1,'Doaa','Saad','doaasaad@mobicare.com','$2b$10$wFUF/Xl6XRhkQU2gJIotHeRdobreRT.CT3C34RRzbfs86LQizZbVe','Cairo, Egypt',0,'1980-05-14','IS','01119419577','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MiwiUGF0aWVudF9FbWFpbF9WIjoidGVzdEB5YWFhYWFhaG8uY29tIiwicm9sZSI6IlBBVElFTlQiLCJpYXQiOjE2ODI2ODc1NDd9.4DUyc2ZQqu7IzWUny8wQR2utM7u-w_hL-R9c58ugh6g','null','We are the ones to keep you healthy','null',5,15,985,1300),(2,'Active','null',1,'Mona','Nasr','monanasr@mobicare.com','$2b$10$wFUF/Xl6XRhkQU2gJIotHeRdobreRT.CT3C34RRzbfs86LQizZbVe','Cairo, Egypt',0,'1979-05-15','CS','01155111766','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MiwiUGF0aWVudF9FbWFpbF9WIjoidGVzdEB5YWFhYWFhaG8uY29tIiwicm9sZSI6IlBBVElFTlQiLCJpYXQiOjE2ODI2ODc1NDd9.4DUyc2ZQqu7IzWUny8wQR2utM7u-w_hL-R9c58ugh6g','null','I won’t let you suffer with your illness.','null',5,14,843,1500);
/*!40000 ALTER TABLE `sys_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_note`
--

DROP TABLE IF EXISTS `sys_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_note` (
  `Note_ID` int NOT NULL AUTO_INCREMENT,
  `Patient_ID` int NOT NULL,
  `Doctor_ID` int NOT NULL,
  `NoteContent` varchar(300) DEFAULT NULL,
  `Creation_Date` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Note_ID`),
  KEY `fk_note_doctor_id_idx` (`Doctor_ID`),
  KEY `fk_note_patient_id_idx` (`Patient_ID`),
  CONSTRAINT `fk_note_doctor_id` FOREIGN KEY (`Doctor_ID`) REFERENCES `sys_doctor` (`ID`),
  CONSTRAINT `fk_note_patient_id` FOREIGN KEY (`Patient_ID`) REFERENCES `sys_patient` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_note`
--

LOCK TABLES `sys_note` WRITE;
/*!40000 ALTER TABLE `sys_note` DISABLE KEYS */;
INSERT INTO `sys_note` VALUES (1,1,1,'Alf Slama ya fares','2020-01-21'),(2,2,2,'Alf Slama ya moataz','2022-05-26'),(3,3,2,'Alf Slama ya omar','2022-06-28'),(4,4,2,'Alf Slama ya gerges','2023-04-26'),(5,5,1,'Alf Slama ya reem','2023-05-27'),(6,6,1,'Alf Slama ya heba','2023-06-10');
/*!40000 ALTER TABLE `sys_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_patient`
--

DROP TABLE IF EXISTS `sys_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_patient` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Patient_Status` enum('Active','Disabled') NOT NULL,
  `FUID` varchar(250) DEFAULT NULL,
  `F_Name` varchar(15) NOT NULL,
  `L_Name` varchar(15) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Pass` varchar(250) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Gender` tinyint NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `Weight` int DEFAULT NULL,
  `Height` int DEFAULT NULL,
  `Refresh_Token_Value` varchar(450) DEFAULT NULL,
  `Photo` varchar(200) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_patient`
--

LOCK TABLES `sys_patient` WRITE;
/*!40000 ALTER TABLE `sys_patient` DISABLE KEYS */;
INSERT INTO `sys_patient` VALUES (1,'Active','null','Fares','Hesham','fareshesham@gmail.com','$2b$10$wFUF/Xl6XRhkQU2gJIotHeRdobreRT.CT3C34RRzbfs86LQizZbVe','Cairo, Egypt',1,'2001-04-26',83,183,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MiwiUGF0aWVudF9FbWFpbF9WIjoidGVzdEB5YWFhYWFhaG8uY29tIiwicm9sZSI6IlBBVElFTlQiLCJpYXQiOjE2ODI2ODc1NDd9.4DUyc2ZQqu7IzWUny8wQR2utM7u-w_hL-R9c58ugh6g','null','01119419579'),(2,'Active','null','Mohamed','Moataz','mohammedmoataz@gmail.com','$2b$10$wFUF/Xl6XRhkQU2gJIotHeRdobreRT.CT3C34RRzbfs86LQizZbVe','Giza, Egypt',1,'2001-02-14',70,177,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MiwiUGF0aWVudF9FbWFpbF9WIjoidGVzdEB5YWFhYWFhaG8uY29tIiwicm9sZSI6IlBBVElFTlQiLCJpYXQiOjE2ODI2ODc1NDd9.4DUyc2ZQqu7IzWUny8wQR2utM7u-w_hL-R9c58ugh6g','null','01224587961'),(3,'Active','null','Omar','Anas','omaranas@gmail.com','$2b$10$wFUF/Xl6XRhkQU2gJIotHeRdobreRT.CT3C34RRzbfs86LQizZbVe','Damanhour, Egypt',1,'2001-06-26',80,190,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MiwiUGF0aWVudF9FbWFpbF9WIjoidGVzdEB5YWFhYWFhaG8uY29tIiwicm9sZSI6IlBBVElFTlQiLCJpYXQiOjE2ODI2ODc1NDd9.4DUyc2ZQqu7IzWUny8wQR2utM7u-w_hL-R9c58ugh6g','null','01002567423'),(4,'Active','null','Gerges','Melad','gergesmelad@gmail.com','$2b$2b$2b$2b$10$wFUF/Xl6XRhkQU2gJIotHeRdobreRT.CT3C34RRzbfs86LQizZbVe','Tanta, Egypt',1,'2000-07-18',65,160,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MiwiUGF0aWVudF9FbWFpbF9WIjoidGVzdEB5YWFhYWFhaG8uY29tIiwicm9sZSI6IlBBVElFTlQiLCJpYXQiOjE2ODI2ODc1NDd9.4DUyc2ZQqu7IzWUny8wQR2utM7u-w_hL-R9c58ugh6g','null','01224711984'),(5,'Active','null','Reem','Hesham','reemhesham@gmail.com','$2b$2b$2b$10$wFUF/Xl6XRhkQU2gJIotHeRdobreRT.CT3C34RRzbfs86LQizZbVe','Alex, Egypt',0,'2001-09-22',70,165,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MiwiUGF0aWVudF9FbWFpbF9WIjoidGVzdEB5YWFhYWFhaG8uY29tIiwicm9sZSI6IlBBVElFTlQiLCJpYXQiOjE2ODI2ODc1NDd9.4DUyc2ZQqu7IzWUny8wQR2utM7u-w_hL-R9c58ugh6g','null','01155111722'),(6,'Active','null','Heba','Adel','hebaadel@gmail.com','$2b$2b$10$wFUF/Xl6XRhkQU2gJIotHeRdobreRT.CT3C34RRzbfs86LQizZbVe','Giza, Egypt',0,'2001-08-01',60,170,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MiwiUGF0aWVudF9FbWFpbF9WIjoidGVzdEB5YWFhYWFhaG8uY29tIiwicm9sZSI6IlBBVElFTlQiLCJpYXQiOjE2ODI2ODc1NDd9.4DUyc2ZQqu7IzWUny8wQR2utM7u-w_hL-R9c58ugh6g','null','01002187871');
/*!40000 ALTER TABLE `sys_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_patient_has_doctor`
--

DROP TABLE IF EXISTS `sys_patient_has_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_patient_has_doctor` (
  `Patient_Doctor_ID` int NOT NULL AUTO_INCREMENT,
  `Patient_ID` int NOT NULL,
  `Doctor_ID` int NOT NULL,
  PRIMARY KEY (`Patient_Doctor_ID`),
  UNIQUE KEY `no_duplicates` (`Patient_ID`,`Doctor_ID`),
  KEY `fk_Patient_has_Doctor_Doctor1_idx` (`Doctor_ID`),
  KEY `fk_Patient_has_Doctor_Patient1_idx` (`Patient_ID`),
  CONSTRAINT `fk_Patient_has_Doctor_Doctor1` FOREIGN KEY (`Doctor_ID`) REFERENCES `sys_doctor` (`ID`),
  CONSTRAINT `fk_Patient_has_Doctor_Patient1` FOREIGN KEY (`Patient_ID`) REFERENCES `sys_patient` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_patient_has_doctor`
--

LOCK TABLES `sys_patient_has_doctor` WRITE;
/*!40000 ALTER TABLE `sys_patient_has_doctor` DISABLE KEYS */;
INSERT INTO `sys_patient_has_doctor` VALUES (1,1,1),(7,1,2),(2,2,2),(15,3,1),(16,4,1),(5,5,1),(17,5,2),(18,6,2);
/*!40000 ALTER TABLE `sys_patient_has_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_videos`
--

DROP TABLE IF EXISTS `sys_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_videos` (
  `Video_ID` int NOT NULL AUTO_INCREMENT,
  `Doctor_ID` int NOT NULL,
  `Video_URL` varchar(45) NOT NULL,
  `Video_Desc` varchar(45) NOT NULL,
  `CreationDate` varchar(45) NOT NULL,
  PRIMARY KEY (`Video_ID`),
  KEY `FK_DOCTOR_VIDEO_idx` (`Doctor_ID`),
  CONSTRAINT `fk_doctor_videos` FOREIGN KEY (`Doctor_ID`) REFERENCES `sys_doctor` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_videos`
--

LOCK TABLES `sys_videos` WRITE;
/*!40000 ALTER TABLE `sys_videos` DISABLE KEYS */;
INSERT INTO `sys_videos` VALUES (1,1,'https://www.youtube.com/watch?v=Hlokl_9EQ7s','rheumatism','2023-01-22'),(2,2,'https://www.youtube.com/watch?v=w7TLdyQgzbY','How to act with an unconscious person','2023-02-01'),(3,2,'https://www.youtube.com/watch?v=BvdwbjPQqpk','Cardiopulmonary resuscitation for adults','2023-05-31'),(4,1,'https://www.youtube.com/watch?v=aKYzo9ovPR8','hypertensive emergency','2023-06-09'),(5,2,'https://www.youtube.com/watch?v=WnueS58cVHQ','Breathing','2023-06-14');
/*!40000 ALTER TABLE `sys_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mobicare'
--

--
-- Dumping routines for database 'mobicare'
--
/*!50003 DROP PROCEDURE IF EXISTS `ADD_NEW_ADMIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `ADD_NEW_ADMIN`(
F_Name_V varchar(15),
L_Name_V  varchar(15),
Email_V  varchar(45),
Pass_V  varchar(45),
Gender_V  varchar(15),
DOB_V  varchar(10),
Photo_V  varchar(200)
)
BEGIN
insert into sys_Admin(
Admin_Status,
F_Name,
L_Name,
Email,
Pass, 
Gender,
DOB,
Photo

)VALUES(
'Active',
F_Name_V ,
L_Name_V ,
Email_V ,
Pass_V, 
Gender_V ,
DOB_V,
Photo_V
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADD_NEW_ADMIN_PHONES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `ADD_NEW_ADMIN_PHONES`(
Admin_ID_V int(11),
Admin_Phones_V  int(11)
)
BEGIN
insert into sys_Admin_Phones(
Admin_ID,
Admin_Phones

)VALUES(
Admin_ID_V, 
Admin_Phones_V);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADD_NEW_DOCTOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `ADD_NEW_DOCTOR`(
Admin_ID_V int(11),
F_Name_V varchar(15),
L_Name_V  varchar(15),
Email_V  VARCHAR(200),
Pass_V   VARCHAR(250),
Address_V  VARCHAR(200),
Gender_V  TINYINT(4),
DOB_V  varchar(10),
Specialization_V  varchar(45),
Phone_V  VARCHAR(200),
Photo_V VARCHAR(200)
)
BEGIN
insert into sys_Doctor(
Doctor_Status,
Admin_ID,
F_Name,
L_Name,
Email,
Pass,
Address, 
Gender,
DOB,
Specialization,
Phone,
Photo,
Rate,
Experince,
PatientsNo,
ReviewsNo

)VALUES(
'Active',
Admin_ID_V,
F_Name_V ,
L_Name_V ,
Email_V ,
Pass_V,
Address_V, 
Gender_V ,
DOB_V,
Specialization_V ,  
Phone_V,
Photo_V,
FLOOR(RAND()*6)  ,
FLOOR(RAND()*(10-5+1)+5) ,
FLOOR(RAND()*(10)+7) ,
FLOOR(RAND()*(15)+5) 
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADD_NEW_PATIENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `ADD_NEW_PATIENT`(
F_Name_V varchar(15),
L_Name_V  varchar(15),
Email_V  varchar(45),
Pass_V  varchar(450),
Address_V  varchar(45),
Phone_V varchar(15),
Gender_V  varchar(15),
DOB_V  varchar(10)
)
BEGIN
insert into sys_Patient(
Patient_Status,
F_Name,
L_Name,
Email,
Pass,
Address,
Phone, 
Gender,
DOB

)VALUES(
'Active',
F_Name_V ,
L_Name_V ,
Email_V ,
Pass_V,
Address_V, 
Phone_V,
Gender_V ,
DOB_V
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADD_NEW_PATIENTS_has_DOCTOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `ADD_NEW_PATIENTS_has_DOCTOR`(
Patient_ID_V int(11),
Doctor_ID_V int(11)
)
BEGIN
insert into sys_Patient_has_Doctor(
Patient_ID,
Doctor_ID

)VALUES(
Patient_ID_V, 
Doctor_ID_V);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EDIT_ADMIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `EDIT_ADMIN`(
ID_V int(11),
F_Name_V varchar(15),
L_Name_V  varchar(15),
Email_V  varchar(45),
Pass_V  varchar(45),
Gender_V  varchar(15),
DOB_V  varchar(10),
Photo_V  varchar(200)
)
BEGIN
update sys_Admin
set
    F_Name = IFNULL(F_Name_V,F_Name),
	L_Name = IFNULL(L_Name_V,L_Name),
	Email = IFNULL(Email_V,Email),
	Pass = IFNULL(Pass_V,Pass),
	Gender = IFNULL(Gender_V,Gender),
	DOB = IFNULL(DOB_V,DOB),
    Photo = IFNULL(Photo_V,Photo)
    where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EDIT_DOCTOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `EDIT_DOCTOR`(
ID_V int(11),
FUID_V VARCHAR(250),
Status_V varchar(30),
Admin_ID_V int(11),
F_Name_V varchar(15),
L_Name_V  varchar(15),
Email_V  varchar(45),
Pass_V  VARCHAR(250),
Address_V  varchar(45),
Gender_V  varchar(15),
DOB_V  varchar(10),
Specialization_V  varchar(45),
Phone_V  int(11),
Photo_V VARCHAR(200),
Video_V VARCHAR(200),
Bio_V VARCHAR(250)

)
BEGIN
update sys_Doctor
set
	FUID = IFNULL(FUID_V,FUID),
	Doctor_Status = IFNULL(Status_V,Doctor_Status),
    Admin_ID = IFNULL(Admin_ID_V,Admin_ID),
    F_NAME = IFNULL(F_NAME_V,F_NAME),
	L_NAME = IFNULL(L_NAME_V,L_NAME),
	Email = IFNULL(Email_V,Email),
    Pass = IFNULL(Pass_V,Pass),
	Address = IFNULL(Address_V,Address),
	Gender = IFNULL(Gender_V,Gender),
	DOB = IFNULL(DOB_V,DOB),
	Specialization = IFNULL(Specialization_V,Specialization),
	Phone = IFNULL(Phone_V,Phone),
    Photo = IFNULL(Photo_V,Photo),
    Video = IFNULL(Video_V,Video),
    Bio = IFNULL(Bio_V,Bio)
    where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EDIT_Patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `EDIT_Patient`(
ID_V int(11),
FUID_V VARCHAR(250),
Status_V varchar(30),
F_Name_V varchar(15),
L_Name_V  varchar(15),
Email_V  varchar(45),
Pass_V  varchar(250),
Address_V  varchar(45),
Phone_V varchar(15),
DOB_V  varchar(10),
Weight_V  INT(11),
Height_V  INT(11),
Photo_V varchar(200)
)
BEGIN
update sys_Patient
set
	FUID = IFNULL(FUID_V,FUID),
    Patient_Status = IFNULL(Status_V,Patient_Status),
    F_NAME = IFNULL(F_NAME_V,F_NAME),
	L_NAME = IFNULL(L_NAME_V,L_NAME),
	Email = IFNULL(Email_V,Email),
    Pass = IFNULL(Pass_V,Pass),
	Address = IFNULL(Address_V,Address),
    Phone = IFNULL(Phone_V,Phone),
	DOB = IFNULL(DOB_V,DOB),
	Weight= IFNULL(Weight_V,Weight),
	Height = IFNULL(Height_V,Height),
	Photo = IFNULL(Photo_V,Photo)
    where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_ADMIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_ADMIN`(ID_V int)
BEGIN
select * from sys_Admin where ID = ID_V; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_ADMIN_REFRESHTOKEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_ADMIN_REFRESHTOKEN`(ID_V int)
BEGIN
select Refresh_Token_Value from sys_admin where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_ALL_Admins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_ALL_Admins`( OFFSET_V int, ROWS_PER_PAGE_V int)
BEGIN
select * from sys_Admin LIMIT OFFSET_V, ROWS_PER_PAGE_V ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_ALL_DOCTORS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_ALL_DOCTORS`( OFFSET_V int , ROWS_PER_PAGE_V int )
BEGIN
select * from sys_Doctor LIMIT OFFSET_V ,ROWS_PER_PAGE_V ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_ALL_PATIENTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_ALL_PATIENTS`( OFFSET_V int , ROWS_PER_PAGE_V int )
BEGIN
select * from sys_Patient LIMIT OFFSET_V, ROWS_PER_PAGE_V ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_ALL_PATIENTS_has_DOCTORS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_ALL_PATIENTS_has_DOCTORS`( OFFSET_V int , ROWS_PER_PAGE_V int )
BEGIN
select * from sys_Patient_has_Doctor LIMIT OFFSET_V ,ROWS_PER_PAGE_V ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_DOCTOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_DOCTOR`(ID_V int)
BEGIN
select * from sys_Doctor where ID = ID_V; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_DOCTOR_HAS_PATIENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_DOCTOR_HAS_PATIENT`(Doctor_ID_V int)
BEGIN
select * from sys_Patient_has_Doctor where Doctor_ID = Doctor_ID_V; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_DOCTOR_REFRESHTOKEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_DOCTOR_REFRESHTOKEN`(ID_V int)
BEGIN
select Refresh_Token_Value from sys_doctor where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_PATIENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_PATIENT`(ID_V int)
BEGIN
select * from sys_Patient where ID = ID_V; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_PATIENT_HAS_DOCTOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_PATIENT_HAS_DOCTOR`(Patient_ID_V int)
BEGIN
select * from sys_Patient_has_Doctor where Patient_ID = Patient_ID_V; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_PATIENT_REFRESHTOKEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_PATIENT_REFRESHTOKEN`(ID_V int)
BEGIN
select Refresh_Token_Value from sys_patient where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LOGIN_ADMIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `LOGIN_ADMIN`(
     Email_V  VARCHAR(50),
     hashed_password_v  VARCHAR(250)
)
BEGIN

SELECT *  FROM sys_admin
      WHERE  Email = Email_V   
      and  pass = hashed_password_v;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LOGIN_DOCTOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `LOGIN_DOCTOR`(
     Email_V  VARCHAR(50),
     hashed_password_v  VARCHAR(250)
)
BEGIN

SELECT *  FROM sys_doctor
      WHERE  Email = Email_V   
      and  pass = hashed_password_v;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LOGIN_PATIENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `LOGIN_PATIENT`(
     Email_V  VARCHAR(50),
     hashed_password_v  VARCHAR(250)
)
BEGIN

SELECT *  FROM sys_patient
      WHERE  Email = Email_V   
      and  pass = hashed_password_v;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_ADMIN_REFRESHTOKEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `UPDATE_ADMIN_REFRESHTOKEN`(ID_V int, Refresh_Token_Value_V varchar(450))
BEGIN
update sys_admin
	set
		Refresh_Token_Value = Refresh_Token_Value_V
		where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_DOCTOR_REFRESHTOKEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `UPDATE_DOCTOR_REFRESHTOKEN`(ID_V int, Refresh_Token_Value_V varchar(450))
BEGIN
update sys_doctor
	set
		Refresh_Token_Value = Refresh_Token_Value_V
		where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_PATIENT_REFRESHTOKEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `UPDATE_PATIENT_REFRESHTOKEN`(ID_V int, Refresh_Token_Value_V varchar(450))
BEGIN
update sys_patient
	set
		Refresh_Token_Value = Refresh_Token_Value_V
		where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-14  0:54:15
