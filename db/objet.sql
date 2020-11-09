-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 09, 2020 at 09:21 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `objet`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_objet`
--

CREATE TABLE `tbl_objet` (
  `id` int(100) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `indice` varchar(1000) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `icone` varchar(100) NOT NULL,
  `type` int(11) NOT NULL,
  `minZoom` int(20) NOT NULL,
  `visible` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_objet`
--

INSERT INTO `tbl_objet` (`id`, `nom`, `indice`, `latitude`, `longitude`, `icone`, `type`, `minZoom`, `visible`) VALUES
(1, 'Cadavre', 'L’archéologue Markus Muller spécialisée dans les pyramides égyptiennes a été assassiné : explorez les alentours pour trouver des indices !', 47.8625, 13.1259, 'img/bonhomme.png', 1, 2, 1),
(2, 'Caméra', 'Cette caméra semble filmer le perron de la maison de Markus Muller, mais il vous faudra demander le code à la police locale pour accéder aux images.', 47.8624, 13.1255, 'chemin_de_licone', 2, 2, 0),
(3, 'Code', 'L’agent … vous donne le code pour accéder aux images de la caméra : ……', 47.8654, 13.1233, 'chemin_de_licone', 3, 2, 0),
(4, 'Billet', 'Sur les images vous voyez une femme quitter avec une valise le logement de Markus Muller. Elle tient un bout de papier qui semble être un billet d’avion.', 49.6289, 6.2147, 'chemin_de_licone', 4, 2, 0),
(5, 'Aéroport', 'Une femme correspondant à celle des images de surveillance à pris l’avion pour l’Egypte la nuit du meurtre. Vous la retrouverez peut-être là-bas.', 47.7942, 13.0012, 'chemin_de_licone', 5, 2, 0),
(6, 'Madame', 'Bravo ! Vous avez retrouvé la meurtrière !', 29.9773, 31.1303, 'chemin_de_licone', 4, 2, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_objet`
--
ALTER TABLE `tbl_objet`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_objet`
--
ALTER TABLE `tbl_objet`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
