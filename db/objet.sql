-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 10, 2020 at 01:47 PM
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
  `texte` varchar(1000) NOT NULL,
  `indice` varchar(1000) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `icone` varchar(100) NOT NULL,
  `taille_x` int(11) NOT NULL,
  `taille_y` int(11) NOT NULL,
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

INSERT INTO `tbl_objet` (`id`, `nom`, `texte`, `indice`, `latitude`, `longitude`, `icone`, `taille_x`, `taille_y`, `music`, `type`, `minZoom`, `visible`, `code`, `debloque`, `code_debloque`) VALUES
(0, 'Bonhomme', 'L’archéologue Markus Muller spécialisée dans les pyramides égyptiennes a été assassiné : explorez les alentours pour trouver des indices !\r\n<p id =\'indice_texte\' style=\'text-align:center;\'><button class = \'bouton_indice\'>Indice</button> </p>', '<p>Zoomez pour trouver le corps de l\'archéologue.</p>', 47.8625, 13.1259, 'img/bonhomme2.png', 68, 150, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 1, 5, 1, NULL, 1, NULL),
(1, 'Cadavre', 'Vous trouvez le corps de Markus Muller dans son salon. Il a probablement été empoisonné.\r\n\r\n<p id =\'indice_texte\' style=\'text-align:center;\'><button class = \'bouton_indice\'>Indice</button> </p>', '<p>Explorez les environs.</p>', 47.8625, 13.1254, 'img/cadavre2.png', 200, 63, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 1, 14, 0, NULL, 2, NULL),
(2, 'Caméra', 'Cette caméra semble filmer le perron de la maison de Markus Muller, mais il vous faudra demander le code à la police locale pour accéder aux images.\r\n\r\n<form id = \"form\">\r\n<input id=\"code\" type=\"text\">\r\n<input id = \"submit\" type=\"submit\">\r\n</form>\r\n\r\n<p id =\'indice_texte\' style=\'text-align:center;\'><button class = \'bouton_indice\'>Indice</button> </p>', '</p>Le poste de police se trouve au nord.<p>', 47.8621, 13.1253, 'img/camera.png', 101, 76, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 2, 18, 0, 5130, 3, 5),
(3, 'Poste de police', 'Un agent de police vous donne le code pour accéder aux images de la caméra.', '', 47.865, 13.1254, 'img/police2.png', 150, 79, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 1, 17, 0, NULL, 4, NULL),
(4, 'Post-it', 'Le code est 5130.', '', 47.8649, 13.124, 'img/post-it.png', 100, 100, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 3, 17, 0, NULL, NULL, NULL),
(5, 'Image', 'Sur les images vous voyez une femme quitter le logement de Markus Muller. Elle tient un bout de papier qui semble être un billet d’avion.\r\n<p>Ne perdez pas de temps!</p>\r\nRécupérez votre billet et allez à l\'aéroport de Salzburg pour prendre le premier vol direction l\'Egypte.\r\n\r\n<p id =\'indice_texte\' style=\'text-align:center;\'><button class = \'bouton_indice\'>Indice</button> </p>', '<p>L\'aéroport se trouve à l\'ouest de Salzburg.</p>', 47.8621, 13.1253, 'img/bobine2.png', 100, 92, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 1, 17, 0, NULL, 6, NULL),
(6, 'Billet', 'Votre inventaire est plein. Résolvez les énigmes précédentes avant de récupérer cet objet.', '', 47.8622, 13.1262, 'img/billet.png', 232, 97, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 4, 16, 0, NULL, 7, NULL),
(7, 'Aéroport', 'Une femme correspondant à celle des images de surveillance à pris l’avion pour l’Egypte la nuit du meurtre. Vous la retrouverez peut-être là-bas.\r\n\r\n<p id =\'indice_texte\' style=\'text-align:center;\'><button class = \'bouton_indice\'>Indice</button> </p>', '<p>Utiliser votre billet pour prendre l\'avion.</p>', 47.7942, 13.0012, 'img/avion2.png', 300, 75, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 5, 16, 0, NULL, 8, NULL),
(8, 'Madame', 'Bravo ! Vous avez retrouvé la meurtrière !', '', 29.9773, 31.1303, 'img/madame.jpg', 100, 100, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 6, 7, 0, NULL, NULL, NULL);

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
