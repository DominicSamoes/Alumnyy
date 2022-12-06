-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: alumnyydb
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `approvedconnection`
--

DROP TABLE IF EXISTS `approvedconnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approvedconnection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `connecta` int DEFAULT NULL,
  `connectb` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `connecta` (`connecta`),
  KEY `connectb` (`connectb`),
  CONSTRAINT `approvedconnection_ibfk_1` FOREIGN KEY (`connecta`) REFERENCES `user` (`id`),
  CONSTRAINT `approvedconnection_ibfk_2` FOREIGN KEY (`connectb`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approvedconnection`
--

LOCK TABLES `approvedconnection` WRITE;
/*!40000 ALTER TABLE `approvedconnection` DISABLE KEYS */;
INSERT INTO `approvedconnection` VALUES (1,'2022-12-05 10:51:48',15,16),(2,'2022-12-05 15:49:24',15,17),(3,'2022-12-05 15:59:26',17,16);
/*!40000 ALTER TABLE `approvedconnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connect`
--

DROP TABLE IF EXISTS `connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `initid` int DEFAULT NULL,
  `recid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `initid` (`initid`),
  KEY `recid` (`recid`),
  CONSTRAINT `connect_ibfk_1` FOREIGN KEY (`initid`) REFERENCES `user` (`id`),
  CONSTRAINT `connect_ibfk_2` FOREIGN KEY (`recid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connect`
--

LOCK TABLES `connect` WRITE;
/*!40000 ALTER TABLE `connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `text` varchar(10000) DEFAULT NULL,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'2022-12-05 16:39:31','Here in Eswatini, we need to seriously address the high rate of youth unemployment.',15),(2,'2022-12-05 16:50:21','Eswatini has a serious problem with youth unemployment.',17);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `programme` varchar(255) DEFAULT NULL,
  `mobilenumber` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `avatar` varchar(560) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `organisation` varchar(255) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `bio` varchar(800) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'2022-11-25 11:51:51','Futhi Gule',NULL,'University of Pretoria','MSc Data Science','233555','futhi.gule@juu.com',NULL,'Senior Data Scientist','Juu',2021,NULL,'sha256$kWGlj6HpcEeoR4an$1cdeb879e67a66e0b303e9a3135233adf94fea317626dde966f911ed564602c0'),(2,'2022-11-25 12:39:18','Fransisca Smith',NULL,'University of Eswatini','BSc Computer Science and Physics','895552332','francisca.smith@samocorp.com',NULL,'Software Engineer','Samocorp',2020,NULL,'sha256$ndvyk9Cluj5tWUzo$7240b0812ad98d5a82103d650af42c3c430b502e66de2244bd33a7649bdd8a78'),(3,'2022-11-28 11:21:29','Gregory Ndlovu',NULL,'University of Botswana','MBA Finance','366622222','greg.ndlovu@sands.co.sz',NULL,'Chief Financial Officer','Sukati and Siibandze Construction',2018,NULL,'sha256$1Xpo0A75TBq2x2pu$94fd03b63bf2bbeed93adced4e47df675374bd02080aa9a32702f8d9b696a834'),(4,'2022-11-28 12:03:10','Ederson Paunde','Mozambique','Stanford University','PhD Physics ','71222333333','ederson.paunde@stanford.edu',NULL,'Professor','Stanford University',2020,NULL,'sha256$DW6HSO4Tcwj4oqVp$de0f760038167eaf798b00b1ddd316aa73dfe81bf4783c178d3014a2ed9bf0bf'),(6,'2022-11-28 12:08:50','Goodwin Dlamini','Eswatini','University of Idaho','MA Political Science','9855552','goodwindlamini@jmail.com',NULL,'Lecturer','University of Eswatini',2015,NULL,'sha256$cSvSyML4GLH2WDIY$65854861e6c3881f9488435d02bdca831f4151d82c8bd80f9d2f098320b9b7db'),(8,'2022-11-28 12:14:57','Colile Maseko','Eswatini','University of Cape Town','LLM','65233332','colile.maseko@zoogle.com',NULL,'Senior Legal Officer','Zoogle',2020,NULL,'sha256$ylrGdeEWg9nzMgNf$babd12cdf63a8bb3b383c50c29d331a825243560972c76319a06fca61bc20c81'),(9,'2022-11-28 13:07:23','Leonel dos Santos','Eswatini','Eduardo Universidade Mondlane','BEng Civil Engineering','63000744','leo.dosantos@indlovu.com',NULL,'Project Manager','Indlovu Construction',2016,NULL,'sha256$I4RoUOG5MIEoPVRj$a72718196d3171093fc0615558943d5d8490931dd028c2a31269170c7ce903b1'),(10,'2022-11-29 05:02:53','Mkhulisi Zwane','Eswatini','University of Eswatini','BCom Finance','732221112','mkhulisi.zwane@dmkm.com',NULL,'Auditor','Dlamini Mabaso Khumalo and Masuku',2018,NULL,'sha256$FzYj3fcJ8e15PTre$73e5c1560f2be0e9c69e7a944f7f3aaa14bfd4c432dce59401c13e5c1fcf3a18'),(11,'2022-11-29 05:35:21','Nomkhosi Malaza','Eswatini','Bulawayo Polytechnic','BSc Forestry','896333222','nomkhismalaza@fmail.com',NULL,'Forester','Bhunya Forest Company',2021,NULL,'sha256$TOytoG4yEovbsys2$eeca44488e4b1c3be6ee2ce73302a47c901b0f0c77e4cad65ecdddfc8b377574'),(12,'2022-11-29 10:12:58','Jabulile Masuku','United States of America','Washington College','MA Economics','3625557444','jabulile.masuku@wc.edu',NULL,'Lecturer','Washington College',2014,NULL,'sha256$NX4Z5G2DEwdgCkdw$eec841fe6c3292fa67dd0dc1c4a1d5ca3afcb0b8afee4f311eb7687a2e8254cc'),(13,'2022-11-29 16:35:20','Hirohito Takanawa','Japan','Tokyo University','BEng Civil Engineering','69222233755','hirohitotaka@umail.com',NULL,'Civil Engineer','Tokyo International Construction',2019,NULL,'sha256$LZuLUB6qskfuGCMb$f3ec013429aa7c875f018fc7599d40f2c2566c073f75c626c83a690d3da6f517'),(14,'2022-11-29 18:40:03','Julius da Silva','Eswatini','University of Ghana','MBA','899622233622','julius.dasilva@zoogle.com',NULL,'Senior Accountant','Zoogle',2015,NULL,'sha256$V8NIvBiNMGfNkm8e$5f0c0f4bebaf232a75ec6c95dfd3b08dbec340db6ef531e117dc6b1f33d0f3cc'),(15,'2022-11-30 21:23:22','Lisa Fakudze','Eswatini','University of Eswatini','BSc Chemistry and Mathematics','69853333','lisafakudze@mord.co.sz',NULL,'Chemical Engineer Trainee','Mord Inc',2021,NULL,'sha256$jYqV6UNrGbHUoJRI$c1b82427875a592ed4b7c86c7095e39e7ba62c9fcddf467afcb9e2630730257f'),(16,'2022-12-04 22:40:17','Hlalelwa Mabila','Eswatini','University of Eswatini','BSc Agronomy','6230074','hlalelwama@zmail.com',NULL,'Senior Agronomist','Soilrr',2016,NULL,'sha256$W10LkRTL1LTZMtzC$c82e8a0061d07d3c6bee36b66f945ad0bacbf2f5d0b353aafb1ec054ad897c25'),(17,'2022-12-05 15:25:13','Juan Gonzalo Gonzalez','Eswatini','University of Eswatini','BSc Physcics and Mathematics','98233322','juan.gonzalez@zoogle.com',NULL,'Data Scientist','Zoogle',2019,NULL,'sha256$Xibqs3EIpzBX5a4m$ae880556a5bfd264728f2e2f40d3b5631991cd39252ec47d37b528497dfb3788');
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

-- Dump completed on 2022-12-06  8:08:34
