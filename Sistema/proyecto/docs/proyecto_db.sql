-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-12-2015 a las 02:09:08
-- Versión del servidor: 10.1.8-MariaDB
-- Versión de PHP: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id_cargos` int(11) NOT NULL,
  `nb_cargos` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`id_cargos`, `nb_cargos`) VALUES
(1, 'Jefe de Estado Mayor'),
(2, 'Jefe de Puesto de Comando'),
(3, 'Secretaria'),
(4, 'Analista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id_ciudad` int(11) NOT NULL,
  `nb_ciudad` varchar(30) NOT NULL,
  `id_edo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id_ciudad`, `nb_ciudad`, `id_edo`) VALUES
(1, 'San Juan de los Morros', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruge_authassignment`
--

CREATE TABLE `cruge_authassignment` (
  `userid` int(11) NOT NULL,
  `bizrule` text,
  `data` text,
  `itemname` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruge_authitem`
--

CREATE TABLE `cruge_authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cruge_authitem`
--

INSERT INTO `cruge_authitem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('action_cargos_admin', 0, '', NULL, 'N;'),
('action_cargos_create', 0, '', NULL, 'N;'),
('action_cargos_delete', 0, '', NULL, 'N;'),
('action_cargos_index', 0, '', NULL, 'N;'),
('action_cargos_update', 0, '', NULL, 'N;'),
('action_cargos_view', 0, '', NULL, 'N;'),
('action_ciudad_admin', 0, '', NULL, 'N;'),
('action_ciudad_create', 0, '', NULL, 'N;'),
('action_ciudad_delete', 0, '', NULL, 'N;'),
('action_ciudad_index', 0, '', NULL, 'N;'),
('action_ciudad_update', 0, '', NULL, 'N;'),
('action_ciudad_view', 0, '', NULL, 'N;'),
('action_depend_admin', 0, '', NULL, 'N;'),
('action_depend_create', 0, '', NULL, 'N;'),
('action_depend_delete', 0, '', NULL, 'N;'),
('action_depend_index', 0, '', NULL, 'N;'),
('action_depend_update', 0, '', NULL, 'N;'),
('action_depend_view', 0, '', NULL, 'N;'),
('action_estado_admin', 0, '', NULL, 'N;'),
('action_estado_create', 0, '', NULL, 'N;'),
('action_estado_delete', 0, '', NULL, 'N;'),
('action_estado_index', 0, '', NULL, 'N;'),
('action_estado_update', 0, '', NULL, 'N;'),
('action_estado_view', 0, '', NULL, 'N;'),
('action_grados_admin', 0, '', NULL, 'N;'),
('action_grados_create', 0, '', NULL, 'N;'),
('action_grados_delete', 0, '', NULL, 'N;'),
('action_grados_index', 0, '', NULL, 'N;'),
('action_grados_update', 0, '', NULL, 'N;'),
('action_grados_view', 0, '', NULL, 'N;'),
('action_muncp_admin', 0, '', NULL, 'N;'),
('action_muncp_create', 0, '', NULL, 'N;'),
('action_muncp_delete', 0, '', NULL, 'N;'),
('action_muncp_index', 0, '', NULL, 'N;'),
('action_muncp_update', 0, '', NULL, 'N;'),
('action_muncp_view', 0, '', NULL, 'N;'),
('action_parroquia_admin', 0, '', NULL, 'N;'),
('action_parroquia_create', 0, '', NULL, 'N;'),
('action_parroquia_delete', 0, '', NULL, 'N;'),
('action_parroquia_index', 0, '', NULL, 'N;'),
('action_parroquia_update', 0, '', NULL, 'N;'),
('action_parroquia_view', 0, '', NULL, 'N;'),
('action_personal_admin', 0, '', NULL, 'N;'),
('action_personal_create', 0, '', NULL, 'N;'),
('action_personal_delete', 0, '', NULL, 'N;'),
('action_personal_index', 0, '', NULL, 'N;'),
('action_personal_update', 0, '', NULL, 'N;'),
('action_personal_view', 0, '', NULL, 'N;'),
('action_site_contact', 0, '', NULL, 'N;'),
('action_site_error', 0, '', NULL, 'N;'),
('action_site_index', 0, '', NULL, 'N;'),
('action_site_login', 0, '', NULL, 'N;'),
('action_site_logout', 0, '', NULL, 'N;'),
('action_tipounidad_admin', 0, '', NULL, 'N;'),
('action_tipounidad_create', 0, '', NULL, 'N;'),
('action_tipounidad_delete', 0, '', NULL, 'N;'),
('action_tipounidad_index', 0, '', NULL, 'N;'),
('action_tipounidad_update', 0, '', NULL, 'N;'),
('action_tipounidad_view', 0, '', NULL, 'N;'),
('action_unidades_admin', 0, '', NULL, 'N;'),
('action_unidades_create', 0, '', NULL, 'N;'),
('action_unidades_delete', 0, '', NULL, 'N;'),
('action_unidades_index', 0, '', NULL, 'N;'),
('action_unidades_update', 0, '', NULL, 'N;'),
('action_unidades_view', 0, '', NULL, 'N;'),
('controller_cargos', 0, '', NULL, 'N;'),
('controller_ciudad', 0, '', NULL, 'N;'),
('controller_depend', 0, '', NULL, 'N;'),
('controller_estado', 0, '', NULL, 'N;'),
('controller_grados', 0, '', NULL, 'N;'),
('controller_muncp', 0, '', NULL, 'N;'),
('controller_parroquia', 0, '', NULL, 'N;'),
('controller_personal', 0, '', NULL, 'N;'),
('controller_site', 0, '', NULL, 'N;'),
('controller_tipounidad', 0, '', NULL, 'N;'),
('controller_unidades', 0, '', NULL, 'N;');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruge_authitemchild`
--

CREATE TABLE `cruge_authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruge_field`
--

CREATE TABLE `cruge_field` (
  `idfield` int(11) NOT NULL,
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
  `predetvalue` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruge_fieldvalue`
--

CREATE TABLE `cruge_fieldvalue` (
  `idfieldvalue` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idfield` int(11) NOT NULL,
  `value` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruge_session`
--

CREATE TABLE `cruge_session` (
  `idsession` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `created` bigint(30) DEFAULT NULL,
  `expire` bigint(30) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `ipaddress` varchar(45) DEFAULT NULL,
  `usagecount` int(11) DEFAULT '0',
  `lastusage` bigint(30) DEFAULT NULL,
  `logoutdate` bigint(30) DEFAULT NULL,
  `ipaddressout` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cruge_session`
--

INSERT INTO `cruge_session` (`idsession`, `iduser`, `created`, `expire`, `status`, `ipaddress`, `usagecount`, `lastusage`, `logoutdate`, `ipaddressout`) VALUES
(13, 1, 1448082691, 1448100691, 0, '127.0.0.1', 1, 1448082691, NULL, NULL),
(14, 1, 1448117304, 1448135304, 0, '127.0.0.1', 4, 1448128689, NULL, NULL),
(15, 1, 1448135646, 1448153646, 0, '127.0.0.1', 1, 1448135646, NULL, NULL),
(16, 1, 1448154223, 1448172223, 0, '127.0.0.1', 1, 1448154223, NULL, NULL),
(17, 1, 1448218163, 1448236163, 1, '127.0.0.1', 2, 1448218164, NULL, NULL),
(18, 1, 1448246561, 1448264561, 0, '127.0.0.1', 1, 1448246561, NULL, NULL),
(19, 1, 1448285965, 1448303965, 0, '127.0.0.1', 2, 1448291123, NULL, NULL),
(20, 1, 1448318827, 1448336827, 0, '127.0.0.1', 1, 1448318827, 1448326258, '127.0.0.1'),
(21, 1, 1448326319, 1448344319, 0, '127.0.0.1', 1, 1448326319, NULL, NULL),
(22, 1, 1448380597, 1448398597, 0, '127.0.0.1', 1, 1448380597, NULL, NULL),
(23, 1, 1448421355, 1448439355, 0, '127.0.0.1', 1, 1448421355, 1448423978, '127.0.0.1'),
(24, 1, 1448461675, 1448479675, 0, '127.0.0.1', 1, 1448461675, 1448462980, '127.0.0.1'),
(25, 1, 1449274947, 1449292947, 1, '127.0.0.1', 1, 1449274947, NULL, NULL),
(26, 1, 1449360222, 1449378222, 1, '127.0.0.1', 1, 1449360222, NULL, NULL),
(27, 1, 1449968266, 1449986266, 0, '127.0.0.1', 1, 1449968266, 1449968272, '127.0.0.1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruge_system`
--

CREATE TABLE `cruge_system` (
  `idsystem` int(11) NOT NULL,
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
  `registrationonlogin` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cruge_system`
--

INSERT INTO `cruge_system` (`idsystem`, `name`, `largename`, `sessionmaxdurationmins`, `sessionmaxsameipconnections`, `sessionreusesessions`, `sessionmaxsessionsperday`, `sessionmaxsessionsperuser`, `systemnonewsessions`, `systemdown`, `registerusingcaptcha`, `registerusingterms`, `terms`, `registerusingactivation`, `defaultroleforregistration`, `registerusingtermslabel`, `registrationonlogin`) VALUES
(1, 'default', NULL, 300, 10, 1, -1, -1, 0, 0, 0, 0, '', 0, '', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruge_user`
--

CREATE TABLE `cruge_user` (
  `iduser` int(11) NOT NULL,
  `regdate` bigint(30) DEFAULT NULL,
  `actdate` bigint(30) DEFAULT NULL,
  `logondate` bigint(30) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL COMMENT 'Hashed password',
  `authkey` varchar(100) DEFAULT NULL COMMENT 'llave de autentificacion',
  `state` int(11) DEFAULT '0',
  `totalsessioncounter` int(11) DEFAULT '0',
  `currentsessioncounter` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cruge_user`
--

INSERT INTO `cruge_user` (`iduser`, `regdate`, `actdate`, `logondate`, `username`, `email`, `password`, `authkey`, `state`, `totalsessioncounter`, `currentsessioncounter`) VALUES
(1, NULL, NULL, 1449968266, 'admin', 'admin@tucorreo.com', '21232f297a57a5a743894a0e4a801fc3', NULL, 1, 0, 0),
(2, 1415311728, NULL, NULL, 'invitado', 'invitado@invitado.com', 'e10adc3949ba59abbe56e057f20f883e', 'c97e31dbbcdd35590dbeb0d3f380c913', 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depend`
--

CREATE TABLE `depend` (
  `id_dep` int(11) NOT NULL,
  `nb_dep` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `depend`
--

INSERT INTO `depend` (`id_dep`, `nb_dep`) VALUES
(1, 'Jefatura'),
(2, 'Comando');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_edo` int(11) NOT NULL,
  `nb_edo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_edo`, `nb_edo`) VALUES
(1, 'Guarico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

CREATE TABLE `grados` (
  `id_grados` int(11) NOT NULL,
  `nb_grados` varchar(50) NOT NULL,
  `abreviatura` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grados`
--

INSERT INTO `grados` (`id_grados`, `nb_grados`, `abreviatura`) VALUES
(1, 'General en Jefe', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muncp`
--

CREATE TABLE `muncp` (
  `id_muncp` int(11) NOT NULL,
  `nb_muncp` varchar(30) NOT NULL,
  `id_ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `muncp`
--

INSERT INTO `muncp` (`id_muncp`, `nb_muncp`, `id_ciudad`) VALUES
(1, 'Roscio', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquia`
--

CREATE TABLE `parroquia` (
  `id_prrq` int(11) NOT NULL,
  `nb_prrq` varchar(30) NOT NULL,
  `id_muncp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parroquia`
--

INSERT INTO `parroquia` (`id_prrq`, `nb_prrq`, `id_muncp`) VALUES
(1, 'San Juan', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id_personal` int(11) NOT NULL,
  `nu_docm_idnt` int(11) NOT NULL,
  `username` varchar(10) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `nu_tlf_local` varchar(15) DEFAULT NULL,
  `nu_tlf_cel` varchar(15) DEFAULT NULL,
  `id_depen` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `unidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id_personal`, `nu_docm_idnt`, `username`, `nombre`, `apellido`, `sexo`, `email`, `nu_tlf_local`, `nu_tlf_cel`, `id_depen`, `id_cargo`, `id_grado`, `unidad`) VALUES
(1, 20878863, 'invitado', 'Maria', 'Delgado', 'F', 'maria', '2390390193', '038203280', 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_unidad`
--

CREATE TABLE `tipo_unidad` (
  `id_tipo_unidad` int(11) NOT NULL,
  `nb_tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_unidad`
--

INSERT INTO `tipo_unidad` (`id_tipo_unidad`, `nb_tipo`) VALUES
(1, 'Zodi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `id_unid` int(11) NOT NULL,
  `nb_unid` varchar(50) NOT NULL,
  `coor_unid` varchar(100) DEFAULT NULL,
  `id_prrq` int(11) DEFAULT NULL,
  `persona_encarg` varchar(45) NOT NULL,
  `tipo_unid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id_unid`, `nb_unid`, `coor_unid`, `id_prrq`, `persona_encarg`, `tipo_unid`) VALUES
(2, 'Zodi San Juan', '23 45 67', 1, 'Francesca', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id_cargos`),
  ADD UNIQUE KEY `id_depend_UNIQUE` (`id_cargos`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id_ciudad`),
  ADD UNIQUE KEY `id_edo_UNIQUE` (`id_ciudad`),
  ADD KEY `fk_muncp_estado1_idx` (`id_edo`);

--
-- Indices de la tabla `cruge_authassignment`
--
ALTER TABLE `cruge_authassignment`
  ADD PRIMARY KEY (`userid`,`itemname`),
  ADD KEY `fk_cruge_authassignment_cruge_authitem1` (`itemname`),
  ADD KEY `fk_cruge_authassignment_user` (`userid`);

--
-- Indices de la tabla `cruge_authitem`
--
ALTER TABLE `cruge_authitem`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `cruge_authitemchild`
--
ALTER TABLE `cruge_authitemchild`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indices de la tabla `cruge_field`
--
ALTER TABLE `cruge_field`
  ADD PRIMARY KEY (`idfield`);

--
-- Indices de la tabla `cruge_fieldvalue`
--
ALTER TABLE `cruge_fieldvalue`
  ADD PRIMARY KEY (`idfieldvalue`),
  ADD KEY `fk_cruge_fieldvalue_cruge_user1` (`iduser`),
  ADD KEY `fk_cruge_fieldvalue_cruge_field1` (`idfield`);

--
-- Indices de la tabla `cruge_session`
--
ALTER TABLE `cruge_session`
  ADD PRIMARY KEY (`idsession`),
  ADD KEY `crugesession_iduser` (`iduser`);

--
-- Indices de la tabla `cruge_system`
--
ALTER TABLE `cruge_system`
  ADD PRIMARY KEY (`idsystem`);

--
-- Indices de la tabla `cruge_user`
--
ALTER TABLE `cruge_user`
  ADD PRIMARY KEY (`iduser`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- Indices de la tabla `depend`
--
ALTER TABLE `depend`
  ADD PRIMARY KEY (`id_dep`),
  ADD UNIQUE KEY `id_depend_UNIQUE` (`id_dep`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_edo`),
  ADD UNIQUE KEY `id_edo_UNIQUE` (`id_edo`);

--
-- Indices de la tabla `grados`
--
ALTER TABLE `grados`
  ADD PRIMARY KEY (`id_grados`),
  ADD UNIQUE KEY `id_depend_UNIQUE` (`id_grados`);

--
-- Indices de la tabla `muncp`
--
ALTER TABLE `muncp`
  ADD PRIMARY KEY (`id_muncp`),
  ADD UNIQUE KEY `id_edo_UNIQUE` (`id_muncp`),
  ADD KEY `fk_ciudad_muncp1_idx` (`id_ciudad`);

--
-- Indices de la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD PRIMARY KEY (`id_prrq`),
  ADD UNIQUE KEY `id_edo_UNIQUE` (`id_prrq`),
  ADD KEY `fk_parroquia_ciudad1_idx` (`id_muncp`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id_personal`),
  ADD UNIQUE KEY `id_personal_UNIQUE` (`id_personal`),
  ADD UNIQUE KEY `nu_docm_idnt_UNIQUE` (`nu_docm_idnt`),
  ADD KEY `fk_personal_unidades1_idx` (`unidad`),
  ADD KEY `fk_personal_grados1_idx` (`id_grado`),
  ADD KEY `fk_personal_cargos1_idx` (`id_cargo`),
  ADD KEY `fk_personal_depend1_idx` (`id_depen`),
  ADD KEY `fk_personal_cruge_user1_idx` (`username`);

--
-- Indices de la tabla `tipo_unidad`
--
ALTER TABLE `tipo_unidad`
  ADD PRIMARY KEY (`id_tipo_unidad`),
  ADD UNIQUE KEY `id_tipo_unidad_UNIQUE` (`id_tipo_unidad`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id_unid`),
  ADD UNIQUE KEY `id_unid_UNIQUE` (`id_unid`),
  ADD KEY `fk_unidades_tipo_unidad1_idx` (`tipo_unid`),
  ADD KEY `fk_unidades_parroquia1_idx` (`id_prrq`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id_cargos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id_ciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cruge_field`
--
ALTER TABLE `cruge_field`
  MODIFY `idfield` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cruge_fieldvalue`
--
ALTER TABLE `cruge_fieldvalue`
  MODIFY `idfieldvalue` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cruge_session`
--
ALTER TABLE `cruge_session`
  MODIFY `idsession` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `cruge_system`
--
ALTER TABLE `cruge_system`
  MODIFY `idsystem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cruge_user`
--
ALTER TABLE `cruge_user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `depend`
--
ALTER TABLE `depend`
  MODIFY `id_dep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_edo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `grados`
--
ALTER TABLE `grados`
  MODIFY `id_grados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `muncp`
--
ALTER TABLE `muncp`
  MODIFY `id_muncp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `parroquia`
--
ALTER TABLE `parroquia`
  MODIFY `id_prrq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipo_unidad`
--
ALTER TABLE `tipo_unidad`
  MODIFY `id_tipo_unidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id_unid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `fk_muncp_estado1` FOREIGN KEY (`id_edo`) REFERENCES `estado` (`id_edo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cruge_authassignment`
--
ALTER TABLE `cruge_authassignment`
  ADD CONSTRAINT `fk_cruge_authassignment_cruge_authitem1` FOREIGN KEY (`itemname`) REFERENCES `cruge_authitem` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cruge_authassignment_user` FOREIGN KEY (`userid`) REFERENCES `cruge_user` (`iduser`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cruge_authitemchild`
--
ALTER TABLE `cruge_authitemchild`
  ADD CONSTRAINT `crugeauthitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `cruge_authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `crugeauthitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `cruge_authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cruge_fieldvalue`
--
ALTER TABLE `cruge_fieldvalue`
  ADD CONSTRAINT `fk_cruge_fieldvalue_cruge_field1` FOREIGN KEY (`idfield`) REFERENCES `cruge_field` (`idfield`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cruge_fieldvalue_cruge_user1` FOREIGN KEY (`iduser`) REFERENCES `cruge_user` (`iduser`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `muncp`
--
ALTER TABLE `muncp`
  ADD CONSTRAINT `fk_ciudad_muncp1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD CONSTRAINT `fk_parroquia_ciudad1` FOREIGN KEY (`id_muncp`) REFERENCES `muncp` (`id_muncp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `fk_personal_cargos1` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id_cargos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personal_cruge_user1` FOREIGN KEY (`username`) REFERENCES `cruge_user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personal_depend1` FOREIGN KEY (`id_depen`) REFERENCES `depend` (`id_dep`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personal_grados1` FOREIGN KEY (`id_grado`) REFERENCES `grados` (`id_grados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personal_unidades1` FOREIGN KEY (`unidad`) REFERENCES `unidades` (`id_unid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD CONSTRAINT `fk_unidades_parroquia1` FOREIGN KEY (`id_prrq`) REFERENCES `parroquia` (`id_prrq`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_unidades_tipo_unidad1` FOREIGN KEY (`tipo_unid`) REFERENCES `tipo_unidad` (`id_tipo_unidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
