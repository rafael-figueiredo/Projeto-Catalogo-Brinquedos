-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: catalogobrinquedo
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `cod` int NOT NULL,
  `produto` varchar(50) NOT NULL,
  `preco` double(10,2) NOT NULL,
  `categoria` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `descricao` varchar(100) NOT NULL,
  `IdCartegoria` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Carro esportivo roda livre',39.99,NULL,'carro esportivo roda livre mxt 2.0 ',9),(3,'Cozinha cristal',78.75,NULL,'cozinha cristal - Rosa - Geladeira e fogao completa',3),(2,'Moto super Cross',35.89,NULL,'moto super Cross sxt - verde e preto',6),(4,'Carro Opala SS',37.89,NULL,'carro Opala SS - Vermelho - 2 portas',9),(5,'Kit cozinha',50.99,NULL,' kit cozinha infantil chefe kids master',3),(6,'moto racing motorcycle',44.83,NULL,'moto racing motorcycle grande - vermelha e preto',6),(7,'Boneca  Reborn',59.65,NULL,' Vem com Uma Manta e Uma Linda Roupinha',1),(8,'Helicoptero Brinquedo',188.74,NULL,'Helicoptero de controle remoto',4),(9,' Caminhao - Magic Toys',80.95,NULL,' Material plastico resistente',2),(10,'Helicoptero Policia',134.75,NULL,'Helicoptero Policia Bate e Volta',4),(11,' Caminhao Brasileiro',335.45,NULL,'vem com gasolina de verdade',2),(12,'Boneca Barbie Bailarina',75.98,NULL,'vem um tutu removivel e sapatos',1),(13,'Jogo Pinguim',68.15,NULL,'Deixe o Pinguim Cair e Perdera',5),(15,'Jogo Monta Palavras',40.58,NULL,'a crianca forma palavras',5),(14,'Retroescavadeira Case',58.75,NULL,'Maquina Retroescavadeira',8),(16,'Escavadeira Infantil ',200.75,NULL,' movimenta-se quando  a  impulsiona',8),(17,'Carrinho De Praia',67.32,NULL,'Ideal para se levar a praia',7),(18,'Colete Inflavel ',39.99,NULL,'Boia Infantil Colete Inflavel',7);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-28 18:10:24
