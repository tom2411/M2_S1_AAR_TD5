-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: albums
-- ------------------------------------------------------
-- Server version	5.5.16-log

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
-- Table structure for table `album_items`
--

DROP TABLE IF EXISTS `album_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_items` (
  `album_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `item_type` varchar(255) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `selected` tinyint(1) NOT NULL,
  `shootdate` datetime DEFAULT NULL,
  `camera_owner` int(11) DEFAULT NULL,
  `photo_album_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`album_item_id`),
  KEY `FK_6l6uyjbrtxeebwn0ug5c2l91v` (`camera_owner`),
  KEY `FK_629ak5y3e2tn1cwa43prpwm1m` (`photo_album_id`),
  CONSTRAINT `FK_629ak5y3e2tn1cwa43prpwm1m` FOREIGN KEY (`photo_album_id`) REFERENCES `photo_albums` (`photo_album_id`),
  CONSTRAINT `FK_6l6uyjbrtxeebwn0ug5c2l91v` FOREIGN KEY (`camera_owner`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_items`
--

LOCK TABLES `album_items` WRITE;
/*!40000 ALTER TABLE `album_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Bro'),(2,'Friends'),(3,'Family');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_album_group`
--

DROP TABLE IF EXISTS `photo_album_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_album_group` (
  `photo_album_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  KEY `FK_7riq3nhm1wcnlbehnjkabjwnm` (`group_id`),
  KEY `FK_bwuufkdoxqeniv7jjjb3olet6` (`photo_album_id`),
  CONSTRAINT `FK_bwuufkdoxqeniv7jjjb3olet6` FOREIGN KEY (`photo_album_id`) REFERENCES `photo_albums` (`photo_album_id`),
  CONSTRAINT `FK_7riq3nhm1wcnlbehnjkabjwnm` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_album_group`
--

LOCK TABLES `photo_album_group` WRITE;
/*!40000 ALTER TABLE `photo_album_group` DISABLE KEYS */;
INSERT INTO `photo_album_group` VALUES (1,1),(2,2),(2,3),(3,1),(4,3);
/*!40000 ALTER TABLE `photo_album_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_album_user_allowed`
--

DROP TABLE IF EXISTS `photo_album_user_allowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_album_user_allowed` (
  `photo_album_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `FK_flsenxchg3o9kse6b4c4ymfqs` (`user_id`),
  KEY `FK_5fyu267luo138eq6nn1mq4yrs` (`photo_album_id`),
  CONSTRAINT `FK_5fyu267luo138eq6nn1mq4yrs` FOREIGN KEY (`photo_album_id`) REFERENCES `photo_albums` (`photo_album_id`),
  CONSTRAINT `FK_flsenxchg3o9kse6b4c4ymfqs` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_album_user_allowed`
--

LOCK TABLES `photo_album_user_allowed` WRITE;
/*!40000 ALTER TABLE `photo_album_user_allowed` DISABLE KEYS */;
INSERT INTO `photo_album_user_allowed` VALUES (1,3);
/*!40000 ALTER TABLE `photo_album_user_allowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_album_user_denied`
--

DROP TABLE IF EXISTS `photo_album_user_denied`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_album_user_denied` (
  `photo_album_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `FK_n4ivx1i6a3yn3n7dg2oenlci9` (`user_id`),
  KEY `FK_9lrdcta4wq0w09wwvda8q6rcw` (`photo_album_id`),
  CONSTRAINT `FK_9lrdcta4wq0w09wwvda8q6rcw` FOREIGN KEY (`photo_album_id`) REFERENCES `photo_albums` (`photo_album_id`),
  CONSTRAINT `FK_n4ivx1i6a3yn3n7dg2oenlci9` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_album_user_denied`
--

LOCK TABLES `photo_album_user_denied` WRITE;
/*!40000 ALTER TABLE `photo_album_user_denied` DISABLE KEYS */;
INSERT INTO `photo_album_user_denied` VALUES (2,2);
/*!40000 ALTER TABLE `photo_album_user_denied` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `photo_album_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `directory` varchar(255) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `thumbfile` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`photo_album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'Jack Johnson & friends show at Bercy','2008_07_09 - Jack Johnson','2008-07-10','2008-07-09','1/img_3066.jpg','Jack Johnson Show at Bercy'),(2,'Holidays with Friends','2008_07_18 - Lan La Rochelle',NULL,'2008-07-18','1/img_3138.jpg','Holidays'),(3,'Trip to paris','2008_07_11 - Cremaillere Paris','2008-07-14','2008-07-11','1/img_3092.jpg','Paris'),(4,'Christmas 08','2008_12_25 - Noel 2008',NULL,'2008-12-25','1/img_0476.jpg','Christmas');
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `FK_789v3ejjs9uj5vu1ufexj2tbv` (`group_id`),
  KEY `FK_mps81qti05d9he0y66y5jt845` (`user_id`),
  CONSTRAINT `FK_mps81qti05d9he0y66y5jt845` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FK_789v3ejjs9uj5vu1ufexj2tbv` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,1),(2,1),(1,2),(2,2),(1,3),(3,3);
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `birthday` datetime DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'1984-12-22 00:00:00','Alexandre','alex','alex@foo.org','FOO','Alex','098f6bcd4621d373cade4e832627b4f6'),(2,'1984-06-14 00:00:00','Bob','bob','bob@foo.org','BAR','Bob','098f6bcd4621d373cade4e832627b4f6'),(3,'1984-04-21 00:00:00','Chloe','chloe','chloe@foo.org','FOO',NULL,'098f6bcd4621d373cade4e832627b4f6');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-17 16:39:15
