-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 17 jan. 2020 à 15:04
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
CREATE DATABASE IF NOT EXISTS `chu_bdd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `chu_bdd`;

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

--
-- Déchargement des données de la table `acte_realise`
--

INSERT INTO `acte_realise` (`id`, `code`, `libelle`, `prix`, `id_document`) VALUES
(1, 'BACA008', 'Suture de plaie du sourcil', 29.07, 2),
(2, 'GAJA002', 'Parage et/ou suture de plaie du nez', 53.88, 2);

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

--
-- Déchargement des données de la table `analyse`
--

INSERT INTO `analyse` (`id`, `nom`, `unite`, `norme_min`, `norme_max`) VALUES
(1, 'Glycémie', 'g/l', 0.5, 2.5),
(2, 'Globule rouge', 'mmol/l', 10, 20),
(3, 'Globule blanc', 'mmol/l', 10.2, 15.8),
(4, 'Vitamine C', 'µmol/l', 28, 100);

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

--
-- Déchargement des données de la table `diagnostique`
--

INSERT INTO `diagnostique` (`id`, `code`, `libelle`, `id_document`) VALUES
(1, 'CD123456', 'VIH', 3),
(2, 'R278', 'Troubles de la coordination, autres et non précisés', 1),
(3, 'Z635', 'Difficultés liées à la dislocation de la famille par séparation et divorce', 2);

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `titre` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lien` varchar(250) DEFAULT NULL,
  `type` varchar(250) NOT NULL,
  `texte` text,
  `date` date NOT NULL,
  `id_patient` int(11) NOT NULL,
  `id_mouvement` int(11) DEFAULT NULL,
  `id_sejour` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `document`
--

INSERT INTO `document` (`id`, `titre`, `lien`, `type`, `texte`, `date`, `id_patient`, `id_mouvement`, `id_sejour`) VALUES
(1, 'Teste du taux de vitamine C en neurologie.', 'dossier/taux_vit_c.pdf', 'Résultat d\'analyse', NULL, '2020-01-08', 1, 1, 1),
(2, 'Facture pour un rhume', 'dossier/facture_rhum.pdf', 'Acte', NULL, '2020-01-17', 2, 2, NULL),
(3, 'VIH', NULL, 'Diagnostique', 'Tu as le VIH et tu vas mourir.', '2020-01-09', 3, 4, 5);

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

--
-- Déchargement des données de la table `mouvement`
--

INSERT INTO `mouvement` (`id`, `date_debut`, `date_fin`, `id_service`, `id_sejour`) VALUES
(1, '2018-04-10', '2018-05-12', 8, 3),
(2, '2018-05-13', '2018-05-20', 4, 3),
(3, '2017-10-10', '2017-10-10', 2, 5),
(4, '2017-11-02', '2017-12-23', 9, 5),
(5, '2019-03-13', '2019-10-28', 10, 4);

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

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`id`, `ipp`, `nom`, `prenom`, `date_naissance`, `sexe`) VALUES
(1, ' 202015648512', ' Snow', 'thierry', '2002-05-12', 'Homme'),
(2, ' 202015648555', 'arlot', 'thierry', '2002-05-12', 'Homme'),
(3, ' 202015649865', ' Snow', 'pierrre', '2005-02-22', 'Homme'),
(4, ' 202015647545', 'beaupeau', 'christine', '1980-03-02', 'Femme'),
(5, ' 202015648654', 'ada', 'thierry', '1987-08-08', 'Autre');

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

--
-- Déchargement des données de la table `resultat_analyse`
--

INSERT INTO `resultat_analyse` (`id`, `resultat_quantitatif`, `id_document`, `id_analyse`) VALUES
(1, 111, 1, 4),
(2, 4, 1, 1);

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

--
-- Déchargement des données de la table `sejour`
--

INSERT INTO `sejour` (`id`, `IEP`, `date_debut`, `date_fin`, `id_patient`) VALUES
(1, 516555546, '2018-10-15', '2018-12-28', 1),
(2, 516555555, '2019-08-06', '2019-10-24', 2),
(3, 516555525, '2018-04-01', '2018-12-20', 3),
(4, 516555566, '2019-03-13', '2019-11-29', 3),
(5, 516552320, '2017-10-04', '2018-11-29', 5),
(6, 516553347, '2018-07-10', '2018-11-30', 2);

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `nom` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`id`, `nom`) VALUES
(1, 'Cancérologie'),
(2, 'Chirurgie ambulatoire'),
(3, 'Urgences - adultes'),
(4, 'Rhumatologie'),
(5, 'Réanimation chirurgicale'),
(6, 'Psychiatrie B - CPTS'),
(7, 'Ophtalmologie'),
(8, 'Neurologie'),
(9, 'Neurochirurgie'),
(10, 'Médecine Cardiologique'),
(11, 'Laboratoire d\'hématologie'),
(12, 'Laboratoire de Biochimie et de Biologie moléculaire');

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ipp` (`ipp`);

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
  ADD UNIQUE KEY `IEP` (`IEP`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `analyse`
--
ALTER TABLE `analyse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `diagnostique`
--
ALTER TABLE `diagnostique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `mouvement`
--
ALTER TABLE `mouvement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `resultat_analyse`
--
ALTER TABLE `resultat_analyse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `sejour`
--
ALTER TABLE `sejour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
