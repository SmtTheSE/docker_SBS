-- MySQL dump 10.13  Distrib 5.7.24, for osx11.1 (x86_64)
--
-- Host: localhost    Database: SBS_DB
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `dim_admin`
--

DROP TABLE IF EXISTS `dim_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_admin` (
  `admin_id` varchar(50) NOT NULL,
  `account_id` varchar(15) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `jobrole` varchar(10) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `UKabyilo8yl91ovi6lq0ltq0lja` (`account_id`),
  CONSTRAINT `FKasdoe2i4fmqglw7ytih36t4rb` FOREIGN KEY (`account_id`) REFERENCES `dim_login_account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_admin`
--

LOCK TABLES `dim_admin` WRITE;
/*!40000 ALTER TABLE `dim_admin` DISABLE KEYS */;
INSERT INTO `dim_admin` VALUES ('ADM001','ACC_ADM_001','DEPT001','leb@sbs.edu.vn','Le',2,'Manager','Thi B','VN'),('ADM002','ACC_ADM_002','DEPT002','dwilson@sbs.edu.vn','David',1,'Officer','Wilson','US'),('ADM003','ACC_ADM_003','DEPT003','nvc@sbs.edu.vn','Nguyen',1,'Accountant','Van C','VN');
/*!40000 ALTER TABLE `dim_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_announcement`
--

DROP TABLE IF EXISTS `dim_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_announcement` (
  `announcement_id` varchar(15) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `announcement_type` varchar(25) NOT NULL,
  `created_at` date NOT NULL,
  `end_date` date NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `start_date` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `updated_at` date NOT NULL,
  `admin_id` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`announcement_id`),
  KEY `FKnejuv2y4ejgod6i44xhl397bd` (`admin_id`),
  CONSTRAINT `FKnejuv2y4ejgod6i44xhl397bd` FOREIGN KEY (`admin_id`) REFERENCES `dim_admin` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_announcement`
--

LOCK TABLES `dim_announcement` WRITE;
/*!40000 ALTER TABLE `dim_announcement` DISABLE KEYS */;
INSERT INTO `dim_announcement` VALUES ('ANN001',_binary '','Emergency','2025-08-01','2025-08-31','http://localhost:8080/uploads/announcements/1762319862452_download.jpeg','2025-08-01','Welcome to Fall 2025 !','2025-11-05','ADM001',NULL),('ANN002',_binary '','Finance','2025-08-10','2025-09-05','http://localhost:8080/uploads/announcements/1762319926855_payment.png','2025-08-10','Reminder: Tuition Payment Deadline Approaching','2025-11-05','ADM003',NULL),('ANN003',_binary '','Event','2025-08-15','2025-09-20','http://localhost:8080/uploads/announcements/1759633240230_example_excel_sheet.png','2025-08-15','Join Us at the Annual Career Fair 2025','2025-10-05','ADM002',NULL),('ANN004',_binary '','Academic','2025-08-18','2025-09-30','http://localhost:8080/uploads/announcements/1762319973147_exam.jpeg','2025-08-18','Final Exam Schedule for Fall 2025 is Out!','2025-11-05','ADM001',NULL),('ANN006',_binary '','System','2025-11-01','2025-11-08','http://localhost:8080/uploads/announcements/1761997607576_Untitled_Project2.png','2025-11-01','SBS project is finally done','2025-11-01','ADM001','fjsdfjdslkjlfdjlfds\nfdsfjklsdjfkjdslfj\nfjlsdjfdsjfsklfdjsf');
/*!40000 ALTER TABLE `dim_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_class_schedule`
--

DROP TABLE IF EXISTS `dim_class_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_class_schedule` (
  `class_schedule_id` varchar(15) NOT NULL,
  `class_date` date DEFAULT NULL,
  `day_of_week` varchar(15) NOT NULL,
  `duration_minutes` int NOT NULL,
  `end_time` time(6) NOT NULL,
  `room` varchar(50) NOT NULL,
  `start_time` time(6) NOT NULL,
  `study_plan_course_id` varchar(15) NOT NULL,
  PRIMARY KEY (`class_schedule_id`),
  KEY `FKoxabh29354rcfua8raq831two` (`study_plan_course_id`),
  CONSTRAINT `FKoxabh29354rcfua8raq831two` FOREIGN KEY (`study_plan_course_id`) REFERENCES `dim_study_plan_course` (`study_plan_course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_class_schedule`
--

LOCK TABLES `dim_class_schedule` WRITE;
/*!40000 ALTER TABLE `dim_class_schedule` DISABLE KEYS */;
INSERT INTO `dim_class_schedule` VALUES ('CS_AUSHM001_FRI','2025-08-22','Friday',120,'15:00:00.000000','Room Brisbane','13:00:00.000000','SPC_AUSHM_001'),('CS_AUSHM001_THU','2025-08-21','Thursday',120,'11:00:00.000000','Room Melbourne','09:00:00.000000','SPC_AUSHM_001'),('CS_AUSHM001_TUE','2025-08-19','Tuesday',120,'11:00:00.000000','Room Sydney','09:00:00.000000','SPC_AUSHM_001'),('CS_AUSHM002_FRI','2025-08-29','Friday',120,'17:00:00.000000','Room Darwin','15:00:00.000000','SPC_AUSHM_002'),('CS_AUSHM002_MON','2025-08-25','Monday',120,'13:00:00.000000','Room Perth','11:00:00.000000','SPC_AUSHM_002'),('CS_AUSHM002_WED','2025-08-27','Wednesday',120,'13:00:00.000000','Room Adelaide','11:00:00.000000','SPC_AUSHM_002'),('CS_AUSHM003_MON','2025-08-18','Monday',120,'12:00:00.000000','Room Kitchen Lab A','10:00:00.000000','SPC_AUSHM_003'),('CS_AUSHM003_WED','2025-08-20','Wednesday',120,'12:00:00.000000','Room Kitchen Lab A','10:00:00.000000','SPC_AUSHM_003'),('CS_AUSHM004_THU','2025-08-28','Thursday',120,'11:00:00.000000','Room Accom Room','09:00:00.000000','SPC_AUSHM_004'),('CS_AUSHM004_TUE','2025-08-26','Tuesday',120,'11:00:00.000000','Room Accom Room','09:00:00.000000','SPC_AUSHM_004'),('CS_AUSHM005_MON','2025-08-18','Monday',90,'14:30:00.000000','Room Front Desk','13:00:00.000000','SPC_AUSHM_005'),('CS_AUSHM005_WED','2025-08-20','Wednesday',90,'14:30:00.000000','Room Front Desk','13:00:00.000000','SPC_AUSHM_005'),('CS_AUSHM006_MON','2025-08-25','Monday',120,'11:00:00.000000','Room Revenue Room','09:00:00.000000','SPC_AUSHM_006'),('CS_AUSHM006_WED',NULL,'Mon',120,'11:00:00.000000','Room Revenue Room','09:00:00.000000','SPC_AUSHM_006'),('CS_AUSHM007_THU','2025-08-21','Thursday',120,'15:00:00.000000','Room Marketing Room','13:00:00.000000','SPC_AUSHM_007'),('CS_AUSHM007_TUE','2025-08-19','Tuesday',120,'15:00:00.000000','Room Marketing Room','13:00:00.000000','SPC_AUSHM_007'),('CS_AUSHM008_THU','2025-08-28','Thursday',120,'15:00:00.000000','Room Wine Cellar','13:00:00.000000','SPC_AUSHM_008'),('CS_AUSHM008_TUE','2025-08-26','Tuesday',120,'15:00:00.000000','Room Wine Cellar','13:00:00.000000','SPC_AUSHM_008'),('CS_AUSHM009_MON','2026-01-12','Monday',90,'10:30:00.000000','Room Green Room','09:00:00.000000','SPC_AUSHM_009'),('CS_AUSHM009_WED','2026-01-14','Wednesday',90,'10:30:00.000000','Room Green Room','09:00:00.000000','SPC_AUSHM_009'),('CS_AUSHM010_MON','2025-09-01','Monday',120,'12:00:00.000000','Room Finance Room','10:00:00.000000','SPC_AUSHM_010'),('CS_AUSHM010_WED','2025-09-03','Wednesday',120,'12:00:00.000000','Room Finance Room','10:00:00.000000','SPC_AUSHM_010'),('CS_AUSHM011_THU','2026-01-15','Thursday',180,'12:00:00.000000','Room Convention Center','09:00:00.000000','SPC_AUSHM_011'),('CS_AUSHM011_TUE','2026-01-13','Tuesday',180,'12:00:00.000000','Room Convention Center','09:00:00.000000','SPC_AUSHM_011'),('CS_AUSHM012_THU','2025-09-04','Thursday',120,'16:00:00.000000','Room Spa Room','14:00:00.000000','SPC_AUSHM_012'),('CS_AUSHM012_TUE','2025-09-02','Tuesday',120,'16:00:00.000000','Room Spa Room','14:00:00.000000','SPC_AUSHM_012'),('CS_AUSHM013_MON','2026-01-12','Monday',90,'14:30:00.000000','Room Law Room','13:00:00.000000','SPC_AUSHM_013'),('CS_AUSHM013_WED','2026-01-14','Wednesday',90,'14:30:00.000000','Room Law Room','13:00:00.000000','SPC_AUSHM_013'),('CS_AUSHM014_THU','2026-05-14','Thursday',120,'12:00:00.000000','Room Travel Desk','10:00:00.000000','SPC_AUSHM_014'),('CS_AUSHM014_TUE','2026-05-12','Tuesday',120,'12:00:00.000000','Room Travel Desk','10:00:00.000000','SPC_AUSHM_014'),('CS_AUSHM015_MON','2026-05-11','Monday',120,'11:00:00.000000','Room Front Desk Advanced','09:00:00.000000','SPC_AUSHM_015'),('CS_AUSHM015_WED','2026-05-13','Wednesday',120,'11:00:00.000000','Room Front Desk Advanced','09:00:00.000000','SPC_AUSHM_015'),('CS_AUSHM016_FRI','2026-09-18','Friday',180,'16:00:00.000000','Room Capstone H','13:00:00.000000','SPC_AUSHM_016'),('CS_AUSHM016_MON','2026-09-14','Monday',180,'16:00:00.000000','Room Capstone H','13:00:00.000000','SPC_AUSHM_016'),('CS_AUSHM016_WED','2026-09-16','Wednesday',180,'16:00:00.000000','Room Capstone H','13:00:00.000000','SPC_AUSHM_016'),('CS_UKDS001_FRI','2025-08-22','Friday',120,'12:00:00.000000','Room Mekong','10:00:00.000000','SPC_UKDS_001'),('CS_UKDS001_MON','2025-08-18','Monday',120,'11:00:00.000000','Room Laos','09:00:00.000000','SPC_UKDS_001'),('CS_UKDS001_TUE',NULL,'Tue',180,'12:00:00.000000','Utah','09:00:00.000000','SPC_UKDS_001'),('CS_UKDS001_WED','2025-08-20','Wednesday',120,'11:00:00.000000','Room Utah','09:00:00.000000','SPC_UKDS_001'),('CS_UKDS002_THU','2025-08-21','Thursday',180,'16:00:00.000000','Room Laos','13:00:00.000000','SPC_UKDS_002'),('CS_UKDS002_TUE','2025-08-19','Tuesday',180,'16:00:00.000000','Room Laos','13:00:00.000000','SPC_UKDS_002'),('CS_UKDS003_FRI','2025-08-29','Friday',120,'11:00:00.000000','Room Hue','09:00:00.000000','SPC_UKDS_003'),('CS_UKDS003_MON','2025-08-25','Monday',120,'12:00:00.000000','Room Saigon','10:00:00.000000','SPC_UKDS_003'),('CS_UKDS003_WED','2025-08-27','Wednesday',120,'12:00:00.000000','Room Hanoi','10:00:00.000000','SPC_UKDS_003'),('CS_UKDS004_THU','2025-09-04','Thursday',180,'12:00:00.000000','Room Big Data Lab','09:00:00.000000','SPC_UKDS_004'),('CS_UKDS004_TUE','2025-09-02','Tuesday',180,'12:00:00.000000','Room Big Data Lab','09:00:00.000000','SPC_UKDS_004'),('CS_UKDS005_MON','2025-08-18','Monday',120,'16:00:00.000000','Room Mekong','14:00:00.000000','SPC_UKDS_005'),('CS_UKDS005_WED','2025-08-20','Wednesday',120,'16:00:00.000000','Room Hue','14:00:00.000000','SPC_UKDS_005'),('CS_UKDS006_THU','2025-08-28','Thursday',120,'16:00:00.000000','Room Mekong','14:00:00.000000','SPC_UKDS_006'),('CS_UKDS006_TUE','2025-08-26','Tuesday',120,'16:00:00.000000','Room Red River','14:00:00.000000','SPC_UKDS_006'),('CS_UKDS007_THU','2025-08-21','Thursday',120,'11:00:00.000000','Room Saigon','09:00:00.000000','SPC_UKDS_007'),('CS_UKDS007_TUE','2025-08-19','Tuesday',120,'11:00:00.000000','Room Utah','09:00:00.000000','SPC_UKDS_007'),('CS_UKDS008_MON','2025-08-25','Monday',120,'15:00:00.000000','Room Laos','13:00:00.000000','SPC_UKDS_008'),('CS_UKDS008_WED','2025-08-27','Wednesday',120,'15:00:00.000000','Room Utah','13:00:00.000000','SPC_UKDS_008'),('CS_UKDS009_THU','2026-01-15','Thursday',180,'13:00:00.000000','Room Cluster A','10:00:00.000000','SPC_UKDS_009'),('CS_UKDS009_TUE','2026-01-13','Tuesday',180,'13:00:00.000000','Room Cluster A','10:00:00.000000','SPC_UKDS_009'),('CS_UKDS010_MON','2026-01-12','Monday',120,'15:00:00.000000','Room Coding Lab 1','13:00:00.000000','SPC_UKDS_010'),('CS_UKDS010_WED','2026-01-14','Wednesday',120,'15:00:00.000000','Room Coding Lab 1','13:00:00.000000','SPC_UKDS_010'),('CS_UKDS011_MON','2026-05-11','Monday',180,'12:00:00.000000','Room AI Lab','09:00:00.000000','SPC_UKDS_011'),('CS_UKDS011_WED','2026-05-13','Wednesday',180,'12:00:00.000000','Room AI Lab','09:00:00.000000','SPC_UKDS_011'),('CS_UKDS012_THU','2026-05-14','Thursday',120,'15:00:00.000000','Room Data Mining Room','13:00:00.000000','SPC_UKDS_012'),('CS_UKDS012_TUE','2026-05-12','Tuesday',120,'15:00:00.000000','Room Data Mining Room','13:00:00.000000','SPC_UKDS_012'),('CS_UKDS013_MON','2026-01-12','Monday',120,'11:00:00.000000','Room Cloud Room','09:00:00.000000','SPC_UKDS_013'),('CS_UKDS013_WED','2026-01-14','Wednesday',120,'11:00:00.000000','Room Cloud Room','09:00:00.000000','SPC_UKDS_013'),('CS_UKDS014_FRI','2026-09-18','Friday',120,'12:00:00.000000','Room Capstone A','10:00:00.000000','SPC_UKDS_014'),('CS_UKDS014_MON','2026-09-14','Monday',120,'12:00:00.000000','Room Capstone A','10:00:00.000000','SPC_UKDS_014'),('CS_UKDS014_WED','2026-09-16','Wednesday',120,'12:00:00.000000','Room Capstone A','10:00:00.000000','SPC_UKDS_014'),('CS_UKDS015_THU','2026-01-15','Thursday',120,'16:00:00.000000','Room Stats Room','14:00:00.000000','SPC_UKDS_015'),('CS_UKDS015_TUE','2026-01-13','Tuesday',120,'16:00:00.000000','Room Stats Room','14:00:00.000000','SPC_UKDS_015'),('CS_UKDS016_MON','2026-05-11','Monday',90,'15:30:00.000000','Room Ethics Seminar Room','14:00:00.000000','SPC_UKDS_016'),('CS_UKDS016_WED','2026-05-13','Wednesday',90,'15:30:00.000000','Room Ethics Seminar Room','14:00:00.000000','SPC_UKDS_016'),('CS_USBM001_FRI','2025-08-22','Friday',120,'16:00:00.000000','Room 104','14:00:00.000000','SPC_USBM_001'),('CS_USBM001_MON','2025-08-18','Monday',120,'12:00:00.000000','Room 101','10:00:00.000000','SPC_USBM_001'),('CS_USBM001_WED','2025-08-20','Wednesday',120,'12:00:00.000000','Room 101','10:00:00.000000','SPC_USBM_001'),('CS_USBM002_FRI','2025-08-29','Friday',180,'12:00:00.000000','Room 203','09:00:00.000000','SPC_USBM_002'),('CS_USBM002_TUE','2025-08-26','Tuesday',180,'17:00:00.000000','Room 201','14:00:00.000000','SPC_USBM_002'),('CS_USBM003_THU','2025-08-21','Thursday',120,'13:00:00.000000','Room 103','11:00:00.000000','SPC_USBM_003'),('CS_USBM003_TUE','2025-08-19','Tuesday',120,'13:00:00.000000','Room 102','11:00:00.000000','SPC_USBM_003'),('CS_USBM004_MON','2025-08-25','Monday',120,'11:00:00.000000','Room 202','09:00:00.000000','SPC_USBM_004'),('CS_USBM004_WED','2025-08-27','Wednesday',120,'11:00:00.000000','Room 202','09:00:00.000000','SPC_USBM_004'),('CS_USBM005_MON','2025-08-18','Monday',120,'15:00:00.000000','Room 105','13:00:00.000000','SPC_USBM_005'),('CS_USBM005_WED','2025-08-20','Wednesday',120,'15:00:00.000000','Room 105','13:00:00.000000','SPC_USBM_005'),('CS_USBM006_MON','2025-08-25','Monday',120,'15:00:00.000000','Room 204','13:00:00.000000','SPC_USBM_006'),('CS_USBM006_WED','2025-08-27','Wednesday',120,'15:00:00.000000','Room 204','13:00:00.000000','SPC_USBM_006'),('CS_USBM007_THU','2025-08-21','Thursday',120,'16:00:00.000000','Room 106','14:00:00.000000','SPC_USBM_007'),('CS_USBM007_TUE','2025-08-19','Tuesday',120,'16:00:00.000000','Room 106','14:00:00.000000','SPC_USBM_007'),('CS_USBM008_FRI','2025-08-29','Friday',120,'15:00:00.000000','Room 205','13:00:00.000000','SPC_USBM_008'),('CS_USBM008_MON','2025-09-01','Monday',120,'13:00:00.000000','Room Law Library','11:00:00.000000','SPC_USBM_008'),('CS_USBM008_TUE','2025-08-26','Tuesday',120,'11:00:00.000000','Room 205','09:00:00.000000','SPC_USBM_008'),('CS_USBM008_WED','2025-09-03','Wednesday',120,'13:00:00.000000','Room Law Library','11:00:00.000000','SPC_USBM_008'),('CS_USBM009_MON','2026-01-12','Monday',120,'11:00:00.000000','Room Global 1','09:00:00.000000','SPC_USBM_009'),('CS_USBM009_WED','2026-01-14','Wednesday',120,'11:00:00.000000','Room Global 1','09:00:00.000000','SPC_USBM_009'),('CS_USBM010_FRI','2025-09-05','Friday',180,'17:00:00.000000','Room PM Room','14:00:00.000000','SPC_USBM_010'),('CS_USBM010_TUE','2025-09-02','Tuesday',180,'17:00:00.000000','Room PM Room','14:00:00.000000','SPC_USBM_010'),('CS_USBM011_THU','2026-01-15','Thursday',120,'12:00:00.000000','Room Econ Room','10:00:00.000000','SPC_USBM_011'),('CS_USBM011_TUE','2026-01-13','Tuesday',120,'12:00:00.000000','Room Econ Room','10:00:00.000000','SPC_USBM_011'),('CS_USBM012_FRI','2026-05-15','Friday',180,'17:00:00.000000','Room PM Room','14:00:00.000000','SPC_USBM_012'),('CS_USBM012_TUE','2026-05-12','Tuesday',180,'17:00:00.000000','Room PM Room','14:00:00.000000','SPC_USBM_012'),('CS_USBM013_MON','2026-01-12','Monday',120,'15:00:00.000000','Room Logistics','13:00:00.000000','SPC_USBM_013'),('CS_USBM013_WED','2026-01-14','Wednesday',120,'15:00:00.000000','Room Logistics','13:00:00.000000','SPC_USBM_013'),('CS_USBM014_MON','2026-05-11','Monday',120,'11:00:00.000000','Room BA Lab','09:00:00.000000','SPC_USBM_014'),('CS_USBM014_WED','2026-05-13','Wednesday',120,'11:00:00.000000','Room BA Lab','09:00:00.000000','SPC_USBM_014'),('CS_USBM015_THU','2026-05-14','Thursday',120,'11:00:00.000000','Room OB Seminar','09:00:00.000000','SPC_USBM_015'),('CS_USBM015_TUE','2026-05-12','Tuesday',120,'11:00:00.000000','Room OB Seminar','09:00:00.000000','SPC_USBM_015'),('CS_USBM016_FRI','2026-09-18','Friday',180,'17:00:00.000000','Room Capstone B','14:00:00.000000','SPC_USBM_016'),('CS_USBM016_MON','2026-09-14','Monday',180,'17:00:00.000000','Room Capstone B','14:00:00.000000','SPC_USBM_016'),('CS_USBM016_WED','2026-09-16','Wednesday',180,'17:00:00.000000','Room Capstone B','14:00:00.000000','SPC_USBM_016');
/*!40000 ALTER TABLE `dim_class_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_course`
--

DROP TABLE IF EXISTS `dim_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_course` (
  `course_id` varchar(20) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `credit_score` int NOT NULL,
  `lecturer_id` varchar(15) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `FKfubql7imegnb7e6jbnc7cx09l` (`lecturer_id`),
  CONSTRAINT `FKfubql7imegnb7e6jbnc7cx09l` FOREIGN KEY (`lecturer_id`) REFERENCES `dim_lecturer` (`lecturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_course`
--

LOCK TABLES `dim_course` WRITE;
/*!40000 ALTER TABLE `dim_course` DISABLE KEYS */;
INSERT INTO `dim_course` VALUES ('COURSE001','Data Analytics',3,'LEC001'),('COURSE002','Programming',3,'LEC001'),('COURSE003','Maths for Computing',3,'LEC002'),('COURSE004','Advanced Data Science',4,'LEC002'),('COURSE005','Business Fundamentals',3,'LEC007'),('COURSE006','Marketing Principles',3,'LEC007'),('COURSE007','Leadership',4,'LEC008'),('COURSE008','Business Ethics',3,'LEC008'),('COURSE009','Hospitality Operations',3,'LEC015'),('COURSE010','Event Management',3,'LEC015'),('COURSE011','Food and Beverage Industry',3,'LEC016'),('COURSE012','Accommodation',3,'LEC016'),('COURSE013','Machine Learning Fundamentals',3,'LEC003'),('COURSE014','Data Visualization',3,'LEC004'),('COURSE015','Database Systems',3,'LEC001'),('COURSE016','Statistics for Data Science',3,'LEC005'),('COURSE017','Big Data Technologies',4,'LEC002'),('COURSE018','Python for Data Analysis',3,'LEC006'),('COURSE019','Artificial Intelligence',4,'LEC003'),('COURSE020','Data Mining',3,'LEC004'),('COURSE021','Cloud Computing for Data',3,'LEC001'),('COURSE022','Capstone Project Data Science',6,'LEC005'),('COURSE023','Time Series Analysis',3,'LEC002'),('COURSE024','Ethics in AI and Data',2,'LEC006'),('COURSE025','Financial Accounting',3,'LEC009'),('COURSE026','Operations Management',3,'LEC010'),('COURSE027','Human Resource Management',3,'LEC007'),('COURSE028','Strategic Management',4,'LEC012'),('COURSE029','International Business',3,'LEC013'),('COURSE030','Business Law',3,'LEC008'),('COURSE031','Economics for Managers',3,'LEC009'),('COURSE032','Project Management',3,'LEC010'),('COURSE033','Supply Chain Management',3,'LEC011'),('COURSE034','Business Analytics',3,'LEC013'),('COURSE035','Organizational Behavior',3,'LEC014'),('COURSE036','Capstone Project Business',6,'LEC012'),('COURSE037','Customer Service Excellence',2,'LEC017'),('COURSE038','Hotel Revenue Management',3,'LEC018'),('COURSE039','Tourism Marketing',3,'LEC015'),('COURSE040','Wine and Beverage Management',3,'LEC021'),('COURSE041','Sustainable Tourism',2,'LEC022'),('COURSE042','Hospitality Finance',3,'LEC019'),('COURSE043','Convention Planning',3,'LEC017'),('COURSE044','Resort and Spa Management',3,'LEC018'),('COURSE045','Hospitality Law and Regulations',2,'LEC020'),('COURSE046','Destination Management',3,'LEC021'),('COURSE047','Front Office Operations',3,'LEC022'),('COURSE048','Capstone Project Hospitality',6,'LEC020'),('COURSE049','Maths 2',120,'LEC005');
/*!40000 ALTER TABLE `dim_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_department`
--

DROP TABLE IF EXISTS `dim_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_department` (
  `department_id` varchar(15) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `head_of_department` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_department`
--

LOCK TABLES `dim_department` WRITE;
/*!40000 ALTER TABLE `dim_department` DISABLE KEYS */;
INSERT INTO `dim_department` VALUES ('DEPT001','Student Services','ss@sbs.edu.vn','Nguyen Thi Hoa'),('DEPT002','Student Advice','academic@sbs.edu.vn','Dr. John Smith'),('DEPT003','Finance','finance@sbs.edu.vn','Le Van Cuong'),('DEPT004','Data Science','datascience@sbs.edu.vn','Mr. Peter'),('DEPT005','Business','business@sbs.edu.vn','Ms. Sarah Jones'),('DEPT006','Hospitality','hospitality@sbs.edu.vn','Ms. Jame');
/*!40000 ALTER TABLE `dim_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_grade`
--

DROP TABLE IF EXISTS `dim_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_grade` (
  `grade_name` varchar(5) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`grade_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_grade`
--

LOCK TABLES `dim_grade` WRITE;
/*!40000 ALTER TABLE `dim_grade` DISABLE KEYS */;
INSERT INTO `dim_grade` VALUES ('D','Distinction'),('F','Fail'),('M','Merit'),('P','Pass');
/*!40000 ALTER TABLE `dim_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_lecturer`
--

DROP TABLE IF EXISTS `dim_lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_lecturer` (
  `lecturer_id` varchar(15) NOT NULL,
  `academic_title` varchar(100) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `name` varchar(100) NOT NULL,
  `teaching_experience` int NOT NULL,
  `department_id` varchar(15) NOT NULL,
  PRIMARY KEY (`lecturer_id`),
  KEY `FKpwb24615nrdjlmbr59v14uxg2` (`department_id`),
  CONSTRAINT `FKpwb24615nrdjlmbr59v14uxg2` FOREIGN KEY (`department_id`) REFERENCES `dim_department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_lecturer`
--

LOCK TABLES `dim_lecturer` WRITE;
/*!40000 ALTER TABLE `dim_lecturer` DISABLE KEYS */;
INSERT INTO `dim_lecturer` VALUES ('LEC001','PhD','1980-03-15','Dr. Alice Johnson',10,'DEPT004'),('LEC002','MSc','1985-07-22','Mr. Tran Quoc Bao',5,'DEPT004'),('LEC003','PhD','1972-08-10','Dr. Michael Chen',18,'DEPT004'),('LEC004','MSc','1984-01-25','Ms. Priya Sharma',6,'DEPT004'),('LEC005','Prof.','1965-04-30','Prof. Robert Williams',25,'DEPT004'),('LEC006','MSc','1989-11-12','Mr. David Kim',3,'DEPT004'),('LEC007','Prof.','1978-11-30','Ms. Le Thi Huong',12,'DEPT005'),('LEC008','PhD','1975-12-05','Dr. Sarah Miller',15,'DEPT005'),('LEC009','PhD','1979-06-18','Dr. Amanda Foster',11,'DEPT005'),('LEC010','MBA','1986-03-07','Mr. James O\'Connor',7,'DEPT005'),('LEC011','MBA','1981-12-03','Ms. Fatima Al-Mansouri',9,'DEPT005'),('LEC012','Prof.','1970-09-21','Prof. William Brown',22,'DEPT005'),('LEC013','PhD','1983-02-14','Dr. Lisa Zhang',8,'DEPT005'),('LEC014','MSc','1990-07-09','Ms. Maria Garcia',4,'DEPT005'),('LEC015','MBA','1982-04-18','Mr. Nguyen Van Dung',8,'DEPT006'),('LEC016','MSc','1988-09-30','Ms. Emily Davis',4,'DEPT006'),('LEC017','PhD','1975-10-28','Dr. Thomas Reed',16,'DEPT006'),('LEC018','MSc','1987-05-16','Ms. Sophia Patel',5,'DEPT006'),('LEC019','MBA','1980-08-04','Mr. Carlos Rodriguez',10,'DEPT006'),('LEC020','Prof.','1968-01-11','Prof. Yuki Tanaka',24,'DEPT006'),('LEC021','PhD','1982-04-22','Dr. Ahmed Hassan',9,'DEPT006'),('LEC022','MSc','1991-09-30','Ms. Isabella Rossi',4,'DEPT006');
/*!40000 ALTER TABLE `dim_lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_login_account`
--

DROP TABLE IF EXISTS `dim_login_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_login_account` (
  `account_id` varchar(15) NOT NULL,
  `account_status` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `last_login_at` datetime(6) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(15) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_login_account`
--

LOCK TABLES `dim_login_account` WRITE;
/*!40000 ALTER TABLE `dim_login_account` DISABLE KEYS */;
INSERT INTO `dim_login_account` VALUES ('ACC_ADM_001',1,'2023-11-01 08:00:00.000000','2024-05-21 09:15:00.000000','$2a$10$vABljqJkzadkuTXWngxuCubpdzOiedcvrqwNokUpzYL2GdnAG2lmW','admin','2025-10-04 12:02:00.874397'),('ACC_ADM_002',1,'2023-12-15 08:30:00.000000','2024-05-20 16:45:00.000000','$2a$12$..m9ylZ1LbTBvNXCXf3Ee.Pbq1RTEkPrLsQFSmfKYzxsnlX0L7nlC','admin','2024-01-15 09:00:00.000000'),('ACC_ADM_003',1,'2024-01-20 09:00:00.000000',NULL,'$2a$12$..m9ylZ1LbTBvNXCXf3Ee.Pbq1RTEkPrLsQFSmfKYzxsnlX0L7nlC','admin','2024-01-20 09:00:00.000000'),('ACC_STU_001',1,'2024-01-15 09:00:00.000000','2024-05-20 14:30:00.000000','$2a$12$..m9ylZ1LbTBvNXCXf3Ee.Pbq1RTEkPrLsQFSmfKYzxsnlX0L7nlC','student','2024-01-15 09:00:00.000000'),('ACC_STU_002',1,'2024-02-01 10:15:00.000000',NULL,'$2a$12$..m9ylZ1LbTBvNXCXf3Ee.Pbq1RTEkPrLsQFSmfKYzxsnlX0L7nlC','student','2024-02-15 09:00:00.000000'),('ACC_STU_003',1,'2024-03-01 11:00:00.000000','2024-05-18 10:00:00.000000','$2a$12$..m9ylZ1LbTBvNXCXf3Ee.Pbq1RTEkPrLsQFSmfKYzxsnlX0L7nlC','student','2024-03-01 11:00:00.000000'),('ACC_STU_004',1,'2025-09-27 15:49:11.259731',NULL,'$2a$10$X3UJ8BtRuUPjekUba.FgKOFeAt6DfgOf1Vp2iESBlap9aJv5FAA2m','student','2025-09-27 16:19:24.144961'),('ACC_STU_005',1,'2025-10-04 12:48:25.565856',NULL,'$2a$10$cHLfhi3vtqidNM.w5YPHzuBsjHRPr7iTgePXGgpLUTY8BNPejw/CS','student','2025-10-05 12:45:02.924172');
/*!40000 ALTER TABLE `dim_login_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_scholarship`
--

DROP TABLE IF EXISTS `dim_scholarship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_scholarship` (
  `scholarship_id` varchar(15) NOT NULL,
  `amount` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `scholarship_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scholarship_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_scholarship`
--

LOCK TABLES `dim_scholarship` WRITE;
/*!40000 ALTER TABLE `dim_scholarship` DISABLE KEYS */;
INSERT INTO `dim_scholarship` VALUES ('SCHOL001',2000,'Awarded for outstanding academic performance','Excellence Scholarship'),('SCHOL002',1800,'Covers 50% of tuition fees','Tuition Fee Waiver'),('SCHOL003',1000,'Covers 30% of tuition fees','Tuition Fee Waiver'),('SCHOL004',800,'Covers 20% of tuition fees','Tuition Fee Waiver'),('SCHOL005',500,'Discount for early registration','Early Bird Discount'),('SCHOL106 ',200,'Financial assistance for international students','International Student Aid');
/*!40000 ALTER TABLE `dim_scholarship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_semester`
--

DROP TABLE IF EXISTS `dim_semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_semester` (
  `semester_id` varchar(15) NOT NULL,
  `intake_month` varchar(50) NOT NULL,
  `term` varchar(50) NOT NULL,
  `year` date NOT NULL,
  PRIMARY KEY (`semester_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_semester`
--

LOCK TABLES `dim_semester` WRITE;
/*!40000 ALTER TABLE `dim_semester` DISABLE KEYS */;
INSERT INTO `dim_semester` VALUES ('SEM_2024_1','January','Spring 2024','2024-01-01'),('SEM_2024_2','May','Summer 2024','2024-05-01'),('SEM_2024_3','September','Fall 2024','2024-09-01'),('SEM_2025_1','January','Spring 2025','2025-01-01'),('SEM_2025_2','May','Summer 2025','2025-05-01'),('SEM_2025_3','September','Fall 2025','2025-09-01'),('SEM_2026_1','January','Spring 2026','2026-01-01'),('SEM_2026_2','May','Summer 2026','2026-05-01'),('SEM_2026_3','September','Fall 2026','2026-09-01');
/*!40000 ALTER TABLE `dim_semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_student`
--

DROP TABLE IF EXISTS `dim_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_student` (
  `student_id` varchar(50) NOT NULL,
  `building_name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `home_address` varchar(150) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `national_id` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `student_email` varchar(100) DEFAULT NULL,
  `study_plan_id` varchar(50) DEFAULT NULL,
  `city_id` varchar(15) NOT NULL,
  `account_id` varchar(15) DEFAULT NULL,
  `ward_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `UKk56l0xaoo80c9ohex5m0w7alv` (`account_id`),
  KEY `FKl2f12n6f7vvd2bj8rlj76oc7p` (`city_id`),
  KEY `FKgmtxx1mypdhs1lg8mfuh8hh8a` (`ward_id`),
  CONSTRAINT `FKgmtxx1mypdhs1lg8mfuh8hh8a` FOREIGN KEY (`ward_id`) REFERENCES `subdim_ward` (`ward_id`),
  CONSTRAINT `FKk3u5cufmkk0yf8e8yrcq3ntic` FOREIGN KEY (`account_id`) REFERENCES `dim_login_account` (`account_id`),
  CONSTRAINT `FKl2f12n6f7vvd2bj8rlj76oc7p` FOREIGN KEY (`city_id`) REFERENCES `subdim_city` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_student`
--

LOCK TABLES `dim_student` WRITE;
/*!40000 ALTER TABLE `dim_student` DISABLE KEYS */;
INSERT INTO `dim_student` VALUES ('STU001','Apt 4B','2002-05-10','Nguyen',2,'Yangon Myanmar','Vy','123456789','VN','0987654321','123 Nguyen Trai St','vana@sbs.edu.vn','UK_DS','HCM','ACC_STU_001','BTH'),('STU002',NULL,'2001-08-22','Smith',1,'456 Park Lane','John',NULL,'GB','447700123456','456 Park Lane','johnsmith@sbs.edu.vn','US_BM','HN','ACC_STU_002','PMH'),('STU003','Apt 5C','2000-12-05','Miyazaki',2,'789 Sakura Street','Yuki',NULL,'JP','819012345678','789 Sakura Street','yuki@sbs.edu.vn','AUS_HM','HN','ACC_STU_003','LH'),('STU004','Wabi','2003-09-30','Thu Htet',1,'Wabi','Naing','','MM','09666430588','ShwePyiThar','thuhtetnaing005@gmail.com','UK_DS','YGN','ACC_STU_004','TDN'),('STU005','Audri','2006-10-11','Yin',2,'sssss','Oo','','MM','0933737377373','ddssdddd','yinmyat2006@gmail.com','UK_DS','HCM','ACC_STU_005','BTH');
/*!40000 ALTER TABLE `dim_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_student_academic_background`
--

DROP TABLE IF EXISTS `dim_student_academic_background`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_student_academic_background` (
  `background_id` varchar(15) NOT NULL,
  `document_url` varchar(255) DEFAULT NULL,
  `english_qualification` varchar(100) DEFAULT NULL,
  `english_score` float DEFAULT NULL,
  `highest_qualification` varchar(100) NOT NULL,
  `institution_name` varchar(150) NOT NULL,
  `required_for_placement_test` bit(1) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  PRIMARY KEY (`background_id`),
  KEY `FKbth8r4ue20q91pv8ndu48pymy` (`student_id`),
  CONSTRAINT `FKbth8r4ue20q91pv8ndu48pymy` FOREIGN KEY (`student_id`) REFERENCES `dim_student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_student_academic_background`
--

LOCK TABLES `dim_student_academic_background` WRITE;
/*!40000 ALTER TABLE `dim_student_academic_background` DISABLE KEYS */;
INSERT INTO `dim_student_academic_background` VALUES ('BKG_STU001_01','https://s3.bucket.edu.vn/docs/stu001_bkg1.pdf','IELTS',7,'High School Diploma','Nguyen Hue High School',_binary '\0','STU001'),('BKG_STU001_02','https://s3.bucket.edu.vn/docs/stu001_bkg2.pdf','Internal Test',85.5,'Advanced English Course','Hanoi Open University',_binary '\0','STU001'),('BKG_STU002_01','https://s3.bucket.edu.vn/docs/stu002_bkg1.pdf','TOEFL',95,'A-Levels','British Council College',_binary '','STU002'),('BKG_STU002_02',NULL,NULL,NULL,'Diploma in Business','London Institute',_binary '\0','STU002'),('BKG_STU003_01','https://s3.bucket.edu.vn/docs/stu003_bkg1.pdf','Duolingo',115,'High School Diploma','Tokyo International School',_binary '\0','STU003'),('BKG_STU005_01','https://DDDDD','A1',120,'HND','AAB',_binary '','STU005');
/*!40000 ALTER TABLE `dim_student_academic_background` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_student_english_placement_test`
--

DROP TABLE IF EXISTS `dim_student_english_placement_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_student_english_placement_test` (
  `test_id` varchar(15) NOT NULL,
  `result_level` varchar(50) NOT NULL,
  `result_status` int NOT NULL,
  `test_date` date NOT NULL,
  `student_id` varchar(50) NOT NULL,
  PRIMARY KEY (`test_id`),
  KEY `FKg08nywcxcg6bis5waq8cjyghd` (`student_id`),
  CONSTRAINT `FKg08nywcxcg6bis5waq8cjyghd` FOREIGN KEY (`student_id`) REFERENCES `dim_student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_student_english_placement_test`
--

LOCK TABLES `dim_student_english_placement_test` WRITE;
/*!40000 ALTER TABLE `dim_student_english_placement_test` DISABLE KEYS */;
INSERT INTO `dim_student_english_placement_test` VALUES ('EPT_STU001_01','B2',1,'2024-02-05','STU001'),('EPT_STU002_01','C1',1,'2024-02-05','STU002'),('EPT_STU003_01','C1',1,'2024-02-10','STU003'),('EPT_STU005_01','B1',0,'2026-10-14','STU005');
/*!40000 ALTER TABLE `dim_student_english_placement_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_study_plan_course`
--

DROP TABLE IF EXISTS `dim_study_plan_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_study_plan_course` (
  `study_plan_course_id` varchar(15) NOT NULL,
  `assignment_deadline` date DEFAULT NULL,
  `course_id` varchar(20) NOT NULL,
  `semester_id` varchar(15) NOT NULL,
  `study_plan_id` varchar(20) NOT NULL,
  PRIMARY KEY (`study_plan_course_id`),
  KEY `FK3ak9x1d8vilf4828k53uhlec` (`course_id`),
  KEY `FK6otpsyin72upf2i2g43nm8bf9` (`semester_id`),
  KEY `FKpkasd9kypjy8eb5r0e3xrvdqy` (`study_plan_id`),
  CONSTRAINT `FK3ak9x1d8vilf4828k53uhlec` FOREIGN KEY (`course_id`) REFERENCES `dim_course` (`course_id`),
  CONSTRAINT `FK6otpsyin72upf2i2g43nm8bf9` FOREIGN KEY (`semester_id`) REFERENCES `dim_semester` (`semester_id`),
  CONSTRAINT `FKpkasd9kypjy8eb5r0e3xrvdqy` FOREIGN KEY (`study_plan_id`) REFERENCES `dim_studyplan` (`study_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_study_plan_course`
--

LOCK TABLES `dim_study_plan_course` WRITE;
/*!40000 ALTER TABLE `dim_study_plan_course` DISABLE KEYS */;
INSERT INTO `dim_study_plan_course` VALUES ('SPC_AUSHM_001','2025-08-10','COURSE009','SEM_2025_1','AUS_HM'),('SPC_AUSHM_002','2025-10-23','COURSE010','SEM_2025_2','AUS_HM'),('SPC_AUSHM_003','2025-08-12','COURSE011','SEM_2025_1','AUS_HM'),('SPC_AUSHM_004','2025-08-20','COURSE012','SEM_2025_2','AUS_HM'),('SPC_AUSHM_005','2025-08-08','COURSE037','SEM_2025_1','AUS_HM'),('SPC_AUSHM_006','2025-08-18','COURSE038','SEM_2025_2','AUS_HM'),('SPC_AUSHM_007','2025-08-14','COURSE039','SEM_2025_1','AUS_HM'),('SPC_AUSHM_008','2025-08-08','COURSE040','SEM_2025_3','AUS_HM'),('SPC_AUSHM_009','2026-04-07','COURSE041','SEM_2026_1','AUS_HM'),('SPC_AUSHM_010','2026-04-13','COURSE042','SEM_2026_1','AUS_HM'),('SPC_AUSHM_011','2026-08-15','COURSE043','SEM_2026_2','AUS_HM'),('SPC_AUSHM_012','2026-08-18','COURSE044','SEM_2026_2','AUS_HM'),('SPC_AUSHM_013','2026-04-10','COURSE045','SEM_2026_1','AUS_HM'),('SPC_AUSHM_014','2026-12-12','COURSE046','SEM_2026_3','AUS_HM'),('SPC_AUSHM_015','2026-08-13','COURSE047','SEM_2026_2','AUS_HM'),('SPC_AUSHM_016','2026-12-15','COURSE048','SEM_2026_3','AUS_HM'),('SPC_UKDS_001','2025-08-15','COURSE001','SEM_2025_1','UK_DS'),('SPC_UKDS_002','2025-08-20','COURSE002','SEM_2025_1','UK_DS'),('SPC_UKDS_003','2025-08-10','COURSE003','SEM_2025_2','UK_DS'),('SPC_UKDS_004',NULL,'COURSE004','SEM_2025_3','UK_DS'),('SPC_UKDS_005','2025-08-18','COURSE013','SEM_2025_1','UK_DS'),('SPC_UKDS_006','2025-08-05','COURSE014','SEM_2025_2','UK_DS'),('SPC_UKDS_007','2025-08-22','COURSE015','SEM_2025_1','UK_DS'),('SPC_UKDS_008','2025-08-10','COURSE016','SEM_2025_3','UK_DS'),('SPC_UKDS_009','2026-04-15','COURSE017','SEM_2026_1','UK_DS'),('SPC_UKDS_010','2026-04-20','COURSE018','SEM_2026_1','UK_DS'),('SPC_UKDS_011','2026-08-10','COURSE019','SEM_2026_2','UK_DS'),('SPC_UKDS_012',NULL,'COURSE020','SEM_2026_3','UK_DS'),('SPC_UKDS_013','2026-04-18','COURSE021','SEM_2026_1','UK_DS'),('SPC_UKDS_014','2026-12-05','COURSE022','SEM_2026_3','UK_DS'),('SPC_UKDS_015','2026-08-08','COURSE023','SEM_2026_2','UK_DS'),('SPC_UKDS_016','2026-08-12','COURSE024','SEM_2026_2','UK_DS'),('SPC_USBM_001','2025-08-18','COURSE005','SEM_2025_1','US_BM'),('SPC_USBM_002','2025-08-05','COURSE006','SEM_2025_2','US_BM'),('SPC_USBM_003','2025-08-25','COURSE007','SEM_2025_1','US_BM'),('SPC_USBM_004','2025-08-15','COURSE008','SEM_2025_2','US_BM'),('SPC_USBM_005','2025-08-20','COURSE025','SEM_2025_1','US_BM'),('SPC_USBM_006','2025-08-08','COURSE026','SEM_2025_2','US_BM'),('SPC_USBM_007','2025-08-22','COURSE027','SEM_2025_1','US_BM'),('SPC_USBM_008','2025-08-12','COURSE028','SEM_2025_3','US_BM'),('SPC_USBM_009','2026-04-16','COURSE029','SEM_2026_1','US_BM'),('SPC_USBM_010','2026-04-20','COURSE030','SEM_2026_1','US_BM'),('SPC_USBM_011','2026-08-06','COURSE031','SEM_2026_2','US_BM'),('SPC_USBM_012','2026-08-12','COURSE032','SEM_2026_2','US_BM'),('SPC_USBM_013','2026-04-19','COURSE033','SEM_2026_1','US_BM'),('SPC_USBM_014','2026-12-08','COURSE034','SEM_2026_3','US_BM'),('SPC_USBM_015','2026-08-10','COURSE035','SEM_2026_2','US_BM'),('SPC_USBM_016','2026-12-11','COURSE036','SEM_2026_3','US_BM');
/*!40000 ALTER TABLE `dim_study_plan_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_studyplan`
--

DROP TABLE IF EXISTS `dim_studyplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_studyplan` (
  `study_plan_id` varchar(20) NOT NULL,
  `major_name` varchar(100) NOT NULL,
  `pathway_name` varchar(100) NOT NULL,
  `total_credit_point` int NOT NULL,
  `actual_end_date` date DEFAULT NULL,
  `expected_end_date` date DEFAULT NULL,
  `program_name` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `student_id` varchar(50) NOT NULL,
  PRIMARY KEY (`study_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_studyplan`
--

LOCK TABLES `dim_studyplan` WRITE;
/*!40000 ALTER TABLE `dim_studyplan` DISABLE KEYS */;
INSERT INTO `dim_studyplan` VALUES ('AUS_HM','Hospitality Management','Australia Pathway',240,NULL,NULL,NULL,NULL,''),('UK_BM','Business Management','UK Pathway',360,NULL,NULL,NULL,NULL,''),('UK_DS','Data Science','UK Pathway',360,NULL,NULL,NULL,NULL,''),('US_BM','Business Management','US Pathway',120,NULL,NULL,NULL,NULL,''),('US_DS','Data Science','US Pathway',120,NULL,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `dim_studyplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_transcript_request`
--

DROP TABLE IF EXISTS `dim_transcript_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_transcript_request` (
  `request_id` varchar(15) NOT NULL,
  `request_date` date NOT NULL,
  `transcript_type` int NOT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_transcript_request`
--

LOCK TABLES `dim_transcript_request` WRITE;
/*!40000 ALTER TABLE `dim_transcript_request` DISABLE KEYS */;
INSERT INTO `dim_transcript_request` VALUES ('TR2683A342-27E2','2025-10-07',1),('TR8441E01B-97FB','2025-09-29',1),('TRQ_001','2024-05-01',1),('TRQ_002','2024-05-10',0),('TRQ_003','2024-05-15',1),('TRQ_004','2024-05-20',0),('TRQ_005','2024-05-25',1);
/*!40000 ALTER TABLE `dim_transcript_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_transfer_program`
--

DROP TABLE IF EXISTS `dim_transfer_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_transfer_program` (
  `transfer_program_id` varchar(15) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `transfer_country` varchar(100) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `admin_id` varchar(50) NOT NULL,
  `partner_institution_id` varchar(15) NOT NULL,
  PRIMARY KEY (`transfer_program_id`),
  KEY `FKo7n0496ytuqgm0t40pjbaolsb` (`admin_id`),
  KEY `FKbn1d7u5nrujmd24vp76dvjc9o` (`partner_institution_id`),
  CONSTRAINT `FKbn1d7u5nrujmd24vp76dvjc9o` FOREIGN KEY (`partner_institution_id`) REFERENCES `subdim_partner_institute` (`partner_institution_id`),
  CONSTRAINT `FKo7n0496ytuqgm0t40pjbaolsb` FOREIGN KEY (`admin_id`) REFERENCES `dim_admin` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_transfer_program`
--

LOCK TABLES `dim_transfer_program` WRITE;
/*!40000 ALTER TABLE `dim_transfer_program` DISABLE KEYS */;
INSERT INTO `dim_transfer_program` VALUES ('TP_001','2025-08-23 00:00:00.000000','United Kingdom','2025-08-23 00:00:00.000000','ADM002','PI001'),('TP_002','2025-08-23 00:00:00.000000','United States','2025-08-23 00:00:00.000000','ADM002','PI002'),('TP_003','2025-08-23 00:00:00.000000','Australia','2025-08-23 00:00:00.000000','ADM002','PI003'),('TP_004','2025-10-04 13:30:34.056263','ududud','2025-10-04 17:09:48.769181','ADM002','PI004');
/*!40000 ALTER TABLE `dim_transfer_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_visa_passport`
--

DROP TABLE IF EXISTS `dim_visa_passport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_visa_passport` (
  `visa_passport_id` varchar(15) NOT NULL,
  `passport_expired_date` date DEFAULT NULL,
  `passport_issued_date` date DEFAULT NULL,
  `passport_number` varchar(50) DEFAULT NULL,
  `visa_expired_date` date DEFAULT NULL,
  `visa_id` varchar(50) NOT NULL,
  `visa_issued_date` date DEFAULT NULL,
  `visa_type` int DEFAULT NULL,
  `student_id` varchar(50) NOT NULL,
  PRIMARY KEY (`visa_passport_id`),
  KEY `FKsdbxeya9q3wwpuhv74xnieqth` (`student_id`),
  CONSTRAINT `FKsdbxeya9q3wwpuhv74xnieqth` FOREIGN KEY (`student_id`) REFERENCES `dim_student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_visa_passport`
--

LOCK TABLES `dim_visa_passport` WRITE;
/*!40000 ALTER TABLE `dim_visa_passport` DISABLE KEYS */;
INSERT INTO `dim_visa_passport` VALUES ('VP_STU001_01','2027-05-14','2022-05-15','P12345678','2025-01-10','V2024VN12345','2024-01-10',1,'STU001'),('VP_STU002_01','2025-10-31','2020-11-01','N98765432','2024-07-20','V2024UK98765','2024-01-20',0,'STU002'),('VP_STU003_01','2027-01-01','2022-01-01','P98765432','2025-02-01','V2024JP54321','2024-02-01',1,'STU003'),('VP_STU004_01','2027-05-04','2025-09-28','MJ46069','2026-05-29','V2024VN123456','2025-09-28',0,'STU004'),('VP_STU005_01','2026-12-10','2024-12-10','MJ234567','2026-11-20','VV2024VN3334','2024-11-10',0,'STU005');
/*!40000 ALTER TABLE `dim_visa_passport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_attendance_summary`
--

DROP TABLE IF EXISTS `fact_attendance_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_attendance_summary` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `absent_days` int NOT NULL,
  `flag_level` varchar(20) DEFAULT NULL,
  `present_days` int NOT NULL,
  `total_attendance_percentage` int NOT NULL,
  `total_days` int NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `study_plan_course_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK15cqea14d263436ahinxyx2rc` (`student_id`),
  KEY `FK1r3dlusb9wc4awjab7spyl6fd` (`study_plan_course_id`),
  CONSTRAINT `FK15cqea14d263436ahinxyx2rc` FOREIGN KEY (`student_id`) REFERENCES `dim_student` (`student_id`),
  CONSTRAINT `FK1r3dlusb9wc4awjab7spyl6fd` FOREIGN KEY (`study_plan_course_id`) REFERENCES `dim_study_plan_course` (`study_plan_course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_attendance_summary`
--

LOCK TABLES `fact_attendance_summary` WRITE;
/*!40000 ALTER TABLE `fact_attendance_summary` DISABLE KEYS */;
INSERT INTO `fact_attendance_summary` VALUES (1,2,'Warning',3,60,5,'STU001','SPC_UKDS_003'),(2,1,'Warning',4,80,5,'STU001','SPC_UKDS_003'),(3,2,'Warning',3,60,5,'STU001','SPC_UKDS_006'),(4,1,'Warning',4,80,5,'STU001','SPC_UKDS_006'),(5,0,'Good',5,100,5,'STU001','SPC_UKDS_008'),(6,1,'Warning',4,80,5,'STU001','SPC_UKDS_001'),(7,0,'Good',5,100,5,'STU001','SPC_UKDS_002'),(8,0,'Good',5,100,5,'STU001','SPC_UKDS_005'),(9,1,'Warning',4,80,5,'STU001','SPC_UKDS_007'),(10,2,'Warning',3,60,5,'STU002','SPC_USBM_002'),(11,1,'Warning',4,80,5,'STU002','SPC_USBM_004'),(12,0,'Good',5,100,5,'STU002','SPC_USBM_006'),(13,1,'Warning',4,80,5,'STU002','SPC_USBM_008'),(14,0,'Good',5,100,5,'STU002','SPC_USBM_001'),(15,1,'Warning',4,80,5,'STU002','SPC_USBM_003'),(16,0,'Good',5,100,5,'STU002','SPC_USBM_005'),(17,1,'Warning',4,80,5,'STU002','SPC_USBM_007'),(18,2,'Warning',3,60,5,'STU003','SPC_AUSHM_002'),(19,1,'Warning',4,80,5,'STU003','SPC_AUSHM_004'),(20,0,'Good',5,100,5,'STU003','SPC_AUSHM_006'),(21,2,'Warning',3,60,5,'STU003','SPC_AUSHM_008'),(22,1,'Warning',4,80,5,'STU003','SPC_AUSHM_001'),(23,1,'Warning',4,80,5,'STU003','SPC_AUSHM_003'),(24,0,'Good',5,100,5,'STU003','SPC_AUSHM_005'),(25,2,'Warning',3,60,5,'STU003','SPC_AUSHM_007'),(26,10,'Warning',10,50,20,'STU005','SPC_UKDS_002');
/*!40000 ALTER TABLE `fact_attendance_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_course_result`
--

DROP TABLE IF EXISTS `fact_course_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_course_result` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `credits_earned` int NOT NULL,
  `grade_name` varchar(5) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `study_plan_course_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlpouw8lviddhbbwd5c84jq14a` (`grade_name`),
  KEY `FK3qxfq2l5wm90v2wxo8n2n9ech` (`student_id`),
  KEY `FK23j1esmx0nfelqx5rb6ug7tv5` (`study_plan_course_id`),
  CONSTRAINT `FK23j1esmx0nfelqx5rb6ug7tv5` FOREIGN KEY (`study_plan_course_id`) REFERENCES `dim_study_plan_course` (`study_plan_course_id`),
  CONSTRAINT `FK3qxfq2l5wm90v2wxo8n2n9ech` FOREIGN KEY (`student_id`) REFERENCES `dim_student` (`student_id`),
  CONSTRAINT `FKlpouw8lviddhbbwd5c84jq14a` FOREIGN KEY (`grade_name`) REFERENCES `dim_grade` (`grade_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_course_result`
--

LOCK TABLES `fact_course_result` WRITE;
/*!40000 ALTER TABLE `fact_course_result` DISABLE KEYS */;
INSERT INTO `fact_course_result` VALUES (1,3,'M','STU001','SPC_UKDS_001'),(2,3,'D','STU001','SPC_UKDS_002'),(3,3,'P','STU001','SPC_UKDS_005'),(4,3,'M','STU001','SPC_UKDS_007'),(5,3,'D','STU002','SPC_USBM_001'),(6,0,'F','STU002','SPC_USBM_003'),(7,3,'M','STU002','SPC_USBM_005'),(8,3,'D','STU002','SPC_USBM_007'),(9,3,'M','STU003','SPC_AUSHM_001'),(10,3,'D','STU003','SPC_AUSHM_003'),(11,2,'P','STU003','SPC_AUSHM_005'),(12,3,'M','STU003','SPC_AUSHM_007'),(13,14,'F','STU005','SPC_UKDS_001');
/*!40000 ALTER TABLE `fact_course_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_daily_attendance`
--

DROP TABLE IF EXISTS `fact_daily_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_daily_attendance` (
  `attendance_date` date NOT NULL,
  `check_in_time` time(6) DEFAULT NULL,
  `check_out_time` time(6) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `class_schedule_id` varchar(15) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  PRIMARY KEY (`class_schedule_id`,`student_id`),
  KEY `idx_fact_daily_attendance_student` (`student_id`),
  KEY `idx_fact_daily_attendance_schedule` (`class_schedule_id`),
  CONSTRAINT `FK2r9eiupxsfx6vxsxrek7deuun` FOREIGN KEY (`student_id`) REFERENCES `dim_student` (`student_id`),
  CONSTRAINT `FKs800hb0wrx5juj0iux6ion94u` FOREIGN KEY (`class_schedule_id`) REFERENCES `dim_class_schedule` (`class_schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_daily_attendance`
--

LOCK TABLES `fact_daily_attendance` WRITE;
/*!40000 ALTER TABLE `fact_daily_attendance` DISABLE KEYS */;
INSERT INTO `fact_daily_attendance` VALUES ('2025-08-22',NULL,NULL,'Family emergency','Absent with permission','CS_AUSHM001_FRI','STU003'),('2025-08-21','08:58:00.000000','10:58:00.000000',NULL,'Present','CS_AUSHM001_THU','STU003'),('2025-08-19','08:55:00.000000','10:55:00.000000',NULL,'Present','CS_AUSHM001_TUE','STU003'),('2025-08-29','15:01:00.000000','16:59:00.000000',NULL,'Present','CS_AUSHM002_FRI','STU003'),('2025-08-25','11:10:00.000000','12:55:00.000000','Overslept','Late','CS_AUSHM002_MON','STU003'),('2025-08-27','11:02:00.000000','12:58:00.000000',NULL,'Present','CS_AUSHM002_WED','STU003'),('2025-08-18','10:10:00.000000','11:55:00.000000','Overslept','Late','CS_AUSHM003_MON','STU003'),('2025-08-20','10:02:00.000000','11:58:00.000000',NULL,'Present','CS_AUSHM003_WED','STU003'),('2025-08-28','09:20:00.000000','10:50:00.000000','Traffic','Late','CS_AUSHM004_THU','STU003'),('2025-08-26','09:01:00.000000','10:59:00.000000',NULL,'Present','CS_AUSHM004_TUE','STU003'),('2025-08-18','13:01:00.000000','14:28:00.000000',NULL,'Present','CS_AUSHM005_MON','STU003'),('2025-08-20','13:02:00.000000','14:29:00.000000',NULL,'Present','CS_AUSHM005_WED','STU003'),('2025-08-25','09:02:00.000000','10:58:00.000000',NULL,'Present','CS_AUSHM006_MON','STU003'),('2025-08-27','09:01:00.000000','10:59:00.000000',NULL,'Present','CS_AUSHM006_WED','STU003'),('2025-08-21',NULL,NULL,'Illness','Absent','CS_AUSHM007_THU','STU003'),('2025-08-19','13:01:00.000000','14:59:00.000000',NULL,'Present','CS_AUSHM007_TUE','STU003'),('2025-08-28','13:02:00.000000','14:58:00.000000',NULL,'Present','CS_AUSHM008_THU','STU003'),('2025-08-26',NULL,NULL,'Sick Leave','Absent','CS_AUSHM008_TUE','STU003'),('2025-08-22','10:15:00.000000','11:55:00.000000','Traffic delay','Late','CS_UKDS001_FRI','STU001'),('2025-08-18','08:55:00.000000','10:58:00.000000',NULL,'Present','CS_UKDS001_MON','STU001'),('2025-08-20',NULL,NULL,'Sick Leave','Absent','CS_UKDS001_WED','STU001'),('2025-08-21','13:25:00.000000','16:05:00.000000','Missed the first 25 mins','Late','CS_UKDS002_THU','STU001'),('2025-08-19','12:58:00.000000','15:58:00.000000','Attended both sessions','Present','CS_UKDS002_TUE','STU001'),('2025-10-11',NULL,'14:19:00.000000','jjjjj','Late','CS_UKDS002_TUE','STU005'),('2025-08-29','09:01:00.000000','10:59:00.000000',NULL,'Present','CS_UKDS003_FRI','STU001'),('2025-08-25','10:02:00.000000','11:58:00.000000',NULL,'Present','CS_UKDS003_MON','STU001'),('2025-08-27','10:15:00.000000','11:55:00.000000','Overslept','Late','CS_UKDS003_WED','STU001'),('2025-08-18','14:02:00.000000','15:58:00.000000',NULL,'Present','CS_UKDS005_MON','STU001'),('2025-08-20','14:01:00.000000','15:59:00.000000',NULL,'Present','CS_UKDS005_WED','STU001'),('2025-08-28',NULL,NULL,'Personal Reason','Absent','CS_UKDS006_THU','STU001'),('2025-08-26','14:02:00.000000','15:58:00.000000',NULL,'Present','CS_UKDS006_TUE','STU001'),('2025-08-21','09:02:00.000000','10:58:00.000000',NULL,'Present','CS_UKDS007_THU','STU001'),('2025-08-19',NULL,NULL,'Medical Appointment','Absent','CS_UKDS007_TUE','STU001'),('2025-08-25','13:01:00.000000','14:59:00.000000',NULL,'Present','CS_UKDS008_MON','STU001'),('2025-08-27','13:02:00.000000','14:58:00.000000',NULL,'Present','CS_UKDS008_WED','STU001'),('2025-08-22','14:15:00.000000','15:58:00.000000','Late arrival','Late','CS_USBM001_FRI','STU002'),('2025-08-18','09:58:00.000000','11:58:00.000000',NULL,'Present','CS_USBM001_MON','STU002'),('2025-08-20','09:55:00.000000','11:55:00.000000',NULL,'Present','CS_USBM001_WED','STU002'),('2025-08-29','09:05:00.000000','11:55:00.000000',NULL,'Present','CS_USBM002_FRI','STU002'),('2025-08-26',NULL,NULL,'Doctor appointment','Absent','CS_USBM002_TUE','STU002'),('2025-08-21','11:02:00.000000','12:58:00.000000',NULL,'Present','CS_USBM003_THU','STU002'),('2025-08-19',NULL,NULL,'University event','Absent','CS_USBM003_TUE','STU002'),('2025-08-25','09:02:00.000000','10:58:00.000000',NULL,'Present','CS_USBM004_MON','STU002'),('2025-08-27','09:20:00.000000','10:55:00.000000','Missed start','Late','CS_USBM004_WED','STU002'),('2025-08-18','13:01:00.000000','14:59:00.000000',NULL,'Present','CS_USBM005_MON','STU002'),('2025-08-20','13:10:00.000000','14:55:00.000000','Traffic','Late','CS_USBM005_WED','STU002'),('2025-08-25','13:01:00.000000','14:59:00.000000',NULL,'Present','CS_USBM006_MON','STU002'),('2025-08-27','13:02:00.000000','14:58:00.000000',NULL,'Present','CS_USBM006_WED','STU002'),('2025-08-21','14:02:00.000000','15:58:00.000000',NULL,'Present','CS_USBM007_THU','STU002'),('2025-08-19','14:01:00.000000','15:59:00.000000',NULL,'Present','CS_USBM007_TUE','STU002'),('2025-08-29',NULL,NULL,'Court Duty','Absent with permission','CS_USBM008_FRI','STU002'),('2025-08-26','13:01:00.000000','14:59:00.000000',NULL,'Present','CS_USBM008_TUE','STU002');
/*!40000 ALTER TABLE `fact_daily_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_healthinsurance`
--

DROP TABLE IF EXISTS `fact_healthinsurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_healthinsurance` (
  `health_insurance_id` varchar(15) NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `insurance_number` varchar(255) DEFAULT NULL,
  `optional_message` varchar(255) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_until` date DEFAULT NULL,
  `admin_id` varchar(50) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  PRIMARY KEY (`health_insurance_id`),
  KEY `FK6ave055ewdkfnfmsx8ex86beh` (`admin_id`),
  KEY `FKlbymfb1s43cygmi4pbp4bc0i1` (`student_id`),
  CONSTRAINT `FK6ave055ewdkfnfmsx8ex86beh` FOREIGN KEY (`admin_id`) REFERENCES `dim_admin` (`admin_id`),
  CONSTRAINT `FKlbymfb1s43cygmi4pbp4bc0i1` FOREIGN KEY (`student_id`) REFERENCES `dim_student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_healthinsurance`
--

LOCK TABLES `fact_healthinsurance` WRITE;
/*!40000 ALTER TABLE `fact_healthinsurance` DISABLE KEYS */;
INSERT INTO `fact_healthinsurance` VALUES ('HI_STU001_01','https://s3.bucket.edu.vn/insurance/hi_stu001.pdf','HI123456789VN','Covers dental','2024-01-01','2024-12-31','ADM001','STU001'),('HI_STU001_02','https://s3.bucket.edu.vn/insurance/hi_stu001_extended.pdf','HI123456789EX','Extended coverage for internship','2024-06-01','2025-06-01','ADM001','STU001'),('HI_STU002_01','https://s3.bucket.edu.vn/insurance/hi_stu002.pdf','HI987654321UK',NULL,'2024-02-01','2025-01-31','ADM001','STU002');
/*!40000 ALTER TABLE `fact_healthinsurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_lecturer_course`
--

DROP TABLE IF EXISTS `fact_lecturer_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_lecturer_course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total_assigned_course` int NOT NULL,
  `class_schedule_id` varchar(15) NOT NULL,
  `lecturer_id` varchar(15) NOT NULL,
  `semester_id` varchar(15) NOT NULL,
  `study_plan_course_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKwg0ib20mgddwnyid9himpwpj` (`class_schedule_id`),
  KEY `FKmm7txsabk4j65kkwq82ngdcyf` (`lecturer_id`),
  KEY `FKmfmsv07jb1akfo6mlski9lvvb` (`semester_id`),
  KEY `FKdpjrs06e7sqsoje752phle3ko` (`study_plan_course_id`),
  CONSTRAINT `FKdpjrs06e7sqsoje752phle3ko` FOREIGN KEY (`study_plan_course_id`) REFERENCES `dim_study_plan_course` (`study_plan_course_id`),
  CONSTRAINT `FKmfmsv07jb1akfo6mlski9lvvb` FOREIGN KEY (`semester_id`) REFERENCES `dim_semester` (`semester_id`),
  CONSTRAINT `FKmm7txsabk4j65kkwq82ngdcyf` FOREIGN KEY (`lecturer_id`) REFERENCES `dim_lecturer` (`lecturer_id`),
  CONSTRAINT `FKwg0ib20mgddwnyid9himpwpj` FOREIGN KEY (`class_schedule_id`) REFERENCES `dim_class_schedule` (`class_schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_lecturer_course`
--

LOCK TABLES `fact_lecturer_course` WRITE;
/*!40000 ALTER TABLE `fact_lecturer_course` DISABLE KEYS */;
INSERT INTO `fact_lecturer_course` VALUES (1,1,'CS_UKDS001_MON','LEC001','SEM_2025_1','SPC_UKDS_001'),(2,1,'CS_UKDS001_WED','LEC001','SEM_2025_1','SPC_UKDS_001'),(3,1,'CS_UKDS001_FRI','LEC001','SEM_2025_1','SPC_UKDS_001'),(4,1,'CS_UKDS002_TUE','LEC001','SEM_2025_1','SPC_UKDS_002'),(5,1,'CS_UKDS002_THU','LEC001','SEM_2025_1','SPC_UKDS_002'),(6,1,'CS_UKDS005_MON','LEC003','SEM_2025_1','SPC_UKDS_005'),(7,1,'CS_UKDS005_WED','LEC003','SEM_2025_1','SPC_UKDS_005'),(8,1,'CS_UKDS007_TUE','LEC001','SEM_2025_1','SPC_UKDS_007'),(9,1,'CS_UKDS007_THU','LEC001','SEM_2025_1','SPC_UKDS_007'),(10,1,'CS_UKDS003_MON','LEC002','SEM_2025_2','SPC_UKDS_003'),(11,1,'CS_UKDS003_WED','LEC002','SEM_2025_2','SPC_UKDS_003'),(12,1,'CS_UKDS003_FRI','LEC002','SEM_2025_2','SPC_UKDS_003'),(13,1,'CS_UKDS006_TUE','LEC004','SEM_2025_2','SPC_UKDS_006'),(14,1,'CS_UKDS006_THU','LEC004','SEM_2025_2','SPC_UKDS_006'),(15,1,'CS_UKDS008_MON','LEC004','SEM_2025_2','SPC_UKDS_008'),(16,1,'CS_UKDS008_WED','LEC004','SEM_2025_2','SPC_UKDS_008'),(17,1,'CS_UKDS004_TUE','LEC002','SEM_2025_3','SPC_UKDS_004'),(18,1,'CS_UKDS004_THU','LEC002','SEM_2025_3','SPC_UKDS_004'),(19,1,'CS_UKDS008_MON','LEC005','SEM_2025_3','SPC_UKDS_008'),(20,1,'CS_UKDS008_WED','LEC005','SEM_2025_3','SPC_UKDS_008'),(21,1,'CS_UKDS009_TUE','LEC003','SEM_2026_1','SPC_UKDS_009'),(22,1,'CS_UKDS009_THU','LEC003','SEM_2026_1','SPC_UKDS_009'),(23,1,'CS_UKDS010_MON','LEC006','SEM_2026_1','SPC_UKDS_010'),(24,1,'CS_UKDS010_WED','LEC006','SEM_2026_1','SPC_UKDS_010'),(25,1,'CS_UKDS013_MON','LEC001','SEM_2026_1','SPC_UKDS_013'),(26,1,'CS_UKDS013_WED','LEC001','SEM_2026_1','SPC_UKDS_013'),(27,1,'CS_UKDS015_TUE','LEC004','SEM_2026_1','SPC_UKDS_015'),(28,1,'CS_UKDS015_THU','LEC004','SEM_2026_1','SPC_UKDS_015'),(29,1,'CS_UKDS011_MON','LEC003','SEM_2026_2','SPC_UKDS_011'),(30,1,'CS_UKDS011_WED','LEC003','SEM_2026_2','SPC_UKDS_011'),(31,1,'CS_UKDS012_TUE','LEC004','SEM_2026_2','SPC_UKDS_012'),(32,1,'CS_UKDS012_THU','LEC004','SEM_2026_2','SPC_UKDS_012'),(33,1,'CS_UKDS016_MON','LEC006','SEM_2026_2','SPC_UKDS_016'),(34,1,'CS_UKDS016_WED','LEC006','SEM_2026_2','SPC_UKDS_016'),(35,1,'CS_UKDS014_MON','LEC005','SEM_2026_3','SPC_UKDS_014'),(36,1,'CS_UKDS014_WED','LEC005','SEM_2026_3','SPC_UKDS_014'),(37,1,'CS_UKDS014_FRI','LEC005','SEM_2026_3','SPC_UKDS_014'),(38,1,'CS_USBM001_MON','LEC007','SEM_2025_1','SPC_USBM_001'),(39,1,'CS_USBM001_WED','LEC007','SEM_2025_1','SPC_USBM_001'),(40,1,'CS_USBM001_FRI','LEC007','SEM_2025_1','SPC_USBM_001'),(41,1,'CS_USBM003_TUE','LEC008','SEM_2025_1','SPC_USBM_003'),(42,1,'CS_USBM003_THU','LEC008','SEM_2025_1','SPC_USBM_003'),(43,1,'CS_USBM005_MON','LEC009','SEM_2025_1','SPC_USBM_005'),(44,1,'CS_USBM005_WED','LEC009','SEM_2025_1','SPC_USBM_005'),(45,1,'CS_USBM007_TUE','LEC007','SEM_2025_1','SPC_USBM_007'),(46,1,'CS_USBM007_THU','LEC007','SEM_2025_1','SPC_USBM_007'),(47,1,'CS_USBM002_TUE','LEC010','SEM_2025_2','SPC_USBM_002'),(48,1,'CS_USBM002_FRI','LEC010','SEM_2025_2','SPC_USBM_002'),(49,1,'CS_USBM004_MON','LEC008','SEM_2025_2','SPC_USBM_004'),(50,1,'CS_USBM004_WED','LEC008','SEM_2025_2','SPC_USBM_004'),(51,1,'CS_USBM006_MON','LEC010','SEM_2025_2','SPC_USBM_006'),(52,1,'CS_USBM006_WED','LEC010','SEM_2025_2','SPC_USBM_006'),(53,1,'CS_USBM008_TUE','LEC012','SEM_2025_2','SPC_USBM_008'),(54,1,'CS_USBM008_FRI','LEC012','SEM_2025_2','SPC_USBM_008'),(55,1,'CS_USBM008_MON','LEC014','SEM_2025_3','SPC_USBM_008'),(56,1,'CS_USBM008_WED','LEC014','SEM_2025_3','SPC_USBM_008'),(57,1,'CS_USBM010_TUE','LEC010','SEM_2025_3','SPC_USBM_010'),(58,1,'CS_USBM010_FRI','LEC010','SEM_2025_3','SPC_USBM_010'),(59,1,'CS_USBM009_MON','LEC013','SEM_2026_1','SPC_USBM_009'),(60,1,'CS_USBM009_WED','LEC013','SEM_2026_1','SPC_USBM_009'),(61,1,'CS_USBM011_TUE','LEC009','SEM_2026_1','SPC_USBM_011'),(62,1,'CS_USBM011_THU','LEC009','SEM_2026_1','SPC_USBM_011'),(63,1,'CS_USBM013_MON','LEC011','SEM_2026_1','SPC_USBM_013'),(64,1,'CS_USBM013_WED','LEC011','SEM_2026_1','SPC_USBM_013'),(65,1,'CS_USBM012_TUE','LEC010','SEM_2026_2','SPC_USBM_012'),(66,1,'CS_USBM012_FRI','LEC010','SEM_2026_2','SPC_USBM_012'),(67,1,'CS_USBM014_MON','LEC013','SEM_2026_2','SPC_USBM_014'),(68,1,'CS_USBM014_WED','LEC013','SEM_2026_2','SPC_USBM_014'),(69,1,'CS_USBM015_TUE','LEC014','SEM_2026_2','SPC_USBM_015'),(70,1,'CS_USBM015_THU','LEC014','SEM_2026_2','SPC_USBM_015'),(71,1,'CS_USBM016_MON','LEC012','SEM_2026_3','SPC_USBM_016'),(72,1,'CS_USBM016_WED','LEC012','SEM_2026_3','SPC_USBM_016'),(73,1,'CS_USBM016_FRI','LEC012','SEM_2026_3','SPC_USBM_016'),(74,1,'CS_AUSHM001_TUE','LEC015','SEM_2025_1','SPC_AUSHM_001'),(75,1,'CS_AUSHM001_THU','LEC015','SEM_2025_1','SPC_AUSHM_001'),(76,1,'CS_AUSHM001_FRI','LEC015','SEM_2025_1','SPC_AUSHM_001'),(77,1,'CS_AUSHM003_MON','LEC016','SEM_2025_1','SPC_AUSHM_003'),(78,1,'CS_AUSHM003_WED','LEC016','SEM_2025_1','SPC_AUSHM_003'),(79,1,'CS_AUSHM005_MON','LEC017','SEM_2025_1','SPC_AUSHM_005'),(80,1,'CS_AUSHM005_WED','LEC017','SEM_2025_1','SPC_AUSHM_005'),(81,1,'CS_AUSHM007_TUE','LEC015','SEM_2025_1','SPC_AUSHM_007'),(82,1,'CS_AUSHM007_THU','LEC015','SEM_2025_1','SPC_AUSHM_007'),(83,1,'CS_AUSHM002_MON','LEC015','SEM_2025_2','SPC_AUSHM_002'),(84,1,'CS_AUSHM002_WED','LEC015','SEM_2025_2','SPC_AUSHM_002'),(85,1,'CS_AUSHM002_FRI','LEC015','SEM_2025_2','SPC_AUSHM_002'),(86,1,'CS_AUSHM004_TUE','LEC016','SEM_2025_2','SPC_AUSHM_004'),(87,1,'CS_AUSHM004_THU','LEC016','SEM_2025_2','SPC_AUSHM_004'),(88,1,'CS_AUSHM006_MON','LEC018','SEM_2025_2','SPC_AUSHM_006'),(89,1,'CS_AUSHM006_WED','LEC018','SEM_2025_2','SPC_AUSHM_006'),(90,1,'CS_AUSHM008_TUE','LEC021','SEM_2025_2','SPC_AUSHM_008'),(91,1,'CS_AUSHM008_THU','LEC021','SEM_2025_2','SPC_AUSHM_008'),(92,1,'CS_AUSHM010_MON','LEC019','SEM_2025_3','SPC_AUSHM_010'),(93,1,'CS_AUSHM010_WED','LEC019','SEM_2025_3','SPC_AUSHM_010'),(94,1,'CS_AUSHM012_TUE','LEC018','SEM_2025_3','SPC_AUSHM_012'),(95,1,'CS_AUSHM012_THU','LEC018','SEM_2025_3','SPC_AUSHM_012'),(97,1,'CS_AUSHM009_WED','LEC017','SEM_2026_1','SPC_AUSHM_009'),(98,1,'CS_AUSHM011_TUE','LEC017','SEM_2026_1','SPC_AUSHM_011'),(99,1,'CS_AUSHM011_THU','LEC017','SEM_2026_1','SPC_AUSHM_011'),(100,1,'CS_AUSHM013_MON','LEC020','SEM_2026_1','SPC_AUSHM_013'),(101,1,'CS_AUSHM013_WED','LEC020','SEM_2026_1','SPC_AUSHM_013'),(102,1,'CS_AUSHM014_TUE','LEC021','SEM_2026_2','SPC_AUSHM_014'),(103,1,'CS_AUSHM014_THU','LEC021','SEM_2026_2','SPC_AUSHM_014'),(104,1,'CS_AUSHM015_MON','LEC022','SEM_2026_2','SPC_AUSHM_015'),(105,1,'CS_AUSHM015_WED','LEC022','SEM_2026_2','SPC_AUSHM_015'),(106,1,'CS_AUSHM016_MON','LEC020','SEM_2026_3','SPC_AUSHM_016'),(107,2,'CS_AUSHM016_WED','LEC020','SEM_2026_3','SPC_AUSHM_016');
/*!40000 ALTER TABLE `fact_lecturer_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_student_progress_summary`
--

DROP TABLE IF EXISTS `fact_student_progress_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_student_progress_summary` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total_completed_course` int NOT NULL,
  `total_credits_earned` int NOT NULL,
  `total_enrolled_course` int NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `study_plan_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcwxuuokqyhnfw6vvvhotllqp` (`student_id`),
  KEY `FKbnsyrsolmui1caiwlb1mm2guk` (`study_plan_id`),
  CONSTRAINT `FKbnsyrsolmui1caiwlb1mm2guk` FOREIGN KEY (`study_plan_id`) REFERENCES `dim_studyplan` (`study_plan_id`),
  CONSTRAINT `FKcwxuuokqyhnfw6vvvhotllqp` FOREIGN KEY (`student_id`) REFERENCES `dim_student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_student_progress_summary`
--

LOCK TABLES `fact_student_progress_summary` WRITE;
/*!40000 ALTER TABLE `fact_student_progress_summary` DISABLE KEYS */;
INSERT INTO `fact_student_progress_summary` VALUES (1,4,12,16,'STU001','UK_DS'),(2,4,9,16,'STU002','US_BM'),(3,4,12,16,'STU003','AUS_HM'),(5,6,12,6,'STU005','UK_DS');
/*!40000 ALTER TABLE `fact_student_progress_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_student_scholarship`
--

DROP TABLE IF EXISTS `fact_student_scholarship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_student_scholarship` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scholarship_percentage` int DEFAULT NULL,
  `scholarship_id` varchar(15) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKaqo3uy8e30rxuwmxngfkgvshh` (`scholarship_id`),
  KEY `FKhmfs0okq3kphwnlmif32roas0` (`student_id`),
  CONSTRAINT `FKaqo3uy8e30rxuwmxngfkgvshh` FOREIGN KEY (`scholarship_id`) REFERENCES `dim_scholarship` (`scholarship_id`),
  CONSTRAINT `FKhmfs0okq3kphwnlmif32roas0` FOREIGN KEY (`student_id`) REFERENCES `dim_student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_student_scholarship`
--

LOCK TABLES `fact_student_scholarship` WRITE;
/*!40000 ALTER TABLE `fact_student_scholarship` DISABLE KEYS */;
INSERT INTO `fact_student_scholarship` VALUES (1,100,'SCHOL001','STU001'),(2,50,'SCHOL002','STU002'),(3,50,'SCHOL003','STU003'),(4,50,'SCHOL106 ','STU004'),(5,50,'SCHOL001','STU005');
/*!40000 ALTER TABLE `fact_student_scholarship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_studentenrollment`
--

DROP TABLE IF EXISTS `fact_studentenrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_studentenrollment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `completion_status` varchar(20) NOT NULL,
  `enrollment_status` int NOT NULL,
  `exemption_status` bit(1) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `study_plan_course_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmylcr8ey30cc2jpyyd0okq5sl` (`student_id`),
  KEY `FKo4n8gvr4s9uvpptw5vsaxbn9u` (`study_plan_course_id`),
  CONSTRAINT `FKmylcr8ey30cc2jpyyd0okq5sl` FOREIGN KEY (`student_id`) REFERENCES `dim_student` (`student_id`),
  CONSTRAINT `FKo4n8gvr4s9uvpptw5vsaxbn9u` FOREIGN KEY (`study_plan_course_id`) REFERENCES `dim_study_plan_course` (`study_plan_course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_studentenrollment`
--

LOCK TABLES `fact_studentenrollment` WRITE;
/*!40000 ALTER TABLE `fact_studentenrollment` DISABLE KEYS */;
INSERT INTO `fact_studentenrollment` VALUES (1,'Completed',1,_binary '\0','STU001','SPC_UKDS_001'),(2,'Completed',1,_binary '\0','STU001','SPC_UKDS_002'),(3,'Completed',1,_binary '\0','STU001','SPC_UKDS_005'),(4,'Completed',1,_binary '\0','STU001','SPC_UKDS_007'),(5,'In Progress',1,_binary '\0','STU001','SPC_UKDS_003'),(6,'In Progress',1,_binary '\0','STU001','SPC_UKDS_006'),(7,'In Progress',1,_binary '\0','STU001','SPC_UKDS_008'),(8,'Upcoming',1,_binary '\0','STU001','SPC_UKDS_004'),(9,'Upcoming',1,_binary '\0','STU001','SPC_UKDS_008'),(10,'Upcoming',1,_binary '\0','STU001','SPC_UKDS_009'),(11,'Upcoming',1,_binary '\0','STU001','SPC_UKDS_010'),(12,'Upcoming',1,_binary '\0','STU001','SPC_UKDS_011'),(13,'Upcoming',1,_binary '\0','STU001','SPC_UKDS_012'),(14,'Upcoming',1,_binary '\0','STU001','SPC_UKDS_013'),(15,'Upcoming',1,_binary '\0','STU001','SPC_UKDS_014'),(16,'Upcoming',1,_binary '\0','STU001','SPC_UKDS_015'),(17,'Upcoming',1,_binary '\0','STU001','SPC_UKDS_016'),(18,'Completed',1,_binary '\0','STU002','SPC_USBM_001'),(19,'Completed',1,_binary '\0','STU002','SPC_USBM_003'),(20,'Completed',1,_binary '\0','STU002','SPC_USBM_005'),(21,'Completed',1,_binary '\0','STU002','SPC_USBM_007'),(22,'In Progress',1,_binary '\0','STU002','SPC_USBM_002'),(23,'In Progress',1,_binary '\0','STU002','SPC_USBM_004'),(24,'In Progress',1,_binary '\0','STU002','SPC_USBM_006'),(25,'In Progress',1,_binary '\0','STU002','SPC_USBM_008'),(26,'Upcoming',1,_binary '\0','STU002','SPC_USBM_008'),(27,'Upcoming',1,_binary '\0','STU002','SPC_USBM_009'),(28,'Upcoming',1,_binary '\0','STU002','SPC_USBM_010'),(29,'Upcoming',1,_binary '\0','STU002','SPC_USBM_011'),(30,'Upcoming',1,_binary '\0','STU002','SPC_USBM_012'),(31,'Upcoming',1,_binary '\0','STU002','SPC_USBM_013'),(32,'Upcoming',1,_binary '\0','STU002','SPC_USBM_014'),(33,'Upcoming',1,_binary '\0','STU002','SPC_USBM_015'),(34,'Upcoming',1,_binary '\0','STU002','SPC_USBM_016'),(35,'Completed',1,_binary '\0','STU003','SPC_AUSHM_001'),(36,'Completed',1,_binary '\0','STU003','SPC_AUSHM_003'),(37,'Completed',1,_binary '\0','STU003','SPC_AUSHM_005'),(38,'Completed',1,_binary '\0','STU003','SPC_AUSHM_007'),(39,'In Progress',1,_binary '\0','STU003','SPC_AUSHM_002'),(40,'In Progress',1,_binary '\0','STU003','SPC_AUSHM_004'),(41,'In Progress',1,_binary '\0','STU003','SPC_AUSHM_006'),(42,'In Progress',1,_binary '\0','STU003','SPC_AUSHM_008'),(43,'Upcoming',1,_binary '\0','STU003','SPC_AUSHM_009'),(44,'Upcoming',1,_binary '\0','STU003','SPC_AUSHM_010'),(45,'Upcoming',1,_binary '\0','STU003','SPC_AUSHM_011'),(46,'Upcoming',1,_binary '\0','STU003','SPC_AUSHM_012'),(47,'Upcoming',1,_binary '\0','STU003','SPC_AUSHM_013'),(48,'Upcoming',1,_binary '\0','STU003','SPC_AUSHM_014'),(49,'Upcoming',1,_binary '\0','STU003','SPC_AUSHM_015'),(50,'Upcoming',1,_binary '\0','STU003','SPC_AUSHM_016'),(52,'Completed',1,_binary '\0','STU005','SPC_UKDS_007');
/*!40000 ALTER TABLE `fact_studentenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_transcript_issue_request`
--

DROP TABLE IF EXISTS `fact_transcript_issue_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_transcript_issue_request` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `issued_date` date DEFAULT NULL,
  `optional_message` varchar(255) DEFAULT NULL,
  `request_status` varchar(50) NOT NULL,
  `admin_id` varchar(50) DEFAULT NULL,
  `request_id` varchar(15) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkg8sms81fsmsds7wum2j7l1sn` (`admin_id`),
  KEY `FKjp3l83ew1psf4vv2wt9w0ubw5` (`request_id`),
  KEY `FKridqcxvlcvcagp7ph5lbkaikq` (`student_id`),
  CONSTRAINT `FKjp3l83ew1psf4vv2wt9w0ubw5` FOREIGN KEY (`request_id`) REFERENCES `dim_transcript_request` (`request_id`),
  CONSTRAINT `FKkg8sms81fsmsds7wum2j7l1sn` FOREIGN KEY (`admin_id`) REFERENCES `dim_admin` (`admin_id`),
  CONSTRAINT `FKridqcxvlcvcagp7ph5lbkaikq` FOREIGN KEY (`student_id`) REFERENCES `dim_student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_transcript_issue_request`
--

LOCK TABLES `fact_transcript_issue_request` WRITE;
/*!40000 ALTER TABLE `fact_transcript_issue_request` DISABLE KEYS */;
INSERT INTO `fact_transcript_issue_request` VALUES (1,'2024-05-15','Sent via email','Issued','ADM001','TRQ_001','STU001'),(2,'2025-10-07','Awaiting payment confirmation','Issued',NULL,'TRQ_002','STU002'),(3,'2024-06-01','Second copy sent via email','Issued','ADM001','TRQ_003','STU001'),(4,NULL,'Requested by student','Pending',NULL,'TRQ_004','STU003'),(5,'2024-06-05','Sent to partner university','Issued','ADM002','TRQ_005','STU002'),(6,'2025-10-07','My name is Vana','Issued',NULL,'TR8441E01B-97FB','STU001'),(7,'2025-10-07','hi','Issued',NULL,'TR2683A342-27E2','STU001');
/*!40000 ALTER TABLE `fact_transcript_issue_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_tuitionpayment`
--

DROP TABLE IF EXISTS `fact_tuitionpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_tuitionpayment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount_paid` float DEFAULT NULL,
  `payment_method` int DEFAULT NULL,
  `payment_status` int DEFAULT NULL,
  `scholarship_id` varchar(15) DEFAULT NULL,
  `student_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs3q9qnjxx38kqjn5a2o80p7sy` (`scholarship_id`),
  KEY `FK1qu2j36l3ay4hcs7krlvgo3x0` (`student_id`),
  CONSTRAINT `FK1qu2j36l3ay4hcs7krlvgo3x0` FOREIGN KEY (`student_id`) REFERENCES `dim_student` (`student_id`),
  CONSTRAINT `FKs3q9qnjxx38kqjn5a2o80p7sy` FOREIGN KEY (`scholarship_id`) REFERENCES `dim_scholarship` (`scholarship_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_tuitionpayment`
--

LOCK TABLES `fact_tuitionpayment` WRITE;
/*!40000 ALTER TABLE `fact_tuitionpayment` DISABLE KEYS */;
INSERT INTO `fact_tuitionpayment` VALUES (1,1000,1,1,'SCHOL001','STU001'),(2,2700,2,1,'SCHOL002','STU002'),(3,0,1,1,'SCHOL005','STU001'),(4,1620,2,1,'SCHOL003','STU002'),(5,100,1,1,NULL,'STU001');
/*!40000 ALTER TABLE `fact_tuitionpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_visa_extension_request`
--

DROP TABLE IF EXISTS `fact_visa_extension_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_visa_extension_request` (
  `extension_request_id` varchar(50) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `requested_extension_until` date DEFAULT NULL,
  `status` int DEFAULT NULL,
  `admin_id` varchar(50) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `visa_passport_id` varchar(15) NOT NULL,
  PRIMARY KEY (`extension_request_id`),
  KEY `FK2957cdtmgv746kfixidouofgt` (`admin_id`),
  KEY `FKejegpytokbgxm093x4ahfky2e` (`student_id`),
  KEY `FKjgi3ln467a5ook7ubsai1j1vv` (`visa_passport_id`),
  CONSTRAINT `FK2957cdtmgv746kfixidouofgt` FOREIGN KEY (`admin_id`) REFERENCES `dim_admin` (`admin_id`),
  CONSTRAINT `FKejegpytokbgxm093x4ahfky2e` FOREIGN KEY (`student_id`) REFERENCES `dim_student` (`student_id`),
  CONSTRAINT `FKjgi3ln467a5ook7ubsai1j1vv` FOREIGN KEY (`visa_passport_id`) REFERENCES `dim_visa_passport` (`visa_passport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_visa_extension_request`
--

LOCK TABLES `fact_visa_extension_request` WRITE;
/*!40000 ALTER TABLE `fact_visa_extension_request` DISABLE KEYS */;
INSERT INTO `fact_visa_extension_request` VALUES ('VER_STU001_01','Awaiting documentation','2024-05-01','2025-07-01',1,'ADM001','STU001','VP_STU001_01'),('VER_STU001_02','Documentation incomplete','2024-10-01','2026-01-01',2,'ADM001','STU001','VP_STU001_01'),('VER_STU002_01',NULL,'2024-04-15','2024-10-15',1,'ADM001','STU002','VP_STU002_01'),('VER_STU003_01','Initial request','2024-05-10','2025-05-10',1,'ADM001','STU003','VP_STU003_01'),('VER52640262cna','Visaextension requestfrom student','2025-10-07','2026-01-07',1,'ADM001','STU002','VP_STU002_01');
/*!40000 ALTER TABLE `fact_visa_extension_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subdim_city`
--

DROP TABLE IF EXISTS `subdim_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdim_city` (
  `city_id` varchar(15) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subdim_city`
--

LOCK TABLES `subdim_city` WRITE;
/*!40000 ALTER TABLE `subdim_city` DISABLE KEYS */;
INSERT INTO `subdim_city` VALUES ('BD','Bien Hoa'),('CT','Can Tho'),('DN','Da Nang'),('HCM','Ho Chi Minh City'),('HN','Hanoi'),('HP','Hai Phong'),('NT','Nha Trang'),('RGN','Yangon'),('VT','Vung Tau'),('Yangon','Yangon'),('YGN','Yangon');
/*!40000 ALTER TABLE `subdim_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subdim_partner_institute`
--

DROP TABLE IF EXISTS `subdim_partner_institute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdim_partner_institute` (
  `partner_institution_id` varchar(15) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `institution_name` varchar(255) NOT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `logo_path` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`partner_institution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subdim_partner_institute`
--

LOCK TABLES `subdim_partner_institute` WRITE;
/*!40000 ALTER TABLE `subdim_partner_institute` DISABLE KEYS */;
INSERT INTO `subdim_partner_institute` VALUES ('PI001','info@london.ac.uk','University of London','https://www.london.ac.uk',NULL),('PI002','contact@calstate.edu','California State University','https://www.calstate.edu',NULL),('PI003','international@unsw.edu.au','University of New South Wales','https://www.unsw.edu.au',NULL),('PI004','info@sydney.edu.au','University of Sydney','https://www.sydney.edu.au',NULL),('PI005','enquiries@rmit.edu.au','RMIT University','https://www.rmit.edu.au',NULL),('PI006','aab@ac.us','dddd','https://aab.edu',NULL);
/*!40000 ALTER TABLE `subdim_partner_institute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subdim_ward`
--

DROP TABLE IF EXISTS `subdim_ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdim_ward` (
  `ward_id` varchar(50) NOT NULL,
  `ward_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subdim_ward`
--

LOCK TABLES `subdim_ward` WRITE;
/*!40000 ALTER TABLE `subdim_ward` DISABLE KEYS */;
INSERT INTO `subdim_ward` VALUES ('BT','Binh Tri'),('BTH','Binh Thanh'),('CCH','Cau Kho'),('LD','Long Dien'),('LH','Le Hong Phong'),('NTH','Nguyen Thai Hoc'),('PHU','Phu Nhuan'),('PMH','Phu My Hung'),('TDN','Tan Dinh'),('TDT','Tan Duong Thuan'),('TN','Tan Nhut'),('VL','Vinh Loi'),('XT','Xuan Thoi');
/*!40000 ALTER TABLE `subdim_ward` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-05 23:53:21
