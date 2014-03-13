DROP DATABASE IF EXISTS insult_generator;
CREATE DATABASE IF NOT EXISTS insult_generator;
GRANT ALL PRIVILEGES ON insult_generator.* to 'blogUser'@'localhost' identified by 'blogPassword';
USE insult_generator;

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