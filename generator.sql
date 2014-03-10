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
INSERT INTO `insult_adjectives` VALUES (1,'filthy'),(2,'big hairy'),(3,'smelly'),(4,'unshaven'),(5,'Illiterate'),(6,'unsavory')
,(7,'swarthy'),(8,'spackled'),(9,'unfaithful'),(10,'rancid'),(11,'cheating'),(12,'racist'),(13,'lazy'),(14,'butt hurt')
,(15,'country fried'),(16,'horny'),(17,'convicted'),(18,'evil'),(19,'uneducated');
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
INSERT INTO `insult_nouns` VALUES (1,'lawn'),(2,'hound'),(3,'porch'),(4,'nerf'),(5,'drunk'),(6,'swine'),(7,'husband')
,(8,'politician'),(9,'sewer'),(10,'crotch'),(11,'bum'),(12,'bailout'),(13,'elderberry'),(14,'trash'),(15,'mud')
,(16,'cheese'),(17,'donkey'),(18,'hiney'),(19,'porn');
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
INSERT INTO `insult_verbs` VALUES (1,'monger'),(2,'spangler'),(3,'kisser'),(4,'herder'),(5,'fossil'),(6,'licker')
,(7,'puncher'),(8,'fondler'),(9,'gambler'),(10,'nazi'),(11,'cleaner'),(12,'jockey'),(13,'swallower'),(14,'head')
,(15,'sucker'),(16,'addict'),(17,'tickler'),(18,'polisher'),(19,'smuggler');
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

-- Dump completed on 2014-03-10  1:18:41
