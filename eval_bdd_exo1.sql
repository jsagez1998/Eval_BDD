-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           10.2.27-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour eval_bdd
DROP DATABASE IF EXISTS `eval_bdd`;
CREATE DATABASE `eval_bdd` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `eval_bdd`;
-- Listage de la structure de la table eval_bdd. clients
CREATE TABLE IF NOT EXISTS `clients` (
  `cli_num` int(11) NOT NULL AUTO_INCREMENT,
  `cli_nom` varchar(50) DEFAULT NULL,
  `cli_adresse` varchar(50) DEFAULT NULL,
  `cli_tel` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cli_num`),
  KEY `IX_nom` (`cli_nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table eval_bdd. commande
CREATE TABLE IF NOT EXISTS `commande` (
  `com_num` int(11) NOT NULL AUTO_INCREMENT,
  `cli_num` int(11) DEFAULT NULL,
  `com_date` datetime DEFAULT NULL,
  `com_obs` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`com_num`),
  KEY `cli_num` (`cli_num`),
  CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`cli_num`) REFERENCES `client` (`cli_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table eval_bdd. est_compose
CREATE TABLE IF NOT EXISTS `est_compose` (
  `com_num` int(11) NOT NULL,
  `pro_num` int(11) NOT NULL,
  `est_qte` int(11) DEFAULT NULL,
  PRIMARY KEY (`com_num`,`pro_num`),
  KEY `pro_num` (`pro_num`),
  CONSTRAINT `est_compose_ibfk_1` FOREIGN KEY (`com_num`) REFERENCES `commande` (`com_num`),
  CONSTRAINT `est_compose_ibfk_2` FOREIGN KEY (`pro_num`) REFERENCES `produit` (`pro_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table eval_bdd. produit
CREATE TABLE IF NOT EXISTS `produit` (
  `pro_num` int(11) NOT NULL AUTO_INCREMENT,
  `pro_libelle` varchar(50) DEFAULT NULL,
  `pro_description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pro_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Création de l'index sur cli_nom
DROP INDEX IF EXISTS IX_nom ON clients;
ALTER TABLE clients;
CREATE INDEX IX_nom ON clients(cli_nom);
-- Les données exportées n'étaient pas sélectionnées.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;