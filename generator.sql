DROP DATABASE IF EXISTS insult_generator;
CREATE DATABASE IF NOT EXISTS insult_generator;
GRANT ALL PRIVILEGES ON insult_generator.* to 'blogUser'@'localhost' identified by 'blogPassword';
USE insult_generator;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `users` (`username`) VALUES ('admin'),('Morgan');

CREATE TABLE IF NOT EXISTS `user_passwords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
);

INSERT INTO `user_passwords` (`password`,`user_id`) VALUES (SHA2('admin',0),1),(SHA2('Kermit',0),2);

CREATE TABLE IF NOT EXISTS `insult_adjectives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjective` varchar(10) DEFAULT NULL,
  `intensity` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX (`intensity`)
);

#intensity 0 = tame, intensity 4 = most offensive
INSERT INTO `insult_adjectives` (adjective, intensity) VALUES ('filthy',3),('big hairy',1),('smelly',1),('unshaven',1),('Illiterate',3),('unsavory',2)
,('swarthy',3),('spackled',2),('unfaithful',2),('rancid',4),('cheating',3),('racist',4),('lazy',2),('butt hurt',4)
,('horny',2),('convicted',2),('evil',3),('uneducated',2);

CREATE TABLE IF NOT EXISTS `insult_nouns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noun` varchar(10) DEFAULT NULL,
  `intensity` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX (`intensity`)
);

#intensity 0 = tame, intensity 4 = most offensive
INSERT INTO `insult_nouns` (noun, intensity) VALUES ('lawn',1),('hound',3),('porch',1),('nerf',2),('drunk',2),('swine',4),('husband',1)
,('politician',2),('sewer',3),('crotch',4),('bum',2),('bailout',2),('elderberry',3),('trash',3),('mud',2)
,('cheese',1),('donkey',2),('hiney',2),('porn',3);

CREATE TABLE IF NOT EXISTS `insult_verbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verb` varchar(10) DEFAULT NULL,
  `intensity` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX (`intensity`)
);

#intensity 0 = tame, intensity 4 = most offensive
INSERT INTO `insult_verbs` (verb, intensity) VALUES ('monger',4),('spangler',2),('kisser',1),('herder',1),('fossil',3),('licker',2)
,('puncher',2),('fondler',3),('gambler',3),('nazi',4),('cleaner',1),('jockey',2),('swallower',4),('head',2)
,('sucker',2),('addict',3),('tickler',1),('polisher',1),('smuggler',2);




/* end regular insults */

/*********************************************************/
/* shakespeare insults */

CREATE TABLE IF NOT EXISTS `shakespeare_adjectives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjective` varchar(20) DEFAULT NULL,
  `intensity` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX (`intensity`)
);

INSERT INTO `shakespeare_adjectives` (adjective, intensity) VALUES ('artless',1),('bawdy',2),('beslubbering',2),('bootless',1),('churlish',3),('cockered',4)
,('clouted',2),('craven',3),('currish',4),('dankish',3),('dissembling',1),('droning',1),('errant',3),('fawning',1)
,('fobbing',2),('froward',3),('frothy',4),('gleeking',2),('goatish',3),('gorbellied',3),('impertinent',2),('infectious',2),('jarring',1)
,('loggerheaded',2),('lumpish',3),('mammering',2),('mangled',4),('mewling',3),('paunchy',3),('pribbling',2),('puking',3),('puny',1)
,('qualling',2),('rank',4),('reeky',2),('roguish',1),('ruttish',1),('saucy',1),('spleeny',2),('spongy',1),('surly',2)
,('tottering',2),('unmuzzled',3),('vain',2),('venomed',4),('villainous',4),('warped',3),('wayward',3),('weedy',3),('yeasty',4);


CREATE TABLE IF NOT EXISTS `shakespeare_nouns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noun` varchar(20) DEFAULT NULL,
  `intensity` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX (`intensity`)
);

INSERT INTO `shakespeare_nouns` (noun, intensity) VALUES ('base-court',1),('bat-fowling',3),('beef-witted',4),('beetle-headed',2),('boil-brained',4),('clapper-clawed',4),('clay-brained',1)
,('common-kissing',1),('crook-pated',2),('dismal-dreaming',1),('dizzy-eyed',1),('doghearted',3),('dread-bolted',2),('earth-vexing',4),('elf-skinned',4)
,('fat-kidneyed',3),('fen-sucking',4),('flap-mouthed',3),('fly-bitten',2),('fool-born',3),('full-gorged',4),('guts-griped',3)
,('half-faced',3),('ahsty-witted',3),('hedge-born',2),('hell-hated',4),('idle-headed',2),('ill-breeding',3),('ill-nurtured',2),('knotty-pated',1),('milk-livered',1)
,('motly-minded',3),('onion-eyed',1),('plume-plucked',2),('pottle-deep',1),('pox-marked',3),('reeling-ripe',4),('rough-hewn',1),('rude-growing',1),('rump-fed',3)
,('shard-borne',2),('sheep-biting',4),('spur-galled',4),('swag-bellied',3),('tardy-gaited',3),('tickle-brained',1),('toad-spotted',1),('unchin-snouted',2),('weather-bitten',1);


CREATE TABLE IF NOT EXISTS `shakespeare_verbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verb` varchar(20) DEFAULT NULL,
  `intensity` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX (`intensity`)
);

INSERT INTO `shakespeare_verbs` (verb, intensity) VALUES ('apple-john',1),('baggage',1),('barnacle',2),('bladder',3),('boar-pig',4),('bugbear',1)
,('bum-bailey',2),('canker-blossom',4),('clack-dish',4),('clotpole',3),('coxcomb',4),('codpiece',4),('death-token',2),('dewberry',1)
,('flap-dragon',1),('flax-wench',4),('flirt-gill',3),('foot-licker',2),('fustilarian',2),('giglet',3),('gudgeon',3),('haggard',2),('harpy',4)
,('hedge-pit',2),('horn-beast',1),('hugger-mugger',3),('joithead',3),('lewdster',2),('lout',3),('maggot-pie',4),('malt-worm',3),('mammet',2)
,('measle',2),('minnow',1),('miscreant',1),('moldwarp',2),('mumble-news',2),('nut-hook',3),('pidgeon-egg',1),('pignut',3),('puttock',4)
,('pumpion',1),('ratsbane',2),('scut',4),('skainsmate',3),('strumpet',1),('varlet',4),('vassal',3),('whey-face',2),('wagtail',1);






/****************************/

CREATE TABLE IF NOT EXISTS `full_insults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insult` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
);

INSERT INTO `full_insults` (insult) VALUES 
("I don't exactly hate you, but if you were on fire and I had water, I'd drink it."),
("It looks like your face caught on fire and someone tried to put it out with a hammer."),
("Shut up, you'll never be the man your mother is."),
("I'll never forget the first time we met, although I'll keep trying."),
("Yo mama so ugly when she looked in the mirror her reflection walked away"),
("Do you still love nature, despite what it did to you?"),
("You so ugly when who were born the doctor threw you out the window and the window threw you back"),
("I'm not saying he's fat but of the five fattest people I know he's three of them"),
("I hope you are brought to the top of a cliff by the person you love most in this world, and they push you off. And as you accept your mortality and make peace with it, the moment before you hit the ground, Superman comes out of nowhere and saves you. He then flies into the air, and drops you from even higher."),
("You look like a before picture"),
("I'd say that you're funny but looks aren't everything"),
("You should have been born in the Dark Ages; you look terrible in the light."),
("Ever since I saw you in your family tree, I've wanted to cut it down."),
("You are so old, even your memory is in black and white."),
("You're a person of rare intelligence. It's rare when you show any."),
("I heard your parents took you to a dog show and you won."),
("You fear success, but really have nothing to worry about."),
("You are proof that evolution CAN go in reverse."),
("I love what you've done with your hair. How did you get it to come out of one nostril like that?"),
("In the battle of wits you're an unarmed man."),
("You are so old, the candles on your birthday cake raised earth's temperature by 3 degrees."),
("You are so dumb, you planted a dogwood tree and expected a litter of puppies."),
("Your house is so nasty, I tripped over a rat, and a cockroach stole my wallet."),
("Some drink from the fountain of knowledge, you just gargled."),
("Your house is so dirty you have to wipe your feet before you go outside."),
("I heard you got a brain transplant and the brain rejected you."),
("You look like you just escaped from planet of the apes."),
("You conserve toilet paper by using both sides."),
("What are you going to do for a face when the baboon wants his butt back?"),
("To make you laugh on Saturday, I'd need to tell you a joke on Wednesday."),
("You weren't fully debugged before being released."),
("You must be from the shallow end of the gene pool."),
("You're so dense, light bends around you.");

INSERT INTO `full_insults` (`insult`, `user_id`) VALUES ("Say that to my face, you limp noodle!",2);
