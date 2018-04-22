-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-04-2018 a las 22:00:41
-- Versión del servidor: 10.1.29-MariaDB
-- Versión de PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `limpia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobrador`
--

CREATE TABLE `cobrador` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET latin1 NOT NULL,
  `password` varchar(8) CHARACTER SET latin1 NOT NULL,
  `foto` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `rol` varchar(20) CHARACTER SET latin1 NOT NULL,
  `usuario` varchar(60) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cobrador`
--

INSERT INTO `cobrador` (`id`, `nombre`, `password`, `foto`, `estado`, `rol`, `usuario`) VALUES
(18, 'Marichell Medina Limón', '8495', 'vistas/img/usuarios/marichell/224.jpg', 1, 'Administrador', 'marichell'),
(19, 'Giusseppe Zarrabal Estrada', '1234', 'vistas/img/usuarios/chepe/609.jpg', 1, 'Cobrador', 'chepe'),
(20, 'Patricia Gonzáles', '1234', 'vistas/img/usuarios/patricia/160.jpg', 0, 'Cobrador', 'patricia'),
(21, 'Ana Uscanga', '1234', 'vistas/img/usuarios/ana/489.jpg', 0, 'Cobrador', 'ana'),
(22, 'Martin Cruz', '1234', 'vistas/img/usuarios/martin/750.jpg', 0, 'Cobrador', 'martin'),
(23, 'Aritza Aritza', '1234', 'vistas/img/usuarios/aritza/182.jpg', 1, 'Cobrador', 'aritza'),
(24, 'Marcela Navarro', '1234', 'vistas/img/usuarios/marcela/221.jpg', 0, 'Cobrador', 'marcela');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobros`
--

CREATE TABLE `cobros` (
  `id` int(11) NOT NULL,
  `contribuyente` varchar(50) CHARACTER SET latin1 NOT NULL,
  `comercio` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `importe` decimal(12,2) NOT NULL,
  `detalle` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `imagen` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `tipo` varchar(20) CHARACTER SET latin1 NOT NULL,
  `fecha` datetime NOT NULL,
  `direccion` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `coordenadas` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `cobrador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cobros`
--

INSERT INTO `cobros` (`id`, `contribuyente`, `comercio`, `importe`, `detalle`, `imagen`, `tipo`, `fecha`, `direccion`, `coordenadas`, `cobrador`) VALUES
(55, 'kevin', NULL, '10.00', NULL, NULL, 'vivienda', '2018-03-01 04:00:35', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(56, 'ayrton', NULL, '10.00', NULL, NULL, 'vivienda', '2018-03-02 04:00:50', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(58, 'iker', 'video juegos', '50.00', 'para un mes', 'http://192.168.1.68/pagos/vistas/Json/detalle/uploads/47.png', 'comercio', '2018-03-03 04:02:29', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(59, 'antonio', 'imss', '100.00', '2 meses', NULL, 'comercio', '2018-03-04 04:03:13', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(60, 'mirjana', NULL, '10.00', NULL, NULL, 'vivienda', '2018-03-05 04:04:40', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 23),
(61, 'marichell', 'owl', '200.00', '4 meses', 'http://192.168.1.68/pagos/vistas/Json/detalle/uploads/50.png', 'comercio', '2018-03-06 04:06:04', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 23),
(62, 'kevin', NULL, '10.00', NULL, NULL, 'vivienda', '2018-03-06 04:00:35', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(63, 'ayrton', NULL, '10.00', NULL, NULL, 'vivienda', '2018-03-05 04:00:50', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(64, 'iker', 'video juegos', '50.00', 'para un mes', 'http://192.168.1.68/pagos/vistas/Json/detalle/uploads/47.png', 'comercio', '2018-03-04 04:02:29', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(65, 'antonio', 'imss', '100.00', '2 meses', NULL, 'comercio', '2018-03-03 04:03:13', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(66, 'mirjana', NULL, '10.00', NULL, NULL, 'vivienda', '2018-03-02 04:04:40', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 23),
(67, 'marichell', 'owl', '200.00', '4 meses', 'http://192.168.1.68/pagos/vistas/Json/detalle/uploads/50.png', 'comercio', '2018-03-01 04:06:04', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 23),
(68, 'kevin', NULL, '10.00', NULL, NULL, 'vivienda', '2018-03-07 04:00:35', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(69, 'ayrton', NULL, '10.00', NULL, NULL, 'vivienda', '2018-03-08 04:00:50', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(70, 'iker', 'video juegos', '50.00', 'para un mes', 'http://192.168.1.68/pagos/vistas/Json/detalle/uploads/47.png', 'comercio', '2018-03-09 04:02:29', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(71, 'antonio', 'imss', '100.00', '2 meses', NULL, 'comercio', '2018-03-10 04:03:13', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(72, 'mirjana', NULL, '10.00', NULL, NULL, 'vivienda', '2018-03-11 04:04:40', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 23),
(73, 'marichell', 'owl', '200.00', '4 meses', 'http://192.168.1.68/pagos/vistas/Json/detalle/uploads/50.png', 'comercio', '2018-03-12 04:06:04', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 23),
(74, 'kevin', NULL, '10.00', NULL, NULL, 'vivienda', '2018-03-12 04:00:35', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(75, 'ayrton', NULL, '10.00', NULL, NULL, 'vivienda', '2018-03-11 04:00:50', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(76, 'iker', 'video juegos', '50.00', 'para un mes', 'http://192.168.1.68/pagos/vistas/Json/detalle/uploads/47.png', 'comercio', '2018-03-10 04:02:29', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(77, 'antonio', 'imss', '100.00', '2 meses', NULL, 'comercio', '2018-03-09 04:03:13', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(78, 'mirjana', NULL, '10.00', NULL, NULL, 'vivienda', '2018-03-08 04:04:40', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 23),
(79, 'marichell', 'owl', '200.00', '4 meses', 'http://192.168.1.68/pagos/vistas/Json/detalle/uploads/50.png', 'comercio', '2018-03-07 04:06:04', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 23),
(80, 'marichell', 'owl', '200.00', '4 meses', 'http://192.168.1.68/pagos/vistas/Json/detalle/uploads/50.png', 'comercio', '2018-02-01 04:06:04', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 23),
(81, 'kevin', NULL, '10.00', NULL, NULL, 'vivienda', '2018-02-01 04:00:35', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(82, 'ayrton', NULL, '10.00', NULL, NULL, 'vivienda', '2018-02-02 04:00:50', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(83, 'iker', 'video juegos', '50.00', 'para un mes', 'http://192.168.1.68/pagos/vistas/Json/detalle/uploads/47.png', 'comercio', '2018-02-03 04:02:29', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(84, 'antonio', 'imss', '100.00', '2 meses', NULL, 'comercio', '2018-02-04 04:03:13', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(85, 'mirjana', NULL, '10.00', NULL, NULL, 'vivienda', '2018-02-05 04:04:40', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 23),
(86, 'marichell', 'owl', '200.00', '4 meses', 'http://192.168.1.68/pagos/vistas/Json/detalle/uploads/50.png', 'comercio', '2018-02-06 04:06:04', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 23),
(87, 'kevin', NULL, '10.00', NULL, NULL, 'vivienda', '2018-02-06 04:00:35', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(88, 'ayrton', NULL, '10.00', NULL, NULL, 'vivienda', '2018-02-05 04:00:50', 'Guadalupe Victoria 5, La Colina (Rafael Arreola Molina), 95399 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3783397\r\n Long = -95.7867629', 19),
(89, 'Marichell', NULL, '500.00', NULL, NULL, 'vivienda', '2018-03-20 17:47:16', 'De La Amelia 114, Centro, 95400 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3660108\n Long = -95.8053176', 19),
(90, 'Marichell', 'owl', '80.00', 'no hay', 'http://192.168.0.4/pagos/vistas/Json/detalle/uploads/90.png', 'comercio', '2018-03-20 18:29:17', 'JosÃ© Ma. Morelos 302, Centro, 95400 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3646618\n Long = -95.7956715', 19),
(91, 'Samara', NULL, '10.00', NULL, NULL, 'vivienda', '2018-03-20 18:31:02', 'Belisario DomÃ­nguez Esquin Madero 403B, Centro, 95400 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3643494\n Long = -95.7964316', 19),
(92, 'Juan ruiz', NULL, '10.00', NULL, NULL, 'vivienda', '2018-03-20 18:36:59', 'Belisario DomÃ­nguez Esquin Madero 403B, Centro, 95400 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.364367\n Long = -95.796416', 19),
(93, 'liliana pereza', 'refresqueria marisol', '200.00', 'pago mÃ©nsual de basura', 'http://192.168.0.4/pagos/vistas/Json/detalle/uploads/93.png', 'comercio', '2018-03-20 18:38:51', 'Belisario DomÃ­nguez Esquin Madero 403B, Centro, 95400 Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3643675\n Long = -95.7964088', 19),
(94, 'federico matinez galan', NULL, '4259.00', NULL, NULL, 'vivienda', '2018-03-22 11:01:34', 'TerraplÃ©n, San Martin, Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3522643\n Long = -95.810551', 19),
(95, 'federico matinez galan', NULL, '4259.00', NULL, NULL, 'vivienda', '2018-03-22 11:02:24', 'TerraplÃ©n, San Martin, Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3521975\n Long = -95.8105743', 19),
(96, 'federico martinez', 'abarrotera nacional', '100.00', 'registro del profesor albino', 'http://192.168.3.126/pagos/vistas/Json/detalle/uploads/96.png', 'comercio', '2018-03-22 11:11:43', 'TerraplÃ©n, San Martin, Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3522675\n Long = -95.810567', 19),
(97, 'federico martinez', 'abarrotera nacional', '356.00', 'registro del profesor albino', 'http://192.168.3.126/pagos/vistas/Json/detalle/uploads/97.png', 'comercio', '2018-03-22 11:13:24', 'TerraplÃ©n, San Martin, Cosamaloapan, Ver., MÃ©xico', 'Lat = 18.3522634\n Long = -95.8105489', 19);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cobrador`
--
ALTER TABLE `cobrador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cobros`
--
ALTER TABLE `cobros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cobrador` (`cobrador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cobrador`
--
ALTER TABLE `cobrador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `cobros`
--
ALTER TABLE `cobros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cobros`
--
ALTER TABLE `cobros`
  ADD CONSTRAINT `cobros_ibfk_1` FOREIGN KEY (`cobrador`) REFERENCES `cobrador` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
