-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-03-2026 a las 04:03:56
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
-- Base de datos: `company`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directores`
--

CREATE TABLE `directores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `presupuesto` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `directores`
--

INSERT INTO `directores` (`id`, `nombre`, `presupuesto`) VALUES
(1, 'Christopher Nolan', 100000000.00),
(2, 'Martin Scorsese', 200000000.00),
(3, 'Denis Villeneuve', 165000000.00),
(4, 'Quentin Tarantino', 90000000.00),
(5, 'Steven Spielberg', 100000000.00),
(6, 'James Cameron', 350000000.00),
(7, 'Ridley Scott', 75000000.00),
(8, 'Guillermo del Toro', 60000000.00),
(9, 'Paul Thomas Anderson', 40000000.00),
(10, 'Wes Anderson', 25000000.00),
(11, 'Chloe Zhao', 200000000.00),
(12, 'Jordan Peele', 68000000.00),
(13, 'Damien Chazelle', 80000000.00),
(14, 'Greta Gerwig', 145000000.00),
(15, 'Christopher McQuarrie', 291000000.00),
(16, 'Ryan Coogler', 250000000.00),
(17, 'Taika Waititi', 250000000.00),
(18, 'Sam Mendes', 95000000.00),
(19, 'Bong Joon-ho', 11400000.00),
(20, 'Todd Phillips', 55000000.00),
(21, 'Rian Johnson', 40000000.00),
(22, 'Lulu Wang', 3000000.00),
(23, 'Noah Baumbach', 18500000.00),
(24, 'Robert Eggers', 4000000.00),
(25, 'Ari Aster', 9000000.00),
(26, 'Luc Besson', 177200000.00),
(27, 'George Miller', 150000000.00),
(28, 'Alejandro González Iñárritu', 135000000.00),
(29, 'Tom Hooper', 61000000.00),
(30, 'David Fincher', 40000000.00),
(31, 'Danny Boyle', 15000000.00),
(32, 'Joel Coen', 25000000.00),
(33, 'Ethan Coen', 37000000.00),
(34, 'Peter Jackson', 94000000.00),
(35, 'Ang Lee', 120000000.00),
(36, 'Alfonso Cuarón', 100000000.00),
(37, 'Spike Jonze', 23000000.00),
(38, 'Richard Linklater', 4000000.00),
(39, 'Michel Gondry', 20000000.00),
(40, 'Charlie Kaufman', 20000000.00),
(41, 'Terrence Malick', 32000000.00),
(42, 'Lars von Trier', 7400000.00),
(43, 'Wong Kar-wai', 38800000.00),
(44, 'Park Chan-wook', 8800000.00),
(45, 'Hirokazu Kore-eda', 3200000.00),
(46, 'Yorgos Lanthimos', 15000000.00),
(47, 'Barry Jenkins', 1500000.00),
(48, 'Kenneth Lonergan', 8500000.00),
(49, 'David Lynch', 15000000.00),
(50, 'Paul Verhoeven', 8300000.00),
(51, 'Michael Haneke', 8900000.00),
(52, 'Jean-Pierre Jeunet', 10000000.00),
(53, 'Pedro Almodóvar', 4000000.00),
(54, 'Céline Sciamma', 4000000.00),
(55, 'Kelly Reichardt', 2000000.00),
(56, 'Apichatpong Weerasethakul', 800000.00),
(57, 'Ruben Östlund', 4000000.00),
(58, 'Julia Ducournau', 4600000.00),
(59, 'Ryusuke Hamaguchi', 1500000.00),
(60, 'Jane Campion', 35000000.00),
(61, 'Reinaldo Marcus Green', 50000000.00),
(62, 'Lin-Manuel Miranda', 24000000.00),
(63, 'Maggie Gyllenhaal', 8000000.00),
(64, 'Paolo Sorrentino', 15000000.00),
(65, 'Adam McKay', 75000000.00),
(66, 'Sian Heder', 10000000.00),
(67, 'Joachim Trier', 2000000.00),
(68, 'Asghar Farhadi', 1500000.00),
(69, 'Leos Carax', 16000000.00),
(70, 'Spike Lee', 15000000.00),
(71, 'Francis Ford Coppola', 6000000.00),
(72, 'Stanley Kubrick', 10500000.00),
(73, 'Orson Welles', 839727.00),
(74, 'Akira Kurosawa', 500000.00),
(75, 'Federico Fellini', 3000000.00),
(76, 'Ingmar Bergman', 150000.00),
(77, 'Jean-Luc Godard', 90000.00),
(78, 'François Truffaut', 75000.00),
(79, 'Billy Wilder', 1752000.00),
(80, 'John Ford', 3750000.00),
(81, 'Howard Hawks', 5000000.00),
(82, 'Otto Preminger', 1500000.00),
(83, 'Nicholas Ray', 1500000.00),
(84, 'Elia Kazan', 910000.00),
(85, 'George Stevens', 5400000.00),
(86, 'William Wyler', 15000000.00),
(87, 'David Lean', 15000000.00),
(88, 'John Huston', 3000000.00),
(89, 'Carol Reed', 500000.00),
(90, 'Michael Powell', 300000.00),
(91, 'Emeric Pressburger', 500000.00),
(92, 'Robert Bresson', 120000.00),
(93, 'Luis Buñuel', 800000.00),
(94, 'Sergei Eisenstein', 100000.00),
(95, 'F.W. Murnau', 1200000.00),
(96, 'Fritz Lang', 7000000.00),
(97, 'Carl Theodor Dreyer', 400000.00),
(98, 'Yasujirô Ozu', 70000.00),
(99, 'Kenji Mizoguchi', 150000.00),
(100, 'Satyajit Ray', 27000.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `directores`
--
ALTER TABLE `directores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `directores`
--
ALTER TABLE `directores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
