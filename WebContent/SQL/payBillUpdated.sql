CREATE DATABASE  IF NOT EXISTS `paybill` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `paybill`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: paybill
-- ------------------------------------------------------
-- Server version	5.5.22

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
-- Table structure for table `adminmaster`
--

DROP TABLE IF EXISTS `adminmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminmaster` (
  `id` int(11) NOT NULL DEFAULT '0',
  `cId` int(11) DEFAULT NULL,
  `deptIds` varchar(255) DEFAULT NULL,
  `branchIds` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminmaster`
--

LOCK TABLES `adminmaster` WRITE;
/*!40000 ALTER TABLE `adminmaster` DISABLE KEYS */;
INSERT INTO `adminmaster` VALUES (1,101,'1,3','1,2,5,3,11,12');
/*!40000 ALTER TABLE `adminmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `branchId` int(11) NOT NULL AUTO_INCREMENT,
  `deptId` int(11) DEFAULT NULL,
  `bName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`branchId`),
  KEY `deptId_idx` (`deptId`),
  CONSTRAINT `deptId` FOREIGN KEY (`deptId`) REFERENCES `department` (`deptId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,1,'Computer Engineering'),(2,1,'Mechanical Engineering'),(3,1,'Civil Engineering'),(4,1,'Electronics Engineering'),(5,1,'Information Technology'),(6,1,'Chemical Engineering'),(7,2,'MBA in Finance'),(8,2,'MBA in HR'),(9,2,'MBA in Accounts'),(10,3,'Computer Science Engineering'),(11,3,'Mechanical Engineering'),(12,3,'Civil Engineering'),(13,3,'Electronics Engineering'),(14,2,NULL),(15,2,'inhg'),(29,2,'inhg'),(30,10,'Finance'),(31,10,'finIT'),(32,13,'Mechanical'),(33,15,'se'),(34,15,'se'),(35,10,'Accounting'),(36,10,'Finance'),(37,17,'Designer'),(38,18,'Desi'),(39,19,'io'),(40,20,'demo'),(41,21,'yt'),(42,22,'bh'),(43,23,'dews'),(44,24,'fr'),(45,25,'Marketing'),(46,26,'w'),(47,27,'Brand'),(48,28,'vfg');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collegeinfo`
--

DROP TABLE IF EXISTS `collegeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collegeinfo` (
  `CId` int(11) NOT NULL DEFAULT '0',
  `CName` varchar(255) DEFAULT NULL,
  `CAdd` varchar(255) DEFAULT NULL,
  `CCity` varchar(50) DEFAULT NULL,
  `CState` varchar(50) DEFAULT NULL,
  `CZip` int(30) DEFAULT NULL,
  `CRegNo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collegeinfo`
--

LOCK TABLES `collegeinfo` WRITE;
/*!40000 ALTER TABLE `collegeinfo` DISABLE KEYS */;
INSERT INTO `collegeinfo` VALUES (101,'NYSS','Wanadongari Nagpur','Nagpur','Maharashtra',440012,'NYSS88933'),(102,'YCC','Hingna Nagpur','Nagpur','Maharashtra',89888,'YCC88733'),(103,'COEP','Pinpari chinchavad','Pune','Maharashtra',88311,'COEP883222'),(0,'Raisoni',NULL,NULL,NULL,NULL,NULL),(0,'',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `collegeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `deptId` int(11) NOT NULL AUTO_INCREMENT,
  `dName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`deptId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Engineering'),(2,'MBA'),(3,'MTech'),(4,'BTech'),(8,'bsc'),(9,'bsc'),(10,'BCom'),(11,'Mechanicsme'),(12,'Mechanicsme'),(13,'Mecha'),(14,'Mecha'),(15,'BigData'),(16,'BigData'),(17,'Architecture'),(18,'IPSA'),(19,'iuy'),(20,'yt'),(21,'re'),(22,'tr'),(23,'uy'),(24,'gr'),(25,'Design'),(26,'w'),(27,'FCS'),(28,'fde');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generalinfo`
--

DROP TABLE IF EXISTS `generalinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generalinfo` (
  `idgeneralinfo` int(11) NOT NULL AUTO_INCREMENT,
  `enrollment` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idgeneralinfo`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generalinfo`
--

LOCK TABLES `generalinfo` WRITE;
/*!40000 ALTER TABLE `generalinfo` DISABLE KEYS */;
INSERT INTO `generalinfo` VALUES (31,'12345','123'),(32,'13567hvfcx','456'),(33,'123456','45'),(34,'123456','45'),(35,'123456','78'),(36,'123456','78'),(37,'123456','789'),(38,'123456','89'),(39,'123456','52'),(40,'13567hvfcx','63'),(41,'124566','852'),(42,'13567hvfcx','12'),(43,'123456errt','52'),(44,'13567hvfcx','000'),(45,'13567hvfcx','59'),(46,'13567hvfcx','23'),(47,'123456errt','03'),(48,'124566666','66'),(49,'12345555','77'),(50,'123456','11'),(51,'123456errt555','44'),(52,'123456errt555','44'),(53,'13567hvfcx11','44'),(54,'13567hvfcx11','88'),(55,'13567hvfcx11','77'),(56,'13567hvfcx11','77'),(57,'1245665','44'),(58,'1234568888','88'),(59,'1234568888','88'),(60,'7777','77'),(61,'7777','77'),(62,'8888','88'),(63,'8888','88'),(64,'454545','45'),(65,'454545','45'),(66,'123456errt555','88'),(67,'123456errt555','88'),(68,'888888','88'),(69,'6666666','66'),(70,'6666666','66'),(71,'8888888888','88'),(72,'8888888888','88'),(73,'8888888888','88'),(74,'787878','78'),(75,'787878','78'),(76,'787878','77'),(77,'7474','47'),(78,'545454','55'),(79,'545454','55'),(80,'55','55'),(81,'87','4'),(82,'8989','99'),(83,'8888888888','88'),(84,'555566','66'),(85,'123456','123'),(86,'13567hvfcx','78'),(87,'123456errt','55'),(88,'88888888888','88'),(89,'88888888888','88'),(90,'88888888888','88'),(91,'88888888888','88'),(92,'88555','55'),(93,'88555','55'),(94,'9999','99'),(95,'525252','52'),(96,'121212','12'),(97,'2121212','21'),(98,'2121212','21'),(99,'414141','11'),(100,'414141','11'),(101,'1212','14'),(102,'1212','14'),(103,'787878','77'),(104,'PANKAJ1234','11'),(105,'SAURABH1234','15'),(106,'SAURABH1234','15'),(107,'PANKAJ12','WDWD'),(108,'PANKAJ12','WDWD'),(109,'PANKAJ12','WDWD'),(110,'PANKAJ1234','1414'),(111,'PANKAJ1234','11'),(112,'PANKAJ1234','22'),(113,'123456','99'),(114,'123456','77'),(115,'123456','77'),(116,'PANKAJ1234','88'),(117,'1234','88'),(118,'7878','44'),(119,'6458451','11'),(120,'123456','99'),(121,'PANKAJ1234','88'),(122,'123456','54'),(123,'PANKAJ1234','32'),(124,'123456','88'),(125,'PANKAJ1234','66'),(126,'12345','55');
/*!40000 ALTER TABLE `generalinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'paybill'
--
/*!50003 DROP PROCEDURE IF EXISTS `INSERTDEPARTMNTANDBRANCH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTDEPARTMNTANDBRANCH`(
IN departmentName  varchar(20), 
IN branchName varchar(20)


)
BEGIN
declare Department_Id INT;



   if not exists(select dName from department where dName=departmentName) then
     
      insert into department(dName) values(departmentName);

   END if;

select deptId into Department_Id  from department where dName=departmentName limit 1;

if not exists (select bName from branches where bName=branchName limit 1) then
   insert into branches(deptId,bName) values(Department_Id,branchName);
  END if;
commit;
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

-- Dump completed on 2019-02-04 17:50:05
