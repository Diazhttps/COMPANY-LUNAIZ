-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-03-2026 a las 04:04:47
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
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `actores` text DEFAULT NULL,
  `director_id` int(11) NOT NULL,
  `presupuesto` decimal(15,2) NOT NULL,
  `casa_productora` varchar(100) DEFAULT NULL,
  `año_publicacion` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id`, `titulo`, `actores`, `director_id`, `presupuesto`, `casa_productora`, `año_publicacion`) VALUES
(1, 'Oppenheimer', 'Cillian Murphy, Emily Blunt, Robert Downey Jr.', 1, 100000000.00, 'Universal Pictures', '2023'),
(4, 'Once Upon a Time in Hollywood', 'Leonardo DiCaprio, Brad Pitt, Margot Robbie', 4, 90000000.00, 'Columbia Pictures', '2019'),
(5, 'West Side Story', 'Ansel Elgort, Rachel Zegler, Ariana DeBose', 5, 100000000.00, '20th Century Studios', '2021'),
(6, 'Avatar: The Way of Water', 'Sam Worthington, Zoe Saldaña, Sigourney Weaver', 6, 350000000.00, '20th Century Studios', '2022'),
(7, 'House of Gucci', 'Lady Gaga, Adam Driver, Jared Leto', 7, 75000000.00, 'Metro-Goldwyn-Mayer', '2021'),
(8, 'Nightmare Alley', 'Bradley Cooper, Cate Blanchett, Rooney Mara', 8, 60000000.00, 'Searchlight Pictures', '2021'),
(9, 'Licorice Pizza', 'Cooper Hoffman, Alana Haim, Sean Penn', 9, 40000000.00, 'Metro-Goldwyn-Mayer', '2021'),
(10, 'The French Dispatch', 'Bill Murray, Tilda Swinton, Frances McDormand', 10, 25000000.00, 'Searchlight Pictures', '2021'),
(11, 'Eternals', 'Gemma Chan, Richard Madden, Angelina Jolie', 11, 200000000.00, 'Marvel Studios', '2021'),
(12, 'Nope', 'Daniel Kaluuya, Keke Palmer, Steven Yeun', 12, 68000000.00, 'Universal Pictures', '2022'),
(13, 'Babylon', 'Brad Pitt, Margot Robbie, Diego Calva', 13, 80000000.00, 'Paramount Pictures', '2022'),
(14, 'Barbie', 'Margot Robbie, Ryan Gosling, America Ferrera', 14, 145000000.00, 'Warner Bros. Pictures', '2023'),
(15, 'Mission: Impossible Dead Reckoning Part One', 'Tom Cruise, Hayley Atwell, Ving Rhames', 15, 291000000.00, 'Paramount Pictures', '2023'),
(16, 'Black Panther: Wakanda Forever', 'Letitia Wright, Lupita Nyong\'o, Danai Gurira', 16, 250000000.00, 'Marvel Studios', '2022'),
(17, 'Thor: Love and Thunder', 'Chris Hemsworth, Natalie Portman, Christian Bale', 17, 250000000.00, 'Marvel Studios', '2022'),
(18, '1917', 'George MacKay, Dean-Charles Chapman, Mark Strong', 18, 95000000.00, 'Universal Pictures', '2019'),
(19, 'Parasite', 'Song Kang-ho, Lee Sun-kyun, Cho Yeo-jeong', 19, 11400000.00, 'CJ Entertainment', '2019'),
(20, 'Joker', 'Joaquin Phoenix, Robert De Niro, Zazie Beetz', 20, 55000000.00, 'Warner Bros. Pictures', '2019'),
(21, 'Knives Out', 'Daniel Craig, Chris Evans, Ana de Armas', 21, 40000000.00, 'Lionsgate', '2019'),
(22, 'The Farewell', 'Awkwafina, Tzi Ma, Diana Lin', 22, 3000000.00, 'A24', '2019'),
(23, 'Marriage Story', 'Adam Driver, Scarlett Johansson, Laura Dern', 23, 18500000.00, 'Netflix', '2019'),
(24, 'The Lighthouse', 'Robert Pattinson, Willem Dafoe', 24, 4000000.00, 'A24', '2019'),
(25, 'Midsommar', 'Florence Pugh, Jack Reynor, William Jackson Harper', 25, 9000000.00, 'A24', '2019'),
(26, 'Valerian and the City of a Thousand Planets', 'Dane DeHaan, Cara Delevingne, Clive Owen', 26, 177200000.00, 'STXfilms', '2017'),
(27, 'Mad Max: Fury Road', 'Tom Hardy, Charlize Theron, Nicholas Hoult', 27, 150000000.00, 'Warner Bros. Pictures', '2015'),
(28, 'The Revenant', 'Leonardo DiCaprio, Tom Hardy, Domhnall Gleeson', 28, 135000000.00, '20th Century Fox', '2015'),
(29, 'Les Miserables', 'Hugh Jackman, Russell Crowe, Anne Hathaway', 29, 61000000.00, 'Universal Pictures', '2012'),
(30, 'The Social Network', 'Jesse Eisenberg, Andrew Garfield, Justin Timberlake', 30, 40000000.00, 'Columbia Pictures', '2010'),
(31, 'Slumdog Millionaire', 'Dev Patel, Freida Pinto, Madhur Mittal', 31, 15000000.00, 'Fox Searchlight Pictures', '2008'),
(32, 'No Country for Old Men', 'Tommy Lee Jones, Javier Bardem, Josh Brolin', 32, 25000000.00, 'Miramax Films', '2007'),
(33, 'Burn After Reading', 'George Clooney, Frances McDormand, John Malkovich', 33, 37000000.00, 'Focus Features', '2008'),
(34, 'The Lord of the Rings: The Return of the King', 'Elijah Wood, Ian McKellen, Viggo Mortensen', 34, 94000000.00, 'New Line Cinema', '2003'),
(35, 'Life of Pi', 'Suraj Sharma, Irrfan Khan, Adil Hussain', 35, 120000000.00, '20th Century Fox', '2012'),
(36, 'Gravity', 'Sandra Bullock, George Clooney', 36, 100000000.00, 'Warner Bros. Pictures', '2013'),
(37, 'Her', 'Joaquin Phoenix, Scarlett Johansson, Amy Adams', 37, 23000000.00, 'Warner Bros. Pictures', '2013'),
(38, 'Boyhood', 'Patricia Arquette, Ellar Coltrane, Lorelei Linklater', 38, 4000000.00, 'IFC Films', '2014'),
(39, 'Eternal Sunshine of the Spotless Mind', 'Jim Carrey, Kate Winslet, Kirsten Dunst', 39, 20000000.00, 'Focus Features', '2004'),
(40, 'Synecdoche, New York', 'Philip Seymour Hoffman, Samantha Morton, Michelle Williams', 40, 20000000.00, 'Sony Pictures Classics', '2008'),
(41, 'The Tree of Life', 'Brad Pitt, Sean Penn, Jessica Chastain', 41, 32000000.00, 'Fox Searchlight Pictures', '2011'),
(42, 'Melancholia', 'Kirsten Dunst, Charlotte Gainsbourg, Kiefer Sutherland', 42, 7400000.00, 'Magnolia Pictures', '2011'),
(43, 'The Grandmaster', 'Tony Leung Chiu-wai, Ziyi Zhang, Chang Chen', 43, 38800000.00, 'The Weinstein Company', '2013'),
(44, 'The Handmaiden', 'Kim Min-hee, Kim Tae-ri, Ha Jung-woo', 44, 8800000.00, 'CJ Entertainment', '2016'),
(45, 'Shoplifters', 'Lily Franky, Sakura Ando, Mayu Matsuoka', 45, 3200000.00, 'Gaga Pictures', '2018'),
(46, 'The Favourite', 'Olivia Colman, Emma Stone, Rachel Weisz', 46, 15000000.00, 'Fox Searchlight Pictures', '2018'),
(47, 'Moonlight', 'Mahershala Ali, Naomie Harris, Trevante Rhodes', 47, 1500000.00, 'A24', '2016'),
(48, 'Manchester by the Sea', 'Casey Affleck, Michelle Williams, Kyle Chandler', 48, 8500000.00, 'Amazon Studios', '2016'),
(49, 'Mulholland Drive', 'Naomi Watts, Laura Harring, Justin Theroux', 49, 15000000.00, 'Universal Pictures', '2001'),
(50, 'Elle', 'Isabelle Huppert, Laurent Lafitte, Anne Consigny', 50, 8300000.00, 'Sony Pictures Classics', '2016'),
(51, 'Amour', 'Jean-Louis Trintignant, Emmanuelle Riva, Isabelle Huppert', 51, 8900000.00, 'Sony Pictures Classics', '2012'),
(52, 'Amelie', 'Audrey Tautou, Mathieu Kassovitz, Rufus', 52, 10000000.00, 'Miramax Films', '2001'),
(53, 'Pain and Glory', 'Antonio Banderas, Asier Etxeandia, Leonardo Sbaraglia', 53, 4000000.00, 'Sony Pictures Classics', '2019'),
(54, 'Portrait of a Lady on Fire', 'Noémie Merlant, Adèle Haenel, Luàna Bajrami', 54, 4000000.00, 'NEON', '2019'),
(55, 'First Cow', 'John Magaro, Orion Lee, Toby Jones', 55, 2000000.00, 'A24', '2019'),
(56, 'Memoria', 'Tilda Swinton, Elkin Díaz, Jeanne Balibar', 56, 800000.00, 'NEON', '2021'),
(57, 'Triangle of Sadness', 'Harris Dickinson, Charlbi Dean, Woody Harrelson', 57, 4000000.00, 'NEON', '2022'),
(58, 'Titane', 'Agathe Rousselle, Vincent Lindon, Garance Marillier', 58, 4600000.00, 'NEON', '2021'),
(59, 'Drive My Car', 'Hidetoshi Nishijima, Toko Miura, Reika Kirishima', 59, 1500000.00, 'Janus Films', '2021'),
(60, 'The Power of the Dog', 'Benedict Cumberbatch, Kirsten Dunst, Jesse Plemons', 60, 35000000.00, 'Netflix', '2021'),
(61, 'King Richard', 'Will Smith, Aunjanue Ellis, Saniyya Sidney', 61, 50000000.00, 'Warner Bros. Pictures', '2021'),
(62, 'Tick, Tick... Boom!', 'Andrew Garfield, Alexandra Shipp, Robin de Jesús', 62, 24000000.00, 'Netflix', '2021'),
(63, 'The Lost Daughter', 'Olivia Colman, Dakota Johnson, Jessie Buckley', 63, 8000000.00, 'Netflix', '2021'),
(64, 'The Hand of God', 'Filippo Scotti, Toni Servillo, Teresa Saponangelo', 64, 15000000.00, 'Netflix', '2021'),
(65, 'Don\'t Look Up', 'Leonardo DiCaprio, Jennifer Lawrence, Meryl Streep', 65, 75000000.00, 'Netflix', '2021'),
(66, 'CODA', 'Emilia Jones, Marlee Matlin, Troy Kotsur', 66, 10000000.00, 'Apple TV+', '2021'),
(67, 'The Worst Person in the World', 'Renate Reinsve, Anders Danielsen Lie, Herbert Nordrum', 67, 2000000.00, 'NEON', '2021'),
(68, 'A Hero', 'Amir Jadidi, Mohsen Tanabandeh, Fereshteh Sadr Orafaee', 68, 1500000.00, 'Amazon Studios', '2021'),
(69, 'Annette', 'Adam Driver, Marion Cotillard, Simon Helberg', 69, 16000000.00, 'Amazon Studios', '2021'),
(70, 'BlacKkKlansman', 'John David Washington, Adam Driver, Laura Harrier', 70, 15000000.00, 'Focus Features', '2018'),
(71, 'The Godfather', 'Marlon Brando, Al Pacino, James Caan', 71, 6000000.00, 'Paramount Pictures', '1972'),
(72, '2001: A Space Odyssey', 'Keir Dullea, Gary Lockwood, William Sylvester', 72, 10500000.00, 'Metro-Goldwyn-Mayer', '1968'),
(73, 'Citizen Kane', 'Orson Welles, Joseph Cotten, Dorothy Comingore', 73, 839727.00, 'RKO Radio Pictures', '1941'),
(74, 'Seven Samurai', 'Toshiro Mifune, Takashi Shimura, Keiko Tsushima', 74, 500000.00, 'Toho', '1954'),
(75, '8½', 'Marcello Mastroianni, Claudia Cardinale, Anouk Aimée', 75, 3000000.00, 'Cineriz', '1963'),
(76, 'Persona', 'Bibi Andersson, Liv Ullmann, Margaretha Krook', 76, 150000.00, 'SF Studios', '1966'),
(77, 'Breathless', 'Jean-Paul Belmondo, Jean Seberg, Daniel Boulanger', 77, 90000.00, 'Films Around the World', '1960'),
(78, 'The 400 Blows', 'Jean-Pierre Léaud, Claire Maurier, Albert Rémy', 78, 75000.00, 'Cocinor', '1959'),
(79, 'Sunset Boulevard', 'William Holden, Gloria Swanson, Erich von Stroheim', 79, 1752000.00, 'Paramount Pictures', '1950'),
(80, 'The Searchers', 'John Wayne, Jeffrey Hunter, Vera Miles', 80, 3750000.00, 'Warner Bros. Pictures', '1956'),
(81, 'Rio Bravo', 'John Wayne, Dean Martin, Ricky Nelson', 81, 5000000.00, 'Warner Bros. Pictures', '1959'),
(82, 'Anatomy of a Murder', 'James Stewart, Lee Remick, Ben Gazzara', 82, 1500000.00, 'Columbia Pictures', '1959'),
(83, 'Rebel Without a Cause', 'James Dean, Natalie Wood, Sal Mineo', 83, 1500000.00, 'Warner Bros. Pictures', '1955'),
(84, 'On the Waterfront', 'Marlon Brando, Karl Malden, Lee J. Cobb', 84, 910000.00, 'Columbia Pictures', '1954'),
(85, 'Giant', 'Rock Hudson, Elizabeth Taylor, James Dean', 85, 5400000.00, 'Warner Bros. Pictures', '1956'),
(87, 'Lawrence of Arabia', 'Peter O\'Toole, Alec Guinness, Anthony Quinn', 87, 15000000.00, 'Columbia Pictures', '1962'),
(88, 'The Treasure of the Sierra Madre', 'Humphrey Bogart, Walter Huston, Tim Holt', 88, 3000000.00, 'Warner Bros. Pictures', '1948'),
(89, 'The Third Man', 'Joseph Cotten, Alida Valli, Orson Welles', 89, 500000.00, 'British Lion Films', '1949'),
(90, 'Black Narcissus', 'Deborah Kerr, Sabu, David Farrar', 90, 300000.00, 'The Archers', '1947'),
(91, 'The Red Shoes', 'Moira Shearer, Anton Walbrook, Marius Goring', 91, 500000.00, 'The Archers', '1948'),
(92, 'Pickpocket', 'Martin LaSalle, Marika Green, Jean Pélégri', 92, 120000.00, 'Agnès Delahaie Productions', '1959'),
(93, 'The Discreet Charm of the Bourgeoisie', 'Fernando Rey, Delphine Seyrig, Paul Frankeur', 93, 800000.00, 'Greenwich Film Productions', '1972'),
(94, 'Battleship Potemkin', 'Aleksandr Antonov, Vladimir Barsky, Grigori Aleksandrov', 94, 100000.00, 'Mosfilm', '1925'),
(95, 'Sunrise: A Song of Two Humans', 'George O\'Brien, Janet Gaynor, Margaret Livingston', 95, 1200000.00, 'Fox Film Corporation', '1927'),
(96, 'Metropolis', 'Alfred Abel, Gustav Fröhlich, Rudolf Klein-Rogge', 96, 7000000.00, 'UFA', '1927'),
(97, 'The Passion of Joan of Arc', 'Maria Falconetti, Eugene Silvain, André Berley', 97, 400000.00, 'Société Générale des Films', '1928'),
(98, 'Tokyo Story', 'Chishu Ryu, Chieko Higashiyama, Setsuko Hara', 98, 70000.00, 'Shochiku', '1953'),
(99, 'Ugetsu', 'Masayuki Mori, Machiko Kyō, Kinuyo Tanaka', 99, 150000.00, 'Daiei Film', '1953');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `director_id` (`director_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD CONSTRAINT `peliculas_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `directores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
