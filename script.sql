-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2018 at 07:00 AM
-- Server version: 5.5.27
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sebraemg`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(10) UNSIGNED NOT NULL,
  `street` varchar(100) NOT NULL,
  `number` smallint(3) UNSIGNED NOT NULL,
  `neighborhood` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `street`, `number`, `neighborhood`, `city`, `created_at`, `updated_at`) VALUES
(1, 'Av. Barão Homem de Melo', 329, 'Nova Granada', 'Belo Horizonte', '2018-10-27 01:31:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Mercado e vendas', '2018-10-27 01:32:54', NULL),
(2, 'Finanças', '2018-11-09 03:49:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `consultant`
--

CREATE TABLE `consultant` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consultant`
--

INSERT INTO `consultant` (`id`, `name`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 'Melinda Perez', 'https://randomuser.me/api/portraits/women/86.jpg', '2018-10-27 01:28:07', NULL),
(2, 'Daniela Barbosa Martins', 'https://randomuser.me/api/portraits/women/85.jpg', '2018-11-09 03:49:58', NULL),
(3, 'Virgínia Figueiredo', 'https://randomuser.me/api/portraits/women/84.jpg', '2018-11-09 03:50:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_category` int(10) UNSIGNED NOT NULL,
  `id_consultant` int(10) UNSIGNED NOT NULL,
  `id_address` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `start` datetime NOT NULL,
  `finish` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `id_category`, `id_consultant`, `id_address`, `title`, `description`, `price`, `start`, `finish`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Consultoria Presencial de Marketing', 'Se você possui um pequeno negócio e deseja melhorar o desempenho da sua gestão, planejar estratégias para vencer a atual crise econômica e está em busca de um trabalho personalizado, conheça a Consultoria Empresarial do Sebrae.', '150.00', '2017-10-12 18:00:00', '2017-10-12 19:30:00', '2018-10-27 01:34:31', NULL),
(2, 2, 2, 1, 'Oficina MEI - Aprenda a administrar o seu negócio', 'As Oficinas SEI do Sebrae ensinam os principais pontos para a gestão de um negócio eficiente e lucrativo para o Microempreendedor Individual.', '30.00', '2017-06-02 15:00:00', '2017-06-02 16:30:00', '2018-11-09 03:54:36', NULL),
(3, 1, 3, 1, 'Curso Empretec', 'O Empretec é uma metodologia da Organização das Nações Unidas - ONU voltada para o desenvolvimento de características de comportamento empreendedor e para a identificação de novas oportunidades de negócios, promovido em cerca de 34 países.', '1680.00', '2017-11-04 08:00:00', '2017-11-04 18:00:00', '2018-11-09 03:56:40', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consultant`
--
ALTER TABLE `consultant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id_category_foreign` (`id_category`),
  ADD KEY `course_id_consultant_foreign` (`id_consultant`),
  ADD KEY `course_id_address_foreign` (`id_address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `consultant`
--
ALTER TABLE `consultant`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_id_address_foreign` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `course_id_category_foreign` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `course_id_consultant_foreign` FOREIGN KEY (`id_consultant`) REFERENCES `consultant` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
