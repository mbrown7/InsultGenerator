DROP DATABASE IF EXISTS insult_generator;
CREATE DATABASE IF NOT EXISTS insult_generator;
GRANT ALL PRIVILEGES ON insult_generator.* to 'blogUser'@'localhost' identified by 'blogPassword';
USE insult_generator;



CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5;

CREATE TABLE IF NOT EXISTS `user_passwords` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `password` varchar(256) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=5;


CREATE TABLE IF NOT EXISTS `insult_adjectives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjective` varchar(10) DEFAULT NULL,
  `intensity` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
);

#intensity 0 = tame, intensity 4 = most offensive
INSERT INTO `insult_adjectives` (adjective, intensity) VALUES ('filthy',3),('big hairy',1),('smelly',1),('unshaven',1),('Illiterate',3),('unsavory',2)
,('swarthy',3),('spackled',2),('unfaithful',2),('rancid',4),('cheating',3),('racist',4),('lazy',2),('butt hurt',4)
,('horny',2),('convicted',2),('evil',3),('uneducated',2);

CREATE TABLE IF NOT EXISTS `insult_nouns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noun` varchar(10) DEFAULT NULL,
  `intensity` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
);

#intensity 0 = tame, intensity 4 = most offensive
INSERT INTO `insult_nouns` (noun, intensity) VALUES ('lawn',1),('hound',3),('porch',1),('nerf',2),('drunk',2),('swine',4),('husband',1)
,('politician',2),('sewer',3),('crotch',4),('bum',2),('bailout',2),('elderberry',3),('trash',3),('mud',2)
,('cheese',1),('donkey',2),('hiney',2),('porn',3);

CREATE TABLE IF NOT EXISTS `insult_verbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verb` varchar(10) DEFAULT NULL,
  `intensity` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
);

#intensity 0 = tame, intensity 4 = most offensive
INSERT INTO `insult_verbs` (verb, intensity) VALUES ('monger',4),('spangler',2),('kisser',1),('herder',1),('fossil',3),('licker',2)
,('puncher',2),('fondler',3),('gambler',3),('nazi',4),('cleaner',1),('jockey',2),('swallower',4),('head',2)
,('sucker',2),('addict',3),('tickler',1),('polisher',1),('smuggler',2);




/* end regular insults */

/*********************************************************/
/* shakespeare insults */



DROP TABLE IF EXISTS `shakespeare_adjectives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shakespeare_adjectives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjective` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insult_adjectives`
--

LOCK TABLES `shakespeare_adjectives` WRITE;
/*!40000 ALTER TABLE `insult_adjectives` DISABLE KEYS */;
INSERT INTO `shakespeare_adjectives` VALUES (1,'artless'),(2,'bawdy'),(3,'beslubbering'),(4,'bootless'),(5,'churlish'),(6,'cockered')
,(7,'clouted'),(8,'craven'),(9,'currish'),(10,'dankish'),(11,'dissembling'),(12,'droning'),(13,'errant'),(14,'fawning')
,(15,'fobbing'),(16,'froward'),(17,'frothy'),(18,'gleeking'),(19,'goatish'),(20,'gorbellied'),(21,'impertinent'),(22,'infectious'),(23,'jarring')
,(24,'loggerheaded'),(25,'lumpish'),(26,'mammering'),(27,'mangled'),(28,'mewling'),(29,'paunchy'),(30,'pribbling'),(31,'puking'),(32,'puny')
,(33,'qualling'),(34,'rank'),(35,'reeky'),(36,'roguish'),(37,'ruttish'),(38,'saucy'),(39,'spleeny'),(40,'spongy'),(41,'surly')
,(42,'tottering'),(43,'unmuzzled'),(44,'vain'),(45,'venomed'),(46,'villainous'),(47,'warped'),(48,'wayward'),(49,'weedy'),(50,'yeasty');
/*!40000 ALTER TABLE `insult_adjectives` ENABLE KEYS */;
UNLOCK TABLES;





DROP TABLE IF EXISTS `shakespeare_nouns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shakespeare_nouns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noun` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insult_adjectives`
--

LOCK TABLES `shakespeare_nouns` WRITE;
/*!40000 ALTER TABLE `insult_adjectives` DISABLE KEYS */;
INSERT INTO `shakespeare_nouns` VALUES (1,'base-court'),(2,'bat-fowling'),(3,'beef-witted'),(4,'beetle-headed'),(5,'boil-brained'),(6,'clapper-clawed'),(7,'clay-brained')
,(8,'common-kissing'),(9,'crook-pated'),(10,'dismal-dreaming'),(11,'dizzy-eyed'),(12,'doghearted'),(13,'dread-bolted'),(14,'earth-vexing'),(15,'elf-skinned')
,(16,'fat-kidneyed'),(17,'fen-sucking'),(18,'flap-mouthed'),(19,'flap-mouthed'),(20,'fly-bitten'),(21,'fool-born'),(22,'full-gorged'),(23,'guts-griped')
,(24,'half-faced'),(25,'ahsty-witted'),(26,'hedge-born'),(27,'hell-hated'),(28,'idle-headed'),(29,'ill-breeding'),(30,'ill-nurtured'),(31,'knotty-pated'),(32,'milk-livered')
,(33,'motly-minded'),(34,'onion-eyed'),(35,'plume-plucked'),(36,'pottle-deep'),(37,'pox-marked'),(38,'reeling-ripe'),(39,'rough-hewn'),(40,'rude-growing'),(41,'rump-fed')
,(42,'shard-borne'),(43,'sheep-biting'),(44,'spur-galled'),(45,'swag-bellied'),(46,'tardy-gaited'),(47,'tickle-brained'),(48,'toad-spotted'),(49,'unchin-snouted'),(50,'weather-bitten');
/*!40000 ALTER TABLE `insult_adjectives` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `shakespeare_verbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shakespeare_verbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verb` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insult_adjectives`
--

LOCK TABLES `shakespeare_verbs` WRITE;
/*!40000 ALTER TABLE `insult_adjectives` DISABLE KEYS */;
INSERT INTO `shakespeare_verbs` VALUES (1,'apple-john'),(2,'baggage'),(3,'barnacle'),(4,'bladder'),(5,'boar-pig'),(6,'bugbear')
,(7,'bum-bailey'),(8,'canker-blossom'),(9,'clack-dish'),(10,'clotpole'),(11,'coxcomb'),(12,'codpiece'),(13,'death-token'),(14,'dewberry')
,(15,'flap-dragon'),(16,'flax-wench'),(17,'flirt-gill'),(18,'foot-licker'),(19,'fustilarian'),(20,'giglet'),(21,'gudgeon'),(22,'haggard'),(23,'harpy')
,(24,'hedge-pit'),(25,'horn-beast'),(26,'hugger-mugger'),(27,'joithead'),(28,'lewdster'),(29,'lout'),(30,'maggot-pie'),(31,'malt-worm'),(32,'mammet')
,(33,'measle'),(34,'minnow'),(35,'miscreant'),(36,'moldwarp'),(37,'mumble-news'),(38,'nut-hook'),(39,'pidgeon-egg'),(40,'pignut'),(41,'puttock')
,(42,'pumpion'),(43,'ratsbane'),(44,'scut'),(45,'skainsmate'),(46,'strumpet'),(47,'varlet'),(48,'vassal'),(49,'whey-face'),(50,'wagtail');
/*!40000 ALTER TABLE `insult_adjectives` ENABLE KEYS */;
UNLOCK TABLES;





/****************************/

CREATE TABLE IF NOT EXISTS `full_insults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insult` varchar(30) DEFAULT NULL,
  `foreign_key` int(11),
  PRIMARY KEY (`id`)
);

INSERT INTO `full_insults` (insult, foreign_key) VALUES 
("I don't exactly hate you, but if you were on fire and I had water, I'd drink it.", 1),
("It looks like your face caught on fire and someone tried to put it out with a hammer.", 2),
("Shut up, you'll never be the man your mother is.", 3),
("I'll never forget the first time we met, although I'll keep trying.", 4),
("Yo mama so ugly when she looked in the mirror her reflection walked away", 5),
("Do you still love nature, despite what it did to you?", 6),
("You so ugly when who were born the doctor threw you out the window and the window threw you back", 7),
("I'm not saying he's fat but of the five fattest people I know he's three of them", 8),
("I hope you are brought to the top of a cliff by the person you love most in this world, and they push you off. And as you accept your mortality and make peace with it, the moment before you hit the ground, Superman comes out of nowhere and saves you. He then flies into the air, an drops you from even higher.", 9),
("You look like a before picture", 10),
("I'd say that you're funny but looks aren't everything", 11),
("You should have been born in the Dark Ages; you look terrible in the light.", 12),
("Ever since I saw you in your family tree, I've wanted to cut it down.", 13),
("You are so old, even your memory is in black and white.", 14),
("You're a person of rare intelligence. It's rare when you show any.", 15),
("I heard your parents took you to a dog show and you won.", 16),
("You fear success, but really have nothing to worry about.", 17),
("You are proof that evolution CAN go in reverse.", 18),
("I love what you've done with your hair. How did you get it to come out of one nostril like that?", 19),
("In the battle of wits you're an unarmed man.", 20),
("You are so old, the candles on your birthday cake raised earth's temperature by 3 degrees.", 21),
("You are so dumb, you planted a dogwood tree and expected a litter of puppies.", 22),
("Your house is so nasty, I tripped over a rat, and a cockroach stole my wallet.", 23),
("Some drink from the fountain of knowledge, you just gargled.", 24),
("Your house is so dirty you have to wipe your feet before you go outside.", 25),
("I heard you got a brain transplant and the brain rejected you.", 26),
("You look like you just escaped from planet of the apes.", 27),
("You conserve toilet paper by using both sides.", 28),
("What are you going to do for a face when the baboon wants his butt back?", 29),
("To make you laugh on Saturday, I'd need to tell you a joke on Wednesday.", 30),
("You weren't fully debugged before being released.", 31),
("You must be from the shallow end of the gene pool.", 32),
("You're so dense, light bends around you.", 33);
