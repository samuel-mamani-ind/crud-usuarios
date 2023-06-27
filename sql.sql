-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2023 a las 02:23:15
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sunny_side`
--

CREATE DATABASE sunny_side;
USE sunny_side;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adopcion`
--

CREATE TABLE `adopcion` (
  `id` int(11) NOT NULL,
  `id_animal` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` int(11) NOT NULL,
  `motivo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animal`
--

CREATE TABLE `animal` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `raza` varchar(200) NOT NULL,
  `sexo` varchar(6) NOT NULL,
  `color` varchar(200) NOT NULL,
  `edad` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `telefono` varchar(13) NOT NULL,
  `edad` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `telefono`, `edad`) VALUES
(6, 'Julia', 'Urena', '76232811', 21),
(7, 'Jose', 'Nuñez', '77105466', 24),
(8, 'Teresa', 'Martinez', '78211787', 20);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adopcion`
--
ALTER TABLE `adopcion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adopcion_fk_animal` (`id_animal`),
  ADD KEY `adopcion_fk_usuario` (`id_usuario`);

--
-- Indices de la tabla `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adopcion`
--
ALTER TABLE `adopcion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `animal`
--
ALTER TABLE `animal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adopcion`
--
ALTER TABLE `adopcion`
  ADD CONSTRAINT `adopcion_fk_animal` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `adopcion_fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
