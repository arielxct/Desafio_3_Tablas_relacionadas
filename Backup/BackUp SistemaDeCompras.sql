-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: sistemadecompras
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `dni` varchar(20) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellidos` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('10325452','Ricardo','Cardo'),('12658784','Juan','Godoy'),('17845962','Soledad','Alvariño'),('18652345','Lucia','Ocampo'),('20154785','Ana','Estevez'),('20325654','Francisco','Gomez'),('32584745','Victoria','Boaventura'),('35321569','Alex','Smith'),('5658965','Toribio','Sanchez'),('8325412','Joaquin','Peñaloza');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id` int NOT NULL,
  `concepto` varchar(20) DEFAULT NULL,
  `clientes_dni` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientes_dni` (`clientes_dni`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`clientes_dni`) REFERENCES `clientes` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,'tornillos','10325452'),(2,'alambre','12658784'),(3,'clavos','17845962'),(4,'pintura','18652345'),(5,'thiner','20154785'),(6,'lija','20325654'),(7,'tuercas','32584745'),(8,'papel','35321569'),(9,'hilo','5658965'),(10,'pegamento','8325412');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineacompras`
--

DROP TABLE IF EXISTS `lineacompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineacompras` (
  `numero` int NOT NULL,
  `compras_id` int NOT NULL,
  `producto` varchar(20) DEFAULT NULL,
  `importe` float DEFAULT NULL,
  PRIMARY KEY (`numero`,`compras_id`),
  KEY `compras_id` (`compras_id`),
  CONSTRAINT `lineacompras_ibfk_1` FOREIGN KEY (`compras_id`) REFERENCES `compras` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineacompras`
--

LOCK TABLES `lineacompras` WRITE;
/*!40000 ALTER TABLE `lineacompras` DISABLE KEYS */;
INSERT INTO `lineacompras` VALUES (100,1,'Tornillos bronce',2500),(200,2,'alambre galvanizado',3200),(300,3,'clavos comunes',1500),(400,4,'pintura al agua',15000),(500,5,'thiner 1 litro',2400),(600,6,'lija nro 2',800),(700,7,'tuercas varias',4500),(800,8,'papel de embalaje',2800),(900,9,'hilo de cañamo',6000),(1000,10,'pegamento vinilico',7800);
/*!40000 ALTER TABLE `lineacompras` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-11 18:10:49
