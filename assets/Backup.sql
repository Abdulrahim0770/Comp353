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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Advisor`
--

LOCK TABLES `Advisor` WRITE;
/*!40000 ALTER TABLE `Advisor` DISABLE KEYS */;
INSERT INTO `Advisor` VALUES (1,7,'Jon','Marks','Hall','305','514-555-9100','jm@concordia.ca'),(2,8,'Pam','Ly','Hall','413','514-555-9101','pl@concordia.ca'),(3,9,'Sam','Don','Hall','521','514-555-9102','sd@concordia.ca'),(4,10,'Ron','Wees','Hall','445','514-555-9103','rw@concordia.ca'),(5,11,'Tacko','Fall','Hall','821','514-555-9104','tf@concordia.ca'),(6,12,'Slim','Jim','Hall','902','514-555-9105','sj@concordia.ca'),(7,13,'Ari','Len','Hall','100','514-555-9106','al@concordia.ca'),(8,14,'Les','Brown','Hall','505','514-555-9107','lb@concordia.ca'),(9,15,'Danie','Samp','Hall','620','514-555-9108','ds@concordia.ca'),(10,16,'Liam','Alcalde','Hall','710','514-555-9109','la@concordia.ca'),(11,17,'Fran','Berry','EV','300','514-555-9110','fb@concordia.ca'),(12,18,'Rondo','Rajon','EV','400','514-555-9111','rr@concordia.ca');
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
INSERT INTO `Building` VALUES (1,1,'EV','1515 Saint-Catherine St W',12),(2,1,'FB','1250 Guy St',12),(3,1,'FG','1616 Saint-Catherine St W',12),(4,1,'LB','1400 Maisonneuve Blvd W',13),(5,1,'MB','1600 Boulevard de Maisonneuve O',10),(6,2,'AD','7141 Sherbrooke W',11),(7,2,'CB','7141 Sherbrooke W',11),(8,2,'CJ','7141 Sherbrooke W',11),(9,2,'DO','7141 Sherbrooke W',11),(10,2,'PC','7200 Sherbrooke W',11);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chairman`
--

LOCK TABLES `Chairman` WRITE;
/*!40000 ALTER TABLE `Chairman` DISABLE KEYS */;
INSERT INTO `Chairman` VALUES (1,1,1),(2,2,2),(3,6,3),(4,7,4),(5,8,5);
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
  `contractName` varchar(244) DEFAULT NULL,
  `contractStartDate` date DEFAULT NULL,
  `contractEndDate` date DEFAULT NULL,
  `contractPay` decimal(8,2) DEFAULT NULL,
  `courseName` varchar(244) DEFAULT NULL,
  `sectionName` varchar(244) DEFAULT NULL,
  PRIMARY KEY (`ContractID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contract`
--

LOCK TABLES `Contract` WRITE;
/*!40000 ALTER TABLE `Contract` DISABLE KEYS */;
INSERT INTO `Contract` VALUES (1,NULL,'2018-08-09','2020-08-09',8000.00,'ART','201'),(2,NULL,'2019-02-05','2020-02-05',5000.00,'COMP','352'),(3,NULL,'2017-06-07','2019-06-07',4500.00,'COMP','222'),(4,NULL,'2019-01-01','2021-01-01',7000.00,'MARK','201'),(5,NULL,'2019-03-10','2019-10-10',2500.00,'COMP','353'),(6,NULL,'2018-04-04','2020-04-04',10000.00,'MATH','201'),(7,NULL,'2019-05-02','2020-05-02',6000.00,'MECH','332'),(8,NULL,'2018-08-12','2019-08-12',5500.00,'LAW','101'),(9,NULL,'2019-10-06','2020-10-06',7500.00,'COMP','391'),(10,NULL,'2019-01-07','2020-01-07',7500.00,'COMP','355');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES (1,3,'Art 201',3),(2,3,'Comp 352',3),(3,7,'Comp 222',1),(4,9,'Mark 201',3),(5,3,'Comp 353',3),(6,1,'Math 205',3),(7,2,'Mech 332',3),(8,10,'Law 101',2),(9,4,'Comp 355',4),(10,4,'Comp 391',4),(11,5,'Buss 201',3),(12,6,'Socio 104',3),(13,8,'Saxp 379',1);
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
  `InstructorStudentID` int(11) DEFAULT NULL,
  `degreeName` varchar(45) DEFAULT NULL,
  `institutionName` varchar(45) DEFAULT NULL,
  `receivedDate` date DEFAULT NULL,
  `overallAvg` int(11) DEFAULT NULL,
  PRIMARY KEY (`DegreeID`),
  KEY `Degree_ibfk_1_idx` (`InstructorStudentID`),
  CONSTRAINT `Degree_ibfk_1` FOREIGN KEY (`InstructorStudentID`) REFERENCES `Student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Degree_ibfk_2` FOREIGN KEY (`InstructorStudentID`) REFERENCES `Instructor` (`InstructorID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Degree`
--

LOCK TABLES `Degree` WRITE;
/*!40000 ALTER TABLE `Degree` DISABLE KEYS */;
INSERT INTO `Degree` VALUES (1,NULL,'BA','Concordia University','2019-06-30',75),(2,NULL,'BSc','Concordia University','2018-12-30',83),(3,NULL,'BEd','Concordia University','2018-12-30',65),(4,NULL,'BComm','Concordia University','2019-06-30',72),(5,NULL,'BCompSc','Concordia University','2018-12-30',94),(6,NULL,'BEng','Concordia University','2018-12-30',98),(7,NULL,'BFA','Concordia University','2019-06-30',62),(8,NULL,'BCompSc','Concordia University','2018-12-30',60),(9,NULL,'BComm','Concordia University','2018-12-30',78),(10,NULL,'BFA','Concordia University','2019-06-30',86);
/*!40000 ALTER TABLE `Degree` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (1,1,3,'Math'),(2,2,2,'Physics'),(3,3,1,'Engineering'),(4,4,2,'Computer Science'),(5,5,5,'Psychology'),(6,6,4,'Business'),(7,7,8,'Art'),(8,8,10,'Music'),(9,9,7,'Marketing'),(10,10,9,'Law');
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EnrollsIN`
--

LOCK TABLES `EnrollsIN` WRITE;
/*!40000 ALTER TABLE `EnrollsIN` DISABLE KEYS */;
INSERT INTO `EnrollsIN` VALUES (26,1000006,12,5,1),(27,1000007,13,7,2),(29,1000009,15,9,1),(31,1000011,7,1,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facilities`
--

LOCK TABLES `Facilities` WRITE;
/*!40000 ALTER TABLE `Facilities` DISABLE KEYS */;
INSERT INTO `Facilities` VALUES (1,44,'Projector, Speakers'),(2,79,'Computers'),(3,80,'Computers'),(4,81,'Computers'),(5,82,'Computers'),(6,83,'Computers'),(7,100,'Scanner'),(8,101,'Fax Machine'),(9,102,'Computers'),(10,103,'Speaker'),(11,104,'Printer'),(12,205,'Computers'),(13,207,'Computers'),(14,209,'Computers'),(15,213,'Computers'),(16,225,'Computers'),(17,403,'Projector'),(18,404,'Flashing Lights'),(19,405,'Computers'),(20,406,'Computers'),(21,407,'Computers');
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
  KEY `TermID` (`TermID`),
  KEY `ThesisGraduateID` (`ThesisGraduateID`),
  CONSTRAINT `Funds_ibfk_1` FOREIGN KEY (`TermID`) REFERENCES `Term` (`TermID`),
  CONSTRAINT `Funds_ibfk_2` FOREIGN KEY (`ThesisGraduateID`) REFERENCES `ThesisGraduate` (`ThesisGraduateID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funds`
--

LOCK TABLES `Funds` WRITE;
/*!40000 ALTER TABLE `Funds` DISABLE KEYS */;
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
  `RegistrationID` int(11) DEFAULT NULL,
  `gradeLetter` enum('A+','A','A-','B+','B','B-','C+','C','C-','D+','D','D-','F') DEFAULT NULL,
  `passOrFail` enum('Pass','Fail') DEFAULT NULL,
  PRIMARY KEY (`GradeID`),
  KEY `Grade_ibfk_1_idx` (`RegistrationID`),
  CONSTRAINT `Grade_ibfk_1` FOREIGN KEY (`RegistrationID`) REFERENCES `Registration` (`RegistrationID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grade`
--

LOCK TABLES `Grade` WRITE;
/*!40000 ALTER TABLE `Grade` DISABLE KEYS */;
INSERT INTO `Grade` VALUES (12,2,'B+','Pass'),(15,5,'D-','Pass');
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
  KEY `Graduate_ibfk_1` (`StudentID`),
  KEY `Degree_ibfk_1_idx` (`DegreeID`),
  KEY `Award_ibfk_1_idx` (`AwardID`),
  KEY `Publication_ibfk_1_idx` (`PublicationID`),
  KEY `Contract_fk_1_idx` (`ContractID`),
  CONSTRAINT `Award_fk_1` FOREIGN KEY (`AwardID`) REFERENCES `Award` (`AwardID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Contract_fk_1` FOREIGN KEY (`ContractID`) REFERENCES `Contract` (`ContractID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Degree_fk_1` FOREIGN KEY (`DegreeID`) REFERENCES `Degree` (`DegreeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Graduate_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Publication_fk_1` FOREIGN KEY (`PublicationID`) REFERENCES `Publication` (`PublicationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Graduate`
--

LOCK TABLES `Graduate` WRITE;
/*!40000 ALTER TABLE `Graduate` DISABLE KEYS */;
INSERT INTO `Graduate` VALUES (6,1000006,NULL,NULL,NULL,NULL),(7,1000007,NULL,NULL,NULL,NULL),(9,1000009,NULL,NULL,NULL,NULL),(11,1000023,NULL,NULL,NULL,NULL),(12,1000024,NULL,NULL,NULL,NULL),(13,1000025,NULL,NULL,NULL,NULL),(14,1000026,NULL,NULL,NULL,NULL),(15,1000027,NULL,NULL,NULL,NULL),(16,1000028,NULL,NULL,NULL,NULL),(17,1000029,NULL,NULL,NULL,NULL),(18,1000030,NULL,NULL,NULL,NULL);
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
  KEY `Rooms_ibfk_9_idx` (`RoomsID`),
  KEY `Award_ibfk_1_idx` (`AwardID`),
  KEY `Publication_ibfk_1_idx` (`PublicationID`),
  KEY `Experience_ibfk_1_idx` (`ExperienceID`),
  CONSTRAINT `Award_ibfk_1` FOREIGN KEY (`AwardID`) REFERENCES `Award` (`AwardID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Experience_ibfk_1` FOREIGN KEY (`ExperienceID`) REFERENCES `Experience` (`ExperienceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Publication_ibfk_1` FOREIGN KEY (`PublicationID`) REFERENCES `Building` (`BuildingID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Rooms_ibfk_9` FOREIGN KEY (`RoomsID`) REFERENCES `Rooms` (`RoomsID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instructor`
--

LOCK TABLES `Instructor` WRITE;
/*!40000 ALTER TABLE `Instructor` DISABLE KEYS */;
INSERT INTO `Instructor` VALUES (1,444,1,9,1,'Thomas','Wimbleton','747 094 203','1956-02-01','450-819-5557','twim@encs.concordia.ca','123 School Avenue','Yes'),(2,213,1,8,2,'Maria','Dumbledore','132 254 963','1991-03-17','450-556-5557','mdum@encs.concordia.ca','123 School Avenue','Yes'),(3,81,5,7,3,'John','Wickboss','093 192 302','1968-04-09','450-693-7775','jwick@encs.concordia.ca','167 Dorchester Avenue','No'),(4,102,4,4,4,'Dalia','Oneflo','222 232 212','1980-02-08','450-693-7775','done@encs.concordia.ca','167 Dorchester Avenue','Yes'),(5,205,2,3,5,'Mark','Electro','939 993 913','1990-01-19','514-499-5588','mele@encs.concordia.ca','167 Magnetto Lane','Yes'),(6,406,3,2,6,'Julia','Child','140 656 245','1982-10-21','450-145-5588','jchi@encs.concordia.ca','1155 Flower Av','Yes'),(7,407,2,1,7,'Pheobe','Buffet','204 204 205','1989-02-04','514-987-1234','pbuff@encs.concordia.ca','1155 Nestle Av','Yes'),(8,561,3,10,8,'Joey','White','787 234 231','1978-02-23','514-157-8462','jwhi@encs.concordia.ca','885 Accross Av','No'),(9,407,5,6,9,'Chandler','Bing','145 642 234','1957-12-24','514-166-1664','cbin@encs.concordia.ca','669 Laughmer Av','No'),(10,545,1,5,10,'Monica','Geller','120 002 192','1966-03-18','450-198-1978','mgel@encs.concordia.ca','669 Cleanec Av','Yes');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Program`
--

LOCK TABLES `Program` WRITE;
/*!40000 ALTER TABLE `Program` DISABLE KEYS */;
INSERT INTO `Program` VALUES (7,4,'Computer Science'),(8,3,'Software Engineering'),(9,6,'Business'),(10,10,'Law and Order'),(11,4,'Computer Games'),(12,5,'Sports Psychology'),(13,1,'Applied Math'),(14,2,'Physics'),(15,3,'Mechanical Engineering'),(16,7,'Art'),(17,5,'Sociology'),(18,6,'Marketing'),(19,4,'ESports');
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
  PRIMARY KEY (`RegistrationID`),
  KEY `Registration_ibfk_1_idx` (`StudentID`),
  KEY `Registration_ibfk_3_idx` (`SectionID`),
  CONSTRAINT `Registration_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Registration_ibfk_3` FOREIGN KEY (`SectionID`) REFERENCES `Section` (`SectionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registration`
--

LOCK TABLES `Registration` WRITE;
/*!40000 ALTER TABLE `Registration` DISABLE KEYS */;
INSERT INTO `Registration` VALUES (2,1000009,2,'2018-08-02'),(5,1000006,5,'2018-08-02');
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
) ENGINE=InnoDB AUTO_INCREMENT=10526 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rooms`
--

LOCK TABLES `Rooms` WRITE;
/*!40000 ALTER TABLE `Rooms` DISABLE KEYS */;
INSERT INTO `Rooms` VALUES (44,5,60,'Classroom',4,440),(79,10,18,'Lab',7,790),(80,10,18,'Lab',8,800),(81,10,18,'Lab',8,810),(82,10,18,'Lab',8,820),(83,10,18,'Lab',8,830),(100,9,15,'OfficeGrade',1,100),(101,9,15,'OfficeGrade',1,101),(102,9,15,'OfficeGrade',1,102),(103,9,15,'OfficeGrade',1,103),(104,9,15,'OfficeGrade',1,104),(205,2,41,'Classroom',2,205),(207,2,43,'Classroom',2,207),(209,2,46,'Classroom',2,209),(213,2,50,'Classroom',2,213),(225,2,40,'Classroom',2,225),(317,1,5,'OfficeGrade',3,317),(403,4,60,'Conference Room',4,403),(404,4,60,'Classroom',4,404),(405,4,60,'Classroom',4,405),(406,4,60,'Classroom',4,406),(407,4,60,'Classroom',4,407),(441,5,60,'Classroom',4,441),(442,5,60,'Classroom',4,442),(443,5,60,'Classroom',4,443),(444,5,60,'Classroom',4,444),(525,1,50,'Classroom',5,525),(536,1,38,'Lab',5,536),(545,4,45,'Conference Room',5,545),(561,4,45,'Conference Room',5,561),(562,4,45,'Conference Room',5,562),(564,4,45,'Conference Room',5,564),(565,4,45,'Conference Room',5,565),(612,7,20,'OfficeGrade',6,612),(622,7,20,'Lab',6,622),(632,7,20,'Lab',6,632),(642,7,20,'Lab',6,642),(652,7,20,'Lab',6,652),(712,8,66,'Lab',7,712),(722,8,66,'Lab',7,722),(732,8,66,'Lab',7,732),(742,8,66,'Lab',7,742),(753,8,66,'Lab',7,753),(912,6,10,'OfficeGrade',9,912),(922,6,10,'OfficeGrade',9,922),(932,6,10,'OfficeGrade',9,932),(942,6,10,'OfficeGrade',9,942),(952,6,10,'OfficeGrade',9,952),(962,1,30,'Conference Room',9,962),(1052,1,9,'Conference Room',10,1052),(1111,3,91,'Classroom',11,1111),(1112,3,89,'Classroom',11,1112),(1113,3,89,'Classroom',11,1113),(1115,3,89,'Classroom',11,1115),(1116,3,89,'Classroom',11,1116);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Section`
--

LOCK TABLES `Section` WRITE;
/*!40000 ALTER TABLE `Section` DISABLE KEYS */;
INSERT INTO `Section` VALUES (2,525,3,5,6,2),(5,1111,7,7,7,5);
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
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000058 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (1000006,'Neeham','Titlemans','123 456 789','2019-08-01','514-333-9999','jaketitle@gmail.com','15 Dragon Street'),(1000007,'Dirk','Gently','159 753 123','1998-05-22','514-200-5322','dirkgently@gmail.com','100 Victoria Street'),(1000009,'Tevonn','Walker','987 159 321','1998-07-06','514-111-1124','twalker@gmail.com','734 Jasmine Street'),(1000011,'Tom','Goodman','738 072 784','1994-12-02','450-666-7896','goodmanflies@gmail.com','833 Dragon Ave'),(1000012,'Jonathan','Willis','576 656 805','1992-06-09','450-357-9510','jwill5@gmail.com','52-12 Romand Avenue'),(1000013,'Michael','Scott','613 561 539','1997-02-22','514-112-7536','Dundermifflin@email.com','115 Office Avenue'),(1000014,'Phyllis','Williams','737 480 426','1994-12-02','514-654-3214','cuteywill@gmail.com','1125 Office Avenue'),(1000015,'Scott','Wetland','335 200 119','1995-10-31','514-654-3217','watlandamiright@gmail.com','963 Wattka st'),(1000016,'Manilla','Louzon','779 821 214','1996-04-16','438-626-1234','manillathebest@gmail.com','1156 Hollywood Av'),(1000017,'Electra','Goodwill','268 023 702','1999-06-04','514-467-5556','elec75@msn.com','139 Brookhill Street'),(1000018,'Mario','Plumberman','775 863 087','1999-06-15','438-115-3339','drmario@hotmail.com','111 Mushroomking Ave'),(1000019,'Luigi','Plumberman','605 093 160','1992-10-06','438-119-4445','luigidabest@gmail.com','121 Mushroomking Ave'),(1000020,'Ash','Ketchum','201 977 295','1993-01-04','514-987-6543','pikapika1@gmail.com','665 Pallet Ave'),(1000021,'Gary','Blue','446 004 061','1993-03-27','514-334-3344','ratawata@yahoo.com','676 Pallet Ave'),(1000022,'Britney','Whitemen','736 499 229','1990-08-10','514-555-1475','foreveryoung@msn.com','558 Wallet St'),(1000023,'Suzanne','Baker','501 114 649','1989-04-20','450-726-4747','mjorplf9r7@thrubay.com','373  rue des Eglises Est'),(1000024,'Arnita','Evans','710 322 520','1996-10-10','514-290-1812','7qtnabhot8l@claimab.com','429  Papineau Avenue'),(1000025,'Leonard','Johnson','327 998 209','1996-02-17','514-376-8344','6r239febnn6@iffymedia.com','6817 43 Av'),(1000026,'Derrick','Penman','006 541 312','1997-12-17','514-970-8739','eixx4c5blv@fakemailgenerator.net','2896  rue Levy'),(1000027,'Betsy','Troy','443 774 179','1993-11-25','519-885-3625','735cjwms0ov@thrubay.com','3617  Albert Street'),(1000028,'Christine','Jones','734 415 987','1996-07-16','807-353-3592','b10uxrmzhse@iffymedia.com','1070  Nelson Street'),(1000029,'Frank','Pitts','271 892 028','1990-05-19','604-992-4191','u3kz1uzwkpe@payspun.com','1598  Robson St'),(1000030,'Stephen','Buchanan','525 709 747','1990-11-14','250-647-2592','ldkjyfm4bqi@claimab.com','4546  Ganges Road'),(1000031,'Marilyn','Henderson','043 906 130','1992-01-08','416-471-7720','d5tdy9dwnjw@fakemailgenerator.net','3825  Yonge Street'),(1000032,'Scott','Jarboe','127 664 274','1993-11-17','604-268-4317','mvp3bx96uya@iffymedia.com','1521  Hammarskjold Dr'),(1000033,'Donald','Cruz','005 149 828','1995-09-03','403-749-9054','aonxg16s00d@thrubay.com','4079  Port Washington Road'),(1000034,'Roger','White','716 735 402','1990-04-20','519-245-1310','sgayjpm78bk@fakemailgenerator.net','1414  Scotchmere Dr'),(1000035,'Chantel','Mueller','726 519 861','1994-05-08','416-764-9643','mzr64xpuy3h@fakemailgenerator.net','1384  Queen Elizabeth Boulevard'),(1000036,'Charles','Hirano','726 519 861','1998-03-10','613-761-4344','cv36ry3zylt@fakemailgenerator.net','686  Carling Avenue'),(1000037,'Teddy','Kan','270 972 094','1995-09-30','416-861-5829','zvfwg8dw4ar@payspun.com','289  Adelaide St'),(1000039,'John','Stanley','710 202 219','1991-04-24','604-341-0581','z54sn8pjsy@claimab.com','4907  James Street'),(1000040,'Phyllis','Thrailkill','580 316 719','1991-10-25','519-350-9777','rmietznxkyl@claimab.com','502  Scotchmere Dr'),(1000041,'Gisela','Carmichael','332 220 987','1999-03-30','905-238-6366','tyotqfb4jgg@thrubay.com','2568  Wellington Street'),(1000042,'Monica','Knight','090 975 947','1992-10-21','613-797-9273','laxth66twb@fakemailgenerator.net','2255  Carling Avenue'),(1000045,'Dj','Khalid','159 054 055','1992-01-06','514-432-4324','neeham@gmail.com','432 maisonneuve'),(1000046,'Dj','Khalid','119 473 486','1992-01-06','514-432-4324','neeham@gmail.com','432 maisonneuve'),(1000047,'Dj','Khalid','233 881 259','1992-01-06','514-432-4324','neeham@gmail.com','432 maisonneuve'),(1000048,'Dj','Khalid','011 780 764','1992-01-06','514-432-4324','neeham@gmail.com','432 maisonneuve'),(1000049,'Dj','Khalid','595 698 150','1992-01-06','514-432-4324','neeham@gmail.com','432 maisonneuve'),(1000050,'Dj','Khalid','005 192 117','1992-01-06','514-432-4324','neeham@gmail.com','432 maisonneuve'),(1000051,'Dj','Khalid','085 143 659','1992-01-06','514-432-4324','neeham@gmail.com','432 maisonneuve'),(1000055,'Nicholas','Bergeron','058 318 247','1993-06-11','514-123-4567','nicho@gmail.com','Avenue Essential'),(1000057,'James','Bond','596 016 089','1992-01-25','514-978-1234','jamesBond@gmail.com','789789 masison');
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subsection`
--

DROP TABLE IF EXISTS `Subsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Subsection` (
  `SubsectionID` int(11) NOT NULL AUTO_INCREMENT,
  `SectionID` int(11) DEFAULT NULL,
  `GraduateID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SubsectionID`),
  KEY `Subsection_ibfk_2_idx` (`GraduateID`),
  KEY `Subsection_ibfk_3` (`SectionID`),
  CONSTRAINT `Subsection_ibfk_2` FOREIGN KEY (`GraduateID`) REFERENCES `Graduate` (`GraduateID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Subsection_ibfk_3` FOREIGN KEY (`SectionID`) REFERENCES `Section` (`SectionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subsection`
--

LOCK TABLES `Subsection` WRITE;
/*!40000 ALTER TABLE `Subsection` DISABLE KEYS */;
INSERT INTO `Subsection` VALUES (2,5,11);
/*!40000 ALTER TABLE `Subsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubsectionType`
--

DROP TABLE IF EXISTS `SubsectionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `SubsectionType` (
  `SubsectionTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `SubsectionID` int(11) DEFAULT NULL,
  `type` enum('Tutorial','Lab','Marking') DEFAULT NULL,
  PRIMARY KEY (`SubsectionTypeID`),
  KEY `SubsectionType_ibfk_1_idx` (`SubsectionID`),
  CONSTRAINT `SubsectionType_ibfk_1` FOREIGN KEY (`SubsectionID`) REFERENCES `Subsection` (`SubsectionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubsectionType`
--

LOCK TABLES `SubsectionType` WRITE;
/*!40000 ALTER TABLE `SubsectionType` DISABLE KEYS */;
/*!40000 ALTER TABLE `SubsectionType` ENABLE KEYS */;
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
INSERT INTO `Term` VALUES (1,2,2018),(2,1,2018),(3,3,2019),(4,4,2019),(5,1,2018),(6,2,2018),(7,3,2018),(8,4,2018),(9,1,2019),(10,2,2019),(11,3,2019),(12,4,2019);
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
INSERT INTO `ThesisGraduate` VALUES (6,8,'Yes',1000006),(7,7,'No',1000007),(9,5,'No',1000009),(11,4,'Yes',1000023),(12,4,'Yes',1000024),(13,4,'Yes',1000025),(14,4,'No',1000026),(15,4,'Yes',1000027),(16,4,'Yes',1000036),(17,4,'No',1000040),(18,4,'No',1000042),(19,4,'No',1000033),(20,4,'Yes',1000032),(21,4,'Yes',1000029),(22,4,'Yes',1000031),(23,4,'No',1000041),(24,4,'No',1000034),(26,4,'No',1000039),(27,4,'Yes',1000037),(28,4,'No',1000028),(29,4,'Yes',1000030),(30,4,'Yes',1000035);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UnderGraduateProgram`
--

LOCK TABLES `UnderGraduateProgram` WRITE;
/*!40000 ALTER TABLE `UnderGraduateProgram` DISABLE KEYS */;
INSERT INTO `UnderGraduateProgram` VALUES (1,7,90),(2,8,90),(3,9,90),(4,10,90),(5,11,90),(6,12,90),(7,13,90),(8,14,90),(9,15,90),(10,18,90);
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

-- Dump completed on 2019-08-04  9:08:47
