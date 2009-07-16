-- MySQL dump 10.11
--
-- Host: localhost    Database: vitaflo_sistema
-- ------------------------------------------------------
-- Server version	5.0.51b

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
-- Create schema vitaflo_sistema
--
CREATE DATABASE IF NOT EXISTS vitaflo_sistema;
USE vitaflo_sistema;

GRANT all ON vitaflo_sistema.* TO 'vitaflo'@'localhost' IDENTIFIED BY 'java1234';

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `clients` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `address` varchar(45) NOT NULL default '',
  `telephone` varchar(45) NOT NULL default '',
  `email` varchar(45) NOT NULL default '',
  `status` enum('Enabled','Disabled') NOT NULL default 'Enabled',
  `contact` varchar(45) NOT NULL,
  `version` bigint(20) default NULL,
  `contact_name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'OSPIA','Venezuela 2386','4383-9026','','Enabled','',0,NULL),(2,'DroguerÃ­a Itati','Gobernador Pedro FerrÃ© 1878','03783-430595/436225','','Enabled','',0,NULL),(3,'DroguerÃ­a Zeus','Avda. Cabret 1916 (Posadas)','03752-438900','','Enabled','',0,NULL),(4,'OSECAC','Moreno 648 (Capital Federal)','4332-4217','','Enabled','',0,NULL),(5,'Obra Social Jefes de Oficiales Navales','24 de Noviembre 645','4932-8079','','Enabled','',0,NULL),(6,'NÃ©stor Mainardi','Urquiza 225 (CÃ³rdoba)','03562-422502','','Disabled','',0,NULL),(7,'Droguer&Atilde;&shy;a Central','NO','NO','','Disabled','',1,NULL),(8,'Hospital FrancÃ©s','La Rioja 951','4959-1500','','Enabled','',0,NULL),(9,'DASPU OBRA SOCIAL','NO','NO','','Enabled','',0,NULL),(10,'Fundo Estadual de Saude do Parana','Rua Piquiri, 170, Reboucas. Curitiba, Parana,','NO','','Enabled','',0,NULL),(11,'DroguerÃ­a San Miguel','San Martin 2102 (Posadas)','03752-431652','','Enabled','',0,NULL),(12,'Obra Social Personal de Farmacia','ConstituciÃ³n 2066','4941-1342','','Enabled','',0,NULL),(13,'I.N.S.S.J.P','PerÃº 169 5Â°A','4344-8701','','Enabled','',0,NULL),(14,'Hospital Garrahan','Combate de los Pozos 1881','4308-4300','','Enabled','',0,NULL),(15,'CEMECO','CÃ³rdoba','NO','','Enabled','',0,NULL),(16,'Corbiet SA','C&Atilde;&sup3;rdoba','NO','','Enabled','',1,NULL),(17,'Sin Obra Social','NO','NO','','Enabled','',0,NULL),(18,'Drogueria Pharmers SRL','NO','NO','','Enabled','',0,NULL),(19,'Biofar','Lopez y Planes 551 (Resistencia, Chaco)','(03722) 441212/442772','','Enabled','',0,NULL),(20,'Secretaria de Saude de Santa Catarina','Brasil','NO','','Enabled','',0,NULL),(21,'Libra','ARROYO GRANDE 2832.CP 11800. Montevideo. Urug','00598 2200 5521','','Enabled','',0,NULL),(22,'Smata','CÃ³rdoba','NO','','Enabled','',0,NULL),(23,'Instituto de PrevisiÃ³n y Seguridad Social','TucumÃ¡n','NO','','Enabled','',0,NULL),(24,'Drogueria Mar','Chaco','03783-478400','','Enabled','',0,NULL),(25,'IOSE','NO','NO','','Enabled','',0,NULL),(26,'Instituto del niÃ±o (Ecuador)','Ecuador','NO','','Enabled','',0,NULL),(27,'OSPE','Rodriguez PeÃ±a 538','4373-5740/4371/8957','','Enabled','',0,NULL),(28,'Helio Segouras','Brazil','NO','','Enabled','',0,NULL),(29,'Rafael Elizalde','NO','NO','','Enabled','',0,NULL),(30,'Swan Medicare','Denmark','+45 33 88 10 00','','Enabled','',0,NULL),(31,'Cassia Sana','Brasil','NO','','Enabled','',0,NULL),(32,'Isabel Magnano','Brasil','NO','','Enabled','',0,NULL),(33,'Ramiro Cabrero','Brasil','NO','','Enabled','',0,NULL),(34,'ProtecciÃ³n Social de Ecuador','Ecuador','NO','','Enabled','',0,NULL),(35,'CompaÃ±ia de Servicios FarmacÃ©uticos','NO','NO','NO','Enabled','',0,NULL),(36,'Hospital Italiano','GascÃ³n 450','4959-0200','Gabriela.Fraschetti@hospitalitaliano.org.ar','Enabled','',0,NULL),(37,'Peralta','Diagonal TucumÃ¡n 1193.Martnez','4798-5152/154404-9480','','Enabled','',0,NULL),(38,'OSPECOR','NO','NO','gralbard@yahoo.com.ar','Enabled','Graciela',0,NULL),(39,'Instituto Dorrego','3 de febrero 748.Rosario','(0341)4202411','farmacia@institutodorrego.com.ar','Enabled','',0,NULL),(40,'Gina Marinho','Brasil','NO','NO','Enabled','',0,NULL),(41,'Alfonso RamÃ³n DarÃ­o','Chaco','no','no','Enabled','no',0,NULL),(42,'Consulado Paraguay','no','no','iralabernal@hotmail.com','Enabled','',0,NULL),(43,'SES','Brasil','(51) 3288-5982','ceres@saude.rs.gov.br','Enabled','Ceres Salazar',0,NULL),(44,'Ministerio de Desarrollo Social','no','4121-4604/4121-4611','no','Enabled','Dr Silvio Presa',0,NULL),(45,'Galeno ','no','no','no','Enabled','J.C.Laporta',0,NULL),(46,'Juan','test address','45454465','test@email.com','Enabled','Cirilo',0,NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `countries` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,0,'AR','Argentina'),(2,0,'BR','Brasil'),(3,0,'CL','Chile'),(4,0,'UY','Uruguay');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drugs`
--

DROP TABLE IF EXISTS `drugs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `drugs` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `status` enum('Enabled','Disabled') NOT NULL default 'Enabled',
  `version` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `drugs`
--

LOCK TABLES `drugs` WRITE;
/*!40000 ALTER TABLE `drugs` DISABLE KEYS */;
INSERT INTO `drugs` VALUES (2,'Fenilbutirato de Sodio','Enabled',NULL),(3,'Cisteamina','Enabled',NULL),(4,'Orphadin','Enabled',NULL),(5,'Ambetaine','Enabled',NULL),(7,'Fenilbutirato 250mg','Enabled',NULL),(8,'Hemina','Enabled',NULL),(9,'LNAA','Enabled',NULL),(11,'Lacrisert ','Enabled',NULL),(12,'Cidofovir','Enabled',NULL),(13,'dicloroacetato de sodio','Enabled',NULL);
/*!40000 ALTER TABLE `drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `proforma_id` int(10) unsigned NOT NULL default '0',
  `code` varchar(45) NOT NULL default '',
  `client_id` int(10) unsigned NOT NULL default '0',
  `amount` float NOT NULL default '0',
  `date` date NOT NULL default '0000-00-00',
  `status` enum('Pendiente','Pagada') NOT NULL default 'Pendiente',
  `concile` int(10) unsigned NOT NULL default '0',
  `version` bigint(20) default NULL,
  `create_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK25F222E6250603F7` (`client_id`),
  KEY `FK25F222E68E8C9EED` (`proforma_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,'2008-07-30 12:18:53',71,'',17,0,'2008-07-30','Pendiente',0,NULL,NULL),(2,'2008-07-30 12:19:02',71,'',17,0,'2008-07-30','Pendiente',0,NULL,NULL),(3,'2008-08-07 11:11:05',1,'178',1,0,'2008-01-14','Pagada',0,NULL,NULL),(4,'2008-08-07 11:12:37',2,'182',2,0,'2008-01-15','Pagada',1,NULL,NULL),(5,'2008-08-07 11:14:11',3,'180',3,0,'2008-01-15','Pagada',0,NULL,NULL),(6,'2008-08-07 11:15:32',4,'179',4,0,'2008-01-15','Pagada',1,NULL,NULL),(7,'2008-08-07 11:16:16',5,'177',5,0,'2008-01-14','Pagada',1,NULL,NULL),(8,'2008-08-07 11:16:58',6,'181',6,0,'2008-01-15','Pagada',0,NULL,NULL),(9,'2008-08-07 11:17:54',7,'183',1,0,'2008-02-07','Pagada',1,NULL,NULL),(10,'2008-08-07 11:19:10',8,'188',8,0,'2008-02-19','Pagada',0,NULL,NULL),(11,'2008-08-07 11:20:10',9,'189',9,0,'2008-02-19','Pagada',0,NULL,NULL),(12,'2008-08-07 11:24:39',11,'192',3,0,'2008-02-21','Pagada',1,NULL,NULL),(13,'2008-08-07 11:28:52',12,'234',11,0,'2008-07-31','Pagada',1,NULL,NULL),(14,'2008-08-07 11:30:04',13,'232',12,0,'2008-07-07','Pendiente',0,NULL,NULL),(15,'2008-08-07 11:32:04',14,'186',1,0,'2008-02-19','Pagada',1,NULL,NULL),(16,'2008-08-07 11:33:41',15,'187',13,0,'2008-02-19','Pagada',1,NULL,NULL),(17,'2008-08-07 11:41:20',17,'185',4,0,'2008-02-18','Pagada',0,NULL,NULL),(18,'2008-08-07 11:53:48',20,'194',16,0,'2008-03-06','Pagada',1,NULL,NULL),(19,'2008-08-07 12:04:26',21,'191',17,0,'2008-02-21','Pagada',0,NULL,NULL),(20,'2008-08-07 12:05:48',22,'195',17,0,'2008-03-19','Pagada',1,NULL,NULL),(21,'2008-08-07 12:09:35',23,'200',3,0,'2008-04-11','Pagada',1,NULL,NULL),(22,'2008-08-07 12:12:07',25,'193',4,0,'2008-03-06','Pagada',1,NULL,NULL),(23,'2008-08-07 12:24:54',26,'199',8,0,'2008-04-11','Pagada',0,NULL,NULL),(24,'2008-08-07 12:26:39',27,'196',5,0,'2008-03-26','Pagada',1,NULL,NULL),(25,'2008-08-07 12:31:36',28,'197',1,0,'2008-03-26','Pagada',1,NULL,NULL),(26,'2008-08-07 12:36:16',29,'206',18,0,'2008-04-18','Pagada',1,NULL,NULL),(27,'2008-08-07 12:40:26',30,'208',19,0,'2008-05-13','Pagada',1,NULL,NULL),(28,'2008-08-07 12:49:16',31,'202',5,0,'2008-04-14','Pagada',1,NULL,NULL),(29,'2008-08-11 11:25:36',32,'203',1,0,'2008-04-14','Pagada',1,NULL,NULL),(30,'2008-08-11 11:28:52',33,'201',4,0,'2008-04-11','Pagada',1,NULL,NULL),(31,'2008-08-11 11:49:34',37,'211',1,0,'2008-05-19','Pagada',1,NULL,NULL),(32,'2008-08-11 11:50:30',38,'212',1,0,'2008-05-19','Pagada',1,NULL,NULL),(33,'2008-08-11 11:58:26',41,'207',21,0,'2008-05-15','Pagada',1,NULL,NULL),(34,'2008-08-11 12:01:24',42,'213',16,0,'2008-05-19','Pagada',1,NULL,NULL),(35,'2008-08-11 12:03:31',43,'213',8,0,'2008-05-19','Pagada',0,NULL,NULL),(36,'2008-08-11 12:05:49',44,'209',17,0,'2008-05-15','Pagada',1,NULL,NULL),(37,'2008-08-11 12:07:55',45,'218',22,0,'2008-06-11','Pagada',0,NULL,NULL),(38,'2008-08-11 12:09:28',46,'219',9,0,'2008-06-18','Pagada',0,NULL,NULL),(39,'2008-08-11 12:10:31',47,'215',21,0,'2008-05-22','Pagada',1,NULL,NULL),(40,'2008-08-11 12:11:44',48,'220',1,0,'2008-06-18','Pagada',1,NULL,NULL),(41,'2008-08-11 12:13:40',49,'221',5,0,'2008-06-18','Pagada',1,NULL,NULL),(42,'2008-08-11 12:15:21',50,'184',23,0,'2008-02-07','Pagada',1,NULL,NULL),(43,'2008-08-11 12:24:18',52,'216',4,0,'2008-05-26','Pagada',1,NULL,NULL),(44,'2008-08-11 12:26:36',53,'229',1,0,'2008-07-17','Pagada',0,NULL,NULL),(45,'2008-08-11 12:28:13',55,'217',10,0,'2008-05-27','Pagada',1,NULL,NULL),(46,'2008-08-11 12:33:17',57,'208',19,0,'2008-05-13','Pagada',0,NULL,NULL),(47,'2008-08-11 12:38:19',58,'223',12,0,'2008-06-30','Pagada',1,NULL,NULL),(48,'2008-08-11 12:39:32',59,'227',8,0,'2008-07-02','Pagada',0,NULL,NULL),(49,'2008-08-11 12:54:45',60,'222',4,0,'2008-06-18','Pagada',0,NULL,NULL),(50,'2008-08-11 12:56:54',61,'224',17,0,'2008-07-02','Pagada',0,NULL,NULL),(51,'2008-08-12 11:01:29',62,'228',11,0,'2008-02-07','Pagada',1,NULL,NULL),(52,'2008-08-12 11:07:39',64,'231',17,0,'2008-07-07','Pagada',0,NULL,NULL),(53,'2008-08-12 11:15:26',65,'229',1,0,'2008-07-17','Pagada',0,NULL,NULL),(54,'2008-08-12 11:30:33',66,'232',12,0,'2008-07-17','Pagada',1,NULL,NULL),(55,'2008-08-12 11:32:03',67,'233',25,0,'2008-07-17','Pagada',0,NULL,NULL),(56,'2008-08-12 11:35:12',69,'230',4,0,'2008-07-17','Pagada',1,NULL,NULL),(57,'2008-08-12 11:45:00',72,'224',28,0,'2008-07-02','Pagada',1,NULL,NULL),(58,'2008-09-26 13:01:15',105,'225',24,0,'2008-07-02','Pagada',1,NULL,NULL),(59,'2008-10-03 14:55:51',107,'234',11,0,'2008-07-31','Pagada',0,NULL,NULL),(60,'2008-10-03 15:01:49',82,'235',12,0,'2008-07-31','Pagada',0,NULL,NULL),(61,'2008-10-03 15:02:54',97,'236',10,0,'2008-08-13','Pagada',0,NULL,NULL),(62,'2008-10-03 15:04:33',81,'237',31,0,'2008-08-13','Pagada',1,NULL,NULL),(63,'2008-10-03 15:16:47',96,'238',1,0,'2008-08-20','Pagada',1,NULL,NULL),(64,'2008-10-03 15:26:50',108,'239',4,0,'2008-08-22','Pagada',1,NULL,NULL),(65,'2008-10-03 15:32:16',76,'240',5,0,'2008-08-22','Pagada',1,NULL,NULL),(66,'2008-10-03 15:33:25',87,'241',11,0,'2008-08-22','Pagada',1,NULL,NULL),(67,'2008-10-03 15:35:10',89,'242',13,0,'2008-09-02','Pagada',1,NULL,NULL),(68,'2008-10-03 15:36:50',93,'243',15,0,'2008-09-03','Pagada',0,NULL,NULL),(69,'2008-10-03 15:38:09',79,'244',16,0,'2008-09-03','Pagada',1,NULL,NULL),(70,'2008-10-03 15:42:12',109,'245',17,0,'2008-09-08','Pagada',0,NULL,NULL),(71,'2008-10-03 15:46:50',110,'246',12,0,'2008-08-09','Pagada',1,NULL,NULL),(72,'2008-10-03 15:47:39',86,'247',9,0,'2008-09-08','Pagada',0,NULL,NULL),(73,'2008-10-03 15:48:20',90,'248',29,0,'2008-09-08','Pagada',0,NULL,NULL),(74,'2008-10-03 15:49:07',92,'249',33,0,'2008-09-08','Pagada',0,NULL,NULL),(75,'2008-10-03 15:50:47',91,'250',23,0,'2008-09-08','Pagada',0,NULL,NULL),(76,'2008-10-03 15:52:41',106,'251',1,0,'2008-09-12','Pagada',0,NULL,NULL),(77,'2008-10-03 15:56:56',100,'252',5,0,'2008-09-16','Pagada',0,NULL,NULL),(78,'2008-10-03 15:59:54',95,'253',4,0,'2008-09-19','Pagada',1,NULL,NULL),(79,'2008-10-03 16:01:42',85,'254',1,0,'2008-09-19','Pagada',1,NULL,NULL),(80,'2008-10-03 16:02:19',102,'255',5,0,'2008-09-23','Pendiente',1,NULL,NULL),(81,'2008-10-08 12:53:45',101,'256',29,0,'2008-09-29','Pendiente',0,NULL,NULL),(82,'2008-10-08 12:55:28',94,'257',20,0,'2008-09-29','Pendiente',1,NULL,NULL),(83,'2008-10-10 16:21:39',114,'190',35,0,'2008-02-19','Pagada',1,NULL,NULL),(84,'2008-10-10 16:46:09',115,'226',19,0,'2008-07-02','Pagada',1,NULL,NULL),(85,'2009-01-20 11:25:00',164,'292',1,0,'2009-01-12','Pagada',1,NULL,NULL),(86,'2009-01-30 14:19:09',176,'293',45,0,'2009-01-28','Pendiente',1,NULL,NULL),(87,'2009-01-30 14:20:21',173,'294',1,0,'2009-01-29','Pendiente',1,NULL,NULL);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `notes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `patient_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `text` text NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `version` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,1,'2009-02-01 23:31:18','asdf',2,NULL);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `patients` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `first_name` varchar(45) NOT NULL default '',
  `last_name` varchar(45) NOT NULL default '',
  `client_id` int(10) unsigned NOT NULL default '0',
  `status` enum('Enabled','Disabled') NOT NULL default 'Enabled',
  `telephone` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  `version` bigint(20) default NULL,
  `country_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK49A9760E250603F7` (`client_id`),
  KEY `FK49A9760EC07819E5` (`client_id`),
  KEY `FK49A9760ED5F7034F` (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Ignacio','Levandowsky',1,'Enabled','44427329','Carina Levandowsky (madre)',1,1),(2,'Facundo','Vallejos',2,'Enabled','03783430595','Drogueria Itati',0,1),(3,'JC','Rotta',3,'Enabled','0375415414701','Diego Rotta (padre)',0,1),(4,'Lucas','Contreras',4,'Enabled','02302434171 / 15488809 ','Marcela (madre)',0,1),(5,'Maximo','Tortolini',5,'Enabled','1551783880','Javier (padre)',0,1),(6,'Melina','Mainardi',22,'Enabled','03562422502','Nestor (padre)',0,1),(7,'Franco','Viggiano',8,'Enabled','','',0,1),(8,'Candela','Altamira',9,'Enabled','03543447044 / 156209922','Mariana (madre)',0,1),(9,'VGPF','VGPF',10,'Enabled','00551150817396','Instituto Canguru',0,1),(10,'Ariadna','Coronel',12,'Enabled','','',0,1),(11,'Marlene','Guercio',13,'Enabled','0222715440258 / 02272420354','Josefina (madre)',0,1),(12,'NO','NO',14,'Disabled','','',0,1),(13,'Natali','Singh',15,'Enabled','035145886473','CEMECO',0,1),(14,'Gianella','Maldonado',16,'Enabled','0351156795626','Nancy (madre)',0,1),(15,'Ricardo','Noriega',17,'Disabled','','',0,1),(16,'Alfonso','Sana',17,'Enabled','00551150817396','Instituto Canguru',0,1),(17,'Christian','Guanco',18,'Enabled','03884261758','Gustavo Poccioni (Drogueria)',0,1),(18,'Santino','Ocampo',19,'Enabled','0372215700656 / 15715560','Mariana (madre)',0,1),(19,'Arantxa','Sola',15,'Enabled','0358154298509','Paola (madre)',0,1),(20,'No','I',1,'Disabled','','',0,1),(21,'Sin','Identificar',17,'Enabled','','',0,1),(22,'Rosario','Zelaya',23,'Enabled','0381154441747','Queca',0,1),(23,'Gabriel','Marinho',17,'Enabled','00551150817396','Instituto Canguru',0,1),(24,'Mateo','Elizalde',17,'Enabled','48160772 / 1541499555','Rafael (padre) / Magda (madre)',0,1),(25,'Michael','Hernandez',25,'Enabled','0294415689023 / 15343832','Paula (madre)',0,1),(26,'Joaquin','Marchi',27,'Enabled','43726327','Alejandra (madre)',0,1),(27,'Helio','Segouras',17,'Enabled','00551150817396','Instituto Canguru',0,1),(28,'Catarina','Magnano',32,'Enabled','','Isabel Magnano',0,1),(29,'Matheus','Giovanella',20,'Enabled','00551150817396','Instituto Canguru',0,1),(30,'Rosaura','Lascano',34,'Enabled','','',0,1),(31,'Lautaro','Contreras',35,'Enabled','','',0,1),(32,'Micaela','Rodriguez',36,'Enabled','1556549423','Andrea (madre)',0,1),(33,'Victoria','Peralta',1,'Enabled','47985152','Maria (madre)',0,1),(34,'Micaela','Cabrera',14,'Enabled','','',0,1),(35,'Luisina','Zabala',38,'Enabled','03571470695 / 15698824','Angel (padre)',0,1),(36,'Nicolas','Molinas',19,'Enabled','03722441212','Arnaldo Claro (Biofar)',0,1),(37,'Estefania','Gimenez',39,'Enabled','0341420241','Santiago Pernigotti (Farmacia)',0,1),(38,'Busquet','Valentina',2,'Enabled','','',0,1),(39,'Paula','Laporta',45,'Enabled','4501-1288/1557108834','J.C.Laporta',0,1),(40,'test','ddd',11,'Enabled','dfdfd','',0,1);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `drug_id` int(10) unsigned NOT NULL default '0',
  `price` float NOT NULL default '0',
  `description` text NOT NULL,
  `status` enum('Enabled','Disabled') NOT NULL default 'Enabled',
  `supplier_id` int(10) unsigned NOT NULL,
  `version` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKC42BD16458E8F475` (`supplier_id`),
  KEY `FKC42BD164770C72CD` (`drug_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Buphenyl Polvo',2,0,'Bottle 250 gr','Enabled',1,NULL),(2,'Cystagon',3,0,'Cystagon 150 mg','Enabled',1,NULL),(3,'NTBC 5mg',4,0,'Bottle 60 Capsulas de 5 mg','Enabled',1,NULL),(4,'Betaina',5,0,'Betaina Polvo 98%','Enabled',1,NULL),(5,'Ambutyrate',2,0,'Ambutyrate Polvo 98%','Enabled',1,NULL),(6,'Ambutyrate Oral',2,0,'Fenilbutirato Polvo SoluciÃ³n Oral 250 mg en 1 ml','Enabled',1,NULL),(7,'NTBC 10mg',4,0,'NTBC 10mg Bottle 60 Comprimidos','Enabled',1,NULL),(8,'NTBC 2mg',4,0,'NTBC 2 mg Frasco de 60 comprimidos. ','Enabled',1,NULL),(9,'Buphenyl Tabletas',2,0,'Buphenyl Tabletas 250 comprimidos.','Enabled',1,NULL),(10,'Normosang',8,0,'Ampollas x 4','Enabled',1,NULL),(11,'Neophe',9,0,'Frasco 550 Tabletas','Enabled',1,NULL),(12,'Lacrisert 5 mg',2,0,'60 unidades','Enabled',1,NULL),(13,'Cidofovir ',12,0,'Frasco de Ampollas.','Enabled',1,NULL),(14,'Sodium Dichloroacetate',13,0,'Dicloroacetato de sodio (98%)Polvo de 10g\\\\r\\\\nDicloroacetato de sodio 50mg en 1ml Polvo Liquido\\\\r\\\\nDicloroacetato de sodio Polvo de 100g','Enabled',1,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proforma_details`
--

DROP TABLE IF EXISTS `proforma_details`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `proforma_details` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `amount` double NOT NULL,
  `description` varchar(255) NOT NULL,
  `lot` varchar(255) NOT NULL,
  `price_each` double NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `proforma_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK695F86938E8C9EED` (`proforma_id`),
  KEY `FK695F86933082FFEF` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `proforma_details`
--

LOCK TABLES `proforma_details` WRITE;
/*!40000 ALTER TABLE `proforma_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `proforma_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proformadetails`
--

DROP TABLE IF EXISTS `proformadetails`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `proformadetails` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `quantity` int(10) unsigned NOT NULL default '0',
  `price_each` decimal(10,2) NOT NULL default '0.00',
  `amount` decimal(10,2) NOT NULL default '0.00',
  `product_id` int(10) unsigned NOT NULL default '0',
  `description` text NOT NULL,
  `proforma_id` int(10) unsigned NOT NULL default '0',
  `lot` varchar(45) NOT NULL,
  `version` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK928612B28E8C9EED` (`proforma_id`),
  KEY `FK928612B23082FFEF` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=211 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `proformadetails`
--

LOCK TABLES `proformadetails` WRITE;
/*!40000 ALTER TABLE `proformadetails` DISABLE KEYS */;
INSERT INTO `proformadetails` VALUES (1,1,'0.00','0.00',1,'Buphenyl',1,'',NULL),(2,5,'0.00','0.00',1,'Buphenyl',2,'',NULL),(3,2,'0.00','0.00',3,'NTBC',3,'',NULL),(4,3,'0.00','0.00',3,'NTBC5mg',4,'',NULL),(5,1,'0.00','0.00',1,'Buphenyl',5,'',NULL),(6,10,'0.00','0.00',4,'Betaina',6,'',NULL),(7,1,'0.00','0.00',1,'Buphenyl',7,'',NULL),(8,1,'0.00','0.00',5,'Ambutyrate',8,'',NULL),(9,3,'0.00','0.00',6,'AmbutyrateOral',9,'',NULL),(10,3,'0.00','0.00',7,'NTBC10mg',10,'',NULL),(11,2,'0.00','0.00',3,'NTBC5mg',11,'',NULL),(12,2,'0.00','0.00',3,'NTBC5mg',12,'',NULL),(13,1,'0.00','0.00',8,'NTBC2mg',12,'',NULL),(14,1,'0.00','0.00',3,'NTBC5mg',13,'',NULL),(15,1,'0.00','0.00',1,'Buphenyl',14,'',NULL),(16,5,'0.00','0.00',9,'BuphenylTabletas',15,'',NULL),(17,1,'0.00','0.00',1,'BuphenylPolvo',16,'',NULL),(18,3,'0.00','0.00',3,'NTBC5mg',17,'',NULL),(19,1,'0.00','0.00',3,'NTBC5mg',18,'',NULL),(20,1,'0.00','0.00',4,'Betaina',19,'',NULL),(21,6,'0.00','0.00',8,'NTBC2mg',20,'',NULL),(22,6,'0.00','0.00',4,'Betaina',21,'',NULL),(23,3,'0.00','0.00',7,'NTBC10mg',22,'',NULL),(24,2,'0.00','0.00',3,'NTBC5mg',23,'',NULL),(25,1,'0.00','0.00',5,'Ambutyrate',24,'',NULL),(26,3,'0.00','0.00',3,'NTBC5mg',25,'',NULL),(27,1,'0.00','0.00',5,'Ambutyrate',26,'',NULL),(28,1,'0.00','0.00',1,'BuphenylPolvo',27,'',NULL),(29,1,'0.00','0.00',1,'BuphenylPolvo',28,'',NULL),(30,6,'0.00','0.00',2,'Cystagon',29,'',NULL),(31,3,'0.00','0.00',2,'Cystagon',30,'',NULL),(32,1,'0.00','0.00',1,'BuphenylPolvo',31,'',NULL),(33,1,'0.00','0.00',1,'BuphenylPolvo',32,'',NULL),(34,3,'0.00','0.00',3,'NTBC5mg',33,'',NULL),(35,1,'0.00','0.00',8,'NTBC2mg',33,'',NULL),(36,4,'0.00','0.00',3,'NTBC5mg',34,'',NULL),(37,6,'0.00','0.00',8,'NTBC2mg',34,'',NULL),(38,4,'0.00','0.00',4,'Betaina',35,'',NULL),(39,3,'0.00','0.00',7,'NTBC10mg',36,'',NULL),(40,1,'0.00','0.00',1,'BuphenylPolvo',37,'',NULL),(41,1,'0.00','0.00',1,'BuphenylPolvo',38,'',NULL),(42,5,'0.00','0.00',9,'BuphenylTabletas',39,'',NULL),(43,1,'0.00','0.00',7,'NTBC10mg',40,'',NULL),(44,1,'0.00','0.00',3,'NTBC5mg',40,'',NULL),(45,1,'0.00','0.00',8,'NTBC2mg',40,'',NULL),(46,1,'0.00','0.00',10,'Normosang',41,'',NULL),(47,6,'0.00','0.00',8,'NTBC2mg',42,'',NULL),(48,1,'0.00','0.00',5,'Ambutyrate',43,'',NULL),(49,3,'0.00','0.00',7,'NTBC10mg',44,'',NULL),(50,10,'0.00','0.00',4,'Betaina',45,'',NULL),(51,2,'0.00','0.00',6,'AmbutyrateOral',46,'',NULL),(52,1,'0.00','0.00',10,'Normosang',47,'',NULL),(53,1,'0.00','0.00',1,'BuphenylPolvo',48,'',NULL),(54,1,'0.00','0.00',1,'BuphenylPolvo',49,'',NULL),(55,2,'0.00','0.00',7,'NTBC10mg',50,'',NULL),(56,2,'0.00','0.00',3,'NTBC5mg',50,'',NULL),(57,3,'0.00','0.00',8,'NTBC2mg',50,'',NULL),(58,6,'0.00','0.00',3,'NTBC5mg',51,'',NULL),(59,10,'0.00','0.00',8,'NTBC2mg',51,'',NULL),(60,2,'0.00','0.00',3,'NTBC5mg',52,'',NULL),(61,1,'0.00','0.00',1,'BuphenylPolvo',53,'',NULL),(62,3,'0.00','0.00',7,'NTBC10mg',54,'',NULL),(63,3,'0.00','0.00',7,'NTBC10mg',55,'',NULL),(64,8,'0.00','0.00',2,'Cystagon',56,'',NULL),(65,9,'0.00','0.00',2,'Cystagon',57,'',NULL),(66,1,'0.00','0.00',8,'NTBC2mg',58,'',NULL),(67,1,'0.00','0.00',5,'Ambutyrate',59,'',NULL),(68,3,'0.00','0.00',3,'NTBC5mg',60,'',NULL),(69,1,'0.00','0.00',8,'NTBC2mg',61,'',NULL),(70,1,'0.00','0.00',8,'NTBC2mg',62,'',NULL),(71,2,'0.00','0.00',4,'Betaina',63,'',NULL),(72,1,'0.00','0.00',5,'Ambutyrate',64,'',NULL),(73,1,'0.00','0.00',1,'BuphenylPolvo',65,'',NULL),(74,1,'0.00','0.00',8,'NTBC2mg',66,'',NULL),(75,2,'0.00','0.00',4,'Betaina',67,'',NULL),(76,2,'0.00','0.00',7,'NTBC10mg',68,'',NULL),(77,4,'0.00','0.00',3,'NTBC5mg',69,'',NULL),(78,1,'0.00','0.00',11,'Neophe',70,'',NULL),(79,1,'0.00','0.00',5,'Ambutyrate',71,'',NULL),(80,1,'0.00','0.00',5,'Ambutyrate',72,'',NULL),(81,2,'0.00','0.00',5,'Ambutyrate',73,'',NULL),(82,2,'0.00','0.00',6,'Ambutyrate Oral',74,'',NULL),(83,6,'0.00','0.00',7,'NTBC10mg',75,'',NULL),(84,1,'0.00','0.00',1,'Buphenyl Polvo',76,'',NULL),(85,2,'0.00','0.00',3,'NTBC 5mg',77,'',NULL),(86,5,'0.00','0.00',3,'NTBC 5mg',78,'',NULL),(87,2,'0.00','0.00',3,'NTBC 5mg',79,'',NULL),(88,2,'0.00','0.00',7,'NTBC 10mg',80,'',NULL),(89,1,'0.00','0.00',3,'NTBC 5mg',80,'',NULL),(90,1,'0.00','0.00',8,'NTBC 2mg',80,'',NULL),(91,3,'0.00','0.00',7,'NTBC 10mg',81,'',NULL),(92,1,'0.00','0.00',3,'NTBC 5mg',82,'',NULL),(93,10,'0.00','0.00',4,'Betaina',83,'',NULL),(94,3,'0.00','0.00',7,'NTBC 10mg',84,'',NULL),(95,3,'0.00','0.00',3,'NTBC 5mg',84,'',NULL),(96,9,'0.00','0.00',8,'NTBC 2mg',84,'',NULL),(97,2,'0.00','0.00',1,'Buphenyl Polvo',85,'',NULL),(98,4,'0.00','0.00',6,'Ambutyrate Oral',86,'',NULL),(99,2,'0.00','0.00',3,'NTBC 5mg',87,'',NULL),(100,1,'0.00','0.00',8,'NTBC 2mg',87,'',NULL),(101,1,'0.00','0.00',9,'Buphenyl Tabletas',88,'',NULL),(102,5,'0.00','0.00',9,'Buphenyl Tabletas',89,'',NULL),(103,2,'0.00','0.00',6,'Ambutyrate Oral',90,'',NULL),(104,2,'0.00','0.00',7,'NTBC 10mg',91,'',NULL),(105,2,'0.00','0.00',3,'NTBC 5mg',91,'',NULL),(106,3,'0.00','0.00',8,'NTBC 2mg',91,'',NULL),(107,1,'0.00','0.00',5,'Ambutyrate',92,'',NULL),(108,2,'0.00','0.00',4,'Betaina',93,'',NULL),(109,6,'0.00','0.00',7,'NTBC 10mg',94,'',NULL),(110,5,'0.00','0.00',3,'NTBC 5mg',95,'',NULL),(111,2,'0.00','0.00',1,'Buphenyl Polvo',96,'',NULL),(112,4,'0.00','0.00',8,'NTBC 2mg',97,'',NULL),(113,8,'0.00','0.00',7,'NTBC 10mg',97,'',NULL),(114,10,'0.00','0.00',4,'Betaina',98,'',NULL),(115,2,'0.00','0.00',4,'Betaina',99,'',NULL),(116,2,'0.00','0.00',1,'Buphenyl Polvo',100,'',NULL),(117,2,'0.00','0.00',6,'Ambutyrate Oral',101,'',NULL),(118,1,'0.00','0.00',1,'Buphenyl Polvo',102,'',NULL),(119,2,'0.00','0.00',3,'NTBC 5mg',103,'',NULL),(120,1,'0.00','0.00',3,'NTBC 5mg',104,'',NULL),(121,6,'0.00','0.00',3,'NTBC 5mg',105,'',NULL),(122,10,'0.00','0.00',8,'NTBC 2mg',105,'',NULL),(123,2,'0.00','0.00',1,'Buphenyl Polvo',106,'',NULL),(124,2,'0.00','0.00',3,'NTBC 5mg',107,'',NULL),(125,1,'0.00','0.00',8,'NTBC 2mg',107,'',NULL),(126,4,'0.00','0.00',3,'NTBC 5mg',108,'',NULL),(127,10,'0.00','0.00',4,'Betaina',109,'',NULL),(128,1,'0.00','0.00',3,'NTBC 5mg',110,'',NULL),(129,1,'0.00','0.00',8,'NTBC 2mg',111,'',NULL),(130,2,'0.00','0.00',3,'NTBC 5mg',111,'',NULL),(131,2,'0.00','0.00',7,'NTBC 10mg',112,'',NULL),(132,1,'0.00','0.00',8,'NTBC 2mg',112,'',NULL),(133,2,'0.00','0.00',6,'Ambutyrate Oral',113,'',NULL),(134,3,'0.00','0.00',2,'Cystagon',114,'',NULL),(135,8,'0.00','0.00',2,'Cystagon',115,'',NULL),(136,2,'0.00','0.00',1,'Buphenyl Polvo',116,'',NULL),(137,9,'0.00','0.00',2,'Cystagon',117,'',NULL),(138,1,'0.00','0.00',5,'Ambutyrate',118,'',NULL),(139,1,'0.00','0.00',1,'Buphenyl Polvo',119,'',NULL),(140,5,'0.00','0.00',9,'Buphenyl Tabletas',120,'',NULL),(141,6,'0.00','0.00',9,'Buphenyl Tabletas',121,'',NULL),(142,12,'0.00','0.00',5,'Ambutyrate',122,'',NULL),(143,2,'0.00','0.00',1,'Buphenyl Polvo',123,'',NULL),(144,1,'0.00','0.00',10,'Normosang',124,'',NULL),(145,2,'0.00','0.00',5,'Ambutyrate',125,'',NULL),(146,2,'0.00','0.00',4,'Betaina',126,'',NULL),(147,1,'0.00','0.00',1,'Buphenyl Polvo',127,'',NULL),(148,1,'0.00','0.00',3,'NTBC 5mg',128,'',NULL),(149,2,'0.00','0.00',8,'NTBC 2mg',128,'',NULL),(150,8,'0.00','0.00',3,'NTBC 5mg',129,'',NULL),(151,1,'0.00','0.00',5,'Ambutyrate',130,'',NULL),(152,3,'0.00','0.00',7,'NTBC 10mg',131,'',NULL),(153,2,'0.00','0.00',6,'Ambutyrate Oral',132,'',NULL),(154,6,'0.00','0.00',2,'Cystagon',133,'',NULL),(155,2,'0.00','0.00',3,'NTBC 5mg',134,'',NULL),(156,1,'0.00','0.00',8,'NTBC 2mg',134,'',NULL),(157,8,'0.00','0.00',3,'NTBC 5mg',135,'',NULL),(158,2,'0.00','0.00',8,'NTBC 2mg',136,'',NULL),(159,2,'0.00','0.00',8,'NTBC 2mg',137,'',NULL),(160,2,'0.00','0.00',5,'Ambutyrate',138,'',NULL),(161,2,'0.00','0.00',5,'Ambutyrate',139,'',NULL),(162,6,'0.00','0.00',9,'Buphenyl Tabletas',140,'',NULL),(163,2,'0.00','0.00',3,'NTBC 5mg',141,'',NULL),(164,1,'0.00','0.00',8,'NTBC 2mg',141,'',NULL),(165,2,'0.00','0.00',3,'NTBC 5mg',142,'',NULL),(166,1,'0.00','0.00',7,'NTBC 10mg',143,'',NULL),(167,1,'0.00','0.00',3,'NTBC 5mg',143,'',NULL),(168,1,'0.00','0.00',8,'NTBC 2mg',143,'',NULL),(169,2,'0.00','0.00',12,'Lacrisert 5 mg',144,'',NULL),(170,1,'0.00','0.00',13,'Cidofovir ',144,'',NULL),(171,1,'0.00','0.00',7,'NTBC 10mg',145,'',NULL),(172,1,'0.00','0.00',3,'NTBC 5mg',145,'',NULL),(173,2,'0.00','0.00',6,'Ambutyrate Oral',146,'',NULL),(174,2,'0.00','0.00',3,'NTBC 5mg',147,'',NULL),(175,2,'0.00','0.00',5,'Ambutyrate',148,'',NULL),(176,2,'0.00','0.00',5,'Ambutyrate',149,'',NULL),(177,1,'0.00','0.00',5,'Ambutyrate',150,'',NULL),(178,2,'0.00','0.00',6,'Ambutyrate Oral',151,'',NULL),(179,2,'0.00','0.00',3,'NTBC 5mg',152,'',NULL),(180,4,'0.00','0.00',6,'Ambutyrate Oral',153,'',NULL),(181,1,'0.00','0.00',1,'Buphenyl Polvo',154,'',NULL),(182,2,'0.00','0.00',5,'Ambutyrate',155,'',NULL),(183,3,'0.00','0.00',8,'NTBC 2mg',156,'',NULL),(184,3,'0.00','0.00',8,'NTBC 2mg',157,'',NULL),(185,3,'0.00','0.00',8,'NTBC 2mg',158,'',NULL),(186,3,'0.00','0.00',8,'NTBC 2mg',159,'',NULL),(187,3,'0.00','0.00',8,'NTBC 2mg',160,'',NULL),(188,2,'0.00','0.00',5,'Ambutyrate',161,'',NULL),(189,6,'0.00','0.00',9,'Buphenyl Tabletas',162,'',NULL),(190,1,'0.00','0.00',8,'NTBC 2mg',163,'',NULL),(191,2,'0.00','0.00',3,'NTBC 5mg',163,'',NULL),(192,2,'0.00','0.00',1,'Buphenyl Polvo',164,'',NULL),(193,1,'0.00','0.00',8,'NTBC 2mg',165,'',NULL),(194,2,'0.00','0.00',3,'NTBC 5mg',165,'',NULL),(195,2,'0.00','0.00',4,'Betaina',166,'',NULL),(196,2,'0.00','0.00',6,'Ambutyrate Oral',167,'',NULL),(197,3,'0.00','0.00',3,'NTBC 5mg',168,'no',NULL),(198,2,'0.00','0.00',3,'NTBC 5mg',169,'',NULL),(199,2,'0.00','0.00',3,'NTBC 5mg',170,'',NULL),(200,10,'0.00','0.00',4,'Betaina',171,'',NULL),(201,2,'0.00','0.00',6,'Ambutyrate Oral',172,'',NULL),(202,1,'0.00','0.00',1,'Buphenyl Polvo',173,'',NULL),(203,5,'0.00','0.00',3,'NTBC 5mg',174,'',NULL),(204,1,'0.00','0.00',5,'Ambutyrate',175,'',NULL),(205,4,'0.00','0.00',14,'Sodium Dichloroacetate',176,'',NULL),(206,2,'0.00','0.00',4,'Betaina',177,'B052644',NULL),(207,2,'0.00','0.00',7,'NTBC 10mg',178,'',NULL),(208,4,'0.00','0.00',8,'NTBC 2mg',178,'',NULL),(209,2,'0.00','0.00',3,'NTBC 5mg',178,'',NULL),(210,1,'0.00','0.00',1,'Buphenyl Polvo',179,'',NULL);
/*!40000 ALTER TABLE `proformadetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proformas`
--

DROP TABLE IF EXISTS `proformas`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `proformas` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL default '0',
  `discount` int(10) unsigned NOT NULL default '0',
  `courier` decimal(10,2) NOT NULL default '0.00',
  `total` decimal(10,2) NOT NULL default '0.00',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `patient_id` int(10) unsigned NOT NULL default '0',
  `patient_description` text NOT NULL,
  `client_id` int(10) unsigned NOT NULL default '0',
  `client_description` text NOT NULL,
  `status` enum('Creada','Aprobada','Rechazada','Anulada') NOT NULL default 'Creada',
  `version` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKC46A34E3FC1E8BF7` (`user_id`),
  KEY `FKC46A34E3250603F7` (`client_id`),
  KEY `FKC46A34E3D2A7C6C3` (`patient_id`)
) ENGINE=MyISAM AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `proformas`
--

LOCK TABLES `proformas` WRITE;
/*!40000 ALTER TABLE `proformas` DISABLE KEYS */;
INSERT INTO `proformas` VALUES (1,0,0,'0.00','0.00','2008-07-15 12:00:03',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',NULL),(2,0,0,'0.00','0.00','2008-07-15 12:11:21',2,'Facundo Vallejos',2,'DroguerÃ­a Itati\nGobernador Pedro FerrÃ© 1878\n03783-430595/436225\n','Aprobada',NULL),(3,0,0,'0.00','0.00','2008-07-15 12:25:34',3,'JC Rotta',3,'DroguerÃ­a Zeus\nAvda. Cabret 1916 (Posadas)\n03752-438900\n','Aprobada',NULL),(4,0,0,'0.00','0.00','2008-07-15 12:31:20',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',NULL),(5,0,0,'0.00','0.00','2008-07-15 12:37:13',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Aprobada',NULL),(6,0,0,'0.00','0.00','2008-07-15 12:42:59',6,'Melina Mainardi',6,'NÃ©stor Mainardi\nUrquiza 225 (CÃ³rdoba)\n03562-422502\n','Aprobada',NULL),(7,0,0,'0.00','0.00','2008-07-15 12:43:43',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',NULL),(8,0,0,'0.00','0.00','2008-07-15 12:51:36',7,'Franco Viggiano',8,'Hospital FrancÃ©s\nLa Rioja 951\n4959-1500\n','Aprobada',NULL),(9,0,0,'0.00','0.00','2008-07-15 13:50:30',8,'Candela Altamira',9,'DASPU OBRA SOCIAL\nNO\nNO\n','Aprobada',NULL),(10,0,0,'0.00','0.00','2008-07-15 13:56:58',9,'VGPF VGPF',10,'Instituto ParanÃ¡\nNO\nNO\n','Creada',NULL),(11,0,0,'0.00','0.00','2008-07-15 14:01:19',3,'JC Rotta',3,'DroguerÃ­a Zeus\nAvda. Cabret 1916 (Posadas)\n03752-438900\n','Aprobada',NULL),(12,0,0,'0.00','0.00','2008-07-18 11:38:37',3,'JC Rotta',11,'DroguerÃ­a San Miguel\nSan Martin 2102 (Posadas)\n03752-431652\n','Aprobada',NULL),(13,0,0,'0.00','0.00','2008-07-18 11:49:09',10,'Ariadna Coronel',12,'Obra Social Personal de Farmacia\nConstituciÃ³n 2066\n4941-1342\n','Aprobada',NULL),(14,0,0,'0.00','0.00','2008-07-21 16:13:01',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',NULL),(15,0,10,'0.00','0.00','2008-07-21 16:35:01',11,'Marlene Guercio',13,'I.N.S.S.J.P\nPerÃº 169 5Â°A\n4344-8701\n','Aprobada',NULL),(16,0,0,'0.00','0.00','2008-07-22 11:20:07',12,'NO NO',14,'Hospital Garrahan\nCombate de los Pozos 1881\n4308-4300\n','Creada',NULL),(17,0,0,'0.00','0.00','2008-07-22 11:21:08',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',NULL),(18,0,3,'0.00','0.00','2008-07-22 11:23:26',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Creada',NULL),(19,0,0,'0.00','0.00','2008-07-22 11:32:30',13,'Natali Singh',15,'CEMECO\nCÃ³rdoba\nNO\n','Creada',NULL),(20,0,3,'0.00','0.00','2008-07-22 11:38:28',14,'Gianella Maldonado',16,'Corbiet SA\nCÃ³rdoba\nNO\n','Aprobada',NULL),(21,0,0,'0.00','0.00','2008-07-22 11:41:57',15,'Ricardo Noriega',17,'Sin Obra Social\nNO\nNO\n','Aprobada',NULL),(22,0,0,'0.00','0.00','2008-07-22 11:46:47',16,'Alfonso Sana',17,'Sin Obra Social\nNO\nNO\n','Aprobada',NULL),(23,0,0,'0.00','0.00','2008-07-22 12:24:28',3,'JC Rotta',3,'DroguerÃ­a Zeus\nAvda. Cabret 1916 (Posadas)\n03752-438900\n','Aprobada',NULL),(24,0,0,'0.00','0.00','2008-07-22 12:32:08',12,'NO NO',14,'Hospital Garrahan\nCombate de los Pozos 1881\n4308-4300\n','Creada',NULL),(25,0,0,'0.00','0.00','2008-07-23 11:44:16',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',NULL),(26,0,0,'0.00','0.00','2008-07-23 11:45:57',12,'NO NO',8,'Hospital FrancÃ©s\nLa Rioja 951\n4959-1500\n','Aprobada',NULL),(27,0,0,'0.00','0.00','2008-07-23 11:47:26',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Aprobada',NULL),(28,0,0,'0.00','0.00','2008-07-23 11:48:03',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',NULL),(29,0,0,'0.00','0.00','2008-07-23 11:52:05',17,'Christian Guanco',18,'Drogueria Pharmers SRL\nNO\nNO\n','Aprobada',NULL),(30,0,0,'0.00','0.00','2008-07-23 11:57:15',12,'NO NO',19,'Biofar\nLopez y Planes 551 (Resistencia, Chaco)\n(03722) 441212/442772\n','Aprobada',NULL),(31,0,0,'0.00','0.00','2008-07-23 12:00:22',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Aprobada',NULL),(32,0,0,'0.00','0.00','2008-07-23 12:01:25',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',NULL),(33,0,0,'0.00','0.00','2008-07-23 12:02:48',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',NULL),(34,0,0,'0.00','0.00','2008-07-23 12:05:39',18,'Santino Ocampo',19,'Biofar\nLopez y Planes 551 (Resistencia, Chaco)\n(03722) 441212/442772\n','Creada',NULL),(35,0,0,'0.00','0.00','2008-07-23 12:08:52',19,'Arantxa Sola',15,'CEMECO\nCÃ³rdoba\nNO\n','Creada',NULL),(36,0,0,'0.00','0.00','2008-07-23 12:16:17',21,'Sin Identificar',20,'Secretaria de Saude de Santa Catarina\nBrasil\nNO\n','Creada',NULL),(37,0,0,'0.00','0.00','2008-07-23 12:17:12',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',NULL),(38,0,0,'0.00','0.00','2008-07-23 12:17:56',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',NULL),(39,0,10,'0.00','0.00','2008-07-23 12:18:41',11,'Marlene Guercio',13,'I.N.S.S.J.P\nPerÃº 169 5Â°A\n4344-8701\n','Creada',NULL),(40,0,0,'0.00','0.00','2008-07-23 12:20:35',3,'JC Rotta',3,'DroguerÃ­a Zeus\nAvda. Cabret 1916 (Posadas)\n03752-438900\n','Creada',NULL),(41,0,0,'0.00','0.00','2008-07-23 12:26:35',21,'Sin Identificar',21,'Libra\nARROYO GRANDE 2832.CP 11800. Montevideo. Urug\n00598 2200 5521\n','Aprobada',NULL),(42,0,0,'0.00','0.00','2008-07-23 12:27:55',14,'Gianella Maldonado',16,'Corbiet SA\nCÃ³rdoba\nNO\n','Aprobada',NULL),(43,0,0,'0.00','0.00','2008-07-23 12:29:23',7,'Franco Viggiano',8,'Hospital FrancÃ©s\nLa Rioja 951\n4959-1500\n','Aprobada',NULL),(44,0,7,'0.00','0.00','2008-07-23 12:31:46',16,'Alfonso Sana',17,'Sin Obra Social\nNO\nNO\n','Aprobada',NULL),(45,0,0,'0.00','0.00','2008-07-23 12:35:16',6,'Melina Mainardi',22,'Smata\nCÃ³rdoba\nNO\n','Aprobada',NULL),(46,0,0,'0.00','0.00','2008-07-23 12:38:53',8,'Candela Altamira',9,'DASPU OBRA SOCIAL\nNO\nNO\n','Aprobada',NULL),(47,0,0,'0.00','0.00','2008-07-23 12:39:54',21,'Sin Identificar',21,'Libra\nARROYO GRANDE 2832.CP 11800. Montevideo. Urug\n00598 2200 5521\n','Aprobada',NULL),(48,0,0,'0.00','0.00','2008-07-23 12:42:07',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',NULL),(49,0,0,'0.00','0.00','2008-07-23 12:42:43',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Aprobada',NULL),(50,0,0,'0.00','0.00','2008-07-23 12:48:21',22,'Rosario Zelaya',23,'Instituto de PrevisiÃ³n y Seguridad Social\nTucumÃ¡n\nNO\n','Aprobada',NULL),(51,0,0,'0.00','0.00','2008-07-23 12:51:34',18,'Santino Ocampo',24,'Drogueria Mar\nChaco\n03783-478400\n','Creada',NULL),(52,0,0,'0.00','0.00','2008-07-23 13:02:46',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',NULL),(53,0,0,'0.00','0.00','2008-07-23 13:03:24',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',NULL),(54,0,3,'0.00','0.00','2008-07-23 13:07:25',21,'Sin Identificar',10,'Instituto ParanÃ¡\nNO\nNO\n','Creada',NULL),(55,0,0,'0.00','0.00','2008-07-23 13:09:13',21,'Sin Identificar',10,'Instituto ParanÃ¡\nNO\nNO\n','Aprobada',NULL),(56,0,0,'0.00','0.00','2008-07-23 13:10:03',21,'Sin Identificar',19,'Biofar\nLopez y Planes 551 (Resistencia, Chaco)\n(03722) 441212/442772\n','Creada',NULL),(57,0,0,'0.00','0.00','2008-07-23 13:10:55',21,'Sin Identificar',19,'Biofar\nLopez y Planes 551 (Resistencia, Chaco)\n(03722) 441212/442772\n','Aprobada',NULL),(58,0,0,'0.00','0.00','2008-07-23 13:14:49',10,'Ariadna Coronel',12,'Obra Social Personal de Farmacia\nConstituciÃ³n 2066\n4941-1342\n','Aprobada',NULL),(59,0,0,'0.00','0.00','2008-07-23 13:15:50',7,'Franco Viggiano',8,'Hospital FrancÃ©s\nLa Rioja 951\n4959-1500\n','Aprobada',NULL),(60,0,0,'0.00','0.00','2008-07-23 13:16:29',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',NULL),(61,0,0,'0.00','0.00','2008-07-23 13:17:57',23,'Gina Marinho',17,'Sin Obra Social\nNO\nNO\n','Aprobada',NULL),(62,0,0,'0.00','0.00','2008-07-23 13:18:59',3,'JC Rotta',11,'DroguerÃ­a San Miguel\nSan Martin 2102 (Posadas)\n03752-431652\n','Aprobada',NULL),(63,0,0,'0.00','0.00','2008-07-23 13:19:41',19,'Arantxa Sola',15,'CEMECO\nCÃ³rdoba\nNO\n','Creada',NULL),(64,0,0,'0.00','0.00','2008-07-23 13:20:45',24,'Rafael Elizalde',17,'Sin Obra Social\nNO\nNO\n','Aprobada',NULL),(65,0,0,'0.00','0.00','2008-07-23 13:21:20',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',NULL),(66,0,0,'0.00','0.00','2008-07-23 13:22:07',10,'Ariadna Coronel',12,'Obra Social Personal de Farmacia\nConstituciÃ³n 2066\n4941-1342\n','Aprobada',NULL),(67,0,0,'0.00','0.00','2008-07-23 13:24:17',25,'Michael Hernandez',25,'IOSE\nNO\nNO\n','Aprobada',NULL),(68,0,0,'0.00','0.00','2008-07-23 13:29:19',21,'Sin Identificar',26,'Instituto del niÃ±o (Ecuador)\nEcuador\nNO\n','Creada',NULL),(69,0,0,'0.00','0.00','2008-07-23 13:36:08',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',NULL),(70,0,0,'0.00','0.00','2008-07-24 14:10:51',26,'Joaquin Marchi',27,'OSPE\nRodriguez PeÃ±a 538\n4373-5740/4371/8957\n','Creada',NULL),(71,0,0,'0.00','0.00','2008-07-25 10:40:39',27,'Helio Segouras',17,'Sin Obra Social\nNO\nNO\n','Anulada',NULL),(72,0,0,'0.00','0.00','2008-07-30 12:22:02',27,'Helio Segouras',28,'Helio Segouras\nBrazil\nNO\n','Aprobada',NULL),(73,0,0,'0.00','0.00','2008-07-31 16:10:03',24,'Mateo Elizalde',29,'Rafael Elizalde\nNO\nNO\n','Rechazada',NULL),(74,0,0,'0.00','0.00','2008-08-01 11:25:59',24,'Mateo Elizalde',29,'Rafael Elizalde\nNO\nNO\n','Creada',NULL),(75,0,0,'0.00','0.00','2008-08-01 13:03:29',21,'Sin Identificar',30,'Swan Medicare\nDenmark\n+45 33 88 10 00\n','Creada',NULL),(76,0,0,'0.00','0.00','2008-08-04 12:26:45',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Aprobada',NULL),(77,0,0,'0.00','0.00','2008-08-05 14:53:25',14,'Gianella Maldonado',16,'Corbiet SA\nCÃ³rdoba\nNO\n','Rechazada',NULL),(78,0,0,'0.00','0.00','2008-08-05 14:56:25',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Creada',NULL),(79,0,4,'0.00','0.00','2008-08-08 11:53:11',14,'Gianella Maldonado',16,'Corbiet SA\nCÃ³rdoba\nNO\n','Aprobada',NULL),(80,0,0,'0.00','0.00','2008-08-11 13:11:33',16,'Alfonso Sana',31,'Cassia Sana\nBrasil\nNO\n','Rechazada',NULL),(81,0,7,'0.00','0.00','2008-08-13 17:02:26',16,'Alfonso Sana',31,'Cassia Sana\nBrasil\nNO\n','Aprobada',NULL),(82,0,0,'0.00','0.00','2008-08-19 14:11:42',10,'Ariadna Coronel',12,'Obra Social Personal de Farmacia\nConstituciÃ³n 2066\n4941-1342\n','Aprobada',NULL),(83,0,0,'0.00','0.00','2008-08-19 14:14:50',25,'Michael Hernandez',17,'Sin Obra Social\nNO\nNO\n','Creada',NULL),(84,0,0,'0.00','0.00','2008-08-19 14:17:06',18,'Santino Ocampo',19,'Biofar\nLopez y Planes 551 (Resistencia, Chaco)\n(03722) 441212/442772\n','Creada',NULL),(85,0,0,'0.00','0.00','2008-08-21 11:27:48',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',NULL),(86,0,0,'0.00','0.00','2008-08-22 11:05:20',8,'Candela Altamira',9,'DASPU OBRA SOCIAL\nNO\nNO\n','Aprobada',NULL),(87,0,0,'0.00','0.00','2008-08-22 11:07:21',3,'JC Rotta',11,'DroguerÃ­a San Miguel\nSan Martin 2102 (Posadas)\n03752-431652\n','Aprobada',NULL),(88,0,50,'0.00','0.00','2008-08-22 16:56:00',8,'Candela Altamira',19,'Biofar\nLopez y Planes 551 (Resistencia, Chaco)\n(03722) 441212/442772\n','Rechazada',NULL),(89,0,25,'0.00','0.00','2008-08-25 18:16:14',11,'Marlene Guercio',13,'I.N.S.S.J.P\nPerÃº 169 5Â°A\n4344-8701\n','Aprobada',NULL),(90,0,0,'0.00','0.00','2008-08-27 12:40:39',24,'Mateo Elizalde',29,'Rafael Elizalde\nNO\nNO\n','Aprobada',NULL),(91,0,0,'0.00','0.00','2008-08-28 11:17:29',22,'Rosario Zelaya',23,'Instituto de PrevisiÃ³n y Seguridad Social\nTucumÃ¡n\nNO\n','Aprobada',NULL),(92,0,0,'0.00','0.00','2008-08-28 12:31:17',28,'Catarina Magnano',33,'Ramiro Cabrero\nBrasil\nNO\n','Aprobada',NULL),(93,0,0,'0.00','0.00','2008-09-03 14:51:17',19,'Arantxa Sola',15,'CEMECO\nCÃ³rdoba\nNO\n','Aprobada',NULL),(94,0,10,'0.00','0.00','2008-09-09 15:51:52',29,'Matheus Giovanella',20,'Secretaria de Saude de Santa Catarina\nBrasil\nNO\n','Aprobada',NULL),(95,0,0,'0.00','0.00','2008-09-11 09:59:22',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',NULL),(96,0,0,'0.00','0.00','2008-09-12 15:12:26',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',NULL),(97,0,0,'0.00','0.00','2008-09-15 11:41:47',21,'Sin Identificar',10,'Fundo Estadual de Saude do Parana\nRua Piquiri, 170, Reboucas. Curitiba, Parana,\nNO\n','Aprobada',NULL),(98,0,0,'0.00','0.00','2008-09-16 15:10:28',6,'Melina Mainardi',22,'Smata\nCÃ³rdoba\nNO\n','Creada',NULL),(99,0,0,'0.00','0.00','2008-09-17 11:05:16',25,'Michael Hernandez',25,'IOSE\nNO\nNO\n','Creada',NULL),(100,0,0,'0.00','0.00','2008-09-17 11:59:56',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Aprobada',NULL),(101,0,0,'0.00','0.00','2008-09-22 10:38:26',24,'Mateo Elizalde',29,'Rafael Elizalde\nNO\nNO\n','Aprobada',NULL),(102,0,0,'0.00','0.00','2008-09-23 14:41:44',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Aprobada',NULL),(103,0,0,'0.00','0.00','2008-09-25 11:11:29',14,'Gianella Maldonado',16,'Corbiet SA\nCÃ³rdoba\nNO\n','Creada',NULL),(104,0,0,'0.00','0.00','2008-09-25 15:20:50',30,'Rosaura Lascano',34,'ProtecciÃ³n Social de Ecuador\nEcuador\nNO\n','Creada',NULL),(105,0,0,'0.00','0.00','2008-09-26 12:57:59',18,'Santino Ocampo',24,'Drogueria Mar\nChaco\n03783-478400\n','Aprobada',NULL),(106,0,0,'0.00','0.00','2008-10-03 11:44:37',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',NULL),(107,0,0,'0.00','0.00','2008-10-03 14:55:13',3,'JC Rotta',11,'DroguerÃ­a San Miguel\nSan Martin 2102 (Posadas)\n03752-431652\n','Aprobada',NULL),(108,0,0,'0.00','0.00','2008-10-03 15:25:04',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',NULL),(109,0,0,'0.00','0.00','2008-10-03 15:41:24',25,'Michael Hernandez',17,'Sin Obra Social\nNO\nNO\n','Aprobada',NULL),(110,0,0,'0.00','0.00','2008-10-03 15:45:32',10,'Ariadna Coronel',12,'Obra Social Personal de Farmacia\nConstituciÃ³n 2066\n4941-1342\n','Aprobada',NULL),(111,0,0,'0.00','0.00','2008-10-09 10:34:03',3,'JC Rotta',11,'DroguerÃ­a San Miguel\nSan Martin 2102 (Posadas)\n03752-431652\n','Creada',NULL),(112,0,0,'0.00','0.00','2008-10-09 12:45:47',16,'Alfonso Sana',31,'Cassia Sana\nBrasil\nNO\n','Creada',NULL),(113,0,0,'0.00','0.00','2008-10-09 15:07:17',24,'Mateo Elizalde',29,'Rafael Elizalde\nNO\nNO\n','Creada',NULL),(114,0,0,'0.00','0.00','2008-10-10 16:20:47',31,'Lautaro Contreras',35,'CompaÃ±ia de Servicios FarmacÃ©uticos\nNO\nNO\nNO','Aprobada',NULL),(115,0,0,'0.00','0.00','2008-10-10 16:45:41',21,'Sin Identificar',19,'Biofar\nLopez y Planes 551 (Resistencia, Chaco)\n(03722) 441212/442772\n','Aprobada',NULL),(116,0,0,'0.00','0.00','2008-10-15 13:18:36',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Creada',NULL),(117,0,0,'0.00','0.00','2008-10-20 13:00:28',17,'Christian Guanco',18,'Drogueria Pharmers SRL\nNO\nNO\n','Creada',NULL),(118,0,0,'0.00','0.00','2008-10-21 11:46:31',32,'Micaela Rodriguez',36,'Hospital Italiano\nGascÃ³n 450\n4959-0200\nGabriela.Fraschetti@hospitalitaliano.org.ar','Creada',NULL),(119,0,0,'0.00','0.00','2008-10-24 09:12:28',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Creada',NULL),(120,0,25,'0.00','0.00','2008-10-24 11:51:51',11,'Marlene Guercio',13,'I.N.S.S.J.P\nPerÃº 169 5Â°A\n4344-8701\n','Rechazada',NULL),(121,0,25,'0.00','0.00','2008-10-24 12:03:00',11,'Marlene Guercio',13,'I.N.S.S.J.P\nPerÃº 169 5Â°A\n4344-8701\n','Creada',NULL),(122,0,0,'0.00','0.00','2008-10-24 14:26:41',32,'Micaela Rodriguez',36,'Hospital Italiano\nGascÃ³n 450\n4959-0200\nGabriela.Fraschetti@hospitalitaliano.org.ar','Creada',NULL),(123,0,0,'0.00','0.00','2008-10-28 14:18:05',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Creada',NULL),(124,0,0,'0.00','0.00','2008-10-28 14:41:09',21,'Sin Identificar',21,'Libra\nARROYO GRANDE 2832.CP 11800. Montevideo. Urug\n00598 2200 5521\n','Creada',NULL),(125,0,0,'0.00','0.00','2008-10-30 11:41:22',33,'Victoria Peralta',37,'Peralta\nDiagonal TucumÃ¡n 1193.Martnez\n4798-5152/154404-9480\n','Creada',NULL),(126,0,0,'0.00','0.00','2008-11-03 09:19:46',19,'Arantxa Sola',15,'CEMECO\nCÃ³rdoba\nNO\n','Creada',NULL),(127,0,0,'0.00','0.00','2008-11-04 11:46:07',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Creada',NULL),(128,0,0,'0.00','0.00','2008-11-04 15:27:42',34,'Micaela Cabrera',14,'Hospital Garrahan\nCombate de los Pozos 1881\n4308-4300\n','Creada',NULL),(129,0,0,'0.00','0.00','2008-11-04 15:48:34',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Creada',NULL),(130,0,0,'0.00','0.00','2008-11-05 11:23:13',35,'Luisina Zabala',38,'OSPECOR\nNO\nNO\nNO','Creada',NULL),(131,0,32,'0.00','0.00','2008-11-05 11:55:26',16,'Alfonso Sana',31,'Cassia Sana\nBrasil\nNO\n','Creada',NULL),(132,0,0,'0.00','0.00','2008-11-07 11:07:27',24,'Mateo Elizalde',29,'Rafael Elizalde\nNO\nNO\n','Creada',NULL),(133,0,0,'0.00','0.00','2008-11-07 11:54:35',36,'Nicolas Molinas',19,'Biofar\nLopez y Planes 551 (Resistencia, Chaco)\n(03722) 441212/442772\n','Creada',NULL),(134,0,0,'0.00','0.00','2008-11-10 08:45:40',3,'JC Rotta',11,'DroguerÃ­a San Miguel\nSan Martin 2102 (Posadas)\n03752-431652\n','Rechazada',NULL),(135,0,0,'0.00','0.00','2008-11-10 08:49:28',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Creada',NULL),(136,0,0,'0.00','0.00','2008-11-13 16:08:35',23,'Gabriel Marinho',17,'Sin Obra Social\nNO\nNO\n','Creada',NULL),(137,0,0,'0.00','0.00','2008-11-13 16:14:23',23,'Gabriel Marinho',40,'Gina Marinho\nBrasil\nNO\nNO','Creada',NULL),(138,0,0,'0.00','0.00','2008-11-14 11:02:57',37,'estefania gimenez',39,'Instituto Dorrego\n3 de febrero 748.Rosario\n(0341)4202411\nfarmacia@institutodorrego.com.ar','Rechazada',NULL),(139,0,0,'0.00','0.00','2008-11-18 12:23:43',27,'Helio Segouras',28,'Helio Segouras\nBrazil\nNO\n','Creada',NULL),(140,0,25,'0.00','0.00','2008-11-18 14:30:23',11,'Marlene Guercio',13,'I.N.S.S.J.P\nPerÃº 169 5Â°A\n4344-8701\n','Creada',NULL),(141,0,0,'0.00','0.00','2008-11-19 11:39:12',3,'JC Rotta',41,'Alfonso RamÃ³n DarÃ­o\nChaco\nno\nno','Creada',NULL),(142,0,0,'0.00','0.00','2008-11-20 15:33:11',14,'Gianella Maldonado',36,'Hospital Italiano\nGascÃ³n 450\n4959-0200\nGabriela.Fraschetti@hospitalitaliano.org.ar','Rechazada',NULL),(143,0,0,'0.00','0.00','2008-11-21 15:19:58',21,'Sin Identificar',42,'Consulado Paraguay\nno\nno\niralabernal@hotmail.com','Creada',NULL),(144,0,0,'0.00','0.00','2008-11-24 10:25:09',21,'Sin Identificar',25,'IOSE\nNO\nNO\n','Creada',NULL),(145,0,0,'0.00','0.00','2008-11-24 10:31:47',21,'Sin Identificar',43,'SES\nBrasil\n(51) 3288-5982\nceres@saude.rs.gov.br','Creada',NULL),(146,0,0,'0.00','0.00','2008-11-25 12:22:03',37,'Estefania Gimenez',39,'Instituto Dorrego\n3 de febrero 748.Rosario\n(0341)4202411\nfarmacia@institutodorrego.com.ar','Creada',NULL),(147,0,0,'0.00','0.00','2008-11-26 10:54:24',14,'Gianella Maldonado',16,'Corbiet SA\nCÃ³rdoba\nNO\n','Creada',NULL),(148,0,0,'0.00','0.00','2008-12-02 10:56:16',8,'Candela Altamira',41,'Alfonso RamÃ³n DarÃ­o\nChaco\nno\nno','Rechazada',NULL),(149,0,0,'0.00','0.00','2008-12-02 10:57:20',28,'Catarina Magnano',32,'Isabel Magnano\nBrasil\nNO\n','Creada',NULL),(150,0,0,'0.00','0.00','2008-12-02 12:23:14',33,'Victoria Peralta',37,'Peralta\nDiagonal TucumÃ¡n 1193.Martnez\n4798-5152/154404-9480\n','Creada',NULL),(151,0,0,'0.00','0.00','2008-12-03 09:43:51',24,'Mateo Elizalde',29,'Rafael Elizalde\nNO\nNO\n','Creada',NULL),(152,0,0,'0.00','0.00','2008-12-03 14:45:34',30,'Rosaura Lascano',34,'ProtecciÃ³n Social de Ecuador\nEcuador\nNO\n','Creada',NULL),(153,0,0,'0.00','0.00','2008-12-10 11:51:34',8,'Candela Altamira',9,'DASPU OBRA SOCIAL\nNO\nNO\n','Creada',NULL),(154,0,0,'0.00','0.00','2008-12-10 12:04:22',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Creada',NULL),(155,0,0,'0.00','0.00','2008-12-16 08:50:08',35,'Luisina Zabala',38,'OSPECOR\nNO\nNO\nNO','Creada',NULL),(156,0,0,'0.00','0.00','2008-12-17 11:50:39',23,'Gabriel Marinho',40,'Gina Marinho\nBrasil\nNO\nNO','Anulada',NULL),(157,0,0,'0.00','0.00','2008-12-17 11:52:20',23,'Gabriel Marinho',40,'Gina Marinho\nBrasil\nNO\nNO','Rechazada',NULL),(158,0,0,'0.00','0.00','2008-12-17 11:52:20',23,'Gabriel Marinho',40,'Gina Marinho\nBrasil\nNO\nNO','Rechazada',NULL),(159,0,0,'0.00','0.00','2008-12-17 11:52:20',23,'Gabriel Marinho',40,'Gina Marinho\nBrasil\nNO\nNO','Rechazada',NULL),(160,0,0,'0.00','0.00','2008-12-17 11:53:21',23,'Gabriel Marinho',40,'Gina Marinho\nBrasil\nNO\nNO','Creada',NULL),(161,0,0,'0.00','0.00','2008-12-17 11:58:30',33,'Victoria Peralta',37,'Peralta\nDiagonal TucumÃ¡n 1193.Martnez\n4798-5152/154404-9480\n','Creada',NULL),(162,0,25,'0.00','0.00','2008-12-17 14:13:36',11,'Marlene Guercio',13,'I.N.S.S.J.P\nPerÃº 169 5Â°A\n4344-8701\n','Creada',NULL),(163,0,0,'0.00','0.00','2008-12-18 10:49:16',3,'JC Rotta',11,'DroguerÃ­a San Miguel\nSan Martin 2102 (Posadas)\n03752-431652\n','Rechazada',NULL),(164,0,0,'0.00','0.00','2008-12-18 15:08:23',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',NULL),(165,0,0,'0.00','0.00','2008-12-19 09:42:29',3,'JC Rotta',41,'Alfonso RamÃ³n DarÃ­o\nChaco\nno\nno','Creada',NULL),(166,0,0,'0.00','0.00','2008-12-19 10:19:31',25,'Michael Hernandez',25,'IOSE\nNO\nNO\n','Creada',NULL),(167,0,0,'0.00','0.00','2008-12-22 14:50:24',37,'Estefania Gimenez',39,'Instituto Dorrego\n3 de febrero 748.Rosario\n(0341)4202411\nfarmacia@institutodorrego.com.ar','Creada',NULL),(168,0,0,'0.00','0.00','2008-12-23 12:08:14',34,'Micaela Cabrera',44,'Ministerio de Desarrollo Social\nno\n4121-4604/4121-4611\nno','Creada',NULL),(169,0,0,'0.00','0.00','2008-12-29 13:24:54',14,'Gianella Maldonado',16,'Corbiet SA\nCÃ³rdoba\nNO\n','Rechazada',NULL),(170,0,11,'0.00','0.00','2008-12-29 13:28:01',14,'Gianella Maldonado',16,'Corbiet SA\nCÃ³rdoba\nNO\n','Creada',NULL),(171,0,0,'0.00','0.00','2009-01-05 11:51:53',6,'Melina Mainardi',22,'Smata\nCÃ³rdoba\nNO\n','Creada',NULL),(172,0,0,'0.00','0.00','2009-01-05 11:55:05',24,'Mateo Elizalde',29,'Rafael Elizalde\nNO\nNO\n','Creada',NULL),(173,0,0,'0.00','0.00','2009-01-12 08:38:14',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',NULL),(174,0,0,'0.00','0.00','2009-01-12 08:41:16',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Creada',NULL),(175,0,0,'0.00','0.00','2009-01-14 09:43:03',35,'Luisina Zabala',38,'OSPECOR\nNO\nNO\ngralbard@yahoo.com.ar','Creada',NULL),(176,0,0,'0.00','0.00','2009-01-15 16:00:56',39,'Paula Laporta',45,'Galeno \nno\nno\nno','Aprobada',NULL),(177,0,0,'0.00','0.00','2009-01-21 09:23:55',19,'Arantxa Sola',15,'CEMECO\nCÃ³rdoba\nNO\n','Creada',NULL),(178,0,0,'0.00','0.00','2009-01-22 09:55:46',22,'Rosario Zelaya',23,'Instituto de PrevisiÃ³n y Seguridad Social\nTucumÃ¡n\nNO\n','Creada',NULL),(179,0,0,'0.00','0.00','2009-01-23 11:50:21',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Creada',NULL);
/*!40000 ALTER TABLE `proformas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_invoices`
--

DROP TABLE IF EXISTS `purchase_invoices`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `purchase_invoices` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `purchase_id` int(10) unsigned NOT NULL default '0',
  `invoice_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `purchase_invoices`
--

LOCK TABLES `purchase_invoices` WRITE;
/*!40000 ALTER TABLE `purchase_invoices` DISABLE KEYS */;
INSERT INTO `purchase_invoices` VALUES (53,81,82),(2,2,6),(3,5,12),(4,9,22),(5,10,18),(6,11,20),(7,12,30),(8,13,21),(9,15,43),(10,16,47),(11,19,34),(12,20,57),(13,21,36),(14,22,45),(15,24,58),(16,25,56),(17,26,13),(18,27,54),(19,28,51),(20,29,64),(21,30,66),(22,32,69),(23,33,62),(24,34,71),(25,35,78),(26,36,7),(27,37,9),(28,38,16),(29,39,15),(30,39,24),(31,40,25),(32,41,28),(33,41,29),(34,42,67),(35,43,31),(36,43,32),(37,44,40),(38,44,41),(39,45,63),(40,45,65),(41,46,79),(51,82,86),(43,48,4),(44,49,83),(45,50,26),(46,51,33),(47,52,27),(48,53,39),(49,54,84);
/*!40000 ALTER TABLE `purchase_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `purchases` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `amount` decimal(10,2) NOT NULL default '0.00',
  `date` date NOT NULL default '0000-00-00',
  `expire_date` date NOT NULL default '0000-00-00',
  `supplier_id` int(10) unsigned NOT NULL default '0',
  `code` varchar(45) NOT NULL default '',
  `status` enum('Paid','Pending','Free') NOT NULL default 'Pending',
  `version` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK95379B9258E8F475` (`supplier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,'0.00','2008-02-06','2008-05-06',1,'1485','Paid',NULL),(2,'0.00','2008-02-06','2008-05-06',1,'1486','Paid',NULL),(3,'0.00','2008-02-06','2008-05-06',1,'1501','Free',NULL),(4,'0.00','2008-02-08','2008-05-08',1,'1512','Free',NULL),(5,'0.00','2008-02-08','2008-05-08',1,'1513','Paid',NULL),(6,'0.00','2008-04-12','2008-07-12',1,'1505','Paid',NULL),(7,'0.00','2008-02-22','2008-05-22',1,'1515','Paid',NULL),(8,'0.00','2008-02-28','2008-05-28',1,'1519','Free',NULL),(9,'0.00','2008-03-06','2008-06-06',1,'1549','Paid',NULL),(10,'0.00','2008-03-06','2008-06-06',1,'1550','Paid',NULL),(11,'0.00','2008-03-06','2008-06-06',1,'1551','Paid',NULL),(12,'0.00','2008-04-04','2008-07-04',1,'1580','Paid',NULL),(13,'0.00','2008-04-11','2008-07-11',1,'1581','Paid',NULL),(14,'0.00','2008-04-21','2008-07-21',1,'1587','Free',NULL),(15,'0.00','2008-05-13','2008-08-13',1,'1622','Paid',NULL),(16,'0.00','2008-05-13','2008-08-13',1,'1624','Paid',NULL),(17,'0.00','2008-05-13','2008-08-13',1,'1626','Free',NULL),(18,'0.00','2008-05-23','2008-08-23',1,'1628','Paid',NULL),(19,'0.00','2008-06-05','2008-09-05',1,'1660','Paid',NULL),(20,'0.00','2008-06-18','2008-09-18',1,'1661','Paid',NULL),(21,'0.00','2008-06-11','2008-09-11',1,'1662','Paid',NULL),(22,'0.00','2008-06-12','2008-09-12',1,'1663','Paid',NULL),(23,'0.00','2008-06-25','2008-09-25',1,'1671','Free',NULL),(24,'0.00','2008-06-30','2008-09-30',1,'1672','Paid',NULL),(25,'0.00','2008-07-25','2008-10-25',1,'1690','Paid',NULL),(26,'0.00','2008-07-25','2008-10-25',1,'1691','Paid',NULL),(27,'0.00','2008-07-28','2008-10-28',1,'1692','Paid',NULL),(28,'0.00','2008-07-29','2008-10-29',1,'1693','Paid',NULL),(29,'0.00','2008-08-15','2008-11-15',1,'1725','Pending',NULL),(30,'0.00','2008-08-19','2008-08-19',1,'1727','Pending',NULL),(31,'0.00','2008-08-25','2008-11-25',1,'1733','Pending',NULL),(32,'0.00','2008-08-26','2008-11-26',1,'1734','Pending',NULL),(33,'0.00','2008-09-08','2008-09-08',1,'1745','Pending',NULL),(34,'0.00','2008-09-08','2008-12-08',1,'1749','Pending',NULL),(35,'0.00','2008-09-08','2008-12-08',1,'1749','Pending',NULL),(36,'0.00','2008-01-08','2008-04-08',2,'90000133','Paid',NULL),(37,'0.00','2008-01-30','2008-04-30',1,'90001850','Paid',NULL),(38,'0.00','2008-02-11','2008-05-11',2,'90002522','Paid',NULL),(39,'0.00','2008-02-26','2008-05-26',2,'90003858','Paid',NULL),(40,'0.00','2008-03-19','2008-06-19',2,'2630','Paid',NULL),(41,'0.00','2008-04-01','2008-07-01',2,'90006734','Paid',NULL),(42,'0.00','2008-05-13','2008-08-13',2,'90011184','Paid',NULL),(43,'0.00','2008-06-17','2008-09-17',2,'90014537','Paid',NULL),(44,'0.00','2008-06-24','2008-09-24',2,'90015099','Pending',NULL),(45,'0.00','2008-08-29','2008-11-29',2,'90021058','Pending',NULL),(46,'0.00','2008-09-10','2008-12-10',2,'90022033','Pending',NULL),(47,'0.00','2008-09-11','2008-12-11',2,'90022059','Paid',NULL),(48,'0.00','2008-01-14','2008-03-14',3,'80153','Paid',NULL),(49,'0.00','2008-02-12','2008-05-12',3,'80449','Paid',NULL),(50,'0.00','2008-04-14','2008-07-14',3,'81124','Paid',NULL),(51,'0.00','2008-04-28','2008-07-28',3,'81285','Paid',NULL),(52,'0.00','2008-05-13','2008-08-13',3,'81420','Paid',NULL),(53,'0.00','2008-05-26','2008-08-26',3,'81573','Paid',NULL),(54,'0.00','2008-06-27','2008-09-27',3,'81929','Pending',NULL),(55,'0.00','2008-11-04','2009-02-04',1,'1801','Pending',NULL),(56,'0.00','2008-11-17','2009-02-17',1,'1821','Pending',NULL),(57,'0.00','2009-11-19','2009-02-11',3,'1822','Free',NULL),(58,'0.00','2009-12-11','2009-03-12',1,'1826','Pending',NULL),(59,'0.00','2009-11-27','2009-02-27',1,'1828','Pending',NULL),(60,'0.00','2009-11-27','2009-02-27',1,'1829','Pending',NULL),(61,'0.00','2009-11-20','2009-02-20',1,'1836','Free',NULL),(62,'0.00','2009-11-20','2009-02-20',1,'1837','Pending',NULL),(63,'0.00','2008-11-20','2009-02-20',1,'1838','Pending',NULL),(64,'0.00','2008-11-11','2009-02-11',1,'1846','Pending',NULL),(65,'0.00','2008-12-18','2009-03-18',1,'1847','Pending',NULL),(66,'0.00','2008-12-24','2009-02-24',1,'1849','Pending',NULL),(67,'0.00','2008-11-03','2009-02-03',4,'76588','Pending',NULL),(68,'0.00','2008-03-11','2009-03-11',4,'76591','Pending',NULL),(69,'0.00','2008-11-12','2009-03-12',4,'77015','Pending',NULL),(70,'0.00','2009-11-03','2009-02-03',4,'76590','Pending',NULL),(71,'0.00','2009-03-11','2009-02-11',4,'76591','Pending',NULL),(72,'0.00','2009-11-12','2009-02-02',3,'77011','Pending',NULL),(73,'0.00','2008-11-12','2009-02-12',4,'77011','Pending',NULL),(74,'0.00','2008-11-12','2009-02-12',4,'77015','Pending',NULL),(75,'0.00','2008-12-02','2009-03-02',4,'78113','Pending',NULL),(76,'0.00','2008-12-10','2009-02-10',4,'78441','Pending',NULL),(77,'0.00','2008-12-02','2009-03-02',4,'78442','Pending',NULL),(78,'0.00','2008-12-17','2009-03-17',4,'78666','Pending',NULL),(79,'0.00','2008-12-17','2009-03-17',4,'78667','Pending',NULL),(80,'0.00','2009-01-23','2009-04-23',4,'80212','Pending',NULL),(81,'0.00','2008-01-23','2008-04-23',2,'802122','Pending',NULL),(82,'0.00','2009-02-02','2009-02-02',3,'90034145','Pending',NULL);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `telephone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  `version` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'RDT','','','',NULL),(2,'UCYCLYD','','','',NULL),(3,'ORPHAN','','','',NULL),(4,'Special Products','00441483736950/Fax004411483721926','Gary.Hurley@SpecialProducts.biz','Albert Chan',NULL),(5,'NO EXISTE','','','',NULL);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL default '',
  `password` varchar(45) NOT NULL default '',
  `email` varchar(45) NOT NULL default '',
  `version` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ivan','ivan','igrosny@gmail.com',0),(2,'edu','edu','eduardo@gmail.com',0);
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

-- Dump completed on 2009-07-12 22:45:22
