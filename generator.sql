-- MySQL dump 10.13  Distrib 5.6.13, for Linux (x86_64)
--
-- Host: localhost    Database: insult_generator
-- ------------------------------------------------------
-- Server version	5.6.13

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
-- Table structure for table `insult_adjectives`
--

DROP TABLE IF EXISTS `insult_adjectives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insult_adjectives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjective` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insult_adjectives`
--

LOCK TABLES `insult_adjectives` WRITE;
/*!40000 ALTER TABLE `insult_adjectives` DISABLE KEYS */;
INSERT INTO `insult_adjectives` VALUES (1,'big'),(2,'fat'),(3,'tiny'),(4,'weak');
/*!40000 ALTER TABLE `insult_adjectives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insult_nouns`
--

DROP TABLE IF EXISTS `insult_nouns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insult_nouns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noun` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insult_nouns`
--

LOCK TABLES `insult_nouns` WRITE;
/*!40000 ALTER TABLE `insult_nouns` DISABLE KEYS */;
INSERT INTO `insult_nouns` VALUES (1,'idiot'),(2,'moron'),(3,'bitch'),(4,'bastard');
/*!40000 ALTER TABLE `insult_nouns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insult_verbs`
--

DROP TABLE IF EXISTS `insult_verbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insult_verbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verb` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insult_verbs`
--

LOCK TABLES `insult_verbs` WRITE;
/*!40000 ALTER TABLE `insult_verbs` DISABLE KEYS */;
INSERT INTO `insult_verbs` VALUES (1,'despise'),(2,'abhor'),(3,'hate'),(4,'spit');
/*!40000 ALTER TABLE `insult_verbs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-09  3:30:41
