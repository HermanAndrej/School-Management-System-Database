-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: schoolmanagementsystem
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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attendance_id` int NOT NULL AUTO_INCREMENT,
  `attendance_status` enum('Present','Absent') DEFAULT NULL,
  `class_timetable_id` int NOT NULL,
  `student_id` int NOT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `class_timetable_id` (`class_timetable_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`class_timetable_id`) REFERENCES `class_timetables` (`class_timetable_id`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,'Present',1,1),(2,'Present',2,2),(3,'Absent',3,3),(4,'Present',4,4),(5,'Absent',5,5),(6,'Present',6,6),(7,'Absent',7,7),(8,'Absent',8,8),(9,'Present',9,9),(10,'Present',10,10);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_dates`
--

DROP TABLE IF EXISTS `attendance_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_dates` (
  `attendance_dates_id` int NOT NULL AUTO_INCREMENT,
  `attendance_date` date NOT NULL,
  `attendance_id` int NOT NULL,
  PRIMARY KEY (`attendance_dates_id`),
  KEY `attendance_id` (`attendance_id`),
  CONSTRAINT `attendance_dates_ibfk_1` FOREIGN KEY (`attendance_id`) REFERENCES `attendance` (`attendance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_dates`
--

LOCK TABLES `attendance_dates` WRITE;
/*!40000 ALTER TABLE `attendance_dates` DISABLE KEYS */;
INSERT INTO `attendance_dates` VALUES (11,'2023-05-01',1),(12,'2023-05-02',2),(13,'2023-05-03',3),(14,'2023-05-04',4),(15,'2023-05-05',5),(16,'2023-05-06',6),(17,'2023-05-07',7),(18,'2023-05-08',8),(19,'2023-05-09',9),(20,'2023-05-10',10);
/*!40000 ALTER TABLE `attendance_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_subjects`
--

DROP TABLE IF EXISTS `class_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_subjects` (
  `class_subject_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `subject_id` int NOT NULL,
  PRIMARY KEY (`class_subject_id`),
  KEY `class_id` (`class_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `class_subjects_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  CONSTRAINT `class_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_subjects`
--

LOCK TABLES `class_subjects` WRITE;
/*!40000 ALTER TABLE `class_subjects` DISABLE KEYS */;
INSERT INTO `class_subjects` VALUES (1,1,2),(2,1,5),(3,1,8),(4,2,1),(5,2,4),(6,3,3),(7,4,5),(8,5,9),(9,6,2),(10,7,6);
/*!40000 ALTER TABLE `class_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_timetables`
--

DROP TABLE IF EXISTS `class_timetables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_timetables` (
  `class_timetable_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `timetable_id` int NOT NULL,
  PRIMARY KEY (`class_timetable_id`),
  KEY `class_id` (`class_id`),
  KEY `timetable_id` (`timetable_id`),
  CONSTRAINT `class_timetables_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  CONSTRAINT `class_timetables_ibfk_2` FOREIGN KEY (`timetable_id`) REFERENCES `timetable` (`timetable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_timetables`
--

LOCK TABLES `class_timetables` WRITE;
/*!40000 ALTER TABLE `class_timetables` DISABLE KEYS */;
INSERT INTO `class_timetables` VALUES (1,1,3),(2,2,7),(3,3,1),(4,4,9),(5,5,2),(6,6,6),(7,7,4),(8,8,10),(9,9,5),(10,10,8);
/*!40000 ALTER TABLE `class_timetables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) NOT NULL,
  `classroom_number` varchar(50) NOT NULL,
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `unique_class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'I-A','A101'),(2,'II-A','B202'),(3,'II-B','B203'),(4,'III-A','C303'),(5,'IV-B','D404'),(6,'V-A','E505'),(7,'V-C','E507'),(8,'VI-B','F606'),(9,'VII-A','G707'),(10,'VIII-B','H808');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `enrollment_id` int NOT NULL AUTO_INCREMENT,
  `enrollment_date` date NOT NULL,
  `class_id` int NOT NULL,
  `student_id` int NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  UNIQUE KEY `unique_enrollment` (`class_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,'2022-01-01',1,1),(2,'2022-01-02',1,2),(3,'2022-01-03',1,3),(4,'2022-01-04',2,4),(5,'2022-01-05',2,5),(6,'2022-01-06',3,6),(7,'2022-01-07',3,7),(8,'2022-01-08',3,8),(9,'2022-01-09',4,9),(10,'2022-01-10',5,10),(11,'2022-01-11',6,1),(12,'2022-01-12',7,2),(13,'2022-01-13',8,3),(14,'2022-01-14',9,4),(15,'2022-01-15',10,5);
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `grade_id` int NOT NULL AUTO_INCREMENT,
  `grade` int NOT NULL,
  `assignment_type` varchar(30) DEFAULT NULL,
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  PRIMARY KEY (`grade_id`),
  KEY `student_id` (`student_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  CONSTRAINT `grade_range` CHECK (((`grade` >= 1) and (`grade` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,4,'Midterm Exam',1,1),(2,3,'Quiz',1,2),(3,5,'Final Exam',1,3),(4,2,'Essay',2,4),(5,4,'Project',2,5),(6,3,'Lab Report',2,6),(7,5,'Final Exam',3,7),(8,4,'Homework',3,8),(9,5,'Midterm Exam',3,9),(10,3,'Quiz',4,10),(11,4,'Essay',4,1),(12,2,'Lab Report',5,2),(13,5,'Project',5,3),(14,3,'Homework',5,4),(15,4,'Quiz',6,5),(16,5,'Midterm Exam',6,6),(17,2,'Project',6,7),(18,4,'Essay',7,8),(19,5,'Lab Report',7,9),(20,3,'Final Exam',7,10);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `address` varchar(100) NOT NULL,
  `email_address` varchar(100) NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email_address_unique` (`email_address`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Giorno','Giovanna','2011-04-16','other','Viale F. Ruffo di Calabria','giorno.giovanna@email.com'),(2,'Yaya','Toure','2012-02-08','male','Oxford Street II','yaya.toure@live.com'),(3,'Method','Man','2011-10-23','male','Staten Island Hill','method.man@email.com'),(4,'Mikasa','Ackerman','2011-09-02','female','Paradis Island Boulevard','mikasa.ackerman@email.com'),(5,'Carl','Johnson','2011-11-29','male','Grove Street','carl.johnson@live.com'),(6,'Amy','Winehouse','2012-07-11','female','Forest Hill 21','amy.winehouse@yahoo.com'),(7,'Donatella','Versace','2012-04-13','female','Italian Street 9','dona.versace@email.com'),(8,'Ariana','Jaeger','2010-02-16','other','London Street 33','giorno.giovanna@yahoo.com'),(9,'Gojo','Satoru','2010-01-30','male','Trap Street 7','gojo.satoru@email.com'),(10,'Jotaro','Kujo','2012-12-31','male','Morioh Hill 22','jotaro.kujo@live.com');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(50) NOT NULL,
  `subject_description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  UNIQUE KEY `unique_subject_name` (`subject_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Mathematics','Study of numbers, quantities, and shapes'),(2,'English','Study of the English language and literature'),(3,'History','Study of past events, particularly in human affairs'),(4,'Science','Study of the natural world through observation and experiment'),(5,'Art','Study of creativity and self-expression through various mediums'),(6,'Physical Education','Study of physical fitness and sports activities'),(7,'Social Studies','Study of human society and culture'),(8,'Computer Science','Study of computers and computing technology'),(9,'Music','Study of musical theory and performance'),(10,'Marine Biology','Marine biology studies ocean life, ecosystems, and conservation strategies');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_subjects`
--

DROP TABLE IF EXISTS `teacher_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_subjects` (
  `teacher_subjects_id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int NOT NULL,
  `subject_id` int NOT NULL,
  PRIMARY KEY (`teacher_subjects_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `teacher_subjects_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  CONSTRAINT `teacher_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_subjects`
--

LOCK TABLES `teacher_subjects` WRITE;
/*!40000 ALTER TABLE `teacher_subjects` DISABLE KEYS */;
INSERT INTO `teacher_subjects` VALUES (1,1,3),(2,2,6),(3,3,4),(4,4,7),(5,5,1),(6,6,9),(7,7,2),(8,8,8),(9,9,5),(10,10,2);
/*!40000 ALTER TABLE `teacher_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `teacher_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `address` varchar(100) NOT NULL,
  `email_address` varchar(100) NOT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `email_address_unique` (`email_address`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'John','Smith','1980-05-14','male','123 Main St','john.smith@yahoo.com'),(2,'Emily','Jones','1985-02-22','female','456 Park Ave','emily.jones@hotmail.com'),(3,'David','Lee','1978-11-08','other','789 Broadway','david.lee@live.com'),(4,'Sarah','Johnson','1983-09-10','female','101 State St','sarah.johnson@yahoo.com'),(5,'Michael','Brown','1975-07-03','other','555 Elm St','michael.brown@gmail.com'),(6,'Jessica','Davis','1989-04-17','female','888 Pine St','jessica.davis@yahoo.com'),(7,'Matthew','Wilson','1982-01-29','other','222 Oak St','matthew.wilson@live.com'),(8,'Rachel','Taylor','1987-12-11','female','444 Maple Ave','rachel.taylor@gmail.com'),(9,'Christopher','Anderson','1979-06-26','other','777 Cedar St','christopher.anderson@yahoo.com'),(10,'Stephanie','Moore','1984-03-08','female','333 Walnut St','stephanie.moore@gmail.com');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable` (
  `timetable_id` int NOT NULL AUTO_INCREMENT,
  `day_of_the_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`timetable_id`),
  CONSTRAINT `check_start_time_before_end_time` CHECK ((`start_time` < `end_time`))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES (1,'Monday','09:00:00','10:30:00'),(2,'Monday','11:00:00','12:30:00'),(3,'Tuesday','10:00:00','11:30:00'),(4,'Tuesday','13:00:00','14:30:00'),(5,'Wednesday','14:00:00','15:30:00'),(6,'Wednesday','16:00:00','17:30:00'),(7,'Thursday','12:00:00','13:30:00'),(8,'Thursday','14:00:00','15:30:00'),(9,'Friday','11:00:00','12:30:00'),(10,'Friday','15:00:00','16:30:00');
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-07 15:10:29
