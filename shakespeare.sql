DROP DATABASE IF EXISTS insult_generator;
CREATE DATABASE IF NOT EXISTS insult_generator;
GRANT ALL PRIVILEGES ON insult_generator.* to 'blogUser'@'localhost' identified by 'blogPassword';
USE insult_generator;

DROP TABLE IF EXISTS `insult_adjectives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insult_adjectives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjective` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insult_adjectives`
--

LOCK TABLES `insult_adjectives` WRITE;
/*!40000 ALTER TABLE `insult_adjectives` DISABLE KEYS */;
INSERT INTO `insult_adjectives` VALUES (1,'artless'),(2,'bawdy'),(3,'beslubbering'),(4,'bootless'),(5,'churlish'),(6,'cockered')
,(7,'clouted'),(8,'craven'),(9,'currish'),(10,'dankish'),(11,'dissembling'),(12,'droning'),(13,'errant'),(14,'fawning')
,(15,'fobbing'),(16,'froward'),(17,'frothy'),(18,'gleeking'),(19,'goatish'),(20,'gorbellied'),(21,'impertinent'),(22,'infectious'),(23,'jarring')
,(24,'loggerheaded'),(25,'lumpish'),(26,'mammering'),(27,'mangled'),(28,'mewling'),(29,'paunchy'),(30,'pribbling'),(31,'puking'),(32,'puny')
,(33,'qualling'),(34,'rank'),(35,'reeky'),(36,'roguish'),(37,'ruttish'),(38,'saucy'),(39,'spleeny'),(40,'spongy'),(41,'surly')
,(42,'tottering'),(43,'unmuzzled'),(44,'vain'),(45,'venomed'),(46,'villainous'),(47,'warped'),(48,'wayward'),(49,'weedy'),(50,'yeasty');
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
  `noun` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insult_nouns`
--

LOCK TABLES `insult_nouns` WRITE;
/*!40000 ALTER TABLE `insult_nouns` DISABLE KEYS */;
INSERT INTO `insult_nouns` VALUES (1,'base-court'),(2,'bat-fowling'),(3,'beef-witted'),(4,'beetle-headed'),(5,'boil-brained'),(6,'clapper-clawed'),(7,'clay-brained')
,(8,'common-kissing'),(9,'crook-pated'),(10,'dismal-dreaming'),(11,'dizzy-eyed'),(12,'doghearted'),(13,'dread-bolted'),(14,'earth-vexing'),(15,'elf-skinned')
,(16,'fat-kidneyed'),(17,'fen-sucking'),(18,'flap-mouthed'),(19,'flap-mouthed'),(20,'fly-bitten'),(21,'fool-born'),(22,'full-gorged'),(23,'guts-griped')
,(24,'half-faced'),(25,'ahsty-witted'),(26,'hedge-born'),(27,'hell-hated'),(28,'idle-headed'),(29,'ill-breeding'),(30,'ill-nurtured'),(31,'knotty-pated'),(32,'milk-livered')
,(33,'motly-minded'),(34,'onion-eyed'),(35,'plume-plucked'),(36,'pottle-deep'),(37,'pox-marked'),(38,'reeling-ripe'),(39,'rough-hewn'),(40,'rude-growing'),(41,'rump-fed')
,(42,'shard-borne'),(43,'sheep-biting'),(44,'spur-galled'),(45,'swag-bellied'),(46,'tardy-gaited'),(47,'tickle-brained'),(48,'toad-spotted'),(49,'unchin-snouted'),(50,'weather-bitten');
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
  `verb` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insult_verbs`
--

LOCK TABLES `insult_verbs` WRITE;
/*!40000 ALTER TABLE `insult_verbs` DISABLE KEYS */;
INSERT INTO `insult_verbs` VALUES (1,'apple-john'),(2,'baggage'),(3,'barnacle'),(4,'bladder'),(5,'boar-pig'),(6,'bugbear')
,(7,'bum-bailey'),(8,'canker-blossom'),(9,'clack-dish'),(10,'clotpole'),(11,'coxcomb'),(12,'codpiece'),(13,'death-token'),(14,'dewberry')
,(15,'flap-dragon'),(16,'flax-wench'),(17,'flirt-gill'),(18,'foot-licker'),(19,'fustilarian'),(20,'giglet'),(21,'gudgeon'),(22,'haggard'),(23,'harpy')
,(24,'hedge-pit'),(25,'horn-beast'),(26,'hugger-mugger'),(27,'joithead'),(28,'lewdster'),(29,'lout'),(30,'maggot-pie'),(31,'malt-worm'),(32,'mammet')
,(33,'measle'),(34,'minnow'),(35,'miscreant'),(36,'moldwarp'),(37,'mumble-news'),(38,'nut-hook'),(39,'pidgeon-egg'),(40,'pignut'),(41,'puttock')
,(42,'pumpion'),(43,'ratsbane'),(44,'scut'),(45,'skainsmate'),(46,'strumpet'),(47,'varlet'),(48,'vassal'),(49,'whey-face'),(50,'wagtail');
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
