-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 28, 2020 at 10:29 AM
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
  `music` varchar(100) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `minZoom` int(20) NOT NULL,
  `visible` int(11) NOT NULL,
  `code` int(11) DEFAULT NULL,
  `debloque` int(11) DEFAULT NULL,
  `code_debloque` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_objet`
--

INSERT INTO `tbl_objet` (`id`, `nom`, `indice`, `latitude`, `longitude`, `icone`, `music`, `type`, `minZoom`, `visible`, `code`, `debloque`, `code_debloque`) VALUES
(0, 'Bonhomme', 'L’archéologue Markus Muller spécialisée dans les pyramides égyptiennes a été assassiné : explorez les alentours pour trouver des indices !', 47.8625, 13.1259, 'img/bonhomme.png', 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 1, 5, 1, NULL, 1, NULL),
(1, 'Cadavre', 'Vous trouvez le corps de Markus Muller dans son salon. Il a probablement été empoisonné.', 47.8627, 13.1261, 'img/cadavre.png', 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 1, 14, 0, NULL, 2, NULL),
(2, 'Caméra', 'Cette caméra semble filmer le perron de la maison de Markus Muller, mais il vous faudra demander le code à la police locale pour accéder aux images.\r\n\r\n<form id = \"form\">\r\n<input id=\"code\" type=\"text\">\r\n<input id = \"submit\" type=\"submit\">\r\n</form>', 47.8624, 13.1255, 'img/camera.png', 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 2, 17, 0, 5130, 3, 5),
(3, 'Poste de police', 'Un agent de police vous donne le code pour accéder aux images de la caméra.', 47.8654, 13.1233, 'img/police.png', 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 1, 17, 0, NULL, 4, NULL),
(4, 'Post-it', 'L’agent … vous donne le code pour accéder aux images de la caméra : ……', 47.865, 13.123, 'img/post-it.png', 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 3, 17, 0, NULL, NULL, NULL),
(5, 'Image', 'Sur les images vous voyez une femme quitter avec une valise le logement de Markus Muller. Elle tient un bout de papier qui semble être un billet d’avion.', 47.8624, 13.1255, 'img/bobine.png', 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 1, 17, 0, NULL, 6, NULL),
(6, 'Billet', 'Sur les images vous voyez une femme quitter avec une valise le logement de Markus Muller. Elle tient un bout de papier qui semble être un billet d’avion.', 47.862, 13.1253, 'img/billet.png', 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 4, 16, 0, NULL, 7, NULL),
(7, 'Aéroport', 'Une femme correspondant à celle des images de surveillance à pris l’avion pour l’Egypte la nuit du meurtre. Vous la retrouverez peut-être là-bas.', 47.7942, 13.0012, 'img/avion.png', 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 5, 16, 0, NULL, 8, NULL),
(8, 'Madame', 'Bravo ! Vous avez retrouvé la meurtrière !', 29.9773, 31.1303, 'img/madame.jpg', 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 6, 7, 0, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_objet`
--
ALTER TABLE `tbl_objet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_objet`
--
ALTER TABLE `tbl_objet`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
