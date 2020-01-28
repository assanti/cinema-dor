-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: cinema
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `flm_id` int(11) NOT NULL,
  `flm_title` varchar(45) NOT NULL,
  `flm_synopsis` varchar(500) DEFAULT NULL,
  `flm_cover` varchar(45) DEFAULT NULL,
  `flm_genre` enum('FICCIO','AVENTURES','TERROR','DIBUIXOS') DEFAULT NULL,
  `flm_age_rating` int(11) NULL DEFAULT '0',
  `flm_date_release` varchar(20) DEFAULT NULL,
  `flm_premiere` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`flm_id`),
  UNIQUE KEY `flm_title_UNIQUE` (`flm_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;

INSERT INTO `film` VALUES (2,'Matrix','A compudter hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers. ',  './img/matrix.jpg' , 'FICCIO', 18, '1999-12-12', 1),
			  (3,'Forrest Gump','The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate, and other history unfold through the perspective of an Alabama man with an IQ of 75','./img/forrestgump.jpg' ,'AVENTURES', 0 , '2010-10-10', 0),
			  (4,'2001: Una odisea del espacio','After discovering a mysterious artifact buried beneath the Lunar surface, mankind sets off on a quest to find its origins with help from intelligent supercomputer H.A.L. 9000.', './img/2001.jpg', 'FICCIO', 0, '1968-12-12', 0),
			  (5,'El padrino','The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', './img/elpadrino.jpg' , 'TERROR' , 13 , '2007-12-12', 0),
			  (6,'Cadena perpetua','wo imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', './img/cadenaperpetua.jpg', 'TERROR', 13,  '1994-12-12', 1);

/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-12 10:17:48
