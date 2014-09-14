-- MySQL dump 10.13  Distrib 5.5.24, for Win64 (x86)
--
-- Host: localhost    Database: farmaciat
-- ------------------------------------------------------
-- Server version	5.5.24-log

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
-- Table structure for table `tb_cierre`
--

DROP TABLE IF EXISTS `tb_cierre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cierre` (
  `id_cierre` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_venta_inicial` int(11) DEFAULT NULL,
  `id_venta_final` int(11) DEFAULT NULL,
  `fecha_inicio_cierre` timestamp NULL DEFAULT NULL,
  `fecha_final_cierre` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_cierre`),
  KEY `id_usuario7_idx` (`id_usuario`),
  KEY `id_venta_ini7_idx` (`id_venta_inicial`),
  KEY `id_venta_fin7_idx` (`id_venta_final`),
  CONSTRAINT `id_usuario7` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_venta_fin7` FOREIGN KEY (`id_venta_final`) REFERENCES `tb_venta` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_venta_ini7` FOREIGN KEY (`id_venta_inicial`) REFERENCES `tb_venta` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cierre`
--

LOCK TABLES `tb_cierre` WRITE;
/*!40000 ALTER TABLE `tb_cierre` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cierre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `documento_cliente` varchar(20) DEFAULT NULL,
  `nombre_cliente` varchar(30) DEFAULT NULL,
  `apellidos_cliente` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (1,'44558888','JOSE','FELICIANO');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_distribuidor`
--

DROP TABLE IF EXISTS `tb_distribuidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_distribuidor` (
  `id_distribuidor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_distribuidor` varchar(45) DEFAULT NULL,
  `nombre_corto_distribuidor` varchar(10) DEFAULT NULL,
  `id_distribuidor_tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_distribuidor`),
  KEY `id_distribuidor_tipo77_idx` (`id_distribuidor_tipo`),
  CONSTRAINT `id_distribuidor_tipo77` FOREIGN KEY (`id_distribuidor_tipo`) REFERENCES `tb_distribuidor_tipo` (`id_distribuidor_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_distribuidor`
--

LOCK TABLES `tb_distribuidor` WRITE;
/*!40000 ALTER TABLE `tb_distribuidor` DISABLE KEYS */;
INSERT INTO `tb_distribuidor` VALUES (1,'LABORATORIO X','LABX',1),(2,'BOEHRINGER','BHRG',1);
/*!40000 ALTER TABLE `tb_distribuidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_distribuidor_tipo`
--

DROP TABLE IF EXISTS `tb_distribuidor_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_distribuidor_tipo` (
  `id_distribuidor_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_distribuidor_tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_distribuidor_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_distribuidor_tipo`
--

LOCK TABLES `tb_distribuidor_tipo` WRITE;
/*!40000 ALTER TABLE `tb_distribuidor_tipo` DISABLE KEYS */;
INSERT INTO `tb_distribuidor_tipo` VALUES (1,'LABORATORIO'),(2,'PROVEEDOR');
/*!40000 ALTER TABLE `tb_distribuidor_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_documento_correlativo`
--

DROP TABLE IF EXISTS `tb_documento_correlativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_documento_correlativo` (
  `id_documento_correlativo` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_documento` int(11) DEFAULT NULL,
  `id_local` int(11) DEFAULT NULL,
  `serie_documento_correlativo` int(11) NOT NULL,
  `numeracion_documento_correlativo` int(11) NOT NULL,
  PRIMARY KEY (`id_documento_correlativo`),
  KEY `id_local2_idx` (`id_local`),
  KEY `id_tipo_documento_idx` (`id_tipo_documento`),
  CONSTRAINT `id_local2` FOREIGN KEY (`id_local`) REFERENCES `tb_local` (`id_local`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_tipo_documento` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tb_tipo_documento` (`id_tipo_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_documento_correlativo`
--

LOCK TABLES `tb_documento_correlativo` WRITE;
/*!40000 ALTER TABLE `tb_documento_correlativo` DISABLE KEYS */;
INSERT INTO `tb_documento_correlativo` VALUES (1,1,1,1,1);
/*!40000 ALTER TABLE `tb_documento_correlativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_local`
--

DROP TABLE IF EXISTS `tb_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_local` (
  `id_local` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_local` varchar(50) DEFAULT NULL,
  `direccion_local` varchar(200) DEFAULT NULL,
  `telefono_local` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_local`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_local`
--

LOCK TABLES `tb_local` WRITE;
/*!40000 ALTER TABLE `tb_local` DISABLE KEYS */;
INSERT INTO `tb_local` VALUES (1,'LOCAL CENTRAL','DIRECCION','555-1111'),(2,'LOCAL SJM','direcion bla','545-9899');
/*!40000 ALTER TABLE `tb_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_producto`
--

DROP TABLE IF EXISTS `tb_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_barra_producto` varchar(45) DEFAULT NULL,
  `nombre_producto` varchar(60) DEFAULT NULL,
  `id_tipo_producto` int(11) DEFAULT NULL,
  `presentacion_producto` varchar(60) DEFAULT NULL,
  `fraccion_producto` varchar(10) DEFAULT NULL,
  `costo_producto` decimal(20,2) DEFAULT NULL,
  `precio_caja_producto` decimal(20,2) DEFAULT NULL,
  `precio_blister_producto` decimal(20,2) DEFAULT NULL,
  `precio_unidad_producto` decimal(20,2) DEFAULT NULL,
  `igv_producto` decimal(20,2) DEFAULT NULL,
  `stock_minimo_producto` decimal(20,2) DEFAULT NULL,
  `stock_maximo_producto` decimal(20,2) DEFAULT NULL,
  `id_distribuidor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_tipo_producto_idx` (`id_tipo_producto`),
  KEY `id_laboratorio5_idx` (`id_distribuidor`),
  CONSTRAINT `id_distribuidor5` FOREIGN KEY (`id_distribuidor`) REFERENCES `tb_distribuidor` (`id_distribuidor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_tipo_producto5` FOREIGN KEY (`id_tipo_producto`) REFERENCES `tb_producto_tipo` (`id_producto_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_producto`
--

LOCK TABLES `tb_producto` WRITE;
/*!40000 ALTER TABLE `tb_producto` DISABLE KEYS */;
INSERT INTO `tb_producto` VALUES (3,'703381005673','Bisolvon Adultos',1,'Frc. 120 ml','1',15.00,20.00,0.00,0.00,0.18,1000.00,50.00,2),(4,'16516','Bisolvon Ninos',1,'Frc. 120ml','1',10.00,18.00,0.00,0.00,0.18,300.00,20.00,2),(5,'515165','Ciprofluxacino',3,'Tableta','100',8.00,20.00,4.00,0.50,0.18,3000.00,1000.00,1);
/*!40000 ALTER TABLE `tb_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_producto_tipo`
--

DROP TABLE IF EXISTS `tb_producto_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_producto_tipo` (
  `id_producto_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto_tipo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_producto_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_producto_tipo`
--

LOCK TABLES `tb_producto_tipo` WRITE;
/*!40000 ALTER TABLE `tb_producto_tipo` DISABLE KEYS */;
INSERT INTO `tb_producto_tipo` VALUES (1,'CAJA'),(2,'Solucion'),(3,'Tableta');
/*!40000 ALTER TABLE `tb_producto_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_stock`
--

DROP TABLE IF EXISTS `tb_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_stock` (
  `id_stock` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad_stock` decimal(20,2) DEFAULT NULL,
  `fecha_vencimiento_stock` timestamp NULL DEFAULT NULL,
  `fecha_ingreso_stock` timestamp NULL DEFAULT NULL,
  `id_local` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_stock`),
  KEY `id_producto_idx` (`id_producto`),
  KEY `id_local_idx11` (`id_local`),
  CONSTRAINT `id_local11` FOREIGN KEY (`id_local`) REFERENCES `tb_local` (`id_local`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_producto` FOREIGN KEY (`id_producto`) REFERENCES `tb_producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_stock`
--

LOCK TABLES `tb_stock` WRITE;
/*!40000 ALTER TABLE `tb_stock` DISABLE KEYS */;
INSERT INTO `tb_stock` VALUES (1,3,100.00,NULL,NULL,1),(2,4,500.00,NULL,NULL,1),(3,3,200.00,NULL,NULL,2);
/*!40000 ALTER TABLE `tb_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_documento`
--

DROP TABLE IF EXISTS `tb_tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_documento` varchar(50) DEFAULT NULL,
  `prefijo_tipo_documento` varchar(1) NOT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_documento`
--

LOCK TABLES `tb_tipo_documento` WRITE;
/*!40000 ALTER TABLE `tb_tipo_documento` DISABLE KEYS */;
INSERT INTO `tb_tipo_documento` VALUES (1,'FACTURA','F'),(2,'BOLETA','B');
/*!40000 ALTER TABLE `tb_tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usu_usuario` varchar(13) DEFAULT NULL,
  `contrasena_usuario` varchar(45) DEFAULT NULL,
  `nombre_usuario` varchar(45) DEFAULT NULL,
  `ape1_usuario` varchar(30) DEFAULT NULL,
  `ape2_usuario` varchar(30) DEFAULT NULL,
  `id_local` int(11) DEFAULT NULL,
  `id_usuario_tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usu_usuario_UNIQUE` (`usu_usuario`),
  KEY `id_local` (`id_local`),
  KEY `id_usuario_tipo_idx` (`id_usuario_tipo`),
  CONSTRAINT `id_local` FOREIGN KEY (`id_local`) REFERENCES `tb_local` (`id_local`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_usuario_tipo` FOREIGN KEY (`id_usuario_tipo`) REFERENCES `tb_usuario_tipo` (`id_usuario_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (1,'admin','admin','Administrador',' ',' ',1,1),(2,'venta','venta','Vendedor',NULL,NULL,1,2);
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario_tipo`
--

DROP TABLE IF EXISTS `tb_usuario_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_usuario_tipo` (
  `id_usuario_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario_tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_usuario_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario_tipo`
--

LOCK TABLES `tb_usuario_tipo` WRITE;
/*!40000 ALTER TABLE `tb_usuario_tipo` DISABLE KEYS */;
INSERT INTO `tb_usuario_tipo` VALUES (1,'ADMINISTRADOR'),(2,'VENTAS');
/*!40000 ALTER TABLE `tb_usuario_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_venta`
--

DROP TABLE IF EXISTS `tb_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_venta` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_documento` int(11) DEFAULT NULL,
  `codigo_venta` varchar(20) DEFAULT NULL,
  `total_venta` decimal(20,2) DEFAULT NULL,
  `subtotal_venta` decimal(20,2) DEFAULT NULL,
  `igv_total_venta` decimal(20,2) DEFAULT NULL,
  `fecha_venta` timestamp NULL DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_local` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_tipo_documento2_idx` (`id_tipo_documento`),
  KEY `id_cliente2_idx` (`id_cliente`),
  KEY `id_usuario2_idx` (`id_usuario`),
  KEY `id_local3_idx` (`id_local`),
  CONSTRAINT `id_cliente2` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_local3` FOREIGN KEY (`id_local`) REFERENCES `tb_local` (`id_local`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_tipo_documento2` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tb_tipo_documento` (`id_tipo_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_usuario2` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_venta`
--

LOCK TABLES `tb_venta` WRITE;
/*!40000 ALTER TABLE `tb_venta` DISABLE KEYS */;
INSERT INTO `tb_venta` VALUES (2,2,'B001-000001',20.00,NULL,2.00,'2014-09-14 03:41:48',1,1,1);
/*!40000 ALTER TABLE `tb_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_venta_detalle`
--

DROP TABLE IF EXISTS `tb_venta_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_venta_detalle` (
  `id_venta_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) DEFAULT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `cantidad_venta_detalle` decimal(20,2) DEFAULT NULL,
  `valor_unitario_venta_detalle` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id_venta_detalle`),
  KEY `id_venta4_idx` (`id_venta`),
  KEY `id_producto44_idx` (`id_producto`),
  CONSTRAINT `id_producto44` FOREIGN KEY (`id_producto`) REFERENCES `tb_producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_venta4` FOREIGN KEY (`id_venta`) REFERENCES `tb_venta` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_venta_detalle`
--

LOCK TABLES `tb_venta_detalle` WRITE;
/*!40000 ALTER TABLE `tb_venta_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_venta_detalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_stock AFTER INSERT ON tb_venta_detalle
  FOR EACH ROW BEGIN

	SET @ID_LOCAL=(SELECT id_local FROM tb_venta where id_venta = NEW.id_venta);

	UPDATE tb_stock st
	SET st.cantidad_stock = st.cantidad_stock - NEW.cantidad_venta_detalle
	WHERE st.id_producto = NEW.id_producto and st.id_local = @ID_LOCAL;

  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-13 16:19:43
