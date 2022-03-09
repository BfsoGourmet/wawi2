-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 09. Mrz 2022 um 16:09
-- Server-Version: 10.4.19-MariaDB
-- PHP-Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `mydb`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(0, 'bruhtegorie', 'bruhhhhh');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `clients`
--

INSERT INTO `clients` (`id`, `firstName`, `lastName`, `phone`, `address`) VALUES
(0, 'breh', 'broh', '1', '0');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `curiers`
--

CREATE TABLE `curiers` (
  `id` int(11) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `curiers`
--

INSERT INTO `curiers` (`id`, `firstName`, `lastName`, `phone`) VALUES
(0, 'Bruh', 'Tan', '0000000000');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `orderprodconn`
--

CREATE TABLE `orderprodconn` (
  `id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `orderprodconn`
--

INSERT INTO `orderprodconn` (`id`, `products_id`, `orders_id`) VALUES
(0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `curiers_id` int(11) NOT NULL,
  `clients_id` int(11) NOT NULL,
  `deliverydate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `orders`
--

INSERT INTO `orders` (`id`, `curiers_id`, `clients_id`, `deliverydate`) VALUES
(0, 0, 0, '2032-03-18');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `producers`
--

CREATE TABLE `producers` (
  `id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `producers`
--

INSERT INTO `producers` (`id`, `name`, `number`) VALUES
(0, 'bruhducer', '079 789 78 89');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `productIndex` int(11) DEFAULT NULL,
  `currentliAvailable` varchar(45) DEFAULT NULL,
  `productName` varchar(45) DEFAULT NULL,
  `shortDescription` varchar(150) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `quantityInStock` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `seasonalPrice` double DEFAULT NULL,
  `specialPrice` double DEFAULT NULL,
  `creationDate` date DEFAULT NULL,
  `dateOfLastChange` date DEFAULT NULL,
  `vegeterian` tinyint(4) DEFAULT NULL,
  `vegan` tinyint(4) DEFAULT NULL,
  `calories` double DEFAULT NULL,
  `sugar` double DEFAULT NULL,
  `categories_id` int(11) NOT NULL,
  `producers_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `products`
--

INSERT INTO `products` (`id`, `productIndex`, `currentliAvailable`, `productName`, `shortDescription`, `description`, `quantityInStock`, `price`, `seasonalPrice`, `specialPrice`, `creationDate`, `dateOfLastChange`, `vegeterian`, `vegan`, `calories`, `sugar`, `categories_id`, `producers_id`) VALUES
(0, 5000, '1', 'Bruh.', 'Bruh.', 'Bruh...', 2, 2, 2, 2, '2022-03-01', '2022-03-15', 0, 0, 3, 2, 0, 0);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `curiers`
--
ALTER TABLE `curiers`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `orderprodconn`
--
ALTER TABLE `orderprodconn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orderprodconn_products1` (`products_id`),
  ADD KEY `fk_orderprodconn_orders1` (`orders_id`);

--
-- Indizes für die Tabelle `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_curiers1` (`curiers_id`),
  ADD KEY `fk_orders_clients1` (`clients_id`);

--
-- Indizes für die Tabelle `producers`
--
ALTER TABLE `producers`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Products_categories` (`categories_id`),
  ADD KEY `fk_Products_producers1` (`producers_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `orderprodconn`
--
ALTER TABLE `orderprodconn`
  ADD CONSTRAINT `fk_orderprodconn_orders1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orderprodconn_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_clients1` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_curiers1` FOREIGN KEY (`curiers_id`) REFERENCES `curiers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_Products_categories` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Products_producers1` FOREIGN KEY (`producers_id`) REFERENCES `producers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
