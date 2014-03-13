DROP DATABASE IF EXISTS insult_generator;
CREATE DATABASE IF NOT EXISTS insult_generator;
GRANT ALL PRIVILEGES ON insult_generator.* to 'blogUser'@'localhost' identified by 'blogPassword';
USE insult_generator;

CREATE TABLE IF NOT EXISTS `insult_adjectives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjective` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `insult_adjectives` VALUES (1,'filthy'),(2,'big hairy'),(3,'smelly'),(4,'unshaven'),(5,'Illiterate'),(6,'unsavory')
,(7,'swarthy'),(8,'spackled'),(9,'unfaithful'),(10,'rancid'),(11,'cheating'),(12,'racist'),(13,'lazy'),(14,'butt hurt')
,(15,'horny'),(16,'convicted'),(17,'evil'),(18,'uneducated');

CREATE TABLE IF NOT EXISTS `insult_nouns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noun` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `insult_nouns` VALUES (1,'lawn'),(2,'hound'),(3,'porch'),(4,'nerf'),(5,'drunk'),(6,'swine'),(7,'husband')
,(8,'politician'),(9,'sewer'),(10,'crotch'),(11,'bum'),(12,'bailout'),(13,'elderberry'),(14,'trash'),(15,'mud')
,(16,'cheese'),(17,'donkey'),(18,'hiney'),(19,'porn');

CREATE TABLE IF NOT EXISTS `insult_verbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verb` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `insult_verbs` VALUES (1,'monger'),(2,'spangler'),(3,'kisser'),(4,'herder'),(5,'fossil'),(6,'licker')
,(7,'puncher'),(8,'fondler'),(9,'gambler'),(10,'nazi'),(11,'cleaner'),(12,'jockey'),(13,'swallower'),(14,'head')
,(15,'sucker'),(16,'addict'),(17,'tickler'),(18,'polisher'),(19,'smuggler');