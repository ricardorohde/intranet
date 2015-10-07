#
# Structure for table "modelo"
#

DROP TABLE IF EXISTS `app_modelo`;
CREATE TABLE `app_modelo` (
  `modelo_id` int(11) NOT NULL AUTO_INCREMENT,
  `modelo_descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`modelo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "modelo"
#

INSERT INTO `app_modelo` VALUES (1,'LaserJet pro 400 m401 dne '),(2,'Laserjet pro 400 m425 (Mult)'),(3,'Laserjet 100 Color mfp m175a'),(4,'Laserjet 2055'),(5,'Laserjet 1536 multi'),(6,'HP Laser Jet Pro P1102w');

#
# Structure for table "postos"
#

DROP TABLE IF EXISTS `app_postos`;
CREATE TABLE `app_postos` (
  `postos_id` int(11) NOT NULL AUTO_INCREMENT,
  `postos_nome` varchar(255) DEFAULT NULL,
  `postos_numero` int(11) DEFAULT NULL,
  `postos_ativo` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`postos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

#
# Data for table "postos"
#

INSERT INTO `app_postos` VALUES (1,'AGUIA BRANCA PERIDIO',135,1),(2,'ALEIXO NETO',23,0),(3,'ALTO LAGE',85,1),(4,'ARACRUZ CENTRO',8,1),(5,'BIOLOGIA MOLECULAR',50,1),(6,'CAMPO GRANDE - CARIACICA',17,1),(7,'CENTRAL',0,1),(8,'CENTRO MEDICO',137,1),(9,'COLATINA',39,1),(10,'GUARAPARI',4,1),(11,'H.MERID',10,1),(12,'H.SRITA',26,1),(13,'IBES',77,1),(14,'INSTITUTO TOMMASI',9,1),(15,'ITAPOA',110,1),(16,'JACARAIPE',112,1),(17,'JARDIM CAMBURI',24,1),(18,'JARDIM DA PENHA',13,1),(19,'LARANJEIRAS',27,1),(20,'LINHARES',38,1),(21,'MARUIPE',6,1),(22,'NOVO MEXICO',115,1),(23,'PORTO SANTANA',15,1),(24,'PRAIA DA COSTA',22,1),(25,'PRAIA DO CANTO',1,1),(26,'PRAIA DO MORRO',21,1),(27,'SANTA MONICA',7,1),(28,'SAO MATEUS',12,1),(29,'SAO PEDRO',114,1),(30,'TERRA VERMELHA',5,1),(31,'MATRIZ',99999,1),(32,'ANALITICA',99998,1),(33,'VILA VELHA CENTRO',2,1),(34,'DESATIVADO',666,0),(35,'VILA VELHA',99997,1);

#
# Structure for table "taxa"
#

DROP TABLE IF EXISTS `app_taxa_impress`;
CREATE TABLE `app_taxa_impress` (
  `taxa_id` int(11) NOT NULL AUTO_INCREMENT,
  `taxa_descricao` varchar(255) DEFAULT NULL,
  `taxa_valor` double DEFAULT NULL,
  PRIMARY KEY (`taxa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "taxa"
#

INSERT INTO `app_taxa_impress` VALUES (1,'Normal',0.4),(2,'Reduzido',0.39);

#
# Structure for table "impressora"
#

DROP TABLE IF EXISTS `app_impressora`;
CREATE TABLE `app_impressora` (
  `impressora_id` int(11) NOT NULL AUTO_INCREMENT,
  `impressora_serial` varchar(255) DEFAULT NULL,
  `impressora_status` tinyint(1) DEFAULT '0',
  `impressora_descricao` varchar(255) DEFAULT '',
  `fk_modelo` int(11) DEFAULT NULL,
  `fk_postos` int(11) DEFAULT NULL,
  `fk_taxa` int(11) DEFAULT NULL,
  PRIMARY KEY (`impressora_id`),
  KEY `FK_impressora_fk_postos` (`fk_postos`),
  KEY `FK_impressora_fk_taxa` (`fk_taxa`),
  KEY `FK_impressora_fk_modelo` (`fk_modelo`),
  CONSTRAINT `FK_impressora_fk_modelo` FOREIGN KEY (`fk_modelo`) REFERENCES `app_modelo` (`modelo_id`),
  CONSTRAINT `FK_impressora_fk_postos` FOREIGN KEY (`fk_postos`) REFERENCES `app_postos` (`postos_id`),
  CONSTRAINT `FK_impressora_fk_taxa` FOREIGN KEY (`fk_taxa`) REFERENCES `app_taxa_impress` (`taxa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

#
# Data for table "impressora"
#

INSERT INTO `app_impressora` VALUES (1,'BRCFD2X91D',0,'MULT Fatur (esta no santa rita)',5,34,1),(2,'BRBHBB75GM',0,'Posto(Antiga) (SANTA MONICA)',4,27,1),(3,'BRDSF3QG2P',0,'Externo',1,11,1),(4,'BRDSF3QF2F',1,'POSTO',1,33,1),(5,'BRDSF4DG27',0,'PS Cordenação',1,34,1),(6,'BRDSF89G3D',0,'NINGUEM ACHOU MERIDIONAL AVERIGUAR',1,34,1),(7,'BRBHB4702J',0,'',1,34,1),(8,'BRDSF4DG2L',0,'Faturamento',1,11,1),(9,'BRFSFBH054',0,'MULT Merid Fatur ',5,11,1),(10,'BRBFC6558Y',0,' Posto (Itapua)',4,34,1),(11,'BRDSF3QG2B',0,'Posto',1,29,1),(12,'BRDSF89G3M',0,'Almoxarifado (Antigo)',1,35,1),(13,'BRDSF4CG4P',0,'Posto',1,20,1),(14,'BRDSF3QG20',0,'Tecnica',1,32,1),(15,'BRCFC7T989',0,'Mult Nova',5,32,1),(16,'BRDSF3QG2D',0,'Lezio',1,32,1),(17,'BRDSF3QG29',0,'Recepção',1,32,1),(18,'BRDSF3QG24',0,'Almox - Luis (desativado ?)',1,34,1),(19,'BRDSF3QG2K',0,'Microscopia',1,32,1),(20,'BRDSF3QG22',0,'CPD',1,35,1),(21,'BRDSF4DG2K',0,'Posto',1,17,1),(22,'BRCFC7T92Y',0,'MULT VV Instituto',5,14,1),(24,'BRDSF89G35',0,'ST Rita Recep',1,12,1),(25,'BRDSF3QG21',0,'Resultados',1,12,1),(26,'BRBHBD35LW',0,'(MV-Atual)',4,34,1),(28,'BRDSF89G3F',0,'(PS -Atual) ',1,12,1),(29,'BRDSF3SG3G',0,'Central Diretoria Juliana',1,31,1),(30,'BRDSF89G3G',0,'Posto',1,10,1),(31,'BRCFD4HH3Z',0,'CPD 2',3,35,1),(32,'CND8FDY4FF',0,'MULT Fatur Barbara - 1',1,31,1),(33,'BRCFC8X938',0,'MULT Fatur Barbara - 2',5,31,1),(34,'BRDSF48G8C',0,'desativada',1,34,1),(35,'BRDSF48G8F',0,'Fatur Thais/Poliana',1,31,1),(36,'BRDSF48G83',0,'Fatur Tatiana/Biliana',1,31,1),(37,'CND8FDY46W',0,'MULT Contab',1,31,1),(38,'BRDSF3QG23',0,'Posto',1,15,1),(39,'BRDSF3QG2T',0,'Posto',1,30,1),(40,'BRDSF3QG2C',0,'Posto',4,22,1),(41,'SAO MATEUS',0,'Posto',1,28,1),(42,'BRDSF3QG26',0,'Posto',1,13,1),(43,'BRDSF4DG2M',0,'SECRETARIA',1,35,1),(44,'BRCFC8X93D',0,'Secretaria Mult',5,35,1),(45,'BRCFCCJ95V',0,'MULT Centr. Qualid.',5,31,1),(46,'BRDSD6X076',0,'MULT Central DP',5,31,1),(47,'BRDSF48G87',0,'Posto',1,6,1),(48,'BRDSF4CG5G',0,'Posto',1,25,1),(49,'BRDSF89G2Z',0,'Posto1',1,18,1),(50,'BRDSF89G3B',0,'Posto2',1,18,1),(51,'BRBHB7G3HM',0,'Posto',1,9,1),(52,'BRDSF4DG2H',0,'RECEPCAO',1,11,1),(53,'BRDSF3QG2S',0,'Posto1',1,19,1),(54,'BRDSF3QG2G',0,'Posto2',1,19,1),(55,'BRDSF3QG2Y',0,'Posto',1,24,1),(56,'BRDSF3NG39',1,'Posto',1,16,1),(57,'BRDSF48G85',0,'Posto',1,7,1),(58,'BRDSF3QG27',0,'Posto',1,23,1),(59,'BRDSF89G36',0,'Posto',1,21,1),(60,'BRDSF8JBPM',0,'Posto',1,4,1),(61,'BRDSF8JBPG',0,'Posto',1,4,1),(62,'BRDSF3QG2H',0,'Secretaria',1,31,1),(64,'BRDSF3QG25',0,'Recepçao',1,34,1),(65,'BRDSF48G89',0,'MV recepcao',1,11,1),(66,'teste',0,'teste',1,34,1),(67,'BRBFC8C313',0,'CHEFE',5,34,1),(68,'BRDSF3QG2F',0,'Recepçao - Celio',1,34,1),(70,'BRCFC7T91T',0,'VALERIA',5,12,1),(71,'BRDSF3QG2L',0,'Faturamento',1,31,1),(72,'BRBFC990G6',0,'CHEFFE NOVO',6,31,1),(73,'BRDSF3QG2Q',0,'PS RECEPCAO',1,11,1),(74,'BRDSH1TD27',0,'Triagem matriz',1,35,1),(75,'BRDSF3M0BW',0,'Almoxarifado',5,35,1),(76,'BRCFD3891X',0,'IMUNO',5,35,1);

#
# Structure for table "contadores"
#

DROP TABLE IF EXISTS `app_contadores`;
CREATE TABLE `app_contadores` (
  `contadores_id` int(11) NOT NULL AUTO_INCREMENT,
  `contadores_contador` int(11) DEFAULT NULL,
  `contadores_data` date DEFAULT NULL,
  `fk_impressora` int(11) DEFAULT NULL,
  PRIMARY KEY (`contadores_id`),
  KEY `FK_contadores_impressora_id` (`fk_impressora`),
  CONSTRAINT `FK_contadores_impressora_id` FOREIGN KEY (`fk_impressora`) REFERENCES `app_impressora` (`impressora_id`)
) ENGINE=InnoDB AUTO_INCREMENT=564 DEFAULT CHARSET=latin1;

#
# Data for table "contadores"
#

INSERT INTO `app_contadores` VALUES (2,28716,'2014-09-11',60),(3,25184,'2014-09-11',61),(4,70551,'2014-09-11',47),(5,77596,'2014-09-11',57),(7,91623,'2014-09-11',51),(8,84654,'2014-09-11',38),(9,7768,'2014-09-11',20),(10,49679,'2014-09-11',3),(11,42528,'2014-09-11',6),(12,54741,'2014-09-11',7),(13,64167,'2014-09-11',8),(14,7636,'2014-09-11',9),(15,7908,'2014-09-11',21),(16,216420,'2014-09-11',26),(17,192515,'2014-09-11',1),(19,19923,'2014-09-11',25),(20,12255,'2014-09-11',24),(21,42243,'2014-09-11',28),(22,46527,'2014-09-12',42),(23,42738,'2014-09-12',22),(24,179082,'2014-09-12',10),(25,76008,'2014-09-12',56),(26,104703,'2014-09-12',52),(27,20999,'2014-09-12',49),(28,110704,'2014-09-12',50),(29,133838,'2014-09-12',54),(30,76658,'2014-09-12',53),(31,14775,'2014-09-12',13),(32,20457,'2014-09-12',59),(33,48977,'2014-09-12',40),(34,44594,'2014-09-12',58),(35,27454,'2014-09-15',55),(36,108241,'2014-09-15',48),(37,286871,'2014-09-15',2),(38,24262,'2014-09-15',11),(39,12994,'2014-09-15',39),(40,55489,'2014-09-15',4),(41,219808,'2014-09-15',5),(42,10399,'2014-09-15',19),(43,25026,'2014-09-15',16),(44,27862,'2014-09-15',17),(45,11895,'2014-09-15',18),(46,5462,'2014-09-15',14),(47,128112,'2014-09-15',15),(48,12882,'2014-09-15',33),(49,23778,'2014-09-15',44),(50,28457,'2014-09-15',45),(51,3692,'2014-09-15',31),(52,93049,'2014-09-15',46),(53,21546,'2014-09-15',29),(54,25265,'2014-09-15',36),(55,137708,'2014-09-15',34),(56,46137,'2014-09-15',35),(57,72594,'2014-09-15',43),(58,5025,'2014-09-15',12),(59,4599,'2014-09-15',30),(60,8193,'2014-09-15',37),(61,13978,'2014-09-15',32),(62,107763,'2014-09-15',41),(63,33315,'2014-09-25',55),(64,291324,'2014-09-25',2),(65,16115,'2014-09-25',13),(66,109292,'2014-09-25',41),(67,14272,'2014-09-25',39),(68,48185,'2014-09-25',58),(69,76027,'2014-09-25',47),(70,93553,'2014-09-25',51),(71,117596,'2014-09-25',48),(72,83790,'2014-09-25',53),(73,145933,'2014-09-25',54),(74,7861,'2014-09-25',20),(76,233393,'2014-09-25',5),(77,50767,'2014-09-25',42),(78,23648,'2014-09-25',59),(79,184310,'2014-09-25',10),(80,24106,'2014-09-25',44),(81,29160,'2014-09-25',45),(82,11280,'2014-09-25',37),(83,96099,'2014-09-25',46),(84,14320,'2014-09-25',32),(85,27783,'2014-09-25',36),(86,17440,'2014-09-25',33),(87,48356,'2014-09-25',35),(88,145831,'2014-09-25',34),(89,4837,'2014-09-25',30),(90,3789,'2014-09-25',31),(91,22655,'2014-09-25',29),(92,8159,'2014-09-25',62),(93,58919,'2014-09-26',3),(94,119900,'2014-09-26',50),(95,26034,'2014-09-26',49),(96,68645,'2014-09-26',8),(97,7978,'2014-09-26',9),(98,31333,'2014-09-26',60),(99,27190,'2014-09-26',61),(100,82265,'2014-09-26',56),(101,59713,'2014-09-26',65),(102,60858,'2014-09-26',64),(103,114480,'2014-09-26',52),(104,25652,'2014-09-26',11),(105,844,'2014-09-26',6),(106,83679,'2014-09-26',57),(107,52728,'2014-09-26',40),(108,91643,'2014-09-26',38),(109,219854,'2014-09-26',26),(110,28972,'2014-09-26',25),(112,203707,'2014-09-26',1),(113,53455,'2014-09-26',28),(118,52790,'2014-09-27',4),(120,44306,'2014-09-29',22),(125,10,'2014-09-29',66),(126,11,'2014-09-29',66),(127,16593,'2014-09-29',24),(128,7465,'2014-09-29',67),(129,6230,'2014-09-29',12),(130,2453,'2014-09-29',21),(131,53527,'2014-09-29',68),(132,132186,'2014-09-29',15),(133,27643,'2014-09-29',16),(134,12582,'2014-09-29',14),(135,30562,'2014-09-29',17),(136,13563,'2014-09-30',19),(137,12881,'2014-09-30',18),(138,127554,'2014-10-27',48),(139,38705,'2014-10-27',55),(140,95372,'2014-10-27',51),(141,45971,'2014-10-27',22),(142,17452,'2014-10-27',13),(143,54995,'2014-10-28',42),(144,90881,'2014-10-29',53),(145,158629,'2014-10-29',54),(146,89414,'2014-10-29',56),(147,101172,'2014-10-29',38),(148,88875,'2014-10-29',57),(149,82105,'2014-10-29',47),(150,51966,'2014-10-29',58),(151,8132,'2014-10-29',20),(152,250682,'2014-10-29',5),(153,56827,'2014-10-29',4),(154,27576,'2014-10-29',11),(155,15690,'2014-10-29',39),(156,30783,'2014-10-29',49),(157,128695,'2014-10-29',50),(158,63773,'2014-10-29',3),(160,123377,'2014-10-29',52),(161,296888,'2014-10-29',2),(162,4903,'2014-10-29',21),(163,20522,'2014-10-29',24),(164,223461,'2014-10-29',26),(165,40189,'2014-10-29',25),(166,20522,'2014-10-29',24),(167,64052,'2014-10-29',28),(168,213445,'2014-10-29',1),(169,57424,'2014-10-29',40),(170,72271,'2014-10-29',8),(171,8439,'2014-10-29',9),(172,191475,'2014-10-31',10),(173,27257,'2014-10-31',59),(174,136628,'2014-10-31',15),(175,29832,'2014-10-31',16),(176,34135,'2014-10-31',60),(177,29412,'2014-10-31',61),(178,111104,'2014-10-31',41),(179,85577,'2014-10-31',64),(180,66425,'2014-10-31',65),(181,5524,'2014-10-31',30),(182,3881,'2014-10-31',31),(183,15470,'2014-10-31',62),(184,52097,'2014-10-31',35),(185,30917,'2014-10-31',36),(186,57129,'2014-10-31',12),(187,57129,'2014-10-31',68),(188,29518,'2014-10-31',45),(189,18298,'2014-10-31',37),(190,101549,'2014-10-31',46),(191,24568,'2014-10-31',44),(192,24568,'2014-10-31',33),(193,22239,'2014-10-31',32),(194,11,'2014-10-31',66),(195,24299,'2014-10-31',29),(196,7848,'2014-10-31',67),(197,32877,'2014-10-31',17),(198,14508,'2014-10-31',19),(199,17511,'2014-10-31',14),(200,14204,'2014-11-04',18),(201,109328,'2014-11-26',38),(202,58837,'2014-11-26',42),(203,137062,'2014-11-26',48),(204,87239,'2014-11-26',47),(205,29387,'2014-11-26',11),(206,131013,'2014-11-26',52),(207,95172,'2014-11-26',56),(208,54840,'2014-11-26',58),(209,97192,'2014-11-26',51),(210,43564,'2014-11-26',55),(211,94355,'2014-11-26',57),(212,18408,'2014-11-26',13),(213,197490,'2014-11-26',10),(214,47793,'2014-11-26',22),(215,96674,'2014-11-26',53),(216,169266,'2014-11-26',54),(217,30060,'2014-11-26',59),(218,24257,'2014-11-26',24),(219,221327,'2014-11-26',1),(220,50236,'2014-11-26',25),(221,226681,'2014-11-26',26),(222,60364,'2014-11-26',4),(223,16831,'2014-11-27',39),(224,73785,'2014-11-27',28),(225,68017,'2014-11-27',3),(226,36702,'2014-11-27',60),(227,31236,'2014-11-27',61),(228,266831,'2014-11-28',5),(229,8311,'2014-11-28',20),(230,126,'2014-11-28',21),(231,8757,'2014-11-28',9),(232,77532,'2014-11-28',8),(233,302118,'2014-11-29',2),(234,11,'2014-12-01',66),(235,71339,'2014-12-02',65),(236,106362,'2014-12-02',64),(237,112617,'2014-12-02',41),(238,62035,'2014-12-03',40),(239,141798,'2014-12-03',15),(240,20309,'2014-12-03',14),(241,15290,'2014-12-03',19),(242,35578,'2014-12-03',17),(243,31787,'2014-12-03',16),(244,15252,'2014-12-03',18),(245,61257,'2014-12-03',68),(246,36007,'2014-12-03',49),(247,36007,'2014-12-03',49),(248,138115,'2014-12-03',50),(249,25002,'2014-12-03',44),(250,21337,'2014-12-03',62),(251,105596,'2014-12-03',46),(252,29793,'2014-12-03',45),(253,21512,'2014-12-03',37),(254,33132,'2014-12-03',36),(255,25105,'2014-12-03',33),(256,55936,'2014-12-03',35),(257,14723,'2014-12-03',32),(258,6145,'2014-12-03',30),(259,4082,'2014-12-03',31),(260,26036,'2014-12-03',67),(261,26036,'2014-12-03',29),(262,11652,'2014-12-04',12),(263,178341,'2014-12-27',54),(264,57476,'2014-12-27',58),(265,34054,'2014-12-27',60),(266,102082,'2014-12-27',53),(267,121403,'2014-12-27',64),(268,75760,'2014-12-27',65),(269,39212,'2014-12-27',61),(270,98481,'2014-12-27',57),(271,19477,'2014-12-27',13),(272,117083,'2014-12-27',38),(273,92035,'2014-12-27',47),(274,305554,'2014-12-27',2),(275,100277,'2014-12-27',56),(276,138679,'2014-12-27',52),(277,145195,'2014-12-27',48),(278,62071,'2014-12-27',42),(279,17898,'2014-12-29',39),(280,99079,'2014-12-29',51),(281,47993,'2014-12-29',55),(282,63465,'2014-12-29',4),(283,82624,'2014-12-29',8),(284,9149,'2014-12-29',9),(285,113672,'2014-12-29',41),(286,71719,'2014-12-29',3),(287,59008,'2014-12-29',25),(288,28580,'2014-12-29',24),(289,230006,'2014-12-29',26),(290,32868,'2014-12-29',59),(291,226622,'2014-12-29',1),(292,49305,'2014-12-29',22),(293,30953,'2014-12-29',11),(294,32907,'2014-12-30',59),(295,64586,'2015-01-02',40),(296,201043,'2015-01-02',10),(297,14908,'2015-01-02',32),(298,35911,'2015-01-02',36),(299,57671,'2015-01-02',35),(300,26121,'2015-01-02',62),(301,109984,'2015-01-02',46),(302,24087,'2015-01-02',37),(303,8547,'2015-01-02',67),(304,146291,'2015-01-02',15),(305,34406,'2015-01-02',16),(306,37320,'2015-01-02',17),(307,27407,'2015-01-02',14),(308,284048,'2015-01-02',5),(309,39679,'2015-01-02',49),(310,142820,'2015-01-02',50),(311,8804,'2015-01-03',20),(312,15747,'2015-01-05',19),(313,7909,'2015-01-06',21),(314,42245,'2015-01-06',28),(315,21547,'2015-01-06',29),(316,4600,'2015-01-06',30),(317,3693,'2015-01-06',31),(318,12883,'2015-01-06',33),(319,23779,'2015-01-06',44),(320,28458,'2015-01-06',45),(321,11,'2015-01-06',66),(322,11896,'2015-01-06',18),(323,5026,'2015-01-06',12),(324,53528,'2015-01-06',68),(325,144906,'2015-01-26',52),(326,20286,'2015-01-26',13),(327,50419,'2015-01-26',22),(328,51898,'2015-01-26',55),(329,66422,'2015-01-26',68),(331,151161,'2015-01-26',48),(332,100474,'2015-01-26',51),(333,103044,'2015-01-26',57),(334,60354,'2015-01-26',58),(335,187949,'2015-01-26',54),(336,107173,'2015-01-26',53),(337,18852,'2015-01-26',39),(338,119319,'2015-01-26',38),(339,11290,'2015-01-26',30),(340,309414,'2015-01-26',2),(341,104728,'2015-01-26',56),(342,114910,'2015-01-26',41),(343,149364,'2015-01-26',50),(344,42686,'2015-01-26',49),(345,35489,'2015-01-27',59),(346,86199,'2015-01-27',8),(347,10111,'2015-01-27',9),(348,41864,'2015-01-27',60),(349,36743,'2015-01-27',61),(350,296738,'2015-01-27',5),(351,8996,'2015-01-27',20),(352,8996,'2015-01-27',20),(353,65517,'2015-01-29',42),(354,97615,'2015-01-29',47),(355,81567,'2015-01-29',65),(356,142126,'2015-01-29',64),(357,81067,'2015-01-29',65),(358,32615,'2015-01-29',11),(359,66950,'2015-01-29',4),(360,68044,'2015-01-29',40),(361,6030,'2015-01-29',21),(362,94300,'2015-01-29',28),(363,32124,'2015-01-29',24),(364,68069,'2015-01-29',25),(365,233319,'2015-01-29',26),(366,101495,'2015-01-29',70),(367,150329,'2015-01-29',15),(368,36578,'2015-01-29',16),(369,16165,'2015-01-29',19),(370,31119,'2015-01-29',14),(371,39660,'2015-01-29',17),(372,15449,'2015-01-29',12),(373,30118,'2015-01-29',45),(374,26942,'2015-01-29',37),(375,30749,'2015-01-29',62),(376,25615,'2015-01-29',44),(377,61240,'2015-01-29',35),(378,39195,'2015-01-29',36),(379,31785,'2015-01-29',33),(380,15105,'2015-01-29',32),(381,4349,'2015-01-29',31),(382,78451,'2015-01-29',43),(383,147539,'2015-01-29',71),(384,5597,'2015-01-30',72),(385,113203,'2015-01-30',46),(386,75426,'2015-01-30',3),(387,17407,'2015-01-30',18),(388,28420,'2015-01-30',29),(389,158874,'2015-02-24',48),(390,63294,'2015-02-24',58),(391,108284,'2015-02-24',57),(392,152355,'2015-02-24',52),(393,17576,'2015-02-24',30),(394,19772,'2015-02-24',39),(395,102025,'2015-02-24',51),(396,84790,'2015-02-24',65),(397,156475,'2015-02-24',64),(398,102057,'2015-02-24',47),(399,21421,'2015-02-24',13),(400,43901,'2015-02-24',60),(401,38442,'2015-02-24',61),(402,69140,'2015-02-24',68),(403,69140,'2015-02-24',4),(404,69140,'2015-02-24',68),(405,51656,'2015-02-24',22),(406,38214,'2015-02-24',59),(407,110524,'2015-02-25',56),(408,113433,'2015-02-26',53),(409,199871,'2015-02-26',54),(410,125667,'2015-02-26',38),(412,68655,'2015-02-26',42),(413,34378,'2015-02-26',24),(414,77021,'2015-02-26',25),(415,236207,'2015-02-26',26),(416,108591,'2015-02-26',70),(417,4423,'2015-02-26',31),(418,15215,'2015-02-26',32),(419,36650,'2015-02-26',62),(420,29687,'2015-02-26',37),(421,61698,'2015-02-26',35),(422,41420,'2015-02-26',36),(423,157793,'2015-02-26',71),(424,78796,'2015-02-26',43),(425,314098,'2015-02-26',2),(426,29688,'2015-02-26',45),(427,116936,'2015-02-26',46),(428,26004,'2015-02-26',44),(429,5891,'2015-02-26',72),(430,29678,'2015-02-26',29),(431,71888,'2015-02-26',40),(432,46871,'2015-02-26',49),(433,156602,'2015-02-26',50),(434,88066,'2015-02-26',8),(435,11199,'2015-02-26',9),(436,102446,'2015-02-26',28),(437,34239,'2015-02-26',11),(438,79014,'2015-02-27',3),(439,23757,'2015-02-27',20),(440,297445,'2015-02-27',5),(441,154320,'2015-02-27',15),(442,39079,'2015-02-27',16),(443,41679,'2015-02-27',17),(444,18728,'2015-02-27',18),(445,34750,'2015-02-27',14),(446,16971,'2015-02-27',19),(447,58416,'2015-02-27',55),(448,5412,'2015-03-24',75),(449,7189,'2015-03-24',76),(450,27726,'2015-03-24',20),(451,373,'2015-03-24',74),(452,26594,'2015-03-24',44),(453,79494,'2015-03-24',43),(454,169128,'2015-03-24',48),(455,18555,'2015-03-24',12),(456,65386,'2015-03-24',55),(457,108363,'2015-03-24',47),(458,22663,'2015-03-24',13),(459,35875,'2015-03-24',11),(460,67273,'2015-03-24',58),(461,25157,'2015-03-24',30),(462,212445,'2015-03-24',54),(463,120357,'2015-03-24',53),(464,114442,'2015-03-24',57),(465,52921,'2015-03-24',22),(466,319267,'2015-03-24',2),(467,117894,'2015-03-24',56),(468,76553,'2015-03-25',40),(469,162553,'2015-03-25',52),(470,119555,'2015-03-25',41),(471,51321,'2015-03-25',49),(472,165180,'2015-03-25',50),(473,37837,'2015-03-25',24),(474,117663,'2015-03-25',70),(475,239107,'2015-03-25',26),(476,84742,'2015-03-25',25),(477,112133,'2015-03-25',28),(478,46989,'2015-03-25',60),(479,40412,'2015-03-25',61),(480,89928,'2015-03-26',65),(481,175720,'2015-03-26',64),(482,83436,'2015-03-26',3),(483,21127,'2015-03-27',39),(484,104380,'2015-03-27',51),(485,35913,'2015-03-27',73),(486,12759,'2015-03-27',9),(487,89544,'2015-03-27',8),(488,42507,'2015-03-30',59),(489,17807,'2015-03-30',19),(490,73241,'2015-03-30',4),(491,44399,'2015-03-30',17),(492,41694,'2015-03-30',16),(493,158497,'2015-03-30',15),(494,37474,'2015-03-30',14),(495,73805,'2015-03-30',42),(496,133871,'2015-03-30',38),(497,4452,'2015-03-30',31),(498,44889,'2015-04-09',36),(499,167989,'2015-04-09',71),(500,63208,'2015-04-09',35),(501,15545,'2015-04-09',32),(502,37878,'2015-04-09',33),(503,41513,'2015-04-09',62),(504,121878,'2015-04-09',46),(505,34038,'2015-04-09',37),(506,30462,'2015-04-09',45),(507,125299,'2015-04-24',56),(508,24190,'2015-04-25',13),(509,72699,'2015-04-25',55),(510,179177,'2015-04-25',48),(511,33195,'2015-04-25',30),(512,41916,'2015-04-27',24),(513,127778,'2015-04-27',70),(514,95127,'2015-04-27',25),(515,324453,'2015-04-27',2),(516,81797,'2015-04-27',40),(517,115162,'2015-04-27',47),(518,49176,'2015-04-27',60),(519,45070,'2015-04-27',61),(520,128536,'2015-04-27',53),(521,226769,'2015-04-27',54),(522,106318,'2015-04-27',51),(523,71223,'2015-04-27',58),(524,54317,'2015-04-27',22),(525,37996,'2015-04-27',11),(526,76026,'2015-04-27',4),(527,120153,'2015-04-27',57),(528,198475,'2015-04-27',64),(529,95858,'2015-04-27',65),(530,77486,'2015-04-27',42),(531,125222,'2015-04-27',28),(532,22561,'2015-04-28',39),(533,12948,'2015-04-28',21),(534,1721,'2015-04-28',74),(535,222222,'2015-04-28',50),(536,122237,'2015-04-28',41),(537,88071,'2015-04-28',3),(538,56274,'2015-04-29',73),(539,140564,'2015-04-29',38),(540,32657,'2015-04-29',29),(541,30710,'2015-04-29',45),(542,126273,'2015-04-29',46),(543,15967,'2015-04-29',32),(544,42662,'2015-04-29',33),(545,66183,'2015-04-29',35),(546,48037,'2015-04-29',36),(547,177069,'2015-04-29',71),(548,39049,'2015-04-29',37),(549,6569,'2015-04-29',72),(550,45874,'2015-04-29',59),(551,162668,'2015-04-29',15),(552,44199,'2015-04-29',16),(553,18535,'2015-04-29',19),(554,47127,'2015-04-29',17),(555,167693,'2015-04-30',52),(556,91498,'2015-04-30',8),(557,15309,'2015-04-30',9),(558,39350,'2015-04-30',14),(559,56892,'2015-04-30',49),(560,27947,'2015-05-08',20),(561,4572,'2015-05-08',31),(562,79045,'2015-05-27',4),(563,132948,'2015-05-27',56);