CREATE DATABASE  IF NOT EXISTS `formact` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `formact`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: formact
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idcategoria` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descrizione` varchar(300) DEFAULT NULL,
  `ambitoDisciplinare` varchar(100) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificazione`
--

DROP TABLE IF EXISTS `certificazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificazione` (
  `idcertificazione` int NOT NULL,
  `formatore` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tipologia` varchar(300) NOT NULL,
  `istituto` varchar(100) NOT NULL,
  `descrizione` varchar(300) DEFAULT NULL,
  `annoInizio` year NOT NULL,
  `annoFine` year NOT NULL,
  PRIMARY KEY (`idcertificazione`),
  KEY `formatore_idx` (`formatore`),
  CONSTRAINT `formatore` FOREIGN KEY (`formatore`) REFERENCES `formatore` (`idformatore`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificazione`
--

LOCK TABLES `certificazione` WRITE;
/*!40000 ALTER TABLE `certificazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilità`
--

DROP TABLE IF EXISTS `disponibilità`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilità` (
  `iddisponibilità` int NOT NULL,
  `giornoSettimana` varchar(10) NOT NULL,
  `orario` time NOT NULL,
  `stato` tinyint NOT NULL,
  `percorsoFormativo` int NOT NULL,
  PRIMARY KEY (`iddisponibilità`),
  KEY `percorso_formativo_idx` (`percorsoFormativo`),
  CONSTRAINT `percorso_formativo` FOREIGN KEY (`percorsoFormativo`) REFERENCES `percorso_formativo` (`idpercorso_formativo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilità`
--

LOCK TABLES `disponibilità` WRITE;
/*!40000 ALTER TABLE `disponibilità` DISABLE KEYS */;
/*!40000 ALTER TABLE `disponibilità` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formatore`
--

DROP TABLE IF EXISTS `formatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formatore` (
  `idformatore` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `sesso` varchar(1) DEFAULT NULL,
  `dataNascita` date NOT NULL,
  `paeseOrigine` varchar(20) DEFAULT NULL,
  `codiceFiscale` varchar(16) NOT NULL,
  `contoCorrente` varchar(27) DEFAULT NULL,
  PRIMARY KEY (`idformatore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formatore`
--

LOCK TABLES `formatore` WRITE;
/*!40000 ALTER TABLE `formatore` DISABLE KEYS */;
/*!40000 ALTER TABLE `formatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interesse`
--

DROP TABLE IF EXISTS `interesse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interesse` (
  `idinteresse` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descrizione` varchar(300) NOT NULL,
  PRIMARY KEY (`idinteresse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interesse`
--

LOCK TABLES `interesse` WRITE;
/*!40000 ALTER TABLE `interesse` DISABLE KEYS */;
INSERT INTO `interesse` VALUES (1,'programmazione Java','programmazione orientata agli oggetti, Java , C ++');
/*!40000 ALTER TABLE `interesse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iscrizione`
--

DROP TABLE IF EXISTS `iscrizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iscrizione` (
  `studente` int NOT NULL,
  `percorsFormativo` int NOT NULL,
  `giorno` varchar(45) DEFAULT NULL,
  `orario` varchar(45) DEFAULT NULL,
  `metodoPagamento` varchar(45) DEFAULT NULL,
  `dataPagamento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`studente`,`percorsFormativo`),
  KEY `percorsoFormativo_idx` (`percorsFormativo`),
  CONSTRAINT `percorsoFormativo` FOREIGN KEY (`percorsFormativo`) REFERENCES `percorso_formativo` (`idpercorso_formativo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studenteIscritto` FOREIGN KEY (`studente`) REFERENCES `studente` (`idstudente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iscrizione`
--

LOCK TABLES `iscrizione` WRITE;
/*!40000 ALTER TABLE `iscrizione` DISABLE KEYS */;
/*!40000 ALTER TABLE `iscrizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passione`
--

DROP TABLE IF EXISTS `passione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passione` (
  `studente` int NOT NULL,
  `interesse` int NOT NULL,
  PRIMARY KEY (`studente`,`interesse`),
  KEY `interesse_idx` (`interesse`),
  CONSTRAINT `interesse` FOREIGN KEY (`interesse`) REFERENCES `interesse` (`idinteresse`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studente` FOREIGN KEY (`studente`) REFERENCES `studente` (`idstudente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passione`
--

LOCK TABLES `passione` WRITE;
/*!40000 ALTER TABLE `passione` DISABLE KEYS */;
INSERT INTO `passione` VALUES (1,1);
/*!40000 ALTER TABLE `passione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `percorso_formativo`
--

DROP TABLE IF EXISTS `percorso_formativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `percorso_formativo` (
  `idpercorso_formativo` int NOT NULL,
  `formatore` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descrizione` varchar(500) NOT NULL,
  `categoria` int NOT NULL,
  `indiceContenuti` varchar(500) NOT NULL,
  `numeroLezioni` int DEFAULT NULL,
  `costo` int NOT NULL,
  PRIMARY KEY (`idpercorso_formativo`),
  KEY `formatore_idx` (`formatore`),
  KEY `categoria_idx` (`categoria`),
  CONSTRAINT `categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`idcategoria`) ON UPDATE CASCADE,
  CONSTRAINT `idFormatore` FOREIGN KEY (`formatore`) REFERENCES `formatore` (`idformatore`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `percorso_formativo`
--

LOCK TABLES `percorso_formativo` WRITE;
/*!40000 ALTER TABLE `percorso_formativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `percorso_formativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferenza`
--

DROP TABLE IF EXISTS `preferenza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferenza` (
  `idStudente` int NOT NULL,
  `idDisponibilità` int NOT NULL,
  PRIMARY KEY (`idStudente`,`idDisponibilità`),
  KEY `disponibilità_idx` (`idDisponibilità`),
  CONSTRAINT `disponibilità` FOREIGN KEY (`idDisponibilità`) REFERENCES `disponibilità` (`iddisponibilità`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idStudente` FOREIGN KEY (`idStudente`) REFERENCES `studente` (`idstudente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferenza`
--

LOCK TABLES `preferenza` WRITE;
/*!40000 ALTER TABLE `preferenza` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferenza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studente`
--

DROP TABLE IF EXISTS `studente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studente` (
  `idstudente` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `sesso` varchar(1) DEFAULT NULL,
  `dataNascita` date NOT NULL,
  `paeseOrigine` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idstudente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='tabella che rappresenta uno studente';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studente`
--

LOCK TABLES `studente` WRITE;
/*!40000 ALTER TABLE `studente` DISABLE KEYS */;
INSERT INTO `studente` VALUES (1,'fabio.pica10@gmail.com','Balocco.95','fabio','pica','M','1995-09-10','Italia'),(2,'fabio@peppo.it','123sdas','fabio2','peppo','M','3895-03-09','Italia');
/*!40000 ALTER TABLE `studente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valutazione`
--

DROP TABLE IF EXISTS `valutazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valutazione` (
  `idStudente` int NOT NULL,
  `idFormatore` int NOT NULL,
  `descrizione` varchar(300) NOT NULL,
  `data` date NOT NULL,
  `stelle` varchar(10) NOT NULL,
  PRIMARY KEY (`idStudente`,`idFormatore`),
  KEY `idFormatore_idx` (`idFormatore`),
  CONSTRAINT `formatoreValutato` FOREIGN KEY (`idFormatore`) REFERENCES `formatore` (`idformatore`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studenteValutante` FOREIGN KEY (`idStudente`) REFERENCES `studente` (`idstudente`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valutazione`
--

LOCK TABLES `valutazione` WRITE;
/*!40000 ALTER TABLE `valutazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `valutazione` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-14 16:39:00
