-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 22 nov. 2020 à 22:58
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `objet`
--

-- --------------------------------------------------------

--
-- Structure de la table `tbl_objet`
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
  `visible` int(11) NOT NULL,
  `ancre_icone_x` int(11) NOT NULL,
  `ancre_icone_y` int(11) NOT NULL,
  `ancre_popup_x` int(11) NOT NULL,
  `ancre_popup_y` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tbl_objet`
--

INSERT INTO `tbl_objet` (`id`, `nom`, `indice`, `latitude`, `longitude`, `icone`, `type`, `minZoom`, `visible`, `ancre_icone_x`, `ancre_icone_y`, `ancre_popup_x`, `ancre_popup_y`) VALUES
(1, 'Cadavre', 'L’archéologue Markus Muller spécialisée dans les pyramides égyptiennes a été assassiné : explorez les alentours pour trouver des indices !', 47.8625, 13.1259, 'img/bonhomme.png', 1, 2, 1, 0, 0, 0, 0),
(2, 'Caméra', 'Cette caméra semble filmer le perron de la maison de Markus Muller, mais il vous faudra demander le code à la police locale pour accéder aux images.', 47.8624, 13.1255, 'img/camera.png', 2, 2, 0, 1361, 2305, 2289, 41),
(3, 'Code', 'L’agent … vous donne le code pour accéder aux images de la caméra : ……', 47.8654, 13.1233, 'img/post-it.png', 3, 2, 0, 761, 129, 781, 93),
(4, 'Billet', 'Sur les images vous voyez une femme quitter avec une valise le logement de Markus Muller. Elle tient un bout de papier qui semble être un billet d’avion.', 49.6289, 6.2147, 'img/billet.png', 4, 2, 0, 580, 242, 580, 0),
(5, 'Aéroport', 'Une femme correspondant à celle des images de surveillance à pris l’avion pour l’Egypte la nuit du meurtre. Vous la retrouverez peut-être là-bas.', 47.7942, 13.0012, 'img/avion.png', 5, 2, 0, 487, 317, 466, 0),
(6, 'Madame', 'Bravo ! Vous avez retrouvé la meurtrière !', 29.9773, 31.1303, 'img/madame.jpg', 4, 2, 0, 160, 320, 165, 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `tbl_objet`
--
ALTER TABLE `tbl_objet`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `tbl_objet`
--
ALTER TABLE `tbl_objet`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
