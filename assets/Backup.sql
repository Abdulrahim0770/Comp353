-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: crc353_1
-- ------------------------------------------------------
-- Server version	5.6.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Admin` (
  `userID` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES (1,'admin','123qwe');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Advisor`
--

DROP TABLE IF EXISTS `Advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Advisor` (
  `AdvisorID` int(11) NOT NULL AUTO_INCREMENT,
  `ProgramID` int(11) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `building` varchar(45) DEFAULT NULL,
  `room` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AdvisorID`),
  KEY `Advisor_ibfk_1_idx` (`ProgramID`),
  CONSTRAINT `Advisor_ibfk_1` FOREIGN KEY (`ProgramID`) REFERENCES `Program` (`ProgramID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Advisor`
--

LOCK TABLES `Advisor` WRITE;
/*!40000 ALTER TABLE `Advisor` DISABLE KEYS */;
INSERT INTO `Advisor` VALUES (1,7,'Alfred','Marks','Hall','305','514-555-9100','jm@concordia.ca'),(2,8,'Pam','Ly','Hall','413','514-555-9101','pl@concordia.ca'),(3,9,'Sam','Don','Hall','521','514-555-9102','sd@concordia.ca'),(4,10,'Ron','Wees','Hall','445','514-555-9103','rw@concordia.ca'),(5,11,'Tacko','Fall','Hall','821','514-555-9104','tf@concordia.ca'),(6,12,'Slim','Jim','Hall','902','514-555-9105','sj@concordia.ca'),(7,13,'Ari','Len','Hall','100','514-555-9106','al@concordia.ca'),(8,14,'Les','Brown','Hall','505','514-555-9107','lb@concordia.ca'),(9,15,'Danie','Samp','Hall','620','514-555-9108','ds@concordia.ca'),(10,16,'Liam','Alcalde','Hall','710','514-555-9109','la@concordia.ca'),(11,17,'Fran','Berry','EV','300','514-555-9110','fb@concordia.ca'),(12,29,'Rondo','Rajon','EV','400','514-555-9111','rr@concordia.ca'),(14,30,'La','La','EV','100','514-555-9120','ll@concordia.ca'),(15,31,'Manny','Marinez','EV','101','514-555-9130','mm@concordia.ca'),(16,32,'Robert','Covington','EV','102','514-555-9140','roco@concordia.ca');
/*!40000 ALTER TABLE `Advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Award`
--

DROP TABLE IF EXISTS `Award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Award` (
  `AwardID` int(11) NOT NULL AUTO_INCREMENT,
  `AwardName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AwardID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Award`
--

LOCK TABLES `Award` WRITE;
/*!40000 ALTER TABLE `Award` DISABLE KEYS */;
INSERT INTO `Award` VALUES (1,'FQRSC'),(2,'SSHRC'),(3,'Mahlab Fellowship'),(4,'Lowther Graduate'),(5,'Irish Scholarship');
/*!40000 ALTER TABLE `Award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Building`
--

DROP TABLE IF EXISTS `Building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Building` (
  `BuildingID` int(11) NOT NULL AUTO_INCREMENT,
  `CampusID` int(11) DEFAULT NULL,
  `BuildingName` varchar(255) DEFAULT NULL,
  `BuildingAddress` varchar(255) DEFAULT NULL,
  `totalFloors` int(11) DEFAULT NULL,
  PRIMARY KEY (`BuildingID`),
  KEY `CampusID` (`CampusID`),
  CONSTRAINT `Building_ibfk_1` FOREIGN KEY (`CampusID`) REFERENCES `Campus` (`CampusID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Building`
--

LOCK TABLES `Building` WRITE;
/*!40000 ALTER TABLE `Building` DISABLE KEYS */;
INSERT INTO `Building` VALUES (1,1,'EV','1515 Saint-Catherine St W',10),(2,1,'FB','1250 Guy St',10),(3,1,'FG','1616 Saint-Catherine St W',11),(4,1,'LB','1400 Maisonneuve Blvd W',13),(5,1,'MB','1600 Boulevard de Maisonneuve O',10),(6,2,'AD','7141 Sherbrooke W',9),(7,2,'CB','7141 Sherbrooke W',6),(8,2,'CJ','7141 Sherbrooke W',7),(9,2,'DO','7141 Sherbrooke W',4),(10,2,'PC','7200 Sherbrooke W',9);
/*!40000 ALTER TABLE `Building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Campus`
--

DROP TABLE IF EXISTS `Campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Campus` (
  `CampusID` int(11) NOT NULL AUTO_INCREMENT,
  `CampusName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CampusID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Campus`
--

LOCK TABLES `Campus` WRITE;
/*!40000 ALTER TABLE `Campus` DISABLE KEYS */;
INSERT INTO `Campus` VALUES (1,'SGW'),(2,'Loyola');
/*!40000 ALTER TABLE `Campus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Chairman`
--

DROP TABLE IF EXISTS `Chairman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Chairman` (
  `ChairmanID` int(11) NOT NULL AUTO_INCREMENT,
  `InstructorID` int(11) DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ChairmanID`),
  KEY `InstructorID` (`InstructorID`),
  KEY `DepartmentID` (`DepartmentID`),
  CONSTRAINT `Chairman_ibfk_1` FOREIGN KEY (`InstructorID`) REFERENCES `Instructor` (`InstructorID`),
  CONSTRAINT `Chairman_ibfk_2` FOREIGN KEY (`DepartmentID`) REFERENCES `Department` (`DepartmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chairman`
--

LOCK TABLES `Chairman` WRITE;
/*!40000 ALTER TABLE `Chairman` DISABLE KEYS */;
INSERT INTO `Chairman` VALUES (1,1,1),(2,2,2),(3,6,3),(4,7,4),(5,8,5),(6,3,6),(7,4,7),(8,5,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `Chairman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contract`
--

DROP TABLE IF EXISTS `Contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Contract` (
  `ContractID` int(11) NOT NULL AUTO_INCREMENT,
  `SectionID` int(11) DEFAULT NULL,
  `contractName` varchar(244) DEFAULT NULL,
  `contractStartDate` date DEFAULT NULL,
  `contractEndDate` date DEFAULT NULL,
  `contractPay` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`ContractID`),
  KEY `Contract_ibfk_1_idx` (`SectionID`),
  CONSTRAINT `Contract_ibfk_1` FOREIGN KEY (`SectionID`) REFERENCES `Section` (`SectionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contract`
--

LOCK TABLES `Contract` WRITE;
/*!40000 ALTER TABLE `Contract` DISABLE KEYS */;
INSERT INTO `Contract` VALUES (1,1,'Marker','2018-08-09','2020-08-09',8000.00),(2,2,'TA','2019-02-05','2020-02-05',5000.00),(3,3,'Marker','2017-06-07','2019-06-07',4500.00),(4,4,'TA','2019-01-01','2021-01-01',7000.00),(5,5,'TA','2019-03-10','2019-10-10',2500.00),(6,6,'Marker','2018-04-04','2020-04-04',10000.00),(7,94,'TA','2019-05-02','2020-05-02',6000.00),(8,8,'TA','2018-08-12','2019-08-12',5500.00),(9,9,'Marker','2019-10-06','2020-10-06',7500.00),(10,10,'TA','2019-01-07','2020-01-07',7500.00),(12,11,'Marker','2018-08-09','2020-08-09',8000.00),(13,12,'TA','2019-02-05','2020-02-05',5000.00),(14,13,'Marker','2017-06-07','2019-06-07',4500.00),(15,14,'Marker','2019-01-01','2021-01-01',7000.00),(16,15,'TA','2019-03-10','2019-10-10',2500.00),(17,16,'TA','2018-04-04','2020-04-04',10000.00),(18,17,'Marker','2018-04-04','2020-04-04',10000.00),(19,18,'Marker','2018-04-04','2020-04-04',10000.00),(20,19,'TA','2019-01-07','2020-01-07',7500.00),(21,20,'TA','2019-01-07','2020-01-07',7500.00),(22,75,'TA','2019-01-07','2020-01-07',4500.00),(23,76,'TA','2019-01-07','2020-01-07',4500.00),(24,77,'TA','2019-01-07','2020-01-07',4500.00),(25,78,'TA','2019-01-07','2020-01-07',4500.00),(26,79,'TA','2019-01-07','2020-01-07',4500.00),(27,80,'TA','2019-01-07','2020-01-07',4500.00),(28,81,'TA','2019-01-07','2020-01-07',4500.00),(29,82,'TA','2019-01-07','2020-01-07',4500.00),(30,94,'TA','2019-01-07','2020-01-07',4500.00),(31,94,'TA','2019-01-07','2020-01-07',4500.00),(32,94,'TA','2019-01-07','2020-01-07',4500.00),(33,94,'TA','2019-01-07','2020-01-07',4500.00);
/*!40000 ALTER TABLE `Contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Course` (
  `CourseID` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentID` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  PRIMARY KEY (`CourseID`),
  KEY `Course_ibfk_1` (`DepartmentID`),
  CONSTRAINT `Course_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `Department` (`DepartmentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES (1,7,'Art 201',3),(2,4,'Comp 352',3),(3,7,'Art 101',1),(4,9,'Sci 201',3),(5,4,'Comp 353',3),(6,1,'Math 205',3),(7,3,'Mech 332',3),(8,10,'Law 101',2),(9,4,'Comp 355',4),(10,4,'Comp 391',4),(11,5,'Buss 201',3),(12,6,'Comm 104',3),(13,8,'Saxp 379',1),(14,1,'Math 206',3),(15,1,'Math 204',3),(16,1,'Math 232',3),(17,1,'Math 233',3),(18,7,'Art 233',3),(19,7,'Art 234',3),(20,7,'Art 355',3),(21,4,'Data Structures',4),(22,4,'Syntax Checking',1),(23,3,'Mech 201',3),(24,3,'Mech 202',3),(25,3,'Mech 203',3),(26,3,'Mech 232',3),(27,3,'Mech 233',3),(28,5,'Psyc 232',3),(29,5,'Psyc 233',3),(30,5,'Psyc 345',3),(31,5,'Psyc 248',3),(32,5,'Psyc 249',3),(33,2,'Phys 101',3),(34,2,'Phys 202',3),(35,2,'Phys 232',3),(36,2,'Phys 355',3),(37,2,'Phys 400',4),(38,6,'Comm 305',3),(39,6,'Comm 200',3),(40,6,'Comm 223',3),(41,6,'Comm 376',3),(42,8,'Mus 100',3),(43,8,'Mus 201',3),(44,8,'Mus 300',3),(45,8,'Mus 233',3),(46,8,'Mus 355',3),(47,9,'Sci 100',3),(48,9,'Sci 200',3),(49,9,'Sci 250',3),(50,9,'Sci 380',3),(51,10,'Law 232',3),(52,10,'Law 238',3),(53,10,'Law 340',3),(54,10,'Law 355',3);
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CourseGraduate`
--

DROP TABLE IF EXISTS `CourseGraduate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `CourseGraduate` (
  `CourseGraduateID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CourseGraduateID`),
  KEY `CourseGraduate_ibfk_1` (`StudentID`),
  CONSTRAINT `CourseGraduate_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseGraduate`
--

LOCK TABLES `CourseGraduate` WRITE;
/*!40000 ALTER TABLE `CourseGraduate` DISABLE KEYS */;
INSERT INTO `CourseGraduate` VALUES (16,1000006),(17,1000007),(19,1000009);
/*!40000 ALTER TABLE `CourseGraduate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Degree`
--

DROP TABLE IF EXISTS `Degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Degree` (
  `DegreeID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) DEFAULT NULL,
  `degreeName` varchar(45) DEFAULT NULL,
  `institutionName` varchar(45) DEFAULT NULL,
  `receivedDate` date DEFAULT NULL,
  `overallAvg` int(11) DEFAULT NULL,
  PRIMARY KEY (`DegreeID`),
  KEY `Degree_ibfk_1_idx` (`StudentID`),
  CONSTRAINT `Degree_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Degree`
--

LOCK TABLES `Degree` WRITE;
/*!40000 ALTER TABLE `Degree` DISABLE KEYS */;
INSERT INTO `Degree` VALUES (1,1000006,'BA','Concordia University','2019-06-30',75),(2,1000007,'BSc','Concordia University','2018-12-30',83),(3,1000009,'BEd','Concordia University','2018-12-30',65),(4,1000023,'BComm','Concordia University','2019-06-30',72),(5,1000025,'BCompSc','Concordia University','2018-12-30',94),(6,1000026,'BEng','Concordia University','2018-12-30',98),(7,1000027,'BFA','Concordia University','2019-06-30',62),(8,1000028,'BCompSc','Concordia University','2018-12-30',60),(9,1000029,'BComm','Concordia University','2018-12-30',78),(10,1000058,'BFA','Concordia University','2019-06-30',86),(29,1000006,'DEC CST','Vanier College','2016-06-30',77),(30,1000007,'DEC BA','Vanier College','2016-06-30',85),(31,1000009,'DEC IE','Vanier College','2016-07-30',88),(32,1000023,'DEC AH','Vanier College','2016-06-20',89),(33,1000025,'DEC CST','Vanier College','2016-08-30',90),(34,1000011,'DEC IE','Vanier College','2016-03-30',63),(35,1000012,'DEC AT','Vanier College','2016-05-30',66),(36,1000013,'DEC CST','Vanier College','2016-06-30',88),(37,1000014,'DEC CST','Vanier College','2016-05-25',83),(38,1000015,'HS Diploma','McDonald\'s High','2012-05-25',80),(39,1000016,'HS Diploma','McDonald\'s High','2012-05-25',81),(40,1000017,'HS Diploma','McDonald\'s High','2012-05-25',88),(41,1000018,'HS Diploma','McDonald\'s High','2012-05-25',78),(42,1000019,'HS Diploma','McDonald\'s High','2012-05-25',79),(43,1000020,'HS Diploma','McDonald\'s High','2012-05-25',70),(44,1000021,'HS Diploma','McDonald\'s High','2012-05-25',65),(45,1000022,'HS Diploma','McDonald\'s High','2012-05-25',65),(46,1000026,'HS Diploma','McDonald\'s High','2012-05-25',78),(47,1000030,'HS Diploma','McDonald\'s High','2012-05-25',88),(48,1000031,'HS Diploma','McDonald\'s High','2012-05-25',90),(49,1000032,'HS Diploma','McDonald\'s High','2012-05-25',92),(50,1000033,'HS Diploma','McDonald\'s High','2012-05-25',94);
/*!40000 ALTER TABLE `Degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DegreeUni`
--

DROP TABLE IF EXISTS `DegreeUni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `DegreeUni` (
  `DegreeUniID` int(11) NOT NULL AUTO_INCREMENT,
  `InstructorID` int(11) DEFAULT NULL,
  `degreeName` varchar(255) DEFAULT NULL,
  `institutionName` varchar(255) DEFAULT NULL,
  `receivedDate` date DEFAULT NULL,
  `overallAvg` int(11) DEFAULT NULL,
  PRIMARY KEY (`DegreeUniID`),
  KEY `InstructorID` (`InstructorID`),
  CONSTRAINT `DegreeUni_ibfk_1` FOREIGN KEY (`InstructorID`) REFERENCES `Instructor` (`InstructorID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DegreeUni`
--

LOCK TABLES `DegreeUni` WRITE;
/*!40000 ALTER TABLE `DegreeUni` DISABLE KEYS */;
INSERT INTO `DegreeUni` VALUES (1,1,'BCompSc','Concordia University','2018-12-30',82),(2,2,'BA','Concordia University','2018-12-30',88),(3,3,'BCompSc','Concordia University','2019-06-30',90),(4,4,'BFA','Concordia University','2019-06-30',77),(5,5,'BCompSc','Concordia University','2018-12-30',75),(6,6,'BComm','Concordia University','2019-06-30',67),(7,7,'BCompSc','Concordia University','2018-12-30',80),(8,8,'BComm','Concordia University','2019-06-30',93),(9,9,'BEng','Concordia University','2018-12-30',85),(10,10,'BEng','Concordia University','2018-12-30',78);
/*!40000 ALTER TABLE `DegreeUni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Department` (
  `DepartmentID` int(11) NOT NULL AUTO_INCREMENT,
  `InstructorID` int(11) DEFAULT NULL,
  `BuildingID` int(11) DEFAULT NULL,
  `departmentName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`),
  KEY `Department_ibfk_1_idx` (`InstructorID`),
  KEY `Buidling_ibfk_1_idx` (`BuildingID`),
  CONSTRAINT `Building_ibfk_2` FOREIGN KEY (`BuildingID`) REFERENCES `Building` (`BuildingID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Department_ibfk_1` FOREIGN KEY (`InstructorID`) REFERENCES `Instructor` (`InstructorID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (1,1,3,'Math'),(2,2,2,'Physics'),(3,3,1,'Engineering'),(4,4,2,'Computer Science'),(5,5,5,'Psychology'),(6,6,4,'Business'),(7,7,8,'Art'),(8,8,10,'Music'),(9,9,7,'Science'),(10,10,9,'Law');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EnrollsIN`
--

DROP TABLE IF EXISTS `EnrollsIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `EnrollsIN` (
  `EnrollsINID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) DEFAULT NULL,
  `ProgramID` int(11) DEFAULT NULL,
  `AdvisorID` int(11) DEFAULT NULL,
  `TermID` int(11) DEFAULT NULL,
  PRIMARY KEY (`EnrollsINID`),
  KEY `EnrollsIN_ibfk_1` (`StudentID`),
  KEY `EnrollsIN_ibfk_2` (`ProgramID`),
  KEY `EnrollsIN_ibfk_3` (`AdvisorID`),
  KEY `EnrollsIN_ibfk_4_idx` (`TermID`),
  CONSTRAINT `EnrollsIN_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EnrollsIN_ibfk_2` FOREIGN KEY (`ProgramID`) REFERENCES `Program` (`ProgramID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EnrollsIN_ibfk_3` FOREIGN KEY (`AdvisorID`) REFERENCES `Advisor` (`AdvisorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EnrollsIN_ibfk_4` FOREIGN KEY (`TermID`) REFERENCES `Term` (`TermID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EnrollsIN`
--

LOCK TABLES `EnrollsIN` WRITE;
/*!40000 ALTER TABLE `EnrollsIN` DISABLE KEYS */;
INSERT INTO `EnrollsIN` VALUES (22,1000015,7,5,1),(23,1000014,8,5,1),(24,1000013,9,5,1),(25,1000012,10,5,1),(26,1000006,11,5,1),(27,1000007,12,7,2),(29,1000009,13,9,1),(57,1000016,14,8,1),(58,1000017,15,9,2),(59,1000018,16,10,3),(60,1000019,17,11,4),(61,1000020,18,12,5),(62,1000021,19,12,6),(63,1000022,20,14,7),(64,1000023,21,15,8),(65,1000042,22,1,9),(66,1000025,23,2,10),(67,1000026,24,1,11),(68,1000027,25,2,12),(69,1000028,26,3,1),(70,1000029,27,4,2),(71,1000031,38,5,3),(72,1000032,29,1,4),(73,1000033,30,2,5),(74,1000034,31,3,6),(75,1000035,32,4,7),(76,1000036,33,5,8),(77,1000037,34,6,9),(78,1000041,35,7,10),(79,1000039,36,7,11),(80,1000040,37,6,12),(94,1000041,38,1,1),(95,1000042,39,2,1),(96,1000045,42,3,1),(97,1000046,43,1,1),(98,1000047,44,2,1),(99,1000048,45,3,1),(100,1000049,46,4,1),(101,1000050,47,5,1),(102,1000051,48,6,1),(103,1000057,49,7,1),(104,1000058,50,8,1),(105,1000061,7,1,1),(106,1000062,7,2,1),(107,1000063,7,3,1),(108,1000064,7,4,1),(109,1000065,7,5,1);
/*!40000 ALTER TABLE `EnrollsIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Experience`
--

DROP TABLE IF EXISTS `Experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Experience` (
  `ExperienceID` int(11) NOT NULL AUTO_INCREMENT,
  `ExperienceName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ExperienceID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Experience`
--

LOCK TABLES `Experience` WRITE;
/*!40000 ALTER TABLE `Experience` DISABLE KEYS */;
INSERT INTO `Experience` VALUES (1,'Senior Analyst'),(2,'Senior Engineer'),(3,'Junior Engineer'),(4,'Director'),(5,'Visual Artist'),(6,'Senior Advisor'),(7,'CTO'),(8,'Junior Accountant'),(9,'PHD Analyst'),(10,'Former Dean');
/*!40000 ALTER TABLE `Experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facilities`
--

DROP TABLE IF EXISTS `Facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Facilities` (
  `FacilitiesID` int(11) NOT NULL AUTO_INCREMENT,
  `RoomsID` int(11) DEFAULT NULL,
  `FacilitiesAvailable` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FacilitiesID`),
  KEY `RoomsID` (`RoomsID`),
  CONSTRAINT `Facilities_ibfk_1` FOREIGN KEY (`RoomsID`) REFERENCES `Rooms` (`RoomsID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facilities`
--

LOCK TABLES `Facilities` WRITE;
/*!40000 ALTER TABLE `Facilities` DISABLE KEYS */;
INSERT INTO `Facilities` VALUES (1,44,'Projector, Speakers'),(2,79,'Computers'),(3,80,'Computers'),(4,81,'Computers'),(5,82,'Computers'),(6,83,'Computers'),(7,100,'Scanner'),(8,101,'Fax Machine'),(9,102,'Computers'),(10,103,'Speaker'),(11,104,'Printer'),(12,205,'Computers'),(13,207,'Computers'),(14,209,'Computers'),(15,213,'Computers'),(16,225,'Computers'),(17,403,'Projector'),(18,404,'Flashing Lights'),(19,405,'Computers'),(20,406,'Computers'),(21,407,'Computers'),(22,10526,'Computers'),(23,10527,'Printer'),(24,10528,'Computers');
/*!40000 ALTER TABLE `Facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FullTime`
--

DROP TABLE IF EXISTS `FullTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FullTime` (
  `FullTimeID` int(11) NOT NULL AUTO_INCREMENT,
  `InstructorID` int(11) DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `effectiveDate` date DEFAULT NULL,
  PRIMARY KEY (`FullTimeID`),
  KEY `InstructorID` (`InstructorID`),
  CONSTRAINT `FullTime_ibfk_1` FOREIGN KEY (`InstructorID`) REFERENCES `Instructor` (`InstructorID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FullTime`
--

LOCK TABLES `FullTime` WRITE;
/*!40000 ALTER TABLE `FullTime` DISABLE KEYS */;
INSERT INTO `FullTime` VALUES (1,1,75000.00,'2018-01-01'),(2,3,70000.00,'2019-01-01'),(3,4,65000.00,'2017-05-06'),(4,6,75000.00,'2018-02-05'),(5,7,100000.00,'2013-02-10'),(6,8,80000.00,'2015-08-09'),(7,9,77000.00,'2016-09-09'),(8,10,68000.00,'2019-03-12');
/*!40000 ALTER TABLE `FullTime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funds`
--

DROP TABLE IF EXISTS `Funds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Funds` (
  `FundsID` int(11) NOT NULL AUTO_INCREMENT,
  `TermID` int(11) NOT NULL,
  `ThesisGraduateID` int(11) NOT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`FundsID`),
  KEY `Funds_ibfk_1` (`TermID`),
  KEY `Funds_ibfk_2` (`ThesisGraduateID`),
  CONSTRAINT `Funds_ibfk_1` FOREIGN KEY (`TermID`) REFERENCES `Term` (`TermID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Funds_ibfk_2` FOREIGN KEY (`ThesisGraduateID`) REFERENCES `ThesisGraduate` (`ThesisGraduateID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funds`
--

LOCK TABLES `Funds` WRITE;
/*!40000 ALTER TABLE `Funds` DISABLE KEYS */;
INSERT INTO `Funds` VALUES (1,1,6,5000.00),(2,2,11,1000.00),(4,3,13,4000.00),(5,4,15,100.00),(6,5,16,1000.00),(7,6,20,6000.00),(8,7,21,10000.00),(9,1,22,2000.00),(10,1,27,5000.00),(11,1,29,5000.00),(12,1,30,3000.00);
/*!40000 ALTER TABLE `Funds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grade`
--

DROP TABLE IF EXISTS `Grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Grade` (
  `GradeID` int(11) NOT NULL AUTO_INCREMENT,
  `GPA` decimal(3,2) NOT NULL,
  `GradeLetter` enum('A+','A','A-','B+','B','B-','C+','C','C-','D+','D','D-','F','NR') DEFAULT NULL,
  `passOrFail` enum('Pass','Fail') DEFAULT NULL,
  PRIMARY KEY (`GradeID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grade`
--

LOCK TABLES `Grade` WRITE;
/*!40000 ALTER TABLE `Grade` DISABLE KEYS */;
INSERT INTO `Grade` VALUES (1,4.30,'A+','Pass'),(2,4.00,'A','Pass'),(3,3.70,'A-','Pass'),(4,3.30,'B+','Pass'),(5,3.00,'B','Pass'),(6,2.70,'B-','Pass'),(7,2.30,'C+','Pass'),(8,2.00,'C','Pass'),(9,1.70,'C-','Pass'),(10,1.30,'D+','Pass'),(11,1.00,'D','Pass'),(12,0.70,'D-','Pass'),(13,0.00,'F','Fail'),(14,0.00,'NR',NULL);
/*!40000 ALTER TABLE `Grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Graduate`
--

DROP TABLE IF EXISTS `Graduate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Graduate` (
  `GraduateID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) DEFAULT NULL,
  `DegreeID` int(11) DEFAULT NULL,
  `AwardID` int(11) DEFAULT NULL,
  `PublicationID` int(11) DEFAULT NULL,
  `ContractID` int(11) DEFAULT NULL,
  PRIMARY KEY (`GraduateID`),
  KEY `Degree_ibfk_1_idx` (`DegreeID`),
  KEY `Award_ibfk_1_idx` (`AwardID`),
  KEY `Publication_ibfk_1_idx` (`PublicationID`),
  KEY `Contract_fk_1_idx` (`ContractID`),
  KEY `Graduate_ibfk_1` (`StudentID`),
  CONSTRAINT `Award_fk_1` FOREIGN KEY (`AwardID`) REFERENCES `Award` (`AwardID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Contract_fk_1` FOREIGN KEY (`ContractID`) REFERENCES `Contract` (`ContractID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Degree_fk_1` FOREIGN KEY (`DegreeID`) REFERENCES `Degree` (`DegreeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Graduate_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Publication_fk_1` FOREIGN KEY (`PublicationID`) REFERENCES `Publication` (`PublicationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Graduate`
--

LOCK TABLES `Graduate` WRITE;
/*!40000 ALTER TABLE `Graduate` DISABLE KEYS */;
INSERT INTO `Graduate` VALUES (6,1000006,NULL,1,2,7),(7,1000007,NULL,2,1,13),(9,1000009,NULL,1,3,14),(11,1000023,NULL,3,4,15),(13,1000025,NULL,5,6,17),(14,1000026,NULL,1,7,18),(15,1000027,NULL,3,10,19),(16,1000028,NULL,5,9,20),(17,1000029,NULL,2,8,21),(33,1000030,NULL,1,1,22),(34,1000031,NULL,2,2,23),(35,1000032,NULL,3,3,24),(36,1000033,NULL,4,4,25),(37,1000034,NULL,5,5,26),(38,1000035,NULL,2,6,27),(39,1000036,NULL,3,7,28),(40,1000037,NULL,4,8,29),(41,1000039,NULL,5,9,30),(42,1000040,NULL,2,10,31),(43,1000041,NULL,3,1,32),(44,1000042,NULL,4,2,33);
/*!40000 ALTER TABLE `Graduate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GraduateProgram`
--

DROP TABLE IF EXISTS `GraduateProgram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `GraduateProgram` (
  `GraduateProgramID` int(11) NOT NULL AUTO_INCREMENT,
  `ProgramID` int(11) DEFAULT NULL,
  `gradCredit` int(11) DEFAULT '44',
  PRIMARY KEY (`GraduateProgramID`),
  KEY `GraduateProgram_ibfk_1` (`ProgramID`),
  CONSTRAINT `GraduateProgram_ibfk_1` FOREIGN KEY (`ProgramID`) REFERENCES `Program` (`ProgramID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GraduateProgram`
--

LOCK TABLES `GraduateProgram` WRITE;
/*!40000 ALTER TABLE `GraduateProgram` DISABLE KEYS */;
INSERT INTO `GraduateProgram` VALUES (1,7,44),(2,8,44),(3,9,44),(4,10,44),(5,11,44),(6,12,44),(7,13,44),(8,14,44),(9,15,44),(10,16,44);
/*!40000 ALTER TABLE `GraduateProgram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instructor`
--

DROP TABLE IF EXISTS `Instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Instructor` (
  `InstructorID` int(11) NOT NULL AUTO_INCREMENT,
  `RoomsID` int(11) DEFAULT NULL,
  `AwardID` int(11) DEFAULT NULL,
  `PublicationID` int(11) DEFAULT NULL,
  `ExperienceID` int(11) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `SSN` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `hasFunding` enum('Yes','No') DEFAULT NULL,
  PRIMARY KEY (`InstructorID`),
  UNIQUE KEY `SSN_UNIQUE` (`SSN`),
  KEY `Rooms_ibfk_9_idx` (`RoomsID`),
  KEY `Award_ibfk_1_idx` (`AwardID`),
  KEY `Publication_ibfk_1_idx` (`PublicationID`),
  KEY `Experience_ibfk_1_idx` (`ExperienceID`),
  CONSTRAINT `Award_ibfk_1` FOREIGN KEY (`AwardID`) REFERENCES `Award` (`AwardID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Experience_ibfk_1` FOREIGN KEY (`ExperienceID`) REFERENCES `Experience` (`ExperienceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Publication_ibfk_1` FOREIGN KEY (`PublicationID`) REFERENCES `Building` (`BuildingID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Rooms_ibfk_9` FOREIGN KEY (`RoomsID`) REFERENCES `Rooms` (`RoomsID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10000010 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instructor`
--

LOCK TABLES `Instructor` WRITE;
/*!40000 ALTER TABLE `Instructor` DISABLE KEYS */;
INSERT INTO `Instructor` VALUES (1,444,1,9,1,'Thomas','Wimbleton','222 232 213','1956-02-01','450-819-5557','twim@encs.concordia.ca','123 School Avenue','Yes'),(2,213,1,8,2,'Maria','Dumbledore','132 254 963','1991-03-17','450-556-5557','mdum@encs.concordia.ca','123 School Avenue','Yes'),(3,81,5,7,3,'John','Wickboss','093 192 302','1968-04-09','450-693-7775','jwick@encs.concordia.ca','167 Dorchester Avenue','No'),(4,102,4,4,4,'Dalia','Oneflo','222 232 212','1980-02-08','450-693-7775','done@encs.concordia.ca','167 Dorchester Avenue','Yes'),(5,205,2,3,5,'Mark','Electro','939 993 913','1990-01-19','514-499-5588','mele@encs.concordia.ca','167 Magnetto Lane','Yes'),(6,406,3,2,6,'Julia','Child','140 656 245','1982-10-21','450-145-5588','jchi@encs.concordia.ca','1155 Flower Av','Yes'),(7,407,2,1,7,'Pheobe','Buffet','204 204 205','1989-02-04','514-987-1234','pbuff@encs.concordia.ca','1155 Nestle Av','Yes'),(8,561,3,10,8,'Joey','White','787 234 231','1978-02-23','514-157-8462','jwhi@encs.concordia.ca','885 Accross Av','No'),(9,407,5,6,9,'Chandler','Bing','145 642 234','1957-12-24','514-166-1664','cbin@encs.concordia.ca','669 Laughmer Av','No'),(10,545,1,5,10,'Monica','Geller','120 002 192','1966-03-18','450-198-1978','mgel@encs.concordia.ca','669 Cleanec Av','Yes'),(10000005,545,2,1,1,'Neeham','Khalid','120 002 190','1966-03-18','5149655050','neehamk@gmail.com','6444 Rue Bonneville, ','No'),(10000006,545,3,2,2,'Hason','Hamoa','222 232 214','1966-03-18','450-198-1979','hh@gmail.com','6444 Rue Bonneville, ','No'),(10000007,545,2,3,3,'Lag','Spike','222 232 215','1966-03-18','450-198-1980','ls@gmail.com','6444 Rue Bonneville, ','No'),(10000008,545,1,4,4,'Frame','Dip','222 232 216','1966-03-18','450-198-1981','fd@gmail.com','6444 Rue Bonneville, ','No'),(10000009,545,4,5,5,'Junior','Whopper','222 232 217','1966-03-18','450-198-1982','jw@gmail.com','6444 Rue Bonneville, ','No');
/*!40000 ALTER TABLE `Instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PartTime`
--

DROP TABLE IF EXISTS `PartTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PartTime` (
  `PartTimeID` int(11) NOT NULL AUTO_INCREMENT,
  `InstructorID` int(11) DEFAULT NULL,
  `ContractID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PartTimeID`),
  KEY `InstructorID` (`InstructorID`),
  KEY `ContractID` (`ContractID`),
  CONSTRAINT `PartTime_ibfk_1` FOREIGN KEY (`InstructorID`) REFERENCES `Instructor` (`InstructorID`),
  CONSTRAINT `PartTime_ibfk_2` FOREIGN KEY (`ContractID`) REFERENCES `Contract` (`ContractID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PartTime`
--

LOCK TABLES `PartTime` WRITE;
/*!40000 ALTER TABLE `PartTime` DISABLE KEYS */;
INSERT INTO `PartTime` VALUES (1,2,1),(2,5,2);
/*!40000 ALTER TABLE `PartTime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prerequisite`
--

DROP TABLE IF EXISTS `Prerequisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Prerequisite` (
  `PrerequisiteID` int(11) NOT NULL AUTO_INCREMENT,
  `course` int(11) DEFAULT NULL,
  `coursePreq` int(11) DEFAULT NULL,
  PRIMARY KEY (`PrerequisiteID`),
  KEY `Prerequisite_ibfk_1` (`course`),
  KEY `Prerequisite_ibfk_2` (`coursePreq`),
  CONSTRAINT `Prerequisite_ibfk_1` FOREIGN KEY (`course`) REFERENCES `Course` (`CourseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Prerequisite_ibfk_2` FOREIGN KEY (`coursePreq`) REFERENCES `Course` (`CourseID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prerequisite`
--

LOCK TABLES `Prerequisite` WRITE;
/*!40000 ALTER TABLE `Prerequisite` DISABLE KEYS */;
INSERT INTO `Prerequisite` VALUES (1,7,NULL),(2,8,3),(3,9,NULL),(4,10,NULL),(5,1,NULL),(6,5,NULL),(7,3,NULL),(8,4,3),(9,2,NULL),(10,6,NULL);
/*!40000 ALTER TABLE `Prerequisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Program`
--

DROP TABLE IF EXISTS `Program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Program` (
  `ProgramID` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentID` int(11) DEFAULT NULL,
  `programName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ProgramID`),
  KEY `Program_ibfk_2` (`DepartmentID`),
  CONSTRAINT `Program_ibfk_2` FOREIGN KEY (`DepartmentID`) REFERENCES `Department` (`DepartmentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Program`
--

LOCK TABLES `Program` WRITE;
/*!40000 ALTER TABLE `Program` DISABLE KEYS */;
INSERT INTO `Program` VALUES (7,4,'Computer Science'),(8,3,'Software Engineering'),(9,6,'Business Technology Management'),(10,10,'Law and Order'),(11,4,'Computer Games'),(12,5,'Sports Psychology'),(13,1,'Applied Math'),(14,2,'Physics'),(15,3,'Mechanical Engineering'),(16,7,'Art'),(17,5,'Sociology'),(18,6,'Accounting'),(19,4,'ESports'),(20,6,'Entrepreneurship'),(21,6,'Economics'),(22,6,'Finance'),(23,3,'Aerospace'),(24,3,'Electrical'),(25,3,'Mechanical'),(26,4,'Cyber Security'),(27,4,'Debugger Analysis Manager'),(29,1,'Biostatistics'),(30,1,'Computational Math'),(31,1,'Data Science'),(32,1,'Statitstics'),(33,2,'Chemistry'),(34,2,'Quantum Physics'),(35,2,'Electro Magnetism'),(36,2,'Optics'),(37,5,'Neuroscience'),(38,5,'Research Studies'),(39,5,'Psysiology'),(40,7,'Art History'),(41,7,'Visual Arts'),(42,7,'Film Studies'),(43,7,'Ceramics'),(44,7,'Design'),(45,8,'Music'),(46,8,'Electro Acoustics'),(47,8,'Jazz Studies'),(48,8,'Music Performance'),(49,8,'Music Composition'),(50,9,'Biochemistry'),(51,9,'Physics'),(52,9,'Environmental Science'),(53,9,'Biology'),(54,9,'Athletic Therapy'),(55,10,'Law Research'),(56,10,'Law History'),(57,10,'Law Science'),(58,10,'Written Law');
/*!40000 ALTER TABLE `Program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publication`
--

DROP TABLE IF EXISTS `Publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Publication` (
  `PublicationID` int(11) NOT NULL AUTO_INCREMENT,
  `PublicationName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PublicationID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publication`
--

LOCK TABLES `Publication` WRITE;
/*!40000 ALTER TABLE `Publication` DISABLE KEYS */;
INSERT INTO `Publication` VALUES (1,'AARP Modern Maturity'),(2,'Accent on Living'),(3,'Accross the Board'),(4,'Adults Learning'),(5,'Byte.com'),(6,'Career World'),(7,'CCD Astronomy'),(8,'Wealth Management'),(9,'LBJ Foundation'),(10,'35 Ventures');
/*!40000 ALTER TABLE `Publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registration`
--

DROP TABLE IF EXISTS `Registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Registration` (
  `RegistrationID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) DEFAULT NULL,
  `SectionID` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `GradeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`RegistrationID`),
  KEY `Registration_ibfk_1_idx` (`StudentID`),
  KEY `Registration_ibfk_3_idx` (`SectionID`),
  KEY `Registration_ibfk_4_idx` (`GradeID`),
  CONSTRAINT `Registration_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Registration_ibfk_3` FOREIGN KEY (`SectionID`) REFERENCES `Section` (`SectionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Registration_ibfk_4` FOREIGN KEY (`GradeID`) REFERENCES `Grade` (`GradeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registration`
--

LOCK TABLES `Registration` WRITE;
/*!40000 ALTER TABLE `Registration` DISABLE KEYS */;
INSERT INTO `Registration` VALUES (4,1000006,4,'2018-08-03',4),(5,1000006,5,'2018-08-02',5),(6,1000006,6,'2018-08-03',6),(7,1000006,7,'2018-08-03',5),(76,1000007,1,'2018-08-03',4),(77,1000009,2,'2018-08-03',3),(78,1000009,3,'2018-08-03',2),(79,1000009,4,'2018-08-03',4),(80,1000009,5,'2018-08-03',5),(81,1000009,6,'2018-08-03',6),(82,1000011,7,'2018-08-03',7),(83,1000011,1,'2018-08-03',8),(84,1000011,2,'2018-08-03',6),(85,1000011,3,'2018-08-03',4),(112,1000012,8,'2018-08-03',3),(113,1000012,9,'2019-08-03',2),(114,1000012,10,'2019-08-03',4),(115,1000012,11,'2019-08-03',5),(116,1000013,12,'2019-08-03',6),(117,1000013,8,'2018-08-03',7),(118,1000013,9,'2019-08-03',2),(119,1000013,10,'2019-08-03',4),(120,1000014,11,'2019-08-03',5),(121,1000014,12,'2019-08-03',6),(122,1000014,8,'2018-08-03',7),(123,1000014,9,'2019-08-03',8),(124,1000014,10,'2019-08-03',2),(125,1000014,19,'2019-08-03',3),(126,1000015,20,'2019-08-03',4),(127,1000015,21,'2018-08-03',5),(128,1000015,22,'2019-08-03',6),(129,1000016,23,'2019-08-03',7),(130,1000016,11,'2019-08-03',8),(131,1000017,12,'2019-08-03',9),(132,1000017,13,'2018-08-03',3),(133,1000017,14,'2019-08-03',5),(134,1000018,15,'2019-08-03',6),(135,1000018,16,'2019-08-03',2),(136,1000018,17,'2019-08-03',2),(137,1000018,18,'2018-08-03',1),(138,1000019,39,'2018-08-03',1),(139,1000019,40,'2018-08-03',3),(140,1000019,41,'2018-08-03',1),(141,1000020,42,'2018-08-03',2),(142,1000021,43,'2018-08-03',4),(143,1000021,39,'2018-08-03',5),(226,1000006,39,'2019-08-07',14),(229,1000006,2,'2019-08-07',14),(231,1000006,65,'2019-08-07',14),(232,1000006,66,'2019-08-07',14),(233,1000007,67,'2019-08-07',14),(234,1000007,68,'2019-08-07',14),(235,1000007,69,'2019-08-07',14),(236,1000007,70,'2019-08-07',14),(237,1000006,71,'2019-08-07',14),(238,1000006,72,'2019-08-07',14),(239,1000006,73,'2019-08-07',14),(279,1000022,74,'2018-08-03',3),(280,1000022,75,'2018-08-03',3),(281,1000023,76,'2018-08-03',4),(282,1000023,77,'2018-08-03',3),(283,1000040,78,'2018-08-03',2),(284,1000040,79,'2018-08-03',3),(285,1000025,80,'2018-08-03',4),(286,1000025,81,'2018-08-03',5),(287,1000026,82,'2018-08-03',6),(288,1000026,83,'2018-08-03',4),(289,1000026,84,'2018-08-03',3),(290,1000027,85,'2018-08-03',2),(291,1000028,86,'2018-08-03',3),(292,1000029,87,'2018-08-03',4),(293,1000029,88,'2018-08-03',5),(294,1000029,89,'2018-08-03',4),(295,1000030,90,'2018-08-03',3),(296,1000031,91,'2018-08-03',2),(297,1000031,92,'2018-08-03',3),(298,1000031,93,'2018-08-03',4),(299,1000032,94,'2018-08-03',2),(300,1000032,95,'2018-08-03',1),(301,1000032,96,'2018-08-03',1),(302,1000033,97,'2018-08-03',2),(303,1000033,98,'2018-08-03',3),(304,1000034,99,'2018-08-03',4),(305,1000034,100,'2018-08-03',4),(306,1000035,101,'2018-08-03',5),(307,1000035,102,'2018-08-03',6),(308,1000035,103,'2018-08-03',5),(309,1000036,104,'2018-08-03',4),(310,1000036,105,'2018-08-03',3),(311,1000036,106,'2018-08-03',2),(312,1000037,107,'2018-08-03',3),(313,1000037,108,'2018-08-03',4),(314,1000037,109,'2018-08-03',4),(315,1000039,110,'2018-08-03',3),(316,1000039,111,'2018-08-03',2),(317,1000006,97,'2018-08-03',4),(318,1000006,98,'2018-08-03',5);
/*!40000 ALTER TABLE `Registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rooms`
--

DROP TABLE IF EXISTS `Rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Rooms` (
  `RoomsID` int(11) NOT NULL AUTO_INCREMENT,
  `BuildingID` int(11) DEFAULT NULL,
  `RoomCapacity` int(11) DEFAULT NULL,
  `RoomType` enum('Classroom','Lab','Conference Room','OfficeGrade') DEFAULT NULL,
  `floorLevel` int(11) DEFAULT NULL,
  `RoomNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`RoomsID`),
  KEY `BuildingID` (`BuildingID`),
  CONSTRAINT `Rooms_ibfk_1` FOREIGN KEY (`BuildingID`) REFERENCES `Building` (`BuildingID`)
) ENGINE=InnoDB AUTO_INCREMENT=10673 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rooms`
--

LOCK TABLES `Rooms` WRITE;
/*!40000 ALTER TABLE `Rooms` DISABLE KEYS */;
INSERT INTO `Rooms` VALUES (44,5,60,'Classroom',4,440),(79,10,18,'Lab',7,790),(80,10,18,'Lab',8,800),(81,10,18,'Lab',8,810),(82,10,18,'Lab',8,820),(83,10,18,'Lab',8,830),(100,9,15,'OfficeGrade',1,100),(101,9,15,'OfficeGrade',1,101),(102,9,15,'OfficeGrade',1,102),(103,9,15,'OfficeGrade',1,103),(104,9,15,'OfficeGrade',1,104),(205,2,41,'Classroom',2,205),(207,2,43,'Classroom',2,207),(209,2,46,'Classroom',2,209),(213,2,50,'Classroom',2,213),(225,2,40,'Classroom',2,225),(317,1,5,'OfficeGrade',3,317),(403,4,60,'Conference Room',4,403),(404,4,60,'Classroom',4,404),(405,4,60,'Classroom',4,405),(406,4,60,'Classroom',4,406),(407,4,60,'Classroom',4,407),(441,5,60,'Classroom',4,441),(442,5,60,'Classroom',4,442),(443,5,60,'Classroom',4,443),(444,5,60,'Classroom',4,444),(525,1,50,'Classroom',5,525),(536,1,38,'Lab',5,536),(545,4,45,'Conference Room',5,545),(561,4,45,'Conference Room',5,561),(562,4,45,'Conference Room',5,562),(564,4,45,'Conference Room',5,564),(565,4,45,'Conference Room',5,565),(612,7,20,'OfficeGrade',6,612),(622,7,20,'Lab',6,622),(632,7,20,'Lab',6,632),(642,7,20,'Lab',6,642),(652,7,20,'Lab',6,652),(712,8,66,'Lab',7,712),(722,8,66,'Lab',7,722),(732,8,66,'Lab',7,732),(742,8,66,'Lab',7,742),(753,8,66,'Lab',7,753),(912,6,10,'OfficeGrade',9,912),(922,6,10,'OfficeGrade',9,922),(932,6,10,'OfficeGrade',9,932),(942,6,10,'OfficeGrade',9,942),(952,6,10,'OfficeGrade',9,952),(962,1,30,'Conference Room',9,962),(1052,1,9,'Conference Room',10,1052),(1111,3,91,'Classroom',11,1111),(1112,3,89,'Classroom',11,1112),(1113,3,89,'Classroom',11,1113),(1115,3,89,'Classroom',11,1115),(1116,3,89,'Classroom',11,1116),(10526,1,30,'Classroom',1,100),(10527,1,30,'Classroom',1,110),(10528,1,30,'Classroom',2,200),(10529,1,30,'Classroom',2,230),(10530,1,30,'Classroom',3,300),(10531,1,30,'Classroom',3,310),(10532,1,30,'Classroom',4,400),(10533,1,30,'Classroom',4,410),(10534,1,30,'Classroom',5,500),(10535,1,30,'Classroom',5,510),(10536,1,30,'Classroom',6,600),(10537,1,30,'Classroom',6,610),(10538,1,30,'Classroom',7,700),(10539,1,30,'Classroom',7,710),(10540,1,20,'Lab',8,800),(10541,1,20,'Lab',8,810),(10542,2,40,'Classroom',1,100),(10543,2,40,'Classroom',1,110),(10544,2,40,'Classroom',2,200),(10545,2,40,'Classroom',2,210),(10546,2,40,'Classroom',3,300),(10547,2,40,'Classroom',3,310),(10548,2,40,'Classroom',5,500),(10549,2,40,'Classroom',5,510),(10550,2,40,'Classroom',6,600),(10551,2,40,'Classroom',6,610),(10552,2,40,'Classroom',7,700),(10553,2,40,'Classroom',7,710),(10554,2,40,'Classroom',8,800),(10555,2,40,'Classroom',8,810),(10556,2,40,'Classroom',9,900),(10557,2,40,'Classroom',9,910),(10558,2,40,'Classroom',10,1000),(10559,2,40,'Classroom',10,1010),(10560,3,20,'Classroom',1,100),(10561,3,20,'Classroom',1,110),(10562,3,20,'Classroom',2,200),(10563,3,20,'Classroom',2,210),(10564,3,20,'Classroom',3,300),(10565,3,20,'Classroom',3,310),(10566,3,20,'Classroom',4,400),(10567,3,20,'Classroom',4,410),(10568,3,20,'Classroom',5,500),(10569,3,20,'Classroom',5,510),(10570,3,20,'Classroom',6,600),(10571,3,20,'Classroom',6,610),(10572,3,20,'Classroom',7,700),(10573,3,20,'Classroom',7,710),(10574,3,20,'Classroom',8,800),(10575,3,20,'Classroom',8,810),(10576,3,20,'Classroom',9,900),(10577,3,20,'Lab',9,910),(10578,3,20,'Lab',10,1000),(10579,4,15,'Classroom',1,100),(10580,4,15,'Classroom',1,110),(10581,4,15,'Classroom',2,200),(10582,4,15,'Classroom',2,210),(10583,4,15,'Classroom',3,300),(10584,4,15,'Classroom',3,310),(10585,4,15,'Classroom',4,400),(10586,4,15,'Classroom',4,410),(10587,4,15,'Classroom',6,600),(10588,4,15,'Classroom',6,610),(10589,4,15,'Classroom',7,700),(10590,4,15,'Classroom',7,710),(10591,4,15,'Classroom',8,800),(10592,4,15,'Classroom',8,810),(10593,4,15,'Classroom',9,900),(10594,4,15,'Classroom',13,1300),(10595,4,15,'Classroom',10,1000),(10596,4,15,'Classroom',11,1100),(10597,5,20,'Classroom',1,100),(10598,5,20,'Classroom',1,110),(10599,5,20,'Classroom',2,200),(10600,5,20,'Classroom',2,210),(10601,5,20,'Classroom',3,300),(10602,5,20,'Classroom',3,310),(10603,5,20,'Classroom',5,500),(10604,5,20,'Classroom',5,510),(10605,5,20,'Classroom',6,600),(10606,5,20,'Classroom',7,700),(10607,5,20,'Classroom',8,800),(10608,5,20,'Lab',8,810),(10609,5,20,'Lab',9,900),(10610,5,20,'Lab',10,1000),(10611,6,30,'Classroom',1,100),(10612,6,30,'Classroom',1,110),(10613,6,30,'Classroom',2,200),(10614,6,30,'Classroom',2,210),(10615,6,30,'Classroom',3,300),(10616,6,30,'Classroom',3,310),(10617,6,30,'Classroom',4,400),(10618,6,30,'Classroom',4,410),(10619,6,30,'Classroom',5,500),(10620,6,30,'Classroom',5,510),(10621,7,30,'Classroom',1,100),(10622,7,30,'Classroom',1,110),(10623,7,30,'Classroom',2,200),(10624,7,30,'Classroom',2,210),(10625,7,30,'Classroom',3,300),(10626,7,30,'Classroom',3,310),(10627,7,30,'Classroom',4,400),(10628,7,30,'Classroom',4,410),(10629,7,30,'Classroom',5,500),(10630,7,30,'Classroom',5,510),(10631,7,15,'Lab',6,600),(10632,7,15,'Lab',6,610),(10633,8,30,'Classroom',1,100),(10634,8,30,'Classroom',1,110),(10635,8,30,'Classroom',2,200),(10636,8,30,'Classroom',2,210),(10637,8,30,'Classroom',3,300),(10638,8,30,'Classroom',3,310),(10639,8,30,'Classroom',4,400),(10640,8,30,'Classroom',4,410),(10641,8,30,'Classroom',5,500),(10642,8,30,'Classroom',5,500),(10643,8,30,'Classroom',6,600),(10644,8,15,'Lab',6,610),(10645,6,20,'Classroom',6,600),(10646,6,25,'Classroom',6,610),(10647,6,20,'Classroom',6,700),(10648,6,20,'Classroom',6,710),(10649,6,20,'Classroom',6,800),(10650,9,10,'OfficeGrade',2,200),(10651,9,10,'OfficeGrade',2,210),(10652,9,10,'OfficeGrade',3,300),(10653,9,10,'OfficeGrade',3,310),(10654,9,10,'OfficeGrade',4,400),(10655,9,10,'OfficeGrade',4,410),(10656,10,30,'Classroom',1,100),(10657,10,30,'Classroom',1,110),(10658,10,30,'Classroom',2,200),(10659,10,30,'Classroom',2,210),(10660,10,30,'Classroom',3,300),(10661,10,30,'Classroom',3,310),(10662,10,30,'Classroom',4,400),(10663,10,30,'Classroom',4,410),(10664,10,30,'Classroom',5,500),(10665,10,30,'Classroom',5,510),(10666,10,30,'Classroom',6,600),(10667,10,30,'Classroom',6,610),(10668,10,30,'Classroom',7,700),(10669,10,30,'Classroom',7,710),(10670,10,30,'Classroom',9,900),(10671,10,30,'Classroom',9,910);
/*!40000 ALTER TABLE `Rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Section`
--

DROP TABLE IF EXISTS `Section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Section` (
  `SectionID` int(11) NOT NULL AUTO_INCREMENT,
  `RoomsID` int(11) DEFAULT NULL,
  `TimeSlotID` int(11) DEFAULT NULL,
  `TermID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `InstructorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SectionID`),
  KEY `Section_ibfk_4_idx` (`TermID`),
  KEY `Section_ibfk_3_idx` (`TimeSlotID`),
  KEY `Section_ibfk_7` (`CourseID`),
  KEY `Section_ibfk_2_idx` (`RoomsID`),
  CONSTRAINT `Section_ibfk_2` FOREIGN KEY (`RoomsID`) REFERENCES `Rooms` (`RoomsID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Section_ibfk_4` FOREIGN KEY (`TermID`) REFERENCES `Term` (`TermID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Section_ibfk_7` FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Section`
--

LOCK TABLES `Section` WRITE;
/*!40000 ALTER TABLE `Section` DISABLE KEYS */;
INSERT INTO `Section` VALUES (1,44,2,2,1,1),(2,525,3,1,6,2),(3,205,4,1,2,3),(4,207,8,1,8,6),(5,1111,7,7,7,5),(6,209,5,2,9,7),(7,213,6,5,3,4),(8,209,2,1,15,1),(9,213,5,1,14,3),(10,205,6,1,16,5),(11,1111,7,1,17,6),(12,10526,1,7,1,1),(13,10527,2,8,2,2),(14,10528,3,9,3,3),(15,10529,4,10,4,4),(16,10530,5,11,5,5),(17,10531,6,12,6,6),(18,10532,7,8,7,1),(19,10533,1,9,8,2),(20,10534,2,10,9,3),(21,10535,3,11,11,4),(22,10536,4,12,12,5),(23,10537,6,11,13,7),(24,10538,1,2,18,3),(25,10539,3,2,19,5),(26,10540,5,2,20,7),(27,10541,3,2,10,4),(28,10543,2,2,21,5),(29,10542,1,2,22,6),(30,10547,2,1,6,1),(31,10544,5,2,6,3),(32,10545,6,3,6,5),(33,10546,7,4,6,6),(39,10547,1,1,23,1),(40,10548,2,1,24,2),(41,10549,3,1,25,3),(42,10550,4,1,26,4),(43,10551,5,1,27,5),(64,10552,1,5,1,1),(65,10553,2,5,5,2),(66,10554,3,5,7,3),(67,10555,4,5,3,4),(68,10556,5,5,23,5),(69,10557,6,5,25,6),(70,10558,7,5,27,7),(71,10562,8,5,24,8),(72,10560,9,5,20,3),(73,10561,10,5,4,2),(74,10530,3,1,28,3),(75,10531,4,1,29,4),(76,10532,5,1,30,6),(77,10533,6,1,31,8),(78,10534,7,1,32,6),(79,10530,3,1,5,3),(80,10544,3,1,9,1),(81,10545,6,1,10,2),(82,10546,4,1,21,3),(83,10544,2,1,20,4),(84,10544,5,1,14,1),(85,10546,2,1,33,2),(86,10545,1,1,34,3),(87,10544,6,1,35,4),(88,10547,3,1,36,5),(89,10548,4,1,17,5),(90,10549,5,1,37,6),(91,10550,7,1,38,7),(92,10551,8,1,39,8),(93,10547,2,1,1,1),(94,10548,3,1,3,2),(95,10549,4,1,18,3),(96,10550,5,1,19,4),(97,10544,1,1,51,1),(98,10544,2,1,52,2),(99,10544,3,1,53,3),(100,10544,4,1,54,4),(101,10544,5,1,4,5),(102,10544,5,1,47,6),(103,10544,6,1,48,7),(104,10549,4,1,49,8),(105,10548,3,1,50,1),(106,10545,2,1,13,2),(107,10544,1,1,42,3),(108,10546,2,1,43,4),(109,10547,3,1,44,5),(110,10546,4,1,45,6),(111,10545,5,1,46,7),(112,10530,3,5,28,3),(113,10531,4,5,29,4),(114,10532,5,5,30,6),(115,10533,6,5,31,8),(116,10534,7,5,32,6),(117,10530,3,5,5,3),(118,10544,3,5,9,1),(119,10545,6,5,10,2),(120,10546,4,5,21,3),(121,10544,2,5,20,4),(122,10544,5,5,14,1),(123,10546,2,5,33,2),(124,10545,1,5,34,3),(125,10544,6,5,35,4),(126,10547,3,5,36,5),(127,10548,4,5,17,5),(128,10549,5,5,37,6),(129,10550,7,5,38,7),(130,10551,8,5,39,8),(131,10547,2,5,1,1),(132,10548,3,5,3,2),(133,10549,4,5,18,3),(134,10550,5,5,19,4),(135,10544,1,5,51,1),(136,10544,2,5,52,2),(137,10544,3,5,53,3),(138,10544,4,5,54,4),(139,10544,5,5,4,5),(140,10544,5,5,47,6),(141,10544,6,5,48,7),(142,10549,4,5,49,8),(143,10548,3,5,50,1),(144,10545,2,5,13,2),(145,10544,1,5,42,3),(146,10546,2,5,43,4),(147,10547,3,5,44,5),(148,10546,4,5,45,6),(149,10545,5,5,46,7);
/*!40000 ALTER TABLE `Section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Session`
--

DROP TABLE IF EXISTS `Session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Session` (
  `SessionID` int(11) NOT NULL AUTO_INCREMENT,
  `session` enum('Summer','Fall','Fall/Winter','Winter') DEFAULT NULL,
  PRIMARY KEY (`SessionID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Session`
--

LOCK TABLES `Session` WRITE;
/*!40000 ALTER TABLE `Session` DISABLE KEYS */;
INSERT INTO `Session` VALUES (1,'Summer'),(2,'Fall'),(3,'Fall/Winter'),(4,'Winter');
/*!40000 ALTER TABLE `Session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Student` (
  `StudentID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `SSN` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  UNIQUE KEY `SSN_UNIQUE` (`SSN`)
) ENGINE=InnoDB AUTO_INCREMENT=1000067 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (1000006,'James','Bond','007 007 007','2007-07-07','514-007-1007','James007@GoldenEye.com','007 GoldenEye Streets'),(1000007,'Dirk','Gently','789 456 129','1998-05-22','514-200-5322','dirkgently@gmail.com','100 Victoria Street'),(1000009,'Tevonn','Walker','987 159 321','1998-07-06','514-111-1124','twalker@gmail.com','734 Jasmine Street'),(1000011,'Tom','Goodman','738 072 784','1994-12-02','450-666-7896','goodmanflies@gmail.com','833 Dragon Ave'),(1000012,'Jonathan','Willis','576 656 805','1992-06-09','450-357-9510','jwill5@gmail.com','52-12 Romand Avenue'),(1000013,'Michael','Scott','613 561 539','1997-02-22','514-112-7536','Dundermifflin@email.com','115 Office Avenue'),(1000014,'Phyllis','Williams','737 480 426','1994-12-02','514-654-3214','cuteywill@gmail.com','1125 Office Avenue'),(1000015,'Scott','Wetland','335 200 119','1995-10-31','514-654-3217','watlandamiright@gmail.com','963 Wattka st'),(1000016,'Manilla','Louzon','779 821 214','1996-04-16','438-626-1234','manillathebest@gmail.com','1156 Hollywood Av'),(1000017,'Electra','Goodwill','268 023 702','1999-06-04','514-467-5556','elec75@msn.com','139 Brookhill Street'),(1000018,'Mario','Plumberman','775 863 087','1999-06-15','438-115-3339','drmario@hotmail.com','111 Mushroomking Ave'),(1000019,'Luigi','Plumberman','605 093 160','1992-10-06','438-119-4445','luigidabest@gmail.com','121 Mushroomking Ave'),(1000020,'Ash','Ketchum','201 977 295','1993-01-04','514-987-6543','pikapika1@gmail.com','665 Pallet Ave'),(1000021,'Gary','Blue','446 004 061','1993-03-27','514-334-3344','ratawata@yahoo.com','676 Pallet Ave'),(1000022,'Britney','Whitemen','736 499 229','1990-08-10','514-555-1475','foreveryoung@msn.com','558 Wallet St'),(1000023,'Suzanne','Baker','501 114 649','1989-04-20','450-726-4747','mjorplf9r7@thrubay.com','373  rue des Eglises Est'),(1000025,'Leonard','Johnson','327 998 209','1996-02-17','514-376-8344','6r239febnn6@iffymedia.com','6817 43 Av'),(1000026,'Derrick','Penman','006 541 312','1997-12-17','514-970-8739','eixx4c5blv@fakemailgenerator.net','2896  rue Levy'),(1000027,'Betsys','Troy','443 774 179','1993-11-25','519-885-3625','735cjwms0ov@thrubay.com','3617  Albert Street'),(1000028,'Christine','Jones','734 415 987','1996-07-16','807-353-3592','b10uxrmzhse@iffymedia.com','1070  Nelson Street'),(1000029,'Frank','Pitts','271 892 028','1990-05-19','604-992-4191','u3kz1uzwkpe@payspun.com','1598  Robson St'),(1000030,'Stephen','Buchanan','525 709 747','1990-11-14','250-647-2592','ldkjyfm4bqi@claimab.com','4546  Ganges Road'),(1000031,'Marilyn','Henderson','043 906 130','1992-01-08','416-471-7720','d5tdy9dwnjw@fakemailgenerator.net','3825  Yonge Street'),(1000032,'Scott','Jarboe','127 664 274','1993-11-17','604-268-4317','mvp3bx96uya@iffymedia.com','1521  Hammarskjold Dr'),(1000033,'Donald','Cruz','005 149 828','1995-09-03','403-749-9054','aonxg16s00d@thrubay.com','4079  Port Washington Road'),(1000034,'Roger','White','716 735 402','1990-04-20','519-245-1310','sgayjpm78bk@fakemailgenerator.net','1414  Scotchmere Dr'),(1000035,'Chantel','Mueller','727 519 861','1994-05-08','416-764-9643','mzr64xpuy3h@fakemailgenerator.net','1384  Queen Elizabeth Boulevard'),(1000036,'Charles','Hirano','726 519 861','1998-03-10','613-761-4344','cv36ry3zylt@fakemailgenerator.net','686  Carling Avenue'),(1000037,'Teddy','Kan','270 972 094','1995-09-30','416-861-5829','zvfwg8dw4ar@payspun.com','289  Adelaide St'),(1000039,'John','Stanley','710 202 219','1991-04-24','604-341-0581','z54sn8pjsy@claimab.com','4907  James Street'),(1000040,'Phyllis','Thrailkill','580 316 719','1991-10-25','519-350-9777','rmietznxkyl@claimab.com','502  Scotchmere Dr'),(1000041,'Gisela','Carmichael','332 220 987','1999-03-30','905-238-6366','tyotqfb4jgg@thrubay.com','2568  Wellington Street'),(1000042,'Monica','Knight','090 975 947','1992-10-21','613-797-9273','laxth66twb@fakemailgenerator.net','2255  Carling Avenue'),(1000045,'Dj','Khalid','159 054 055','1992-01-06','514-432-4324','neeham@gmail.com','432 maisonneuve'),(1000046,'Dj','Khalid','119 473 486','1992-01-06','514-432-4324','neeham@gmail.com','432 maisonneuve'),(1000047,'Dj','Khalid','233 881 259','1992-01-06','514-432-4324','neeham@gmail.com','432 maisonneuve'),(1000048,'Dj','Khalid','011 780 764','1992-01-06','514-432-4324','neeham@gmail.com','432 maisonneuve'),(1000049,'Dj','Khalid','595 698 150','1992-01-06','514-432-4324','neeham@gmail.com','432 maisonneuve'),(1000050,'Dj','Khalid','005 192 117','1992-01-06','514-432-4324','neeham@gmail.com','432 maisonneuve'),(1000051,'Dj','Khalid','085 143 659','1992-01-06','514-432-4324','neeham@gmail.com','432 maisonneuve'),(1000055,'Nicholas','Bergeron','058 318 247','1993-06-11','514-123-4567','nicho@gmail.com','Avenue Essential'),(1000057,'Jameson','Bond','555 123 456','1988-08-01','5145551489','mrbond@gmail.com','1715 Dragon Street'),(1000058,'Thuyohn','Thurai','123 546 789 ','1993-09-05','514-989-3232','thuyohn@gmail.com','456 maisonneuve'),(1000061,'Ab','Ba','123 546 790','1993-09-05','514-123-45514-123-4568','ab@gmail.com','1715 Dragon Street'),(1000062,'Jon','Ra','123 546 791','1993-09-05','514-123-4569','jr@gmail.com','1715 Dragon Street'),(1000063,'Jacob','Ka','123 546 792','1993-09-05','514-123-4570','jk@gmail.com','1715 Dragon Street'),(1000064,'Len','Da','123 546 793','1993-09-05','514-123-4571','ld@gmail.com','1715 Dragon Street'),(1000065,'Ben','Pa','123 546 794','1993-09-05','514-123-4572','bp@gmail.com','1715 Dragon Street'),(1000066,'Stan','Ta','123 546 795','1993-09-05','514-123-4573','st@gmail.com','1715 Dragon Street');
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Term`
--

DROP TABLE IF EXISTS `Term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Term` (
  `TermID` int(11) NOT NULL AUTO_INCREMENT,
  `SessionID` int(11) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  PRIMARY KEY (`TermID`),
  KEY `Term_ibfk_1_idx` (`SessionID`),
  CONSTRAINT `Term_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `Session` (`SessionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Term`
--

LOCK TABLES `Term` WRITE;
/*!40000 ALTER TABLE `Term` DISABLE KEYS */;
INSERT INTO `Term` VALUES (1,1,2018),(2,2,2018),(3,3,2018),(4,4,2018),(5,1,2019),(6,2,2019),(7,3,2019),(8,4,2019),(9,1,2020),(10,2,2020),(11,3,2020),(12,4,2020);
/*!40000 ALTER TABLE `Term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ThesisGraduate`
--

DROP TABLE IF EXISTS `ThesisGraduate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ThesisGraduate` (
  `ThesisGraduateID` int(11) NOT NULL AUTO_INCREMENT,
  `InstructorID` int(11) DEFAULT NULL,
  `appliedForFunding` enum('Yes','No') DEFAULT NULL,
  `StudentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ThesisGraduateID`),
  KEY `ThesisGraduate_ibfk_2_idx` (`InstructorID`),
  KEY `ThesisGraduate_ibfk_3` (`StudentID`),
  CONSTRAINT `ThesisGraduate_ibfk_2` FOREIGN KEY (`InstructorID`) REFERENCES `Instructor` (`InstructorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ThesisGraduate_ibfk_3` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ThesisGraduate`
--

LOCK TABLES `ThesisGraduate` WRITE;
/*!40000 ALTER TABLE `ThesisGraduate` DISABLE KEYS */;
INSERT INTO `ThesisGraduate` VALUES (6,8,'Yes',1000006),(7,7,'No',1000007),(9,5,'No',1000009),(11,1,'Yes',1000023),(13,2,'Yes',1000025),(14,3,'No',1000026),(15,4,'Yes',1000027),(16,5,'Yes',1000036),(17,1,'No',1000040),(18,2,'No',1000042),(19,1,'No',1000033),(20,9,'Yes',1000032),(21,10,'Yes',1000029),(22,1,'Yes',1000031),(23,3,'No',1000041),(24,3,'No',1000034),(26,2,'No',1000039),(27,6,'Yes',1000037),(28,1,'No',1000028),(29,7,'Yes',1000030),(30,8,'Yes',1000035);
/*!40000 ALTER TABLE `ThesisGraduate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeSlot`
--

DROP TABLE IF EXISTS `TimeSlot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TimeSlot` (
  `TimeSlotID` int(11) NOT NULL AUTO_INCREMENT,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `weekDay` enum('Sun','Mon','Tue','Wed','Thur','Fri','Sat') DEFAULT NULL,
  PRIMARY KEY (`TimeSlotID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeSlot`
--

LOCK TABLES `TimeSlot` WRITE;
/*!40000 ALTER TABLE `TimeSlot` DISABLE KEYS */;
INSERT INTO `TimeSlot` VALUES (2,'12:00:00','02:00:00','Mon'),(3,'01:45:00','03:35:00','Tue'),(4,'03:35:00','04:45:00','Wed'),(5,'04:45:00','06:00:00','Thur'),(6,'02:45:00','05:00:00','Fri'),(7,'01:45:00','02:15:00','Mon'),(8,'03:55:00','06:15:00','Tue'),(9,'04:45:00','06:15:00','Wed'),(10,'01:00:00','01:45:00','Thur'),(11,'01:45:00','03:15:00','Fri');
/*!40000 ALTER TABLE `TimeSlot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UnderGraduate`
--

DROP TABLE IF EXISTS `UnderGraduate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `UnderGraduate` (
  `UnderGraduateID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`UnderGraduateID`),
  KEY `UnderGraduate_ibfk_1` (`StudentID`),
  CONSTRAINT `UnderGraduate_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UnderGraduate`
--

LOCK TABLES `UnderGraduate` WRITE;
/*!40000 ALTER TABLE `UnderGraduate` DISABLE KEYS */;
INSERT INTO `UnderGraduate` VALUES (1,1000011),(2,1000012),(3,1000013),(4,1000014),(5,1000015),(6,1000016),(7,1000017),(8,1000018),(9,1000019),(10,1000020),(11,1000021),(12,1000031),(13,1000032),(14,1000033),(15,1000034),(16,1000035),(17,1000036),(18,1000037),(20,1000039),(21,1000040),(22,1000041),(23,1000042);
/*!40000 ALTER TABLE `UnderGraduate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UnderGraduateProgram`
--

DROP TABLE IF EXISTS `UnderGraduateProgram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `UnderGraduateProgram` (
  `UnderGraduateProgramID` int(11) NOT NULL AUTO_INCREMENT,
  `ProgramID` int(11) DEFAULT NULL,
  `underGradCredit` int(11) DEFAULT NULL,
  PRIMARY KEY (`UnderGraduateProgramID`),
  KEY `UnderGraduateProgram_ibfk_1` (`ProgramID`),
  CONSTRAINT `UnderGraduateProgram_ibfk_1` FOREIGN KEY (`ProgramID`) REFERENCES `Program` (`ProgramID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UnderGraduateProgram`
--

LOCK TABLES `UnderGraduateProgram` WRITE;
/*!40000 ALTER TABLE `UnderGraduateProgram` DISABLE KEYS */;
INSERT INTO `UnderGraduateProgram` VALUES (1,7,90),(2,8,90),(3,9,90),(4,10,90),(5,11,90),(6,12,90),(7,13,90),(8,14,90),(9,15,90),(10,18,90),(12,20,90),(13,21,90),(14,22,90),(15,23,90),(16,24,90),(17,25,90),(18,19,90),(19,26,90),(20,27,90),(54,16,90),(55,17,90),(56,58,90),(57,29,90),(58,30,90),(59,31,90),(60,32,90),(61,33,90),(62,34,90),(63,35,90),(64,36,90),(65,37,90),(66,38,90),(67,39,90),(68,40,90),(69,41,90),(70,42,90),(71,43,90),(72,44,90),(73,45,90),(74,46,90),(75,47,90),(76,48,90),(77,49,90),(78,50,90),(79,51,90),(80,52,90),(81,53,90),(82,54,90),(83,55,90),(84,56,90),(85,57,90);
/*!40000 ALTER TABLE `UnderGraduateProgram` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-09 17:41:41
