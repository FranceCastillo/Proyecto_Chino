-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 23, 2014 at 06:14 pm
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `siagep_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `base_active_record_log`
--

CREATE TABLE IF NOT EXISTS `base_active_record_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `action` varchar(20) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `idModel` int(10) unsigned DEFAULT NULL,
  `field` varchar(45) DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `base_active_record_log`
--

INSERT INTO `base_active_record_log` (`id`, `description`, `action`, `model`, `idModel`, `field`, `creationdate`, `userid`) VALUES
(1, 'User admin changed desc_especialidad for Especialidades[1].', 'CHANGE', 'Especialidades', 1, 'desc_especialidad', '2014-07-23 14:52:26', 'admin'),
(2, 'User admin changed desc_especialidad for Especialidades[1].', 'CHANGE', 'Especialidades', 1, 'desc_especialidad', '2014-07-23 14:57:57', 'admin'),
(3, 'User admin changed id_user_mod for Especialidades[1].', 'CHANGE', 'Especialidades', 1, 'id_user_mod', '2014-07-23 14:57:58', 'admin'),
(4, 'User admin changed fe_user_mod for Especialidades[1].', 'CHANGE', 'Especialidades', 1, 'fe_user_mod', '2014-07-23 14:57:58', 'admin'),
(5, 'User admin created Especialidades[2].', 'CREATE', 'Especialidades', 2, '', '2014-07-23 15:01:20', 'admin'),
(6, 'User admin created Especialidades[3].', 'CREATE', 'Especialidades', 3, '', '2014-07-23 15:01:34', 'admin'),
(7, 'User admin changed nb_especialidad for Especialidades[2].', 'CHANGE', 'Especialidades', 2, 'nb_especialidad', '2014-07-23 15:03:22', 'admin'),
(8, 'User admin changed fe_user_mod for Especialidades[2].', 'CHANGE', 'Especialidades', 2, 'fe_user_mod', '2014-07-23 15:03:22', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `cruge_authassignment`
--

CREATE TABLE IF NOT EXISTS `cruge_authassignment` (
  `userid` int(11) NOT NULL,
  `bizrule` text,
  `data` text,
  `itemname` varchar(64) NOT NULL,
  PRIMARY KEY (`userid`,`itemname`),
  KEY `fk_cruge_authassignment_cruge_authitem1` (`itemname`),
  KEY `fk_cruge_authassignment_user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cruge_authitem`
--

CREATE TABLE IF NOT EXISTS `cruge_authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cruge_authitemchild`
--

CREATE TABLE IF NOT EXISTS `cruge_authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cruge_field`
--

CREATE TABLE IF NOT EXISTS `cruge_field` (
  `idfield` int(11) NOT NULL AUTO_INCREMENT,
  `fieldname` varchar(20) NOT NULL,
  `longname` varchar(50) DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  `required` int(11) DEFAULT '0',
  `fieldtype` int(11) DEFAULT '0',
  `fieldsize` int(11) DEFAULT '20',
  `maxlength` int(11) DEFAULT '45',
  `showinreports` int(11) DEFAULT '0',
  `useregexp` varchar(512) DEFAULT NULL,
  `useregexpmsg` varchar(512) DEFAULT NULL,
  `predetvalue` mediumblob,
  PRIMARY KEY (`idfield`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cruge_fieldvalue`
--

CREATE TABLE IF NOT EXISTS `cruge_fieldvalue` (
  `idfieldvalue` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `idfield` int(11) NOT NULL,
  `value` blob,
  PRIMARY KEY (`idfieldvalue`),
  KEY `fk_cruge_fieldvalue_cruge_user1` (`iduser`),
  KEY `fk_cruge_fieldvalue_cruge_field1` (`idfield`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cruge_session`
--

CREATE TABLE IF NOT EXISTS `cruge_session` (
  `idsession` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `created` bigint(30) DEFAULT NULL,
  `expire` bigint(30) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `ipaddress` varchar(45) DEFAULT NULL,
  `usagecount` int(11) DEFAULT '0',
  `lastusage` bigint(30) DEFAULT NULL,
  `logoutdate` bigint(30) DEFAULT NULL,
  `ipaddressout` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsession`),
  KEY `crugesession_iduser` (`iduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cruge_session`
--

INSERT INTO `cruge_session` (`idsession`, `iduser`, `created`, `expire`, `status`, `ipaddress`, `usagecount`, `lastusage`, `logoutdate`, `ipaddressout`) VALUES
(1, 1, 1406131907, 1406133707, 0, '::1', 1, 1406131907, 1406131942, '::1'),
(2, 1, 1406131951, 1406133751, 1, '::1', 1, 1406131951, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cruge_system`
--

CREATE TABLE IF NOT EXISTS `cruge_system` (
  `idsystem` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `largename` varchar(45) DEFAULT NULL,
  `sessionmaxdurationmins` int(11) DEFAULT '30',
  `sessionmaxsameipconnections` int(11) DEFAULT '10',
  `sessionreusesessions` int(11) DEFAULT '1' COMMENT '1yes 0no',
  `sessionmaxsessionsperday` int(11) DEFAULT '-1',
  `sessionmaxsessionsperuser` int(11) DEFAULT '-1',
  `systemnonewsessions` int(11) DEFAULT '0' COMMENT '1yes 0no',
  `systemdown` int(11) DEFAULT '0',
  `registerusingcaptcha` int(11) DEFAULT '0',
  `registerusingterms` int(11) DEFAULT '0',
  `terms` blob,
  `registerusingactivation` int(11) DEFAULT '1',
  `defaultroleforregistration` varchar(64) DEFAULT NULL,
  `registerusingtermslabel` varchar(100) DEFAULT NULL,
  `registrationonlogin` int(11) DEFAULT '1',
  PRIMARY KEY (`idsystem`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cruge_system`
--

INSERT INTO `cruge_system` (`idsystem`, `name`, `largename`, `sessionmaxdurationmins`, `sessionmaxsameipconnections`, `sessionreusesessions`, `sessionmaxsessionsperday`, `sessionmaxsessionsperuser`, `systemnonewsessions`, `systemdown`, `registerusingcaptcha`, `registerusingterms`, `terms`, `registerusingactivation`, `defaultroleforregistration`, `registerusingtermslabel`, `registrationonlogin`) VALUES
(1, 'default', NULL, 30, 10, 1, -1, -1, 0, 0, 0, 0, '', 0, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cruge_user`
--

CREATE TABLE IF NOT EXISTS `cruge_user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `regdate` bigint(30) DEFAULT NULL,
  `actdate` bigint(30) DEFAULT NULL,
  `logondate` bigint(30) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL COMMENT 'Hashed password',
  `authkey` varchar(100) DEFAULT NULL COMMENT 'llave de autentificacion',
  `state` int(11) DEFAULT '0',
  `totalsessioncounter` int(11) DEFAULT '0',
  `currentsessioncounter` int(11) DEFAULT '0',
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `cruge_user`
--

INSERT INTO `cruge_user` (`iduser`, `regdate`, `actdate`, `logondate`, `username`, `email`, `password`, `authkey`, `state`, `totalsessioncounter`, `currentsessioncounter`) VALUES
(1, NULL, NULL, 1406131951, 'admin', 'admin@tucorreo.com', 'admin', NULL, 1, 0, 0),
(2, NULL, NULL, NULL, 'invitado', 'invitado', 'nopassword', NULL, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `redi_armamento`
--

CREATE TABLE IF NOT EXISTS `redi_armamento` (
  `id_arma` int(11) NOT NULL AUTO_INCREMENT,
  `co_arma` int(11) NOT NULL COMMENT 'Código',
  `nu_docm_idnt` int(11) DEFAULT NULL COMMENT 'N° de Cedula',
  `co_marca` int(11) DEFAULT NULL COMMENT 'Marca',
  `co_modelo` int(11) DEFAULT NULL COMMENT 'Modelo',
  `co_tipo_arm` int(11) DEFAULT NULL COMMENT 'Tipo',
  `co_calibre` int(11) DEFAULT NULL COMMENT 'Calibre',
  `serial_arma` varchar(45) DEFAULT NULL COMMENT 'Serial',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_arma`),
  UNIQUE KEY `uk_id_arma` (`id_arma`),
  KEY `idx_nu_docm_idnt_arm` (`nu_docm_idnt`),
  KEY `idx_co_marca` (`co_marca`),
  KEY `idx_co_tipo_arm` (`co_tipo_arm`),
  KEY `idx_co_calibre` (`co_calibre`),
  KEY `idx_co_modelo_arm` (`co_modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion del arma reglamentaria asignada' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_armamento`
--

INSERT INTO `redi_armamento` (`id_arma`, `co_arma`, `nu_docm_idnt`, `co_marca`, `co_modelo`, `co_tipo_arm`, `co_calibre`, `serial_arma`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 16913605, 1, 1, 1, 1, '245pt56589', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_arma_serv`
--

CREATE TABLE IF NOT EXISTS `redi_arma_serv` (
  `id_armaserv` int(11) NOT NULL AUTO_INCREMENT,
  `co_armaserv` int(11) NOT NULL COMMENT 'Código',
  `nb_armaserv` varchar(30) DEFAULT NULL COMMENT 'Arma ó Servicio',
  `desc_armaserv` varchar(200) DEFAULT NULL COMMENT 'Descripcion Arma ó Servicio',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_armaserv`),
  UNIQUE KEY `uk_id_armaserv` (`id_armaserv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo con información del arma o servicio al que pertenec' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_arma_serv`
--

INSERT INTO `redi_arma_serv` (`id_armaserv`, `co_armaserv`, `nb_armaserv`, `desc_armaserv`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 'Infanteria', 'Arma de Infantería de la FANB', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_asig_cargo_emp`
--

CREATE TABLE IF NOT EXISTS `redi_asig_cargo_emp` (
  `id_ asig_cargo_emp` int(11) NOT NULL AUTO_INCREMENT,
  `co_ asig_cargo_emp` int(11) NOT NULL COMMENT 'Código',
  `co_asig_cargo_org` int(11) DEFAULT NULL COMMENT 'Cargo de la organización',
  `nu_docm_idnt` int(11) DEFAULT NULL COMMENT 'N°. Cédula',
  `fe_inicio` date DEFAULT NULL COMMENT 'Desde',
  `fe_fin` date DEFAULT NULL COMMENT 'Hasta',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_ asig_cargo_emp`),
  UNIQUE KEY `uk_ asig_cargo_emp` (`id_ asig_cargo_emp`),
  KEY `idx_nu_docm_idnt_crgo` (`nu_docm_idnt`),
  KEY `idx_co_asig_cargo_org` (`co_asig_cargo_org`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo para el registro de asignaciones de cargos a emplead' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_asig_cargo_emp`
--

INSERT INTO `redi_asig_cargo_emp` (`id_ asig_cargo_emp`, `co_ asig_cargo_emp`, `co_asig_cargo_org`, `nu_docm_idnt`, `fe_inicio`, `fe_fin`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 1, 16913605, '2014-07-21', NULL, 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_asig_cargo_org`
--

CREATE TABLE IF NOT EXISTS `redi_asig_cargo_org` (
  `id_asig_cargo_org` int(11) NOT NULL AUTO_INCREMENT,
  `co_asig_cargo_org` int(11) NOT NULL COMMENT 'Código',
  `co_estr_org` int(11) DEFAULT NULL COMMENT 'Dependencia',
  `co_cargo` int(11) DEFAULT NULL COMMENT 'Cargo',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_asig_cargo_org`),
  UNIQUE KEY `uk_id_asig_cargo_org` (`id_asig_cargo_org`),
  UNIQUE KEY `co_asig_cargo_org_UNIQUE` (`co_asig_cargo_org`),
  KEY `idx_co_cargo` (`co_cargo`),
  KEY `idx_co_estr_org_asig_carg` (`co_estr_org`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro de codigos  de cargos asignados a empleados' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_asig_cargo_org`
--

INSERT INTO `redi_asig_cargo_org` (`id_asig_cargo_org`, `co_asig_cargo_org`, `co_estr_org`, `co_cargo`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 1, 1, 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_bancos`
--

CREATE TABLE IF NOT EXISTS `redi_bancos` (
  `id_banco` int(11) NOT NULL AUTO_INCREMENT,
  `co_banco` int(11) NOT NULL COMMENT 'Código',
  `nb_banco` varchar(30) DEFAULT NULL COMMENT 'Banco',
  `desc_banco` varchar(200) DEFAULT NULL COMMENT 'Descripción de Banco',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_banco`),
  UNIQUE KEY `uk_id_banco` (`id_banco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo con información de los bancos donde recibe su pago ' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_bancos`
--

INSERT INTO `redi_bancos` (`id_banco`, `co_banco`, `nb_banco`, `desc_banco`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 'Venezuela', 'Banco de Venezuela', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_bono_ali`
--

CREATE TABLE IF NOT EXISTS `redi_bono_ali` (
  `id_bono_ali` int(11) NOT NULL AUTO_INCREMENT,
  `co_bono_ali` int(11) NOT NULL COMMENT 'Código',
  `mnto_bs` float(10,2) DEFAULT NULL COMMENT 'Monto Bs',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_bono_ali`),
  UNIQUE KEY `uk_id_bono_ali` (`id_bono_ali`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo con información del monto por concepto de bono de a' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_bono_ali`
--

INSERT INTO `redi_bono_ali` (`id_bono_ali`, `co_bono_ali`, `mnto_bs`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 1625.00, 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_calibre_arma`
--

CREATE TABLE IF NOT EXISTS `redi_calibre_arma` (
  `id_calibre` int(11) NOT NULL AUTO_INCREMENT,
  `co_calibre` int(11) NOT NULL COMMENT 'Código',
  `co_modelo` int(11) DEFAULT NULL COMMENT 'clave del modelo de arma',
  `nb_calibre` varchar(30) DEFAULT NULL COMMENT 'Calibre',
  `desc_calibre` varchar(150) DEFAULT NULL COMMENT 'Descripción',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_calibre`),
  UNIQUE KEY `uk_id_calibre` (`id_calibre`),
  KEY `idx_co_modelo` (`co_modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo para registrar el calibre del armamento, asignado a ' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_calibre_arma`
--

INSERT INTO `redi_calibre_arma` (`id_calibre`, `co_calibre`, `co_modelo`, `nb_calibre`, `desc_calibre`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 1, '9mm', 'calibre tipo 9mm', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_cargos`
--

CREATE TABLE IF NOT EXISTS `redi_cargos` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `co_cargo` int(11) NOT NULL COMMENT 'Código',
  `nb_cargo` varchar(30) DEFAULT NULL COMMENT 'Cargo',
  `desc_cargo` varchar(200) DEFAULT NULL COMMENT 'Descripción',
  `cant` int(2) NOT NULL COMMENT 'Cantidad',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por ',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_cargo`),
  UNIQUE KEY `uk_id_cargo` (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo para registrar la tabla de cargos de la organizació' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_cargos`
--

INSERT INTO `redi_cargos` (`id_cargo`, `co_cargo`, `nb_cargo`, `desc_cargo`, `cant`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 'Jefe', 'Jefe', 4, 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_categoria`
--

CREATE TABLE IF NOT EXISTS `redi_categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `co_categoria` int(11) NOT NULL COMMENT 'Código',
  `nb_categoria` varchar(30) DEFAULT NULL COMMENT 'Categoria',
  `desc_categoria` varchar(200) DEFAULT NULL COMMENT 'Descripcion de Categoria',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_categoria`),
  UNIQUE KEY `id_categoria_UNIQUE` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo con información de las categoría' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_categoria`
--

INSERT INTO `redi_categoria` (`id_categoria`, `co_categoria`, `nb_categoria`, `desc_categoria`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 'Efectivo', 'Oficiales Efectivos de la FANB', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_cdad`
--

CREATE TABLE IF NOT EXISTS `redi_cdad` (
  `id_cdad` int(11) NOT NULL AUTO_INCREMENT,
  `co_cdad` int(11) NOT NULL COMMENT 'Código',
  `co_edo` int(11) NOT NULL COMMENT 'Estado',
  `nb_cdad` varchar(30) DEFAULT NULL COMMENT 'Ciudad',
  `desc_cdad` varchar(200) DEFAULT NULL COMMENT 'Descripción',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_cdad`),
  UNIQUE KEY `uk_id_cdad` (`id_cdad`),
  KEY `idx_co_edo` (`co_edo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_cdad`
--

INSERT INTO `redi_cdad` (`id_cdad`, `co_cdad`, `co_edo`, `nb_cdad`, `desc_cdad`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 1, 'San Juan de los Morros', 'San Juan de los Morros', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_clase`
--

CREATE TABLE IF NOT EXISTS `redi_clase` (
  `id_clase` int(11) NOT NULL AUTO_INCREMENT,
  `co_clase` int(11) NOT NULL COMMENT 'Código',
  `nb_clase` varchar(30) DEFAULT NULL COMMENT 'Clase',
  `desc_clase` varchar(200) DEFAULT NULL COMMENT 'Descripcion de Clase',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_clase`),
  UNIQUE KEY `uk_id_clase` (`id_clase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo que contendrá las distintas Clases de Oficiales de ' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_clase`
--

INSERT INTO `redi_clase` (`id_clase`, `co_clase`, `nb_clase`, `desc_clase`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 'Comando', 'Oficiales de Comando', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_componentes`
--

CREATE TABLE IF NOT EXISTS `redi_componentes` (
  `id_componente` int(11) NOT NULL AUTO_INCREMENT,
  `co_componente` int(11) NOT NULL COMMENT 'Código',
  `nb_componente` varchar(30) DEFAULT NULL COMMENT 'Componente',
  `desc_componente` varchar(200) DEFAULT NULL COMMENT 'Descripcion del Componente',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_componente`),
  UNIQUE KEY `uk_id_componente` (`id_componente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo para registrar los Componentes de la FANB' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_componentes`
--

INSERT INTO `redi_componentes` (`id_componente`, `co_componente`, `nb_componente`, `desc_componente`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 'Ejército Bolivariano', 'Componente Ejército', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_condecoraciones`
--

CREATE TABLE IF NOT EXISTS `redi_condecoraciones` (
  `id_cond` int(11) NOT NULL AUTO_INCREMENT,
  `co_cond` int(11) NOT NULL,
  `co_tpo_cond` int(11) NOT NULL,
  `nb_cond` varchar(30) DEFAULT NULL,
  `desc_cond` varchar(200) DEFAULT NULL,
  `id_user_crea` varchar(11) NOT NULL,
  `fe_user_crea` datetime NOT NULL,
  `id_user_mod` varchar(11) DEFAULT NULL,
  `fe_user_mod` datetime DEFAULT NULL,
  `in_stat` varchar(1) NOT NULL DEFAULT 'A',
  `tx_obs` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`co_cond`),
  UNIQUE KEY `uk_id_cond` (`id_cond`),
  KEY `idx_co_tpo_cond` (`co_tpo_cond`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo con información de las condecoraciones' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_condecoraciones`
--

INSERT INTO `redi_condecoraciones` (`id_cond`, `co_cond`, `co_tpo_cond`, `nb_cond`, `desc_cond`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 1, 'Cruz de la Fuerza Aérea', 'Condecoración por 10 años de servicio', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_condecoraciones_r`
--

CREATE TABLE IF NOT EXISTS `redi_condecoraciones_r` (
  `id_condr` int(11) NOT NULL AUTO_INCREMENT,
  `co_condr` int(11) NOT NULL,
  `co_cond` int(11) DEFAULT NULL,
  `nu_docm_idnt` int(11) DEFAULT NULL,
  `id_user_crea` varchar(11) NOT NULL,
  `fe_user_crea` datetime NOT NULL,
  `id_user_mod` varchar(11) DEFAULT NULL,
  `fe_user_mod` datetime DEFAULT NULL,
  `in_stat` varchar(1) NOT NULL DEFAULT 'A',
  `tx_obs` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`co_condr`),
  UNIQUE KEY `uk_id_condr` (`id_condr`),
  KEY `idx_nu_docm_idnt_condr` (`nu_docm_idnt`),
  KEY `idx_co_cond_condr` (`co_cond`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo con información de las condecoraciones recibidas po' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_condecoraciones_r`
--

INSERT INTO `redi_condecoraciones_r` (`id_condr`, `co_condr`, `co_cond`, `nu_docm_idnt`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 1, 16913605, 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_ctrabajo`
--

CREATE TABLE IF NOT EXISTS `redi_ctrabajo` (
  `id_ctrabajo` int(11) NOT NULL AUTO_INCREMENT,
  `co_ctrabajo` int(11) NOT NULL COMMENT 'Código',
  `motivo` varchar(60) DEFAULT NULL COMMENT 'Motivo Solicitud',
  `nu_docm_idnt` int(11) NOT NULL COMMENT 'N°. Cédula',
  `nu_docm_idnt_emi` int(11) NOT NULL COMMENT 'N°.  Cédula Emisor',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_ctrabajo`),
  UNIQUE KEY `uk_id_ctrabajo` (`id_ctrabajo`),
  KEY `idx_nu_docm_idnt_ctrab` (`nu_docm_idnt`),
  KEY `idx_nu_docm_idnt_emi` (`nu_docm_idnt_emi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo para registrar las constancias de trabajo emitidas p' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_ctrabajo`
--

INSERT INTO `redi_ctrabajo` (`id_ctrabajo`, `co_ctrabajo`, `motivo`, `nu_docm_idnt`, `nu_docm_idnt_emi`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 'crédito hipotecario', 16913605, 16913605, 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_detll_emp`
--

CREATE TABLE IF NOT EXISTS `redi_detll_emp` (
  `id_det_emp` int(11) NOT NULL AUTO_INCREMENT,
  `co_det_emp` int(11) NOT NULL COMMENT 'Código',
  `nu_docm_idnt` int(11) NOT NULL COMMENT 'N°. Cédula',
  `foto` varchar(10) DEFAULT NULL COMMENT 'Foto',
  `co_categoria` int(11) DEFAULT NULL COMMENT 'Categoria',
  `co_clase` int(11) DEFAULT NULL COMMENT 'Clase',
  `co_componente` int(11) DEFAULT NULL COMMENT 'Componente',
  `fe_nac` date DEFAULT NULL COMMENT 'Fecha de Nacimiento',
  `lug_nac` varchar(30) DEFAULT NULL COMMENT 'Lugar de Nacimiento',
  `tlf_hab` varchar(15) DEFAULT NULL COMMENT 'Teléfono Habitacion',
  `grp_sang` varchar(6) DEFAULT NULL COMMENT 'Grupo Sanguineo',
  `hist_med` varchar(30) DEFAULT NULL COMMENT 'Historia Médica',
  `edo_civil` varchar(7) DEFAULT NULL COMMENT 'Estado Civil',
  `dir_hab` varchar(60) DEFAULT NULL COMMENT 'Dirección Habitacion',
  `co_reg_hab` int(11) DEFAULT NULL COMMENT 'Región',
  `co_edo_hab` int(11) DEFAULT NULL COMMENT 'Estado',
  `co_cdad_hab` int(11) DEFAULT NULL COMMENT 'Ciudad',
  `co_muncp_hab` int(11) DEFAULT NULL COMMENT 'Municipio',
  `nb_fam` varchar(30) DEFAULT NULL COMMENT 'Nombre de Familiar Cercano',
  `tlf_fam` varchar(15) DEFAULT NULL COMMENT 'Teléfono de Familiar Cercano',
  `tlf_em` varchar(15) DEFAULT NULL COMMENT 'Teléfono de Emergencia',
  `dir_em` varchar(60) DEFAULT NULL COMMENT 'Dirección de Emergencia',
  `co_reg_em` int(11) DEFAULT NULL COMMENT 'Región',
  `co_edo_em` int(11) DEFAULT NULL COMMENT 'Estado',
  `co_cdad_em` int(11) DEFAULT NULL COMMENT 'Ciudad',
  `co_muncp_em` int(11) DEFAULT NULL COMMENT 'Municipio',
  `fe_grad` date DEFAULT NULL COMMENT 'Fecha de Graduación',
  `fe_ingre_unidad` date DEFAULT NULL COMMENT 'Fecha de Ingreso a la Unidad',
  `fe_retiro_unidad` date DEFAULT NULL COMMENT 'Fecha de Alta de la Unidad',
  `fe_ult_ascenso` date DEFAULT NULL COMMENT 'Fecha de Ultimo Ascenso',
  `nb_promocion` varchar(60) DEFAULT NULL COMMENT 'Nombre de la Promoción',
  `co_espmil` int(11) DEFAULT NULL COMMENT 'Especialidad Militar Primaria',
  `co_espmil2` int(11) DEFAULT NULL COMMENT 'Especialidad Militar Secundaria',
  `grado_instruccion` varchar(30) DEFAULT NULL COMMENT 'Grado de Instrucción Académica',
  `otros_estudios` varchar(60) DEFAULT NULL COMMENT 'Otro Estudios',
  `co_armaserv` int(11) DEFAULT NULL COMMENT 'Arma o Servicio',
  `nb_conyuge` varchar(30) DEFAULT NULL COMMENT 'Nombre del Conyugue',
  `fe_aniv_matrimonio` date DEFAULT NULL COMMENT 'Fecha de Aniversario de Bodas',
  `marca_vehiculo` varchar(30) DEFAULT NULL COMMENT 'Marca Vehículo',
  `modelo_vehiculo` varchar(30) DEFAULT NULL COMMENT 'Modelo Vehiculo',
  `anio_vehiculo` year(4) DEFAULT NULL COMMENT 'Año Vehiculo',
  `color_vehiculo` varchar(30) DEFAULT NULL COMMENT 'Color Vehículo',
  `placa_vehiculo` varchar(10) DEFAULT NULL COMMENT 'Placa Vehículo',
  `talla_pantalon` int(11) DEFAULT NULL COMMENT 'Talla de Pantalon',
  `talla_camisa` int(11) DEFAULT NULL COMMENT 'Talla de Camisa',
  `talla_patriota` int(11) DEFAULT NULL COMMENT 'Talla de Patriota',
  `talla_gorra` int(11) DEFAULT NULL COMMENT 'Talla de Gorra',
  `talla_calzado` int(11) DEFAULT NULL COMMENT 'Número de Calzado',
  `ciudad_regi_vot` varchar(30) DEFAULT NULL COMMENT 'Ciudad donde ejerce el Voto',
  `co_banco` int(11) DEFAULT NULL COMMENT 'Banco',
  `tpo_cnta` varchar(15) DEFAULT NULL COMMENT 'Tipo de Cuenta',
  `nu_cnta` int(20) DEFAULT NULL COMMENT 'Número de Cuenta',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_det_emp`),
  UNIQUE KEY `uk_id_empleado` (`id_det_emp`),
  UNIQUE KEY `uk_nu_docm_idnt` (`nu_docm_idnt`),
  KEY `idx_co_categoria` (`co_categoria`),
  KEY `idx_co_clase` (`co_clase`),
  KEY `idx_co_componente` (`co_componente`),
  KEY `idx_co_espmil` (`co_espmil`),
  KEY `idx_co_espmil2` (`co_espmil2`),
  KEY `idx_co_armaserv` (`co_armaserv`),
  KEY `idx_co_banco` (`co_banco`),
  KEY `idx_talla_pantalon` (`talla_pantalon`),
  KEY `idx_talla_camisa` (`talla_camisa`),
  KEY `idx_talla_patriota` (`talla_patriota`),
  KEY `idx_talla_gorra` (`talla_gorra`),
  KEY `idx_talla_calzado` (`talla_calzado`),
  KEY `idx_co_reg_hab` (`co_reg_hab`),
  KEY `idx_co_edo_hab` (`co_edo_hab`),
  KEY `idx_co_cdad_hab` (`co_cdad_hab`),
  KEY `idx_co_reg_em` (`co_reg_em`),
  KEY `idx_co_edo_em` (`co_edo_em`),
  KEY `idx_co_cdad_em` (`co_cdad_em`),
  KEY `idx_co_muncp_hab` (`co_muncp_hab`),
  KEY `fk_co_muncp_em` (`co_muncp_em`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo con los detalles del empleado' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_detll_emp`
--

INSERT INTO `redi_detll_emp` (`id_det_emp`, `co_det_emp`, `nu_docm_idnt`, `foto`, `co_categoria`, `co_clase`, `co_componente`, `fe_nac`, `lug_nac`, `tlf_hab`, `grp_sang`, `hist_med`, `edo_civil`, `dir_hab`, `co_reg_hab`, `co_edo_hab`, `co_cdad_hab`, `co_muncp_hab`, `nb_fam`, `tlf_fam`, `tlf_em`, `dir_em`, `co_reg_em`, `co_edo_em`, `co_cdad_em`, `co_muncp_em`, `fe_grad`, `fe_ingre_unidad`, `fe_retiro_unidad`, `fe_ult_ascenso`, `nb_promocion`, `co_espmil`, `co_espmil2`, `grado_instruccion`, `otros_estudios`, `co_armaserv`, `nb_conyuge`, `fe_aniv_matrimonio`, `marca_vehiculo`, `modelo_vehiculo`, `anio_vehiculo`, `color_vehiculo`, `placa_vehiculo`, `talla_pantalon`, `talla_camisa`, `talla_patriota`, `talla_gorra`, `talla_calzado`, `ciudad_regi_vot`, `co_banco`, `tpo_cnta`, `nu_cnta`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 16913605, NULL, 1, 1, 1, '1985-03-21', 'Calabozo Edo. Guárico', '0246-8722227', 'orh+', '123456', 'Casado', 'Urb. Simón Rodríguez, calle 6, casa 18', 1, 1, 1, 1, 'David Puro', '0246-8722227', '0246-8722227', 'Carrera 19 e/c 9 y 12', 1, 1, 1, 1, '2007-07-05', '2014-07-21', NULL, '2012-12-04', '4 de Febrero', 1, NULL, 'Ingeniero', NULL, NULL, 'Yeitza Valero', '2012-08-03', 'Venirauto', 'Turpial', 2011, 'Plata', 'AA984TL', 1, 1, 1, 1, 1, 'San Juan de los Morros', 1, 'Corriente', 123345677, 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_edo`
--

CREATE TABLE IF NOT EXISTS `redi_edo` (
  `id_edo` int(11) NOT NULL AUTO_INCREMENT,
  `co_edo` int(11) NOT NULL COMMENT 'Código',
  `co_reg` int(11) NOT NULL COMMENT 'Regíon',
  `nb_edo` varchar(30) DEFAULT NULL COMMENT 'Estado',
  `desc_edo` varchar(200) DEFAULT NULL COMMENT 'Descripción',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_edo`),
  UNIQUE KEY `uk_id_edo` (`id_edo`),
  KEY `idx_co_reg` (`co_reg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_edo`
--

INSERT INTO `redi_edo` (`id_edo`, `co_edo`, `co_reg`, `nb_edo`, `desc_edo`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 1, 'Guárico', 'Estado Guárico', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_empleados`
--

CREATE TABLE IF NOT EXISTS `redi_empleados` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nu_docm_idnt` int(11) NOT NULL COMMENT 'N°. Cédula',
  `nu_docm_idnt_dpnd` int(11) DEFAULT NULL COMMENT 'N°. Cédula Supervisor',
  `nombre1` varchar(30) DEFAULT NULL COMMENT 'Primer Nombre',
  `nombre2` varchar(30) DEFAULT NULL COMMENT 'Segundo Nombre',
  `apellido1` varchar(30) DEFAULT NULL COMMENT 'Primer Apellido',
  `apellido2` varchar(30) DEFAULT NULL COMMENT 'Segundo Apellido',
  `sexo` varchar(1) DEFAULT NULL COMMENT 'Sexo',
  `email` varchar(30) DEFAULT NULL COMMENT 'Correo electrónico',
  `nu_tlf_cel` varchar(15) DEFAULT NULL COMMENT 'Teléfono Celular',
  `co_grado` int(11) DEFAULT NULL COMMENT 'Grado Militar',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_ user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_ user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`nu_docm_idnt`),
  UNIQUE KEY `uk_id_empleado` (`id_empleado`),
  UNIQUE KEY `uk_nu_docm_idnt` (`nu_docm_idnt`),
  KEY `idx_nu_docm_idnt_dpnd` (`nu_docm_idnt_dpnd`),
  KEY `idx_co_grado` (`co_grado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo principal que contendrá información de cada uno de' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_empleados`
--

INSERT INTO `redi_empleados` (`id_empleado`, `nu_docm_idnt`, `nu_docm_idnt_dpnd`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `sexo`, `email`, `nu_tlf_cel`, `co_grado`, `id_user_crea`, `fe_ user_crea`, `id_user_mod`, `fe_ user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 16913605, NULL, 'David', 'Antonio', 'Puro', 'Manaure', 'M', 'purodavid@gmail.com', '0416-6317371', 1, 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_especialidades`
--

CREATE TABLE IF NOT EXISTS `redi_especialidades` (
  `id_especialidad` int(11) NOT NULL AUTO_INCREMENT,
  `co_especialidad` int(11) NOT NULL COMMENT 'Código',
  `nb_especialidad` varchar(30) DEFAULT NULL COMMENT 'Especialidad',
  `desc_especialidad` varchar(200) DEFAULT NULL COMMENT 'Descripcion Especialidad',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_especialidad`),
  UNIQUE KEY `uk_id_especialidad` (`id_especialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo con información de la especialidad a la que pertene' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_especialidades`
--

INSERT INTO `redi_especialidades` (`id_especialidad`, `co_especialidad`, `nb_especialidad`, `desc_especialidad`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 'Comunicaciones', 'Pruebaseeeeeee', 'usuario', '2014-07-22 00:00:00', 'admin', '2014-07-23 10:27:57', 'A', 'Observaciones'),
(2, 2, 'pruebasffff', '', 'admin', '2014-07-23 10:31:19', 'admin', '2014-07-23 10:33:22', 'A', ''),
(3, 3, 'pruebas333', '', 'admin', '2014-07-23 10:31:34', 'admin', '2014-07-23 10:31:34', 'A', '');

-- --------------------------------------------------------

--
-- Table structure for table `redi_estructura_org`
--

CREATE TABLE IF NOT EXISTS `redi_estructura_org` (
  `id_estr_org` int(11) NOT NULL AUTO_INCREMENT,
  `co_estr_org` int(11) NOT NULL COMMENT 'Código',
  `co_estr_org_dep` int(11) DEFAULT NULL COMMENT 'Código dependenca',
  `nb_org` varchar(30) DEFAULT NULL COMMENT 'Dependencia',
  `desc_org` varchar(200) DEFAULT NULL COMMENT 'Descripción',
  `abreviatura` varchar(10) DEFAULT NULL COMMENT 'Abreviatura',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_estr_org`),
  UNIQUE KEY `uk_id_estr_org` (`id_estr_org`),
  KEY `idx_co_estr_org` (`co_estr_org_dep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo principal en donde se encuentra la estructura organi' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_estructura_org`
--

INSERT INTO `redi_estructura_org` (`id_estr_org`, `co_estr_org`, `co_estr_org_dep`, `nb_org`, `desc_org`, `abreviatura`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, NULL, 'REDI LOS LLANOS', 'Región los llanos', 'REDILL', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_grados`
--

CREATE TABLE IF NOT EXISTS `redi_grados` (
  `id_grado` int(11) NOT NULL AUTO_INCREMENT,
  `co_grado` int(11) NOT NULL COMMENT 'Código',
  `nb_grado` varchar(30) DEFAULT NULL COMMENT 'Grado',
  `des_grado` varchar(200) DEFAULT NULL COMMENT 'Descripion del Grado',
  `abreviatuta` varchar(10) DEFAULT NULL COMMENT 'Abreviatura',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_grado`),
  UNIQUE KEY `uk_id_grado` (`id_grado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo con información de los grados del personal militar ' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_grados`
--

INSERT INTO `redi_grados` (`id_grado`, `co_grado`, `nb_grado`, `des_grado`, `abreviatuta`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 'Teniente', 'Primer grado de los Oficiales de la FANB', 'Tte', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_hijos`
--

CREATE TABLE IF NOT EXISTS `redi_hijos` (
  `id_hijo` int(11) NOT NULL AUTO_INCREMENT,
  `co_hijo` int(11) NOT NULL COMMENT 'clave del hijo del empleado',
  `nb_hijo` varchar(30) DEFAULT NULL COMMENT 'Nombre',
  `nu_docm_idnt_hijo` int(11) DEFAULT NULL COMMENT 'N° de Cedula',
  `fe_nac` date DEFAULT NULL COMMENT 'Fecha de Nacimiento',
  `sexo` varchar(1) DEFAULT NULL COMMENT 'Sexo',
  `nu_docm_idnt` int(11) DEFAULT NULL COMMENT 'N° de Cedula Representante',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_hijo`),
  UNIQUE KEY `uk_id_hijo` (`id_hijo`),
  KEY `idx_nu_docm_idnt_hjs` (`nu_docm_idnt`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Archivo con información de los datos de los hijos del perso' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `redi_hijos`
--

INSERT INTO `redi_hijos` (`id_hijo`, `co_hijo`, `nb_hijo`, `nu_docm_idnt_hijo`, `fe_nac`, `sexo`, `nu_docm_idnt`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 'Isabella Puro', NULL, '2014-07-22', 'F', 16913605, 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_marca_arma`
--

CREATE TABLE IF NOT EXISTS `redi_marca_arma` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `co_marca` int(11) NOT NULL COMMENT 'Código',
  `co_tpo_arm` int(11) DEFAULT NULL COMMENT 'clave de la marca del tipo de arma',
  `nb_marca` varchar(30) DEFAULT NULL COMMENT 'Marca',
  `desc_marca` varchar(200) DEFAULT NULL COMMENT 'Descripción',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_marca`),
  UNIQUE KEY `uk_id_marca` (`id_marca`),
  KEY `idx_co_tpo_arm` (`co_tpo_arm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo para registrar la marca del armamento, asignado a lo' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_marca_arma`
--

INSERT INTO `redi_marca_arma` (`id_marca`, `co_marca`, `co_tpo_arm`, `nb_marca`, `desc_marca`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 1, 'Browning', 'Marca de Pistola de fabricación Belga ', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_modelo_arma`
--

CREATE TABLE IF NOT EXISTS `redi_modelo_arma` (
  `id_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `co_modelo` int(11) NOT NULL COMMENT 'Código',
  `co_marca` int(11) DEFAULT NULL COMMENT 'clave de la marca del arma',
  `nb_modelo` varchar(30) DEFAULT NULL COMMENT 'Modelo',
  `desc_modelo` varchar(200) DEFAULT NULL COMMENT 'Descripción',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_modelo`),
  UNIQUE KEY `uk_id_modelo` (`id_modelo`),
  KEY `idx_co_marca_model` (`co_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo para registrar el modelo del armamento, asignado a l' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_modelo_arma`
--

INSERT INTO `redi_modelo_arma` (`id_modelo`, `co_modelo`, `co_marca`, `nb_modelo`, `desc_modelo`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 1, 'GP-35', 'modelo para uso militar', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_muncp`
--

CREATE TABLE IF NOT EXISTS `redi_muncp` (
  `id_muncp` int(11) NOT NULL AUTO_INCREMENT,
  `co_muncp` int(11) NOT NULL COMMENT 'Código',
  `co_cdad` int(11) DEFAULT NULL COMMENT 'ciudad',
  `nb_muncp` varchar(30) DEFAULT NULL COMMENT 'Municipio',
  `desc_muncp` varchar(200) DEFAULT NULL COMMENT 'Descripción',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_muncp`),
  UNIQUE KEY `uk_id_muncp` (`id_muncp`),
  KEY `idx_co_cdad` (`co_cdad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_muncp`
--

INSERT INTO `redi_muncp` (`id_muncp`, `co_muncp`, `co_cdad`, `nb_muncp`, `desc_muncp`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 1, 'Juan Germán Roscio', 'Juan Germán Roscio', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_prog_vcnes`
--

CREATE TABLE IF NOT EXISTS `redi_prog_vcnes` (
  `id_prog_vcnes` int(11) NOT NULL AUTO_INCREMENT,
  `co_ prog_vcnes` int(11) NOT NULL COMMENT 'Código',
  `co_vacaciones` int(11) DEFAULT NULL COMMENT 'Vacaciones',
  `dias` int(2) NOT NULL COMMENT 'Días',
  `fe_inicio` date NOT NULL COMMENT 'Desde',
  `fe_fin` date NOT NULL COMMENT 'Hasta',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Nodificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_ prog_vcnes`),
  UNIQUE KEY `uk_id_prog_vcnes` (`id_prog_vcnes`),
  KEY `idx_co_vacaciones` (`co_vacaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo para llevar la programación anual del uso de las va' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_prog_vcnes`
--

INSERT INTO `redi_prog_vcnes` (`id_prog_vcnes`, `co_ prog_vcnes`, `co_vacaciones`, `dias`, `fe_inicio`, `fe_fin`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 1, 15, '2014-07-01', '2014-07-16', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_region`
--

CREATE TABLE IF NOT EXISTS `redi_region` (
  `id_reg` int(11) NOT NULL AUTO_INCREMENT,
  `co_reg` int(11) NOT NULL COMMENT 'Código',
  `nb_reg` varchar(30) DEFAULT NULL COMMENT 'Región',
  `desc_reg` varchar(200) DEFAULT NULL COMMENT 'Descripción',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_reg`),
  UNIQUE KEY `uk_id_reg` (`id_reg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_region`
--

INSERT INTO `redi_region` (`id_reg`, `co_reg`, `nb_reg`, `desc_reg`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 'Los Llanos', 'REDI LOS LLANOS', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_situacion`
--

CREATE TABLE IF NOT EXISTS `redi_situacion` (
  `id_situacion` int(11) NOT NULL AUTO_INCREMENT,
  `co_situacion` int(11) NOT NULL,
  `co_tsituacion` int(11) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `nu_docm_idnt` int(11) NOT NULL,
  `direccion_ubic` varchar(300) DEFAULT NULL,
  `nu_tlf` varchar(15) DEFAULT NULL,
  `fe inicio` datetime DEFAULT NULL,
  `fe_fin` datetime DEFAULT NULL,
  `fe_fin_real` datetime DEFAULT NULL,
  `id_user_crea` varchar(11) NOT NULL,
  `fe_user_crea` datetime NOT NULL,
  `id_user_mod` varchar(11) DEFAULT NULL,
  `fe_user_mod` datetime DEFAULT NULL,
  `in_stat` varchar(1) NOT NULL DEFAULT 'A',
  `tx_obs` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`co_situacion`),
  UNIQUE KEY `uk_id_situacion` (`id_situacion`),
  KEY `idx_co_tsituacion` (`co_tsituacion`),
  KEY `idx_nu_docm_idnt_sit` (`nu_docm_idnt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo con información sobre el pago del personal de emple' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_situacion`
--

INSERT INTO `redi_situacion` (`id_situacion`, `co_situacion`, `co_tsituacion`, `descripcion`, `nu_docm_idnt`, `direccion_ubic`, `nu_tlf`, `fe inicio`, `fe_fin`, `fe_fin_real`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 1, 'CANTV', 16913605, 'Los Cortijos', '0416-6317371', '2014-07-21 00:00:00', '2014-07-25 00:00:00', NULL, 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_sueldo`
--

CREATE TABLE IF NOT EXISTS `redi_sueldo` (
  `id_sueldo` int(11) NOT NULL AUTO_INCREMENT,
  `co_sueldo` int(11) NOT NULL COMMENT 'Código',
  `nu_docm_idnt` int(11) DEFAULT NULL COMMENT 'N°. Cédula',
  `sueldo` double(10,2) DEFAULT NULL COMMENT 'Sueldo',
  `fe_recib_pago` date DEFAULT NULL COMMENT 'Fecha de la planilla de pago',
  `cod_plani_pago` varchar(11) DEFAULT NULL COMMENT 'Código de la planilla de pago',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_sueldo`),
  UNIQUE KEY `uk_id_sueldo` (`id_sueldo`),
  KEY `idx_nu_docm_idnt_sldo` (`nu_docm_idnt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo con información del sueldo del personal militar pro' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_sueldo`
--

INSERT INTO `redi_sueldo` (`id_sueldo`, `co_sueldo`, `nu_docm_idnt`, `sueldo`, `fe_recib_pago`, `cod_plani_pago`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 16913605, 14000.00, '2014-07-22', '0005', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_tallas`
--

CREATE TABLE IF NOT EXISTS `redi_tallas` (
  `id_talla` int(11) NOT NULL AUTO_INCREMENT,
  `co_talla` int(11) NOT NULL DEFAULT '0' COMMENT 'Código',
  `nb_talla` varchar(30) DEFAULT NULL COMMENT 'Talla',
  `desc_talla` varchar(200) DEFAULT NULL COMMENT 'Descripcion de Talla',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_talla`),
  UNIQUE KEY `uk_id_talla` (`id_talla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo para registrar la tabla de tallas de ropa y calzado ' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_tallas`
--

INSERT INTO `redi_tallas` (`id_talla`, `co_talla`, `nb_talla`, `desc_talla`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 'S', 'talla de camisa', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_tipo_arma`
--

CREATE TABLE IF NOT EXISTS `redi_tipo_arma` (
  `id_tpo_arm` int(11) NOT NULL AUTO_INCREMENT,
  `co_tpo_arm` int(11) NOT NULL COMMENT 'Código',
  `nb_tpo_arma` varchar(45) DEFAULT NULL COMMENT 'Tipo de Arma',
  `desc_tipo` varchar(200) DEFAULT NULL COMMENT 'Descripción',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_tpo_arm`),
  UNIQUE KEY `uk_tpo_arma` (`id_tpo_arm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo para registrar el tipo de armamento, asignado a los ' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_tipo_arma`
--

INSERT INTO `redi_tipo_arma` (`id_tpo_arm`, `co_tpo_arm`, `nb_tpo_arma`, `desc_tipo`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 'Pistola', 'Arma tipo pistola', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_tpo_cond`
--

CREATE TABLE IF NOT EXISTS `redi_tpo_cond` (
  `id_tpo_cond` int(11) NOT NULL AUTO_INCREMENT,
  `co_tpo_cond` int(11) NOT NULL COMMENT 'Código',
  `nb_tpo_cond` varchar(30) DEFAULT NULL COMMENT 'Tipo',
  `desc_tpo_cond` varchar(200) DEFAULT NULL COMMENT 'Descripción',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Esatatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_tpo_cond`),
  UNIQUE KEY `id_tpo_cond_UNIQUE` (`id_tpo_cond`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo con información de los tipos de condecoraciones' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_tpo_cond`
--

INSERT INTO `redi_tpo_cond` (`id_tpo_cond`, `co_tpo_cond`, `nb_tpo_cond`, `desc_tpo_cond`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 'Militar', 'Condecoraciones militares', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_t_situaion`
--

CREATE TABLE IF NOT EXISTS `redi_t_situaion` (
  `id_tsituacion` int(11) NOT NULL AUTO_INCREMENT,
  `co_tsituacion` int(11) NOT NULL COMMENT 'Código',
  `nb_tsituacion` varchar(30) DEFAULT NULL COMMENT 'Tipo',
  `desc_tsituacion` varchar(200) DEFAULT NULL COMMENT 'Descripción',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_tsituacion`),
  UNIQUE KEY `uk_tsituacion` (`id_tsituacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo que contendrá los tipos de situaciones en las que  ' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_t_situaion`
--

INSERT INTO `redi_t_situaion` (`id_tsituacion`, `co_tsituacion`, `nb_tsituacion`, `desc_tsituacion`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 'Curso', 'Curso', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_ubicacion_adm`
--

CREATE TABLE IF NOT EXISTS `redi_ubicacion_adm` (
  `id_ubic_adm` int(11) NOT NULL AUTO_INCREMENT,
  `co_ubic_admin` int(11) NOT NULL COMMENT 'Código',
  `co_estr_org` int(11) DEFAULT NULL COMMENT 'Dependencia',
  `nu_docm_idnt` int(11) DEFAULT NULL COMMENT 'N°. Cédula',
  `fe_inicio` date DEFAULT NULL COMMENT 'Desde',
  `fe_fin` date DEFAULT NULL COMMENT 'Hasta',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_ubic_admin`),
  UNIQUE KEY `uk_id_ubic_adm` (`id_ubic_adm`),
  KEY `idx_nu_docm_idnt_ubic` (`nu_docm_idnt`),
  KEY `idx_co_estr_org_ubic` (`co_estr_org`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Archivo principal donde se encuentra contenida la ubicación' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_ubicacion_adm`
--

INSERT INTO `redi_ubicacion_adm` (`id_ubic_adm`, `co_ubic_admin`, `co_estr_org`, `nu_docm_idnt`, `fe_inicio`, `fe_fin`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 1, 16913605, '2014-07-21', NULL, 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

-- --------------------------------------------------------

--
-- Table structure for table `redi_vacaciones`
--

CREATE TABLE IF NOT EXISTS `redi_vacaciones` (
  `id_vacaciones` int(11) NOT NULL AUTO_INCREMENT,
  `co_vacaciones` int(11) NOT NULL COMMENT 'Código',
  `nu_docm_idnt` int(11) NOT NULL COMMENT 'N°. Cédula',
  `periodo` year(4) DEFAULT NULL COMMENT 'Año',
  `dias` int(2) NOT NULL COMMENT 'Cantidad de días',
  `dias_antg` int(2) DEFAULT NULL COMMENT 'Cantidad de días por antiguedad',
  `dias_ restantes` int(2) DEFAULT NULL COMMENT 'Días restantes',
  `disponibilidad` varchar(2) NOT NULL COMMENT 'Disponibilidad',
  `id_user_crea` varchar(11) NOT NULL COMMENT 'Creado por',
  `fe_user_crea` datetime NOT NULL COMMENT 'Creado el',
  `id_user_mod` varchar(11) DEFAULT NULL COMMENT 'Modificado por',
  `fe_user_mod` datetime DEFAULT NULL COMMENT 'Modificado el',
  `in_stat` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estatus',
  `tx_obs` varchar(200) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`co_vacaciones`),
  UNIQUE KEY `uk_id_vacaciones` (`id_vacaciones`),
  KEY `idx_nu_docm_idnt_vac` (`nu_docm_idnt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro del uso de las vacaciones del personal' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `redi_vacaciones`
--

INSERT INTO `redi_vacaciones` (`id_vacaciones`, `co_vacaciones`, `nu_docm_idnt`, `periodo`, `dias`, `dias_antg`, `dias_ restantes`, `disponibilidad`, `id_user_crea`, `fe_user_crea`, `id_user_mod`, `fe_user_mod`, `in_stat`, `tx_obs`) VALUES
(1, 1, 16913605, 2014, 30, 30, 30, 's', 'usuario', '2014-07-22 00:00:00', NULL, NULL, 'A', 'Observaciones');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cruge_authassignment`
--
ALTER TABLE `cruge_authassignment`
  ADD CONSTRAINT `fk_cruge_authassignment_cruge_authitem1` FOREIGN KEY (`itemname`) REFERENCES `cruge_authitem` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cruge_authassignment_user` FOREIGN KEY (`userid`) REFERENCES `cruge_user` (`iduser`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cruge_authitemchild`
--
ALTER TABLE `cruge_authitemchild`
  ADD CONSTRAINT `crugeauthitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `cruge_authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `crugeauthitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `cruge_authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cruge_fieldvalue`
--
ALTER TABLE `cruge_fieldvalue`
  ADD CONSTRAINT `fk_cruge_fieldvalue_cruge_user1` FOREIGN KEY (`iduser`) REFERENCES `cruge_user` (`iduser`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cruge_fieldvalue_cruge_field1` FOREIGN KEY (`idfield`) REFERENCES `cruge_field` (`idfield`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `redi_armamento`
--
ALTER TABLE `redi_armamento`
  ADD CONSTRAINT `fk_co_calibre` FOREIGN KEY (`co_calibre`) REFERENCES `redi_calibre_arma` (`co_calibre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_marca` FOREIGN KEY (`co_marca`) REFERENCES `redi_marca_arma` (`co_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_modelo_arm` FOREIGN KEY (`co_modelo`) REFERENCES `redi_modelo_arma` (`co_modelo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_tipo_arm` FOREIGN KEY (`co_tipo_arm`) REFERENCES `redi_tipo_arma` (`co_tpo_arm`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nu_docm_idnt_arm` FOREIGN KEY (`nu_docm_idnt`) REFERENCES `redi_empleados` (`nu_docm_idnt`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_asig_cargo_emp`
--
ALTER TABLE `redi_asig_cargo_emp`
  ADD CONSTRAINT `fk_co_asig_cargo_org` FOREIGN KEY (`co_asig_cargo_org`) REFERENCES `redi_asig_cargo_org` (`co_asig_cargo_org`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nu_docm_idnt_crgo` FOREIGN KEY (`nu_docm_idnt`) REFERENCES `redi_empleados` (`nu_docm_idnt`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_asig_cargo_org`
--
ALTER TABLE `redi_asig_cargo_org`
  ADD CONSTRAINT `fk_co_cargo` FOREIGN KEY (`co_cargo`) REFERENCES `redi_cargos` (`co_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_estr_org_asig_carg` FOREIGN KEY (`co_estr_org`) REFERENCES `redi_estructura_org` (`co_estr_org`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_calibre_arma`
--
ALTER TABLE `redi_calibre_arma`
  ADD CONSTRAINT `fk_co_modelo` FOREIGN KEY (`co_modelo`) REFERENCES `redi_modelo_arma` (`co_modelo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_cdad`
--
ALTER TABLE `redi_cdad`
  ADD CONSTRAINT `fk_co_edo` FOREIGN KEY (`co_edo`) REFERENCES `redi_edo` (`co_edo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_condecoraciones`
--
ALTER TABLE `redi_condecoraciones`
  ADD CONSTRAINT `fk_co_tpo_cond` FOREIGN KEY (`co_tpo_cond`) REFERENCES `redi_tpo_cond` (`co_tpo_cond`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_condecoraciones_r`
--
ALTER TABLE `redi_condecoraciones_r`
  ADD CONSTRAINT `fk_co_cond_condr` FOREIGN KEY (`co_cond`) REFERENCES `redi_condecoraciones` (`co_cond`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nu_docm_idnt_condr` FOREIGN KEY (`nu_docm_idnt`) REFERENCES `redi_empleados` (`nu_docm_idnt`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_ctrabajo`
--
ALTER TABLE `redi_ctrabajo`
  ADD CONSTRAINT `fk_nu_docm_idnt_ctrab` FOREIGN KEY (`nu_docm_idnt`) REFERENCES `redi_empleados` (`nu_docm_idnt`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nu_docm_idnt_emi` FOREIGN KEY (`nu_docm_idnt_emi`) REFERENCES `redi_empleados` (`nu_docm_idnt`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_detll_emp`
--
ALTER TABLE `redi_detll_emp`
  ADD CONSTRAINT `fk_co_armaserv` FOREIGN KEY (`co_armaserv`) REFERENCES `redi_arma_serv` (`co_armaserv`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_banco` FOREIGN KEY (`co_banco`) REFERENCES `redi_bancos` (`co_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_categoria` FOREIGN KEY (`co_categoria`) REFERENCES `redi_categoria` (`co_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_cdad_em` FOREIGN KEY (`co_cdad_em`) REFERENCES `redi_cdad` (`co_cdad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_cdad_hab` FOREIGN KEY (`co_cdad_hab`) REFERENCES `redi_cdad` (`co_cdad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_clase` FOREIGN KEY (`co_clase`) REFERENCES `redi_clase` (`co_clase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_componente` FOREIGN KEY (`co_componente`) REFERENCES `redi_componentes` (`co_componente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_edo_em` FOREIGN KEY (`co_edo_em`) REFERENCES `redi_edo` (`co_edo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_edo_hab` FOREIGN KEY (`co_edo_hab`) REFERENCES `redi_edo` (`co_edo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_espmil` FOREIGN KEY (`co_espmil`) REFERENCES `redi_especialidades` (`co_especialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_espmil2` FOREIGN KEY (`co_espmil2`) REFERENCES `redi_especialidades` (`co_especialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_muncp_em` FOREIGN KEY (`co_muncp_em`) REFERENCES `redi_muncp` (`co_muncp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_muncp_hab` FOREIGN KEY (`co_muncp_hab`) REFERENCES `redi_muncp` (`co_muncp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_reg_em` FOREIGN KEY (`co_reg_em`) REFERENCES `redi_region` (`co_reg`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_co_reg_hab` FOREIGN KEY (`co_reg_hab`) REFERENCES `redi_region` (`co_reg`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nu_docm_idnt` FOREIGN KEY (`nu_docm_idnt`) REFERENCES `redi_empleados` (`nu_docm_idnt`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_talla_calzado` FOREIGN KEY (`talla_calzado`) REFERENCES `redi_tallas` (`co_talla`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_talla_camisa` FOREIGN KEY (`talla_camisa`) REFERENCES `redi_tallas` (`co_talla`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_talla_gorra` FOREIGN KEY (`talla_gorra`) REFERENCES `redi_tallas` (`co_talla`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_talla_pantalon` FOREIGN KEY (`talla_pantalon`) REFERENCES `redi_tallas` (`co_talla`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_talla_patriota` FOREIGN KEY (`talla_patriota`) REFERENCES `redi_tallas` (`co_talla`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_edo`
--
ALTER TABLE `redi_edo`
  ADD CONSTRAINT `fk_co_reg` FOREIGN KEY (`co_reg`) REFERENCES `redi_region` (`co_reg`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_empleados`
--
ALTER TABLE `redi_empleados`
  ADD CONSTRAINT `fk_co_grado` FOREIGN KEY (`co_grado`) REFERENCES `redi_grados` (`co_grado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nu_docm_idnt_dpnd` FOREIGN KEY (`nu_docm_idnt_dpnd`) REFERENCES `redi_empleados` (`nu_docm_idnt`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_estructura_org`
--
ALTER TABLE `redi_estructura_org`
  ADD CONSTRAINT `fk_co_estr_org` FOREIGN KEY (`co_estr_org_dep`) REFERENCES `redi_estructura_org` (`co_estr_org`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_hijos`
--
ALTER TABLE `redi_hijos`
  ADD CONSTRAINT `fk_nu_docm_idnt_hjs` FOREIGN KEY (`nu_docm_idnt`) REFERENCES `redi_empleados` (`nu_docm_idnt`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_marca_arma`
--
ALTER TABLE `redi_marca_arma`
  ADD CONSTRAINT `fk_co_tpo_arm` FOREIGN KEY (`co_tpo_arm`) REFERENCES `redi_tipo_arma` (`co_tpo_arm`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_modelo_arma`
--
ALTER TABLE `redi_modelo_arma`
  ADD CONSTRAINT `fk_co_marca_model` FOREIGN KEY (`co_marca`) REFERENCES `redi_marca_arma` (`co_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_muncp`
--
ALTER TABLE `redi_muncp`
  ADD CONSTRAINT `fk_co_cdad` FOREIGN KEY (`co_cdad`) REFERENCES `redi_cdad` (`co_cdad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_prog_vcnes`
--
ALTER TABLE `redi_prog_vcnes`
  ADD CONSTRAINT `fk_co_vacaciones` FOREIGN KEY (`co_vacaciones`) REFERENCES `redi_vacaciones` (`co_vacaciones`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_situacion`
--
ALTER TABLE `redi_situacion`
  ADD CONSTRAINT `fk_co_tsituacion` FOREIGN KEY (`co_tsituacion`) REFERENCES `redi_t_situaion` (`co_tsituacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nu_docm_idnt_sit` FOREIGN KEY (`nu_docm_idnt`) REFERENCES `redi_empleados` (`nu_docm_idnt`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_sueldo`
--
ALTER TABLE `redi_sueldo`
  ADD CONSTRAINT `fk_nu_docm_idnt_sldo` FOREIGN KEY (`nu_docm_idnt`) REFERENCES `redi_empleados` (`nu_docm_idnt`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_ubicacion_adm`
--
ALTER TABLE `redi_ubicacion_adm`
  ADD CONSTRAINT `fk_co_estr_org_ubic` FOREIGN KEY (`co_estr_org`) REFERENCES `redi_estructura_org` (`co_estr_org`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nu_docm_idnt_ubic` FOREIGN KEY (`nu_docm_idnt`) REFERENCES `redi_empleados` (`nu_docm_idnt`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `redi_vacaciones`
--
ALTER TABLE `redi_vacaciones`
  ADD CONSTRAINT `fk_nu_docm_idnt_vac` FOREIGN KEY (`nu_docm_idnt`) REFERENCES `redi_empleados` (`nu_docm_idnt`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
