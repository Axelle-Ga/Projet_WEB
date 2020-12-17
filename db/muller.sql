-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 17, 2020 at 05:58 PM
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
-- Database: `muller`
--

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `username` varchar(100) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`username`, `time`) VALUES
('Axelle', '00:01:26'),
('Charlotte', '00:01:27'),
('Axland', '00:01:20'),
('Axelle', '00:01:18'),
('5130', '00:01:03'),
('Axelle', '00:01:31'),
('Julie', '00:02:25'),
('Axelle', '00:01:08'),
('Axelle', '00:01:08'),
('Axelle3456', '00:01:08'),
('Xouille', '00:01:05'),
('Xouille', '00:01:05'),
('Faux_Axthéli', '00:01:52'),
('Faux_Axthéli', '00:01:52'),
('Axelle', '00:01:14'),
('Axelle51', '00:01:42'),
('Axelle', '00:01:06'),
('Axelle', '00:02:03'),
('Axland', '00:01:06'),
('Léo', '00:01:14'),
('Léo', '00:00:58'),
('Léo', '00:01:06');

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
  `code_debloque` int(11) DEFAULT NULL,
  `objet_debloque` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_objet`
--

INSERT INTO `tbl_objet` (`id`, `nom`, `texte`, `indice`, `latitude`, `longitude`, `icone`, `taille_x`, `taille_y`, `music`, `type`, `minZoom`, `visible`, `code`, `debloque`, `code_debloque`, `objet_debloque`) VALUES
(0, 'Bonhomme', 'L’archéologue Markus Müller spécialisé dans les pyramides égyptiennes a été assassiné : explorez les alentours pour trouver des indices !\r\n<p id =\'indice_texte\' style=\'text-align:center;\'><button class = \'bouton_indice\'>Indice</button> </p>', '<p>Zoomez pour trouver le corps de l\'archéologue.</p>', 47.8625, 13.1259, 'img/bonhomme.png', 68, 150, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 1, 5, 1, NULL, 1, NULL, NULL),
(1, 'Cadavre', 'Vous trouvez le corps de Markus Müller dans son salon. Il a probablement été empoisonné.\r\n\r\n<p id =\'indice_texte\' style=\'text-align:center;\'><button class = \'bouton_indice\'>Indice</button> </p>', '<p>Explorez les environs.</p>', 47.8625, 13.1254, 'img/cadavre.png', 200, 63, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 1, 14, 0, NULL, 2, NULL, NULL),
(2, 'Caméra', 'Cette caméra semble filmer le perron de la maison de Markus Müller, mais il vous faudra demander le code à vos collègues au poste de police pour accéder aux images.\r\n\r\n<form id = \"form\">\r\n<input id=\"code\" type=\"text\">\r\n<input id = \"submit\" type=\"submit\">\r\n</form>\r\n\r\n<p id =\'indice_texte\' style=\'text-align:center;\'><button class = \'bouton_indice\'>Indice</button> </p>', '</p>Le poste de police se trouve au nord.<p>', 47.8621, 13.1253, 'img/camera.png', 101, 76, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 2, 18, 0, 5130, 3, 5, NULL),
(3, 'Poste de police', 'Un ami agent vous donne le code pour accéder aux images de la caméra.', '', 47.865, 13.1254, 'img/police.png', 150, 79, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 1, 17, 0, NULL, 4, NULL, NULL),
(4, 'Post-it', 'Le code est 5130.', '', 47.8649, 13.124, 'img/post-it.png', 100, 100, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 3, 17, 0, NULL, NULL, NULL, NULL),
(5, 'Image', 'Sur les images, vous voyez une femme quitter le logement de Markus Müller. Elle tient un bout de papier qui semble être un billet d’avion.\r\n<p>Ne perdez pas de temps !</p>\r\nRécupérez votre billet et allez à l\'aéroport de Salzburg pour prendre le premier vol à sa poursuite !\r\n\r\n<p id =\'indice_texte\' style=\'text-align:center;\'><button class = \'bouton_indice\'>Indice</button> </p>', '<p>L\'aéroport se trouve à l\'ouest de Salzburg.</p>', 47.8621, 13.1253, 'img/bobine.png', 100, 92, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 1, 17, 0, NULL, 6, NULL, NULL),
(6, 'Billet', 'Votre inventaire est plein. Résolvez les énigmes précédentes avant de récupérer cet objet.', '', 47.8622, 13.1262, 'img/billet.png', 232, 97, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 4, 16, 0, NULL, 7, NULL, NULL),
(7, 'Aéroport', 'Une femme correspondant à celle des images de surveillance a pris l’avion pour l’Égypte la nuit du meurtre. Vous la retrouverez peut-être là-bas... \r\n\r\n<p id =\'indice_texte\' style=\'text-align:center;\'><button class = \'bouton_indice\'>Indice</button> </p>', '<p>Utilisez votre billet pour prendre l\'avion.</p>', 47.7942, 13.0012, 'img/avion.png', 300, 75, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 5, 16, 0, NULL, 9, NULL, 6),
(8, 'Madame', 'Bravo ! Vous avez retrouvé la meurtrière !<form id = \"form\" action=\"fin.php\" method=\'post\' style=\'text-align:center;\'>\r\n<input type=\"hidden\" name=\"time\" value=\"\" >\r\n<input type=\"texte\" name=\"username\" placeholder=\"Pseudo\" required><br>\r\n<p>\r\n<button type=\"submit\" name=\"submit\">Submit</button>\r\n</p>\r\n</form>', '', 29.9773, 31.1303, 'img/madame.png', 101, 144, 'music/zapsplat_horror_stab_dark_scary_cinematic_004_11803.mp3', 6, 7, 0, NULL, NULL, NULL, NULL),
(9, 'antiquaire', 'Vous interrogez l\'antiquaire de l\'aéroport, mais il ne répondra à vos questions que si vous l\'aidez à retrouver les vases canopes qui lui ont été volés.\r\n\r\n<p>Rapportez-lui les vases dans le bon ordre car il est un peu maniaque... </p>\r\n\r\n<p id =\'indice_texte\' style=\'text-align:center;\'><button class = \'bouton_indice\'>Indice</button> </p>', 'Les vases se trouvent dans les alentours. Observez-les biens pour déterminer le bon ordre.', 30.1123, 31.397, 'img/antiquaire.png', 57, 111, NULL, 5, 14, 0, NULL, 10, NULL, 17),
(10, 'Antiquaire 1', 'L\'antiquaire attend le deuxième vase canope. <p id =\'indice_texte\' style=\'text-align:center;\'><button class = \'bouton_indice\'>Indice</button> </p>', 'Le deuxième vase a une tête de chacal.', 30.1123, 31.397, 'img/antiquaire1.png', 77, 111, NULL, 5, 14, 0, NULL, 11, NULL, 14),
(11, 'Antiquaire 2', 'L\'antiquaire aimerait bien que vous trouviez le troisième vase canope.\r\n\r\n<p id =\'indice_texte\' style=\'text-align:center;\'><button class = \'bouton_indice\'>Indice</button> </p>', 'Si vous n\'avez toujours pas compris, il faut regarder le nombre de bandes sur les vases.', 30.1123, 31.397, 'img/antiquaire2.png', 103, 111, NULL, 5, 14, 0, NULL, 12, NULL, 15),
(12, 'Antiquaire 3', 'Faites attention si vous ne trouvez pas rapidement les autres vases canopes, l\'antiquaire risque de refuser de vous aider !', '', 30.1123, 31.397, 'img/antiquaire3.png', 129, 111, NULL, 5, 14, 0, NULL, 13, NULL, 16),
(13, 'Antiquaire 4', 'Bravo ! Vous avez retrouvé tous les vases ! L\'antiquaire vous indique qu\'il a entendu la femme demander comment se rendre aux pyramides qui se situent à l\'ouest de la ville.', '', 30.1123, 31.397, 'img/antiquaire4.png', 151, 111, NULL, 1, 14, 0, NULL, 8, NULL, NULL),
(14, 'Vase chacal', 'Votre inventaire est plein. Résolvez les énigmes précédentes pour pouvoir récupérer cet objet.', '', 30.1246, 31.361, 'img/vase_renard.png', 126, 167, NULL, 4, 15, 1, NULL, NULL, NULL, NULL),
(15, 'Vase babouin', 'Votre inventaire est plein. Résolvez les énigmes précédentes pour pouvoir récupérer cet objet.', '', 30.1021, 31.3301, 'img/vase_babouin.png', 160, 83, NULL, 4, 13, 1, NULL, NULL, NULL, NULL),
(16, 'Vase oiseau', 'Votre inventaire est plein. Résolvez les énigmes précédentes pour pouvoir récupérer cet objet.', '', 30.0658, 31.3948, 'img/vase_oiseau.png', 124, 142, NULL, 4, 15, 1, NULL, NULL, NULL, NULL),
(17, 'Vase pharaon', 'Votre inventaire est plein. Résolvez les enigmes précédentes pour pouvoir récupérer cet objet.', '', 30.1217, 31.3658, 'img/vase_pharaon.png', 162, 95, NULL, 4, 15, 1, NULL, NULL, NULL, NULL);

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
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
