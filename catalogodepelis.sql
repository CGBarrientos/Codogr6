-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2023 a las 20:12:54
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `catalogodepelis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `IDpeli` int(11) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `Año` int(4) NOT NULL,
  `Director` varchar(50) NOT NULL,
  `Clasificación` varchar(20) NOT NULL,
  `Calificación` decimal(3,1) DEFAULT NULL,
  `Imagen_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`IDpeli`, `Titulo`, `Año`, `Director`, `Clasificación`, `Calificación`, `Imagen_url`) VALUES
(1, 'La Naranja Mecánica (Clockwork Orange)', 1971, 'Stanley Kubrick', 'R', 0.0, 'https://drive.google.com/file/d/1zGjDEgKF-SXNjUZqj6EPz_VjMHJYEUso/view?usp=sharing'),
(2, 'El Padrino (The Godfather)', 1972, 'Francis Ford Coppola', 'R', NULL, 'https://drive.google.com/file/d/1-2z-76PNwHHKBXXaHw-ZwuMP5b2ss0ue/view?usp=drive_link'),
(4, 'El Exorcista (The Exorcist)', 1973, 'Willian Friedkin', 'R', NULL, 'https://drive.google.com/file/d/1aexGIU367OPZl_V1DrklQkR3AbRVcJg8/view?usp=sharing'),
(5, 'Taxi Driver', 1976, 'Martin Scorcese', 'R', NULL, 'https://drive.google.com/file/d/1bCMU8fWhQXtaTjGnpUthVkIeCCNGJPmT/view?usp=drive_link'),
(6, 'El Resplandor (The Shining)', 1980, 'Stanley Kubrick', 'R', NULL, 'https://drive.google.com/file/d/17iKuxlDbkgu_LVIGkvLbaOm1K1cca9TV/view?usp=drive_link'),
(7, 'El Hombre Elefante (The Elephant Man)', 1980, 'David Lynch', 'PG', NULL, 'https://drive.google.com/file/d/1FkcnavZFMNW-zpSxKVeVd21i7pYMfJE5/view?usp=drive_link'),
(8, 'La Cosa (The Thing)', 1982, 'John Carpenter', 'R', NULL, 'https://drive.google.com/file/d/16GyDOXuyGSUzDGo7Ma_qmtLrdtyAkaXk/view?usp=drive_link'),
(9, 'Scarface', 1983, 'Brian De Palma', 'R', NULL, 'https://drive.google.com/file/d/1aoUmL2Lf2AxlKYcsulDZdFUI7uxK4rfW/view?usp=drive_link'),
(10, 'Akira', 1988, 'Katsuhiro Otomo', 'R', NULL, 'https://drive.google.com/file/d/1lGVfXogtB0s_0qiYbDbigyvc1RnJcGdf/view?usp=drive_link'),
(11, 'Pulp Fiction ', 1994, 'Quentin Tarantino', 'R', NULL, 'https://drive.google.com/file/d/1ssDtjuzqkj7-kkUzTxroI5g6yR5RzUts/view?usp=drive_link'),
(12, 'Trainspotting', 1996, 'Danny Boyle', 'R', NULL, 'https://drive.google.com/file/d/1w3WcHfmvvKN59c8sM7-iLC3ihjthjwCG/view?usp=drive_link'),
(13, 'El Show de Truman (The Truman Show)', 1998, 'Peter Weir', 'PG', NULL, 'https://drive.google.com/file/d/1O43AA2QHOCtuwlwhKARfTFDcK6mt02d0/view?usp=drive_link'),
(14, 'Matrix', 1999, 'The Wachowskis', 'R', NULL, 'https://drive.google.com/file/d/1vtqjtjRTANoIgZzkYlEHF0XSir7-DOp2/view?usp=drive_link'),
(15, 'El Club de la Pelea (Fight Club)', 1999, 'David Fincher', 'R', NULL, 'https://drive.google.com/file/d/1LPKBI99-tUuDzn_dFkXTaNo1y5N9dYx6/view?usp=drive_link'),
(16, 'Requiem por un Sueño (Requiem for a Dream)', 2000, 'Darren Aronofsky', 'R', NULL, 'https://drive.google.com/file/d/18oH1smBia8sSxB7yIRDQlbjs4CvrE4Ok/view?usp=drive_link'),
(17, 'Donnie Darko ', 2001, 'Richard Kelly', 'R', NULL, 'https://drive.google.com/file/d/1tM0exZIoLLJ5C8nZ8AN7QV1QRUyY80sL/view?usp=drive_link'),
(18, 'El Viaje de Chihiro (Spirited Away)', 2001, 'Hayao Miyazaki', 'PG', NULL, 'https://drive.google.com/file/d/1rz4-_ET9IXxbvfRQLaPT0AZtH2cT6mqi/view?usp=drive_link'),
(19, 'Constantine', 2005, 'Francis Lawrence', 'R', NULL, 'https://drive.google.com/file/d/1Eh77eJkAjtGS1Eo-dQEhRA7F2WcDQrwj/view?usp=drive_link'),
(20, 'El Laberinto del Fauno', 2006, 'Guillermo del Toro', 'R', NULL, 'https://drive.google.com/file/d/1duFb3cU4pltrl9X0nC41PE3E7xkPCRcS/view?usp=drive_link'),
(21, 'Cisne Negro (Black Swan)', 2010, 'Darren Aronofsky', 'R', NULL, 'https://drive.google.com/file/d/1yGFa1oHTsLiZxVQ42RmrRRYu2JH_bByB/view?usp=drive_link');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`IDpeli`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `IDpeli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
