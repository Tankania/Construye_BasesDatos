-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 02:36:54
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

CREATE TABLE `paquete` (
  `codigo de paquete` varchar(6) NOT NULL,
  `codigo postal` varchar(5) NOT NULL,
  `direccion de calle` varchar(50) NOT NULL,
  `nombre de la tienda` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paquete`
--

INSERT INTO `paquete` (`codigo de paquete`, `codigo postal`, `direccion de calle`, `nombre de la tienda`) VALUES
('#12345', '26754', 'calle adolfo l. mateos', 'tienda pemela'),
('#45678', '37800', 'miguel aleman', 'pape la chidota'),
('#76543', '37800', 'Calle Domínguez', 'Papelería Juana'),
('#98078', '39666', 'calle juanes', 'Papelería Juana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `numero de empleado` varchar(2) NOT NULL,
  `nombre completo` varchar(50) NOT NULL,
  `correo electronico` varchar(30) NOT NULL,
  `curp` varchar(18) NOT NULL,
  `numero de telefono` varchar(11) NOT NULL,
  `codigo de paquete` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`numero de empleado`, `nombre completo`, `correo electronico`, `curp`, `numero de telefono`, `codigo de paquete`) VALUES
('1', 'Carlos Samael Aguayo Santana', 'hhshshs@gmail.com', '1234567876t5432s45', '4181095552', '#98078'),
('2', 'Tania Alvarez Anguiano', '73838383@gmail.com', '456789876543212222', '4181774420', '#12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `marca de goma` varchar(20) NOT NULL,
  `precio` varchar(5) NOT NULL,
  `codigo de goma` varchar(10) NOT NULL,
  `numero de empleado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`marca de goma`, `precio`, `codigo de goma`, `numero de empleado`) VALUES
('jaja', '5', '67', '2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`codigo de paquete`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`numero de empleado`),
  ADD KEY `index_producto` (`codigo de paquete`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`marca de goma`),
  ADD KEY `index_empeleado` (`numero de empleado`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `paquete` FOREIGN KEY (`codigo de paquete`) REFERENCES `paquete` (`codigo de paquete`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `numero de empleado` FOREIGN KEY (`numero de empleado`) REFERENCES `personal` (`numero de empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
