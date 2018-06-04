-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Lun 04 Juin 2018 à 14:07
-- Version du serveur :  5.7.22-0ubuntu0.17.10.1
-- Version de PHP :  7.1.17-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `hotel`
--

-- --------------------------------------------------------

--
-- Structure de la table `bathroom`
--

CREATE TABLE `bathroom` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `bathroom_type`
--

CREATE TABLE `bathroom_type` (
  `id` int(11) NOT NULL,
  `id_bedroom` int(11) NOT NULL,
  `id_bathroom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `bed`
--

CREATE TABLE `bed` (
  `id` int(11) NOT NULL,
  `bed` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `bedroom`
--

CREATE TABLE `bedroom` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `area` int(11) NOT NULL,
  `reduced_mobility` tinyint(1) NOT NULL,
  `id_floor` int(11) NOT NULL,
  `id_view` int(11) NOT NULL,
  `id_bed` int(11) NOT NULL,
  `id_bedroom_type` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `bedroom_type`
--

CREATE TABLE `bedroom_type` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_bedroom` int(11) NOT NULL,
  `nuites` int(11) NOT NULL,
  `arrival_date` date NOT NULL,
  `departure_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `adress` text NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `floor`
--

CREATE TABLE `floor` (
  `id` int(11) NOT NULL,
  `floor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  `id_bedroom` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `order_state`
--

CREATE TABLE `order_state` (
  `id` int(11) NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `id_service_category` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `services_category`
--

CREATE TABLE `services_category` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `services_type`
--

CREATE TABLE `services_type` (
  `id` int(11) NOT NULL,
  `id_bedroom` int(11) NOT NULL,
  `id_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `views`
--

CREATE TABLE `views` (
  `id` int(11) NOT NULL,
  `view` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `bathroom`
--
ALTER TABLE `bathroom`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bathroom_type`
--
ALTER TABLE `bathroom_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bedroom` (`id_bedroom`),
  ADD KEY `id_bathroom` (`id_bathroom`);

--
-- Index pour la table `bed`
--
ALTER TABLE `bed`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bedroom`
--
ALTER TABLE `bedroom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_floor` (`id_floor`),
  ADD KEY `id_view` (`id_view`),
  ADD KEY `id_bed` (`id_bed`),
  ADD KEY `id_bedroom` (`id_bedroom_type`);

--
-- Index pour la table `bedroom_type`
--
ALTER TABLE `bedroom_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_bedroom` (`id_bedroom`);

--
-- Index pour la table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `floor`
--
ALTER TABLE `floor`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_service` (`id_service`),
  ADD KEY `id_bedroom` (`id_bedroom`),
  ADD KEY `id_state` (`id_state`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Index pour la table `order_state`
--
ALTER TABLE `order_state`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_service_category` (`id_service_category`);

--
-- Index pour la table `services_category`
--
ALTER TABLE `services_category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `services_type`
--
ALTER TABLE `services_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bedroom` (`id_bedroom`),
  ADD KEY `id_service` (`id_service`);

--
-- Index pour la table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `bathroom_type`
--
ALTER TABLE `bathroom_type`
  ADD CONSTRAINT `bathroom_type_ibfk_1` FOREIGN KEY (`id_bedroom`) REFERENCES `bedroom` (`id`),
  ADD CONSTRAINT `bathroom_type_ibfk_2` FOREIGN KEY (`id_bathroom`) REFERENCES `bathroom` (`id`);

--
-- Contraintes pour la table `bedroom`
--
ALTER TABLE `bedroom`
  ADD CONSTRAINT `bedroom_ibfk_1` FOREIGN KEY (`id_floor`) REFERENCES `floor` (`id`),
  ADD CONSTRAINT `bedroom_ibfk_2` FOREIGN KEY (`id_view`) REFERENCES `views` (`id`),
  ADD CONSTRAINT `bedroom_ibfk_3` FOREIGN KEY (`id_bed`) REFERENCES `bed` (`id`),
  ADD CONSTRAINT `bedroom_ibfk_4` FOREIGN KEY (`id_bedroom_type`) REFERENCES `bedroom_type` (`id`);

--
-- Contraintes pour la table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`id_bedroom`) REFERENCES `bedroom` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`id_bedroom`) REFERENCES `bedroom` (`id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`id_state`) REFERENCES `order_state` (`id`),
  ADD CONSTRAINT `order_ibfk_4` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`);

--
-- Contraintes pour la table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`id_service_category`) REFERENCES `services_category` (`id`);

--
-- Contraintes pour la table `services_type`
--
ALTER TABLE `services_type`
  ADD CONSTRAINT `services_type_ibfk_1` FOREIGN KEY (`id_bedroom`) REFERENCES `bedroom` (`id`),
  ADD CONSTRAINT `services_type_ibfk_2` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
