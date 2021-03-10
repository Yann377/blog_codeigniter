-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 08 mars 2021 à 12:34
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_blog_codeigniter`
--

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `ID_DISCUSSION` int(11) NOT NULL AUTO_INCREMENT,
  `NOMDISCUSSION` char(32) DEFAULT NULL,
  `NOMUSERCREATEUR` char(32) DEFAULT NULL,
  `TYPEDEDISCUSSION` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID_DISCUSSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `ID_MESSAGE` int(11) NOT NULL AUTO_INCREMENT,
  `ID_DISCUSSION` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `MESSAGE` char(32) DEFAULT NULL,
  `DATEMESSAGE` char(32) DEFAULT NULL,
  `COMMENTE` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID_MESSAGE`),
  KEY `I_FK_MESSAGE_GROUPE` (`ID_DISCUSSION`),
  KEY `I_FK_MESSAGE_USER` (`ID_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `ID_USER` int(11) NOT NULL AUTO_INCREMENT,
  `NOMUSER` char(32) DEFAULT NULL,
  `PRENOMUSER` char(32) DEFAULT NULL,
  `MAILUSER` char(32) DEFAULT NULL,
  `MDPUSER` char(32) DEFAULT NULL,
  `TYPEUSER` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`ID_DISCUSSION`) REFERENCES `groupe` (`ID_DISCUSSION`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
