-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.67-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema tramite
--

CREATE DATABASE IF NOT EXISTS tramite;
USE tramite;

--
-- Temporary table structure for view `V_USER_ROLE`
--
DROP TABLE IF EXISTS `V_USER_ROLE`;
DROP VIEW IF EXISTS `V_USER_ROLE`;
CREATE TABLE `V_USER_ROLE` (
  `usuario` varchar(100),
  `password` varchar(150),
  `grupo` varchar(100)
);

--
-- Definition of table `accion_documento`
--

DROP TABLE IF EXISTS accion_documento;

CREATE TABLE accion_documento (
  id INT(11) NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(100) NOT NULL  ,
  descripcion VARCHAR(255) NOT NULL ,
  ubicacion VARCHAR(150) NOT NULL  ,
  estado VARCHAR(20) NOT NULL ,
  ciudadano VARCHAR(100) NOT NULL  ,
  telefono_ciudadano VARCHAR(15) NOT NULL  ,
  fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accion_documento`
--

/*!40000 ALTER TABLE `accion_documento` DISABLE KEYS */;
INSERT INTO `accion_documento` (`id`, `titulo`, `descripcion`, `ubicacion`, `estado`, `ciudadano`, `telefono_ciudadano`, `fecha_registro`) VALUES 
(1, 'Trámite', '', 'Dirección del trámite', 'Activo', 'Ciudadano Uno', '1234567890', '2014-03-03 12:00:00'),
(2, 'Atención', '', 'Dirección de atención', 'Activo', 'Ciudadano Dos', '0987654321', '2014-03-03 12:00:00'),
(3, 'Conocimiento y Fines', '', 'Dirección de conocimiento', 'Activo', 'Ciudadano Tres', '1231231234', '2014-03-03 12:00:00'),
(4, 'Conocimiento y Devolución', '', 'Dirección de devolución', 'Activo', 'Ciudadano Cuatro', '3213214321', '2014-03-03 12:00:00'),
(5, 'Coordinación', '', 'Dirección de coordinación', 'Activo', 'Ciudadano Cinco', '4564564567', '2014-03-03 12:00:00'),
(6, 'Visación', '', 'Dirección de visación', 'Activo', 'Ciudadano Seis', '6546546543', '2014-03-03 12:00:00'),
(7, 'Preparar Respuesta', '', 'Dirección de respuesta', 'Activo', 'Ciudadano Siete', '7897897890', '2014-03-03 12:00:00'),
(8, 'Adjuntar Antecedentes', '', 'Dirección de antecedentes', 'Activo', 'Ciudadano Ocho', '9879879876', '2014-03-03 12:00:00'),
(9, 'Entregar Resultados', '', 'Dirección de resultados', 'Activo', 'Ciudadano Nueve', '6546543210', '2014-03-03 12:00:00'),
(10, 'Acumular', '', 'Dirección de acumulación', 'Activo', 'Ciudadano Diez', '3211234567', '2014-03-03 12:00:00'),
(11, 'Archivo', '', 'Dirección de archivo', 'Activo', 'Ciudadano Once', '4569871230', '2014-03-03 12:00:00');
/*!40000 ALTER TABLE `accion_documento` ENABLE KEYS */;



--
-- Definition of table `acciondocuntofinalizado`
--

DROP TABLE IF EXISTS `acciondocuntofinalizado`;
CREATE TABLE `acciondocuntofinalizado` (
  `id_accionDocuntoFinalizado` int(11) NOT NULL auto_increment,
  `id_accionesDocumentos` int(11) NOT NULL,
  `id_derivacion_registro_documentacion` int(11) NOT NULL,
  `observaciones` varchar(350) NOT NULL default '',
  `estado_existencia` int(2) NOT NULL,
  `fecha_creacionusuario` datetime default NULL,
  `fecha_creacion_sistema` datetime default NULL,
  `id_empleado_crea` int(11) NOT NULL,
  `id_empleado_haceCargo` int(11) NOT NULL,
  `id_area_empresa` int(11) NOT NULL,
  PRIMARY KEY  (`id_accionDocuntoFinalizado`),
  KEY `id_accionesDocumentos` (`id_accionesDocumentos`),
  KEY `id_derivacion_registro_documentacion` (`id_derivacion_registro_documentacion`),
  KEY `id_area_empresa` (`id_area_empresa`),
  KEY `id_empleado_crea` (`id_empleado_crea`),
  KEY `id_empleado_haceCargo` (`id_empleado_haceCargo`),
  CONSTRAINT `acciondocuntofinalizado_ibfk_1` FOREIGN KEY (`id_accionesDocumentos`) REFERENCES `accionesdocumentos` (`id_accionesDocumentos`),
  CONSTRAINT `acciondocuntofinalizado_ibfk_2` FOREIGN KEY (`id_derivacion_registro_documentacion`) REFERENCES `derivacion_registro_documentacion` (`id_derivacion_registro_documentacion`),
  CONSTRAINT `acciondocuntofinalizado_ibfk_3` FOREIGN KEY (`id_area_empresa`) REFERENCES `area_empresa` (`id_area_empresa`),
  CONSTRAINT `acciondocuntofinalizado_ibfk_4` FOREIGN KEY (`id_empleado_crea`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `acciondocuntofinalizado_ibfk_5` FOREIGN KEY (`id_empleado_haceCargo`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acciondocuntofinalizado`
--

/*!40000 ALTER TABLE `acciondocuntofinalizado` DISABLE KEYS */;

/*!40000 ALTER TABLE `acciondocuntofinalizado` ENABLE KEYS */;


--
-- Definition of table `acciones_derivacion`
--

DROP TABLE IF EXISTS `acciones_derivacion`;
CREATE TABLE `acciones_derivacion` (
  `id_acciones_derivacion` int(11) NOT NULL auto_increment,
  `nombre` varchar(70) NOT NULL default '',
  `descripcion` varchar(150) NOT NULL default '',
  `estado_existencia` int(2) NOT NULL,
  `fecha_creacion` date default NULL,
  PRIMARY KEY  (`id_acciones_derivacion`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acciones_derivacion`
--

/*!40000 ALTER TABLE `acciones_derivacion` DISABLE KEYS */;
INSERT INTO `acciones_derivacion` (`id_acciones_derivacion`,`nombre`,`descripcion`,`estado_existencia`,`fecha_creacion`) VALUES 
 (1,'Trámite','',1,'2014-03-03'),
 (2,'Atención','',1,'2014-03-03'),
 (3,'Conocimiento y Fines','',1,'2014-03-03'),
 (4,'Conocimiento y Devolución','',1,'2014-03-03'),
 (5,'Coordinación','',1,'2014-03-03'),
 (6,'Visación','',1,'2014-03-03'),
 (7,'Preparar Respuesta','',1,'2014-03-03'),
 (8,'Adjuntar Antecedentes','',1,'2014-03-03'),
 (9,'Entregar Resultados','',1,'2014-03-03'),
 (10,'Acumular','',1,'2014-03-03'),
 (11,'Archivo','',1,'2014-03-03'),
 (12,'Atendido',' ',1,'2014-03-03'),
 (13,'En espera de informacion',' ',1,'2014-03-03');
/*!40000 ALTER TABLE `acciones_derivacion` ENABLE KEYS */;


--
-- Definition of table `accionesdocumentos`
--

DROP TABLE IF EXISTS `accionesdocumentos`;
CREATE TABLE `accionesdocumentos` (
  `id_accionesDocumentos` int(11) NOT NULL auto_increment,
  `nombre` varchar(70) NOT NULL default '',
  `descripcion` varchar(150) NOT NULL default '',
  `estado_existencia` int(2) NOT NULL,
  `fecha_creacion` date default NULL,
  PRIMARY KEY  (`id_accionesDocumentos`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accionesdocumentos`
--

/*!40000 ALTER TABLE `accionesdocumentos` DISABLE KEYS */;
INSERT INTO `accionesdocumentos` (`id_accionesDocumentos`,`nombre`,`descripcion`,`estado_existencia`,`fecha_creacion`) VALUES 
 (1,'FINALIZAR Y ARCHIVAR','',1,'2014-07-10'),
 (2,'DEJAR EN CUSTODIA','',1,'2014-07-10'),
 (3,'FINALIZAR Y ARCHIVAR','',1,'2014-07-14'),
 (4,'DEJAR EN CUSTODIA','',1,'2014-07-14');
/*!40000 ALTER TABLE `accionesdocumentos` ENABLE KEYS */;


--
-- Definition of table `archivo_documento_interno`
--

DROP TABLE IF EXISTS `archivo_documento_interno`;
CREATE TABLE `archivo_documento_interno` (
  `id_archivo_documento_interno` int(11) NOT NULL auto_increment,
  `id_accionesDocumentos` int(11) NOT NULL,
  `id_documento_interno` int(11) NOT NULL,
  `observaciones` varchar(350) NOT NULL default '',
  `estado_existencia` int(2) NOT NULL,
  `fecha_creacionusuario` datetime default NULL,
  `fecha_creacion_sistema` datetime default NULL,
  `id_empleado_crea` int(11) NOT NULL,
  `id_empleado_haceCargo` int(11) NOT NULL,
  `id_area_empresa` int(11) NOT NULL,
  PRIMARY KEY  (`id_archivo_documento_interno`),
  KEY `id_accionesDocumentos` (`id_accionesDocumentos`),
  KEY `id_documento_interno` (`id_documento_interno`),
  KEY `id_area_empresa` (`id_area_empresa`),
  KEY `id_empleado_crea` (`id_empleado_crea`),
  KEY `id_empleado_haceCargo` (`id_empleado_haceCargo`),
  CONSTRAINT `archivo_documento_interno_ibfk_1` FOREIGN KEY (`id_accionesDocumentos`) REFERENCES `accionesdocumentos` (`id_accionesDocumentos`),
  CONSTRAINT `archivo_documento_interno_ibfk_2` FOREIGN KEY (`id_documento_interno`) REFERENCES `documento_interno` (`id_documento_interno`),
  CONSTRAINT `archivo_documento_interno_ibfk_3` FOREIGN KEY (`id_area_empresa`) REFERENCES `area_empresa` (`id_area_empresa`),
  CONSTRAINT `archivo_documento_interno_ibfk_4` FOREIGN KEY (`id_empleado_crea`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `archivo_documento_interno_ibfk_5` FOREIGN KEY (`id_empleado_haceCargo`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `archivo_documento_interno`
--

/*!40000 ALTER TABLE `archivo_documento_interno` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivo_documento_interno` ENABLE KEYS */;


--
-- Definition of table `area_empresa`
--

DROP TABLE IF EXISTS `area_empresa`;
CREATE TABLE `area_empresa` (
  `id_area_empresa` int(11) NOT NULL auto_increment,
  `nombre` varchar(250) NOT NULL default '',
  `codificacion` varchar(4) NOT NULL default '',
  `siglas` varchar(10) NOT NULL default '',
  `estado_existencia` int(2) NOT NULL,
  `fecha_creacion` date default NULL,
  PRIMARY KEY  (`id_area_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `area_empresa`
--

/*!40000 ALTER TABLE `area_empresa` DISABLE KEYS */;
INSERT INTO `area_empresa` (`id_area_empresa`,`nombre`,`codificacion`,`siglas`,`estado_existencia`,`fecha_creacion`) VALUES 
 (1,'PRESIDENCIA DIRECTORIO','100','PD',1,'2014-03-03'),
 (2,'Gerencia General','200','GG',1,'2014-03-03'),
 (3,'Organo de Control Institucional','300','OCI',1,'2014-03-03'),
 (4,'Oficina General de Planificación, Presupuest','400','OGPPR',1,'2014-03-03'),
 (5,'Oficina General de Asuntos Legales','500','OGAL',1,'2014-03-03'),
 (6,'Oficina de Asesoria Juridica','510','OAJ',1,'2014-03-03'),
 (7,'Oficina de Secretaria General','600','OSG',1,'2014-03-03'),
 (8,'Tramite Documentario','610','TD',1,'2014-03-03'),
 (9,'Oficina de Archivo','620','OARC',1,'2014-03-03'),
 (10,'Oficina General de Administración y Finanzas','700','OGAF',1,'2014-03-03'),
 (11,'Oficina de Contabilidad y Finanzas','710','OCF',1,'2014-03-03'),
 (12,'Oficina de Recursos Humanos','720','ORH',1,'2014-03-03'),
 (13,'Oficina de Tecnología de Información y Comu','730','OTIC',1,'2014-03-03'),
 (14,'Oficina de Logistica y Servicios Generales','740','OLSG',1,'2014-03-03'),
 (15,'Gerencia de Proyectos','800','GP',1,'2014-03-03'),
 (16,'SubGerencia  de Pre - Inversión','810','SGPI',1,'2014-03-03'),
 (17,'SubGerencia de Estudios y Proyectos','820','SGEP',1,'2014-03-03'),
 (18,'SubGerencia de Ejecución de Obras','830','SGEO',1,'2014-03-03'),
 (19,'Gerencia de Gestión Inmobiliaria','900','GGI',1,'2014-03-03'),
 (20,'SUBGERENCIA DE SANEAMIENTO INMOBILIARIO','910','SGSI',1,'2014-03-03'),
 (21,'SubGerencia de Administración, Promoción y','920','SGAPDI',1,'2014-03-03'),
 (22,'OTRO','000','OTRO',1,'2014-03-04'),
 (23,'','000','',1,'2014-03-04'),
 (24,'PRESIDENTE DE COMITÉ','','',1,'2014-04-03'),
 (25,'ASESORIA GP','840','AGP',1,'2014-07-14'),
 (26,'','840','SPREI',2,'2014-07-14'),
 (27,'PROGRAMA MUNICIPAL DE VIVIENDA POPULAR','','',1,'2014-08-20'),
 (28,'PERSONA NATURAL','','PN',1,'2014-10-06'),
 (29,'PROGRAMA DE VIVIENDA POPULAR','','PVP',1,'2014-10-15');
/*!40000 ALTER TABLE `area_empresa` ENABLE KEYS */;


--
-- Definition of table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
CREATE TABLE `auditoria` (
  `id_auditoria` int(11) NOT NULL auto_increment,
  `usuario_logeado` int(11) NOT NULL,
  `nombres_usuario` varchar(250) NOT NULL default '',
  `fecha_creacion` datetime default NULL,
  `accion_realizada` varchar(250) NOT NULL default '',
  `clase_hace_llamada` varchar(250) NOT NULL default '',
  `metodo_hace_llamada` varchar(250) NOT NULL default '',
  `tabla_bd` varchar(250) NOT NULL default '',
  PRIMARY KEY  (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auditoria`
--

/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;


--
-- Definition of table `cargo_empleado_empresa`
--

DROP TABLE IF EXISTS `cargo_empleado_empresa`;
CREATE TABLE `cargo_empleado_empresa` (
  `id_cargo_empleado_empresa` int(11) NOT NULL auto_increment,
  `nombre` varchar(100) NOT NULL default '',
  `descripcion` varchar(250) NOT NULL default '',
  `estado_existencia` int(2) NOT NULL,
  `fecha_creacion` date default NULL,
  PRIMARY KEY  (`id_cargo_empleado_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cargo_empleado_empresa`
--

/*!40000 ALTER TABLE `cargo_empleado_empresa` DISABLE KEYS */;
INSERT INTO `cargo_empleado_empresa` (`id_cargo_empleado_empresa`,`nombre`,`descripcion`,`estado_existencia`,`fecha_creacion`) VALUES 
 (1,'ASISTENTE','',1,'2014-03-03'),
 (2,'JEFE DE AREA','',1,'2014-03-03'),
 (3,'ANALISTA EN TESORERÍA','',1,'2014-03-03'),
 (4,'ANALISTA TECNICO','',1,'2014-03-03'),
 (5,'ASESOR  I','',1,'2014-03-03'),
 (6,'ASESORA I','',1,'2014-03-03'),
 (7,'ASESORA II - Jefe de la Oficina de RRHH','',1,'2014-03-03'),
 (8,'AUXILIAR EN SERVICIO DE MANTENIMIENTO','',1,'2014-03-03'),
 (9,'AUXILIAR EN SERVICIO DE TRANSPORTE','',1,'2014-03-03'),
 (10,'ESPECIALISTA DE CONTROL INTERNO','',1,'2014-03-03'),
 (11,'ESPECIALISTA EN ASESORÍA JURÍDICA - Jefa de','',1,'2014-03-03'),
 (12,'ESPECIALISTA EN BIENESTAR DE PERSONAL','',1,'2014-03-03'),
 (13,'ESPECIALISTA EN ESTUDIOS Y PROYECTOS','',1,'2014-03-03'),
 (14,'ESPECIALISTA LEGAL','',1,'2014-03-03'),
 (15,'ESPECIALISTA LEGAL EN SANEAMIENTO INMOBILIARI','',1,'2014-03-03'),
 (16,'ESPECIALISTA TÉCNICO EN SANEAMIENTO INMOBILIARIA','',1,'2014-03-03'),
 (17,'GERENTE DE GESTIÓN INMOBILIARIA','',1,'2014-03-03'),
 (18,'GERENTE DE PROYECTOS','',1,'2014-03-03'),
 (19,'GERENTE GENERAL','',1,'2014-03-03'),
 (20,'JEFE DE ARCHIVO','',1,'2014-03-03'),
 (21,'JEFE DE LA OFICINA DE CONTABILIDAD Y FINANZAS','',1,'2014-03-03'),
 (22,'JEFE DE LA OFICINA DE TECNOLOGIAS DE INFORMAC','',1,'2014-03-03'),
 (23,'JEFE DE LA OFICINA GENERAL ADM Y FINANZAS','',1,'2014-03-03'),
 (24,'JEFE DE LA OFICINA GENERAL DE ASUNTOS LEGALES','',1,'2014-03-03'),
 (25,'JEFE DE OFICINA DE LOGISTICA Y SERVICIOS GENE','',1,'2014-03-03'),
 (26,'SECRETARIA GENERAL','',1,'2014-03-03'),
 (27,'SUB GERENTE DE EJECUCION DE OBRAS','',1,'2014-03-03'),
 (28,'SUBGERENTE DE PRE INVERSION','',1,'2014-03-03'),
 (29,'TÉCNICA ADMINISTRATIVA II','',1,'2014-03-03'),
 (30,'TÉCNICA ADMINISTRATIVA III','',1,'2014-03-03'),
 (31,'TÉCNICA EN DISEÑO GRÁFICO','',1,'2014-03-03'),
 (32,'TÉCNICO EN SEGURIDAD','',1,'2014-03-03'),
 (33,'TECNICO EN TRAMITE DOCUMENTARIO','',1,'2014-03-03');
/*!40000 ALTER TABLE `cargo_empleado_empresa` ENABLE KEYS */;


--
-- Definition of table `derivacion_documento_interno`
--

DROP TABLE IF EXISTS `derivacion_documento_interno`;
CREATE TABLE `derivacion_documento_interno` (
  `id_derivacion_documento_interno` int(11) NOT NULL auto_increment,
  `id_documento_interno` int(11) NOT NULL,
  `fecha_registro_usuario` datetime NOT NULL,
  `fecha_registro_sistema` datetime NOT NULL,
  `fecha_cierre_derivacion` datetime NOT NULL,
  `id_empleado_emite` int(11) NOT NULL,
  `id_area_destino` int(11) NOT NULL,
  `estado_existencia` int(2) NOT NULL,
  `id_empleado_recibe` int(11) NOT NULL,
  `fecha_recepcion_empleado` datetime NOT NULL,
  `persona_copia` varchar(300) NOT NULL default '',
  `id_estado_derivacion_documento_interno` int(11) default NULL,
  `observaciones` varchar(300) NOT NULL default '',
  `observaciones_recepcion` varchar(300) NOT NULL default '',
  `ultima_derivacion` int(2) NOT NULL,
  `original_copia` int(2) NOT NULL default '1',
  `id_empleado_responsable_final` int(11) NOT NULL,
  `id_grupo_perfil` int(11) NOT NULL,
  PRIMARY KEY  (`id_derivacion_documento_interno`),
  KEY `id_documento_interno` (`id_documento_interno`),
  KEY `id_empleado_emite` (`id_empleado_emite`),
  KEY `id_area_destino` (`id_area_destino`),
  KEY `id_empleado_recibe` (`id_empleado_recibe`),
  KEY `id_empleado_responsable_final` (`id_empleado_responsable_final`),
  KEY `id_estado_derivacion_documento_interno` (`id_estado_derivacion_documento_interno`),
  CONSTRAINT `derivacion_documento_interno_ibfk_1` FOREIGN KEY (`id_documento_interno`) REFERENCES `documento_interno` (`id_documento_interno`),
  CONSTRAINT `derivacion_documento_interno_ibfk_2` FOREIGN KEY (`id_empleado_emite`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `derivacion_documento_interno_ibfk_3` FOREIGN KEY (`id_area_destino`) REFERENCES `area_empresa` (`id_area_empresa`),
  CONSTRAINT `derivacion_documento_interno_ibfk_4` FOREIGN KEY (`id_empleado_recibe`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `derivacion_documento_interno_ibfk_5` FOREIGN KEY (`id_empleado_responsable_final`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `derivacion_documento_interno_ibfk_6` FOREIGN KEY (`id_estado_derivacion_documento_interno`) REFERENCES `estado_derivacion_documento_interno` (`id_estado_derivacion_documento_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `derivacion_documento_interno`
--

/*!40000 ALTER TABLE `derivacion_documento_interno` DISABLE KEYS */;


/*!40000 ALTER TABLE `derivacion_documento_interno` ENABLE KEYS */;


--
-- Definition of table `derivacion_registro_documentacion`
--

DROP TABLE IF EXISTS `derivacion_registro_documentacion`;
CREATE TABLE `derivacion_registro_documentacion` (
  `id_derivacion_registro_documentacion` int(11) NOT NULL auto_increment,
  `id_registro_documentacion` int(11) NOT NULL,
  `fecha_registro_usuario` datetime NOT NULL,
  `fecha_registro_sistema` datetime NOT NULL,
  `fecha_cierre_derivacion` datetime NOT NULL,
  `id_empleado_emite` int(11) NOT NULL,
  `id_area_destino` int(11) NOT NULL,
  `estado_existencia` int(2) NOT NULL,
  `id_empleado_recibe` int(11) NOT NULL,
  `fecha_recepcion_empleado` datetime NOT NULL,
  `persona_copia` varchar(300) NOT NULL default '',
  `id_estado_derivacion_registro_documentacion` int(11) default NULL,
  `observaciones` varchar(300) NOT NULL default '',
  `observaciones_recepcion` varchar(300) NOT NULL default '',
  `ultima_derivacion` int(2) NOT NULL,
  `original_copia` int(2) NOT NULL default '1',
  `id_empleado_responsable_final` int(11) NOT NULL,
  `id_grupo_perfil` int(2) NOT NULL default '2',
  `id_motorizado` int(11) NOT NULL default '1',
  `estadoArchivado` int(1) default '0',
  `idAccionDocumentoFinalizado` int(1) default '0',
  `estadoBloqueado` int(1) default '0',
  PRIMARY KEY  (`id_derivacion_registro_documentacion`),
  KEY `id_registro_documentacion` (`id_registro_documentacion`),
  KEY `id_empleado_emite` (`id_empleado_emite`),
  KEY `id_area_destino` (`id_area_destino`),
  KEY `id_empleado_recibe` (`id_empleado_recibe`),
  KEY `id_empleado_responsable_final` (`id_empleado_responsable_final`),
  KEY `id_estado_derivacion_registro_documentacion` (`id_estado_derivacion_registro_documentacion`),
  KEY `id_motorizado` (`id_motorizado`),
  CONSTRAINT `derivacion_registro_documentacion_ibfk_1` FOREIGN KEY (`id_registro_documentacion`) REFERENCES `registro_documentacion` (`id_registro_documentacion`),
  CONSTRAINT `derivacion_registro_documentacion_ibfk_2` FOREIGN KEY (`id_empleado_emite`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `derivacion_registro_documentacion_ibfk_3` FOREIGN KEY (`id_area_destino`) REFERENCES `area_empresa` (`id_area_empresa`),
  CONSTRAINT `derivacion_registro_documentacion_ibfk_4` FOREIGN KEY (`id_empleado_recibe`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `derivacion_registro_documentacion_ibfk_5` FOREIGN KEY (`id_empleado_responsable_final`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `derivacion_registro_documentacion_ibfk_6` FOREIGN KEY (`id_estado_derivacion_registro_documentacion`) REFERENCES `estado_derivacion_registro_documentacion` (`id_estado_derivacion_registro_documentacion`),
  CONSTRAINT `FK_id_motorizado` FOREIGN KEY (`id_motorizado`) REFERENCES `motorizado` (`id_motorizado`)
) ENGINE=InnoDB AUTO_INCREMENT=8385 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `derivacion_registro_documentacion`
--

/*!40000 ALTER TABLE `derivacion_registro_documentacion` DISABLE KEYS */;

/*!40000 ALTER TABLE `derivacion_registro_documentacion` ENABLE KEYS */;


--
-- Definition of table `detalle_derivacion_acciones`
--

DROP TABLE IF EXISTS `detalle_derivacion_acciones`;
CREATE TABLE `detalle_derivacion_acciones` (
  `id_detalle_derivacion_acciones` int(11) NOT NULL auto_increment,
  `id_derivacion_registro_documentacion` int(11) NOT NULL,
  `id_acciones_derivacion` int(11) NOT NULL,
  PRIMARY KEY  (`id_detalle_derivacion_acciones`),
  KEY `id_derivacion_registro_documentacion` (`id_derivacion_registro_documentacion`),
  KEY `id_acciones_derivacion` (`id_acciones_derivacion`),
  CONSTRAINT `detalle_derivacion_acciones_ibfk_1` FOREIGN KEY (`id_derivacion_registro_documentacion`) REFERENCES `derivacion_registro_documentacion` (`id_derivacion_registro_documentacion`),
  CONSTRAINT `detalle_derivacion_acciones_ibfk_2` FOREIGN KEY (`id_acciones_derivacion`) REFERENCES `acciones_derivacion` (`id_acciones_derivacion`)
) ENGINE=InnoDB AUTO_INCREMENT=11249 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detalle_derivacion_acciones`
--

/*!40000 ALTER TABLE `detalle_derivacion_acciones` DISABLE KEYS */;

/*!40000 ALTER TABLE `detalle_derivacion_acciones` ENABLE KEYS */;


--
-- Definition of table `detalle_derivacion_areas_copia`
--

DROP TABLE IF EXISTS `detalle_derivacion_areas_copia`;
CREATE TABLE `detalle_derivacion_areas_copia` (
  `id_detalle_derivacion_areas_copia` int(11) NOT NULL auto_increment,
  `id_derivacion_registro_documentacion` int(11) NOT NULL,
  `id_area_empresa` int(11) NOT NULL,
  PRIMARY KEY  (`id_detalle_derivacion_areas_copia`),
  KEY `id_derivacion_registro_documentacion` (`id_derivacion_registro_documentacion`),
  KEY `id_area_empresa` (`id_area_empresa`),
  CONSTRAINT `detalle_derivacion_areas_copia_ibfk_1` FOREIGN KEY (`id_derivacion_registro_documentacion`) REFERENCES `derivacion_registro_documentacion` (`id_derivacion_registro_documentacion`),
  CONSTRAINT `detalle_derivacion_areas_copia_ibfk_2` FOREIGN KEY (`id_area_empresa`) REFERENCES `area_empresa` (`id_area_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=479 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detalle_derivacion_areas_copia`
--

/*!40000 ALTER TABLE `detalle_derivacion_areas_copia` DISABLE KEYS */;

/*!40000 ALTER TABLE `detalle_derivacion_areas_copia` ENABLE KEYS */;


--
-- Definition of trigger `inserta_detalle_derivacion_areas_copia`
--

DROP TRIGGER /*!50030 IF EXISTS */ `inserta_detalle_derivacion_areas_copia`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `inserta_detalle_derivacion_areas_copia` BEFORE INSERT ON `detalle_derivacion_areas_copia` FOR EACH ROW BEGIN
declare id_registro int(11) default 0;
declare id_empleado_emite_ int(11) default 0;
select r.id_registro_documentacion,d.id_empleado_emite into id_registro,id_empleado_emite_ from derivacion_registro_documentacion d 
inner join registro_documentacion r
on d.id_registro_documentacion = r.id_registro_documentacion where d.id_derivacion_registro_documentacion=new.id_derivacion_registro_documentacion;


insert into derivacion_registro_documentacion(id_registro_documentacion,fecha_registro_usuario,
fecha_registro_sistema,
fecha_cierre_derivacion,
id_empleado_emite,
id_area_destino,
estado_existencia,
id_empleado_recibe,
fecha_recepcion_empleado,
persona_copia,
id_estado_derivacion_registro_documentacion,
observaciones,
observaciones_recepcion,
ultima_derivacion,
original_copia,id_empleado_responsable_final,id_grupo_perfil) values (id_registro,now(),now(),now(),id_empleado_emite_,new.id_area_empresa,1,id_empleado_emite_,now(),
'',1,"","",1,1,id_empleado_emite_,2  );

END $$

DELIMITER ;

--
-- Definition of table `detalle_derivacion_documento_interno_acciones`
--

DROP TABLE IF EXISTS `detalle_derivacion_documento_interno_acciones`;
CREATE TABLE `detalle_derivacion_documento_interno_acciones` (
  `id_detalle_derivacion_documento_interno_acciones` int(11) NOT NULL auto_increment,
  `id_derivacion_documento_interno` int(11) NOT NULL,
  `id_acciones_derivacion` int(11) NOT NULL,
  PRIMARY KEY  (`id_detalle_derivacion_documento_interno_acciones`),
  KEY `id_derivacion_documento_interno` (`id_derivacion_documento_interno`),
  KEY `id_acciones_derivacion` (`id_acciones_derivacion`),
  CONSTRAINT `detalle_derivacion_documento_interno_acciones_ibfk_1` FOREIGN KEY (`id_derivacion_documento_interno`) REFERENCES `derivacion_documento_interno` (`id_derivacion_documento_interno`),
  CONSTRAINT `detalle_derivacion_documento_interno_acciones_ibfk_2` FOREIGN KEY (`id_acciones_derivacion`) REFERENCES `acciones_derivacion` (`id_acciones_derivacion`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detalle_derivacion_documento_interno_acciones`
--

/*!40000 ALTER TABLE `detalle_derivacion_documento_interno_acciones` DISABLE KEYS */;

/*!40000 ALTER TABLE `detalle_derivacion_documento_interno_acciones` ENABLE KEYS */;


--
-- Definition of table `detalle_derivacion_documento_interno_areas_copia`
--

DROP TABLE IF EXISTS `detalle_derivacion_documento_interno_areas_copia`;
CREATE TABLE `detalle_derivacion_documento_interno_areas_copia` (
  `id_detalle_derivacion_documento_interno_areas_copia` int(11) NOT NULL auto_increment,
  `id_derivacion_documento_interno` int(11) NOT NULL,
  `id_area_empresa` int(11) NOT NULL,
  PRIMARY KEY  (`id_detalle_derivacion_documento_interno_areas_copia`),
  KEY `id_derivacion_documento_interno` (`id_derivacion_documento_interno`),
  KEY `id_area_empresa` (`id_area_empresa`),
  CONSTRAINT `detalle_derivacion_documento_interno_areas_copia_ibfk_1` FOREIGN KEY (`id_derivacion_documento_interno`) REFERENCES `derivacion_documento_interno` (`id_derivacion_documento_interno`),
  CONSTRAINT `detalle_derivacion_documento_interno_areas_copia_ibfk_2` FOREIGN KEY (`id_area_empresa`) REFERENCES `area_empresa` (`id_area_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detalle_derivacion_documento_interno_areas_copia`
--

/*!40000 ALTER TABLE `detalle_derivacion_documento_interno_areas_copia` DISABLE KEYS */;
INSERT INTO `detalle_derivacion_documento_interno_areas_copia` (`id_detalle_derivacion_documento_interno_areas_copia`,`id_derivacion_documento_interno`,`id_area_empresa`) VALUES 
 (1,1,8);
/*!40000 ALTER TABLE `detalle_derivacion_documento_interno_areas_copia` ENABLE KEYS */;


--
-- Definition of table `detalle_documento_interno_acciones`
--

DROP TABLE IF EXISTS `detalle_documento_interno_acciones`;
CREATE TABLE `detalle_documento_interno_acciones` (
  `id_detalle_documento_interno_acciones` int(11) NOT NULL auto_increment,
  `id_documento_interno` int(11) NOT NULL,
  `id_acciones_derivacion` int(11) NOT NULL,
  PRIMARY KEY  (`id_detalle_documento_interno_acciones`),
  KEY `id_documento_interno` (`id_documento_interno`),
  KEY `id_acciones_derivacion` (`id_acciones_derivacion`),
  CONSTRAINT `detalle_documento_interno_acciones_ibfk_1` FOREIGN KEY (`id_documento_interno`) REFERENCES `documento_interno` (`id_documento_interno`),
  CONSTRAINT `detalle_documento_interno_acciones_ibfk_2` FOREIGN KEY (`id_acciones_derivacion`) REFERENCES `acciones_derivacion` (`id_acciones_derivacion`)
) ENGINE=InnoDB AUTO_INCREMENT=1648 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detalle_documento_interno_acciones`
--

/*!40000 ALTER TABLE `detalle_documento_interno_acciones` DISABLE KEYS */;

/*!40000 ALTER TABLE `detalle_documento_interno_acciones` ENABLE KEYS */;


--
-- Definition of table `detalle_documento_interno_areas_copia`
--

DROP TABLE IF EXISTS `detalle_documento_interno_areas_copia`;
CREATE TABLE `detalle_documento_interno_areas_copia` (
  `id_detalle_documento_interno_areas_copia` int(11) NOT NULL auto_increment,
  `id_documento_interno` int(11) NOT NULL,
  `id_area_empresa` int(11) NOT NULL,
  PRIMARY KEY  (`id_detalle_documento_interno_areas_copia`),
  KEY `id_documento_interno` (`id_documento_interno`),
  KEY `id_area_empresa` (`id_area_empresa`),
  CONSTRAINT `detalle_documento_interno_areas_copia_ibfk_1` FOREIGN KEY (`id_documento_interno`) REFERENCES `documento_interno` (`id_documento_interno`),
  CONSTRAINT `detalle_documento_interno_areas_copia_ibfk_2` FOREIGN KEY (`id_area_empresa`) REFERENCES `area_empresa` (`id_area_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detalle_documento_interno_areas_copia`
--

/*!40000 ALTER TABLE `detalle_documento_interno_areas_copia` DISABLE KEYS */;

/*!40000 ALTER TABLE `detalle_documento_interno_areas_copia` ENABLE KEYS */;


--
-- Definition of trigger `inserta_detalle_documento_interno_areas_copia`
--

DROP TRIGGER /*!50030 IF EXISTS */ `inserta_detalle_documento_interno_areas_copia`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `inserta_detalle_documento_interno_areas_copia` BEFORE INSERT ON `detalle_documento_interno_areas_copia` FOR EACH ROW BEGIN

declare id_empleado_emite_ int(11) default 0;
declare codificacion_ varchar(4) default '';

declare id_registro_ int(11) default 0;
declare denominacion_documento_ VARCHAR(20) default '';
declare asunto_ VARCHAR(2000)default ''; 
declare folios_ int  default 0;
declare id_tipo_documento_interno_ int(11);
declare id_empleado_ int(11);
declare estado_existencia_ int(2);
declare observaciones_ varchar(200);
declare id_prioridad_ int(11);
declare id_interesado_registro_ int(11);
declare id_registro_documentacion_ int(11);
declare id_area_empresa_ int(11);
declare estado_recepcion_ int(2) default 1;
declare id_empleado_responsable_ int(11);
declare fecha_recepcion_ datetime;
declare observacion_recepcion_ VARCHAR(20) default '';
declare fecha_registro_usuario_ datetime;
declare fecha_registro_sistema_ datetime;

declare original_copia_ int(2) default 0;
declare personaDirigida_ VARCHAR(80) default '';
declare cargoPersonaDirigida_ VARCHAR(80) default '';
declare id_tipo_proyecto_ int(11);



select 
id_documento_interno,
denominacion_documento,
asunto,
folios,
id_tipo_documento_interno,
id_empleado,
estado_existencia,
observaciones,
id_prioridad,
id_interesado_registro,
id_registro_documentacion,
id_area_empresa,
estado_recepcion,
id_empleado_responsable,
fecha_recepcion,
observacion_recepcion,
fecha_registro_usuario,
fecha_registro_sistema,
original_copia,
personaDirigida,
cargoPersonaDirigida,
id_tipo_proyecto

 into id_registro_,denominacion_documento_,
asunto_,folios_,id_tipo_documento_interno_,id_empleado_,estado_existencia_,
observaciones_,id_prioridad_,id_interesado_registro_,id_registro_documentacion_,
id_area_empresa_,estado_recepcion_,id_empleado_responsable_,fecha_recepcion_,
observacion_recepcion_,fecha_registro_usuario_,fecha_registro_sistema_,original_copia_,personaDirigida_,cargoPersonaDirigida_,id_tipo_proyecto_
 from documento_interno  where id_documento_interno=NEW.id_documento_interno;

 
 select codificacion into codificacion_ from area_empresa where id_area_empresa=NEW.id_area_empresa;
 
 select id_interesado_registro into id_interesado_registro_ from  interesado_registro
 where denominacion=codificacion_;

 








insert into documento_interno(denominacion_documento,
asunto,
folios,
id_tipo_documento_interno,
id_empleado,
estado_existencia,
observaciones,
id_prioridad,
id_interesado_registro,
id_registro_documentacion,
id_area_empresa,
estado_recepcion,
id_empleado_responsable,
fecha_recepcion,
observacion_recepcion,
fecha_registro_usuario,
fecha_registro_sistema,original_copia,personaDirigida,cargoPersonaDirigida,id_tipo_proyecto) values(denominacion_documento_,
asunto_,
folios_,
id_tipo_documento_interno_,
id_empleado_,
estado_existencia_,
observaciones_,
id_prioridad_,
id_interesado_registro_,
id_registro_documentacion_,
id_area_empresa_,
estado_recepcion_,
id_empleado_responsable_,
fecha_recepcion_,
observacion_recepcion_,
fecha_registro_usuario_,
fecha_registro_sistema_,1,personaDirigida_,cargoPersonaDirigida_,id_tipo_proyecto_);

END $$

DELIMITER ;

--
-- Definition of table `documento_interno`
--

DROP TABLE IF EXISTS `documento_interno`;
CREATE TABLE `documento_interno` (
  `id_documento_interno` int(11) NOT NULL auto_increment,
  `denominacion_documento` varchar(50) default NULL,
  `asunto` varchar(2000) NOT NULL default '',
  `folios` int(11) NOT NULL default '0',
  `id_tipo_documento_interno` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `estado_existencia` int(2) NOT NULL,
  `observaciones` varchar(1700) default NULL,
  `id_prioridad` int(11) NOT NULL,
  `id_interesado_registro` int(11) NOT NULL,
  `id_registro_documentacion` int(11) NOT NULL,
  `id_area_empresa` int(11) NOT NULL,
  `estado_recepcion` int(2) default '1',
  `id_empleado_responsable` int(11) NOT NULL,
  `fecha_recepcion` datetime default NULL,
  `observacion_recepcion` varchar(20) NOT NULL default '',
  `fecha_registro_usuario` datetime default NULL,
  `fecha_registro_sistema` datetime default NULL,
  `original_copia` int(2) NOT NULL default '0',
  `personaDirigida` varchar(80) default '',
  `cargoPersonaDirigida` varchar(80) default '',
  `estado_bloqueado` int(11) NOT NULL default '0',
  `id_archivo_documento_interno` int(11) NOT NULL default '0',
  `id_tipo_proyecto` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id_documento_interno`),
  KEY `id_tipo_documento_interno` (`id_tipo_documento_interno`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_prioridad` (`id_prioridad`),
  KEY `id_interesado_registro` (`id_interesado_registro`),
  KEY `id_registro_documentacion` (`id_registro_documentacion`),
  KEY `id_area_empresa` (`id_area_empresa`),
  KEY `id_empleado_responsable` (`id_empleado_responsable`),
  KEY `documento_internoTipoProyecto` (`id_tipo_proyecto`),
  CONSTRAINT `documento_internoTipoProyecto` FOREIGN KEY (`id_tipo_proyecto`) REFERENCES `tipo_proyecto` (`id_tipo_proyecto`),
  CONSTRAINT `documento_interno_ibfk_1` FOREIGN KEY (`id_tipo_documento_interno`) REFERENCES `tipo_documento_interno` (`id_tipo_documento_interno`),
  CONSTRAINT `documento_interno_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `documento_interno_ibfk_3` FOREIGN KEY (`id_prioridad`) REFERENCES `prioridad` (`id_prioridad`),
  CONSTRAINT `documento_interno_ibfk_4` FOREIGN KEY (`id_interesado_registro`) REFERENCES `interesado_registro` (`id_interesado_registro`),
  CONSTRAINT `documento_interno_ibfk_5` FOREIGN KEY (`id_registro_documentacion`) REFERENCES `registro_documentacion` (`id_registro_documentacion`),
  CONSTRAINT `documento_interno_ibfk_6` FOREIGN KEY (`id_area_empresa`) REFERENCES `area_empresa` (`id_area_empresa`),
  CONSTRAINT `documento_interno_ibfk_7` FOREIGN KEY (`id_empleado_responsable`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=1424 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `documento_interno`
--

/*!40000 ALTER TABLE `documento_interno` DISABLE KEYS */;

/*!40000 ALTER TABLE `documento_interno` ENABLE KEYS */;


--
-- Definition of trigger `inserta_documento_interno`
--

DROP TRIGGER /*!50030 IF EXISTS */ `inserta_documento_interno`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `inserta_documento_interno` BEFORE INSERT ON `documento_interno` FOR EACH ROW BEGIN 

declare id_ int(11) default 0;
declare id_numeracion int(11) default 0;

declare id_area_emp varchar(250) default '';
declare id_tipo_doc varchar(100) default '';
declare _siglas varchar(10) default '';


if new.original_copia = 0 then

select codificacion,siglas into id_area_emp,_siglas from area_empresa where id_area_empresa = NEW.id_area_empresa;
select denominacion into id_tipo_doc from tipo_documento_interno where id_tipo_documento_interno = NEW.id_tipo_documento_interno;

select  id_numeracion_doc_interno  , ultima_numeracion into id_numeracion,id_ from numeracion_doc_interno where id_area_empresa =NEW.id_area_empresa and id_tipo_documento_interno=NEW.id_tipo_documento_interno;

/* XXX-AÑO-EMILIMA-SIGLAS, ejemplo: INFORME N° 001-2015-EMILIMA-OTIC */

/*set new.denominacion_documento=concat(id_area_emp,concat(' - ',concat(id_tipo_doc,concat(' - ',RIGHT(CONCAT('00000000', (id_+1)), 8))))) ;*/
set new.denominacion_documento=concat(RIGHT(CONCAT('000', (id_+1)), 3),'-', year(new.fecha_registro_usuario),'-EMILIMA-',_siglas);


update numeracion_doc_interno set ultima_numeracion=id_+1 where  id_numeracion_doc_interno=id_numeracion;

END IF;


END $$

DELIMITER ;

--
-- Definition of table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL auto_increment,
  `nombre_empleado` varchar(150) NOT NULL default '',
  `ape_paterno` varchar(200) NOT NULL default '',
  `ape_materno` varchar(200) NOT NULL default '',
  `dni` varchar(10) NOT NULL default '',
  `direccion` varchar(250) NOT NULL default '',
  `telefono` varchar(48) NOT NULL default '',
  `correo` varchar(68) NOT NULL default '',
  `id_tipo_empleado` int(11) NOT NULL,
  `estado_existencia` int(2) NOT NULL,
  `fecha_registro_sistema` datetime NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_salida_empresa` date default NULL,
  `id_area_empresa` int(11) NOT NULL,
  `id_cargo_empleado_empresa` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id_empleado`),
  KEY `id_tipo_empleado` (`id_tipo_empleado`),
  KEY `id_area_empresa` (`id_area_empresa`),
  KEY `fk_empleado_cargo` (`id_cargo_empleado_empresa`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_tipo_empleado`) REFERENCES `tipo_empleado` (`id_tipo_empleado`),
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`id_area_empresa`) REFERENCES `area_empresa` (`id_area_empresa`),
  CONSTRAINT `fk_empleado_cargo` FOREIGN KEY (`id_cargo_empleado_empresa`) REFERENCES `cargo_empleado_empresa` (`id_cargo_empleado_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `empleado`
--

/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` (`id_empleado`,`nombre_empleado`,`ape_paterno`,`ape_materno`,`dni`,`direccion`,`telefono`,`correo`,`id_tipo_empleado`,`estado_existencia`,`fecha_registro_sistema`,`fecha_nacimiento`,`fecha_salida_empresa`,`id_area_empresa`,`id_cargo_empleado_empresa`) VALUES 
 (1,'YURY DANIEL','ZAVALETA DE LA CRUZ','','','','','',1,1,'2014-03-03 17:12:38','2014-03-03','2014-03-03',13,1),
 (2,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',2,1),
 (3,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',1,1),
 (4,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',1,1),
 (5,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',1,1),
 (6,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',1,1),
 (7,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',9,2),
 (8,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',11,1),
 (9,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',1,1),
 (10,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',12,1),
 (11,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',3,1),
 (12,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',1,1),
 (13,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',5,1),
 (14,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',1,1),
 (15,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',1,1),
 (16,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',1,1),
 (17,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',1,1),
 (18,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',1,1),
 (19,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',11,1),
 (20,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',21,1),
 (21,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',6,1),
 (22,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',19,2),
 (23,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',1,1),
 (24,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',7,1),
 (25,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',20,1),
 (26,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',1,1),
 (27,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',2,1),
 (28,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',1,1),
 (29,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',1,1),
 (30,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',14,1),
 (31,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',1,1),
 (32,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',13,2),
 (33,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',7,1),
 (34,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',7,1),
 (35,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',2,1),
 (36,'','','','','','','',1,1,'2014-03-03 00:00:00','2014-03-03','2014-03-03',2,1),
 (37,'','','','','','','',1,1,'2014-03-31 16:43:17','2014-03-31','2014-03-31',7,1),
 (38,'','','','','','','',1,1,'2014-07-02 16:49:48','2014-07-02','2014-07-02',5,1),
 (39,'','','','','','','',1,1,'2014-07-02 16:54:18','2014-07-02','2014-07-02',6,1),
 (40,'','','','','','','',1,1,'2014-07-03 09:25:30','2014-07-03','2014-07-03',12,1),
 (41,'','','','','','','',1,1,'2014-07-03 09:48:09','2014-07-03','2014-07-03',12,1),
 (42,'','','','','','','',1,1,'2014-07-03 10:21:21','2014-07-03','2014-07-03',4,1),
 (43,'','','','','','','',1,1,'2014-07-03 10:29:41','2014-07-03','2014-07-03',4,1),
 (44,'','','','','','','',1,1,'2014-07-03 10:38:02','2014-07-03','2014-07-03',4,1),
 (45,'','','','','','','',1,1,'2014-07-03 11:08:18','2014-07-03','2014-07-03',19,1),
 (46,'','','','','','','',1,1,'2014-07-03 11:29:54','2014-07-03','2014-07-03',20,1),
 (47,'','','','','','','',1,1,'2014-07-03 11:36:57','2014-07-03','2014-07-03',20,1),
 (48,'','','','','','','',1,1,'2014-07-04 10:07:45','2014-07-04','2014-07-04',10,1),
 (49,'','','','','','','',1,1,'2014-07-04 10:16:49','2014-07-04','2014-07-04',10,1),
 (50,'','','','','','','',1,1,'2014-07-04 10:48:49','2014-07-04','2014-07-04',21,1),
 (51,'','','','','','','',1,1,'2014-07-04 11:19:31','2014-07-04','2014-07-04',21,1),
 (52,'','','','','','','',1,1,'2014-07-07 10:56:09','2014-07-07','2014-07-07',14,1),
 (53,'','','','','','','',1,1,'2014-07-11 12:35:35','2014-07-11','2014-07-11',14,1),
 (54,'','','','','','','',1,1,'2014-07-14 08:37:14','2014-07-14','2014-07-14',15,1),
 (55,'','','','','','','',1,2,'2014-07-14 09:04:10','2014-07-14','2014-07-14',1,1),
 (56,'','','','','','','',1,1,'2014-07-14 09:19:05','2014-07-14','2014-07-14',25,1),
 (57,'','','','','','','',1,1,'2014-07-14 09:22:43','2014-07-14','2014-07-14',16,2),
 (58,'','','','','','','',1,1,'2014-07-14 09:34:14','2014-07-14','2014-07-14',17,1),
 (59,'','','','','','','',1,1,'2014-07-14 09:35:48','2014-07-14','2014-07-14',17,1),
 (60,'','','','','','','',1,1,'2014-07-14 09:36:46','2014-07-14','2014-07-14',17,2),
 (61,'','','','','','','',1,1,'2014-07-14 09:37:45','2014-07-14','2014-07-14',18,2),
 (62,'','','','','','','',1,1,'2014-07-14 09:38:47','2014-07-14','2014-07-14',18,2),
 (63,'','','','','','','',1,1,'2014-07-14 09:39:54','2014-07-14','2014-07-14',18,2),
 (64,'','','','','','','',1,1,'2014-07-14 09:40:43','2014-07-14','2014-07-14',18,1),
 (65,'','','','','','','',1,1,'2014-07-14 09:41:39','2014-07-14','2014-07-14',18,2),
 (66,'','','','','','','',1,1,'2014-07-14 09:42:20','2014-07-14','2014-07-14',18,2),
 (67,'','','','','','','',1,1,'2014-07-14 09:43:06','2014-07-14','2014-07-14',18,2),
 (68,'','','','','','','',1,1,'2014-07-14 09:44:50','2014-07-14','2014-07-14',15,2),
 (69,'','','','','','','',1,1,'2014-07-14 09:47:54','2014-07-14','2014-07-14',15,2),
 (70,'','','','','','','',1,1,'2014-07-14 11:48:00','2014-07-14','2014-07-14',11,1),
 (71,'','','','','','','',1,1,'2014-07-14 12:04:53','2014-07-14','2014-07-14',11,1),
 (72,'','','','','','','',1,1,'2014-07-14 12:22:40','2014-07-14','2014-07-14',11,1),
 (73,'','','','','','','',1,1,'2014-07-16 15:14:07','2014-07-16','2014-07-16',18,1),
 (74,'','','','','','','',1,1,'2014-07-18 09:19:50','2014-07-18','2014-07-18',1,2),
 (75,'','','','','','','',1,1,'2014-07-18 10:24:04','2014-07-18','2014-07-18',3,1),
 (76,'','','','','','','',1,1,'2014-07-30 16:59:22','2014-07-30','2014-07-30',4,1),
 (77,'','','','','','','',1,1,'2014-08-04 15:38:55','2014-08-04','2014-08-04',10,1),
 (78,'','','','','','','',1,1,'2014-08-05 11:17:27','2014-08-05','2014-08-05',15,2),
 (79,'','','','','','','',1,1,'2014-08-05 11:20:04','2014-08-05','2014-08-05',25,2),
 (80,'','','','','','','',1,1,'2014-08-05 11:22:02','2014-08-05','2014-08-05',25,2),
 (81,'','','','','','','',1,1,'2014-08-05 11:23:49','2014-08-05','2014-08-05',25,2),
 (82,'','','','','','','',1,1,'2014-08-05 11:26:36','2014-08-05','2014-08-05',17,2),
 (83,'','','','','','','',1,1,'2014-08-05 11:33:03','2014-08-05','2014-08-05',18,2),
 (84,'','','','','','','',1,1,'2014-08-05 11:34:43','2014-08-05','2014-08-05',18,2),
 (85,'','','','','','','',1,1,'2014-08-12 09:44:15','2014-08-12','2014-08-12',18,2),
 (86,'','','','','','','',1,1,'2014-08-12 09:46:10','2014-08-12','2014-08-12',18,1),
 (87,'','','','','','','',1,1,'2014-08-19 12:33:08','2014-08-19','2014-08-19',4,2),
 (88,'','','','','','','',1,1,'2014-09-29 10:07:03','2014-09-29','2014-09-29',3,1),
 (89,'','','','','','','',1,1,'2014-10-20 11:56:44','2014-10-20','2014-10-20',14,1),
 (90,'','','','','','','',1,1,'2014-10-20 12:11:28','2014-10-20','2014-10-20',14,1),
 (91,'admin','admin','admin','','','','',1,1,'2015-01-06 09:33:53','2015-01-06','2015-01-06',1,2),
 (92,'','','','','','','jzegarra@admin.com.pe',1,1,'2015-01-07 08:30:41','2015-01-07','2015-01-07',7,33),
 (93,'','','','','','','',1,1,'2015-01-07 08:36:18','2015-01-07','2015-01-07',7,1);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;


--
-- Definition of table `estado_derivacion_documento_interno`
--

DROP TABLE IF EXISTS `estado_derivacion_documento_interno`;
CREATE TABLE `estado_derivacion_documento_interno` (
  `id_estado_derivacion_documento_interno` int(11) NOT NULL auto_increment,
  `nombre` varchar(70) NOT NULL default '',
  `descripcion` varchar(150) NOT NULL default '',
  `estado_existencia` int(2) NOT NULL,
  `fecha_creacion` date default NULL,
  PRIMARY KEY  (`id_estado_derivacion_documento_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estado_derivacion_documento_interno`
--

/*!40000 ALTER TABLE `estado_derivacion_documento_interno` DISABLE KEYS */;
INSERT INTO `estado_derivacion_documento_interno` (`id_estado_derivacion_documento_interno`,`nombre`,`descripcion`,`estado_existencia`,`fecha_creacion`) VALUES 
 (1,'DERIVACION ABIERTA','PENDIENTE DE RECEPCION',1,'2014-03-31'),
 (2,'DERIVACION CERRADA','DEBIDAMENTE RECEPCIONADA',1,'2014-03-31');
/*!40000 ALTER TABLE `estado_derivacion_documento_interno` ENABLE KEYS */;


--
-- Definition of table `estado_derivacion_registro_documentacion`
--

DROP TABLE IF EXISTS `estado_derivacion_registro_documentacion`;
CREATE TABLE `estado_derivacion_registro_documentacion` (
  `id_estado_derivacion_registro_documentacion` int(11) NOT NULL auto_increment,
  `nombre` varchar(70) NOT NULL default '',
  `descripcion` varchar(150) NOT NULL default '',
  `estado_existencia` int(2) NOT NULL,
  `fecha_creacion` date default NULL,
  PRIMARY KEY  (`id_estado_derivacion_registro_documentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estado_derivacion_registro_documentacion`
--

/*!40000 ALTER TABLE `estado_derivacion_registro_documentacion` DISABLE KEYS */;
INSERT INTO `estado_derivacion_registro_documentacion` (`id_estado_derivacion_registro_documentacion`,`nombre`,`descripcion`,`estado_existencia`,`fecha_creacion`) VALUES 
 (1,'DERIVACION ABIERTA','PENDIENTE DE RECEPCION',1,'2014-03-03'),
 (2,'DERIVACION CERRADA','DEBIDAMENTE RECEPCIONADA',1,'2014-03-03');
/*!40000 ALTER TABLE `estado_derivacion_registro_documentacion` ENABLE KEYS */;


--
-- Definition of table `estado_registro_documentacion`
--

DROP TABLE IF EXISTS `estado_registro_documentacion`;
CREATE TABLE `estado_registro_documentacion` (
  `id_estado_registro_documentacion` int(11) NOT NULL auto_increment,
  `nombre` varchar(70) NOT NULL default '',
  `descripcion` varchar(150) NOT NULL default '',
  `estado_existencia` int(2) NOT NULL,
  `fecha_creacion` date default NULL,
  PRIMARY KEY  (`id_estado_registro_documentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estado_registro_documentacion`
--

/*!40000 ALTER TABLE `estado_registro_documentacion` DISABLE KEYS */;
INSERT INTO `estado_registro_documentacion` (`id_estado_registro_documentacion`,`nombre`,`descripcion`,`estado_existencia`,`fecha_creacion`) VALUES 
 (1,'REGISTRO PENDIENTE APERTURA','TRAMITANDO EN EMILIMA',1,'2014-03-03'),
 (2,'REGISTRO ABIERTO','TRAMITANDO EN EMILIMA',1,'2014-03-03'),
 (3,'REGISTRO CERRADO','FIN DEL TRÁMITE',1,'2014-03-03');
/*!40000 ALTER TABLE `estado_registro_documentacion` ENABLE KEYS */;


--
-- Definition of table `eventos_pendietes_usuario`
--

DROP TABLE IF EXISTS `eventos_pendietes_usuario`;
CREATE TABLE `eventos_pendietes_usuario` (
  `id_eventos_pendietes_usuario` int(11) NOT NULL auto_increment,
  `id_empleado` int(11) NOT NULL,
  `proceso_lanza_vento` varchar(100) NOT NULL default '',
  `descripcion_vento` varchar(200) NOT NULL default '',
  `denominacion` varchar(100) NOT NULL default '',
  `clase_relacionada` varchar(50) NOT NULL default '',
  `bean_relacionado` varchar(50) NOT NULL default '',
  `tabla` varchar(170) NOT NULL default '',
  `id_clase_relacionada` int(11) NOT NULL,
  `fecha_creacion_sistema` date default NULL,
  PRIMARY KEY  (`id_eventos_pendietes_usuario`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `eventos_pendietes_usuario_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `eventos_pendietes_usuario`
--

/*!40000 ALTER TABLE `eventos_pendietes_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventos_pendietes_usuario` ENABLE KEYS */;


--
-- Definition of table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
CREATE TABLE `grupo` (
  `id_grupo` int(11) NOT NULL auto_increment,
  `nombre_grupo` varchar(100) NOT NULL default '',
  `descripcion_grupo` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grupo`
--

/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` (`id_grupo`,`nombre_grupo`,`descripcion_grupo`) VALUES 
 (1,'admin','Administradores'),
 (2,'asistenteAdministrativo','ASISTENTES'),
 (3,'mesaPartes','MESA DE PARTES');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;


--
-- Definition of table `grupo_usuario`
--

DROP TABLE IF EXISTS `grupo_usuario`;
CREATE TABLE `grupo_usuario` (
  `id_grupo_usuario` int(11) NOT NULL auto_increment,
  `id_grupo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `estado_existencia` int(2) NOT NULL default '1',
  PRIMARY KEY  (`id_grupo_usuario`),
  KEY `id_grupo` (`id_grupo`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `grupo_usuario_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`),
  CONSTRAINT `grupo_usuario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grupo_usuario`
--

/*!40000 ALTER TABLE `grupo_usuario` DISABLE KEYS */;
INSERT INTO `grupo_usuario` (`id_grupo_usuario`,`id_grupo`,`id_usuario`,`estado_existencia`) VALUES 
 (1,1,1,1),
 (2,2,1,2),
 (3,2,2,1),
 (4,2,3,1),
 (5,2,4,1),
 (6,2,5,1),
 (7,2,6,1),
 (8,2,7,1),
 (9,2,8,1),
 (10,2,9,1),
 (11,2,10,1),
 (12,2,11,1),
 (13,2,12,1),
 (14,2,13,1),
 (15,2,14,1),
 (16,2,15,1),
 (17,2,16,1),
 (18,2,17,1),
 (19,2,18,1),
 (20,2,19,1),
 (21,2,20,1),
 (22,2,21,1),
 (23,2,22,1),
 (24,2,23,1),
 (25,3,24,1),
 (26,2,25,1),
 (27,2,26,1),
 (28,2,27,1),
 (29,2,28,1),
 (30,2,29,1),
 (31,2,30,1),
 (32,2,31,1),
 (33,3,32,1),
 (34,2,33,1),
 (35,3,34,1),
 (36,2,35,1),
 (37,3,36,1),
 (38,2,37,1),
 (39,2,38,1),
 (40,2,39,1),
 (41,2,40,1),
 (42,2,41,1),
 (43,2,43,1),
 (44,2,44,1),
 (45,2,45,1),
 (46,2,46,1),
 (47,2,47,1),
 (48,2,49,1),
 (49,2,50,1),
 (50,2,51,1),
 (51,2,52,1),
 (52,2,53,1),
 (53,2,69,1),
 (54,2,70,1),
 (55,2,71,1),
 (56,2,56,1),
 (57,2,72,1),
 (58,2,11,1),
 (59,2,74,1),
 (60,2,75,1),
 (61,2,76,1),
 (62,2,86,1),
 (63,2,87,1),
 (64,2,88,1),
 (65,2,89,1),
 (66,1,90,1),
 (67,3,92,1),
 (68,3,91,1);
/*!40000 ALTER TABLE `grupo_usuario` ENABLE KEYS */;


--
-- Definition of table `inmueble`
--

DROP TABLE IF EXISTS `inmueble`;
CREATE TABLE `inmueble` (
  `id_inmueble` int(11) NOT NULL auto_increment,
  `direccion` varchar(400) NOT NULL default '',
  `nombre` varchar(300) NOT NULL default '',
  `marquezi` varchar(30) NOT NULL default '',
  `estado_existencia` int(2) NOT NULL,
  `fecha_creacion` date default NULL,
  PRIMARY KEY  (`id_inmueble`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inmueble`
--

/*!40000 ALTER TABLE `inmueble` DISABLE KEYS */;
INSERT INTO `inmueble` (`id_inmueble`,`direccion`,`nombre`,`marquezi`,`estado_existencia`,`fecha_creacion`) VALUES 
 (1,'SELECCIONAR','','',1,'2014-03-03');
/*!40000 ALTER TABLE `inmueble` ENABLE KEYS */;


--
-- Definition of table `interesado_registro`
--

DROP TABLE IF EXISTS `interesado_registro`;
CREATE TABLE `interesado_registro` (
  `id_interesado_registro` int(11) NOT NULL auto_increment,
  `nombre` varchar(300) NOT NULL default '',
  `denominacion` varchar(20) NOT NULL default '',
  `codificacion` varchar(20) NOT NULL default '',
  `estado_existencia` int(2) NOT NULL,
  `fecha_creacion` date default NULL,
  `direccion` varchar(300) NOT NULL default '',
  `telefono` varchar(150) NOT NULL default '',
  PRIMARY KEY  (`id_interesado_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `interesado_registro`
--

/*!40000 ALTER TABLE `interesado_registro` DISABLE KEYS */;
INSERT INTO `interesado_registro` (`id_interesado_registro`,`nombre`,`denominacion`,`codificacion`,`estado_existencia`,`fecha_creacion`,`direccion`,`telefono`) VALUES 
 (1,'NO APLICABLE','000','000000',1,'2014-03-03','',''),
 (2,'ALCALDIA DE LIMA  (ALCALDESA )','001','000021',1,'2014-03-03','',''),
 (3,'ASAMBLEA NACIONAL DE RECTORES','001','000001',1,'2014-03-03','',''),
 (4,'AUTORIDAD MUNICIPAL DE LOS PANTANOS DE VILLA','002','000001',1,'2014-03-03','',''),
 (5,'BANCO CENTRAL DE RESERVA DEL PERÚ (BCRP)','002','000002',1,'2014-03-03','',''),
 (6,'CAJA METROPOLITANA DE LIMA','003','000005',1,'2014-03-03','',''),
 (7,'CONGRESO DE LA REPÚBLICA','001','000002',1,'2014-03-03','',''),
 (8,'CONSEJO NACIONAL DE LA MAGISTRATURA (CNM)','003','000001',1,'2014-03-03','',''),
 (9,'CONTRALORÍA GENERAL DE LA REPÚBLICA (CGR)','011','000001',1,'2014-03-03','',''),
 (10,'CORTE SUPERIOR','002','000017',1,'2014-03-03','',''),
 (11,'CORTE SUPREMA','001','000003',1,'2014-03-03','',''),
 (12,'DEFENSORÍA DEL PUEBLO (DP)','004','000001',1,'2014-03-03','',''),
 (13,'EMPRESA MUNICIPAL ADMINISTRADORA DE PEJAE DE LIMA EMAPE','004','000001',1,'2014-03-03','',''),
 (14,'EMPRESA MUNICIPAL DE MERCADOS EMMSA ','005','000001',1,'2014-03-03','',''),
 (15,'EMPRESA NACIONAL DE LA COCA S.A (ENACO S.A)','005','000003',1,'2014-03-03','',''),
 (16,'ESCUELA SUPERIOR AUTÓNOMA DE BELLAS ARTES \"DIEGO QUISPE TITO\" DEL CUSCO (ESABAC)','006','000001',1,'2014-03-03','',''),
 (17,'FEDERACIÓN PERUANA DE CAJAS MUNICIPALES DE AHORRO Y CRÉDITO (FEPC)','007','000001',1,'2014-03-03','',''),
 (18,'FONDO METROPOLITANO DE INVERSIONES INVERMET','006','000001',1,'2014-03-03','',''),
 (19,'FUERO MILITAR POLICIAL (EX - CONSEJO SUPREMO DE JUSTICIA MILITAR) (FMP)','008','000001',1,'2014-03-03','',''),
 (20,'GERENCIA DE ADMINISTRACION ','011','000027',1,'2014-03-03','',''),
 (21,'GERENCIA DE ASUNTO JURIDICOS','020','000015',1,'2014-03-03','',''),
 (22,'GERENCIA DE COMUNICACION SOCIAL Y RELACIONES PUBLICAS','008','000016',1,'2014-03-03','',''),
 (23,'GERENCIA DE CULTURA','050','000006',1,'2014-03-03','',''),
 (24,'GERENCIA DE DEFENSA AL CIUDADANO','049','000003',1,'2014-03-03','',''),
 (25,'GERENCIA DE DESARROLLO ECONOMICO','044','000009',1,'2014-03-03','',''),
 (26,'GERENCIA DE DESARROLLO SOCIAL','051','000008',1,'2014-03-03','',''),
 (27,'GERENCIA DE DESARROLLO URBANO','029','000005',1,'2014-03-03','',''),
 (28,'GERENCIA DE EDUCACION Y DEPORTE','038','000001',1,'2014-03-03','',''),
 (29,'GERENCIA DE FINANZAS','015','000032',1,'2014-03-03','',''),
 (30,'GERENCIA DE FISCALIZACION Y CONTROL','059','000001',1,'2014-03-03','',''),
 (31,'GERENCIA DE GESTION INMOBILIARIA','900','000002',1,'2014-03-03','',''),
 (32,'GERENCIA DE PARTICIPACION VECINAL','041','000004',1,'2014-03-03','',''),
 (33,'GERENCIA DE PLANIFICACION','024','000004',1,'2014-03-03','',''),
 (34,'GERENCIA DE PROMOCION DE LA INVERSION PRIVADA GPIP','063','000002',1,'2014-03-03','',''),
 (35,'GERENCIA DE PROYECTOS','800','000001',1,'2014-03-03','',''),
 (36,'GERENCIA DE SEGURIDAD CIUDADANA','056','000001',1,'2014-03-03','',''),
 (37,'GERENCIA DE SERVICIOS A LA CIUDAD','052','000005',1,'2014-03-03','',''),
 (38,'GERENCIA DE TRANSPORTE URBANO','033','000002',1,'2014-03-03','',''),
 (39,'GERENCIA GENERAL','200','000002',1,'2014-03-03','',''),
 (40,'GERENCIA MUNICIPAL METROPOLITANA','002','000033',1,'2014-03-03','',''),
 (41,'GOBIERNO REGIONAL DE AMAZONAS','001','000001',1,'2014-03-03','',''),
 (42,'GOBIERNO REGIONAL DE ANCASH','002','000002',1,'2014-03-03','',''),
 (43,'GOBIERNO REGIONAL DE APURIMAC','003','000001',1,'2014-03-03','',''),
 (44,'GOBIERNO REGIONAL DE AREQUIPA','004','000001',1,'2014-03-03','',''),
 (45,'GOBIERNO REGIONAL DE AYACUCHO','005','000001',1,'2014-03-03','',''),
 (46,'GOBIERNO REGIONAL DE CAJAMARCA','007','000002',1,'2014-03-03','',''),
 (47,'GOBIERNO REGIONAL DE CALLAO','006','000001',1,'2014-03-03','',''),
 (48,'GOBIERNO REGIONAL DE CUSCO','008','000001',1,'2014-03-03','',''),
 (49,'GOBIERNO REGIONAL DE HUANCAVELICA','009','000001',1,'2014-03-03','',''),
 (50,'GOBIERNO REGIONAL DE HUÁNUCO','010','000001',1,'2014-03-03','',''),
 (51,'GOBIERNO REGIONAL DE ICA','011','000001',1,'2014-03-03','',''),
 (52,'GOBIERNO REGIONAL DE JUNÍN','012','000001',1,'2014-03-03','',''),
 (53,'GOBIERNO REGIONAL DE LA LIBERTAD','013','000001',1,'2014-03-03','',''),
 (54,'GOBIERNO REGIONAL DE LAMBAYEQUE','014','000001',1,'2014-03-03','',''),
 (55,'GOBIERNO REGIONAL DE LIMA','015','000001',1,'2014-03-03','',''),
 (56,'GOBIERNO REGIONAL DE LORETO','016','000001',1,'2014-03-03','',''),
 (57,'GOBIERNO REGIONAL DE MADRE DE DIOS','017','000001',1,'2014-03-03','',''),
 (58,'GOBIERNO REGIONAL DE MOQUEGUA','018','000001',1,'2014-03-03','',''),
 (59,'GOBIERNO REGIONAL DE PASCO','019','000001',1,'2014-03-03','',''),
 (60,'GOBIERNO REGIONAL DE PIURA','020','000001',1,'2014-03-03','',''),
 (61,'GOBIERNO REGIONAL DE PUNO','021','000001',1,'2014-03-03','',''),
 (62,'GOBIERNO REGIONAL DE SAN MARTIN','022','000001',1,'2014-03-03','',''),
 (63,'GOBIERNO REGIONAL DE TACNA','023','000001',1,'2014-03-03','',''),
 (64,'GOBIERNO REGIONAL DE TUMBES','024','000001',1,'2014-03-03','',''),
 (65,'GOBIERNO REGIONAL DE UCAYALI','025','000001',1,'2014-03-03','',''),
 (66,'INSTITUTO CATASTRAL DE LIMA - ICL','008','000001',1,'2014-03-03','',''),
 (67,'INSTITUTO DE INVESTIGACIONES DE LA AMAZONIA PERUANA (IIAP)','009','000002',1,'2014-03-03','',''),
 (68,'INSTITUTO METROPOLITANO  DE LIMA PROTRANSPORTE','010','000001',1,'2014-03-03','',''),
 (69,'INSTITUTO METROPOLITANO DE PLANIFICACION','007','000001',1,'2014-03-03','',''),
 (70,'JURADO NACIONAL DE ELECCIONES (JNE)','010','000002',1,'2014-03-03','',''),
 (71,'JUZGADOS CIVILES','004','000001',1,'2014-03-03','',''),
 (72,'JUZGADOS LABORALES','005','000002',1,'2014-03-03','',''),
 (73,'JUZGADOS PENALES','003','000001',1,'2014-03-03','',''),
 (74,'MINISTERIO DE AGRICULTURA','016','000001',1,'2014-03-03','',''),
 (75,'MINISTERIO DE COMERCIO EXTERIOR Y TURISMO','004','000002',1,'2014-03-03','',''),
 (76,'MINISTERIO DE CULTURA','003','000003',1,'2014-03-03','',''),
 (77,'MINISTERIO DE DEFENSA','013','000001',1,'2014-03-03','',''),
 (78,'MINISTERIO DE DESARROLLO E INCLUSIÓN SOCIAL','002','000002',1,'2014-03-03','',''),
 (79,'MINISTERIO DE ECONOMÍA Y FINANZAS','011','000003',1,'2014-03-03','',''),
 (80,'MINISTERIO DE EDUCACIÓN','010','000001',1,'2014-03-03','',''),
 (81,'MINISTERIO DE ENERGÍA Y MINAS','014','000001',1,'2014-03-03','',''),
 (82,'MINISTERIO DE INTERIOR','017','000001',1,'2014-03-03','',''),
 (83,'MINISTERIO DE JUSTICIA','012','000001',1,'2014-03-03','',''),
 (84,'MINISTERIO DE LA MUJER Y POBLACIONES VULNERABLES','009','000002',1,'2014-03-03','',''),
 (85,'MINISTERIO DE LA PRODUCCIÓN (INDUSTRIA Y PESQUERÍA)','006','000001',1,'2014-03-03','',''),
 (86,'MINISTERIO DE RELACIONES EXTERIORES','005','000001',1,'2014-03-03','',''),
 (87,'MINISTERIO DE SALUD','008','000001',1,'2014-03-03','',''),
 (88,'MINISTERIO DE TRABAJO Y PROMOCIÓN DEL EMPLEO','007','000001',1,'2014-03-03','',''),
 (89,'MINISTERIO DE TRANSPORTES Y COMUNICACIONES','019','000002',1,'2014-03-03','',''),
 (90,'MINISTERIO DE VIVIENDA, CONSTRUCCIÓN Y SANEAMIENTO','018','000005',1,'2014-03-03','',''),
 (91,'MINISTERIO DEL AMBIENTE','015','000002',1,'2014-03-03','',''),
 (92,'MINISTERIO PÚBLICO FISCALÍA DE LA NACIÓN (MPFN)','012','000001',1,'2014-03-03','',''),
 (93,'MUNIC.DISTR.DE ANCÓN','002','000001',1,'2014-03-03','',''),
 (94,'MUNIC.DISTR.DE ATE','001','000001',1,'2014-03-03','',''),
 (95,'MUNIC.DISTR.DE BARRANCO ','003','000001',1,'2014-03-03','',''),
 (96,'MUNIC.DISTR.DE BREÑA ','004','000002',1,'2014-03-03','',''),
 (97,'MUNIC.DISTR.DE CARABAYLLO','005','000002',1,'2014-03-03','',''),
 (98,'MUNIC.DISTR.DE CHACLACAYO ','008','000001',1,'2014-03-03','',''),
 (99,'MUNIC.DISTR.DE CHORRILLOS ','009','000001',1,'2014-03-03','',''),
 (100,'MUNIC.DISTR.DE CIENEGUILLA ','006','000001',1,'2014-03-03','',''),
 (101,'MUNIC.DISTR.DE COMAS ','007','000001',1,'2014-03-03','',''),
 (102,'MUNIC.DISTR.DE EL AGUSTINO ','010','000001',1,'2014-03-03','',''),
 (103,'MUNIC.DISTR.DE INDEPENDENCIA ','011','000001',1,'2014-03-03','',''),
 (104,'MUNIC.DISTR.DE JESUSMARIA ','012','000001',1,'2014-03-03','',''),
 (105,'MUNIC.DISTR.DE LAMOLINA ','013','000008',1,'2014-03-03','',''),
 (106,'MUNIC.DISTR.DE LAVICTORIA ','014','000001',1,'2014-03-03','',''),
 (107,'MUNIC.DISTR.DE LINCE ','015','000001',1,'2014-03-03','',''),
 (108,'MUNIC.DISTR.DE LOS OLIVOS ','016','000002',1,'2014-03-03','',''),
 (109,'MUNIC.DISTR.DE LURIN ','017','000001',1,'2014-03-03','',''),
 (110,'MUNIC.DISTR.DE MAGDALENA DEL MAR ','018','000001',1,'2014-03-03','',''),
 (111,'MUNIC.DISTR.DE MIRAFLORES ','019','000001',1,'2014-03-03','',''),
 (112,'MUNIC.DISTR.DE PACHACAMAC ','020','000001',1,'2014-03-03','',''),
 (113,'MUNIC.DISTR.DE PUCUSANA','021','000001',1,'2014-03-03','',''),
 (114,'MUNIC.DISTR.DE PUCUSANA','022','000001',1,'2014-03-03','',''),
 (115,'MUNIC.DISTR.DE PUEBLOLIBRE ','023','000001',1,'2014-03-03','',''),
 (116,'MUNIC.DISTR.DE PUENTE PIEDRA ','024','000001',1,'2014-03-03','',''),
 (117,'MUNIC.DISTR.DE PUNTA HERMOSA ','025','000001',1,'2014-03-03','',''),
 (118,'MUNIC.DISTR.DE PUNTA NEGRA ','026','000001',1,'2014-03-03','',''),
 (119,'MUNIC.DISTR.DE RIMAC ','027','000001',1,'2014-03-03','',''),
 (120,'MUNIC.DISTR.DE SAN BARTOLO ','028','000001',1,'2014-03-03','',''),
 (121,'MUNIC.DISTR.DE SAN BORJA ','029','000001',1,'2014-03-03','',''),
 (122,'MUNIC.DISTR.DE SAN ISIDRO ','030','000001',1,'2014-03-03','',''),
 (123,'MUNIC.DISTR.DE SAN JUAN DE LURIGANCHO ','031','000002',1,'2014-03-03','',''),
 (124,'MUNIC.DISTR.DE SAN JUAN DE MIRAFLORES ','032','000001',1,'2014-03-03','',''),
 (125,'MUNIC.DISTR.DE SAN LUIS ','033','000001',1,'2014-03-03','',''),
 (126,'MUNIC.DISTR.DE SAN MARTÍN DEPORRES ','034','000002',1,'2014-03-03','',''),
 (127,'MUNIC.DISTR.DE SAN MIGUEL ','035','000002',1,'2014-03-03','',''),
 (128,'MUNIC.DISTR.DE SANTA ANITA ','036','000001',1,'2014-03-03','',''),
 (129,'MUNIC.DISTR.DE SANTA MARÍA DEL MAR ','038','000001',1,'2014-03-03','',''),
 (130,'MUNIC.DISTR.DE SANTA ROSA','037','000001',1,'2014-03-03','',''),
 (131,'MUNIC.DISTR.DE SANTIAGO DE SURCO ','039','000004',1,'2014-03-03','',''),
 (132,'MUNIC.DISTR.DE SURQUILLO','040','000001',1,'2014-03-03','',''),
 (133,'MUNIC.DISTR.DE VILLA EL SALVADOR ','041','000001',1,'2014-03-03','',''),
 (134,'MUNIC.DISTR.DE VILLA MARÍA DEL TRIUNFO ','042','000001',1,'2014-03-03','',''),
 (135,'OFICINA CENTRAL DE LUCHA CONTRA LA FALSIFICACIÓN DE NUMERARIO (OCN)','013','000001',1,'2014-03-03','',''),
 (136,'OFICINA DE ASESORIA JURIDICA','510','000001',1,'2014-03-03','',''),
 (137,'OFICINA DE CONTABILIDAD Y FINANZAS','710','000001',1,'2014-03-03','',''),
 (138,'OFICINA DE LOGISTICA Y SERVICIOS GENERALES','740','000001',1,'2014-03-03','',''),
 (139,'OFICINA DE RECURSOS HUMANOS','720','000002',1,'2014-03-03','',''),
 (140,'OFICINA DE SECRETARIA GENERAL','600','000001',1,'2014-03-03','',''),
 (141,'OFICINA DE TECNOLOGÍA INFORMACIÓN Y COMUNICACIÓN','730','000001',1,'2014-03-03','',''),
 (142,'OFICINA GENERAL DE ADMINISTRACIÓN Y FINANZAS','700','000001',1,'2014-03-03','',''),
 (143,'OFICINA GENERAL DE ASUNTOS LEGALES','500','000001',1,'2014-03-03','',''),
 (144,'OFICINA GENERAL DE CONTROL INSTITUCIONAL ','007','000136',1,'2014-03-03','',''),
 (145,'OFICINA GENERAL DE PLANIFICACION PRESUPUESTO Y ','400','000001',1,'2014-03-03','',''),
 (146,'OFICINA NACIONAL DE PROCESOS ELECTORALES (ONPE)','014','000001',1,'2014-03-03','',''),
 (147,'ORGANO DE CONTROL INTERNO','300','000001',1,'2014-03-03','',''),
 (148,'PARQUE DE LAS LEYENDAS','013','000001',1,'2014-03-03','',''),
 (149,'PERSONA JURIDICA','001','000111',1,'2014-03-03','',''),
 (150,'PERSONA NATURAL','001','000116',1,'2014-03-03','',''),
 (151,'PRESIDENCIA DEL CONSEJO DE MINISTROS','001','000008',1,'2014-03-03','',''),
 (152,'PRESIDENCIA DIRECTORIO','100','000001',1,'2014-03-03','',''),
 (153,'PROCURADURIA PUBLICA MUNICIPAL','023','000015',1,'2014-03-03','',''),
 (154,'PROGRAMA DE GOBIERNO REGIONAL DE LIMA METROPOLITANA ','026','000001',1,'2014-03-03','',''),
 (155,'PROGRAMA MUNICIPAL PARA LA RECUPERACION DEL CENTRO HISTORICO DE LIMA  PROLIMA','009','000003',1,'2014-03-03','',''),
 (156,'PROYECTO COSTA VERDE ','011','000001',1,'2014-03-03','',''),
 (157,'PROYECTO ESPECIAL METROPOLITANA DE TRANSPORTE NO MOTORIZADO','001','000001',1,'2014-03-03','',''),
 (158,'REGISTRO NACIONAL DE IDENTIFICACIÓN Y ESTADO CIVIL (RENIEC)','015','000031',1,'2014-03-03','',''),
 (159,'SECRETARIA GENERAL DEL CONCEJO','003','000051',1,'2014-03-03','',''),
 (160,'SERVICIOS DE ADMINISTRACION TRIBUTARIA SAT','015','000003',1,'2014-03-03','',''),
 (161,'SERVICIOS DE PARQUES DE LIMA  SERPAR','012','000003',1,'2014-03-03','',''),
 (162,'SISTEMA METROPOLITANO DE LA SOLIDARIDAD SISOL','014','000001',1,'2014-03-03','',''),
 (163,'SUBGERENCIA DE ADMINISTRACION PROMOCION Y DESARR.INMOBILIARIO','920','000001',1,'2014-03-03','',''),
 (164,'SUB GERENCIA DE EJECUCION DE OBRAS','830','000001',1,'2014-03-03','',''),
 (165,'SUB GERENCIA DE ESTUDIOS Y PROYECTOS','820','000001',1,'2014-03-03','',''),
 (166,'SUB GERENCIA DE PRE - INVERSIÓN','810','000001',1,'2014-03-03','',''),
 (167,'SUBGERENCIA DE SANEAMIENTO INMOBILIARIO','910','000001',1,'2014-03-03','',''),
 (168,'SUBGERENCIA DE ADJUDICACION Y SANEAMIENTO LEGAL DE TIERRAS','031','000001',1,'2014-03-03','',''),
 (169,'SUBGERENCIA DE APOYO A COMISIONES','005','000064',1,'2014-03-03','',''),
 (170,'SUBGERENCIA DE ASUNTO ADMINISTRATIVOS DE LA CORPORACION ','021','000034',1,'2014-03-03','',''),
 (171,'SUBGERENCIA DE AUTORIZACIONES COMERCIALES ','046','000001',1,'2014-03-03','',''),
 (172,'SUBGERENCIA DE AUTORIZACIONES URBANAS ','032','000007',1,'2014-03-03','',''),
 (173,'SUBGERENCIA DE BIENESTAR SOCIAL','034','000001',1,'2014-03-03','',''),
 (174,'SUBGERENCIA DE CONTABILIDAD ','019','000004',1,'2014-03-03','',''),
 (175,'SUBGERENCIA DE CONTROL Y SANCIONES','062','000001',1,'2014-03-03','',''),
 (176,'SUBGERENCIA DE COOPERACION TECNICA INTERNACIONAL ','027','000001',1,'2014-03-03','',''),
 (177,'SUBGERENCIA DE DEFENSA CIVIL','058','000003',1,'2014-03-03','',''),
 (178,'SUBGERENCIA DE DEPORTE Y RECREACION \"DEPORLIMA\"','040','000001',1,'2014-03-03','',''),
 (179,'SUBGERENCIA DE DESARROLLO INSTITUCIONAL ','026','000001',1,'2014-03-03','',''),
 (180,'SUBGERENCIA DE DESARROLLO PRODUCTIVO ','047','000002',1,'2014-03-03','',''),
 (181,'SUBGERENCIA DE EDUCACION','039','000001',1,'2014-03-03','',''),
 (182,'SUBGERENCIA DE EVENTOS Y PROTOCOLO','009','000052',1,'2014-03-03','',''),
 (183,'SUBGERENCIA DE GESTION  DE CONTRATOS CON PARTICIPACION PRIVADA','065','000001',1,'2014-03-03','',''),
 (184,'SUBGERENCIA DE INFORMATICA','028','000001',1,'2014-03-03','',''),
 (185,'SUBGERENCIA DE INVERSION PUBLICA','066','000001',1,'2014-03-03','',''),
 (186,'SUBGERENCIA DE INVESTIGACION Y DIFUSION ','060','000001',1,'2014-03-03','',''),
 (187,'SUBGERENCIA DE LA PEQUEÑA Y MICROEMPRESA ','045','000001',1,'2014-03-03','',''),
 (188,'SUBGERENCIA DE LOGISTICA CORPORATIVA','012','000005',1,'2014-03-03','',''),
 (189,'SUBGERENCIA DE OPERACIONES ','064','000001',1,'2014-03-03','',''),
 (190,'SUBGERENCIA DE OPERACIONES AMBIENTALES','053','000001',1,'2014-03-03','',''),
 (191,'SUBGERENCIA DE OPERACIONES DE FISCALIZACION','061','000001',1,'2014-03-03','',''),
 (192,'SUBGERENCIA DE OPERACIONES DE SEGURIDAD','057','000001',1,'2014-03-03','',''),
 (193,'SUBGERENCIA DE ORGANIZACIÓN VECINAL','042','000003',1,'2014-03-03','',''),
 (194,'SUBGERENCIA DE ORGANIZACIONES JUVENILES','043','000001',1,'2014-03-03','',''),
 (195,'SUBGERENCIA DE PERSONAL','013','000010',1,'2014-03-03','',''),
 (196,'SUBGERENCIA DE PLANEAMIENTO FINANCIERO ','017','000017',1,'2014-03-03','',''),
 (197,'SUBGERENCIA DE PLANEAMIENTO Y HABILITACIONES URBANAS','030','000003',1,'2014-03-03','',''),
 (198,'SUBGERENCIA DE PLANES Y PROGRAMAS CORPORATIVA','025','000008',1,'2014-03-03','',''),
 (199,'SUBGERENCIA DE PRENSA Y COMUNICACIONES','010','000003',1,'2014-03-03','',''),
 (200,'SUBGERENCIA DE PRESUPUESTO','018','000003',1,'2014-03-03','',''),
 (201,'SUBGERENCIA DE PROMOCION SOCIAL','036','000001',1,'2014-03-03','',''),
 (202,'SUBGERENCIA DE REGISTROS CIVILES','055','000001',1,'2014-03-03','',''),
 (203,'SUBGERENCIA DE SANIDAD','035','000001',1,'2014-03-03','',''),
 (204,'SUBGERENCIA DE SERVICIOS GENERALES','014','000006',1,'2014-03-03','',''),
 (205,'SUBGERENCIA DE SISTEMATIZACIÓN LEGAL Y RECLAMOS','022','000001',1,'2014-03-03','',''),
 (206,'SUBGERENCIA DE TESORERIA','016','000021',1,'2014-03-03','',''),
 (207,'SUBGERENCIA DE TRAMITE DOCUMENTARIO','006','000012',1,'2014-03-03','',''),
 (208,'SUBGERENCIA DE TURISMO','067','000011',1,'2014-03-03','',''),
 (209,'SUBGERENCIA DEL MEDIO AMBIENTE','054','000001',1,'2014-03-03','',''),
 (210,'SUBSECRETARIO GENERAL DEL CONCEJO','004','000001',1,'2014-03-03','',''),
 (211,'SUGGERENCIA DE VASO DE LECHE','037','000001',1,'2014-03-03','',''),
 (212,'SUPERINTENDENCIA DE BANCA, SEGUROS Y ADMINISTRADORAS PRIVADAS DE FONDOS DE PENSIONES (SBS)','016','000001',1,'2014-03-03','',''),
 (213,'TRIBUNAL CONSTITUCIONAL (TC)','017','000001',1,'2014-03-03','',''),
 (214,'GERENCIA DE AMBIENTE','068','000002',1,'2014-03-03','',''),
 (215,'Subgerencia de Trabajo y Promocion del Empleo','069','000002',1,'2014-03-03','',''),
 (216,'SUBGERENCIA DE PLANEAMIENTO FINANCIERO CORPORATIVO','070','000002',1,'2014-03-03','',''),
 (217,'PRESIDENTA DE LA COMISION ESPECIAL DE PROCESOS ADMINISTRATIVOS DISCIPLINARIOS','071','000003',1,'2014-03-03','',''),
 (218,'COMISION MIXTA DEL PARQUE INDUSTRIAL DE LIMA NORTE','072','000002',1,'2014-03-03','',''),
 (219,'GERENCIA DE LA MUJER','073','000002',1,'2014-03-03','',''),
 (220,'XZY','020','000001',1,'2014-03-03','',''),
 (221,'REGIDOR METROPOLITANO','074','000002',1,'2014-03-03','',''),
 (222,'GERENCIA DE SALUD','','000001',1,'2014-03-18','',''),
 (223,'SUBGERENCIA REGIONAL DE RECURSOS NATURALES Y MEDIO AMBIENTE ','','000001',1,'2014-03-20','',''),
 (224,'SUBGERENCIA DE PROGRAMAS ALIMENTARIOS','','000001',1,'2014-03-20','',''),
 (225,'CAFAE - EMPLEADOS - MML','','000001',1,'2014-03-20','',''),
 (226,'CABILDO METROPOLITANO DE LIMA','','000001',1,'2014-03-26','',''),
 (227,'COMISION METROPOLITANA DE ASUNTOS ECONOMICOS Y ORGANIZACION','','000001',1,'2014-03-31','',''),
 (228,'SUBGERENCIA DE PLANEAMIENTO CORPORATIVO ','','000001',1,'2014-04-02','',''),
 (229,'SUBGERENCIA DE PROMOCION Y PROTECCION  DE LAS PERSONAS CON DISCAPACIDAD','','000001',1,'2014-04-04','',''),
 (230,'SUBGERENCIA DE INGENERIA DE TRANSITO','','000001',1,'2014-04-04','',''),
 (231,'SUBGERENCIA DE RENOVACION URBANA','','000001',1,'2014-04-07','',''),
 (232,'SITRAPGRLM - MML','','000001',1,'2014-04-08','',''),
 (233,'SUBGERENCIA DE OPERACIONES DE SEGURIDAD','','000001',1,'2014-04-25','',''),
 (234,'COMITE MULTISECTORIAL DE PREVENCION DEL CONSUMO DE DROGAS EN LIMA METROPOLITANA','','000001',1,'2014-05-06','',''),
 (235,'SUBGERENCIA REGIONAL DE INFRAESTRUCTURA ','','000001',1,'2014-05-29','',''),
 (236,'MUNICIPALIDAD DISTRITAL DE CERRO COLORADO-AREQUIPA','','000001',1,'2014-06-24','',''),
 (237,'PODER JUDICIAL DEL PERU','','000001',1,'2014-06-26','',''),
 (238,'ASESORIA DE GERENCIA MUNICIPAL METROPOLITANA','','000001',1,'2014-06-30','',''),
 (239,'SUPERINTENDENCIA NACIONAL DE ADUANAS Y DE ADMINISTRACION TRIBUTARIA','','000001',1,'2014-07-03','',''),
 (240,'SUBGERENCIA DE PROMOCIÓN DE LA SALUD','','000001',1,'2014-07-07','',''),
 (241,'PROGRAMA MUNICIPAL DE VIVIENDA POPULAR ','','000001',1,'2014-08-20','',''),
 (242,'PARQUE DE LA RESERVA ','','000001',1,'2014-08-28','-','-'),
 (243,'PODER JUDICIAL','','000001',1,'2014-09-10','',''),
 (244,'CONGRESO DE LA REPUBLICA','','000001',1,'2014-09-10','',''),
 (245,'POLICIA NACIONAL DEL PERU','','000001',1,'2014-10-06','',''),
 (246,'SUBGERENCIA DE TECNOLOGIAS DE LA INFORMACION','','000001',1,'2014-11-12','','');
/*!40000 ALTER TABLE `interesado_registro` ENABLE KEYS */;


--
-- Definition of table `motorizado`
--

DROP TABLE IF EXISTS `motorizado`;
CREATE TABLE `motorizado` (
  `id_motorizado` int(11) NOT NULL auto_increment,
  `nombre_conductor` varchar(250) NOT NULL default '',
  `direccion` varchar(350) NOT NULL default '',
  `dni` varchar(15) NOT NULL default '',
  `unidad_motorizada` varchar(350) NOT NULL default '',
  `estado_existencia` int(2) NOT NULL,
  PRIMARY KEY  (`id_motorizado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `motorizado`
--

/*!40000 ALTER TABLE `motorizado` DISABLE KEYS */;
INSERT INTO `motorizado` (`id_motorizado`,`nombre_conductor`,`direccion`,`dni`,`unidad_motorizada`,`estado_existencia`) VALUES 
 (1,'SIN MOTORIZADO','','','',1);
/*!40000 ALTER TABLE `motorizado` ENABLE KEYS */;


--
-- Definition of table `numeracion_doc_interno`
--

DROP TABLE IF EXISTS `numeracion_doc_interno`;
CREATE TABLE `numeracion_doc_interno` (
  `id_numeracion_doc_interno` int(11) NOT NULL auto_increment,
  `id_area_empresa` int(11) NOT NULL,
  `id_tipo_documento_interno` int(11) NOT NULL,
  `ultima_numeracion` int(11) NOT NULL,
  PRIMARY KEY  (`id_numeracion_doc_interno`),
  KEY `id_tipo_documento_interno` (`id_tipo_documento_interno`),
  KEY `id_area_empresa` (`id_area_empresa`),
  CONSTRAINT `numeracion_doc_interno_ibfk_1` FOREIGN KEY (`id_tipo_documento_interno`) REFERENCES `tipo_documento_interno` (`id_tipo_documento_interno`),
  CONSTRAINT `numeracion_doc_interno_ibfk_2` FOREIGN KEY (`id_area_empresa`) REFERENCES `area_empresa` (`id_area_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `numeracion_doc_interno`
--

/*!40000 ALTER TABLE `numeracion_doc_interno` DISABLE KEYS */;
INSERT INTO `numeracion_doc_interno` (`id_numeracion_doc_interno`,`id_area_empresa`,`id_tipo_documento_interno`,`ultima_numeracion`) VALUES 
 (1,2,7,0),
 (2,2,4,0),
 (3,2,13,0),
 (4,7,7,0),
 (5,7,9,0),
 (6,7,4,0),
 (7,7,6,0),
 (8,2,6,0),
 (9,2,30,0),
 (10,5,9,0),
 (11,14,6,0),
 (12,14,9,0),
 (13,11,9,0),
 (14,11,6,0),
 (15,13,9,0),
 (16,5,6,0),
 (17,5,4,0),
 (18,5,11,0),
 (19,6,9,0),
 (20,2,31,0),
 (21,2,9,0),
 (22,4,9,0),
 (23,4,6,0),
 (24,12,9,0),
 (25,21,9,0),
 (26,20,9,0),
 (27,10,9,0),
 (28,10,6,0),
 (29,10,4,0),
 (30,10,11,0),
 (31,10,7,0),
 (32,10,64,0),
 (33,21,4,0),
 (34,21,6,0),
 (35,21,73,0),
 (36,21,12,0),
 (37,18,9,0),
 (38,19,9,0),
 (39,1,7,0),
 (40,1,6,0),
 (41,1,4,0),
 (42,3,7,0),
 (43,3,6,0),
 (44,19,6,0),
 (45,19,4,0),
 (46,19,7,0),
 (47,19,11,0),
 (48,19,73,0),
 (49,12,6,0),
 (51,26,9,0),
 (52,26,7,0),
 (53,16,9,0);
/*!40000 ALTER TABLE `numeracion_doc_interno` ENABLE KEYS */;


--
-- Definition of table `prioridad`
--

DROP TABLE IF EXISTS `prioridad`;
CREATE TABLE `prioridad` (
  `id_prioridad` int(11) NOT NULL auto_increment,
  `nombre` varchar(70) NOT NULL default '',
  `descripcion` varchar(150) NOT NULL default '',
  `estado_existencia` int(2) NOT NULL,
  `fecha_creacion` date default NULL,
  PRIMARY KEY  (`id_prioridad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prioridad`
--

/*!40000 ALTER TABLE `prioridad` DISABLE KEYS */;
INSERT INTO `prioridad` (`id_prioridad`,`nombre`,`descripcion`,`estado_existencia`,`fecha_creacion`) VALUES 
 (1,'URGENTE','',1,'2014-03-03'),
 (2,'MUY URGENTE','',1,'2014-03-03'),
 (3,'NORMAL','',1,'2014-03-03'),
 (4,'RESERVADO','',1,'2014-03-03');
/*!40000 ALTER TABLE `prioridad` ENABLE KEYS */;


--
-- Definition of table `registro_documentacion`
--

DROP TABLE IF EXISTS `registro_documentacion`;
CREATE TABLE `registro_documentacion` (
  `id_registro_documentacion` int(11) NOT NULL auto_increment,
  `denominacion` varchar(15) NOT NULL default '',
  `fecha_registro_usuario` datetime NOT NULL,
  `fecha_registro_sistema` datetime NOT NULL,
  `codificacion_registro` varchar(30) NOT NULL default '',
  `asunto_registro` varchar(2000) NOT NULL default '',
  `numero_folios` int(11) NOT NULL default '0',
  `datos_remitente` varchar(300) NOT NULL default '',
  `detalle_registro` varchar(300) NOT NULL default '',
  `id_tipo_documento_interno` int(11) NOT NULL,
  `id_empleado_registra` int(11) NOT NULL,
  `id_tipo_tramite` int(11) NOT NULL,
  `estado_existencia` int(2) NOT NULL,
  `obvervaciones` varchar(300) NOT NULL default '',
  `id_prioridad` int(11) NOT NULL,
  `id_empleado_actual_encargado` int(11) NOT NULL,
  `id_estado_registro_documentacion` int(11) NOT NULL,
  `fecha_cierre_registro` datetime NOT NULL,
  `id_interesado_registro` int(11) NOT NULL,
  `id_area_empresa` int(11) NOT NULL,
  `id_tipo_proyecto` int(11) NOT NULL,
  `id_inmueble` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id_registro_documentacion`),
  KEY `id_tipo_documento_interno` (`id_tipo_documento_interno`),
  KEY `id_empleado_registra` (`id_empleado_registra`),
  KEY `id_tipo_tramite` (`id_tipo_tramite`),
  KEY `id_prioridad` (`id_prioridad`),
  KEY `id_empleado_actual_encargado` (`id_empleado_actual_encargado`),
  KEY `id_estado_registro_documentacion` (`id_estado_registro_documentacion`),
  KEY `id_interesado_registro` (`id_interesado_registro`),
  KEY `id_area_empresa` (`id_area_empresa`),
  KEY `id_tipo_proyecto` (`id_tipo_proyecto`),
  KEY `id_inmueble` (`id_inmueble`),
  CONSTRAINT `FK_id_inmueble` FOREIGN KEY (`id_inmueble`) REFERENCES `inmueble` (`id_inmueble`),
  CONSTRAINT `registro_documentacion_ibfk_1` FOREIGN KEY (`id_tipo_documento_interno`) REFERENCES `tipo_documento_interno` (`id_tipo_documento_interno`),
  CONSTRAINT `registro_documentacion_ibfk_2` FOREIGN KEY (`id_empleado_registra`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `registro_documentacion_ibfk_3` FOREIGN KEY (`id_tipo_tramite`) REFERENCES `tipo_tramite` (`id_tipo_tramite`),
  CONSTRAINT `registro_documentacion_ibfk_4` FOREIGN KEY (`id_prioridad`) REFERENCES `prioridad` (`id_prioridad`),
  CONSTRAINT `registro_documentacion_ibfk_5` FOREIGN KEY (`id_empleado_actual_encargado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `registro_documentacion_ibfk_6` FOREIGN KEY (`id_estado_registro_documentacion`) REFERENCES `estado_registro_documentacion` (`id_estado_registro_documentacion`),
  CONSTRAINT `registro_documentacion_ibfk_7` FOREIGN KEY (`id_interesado_registro`) REFERENCES `interesado_registro` (`id_interesado_registro`),
  CONSTRAINT `registro_documentacion_ibfk_8` FOREIGN KEY (`id_area_empresa`) REFERENCES `area_empresa` (`id_area_empresa`),
  CONSTRAINT `registro_documentacion_ibfk_9` FOREIGN KEY (`id_tipo_proyecto`) REFERENCES `tipo_proyecto` (`id_tipo_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=9610 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registro_documentacion`
--

/*!40000 ALTER TABLE `registro_documentacion` DISABLE KEYS */;
INSERT INTO `registro_documentacion` (`id_registro_documentacion`,`denominacion`,`fecha_registro_usuario`,`fecha_registro_sistema`,`codificacion_registro`,`asunto_registro`,`numero_folios`,`datos_remitente`,`detalle_registro`,`id_tipo_documento_interno`,`id_empleado_registra`,`id_tipo_tramite`,`estado_existencia`,`obvervaciones`,`id_prioridad`,`id_empleado_actual_encargado`,`id_estado_registro_documentacion`,`fecha_cierre_registro`,`id_interesado_registro`,`id_area_empresa`,`id_tipo_proyecto`,`id_inmueble`) VALUES 
 (1,'SIN REGISTRO','2014-03-03 00:00:00','2014-03-03 00:00:00','','',0,'','',1,1,1,1,'',1,1,2,'2014-03-03 00:00:00',1,1,1,1);
/*!40000 ALTER TABLE `registro_documentacion` ENABLE KEYS */;


--
-- Definition of table `respuesta_documento_interno`
--

DROP TABLE IF EXISTS `respuesta_documento_interno`;
CREATE TABLE `respuesta_documento_interno` (
  `respuesta_documento_interno` int(11) NOT NULL auto_increment,
  `id_documento_interno_genera` int(11) NOT NULL,
  `id_documento_interno_resultado` int(11) NOT NULL,
  `observaciones` varchar(300) NOT NULL default '',
  PRIMARY KEY  (`respuesta_documento_interno`),
  KEY `id_documento_interno_genera` (`id_documento_interno_genera`),
  KEY `id_documento_interno_resultado` (`id_documento_interno_resultado`),
  CONSTRAINT `respuesta_documento_interno_ibfk_1` FOREIGN KEY (`id_documento_interno_genera`) REFERENCES `documento_interno` (`id_documento_interno`),
  CONSTRAINT `respuesta_documento_interno_ibfk_2` FOREIGN KEY (`id_documento_interno_resultado`) REFERENCES `documento_interno` (`id_documento_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `respuesta_documento_interno`
--

/*!40000 ALTER TABLE `respuesta_documento_interno` DISABLE KEYS */;
INSERT INTO `respuesta_documento_interno` (`respuesta_documento_interno`,`id_documento_interno_genera`,`id_documento_interno_resultado`,`observaciones`) VALUES 
 (1,179,180,'');
/*!40000 ALTER TABLE `respuesta_documento_interno` ENABLE KEYS */;


--
-- Definition of table `tipo_documento_interno`
--

DROP TABLE IF EXISTS `tipo_documento_interno`;
CREATE TABLE `tipo_documento_interno` (
  `id_tipo_documento_interno` int(11) NOT NULL auto_increment,
  `nombre` varchar(100) NOT NULL default '',
  `descripcion` varchar(150) NOT NULL default '',
  `denominacion` varchar(4) NOT NULL default '',
  `estado_existencia` int(2) NOT NULL,
  `fecha_creacion` date default NULL,
  `numero_dias_atencion` int(3) NOT NULL default '30',
  PRIMARY KEY  (`id_tipo_documento_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_documento_interno`
--

/*!40000 ALTER TABLE `tipo_documento_interno` DISABLE KEYS */;
INSERT INTO `tipo_documento_interno` (`id_tipo_documento_interno`,`nombre`,`descripcion`,`denominacion`,`estado_existencia`,`fecha_creacion`,`numero_dias_atencion`) VALUES 
 (1,'NO APLICABLE','','000',1,'2014-03-03',30),
 (2,'Directiva','','010',1,'2014-03-03',30),
 (3,'Acta','','050',1,'2014-03-03',30),
 (4,'Carta','','052',1,'2014-03-03',30),
 (5,'Comunicado','','053',1,'2014-03-03',30),
 (6,'Memorando','','056',1,'2014-03-03',30),
 (7,'Oficio','','057',1,'2014-03-03',30),
 (8,'Solicitud Requerim Bienes y Servicios','','058',1,'2014-03-03',30),
 (9,'Informe','','064',1,'2014-03-03',30),
 (10,'Informe de Trabajo','','065',1,'2014-03-03',30),
 (11,'Memorando Multiple','','066',1,'2014-03-03',30),
 (12,'Prestacion Servicios/Conformid Servicios','','068',1,'2014-03-03',30),
 (13,'Carta Notarial','','069',1,'2014-03-03',30),
 (14,'Informe Administracion Parque Reserva','','070',1,'2014-03-03',30),
 (15,'Informe de Recaudaciones ','','071',1,'2014-03-03',30),
 (16,'Informe de Contabilidad ','','072',1,'2014-03-03',30),
 (17,'Informe de Operaciones ','','073',1,'2014-03-03',30),
 (18,'Informe de Imagen Institucional ','','074',1,'2014-03-03',30),
 (19,'Informe Areas Verdes ','','075',1,'2014-03-03',30),
 (20,'Informe Mantenimiento Electrio Sanitario ','','076',1,'2014-03-03',30),
 (21,'Informe Mantenimiento Electrio Mecanico ','','077',1,'2014-03-03',30),
 (22,'Informe de GestiÓn Administrativa FOMUR','','078',1,'2014-03-03',30),
 (23,'Informe del Jefe de Programa','','079',1,'2014-03-03',30),
 (24,'Memorando del Jefe de Programa','','080',1,'2014-03-03',30),
 (25,'Informe de Comité / Comisión','','081',1,'2014-03-03',30),
 (26,'Memorando de Comité / Comisión','','082',1,'2014-03-03',30),
 (27,'Informes - Otros','','083',1,'2014-03-03',30),
 (28,'Memorando - Otros','','084',1,'2014-03-03',30),
 (29,'Actas de Directorio','','101',1,'2014-03-03',30),
 (30,'Resolución de Gerencia General','','201',1,'2014-03-03',30),
 (31,'Memorando Circular','','202',1,'2014-03-03',30),
 (32,'Reglamento de Organización y funciones - ROF','','401',1,'2014-03-03',30),
 (33,'Manual de Organización y Funciones - MOF','','402',1,'2014-03-03',30),
 (34,'Cuadro para Asignación de Personal - CAP','','403',1,'2014-03-03',30),
 (35,'Manual Interno','','404',1,'2014-03-03',30),
 (36,'Plan Estratégico Institucional - PEI','','405',1,'2014-03-03',30),
 (37,'Plan Operativo Institucional - POI','','406',1,'2014-03-03',30),
 (38,'Mapa de Procesos Institucional','','407',1,'2014-03-03',30),
 (39,'Manual de Procesos','','411',1,'2014-03-03',30),
 (40,'Resolución de Oficina General de Administrac','','701',1,'2014-03-03',30),
 (41,'Reglamento Interno de Trabajo - RIT','','721',1,'2014-03-03',30),
 (42,'Presupuesto Analitico de Personal - PAP','','722',1,'2014-03-03',30),
 (43,'Actas - Proyectos de Pre Inversión','','801',1,'2014-03-03',30),
 (44,'Estudios de Pre Inversión','','802',1,'2014-03-03',30),
 (45,'Actas - Expediente Técnico','','803',1,'2014-03-03',30),
 (46,'Expediente Técnico o estudio definitivo de p','','804',1,'2014-03-03',30),
 (47,'Cuaderno de Obra','','805',1,'2014-03-03',30),
 (48,'Informe del Jefe del Proyecto/Coordinador de ','','806',1,'2014-03-03',30),
 (49,'Informe del residente de Obra','','809',1,'2014-03-03',30),
 (50,'Informe del Supervisor de Obra','','810',1,'2014-03-03',30),
 (51,'Memorando - Coordinador de obra/jefe del proy','','811',1,'2014-03-03',30),
 (52,'Acta de Reunión/Supervisión','','812',1,'2014-03-03',30),
 (53,'Informe Técnico - Estudios y Proyectos','','813',1,'2014-03-03',30),
 (54,'Informe Técnico - Pre Inversión','','830',1,'2014-03-03',30),
 (55,'Bases de las Subastas públicas','','922',1,'2014-03-03',30),
 (56,'Reporte de deudores - INFOCORP','','931',1,'2014-03-03',30),
 (57,'Proveido','','932',1,'2014-03-03',30),
 (58,'Escrito','','933',1,'2014-03-03',30),
 (59,'Oficio Circular','','934',1,'2014-03-03',30),
 (60,'Notificacion Judicial','','935',1,'2014-03-03',30),
 (61,'Carta Circular','','936',1,'2014-03-03',30),
 (62,'Circular','','937',1,'2014-03-03',30),
 (63,'Documentos Simple','','938',1,'2014-03-03',30),
 (64,'Resolucion','','939',1,'2014-03-03',30),
 (65,'CITACION','','SDN',1,'2014-03-03',30),
 (66,'CORREO ELEC.','','SDN',1,'2014-03-03',30),
 (67,'ESCRITOS JUDICIALES','','SDN',1,'2014-03-03',30),
 (68,'FAX','','SDN',1,'2014-03-03',30),
 (69,'INVITACION','','SDN',1,'2014-03-03',30),
 (70,'MEDIDA CAUTELAR','','SDN',1,'2014-03-03',30),
 (71,'NOTIFICACION (OTRAS)','','SDN',1,'2014-03-03',30),
 (72,'RECIBO','','SDN',1,'2014-03-03',30),
 (73,'REQUERIMIENTO','','SDN',1,'2014-03-03',30),
 (74,'OFICIO MULTIPLE','','SDN',1,'2014-03-03',30),
 (75,'CARTA DE AUTORIZACION','','SDN',1,'2014-03-03',30),
 (76,'DOCUMENTO SIMPLE','','SDN',1,'2014-03-03',30),
 (77,'SOLICITUD','','SDN',1,'2014-03-03',30),
 (78,'CEDULA DE NOTIFICACION','','940',1,'2014-03-18',30),
 (79,'RESOLUCION DE ALCALDIA','','',1,'2014-04-07',0),
 (80,'RESOLUCION DE INTENDENCIA ','','',1,'2014-04-21',0),
 (81,'FORMATO DE INSCRIPCION','','',1,'2014-05-12',30);
/*!40000 ALTER TABLE `tipo_documento_interno` ENABLE KEYS */;


--
-- Definition of table `tipo_empleado`
--

DROP TABLE IF EXISTS `tipo_empleado`;
CREATE TABLE `tipo_empleado` (
  `id_tipo_empleado` int(11) NOT NULL auto_increment,
  `nombre` varchar(100) NOT NULL default '',
  `descripcion` varchar(170) NOT NULL default '',
  PRIMARY KEY  (`id_tipo_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_empleado`
--

/*!40000 ALTER TABLE `tipo_empleado` DISABLE KEYS */;
INSERT INTO `tipo_empleado` (`id_tipo_empleado`,`nombre`,`descripcion`) VALUES 
 (1,'TIEMPO COMPLETO','');
/*!40000 ALTER TABLE `tipo_empleado` ENABLE KEYS */;


--
-- Definition of table `tipo_proyecto`
--

DROP TABLE IF EXISTS `tipo_proyecto`;
CREATE TABLE `tipo_proyecto` (
  `id_tipo_proyecto` int(11) NOT NULL auto_increment,
  `nombre` varchar(250) NOT NULL default '',
  `descripcion` varchar(300) NOT NULL default '',
  `estado_existencia` int(2) NOT NULL,
  `fecha_creacion` date default NULL,
  PRIMARY KEY  (`id_tipo_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_proyecto`
--

/*!40000 ALTER TABLE `tipo_proyecto` DISABLE KEYS */;
INSERT INTO `tipo_proyecto` (`id_tipo_proyecto`,`nombre`,`descripcion`,`estado_existencia`,`fecha_creacion`) VALUES 
 (1,'SELECCIONAR','SIN PROYECTO',1,'2014-03-03');
/*!40000 ALTER TABLE `tipo_proyecto` ENABLE KEYS */;


--
-- Definition of table `tipo_tramite`
--

DROP TABLE IF EXISTS `tipo_tramite`;
CREATE TABLE `tipo_tramite` (
  `id_tipo_tramite` int(11) NOT NULL auto_increment,
  `nombre` varchar(100) NOT NULL default '',
  `denominacion` varchar(4) NOT NULL default '',
  `estado_existencia` int(2) NOT NULL,
  `fecha_creacion` date default NULL,
  PRIMARY KEY  (`id_tipo_tramite`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_tramite`
--

/*!40000 ALTER TABLE `tipo_tramite` DISABLE KEYS */;
INSERT INTO `tipo_tramite` (`id_tipo_tramite`,`nombre`,`denominacion`,`estado_existencia`,`fecha_creacion`) VALUES 
 (1,'NO APLICABLE','',1,'2014-03-03'),
 (2,'Comunicaciones Diversas','EL',2,'2014-03-03'),
 (3,'Peticiones Administrativas','EL',2,'2014-03-03'),
 (4,'Invitacion Oficiales','CL',1,'2014-03-03'),
 (5,'Invitaciones Particulares','CL',1,'2014-03-03'),
 (6,'Comunicaciones Simples','CL',1,'2014-03-03'),
 (7,'Comunicaciones Notariales','CL',1,'2014-03-03'),
 (8,'Notificaciones Judiciales','CL',1,'2014-03-03'),
 (9,'Notificaciones Administrativas','CL',2,'2014-03-03'),
 (10,'Pedidos de Informacion','EL',1,'2014-03-03'),
 (11,'Pedidos Diversos','EL',2,'2014-03-03'),
 (12,'Pedidos de Informes y/u opiniones','EL',1,'2014-03-03'),
 (13,'Impugnaciones de proceso de seleccion','EL',1,'2014-03-03'),
 (14,'EMILIMA S.A. Documentos Internos ','DL',1,'2014-03-03'),
 (15,'CONOCIMIENTO','CL',2,'2014-08-05'),
 (16,'Conocimiento y Atención','EL',2,'2014-08-05'),
 (17,'Agradecimiento','',1,'2014-08-25');
/*!40000 ALTER TABLE `tipo_tramite` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL auto_increment,
  `nombre` varchar(100) NOT NULL default '',
  `password` varchar(150) NOT NULL default '',
  `id_empleado` int(11) NOT NULL,
  PRIMARY KEY  (`id_usuario`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id_usuario`,`nombre`,`password`,`id_empleado`) VALUES 
 (1,'yzavaleta','adminadmin',1),
 (2,'mflores','mflores',2),
 (3,'lrodriguez','lrodriguez',3),
 (4,'rvillacrez','rvillacrez',4),
 (5,'sredondez','sredondez',5),
 (6,'mtrelles','mtrelles',6),
 (7,'hdelaguila','hdelaguila',7),
 (8,'cvelasquez','cvelasquez',8),
 (9,'calzamora','calzamora',9),
 (10,'jampuero','jampuero',10),
 (11,'jllanos','jllanos',11),
 (12,'vdelacruz','vdelacruz',12),
 (13,'jzelada','jzelada',13),
 (14,'mesquivel','mesquivel',14),
 (15,'jcorvacho','jcorvacho',15),
 (16,'gchavez','gchavez',16),
 (17,'rperez','rperez',17),
 (18,'emori','emori',18),
 (19,'respinoza','respinoza',19),
 (20,'faraujo','faraujo',20),
 (21,'kmartinez','kmartinez',21),
 (22,'ktorrejon','ktorrejon',22),
 (23,'mcunza','mcunza',23),
 (24,'pdelcarpio','pdelcarpio',24),
 (25,'jloza','jloza',25),
 (26,'lsanchez','lsanchez',26),
 (27,'mlopez','mlopez',27),
 (28,'wcastro','wcastro',28),
 (29,'jparedes','jparedes',29),
 (30,'kmatos','kmatos',30),
 (31,'fguevara','fguevara',31),
 (32,'mgago','mgago',32),
 (33,'mhuaytalla','junior1311',33),
 (34,'nespinoza','erick',34),
 (35,'atarazona','atarazona',35),
 (36,'kgutierrez','mauricio',37),
 (37,'jrosales','jrosales',38),
 (38,'acobos','acobos',39),
 (39,'asuxe','asuxe',40),
 (40,'sperez','sperez',41),
 (41,'mmeza','mmeza',42),
 (42,'wcaballero','wcaballero',43),
 (43,'lpalomino','lpalomino',44),
 (44,'kgomez','kgomez',45),
 (45,'mquesquen','mquesquen',46),
 (46,'msiesquen','msiesquen',47),
 (47,'pureta','pureta',48),
 (48,'eolivera','eolivera',49),
 (49,'sdelcastillo','sdelcastillo',50),
 (50,'dyauri','dyauri',51),
 (51,'lgarcia','lgarcia',52),
 (52,'mcacho','mcacho',53),
 (53,'nllazaka','nllazaka',54),
 (54,'mtaype','mtaype',55),
 (55,'mtaype','mtaype',56),
 (56,'jmorales','jmorales',57),
 (57,'rmorales','rmorales',58),
 (58,'msalazar','msalazar',59),
 (59,'lsanchez','lsanchez',60),
 (60,'scornejo','scornejo',61),
 (61,'acaceres','acaceres',62),
 (62,'zaguilar','zaguilar',63),
 (63,'jamancio','jamancio',64),
 (64,'ehuamani','ehuamani',65),
 (65,'mcunza','mcunza',66),
 (66,'csarmiento','csarmiento',67),
 (67,'resquivel','resquivel',68),
 (68,'fcisneros','fcisneros',69),
 (69,'msoriano','msoriano',70),
 (70,'bmorales','bmorales',71),
 (71,'amagallanes','amagallanes',72),
 (72,'igutierrez','igutierrez',73),
 (73,'ccastillo','ccastillo',74),
 (74,'mauqui','mauqui',75),
 (75,'nbaca','nbaca',76),
 (76,'maperez','maperez',77),
 (77,'agonzales','agonzales',78),
 (78,'mvera','mvera',79),
 (79,'lzacarias','lzacarias',80),
 (80,'ptarmeño','ptarmeño',81),
 (81,'rtrelles','rtrelles',82),
 (82,'jmontesinos','jmontesinos',83),
 (83,'jhuarcaya','jhuarcaya',84),
 (84,'gdextre','gdextre',85),
 (85,'ssantana','ssantana',86),
 (86,'mmolina','mmolina',87),
 (87,'jterrones','jterrones',88),
 (88,'jperez','jperez',89),
 (89,'mhuatay','mhuatay',90),
 (90,'admin','admin',91),
 (91,'jzegarra','jzeg2015',92),
 (92,'sramirez','sram2015',93);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


--
-- Definition of function `interesadoArea`
--

DROP FUNCTION IF EXISTS `interesadoArea`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`%` FUNCTION `interesadoArea`(codificiacion TEXT) RETURNS int(11)
BEGIN
  RETURN (select id_interesado_registro from interesado_registro where denominacion=codificiacion);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of view `V_USER_ROLE`
--

DROP TABLE IF EXISTS `V_USER_ROLE`;
DROP VIEW IF EXISTS `V_USER_ROLE`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `V_USER_ROLE` AS (select `u`.`nombre` AS `USUARIO`,`u`.`password` AS `PASSWORD`,`g`.`nombre_grupo` AS `GRUPO` from (((`usuario` `u` join `grupo_usuario` `gu` on((`u`.`id_usuario` = `gu`.`id_usuario`))) join `grupo` `g` on((`g`.`id_grupo` = `gu`.`id_grupo`))) join `empleado` `e` on((`u`.`id_empleado` = `e`.`id_empleado`))) where ((`e`.`estado_existencia` = 1) and (`gu`.`estado_existencia` = 1)));



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
