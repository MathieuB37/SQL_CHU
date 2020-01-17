-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 17 jan. 2020 à 12:03
-- Version du serveur :  8.0.18
-- Version de PHP : 7.3.11-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `chu_bdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `acte_realise`
--

CREATE TABLE `acte_realise` (
  `id` int(11) NOT NULL,
  `code` varchar(7) NOT NULL,
  `libelle` varchar(250) NOT NULL,
  `prix` float NOT NULL,
  `id_document` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `analyse`
--

CREATE TABLE `analyse` (
  `id` int(11) NOT NULL,
  `nom` varchar(250) NOT NULL,
  `unite` varchar(250) NOT NULL,
  `norme_min` float NOT NULL,
  `norme_max` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `diagnostique`
--

CREATE TABLE `diagnostique` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `libelle` varchar(250) NOT NULL,
  `id_document` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `nom` varchar(250) NOT NULL,
  `format` varchar(5) DEFAULT NULL,
  `type` varchar(250) NOT NULL,
  `texte` text,
  `date` date NOT NULL,
  `id_patient` int(11) NOT NULL,
  `id_mouvement` int(11) NOT NULL,
  `id_sejour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `mouvement`
--

CREATE TABLE `mouvement` (
  `id` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date DEFAULT NULL,
  `id_service` int(11) NOT NULL,
  `id_sejour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `ipp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `date_naissance` date NOT NULL,
  `sexe` enum('Homme','Femme','Autre') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `resultat_analyse`
--

CREATE TABLE `resultat_analyse` (
  `id` int(11) NOT NULL,
  `resultat_quantitatif` float NOT NULL,
  `id_document` int(11) NOT NULL,
  `id_analyse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sejour`
--

CREATE TABLE `sejour` (
  `id` int(11) NOT NULL,
  `IEP` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date DEFAULT NULL,
  `id_patient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `nom` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acte_realise`
--
ALTER TABLE `acte_realise`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_id` (`id_document`);

--
-- Index pour la table `analyse`
--
ALTER TABLE `analyse`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `diagnostique`
--
ALTER TABLE `diagnostique`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CONTRAINTE_chu1` (`id_document`);

--
-- Index pour la table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Document_Patient_FK` (`id_patient`),
  ADD KEY `mouvement_id` (`id_mouvement`),
  ADD KEY `id_sejour` (`id_sejour`);

--
-- Index pour la table `mouvement`
--
ALTER TABLE `mouvement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Mouvement_Service_FK` (`id_service`),
  ADD KEY `id_sejour` (`id_sejour`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `resultat_analyse`
--
ALTER TABLE `resultat_analyse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Resultat_analyse_Document_FK` (`id_document`),
  ADD KEY `Resultat_analyse_Analyse0_FK` (`id_analyse`);

--
-- Index pour la table `sejour`
--
ALTER TABLE `sejour`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`id_patient`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `acte_realise`
--
ALTER TABLE `acte_realise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `analyse`
--
ALTER TABLE `analyse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `diagnostique`
--
ALTER TABLE `diagnostique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mouvement`
--
ALTER TABLE `mouvement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `resultat_analyse`
--
ALTER TABLE `resultat_analyse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sejour`
--
ALTER TABLE `sejour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `acte_realise`
--
ALTER TABLE `acte_realise`
  ADD CONSTRAINT `acte_realise_ibfk_1` FOREIGN KEY (`id_document`) REFERENCES `document` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `diagnostique`
--
ALTER TABLE `diagnostique`
  ADD CONSTRAINT `CONTRAINTE_chu1` FOREIGN KEY (`id_document`) REFERENCES `document` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `Document_Patient_FK` FOREIGN KEY (`id_patient`) REFERENCES `patient` (`id`),
  ADD CONSTRAINT `document_ibfk_1` FOREIGN KEY (`id_mouvement`) REFERENCES `mouvement` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `document_ibfk_2` FOREIGN KEY (`id_sejour`) REFERENCES `sejour` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `mouvement`
--
ALTER TABLE `mouvement`
  ADD CONSTRAINT `Mouvement_Service_FK` FOREIGN KEY (`id_service`) REFERENCES `service` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `mouvement_ibfk_1` FOREIGN KEY (`id_sejour`) REFERENCES `sejour` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `resultat_analyse`
--
ALTER TABLE `resultat_analyse`
  ADD CONSTRAINT `Resultat_analyse_Analyse0_FK` FOREIGN KEY (`id_analyse`) REFERENCES `analyse` (`id`),
  ADD CONSTRAINT `Resultat_analyse_Document_FK` FOREIGN KEY (`id_document`) REFERENCES `document` (`id`);

--
-- Contraintes pour la table `sejour`
--
ALTER TABLE `sejour`
  ADD CONSTRAINT `sejour_ibfk_1` FOREIGN KEY (`id_patient`) REFERENCES `patient` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
