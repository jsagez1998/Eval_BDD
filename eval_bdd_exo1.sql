-- Listage de la structure de la base pour eval_bdd
DROP DATABASE IF EXISTS eval_bdd;
CREATE DATABASE eval_bdd;
USE eval_bdd;
-- Listage de la structure de la table eval_bdd. clients
CREATE TABLE IF NOT EXISTS clients (
  cli_num int(11) NOT NULL AUTO_INCREMENT,
  cli_nom varchar(50) DEFAULT NULL,
  cli_adresse varchar(50) DEFAULT NULL,
  cli_tel varchar(30) DEFAULT NULL,
  PRIMARY KEY (cli_num),
  KEY IX_nom (cli_nom)
);

-- Listage de la structure de la table eval_bdd. commande
CREATE TABLE IF NOT EXISTS commande (
  com_num int(11) NOT NULL AUTO_INCREMENT,
  cli_num int(11) DEFAULT NULL,
  com_date datetime DEFAULT NULL,
  com_obs varchar(50) DEFAULT NULL,
  PRIMARY KEY (com_num),
  KEY cli_num (cli_num),
  commande_ibfk_1 FOREIGN KEY (cli_num) REFERENCES client (cli_num)
);


-- Listage de la structure de la table eval_bdd. est_compose
CREATE TABLE IF NOT EXISTS est_compose (
  com_num int(11) NOT NULL,
  pro_num int(11) NOT NULL,
  est_qte int(11) DEFAULT NULL,
  PRIMARY KEY (com_num,pro_num),
  KEY pro_num (pro_num),
  est_compose_ibfk_1 FOREIGN KEY (com_num) REFERENCES commande (com_num),
  est_compose_ibfk_2 FOREIGN KEY (pro_num) REFERENCES produit (pro_num)
);

-- Listage de la structure de la table eval_bdd. produit
CREATE TABLE IF NOT EXISTS produit (
  pro_num int(11) NOT NULL AUTO_INCREMENT,
  pro_libelle varchar(50) DEFAULT NULL,
  pro_description varchar(50) DEFAULT NULL,
  PRIMARY KEY (pro_num)
);

-- Création de l'index sur cli_nom
DROP INDEX IF EXISTS IX_nom ON clients;
ALTER TABLE clients;
CREATE INDEX IX_nom ON clients(cli_nom);