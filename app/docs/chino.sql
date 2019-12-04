-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 20-05-2013 a las 21:44:32
-- Versión del servidor: 5.5.30
-- Versión de PHP: 5.4.4-14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `chino`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCate` varchar(50) NOT NULL,
  `descripcionCate` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `nombreCate`, `descripcionCate`) VALUES
(1, 'deportes', 'articulos deportivos'),
(2, 'Deterjentes', 'sfsdgaadg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `idCLiente` int(11) NOT NULL AUTO_INCREMENT,
  `cedulaRifCli` int(14) NOT NULL,
  `nombreCli` varchar(30) NOT NULL,
  `apellidoCli` varchar(30) NOT NULL,
  `generoCli` char(1) NOT NULL,
  `descripcionCli` varchar(100) DEFAULT NULL,
  `telefonoCli` varchar(20) NOT NULL,
  `direccionCli` varchar(255) NOT NULL,
  `correoCli` varchar(100) NOT NULL,
  PRIMARY KEY (`idCLiente`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCLiente`, `cedulaRifCli`, `nombreCli`, `apellidoCli`, `generoCli`, `descripcionCli`, `telefonoCli`, `direccionCli`, `correoCli`) VALUES
(1, 20144088, 'till', 'Jimenez', 'M', 'le hacker de venezuela xD', '4261252274', 'internet', 'till.haxor@gmail.com'),
(2, 17688231, 'Pedro j', 'Torres', 'M', 'sdgdsgdgsgs', '234363656', 'abcedfssf', 'pedrot1911@gmail.com'),
(3, 12345678, 'david jaa', 'zerpa', 'M', 'dd', '1234567890', 'dfdfds', 'jfdjfdj@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compraProd`
--

CREATE TABLE IF NOT EXISTS `compraProd` (
  `idCompraProd` int(11) NOT NULL AUTO_INCREMENT,
  `idProductos` int(11) NOT NULL,
  `unidadProd` int(10) NOT NULL,
  `fechaIngProd` date NOT NULL,
  `costoProd` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`idCompraProd`),
  KEY `idProductos` (`idProductos`),
  KEY `idProductos_2` (`idProductos`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `compraProd`
--

INSERT INTO `compraProd` (`idCompraProd`, `idProductos`, `unidadProd`, `fechaIngProd`, `costoProd`) VALUES
(2, 1, 30, '2013-05-18', 5000.00),
(3, 1, 30, '2013-05-18', 5000.00),
(4, 1, 30, '2013-05-19', 5000.00),
(5, 1, 40, '2013-05-19', 6000.00),
(6, 1, 20, '2013-05-19', 4000.00),
(7, 1, 30, '2013-05-20', 6000.00),
(8, 1, 20, '2013-05-20', 4000.00),
(9, 1, 30, '2013-05-20', 8000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `idProductos` int(11) NOT NULL AUTO_INCREMENT,
  `idCategoria` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `codigoProd` varchar(10) NOT NULL,
  `referenciaProd` varchar(50) DEFAULT NULL,
  `nombreProd` varchar(100) NOT NULL,
  `marcaProd` varchar(50) NOT NULL,
  `modeloProd` varchar(50) NOT NULL,
  `descripcionProd` varchar(255) NOT NULL,
  `tipoProd` char(15) NOT NULL,
  `ubicacionProd` varchar(30) DEFAULT NULL,
  `precioProd` float NOT NULL,
  `existenciaProd` int(8) NOT NULL,
  PRIMARY KEY (`idProductos`),
  KEY `idCategoria` (`idCategoria`),
  KEY `idProveedor` (`idProveedor`),
  KEY `idCategoria_2` (`idCategoria`),
  KEY `idProveedor_2` (`idProveedor`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProductos`, `idCategoria`, `idProveedor`, `codigoProd`, `referenciaProd`, `nombreProd`, `marcaProd`, `modeloProd`, `descripcionProd`, `tipoProd`, `ubicacionProd`, `precioProd`, `existenciaProd`) VALUES
(1, 1, 1, '123456', 'dfdf', 'pelotaa', 'wilson', 'bolleyball', 'ffsff', 'Importado', 'fdd', 500, 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
  `idProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `rifProv` varchar(15) DEFAULT NULL,
  `nombreProv` varchar(100) NOT NULL,
  `fechaIngProv` date NOT NULL,
  `descripcionProv` varchar(100) NOT NULL,
  `statusProv` varchar(10) NOT NULL,
  `telefonoProv` varchar(20) NOT NULL,
  `correoProv` varchar(100) NOT NULL,
  `direccionProv` varchar(255) NOT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `rifProv`, `nombreProv`, `fechaIngProv`, `descripcionProv`, `statusProv`, `telefonoProv`, `correoProv`, `direccionProv`) VALUES
(1, 'V-20144088-9', 'till', '2013-05-29', 'no se nada', 'Activo', '232325334', 'fg@sff.com', 'dfddgdg'),
(2, 'v-176882314', 'jesus', '2013-05-20', 'wqwrrertrfttr', 'Activo', '123456784', 'pedr0@gmail.com', 'fdfsdjfsefje');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(12) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `email` varchar(30) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(40) NOT NULL,
  `perfil` varchar(25) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `cedula`, `nombre`, `apellido`, `email`, `username`, `password`, `perfil`, `created_at`, `last_login`) VALUES
(1, 17688231, 'pedro', 'torres', 'pedrot1911@gmail.com', 'pedro', 'c6cc8094c2dc07b700ffcc36d64e2138', 'admin', '2013-05-20 21:40:14', '2013-05-20 21:40:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE IF NOT EXISTS `ventas` (
  `idVentas` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idProductos` int(11) NOT NULL,
  `codigoVent` varchar(30) NOT NULL,
  `cantidadPVent` int(10) NOT NULL,
  `fechaVent` date NOT NULL,
  `totalVent` decimal(9,2) NOT NULL,
  PRIMARY KEY (`idVentas`),
  KEY `idCliente` (`idCliente`),
  KEY `idProductos` (`idProductos`),
  KEY `idCliente_2` (`idCliente`),
  KEY `idProductos_2` (`idProductos`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idVentas`, `idCliente`, `idProductos`, `codigoVent`, `cantidadPVent`, `fechaVent`, `totalVent`) VALUES
(1, 1, 1, '16262', 20, '2013-05-19', 10000.00),
(2, 1, 1, '38742', 1, '2013-05-20', 500.00),
(3, 1, 1, '38742', 5, '2013-05-20', 2500.00),
(4, 1, 1, '97042', 20, '2013-05-20', 10000.00),
(5, 2, 1, '79226', 1, '2013-05-20', 500.00),
(6, 2, 1, '61595', 1, '2013-05-20', 500.00),
(7, 2, 1, '56956', 1, '2013-05-20', 500.00),
(8, 2, 1, '15085', 1, '2013-05-20', 500.00);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compraProd`
--
ALTER TABLE `compraProd`
  ADD CONSTRAINT `compraProd_ibfk_1` FOREIGN KEY (`idProductos`) REFERENCES `productos` (`idProductos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCLiente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`idProductos`) REFERENCES `productos` (`idProductos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
