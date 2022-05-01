-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2021 at 11:42 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kincir_island`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id_area` int(11) NOT NULL,
  `name_province` varchar(100) NOT NULL,
  `location_area` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sensor`
--

CREATE TABLE `sensor` (
  `id_sensor` int(11) NOT NULL,
  `timestamp_sensor` datetime NOT NULL,
  `wind_speed_sensor` float NOT NULL,
  `wind_direction_sensor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sensor`
--

INSERT INTO `sensor` (`id_sensor`, `timestamp_sensor`, `wind_speed_sensor`, `wind_direction_sensor`) VALUES
(1, '2021-12-11 12:01:15', 20, 2),
(2, '2021-12-11 12:01:20', 21, 2),
(3, '2021-12-11 15:57:26', 49.4, 175.34),
(4, '2021-12-11 15:57:38', 45.16, 174.75),
(5, '2021-12-11 15:57:40', 52.67, 151.41),
(6, '2021-12-11 15:57:41', 59.36, 204.7),
(7, '2021-12-11 15:57:42', 59.13, 208.68),
(8, '2021-12-11 15:57:43', 61.74, 175.7),
(9, '2021-12-11 15:57:44', 31.98, 200.21),
(10, '2021-12-11 15:57:45', 45.61, 174.34),
(11, '2021-12-11 15:57:46', 55.31, 218.18),
(12, '2021-12-11 15:57:48', 35.61, 188.91),
(13, '2021-12-11 15:57:50', 38.66, 171.09),
(14, '2021-12-11 15:57:51', 68.14, 200.35),
(15, '2021-12-11 15:57:52', 55.31, 194.51),
(16, '2021-12-11 15:57:54', 37.61, 166.38),
(17, '2021-12-11 15:57:55', 32.48, 181.8),
(18, '2021-12-11 15:57:56', 52.08, 167.94),
(19, '2021-12-11 15:57:57', 67.59, 194.24),
(20, '2021-12-11 15:57:58', 54.38, 181.59),
(21, '2021-12-11 15:57:59', 44.8, 188.49),
(22, '2021-12-11 15:58:00', 51.22, 192.17),
(23, '2021-12-11 15:58:01', 47.4, 196.24),
(24, '2021-12-11 15:58:02', 51.73, 154.15),
(25, '2021-12-11 15:58:03', 49.16, 223.07),
(26, '2021-12-11 15:58:04', 46.01, 143.16),
(27, '2021-12-11 15:58:05', 39.15, 211.61),
(28, '2021-12-11 15:58:06', 46.2, 168.96),
(29, '2021-12-11 15:58:07', 67.85, 223.96),
(30, '2021-12-11 15:58:08', 42.86, 133.72),
(31, '2021-12-11 15:58:09', 48.15, 208.91),
(32, '2021-12-11 15:58:11', 48.08, 109.89),
(33, '2021-12-11 15:58:18', 67.69, 178.61),
(34, '2021-12-11 15:58:19', 51.24, 191.65),
(35, '2021-12-11 15:58:20', 56.22, 138.97),
(36, '2021-12-11 15:58:21', 55.63, 203.8),
(37, '2021-12-11 15:58:22', 35.6, 88.99),
(38, '2021-12-11 15:58:23', 59.6, 172.91),
(39, '2021-12-11 15:58:24', 48.14, 152.78),
(40, '2021-12-11 15:58:26', 66.33, 180.12),
(41, '2021-12-11 15:58:27', 47.03, 122.31),
(42, '2021-12-11 15:58:28', 54.41, 184.54),
(43, '2021-12-11 15:58:29', 54.59, 129.65),
(44, '2021-12-11 15:58:30', 53.54, 222.32),
(45, '2021-12-11 15:58:31', 50.21, 166.14),
(46, '2021-12-11 15:58:33', 52.59, 173.09),
(47, '2021-12-11 15:58:34', 45.99, 158.89),
(48, '2021-12-11 15:58:35', 34.39, 153.24),
(49, '2021-12-11 15:58:37', 44.04, 164.86),
(50, '2021-12-11 15:58:38', 46.94, 241.65),
(51, '2021-12-11 15:58:39', 45.44, 225.63),
(52, '2021-12-11 15:58:41', 48.28, 195.76),
(53, '2021-12-11 15:58:42', 61.97, 154.48),
(54, '2021-12-11 15:58:43', 40, 191.23),
(55, '2021-12-11 15:58:45', 53.52, 201.63),
(56, '2021-12-11 15:58:46', 44.2, 155.98),
(57, '2021-12-11 15:58:48', 54.6, 225.69),
(58, '2021-12-11 15:58:50', 61.59, 155.58),
(59, '2021-12-11 15:58:51', 61.11, 132.59),
(60, '2021-12-11 15:58:52', 36.23, 181.39),
(61, '2021-12-11 15:58:54', 61.47, 142.96),
(62, '2021-12-11 15:58:55', 57.9, 147.25),
(63, '2021-12-11 15:58:56', 44.67, 193.55),
(64, '2021-12-11 15:58:57', 46.64, 218.25),
(65, '2021-12-11 15:58:59', 64.67, 159.22),
(66, '2021-12-11 15:59:00', 43.68, 194.23),
(67, '2021-12-11 15:59:02', 49.94, 201.43),
(68, '2021-12-11 15:59:03', 51.72, 151.98),
(69, '2021-12-11 15:59:05', 55.95, 151.56),
(70, '2021-12-11 15:59:07', 54.76, 228.61),
(71, '2021-12-11 15:59:09', 50.32, 167.36),
(72, '2021-12-11 15:59:10', 58.24, 191.46),
(73, '2021-12-11 15:59:12', 33.67, 198.86),
(74, '2021-12-11 15:59:13', 47.87, 171.33),
(75, '2021-12-11 15:59:15', 55.62, 210.38),
(76, '2021-12-11 15:59:16', 39.17, 186.09),
(77, '2021-12-11 15:59:17', 46.69, 140.13),
(78, '2021-12-11 15:59:19', 43.97, 175.4),
(79, '2021-12-11 15:59:21', 48.73, 188),
(80, '2021-12-11 15:59:23', 34.02, 194.25),
(81, '2021-12-11 15:59:25', 54.52, 184.35),
(82, '2021-12-11 15:59:27', 37.38, 131.24),
(83, '2021-12-11 15:59:29', 50.48, 209.74),
(84, '2021-12-11 15:59:30', 45.9, 215.12),
(85, '2021-12-11 15:59:32', 50.23, 212.54),
(86, '2021-12-11 15:59:34', 39.11, 133.44),
(87, '2021-12-11 15:59:36', 38.4, 141.39),
(88, '2021-12-11 15:59:38', 63.74, 203.76),
(89, '2021-12-11 15:59:40', 49.56, 167.01),
(90, '2021-12-11 15:59:42', 56.21, 133.8),
(91, '2021-12-11 15:59:44', 54.03, 152.75),
(92, '2021-12-11 15:59:46', 59.17, 190.91),
(93, '2021-12-11 15:59:47', 58.96, 211.35),
(94, '2021-12-11 15:59:48', 45.54, 227.63),
(95, '2021-12-11 15:59:49', 51.03, 173.61),
(96, '2021-12-11 15:59:51', 56.3, 196.89),
(97, '2021-12-11 15:59:52', 31.44, 185.3),
(98, '2021-12-11 15:59:53', 42.93, 192.09),
(99, '2021-12-11 15:59:54', 44.84, 199.25),
(100, '2021-12-11 15:59:55', 59.5, 127.15),
(101, '2021-12-11 15:59:56', 58.96, 223.46),
(102, '2021-12-11 15:59:57', 34.32, 129.05),
(103, '2021-12-11 15:59:58', 48.52, 184.19),
(104, '2021-12-11 15:59:59', 41.64, 186.57),
(105, '2021-12-11 16:00:01', 41.81, 184.57),
(106, '2021-12-11 16:00:03', 53.53, 176.2),
(107, '2021-12-11 16:00:04', 56.05, 192.87),
(108, '2021-12-11 16:00:05', 60.68, 190.84),
(109, '2021-12-11 16:00:06', 46.24, 176.12),
(110, '2021-12-11 16:00:07', 54.89, 209.31),
(111, '2021-12-11 16:00:08', 37.58, 136.1),
(112, '2021-12-11 16:00:09', 38.75, 170.26),
(113, '2021-12-11 16:00:10', 41.47, 224.35),
(114, '2021-12-11 16:00:11', 49.29, 213.67),
(115, '2021-12-11 16:00:12', 41.86, 161.35),
(116, '2021-12-11 16:00:13', 46.73, 204.91),
(117, '2021-12-11 16:00:14', 50.59, 235.38),
(118, '2021-12-11 16:00:15', 46.11, 148.8),
(119, '2021-12-11 16:00:16', 45.57, 171.91),
(120, '2021-12-11 16:00:17', 39.18, 122.98),
(121, '2021-12-11 16:00:18', 56.02, 175.74),
(122, '2021-12-11 16:00:19', 43.28, 209.48),
(123, '2021-12-11 16:00:20', 56.22, 214.34),
(124, '2021-12-11 16:00:21', 40.44, 183.05),
(125, '2021-12-11 16:00:22', 59.92, 196.96),
(126, '2021-12-11 16:00:23', 62.12, 197.84),
(127, '2021-12-11 16:00:24', 50.16, 146.07),
(128, '2021-12-11 16:00:26', 58.97, 207.67),
(129, '2021-12-11 16:00:27', 33.45, 166.4),
(130, '2021-12-11 16:00:29', 46.63, 163.32),
(131, '2021-12-11 16:00:31', 54.09, 173.04),
(132, '2021-12-11 16:23:43', 42.2, 179.85),
(133, '2021-12-11 16:23:45', 56.87, 193.05),
(134, '2021-12-11 16:23:47', 51.3, 192.34),
(135, '2021-12-11 16:23:48', 55.63, 208.86),
(136, '2021-12-11 16:23:49', 37.7, 243.54),
(137, '2021-12-11 16:23:51', 38.61, 255.58),
(138, '2021-12-11 16:23:52', 45.62, 134.35),
(139, '2021-12-11 16:23:53', 54.64, 191.2),
(140, '2021-12-11 16:23:54', 70.9, 205.71),
(141, '2021-12-11 16:23:56', 33.96, 182.38),
(142, '2021-12-11 16:23:57', 59.4, 194.19),
(143, '2021-12-11 16:23:58', 52.35, 158.98),
(144, '2021-12-11 16:23:59', 47.07, 169.89),
(145, '2021-12-11 16:24:00', 58.2, 170.08),
(146, '2021-12-11 16:24:01', 63.85, 125.11),
(147, '2021-12-11 16:24:02', 50.12, 184.75),
(148, '2021-12-11 16:24:03', 39.74, 139.12),
(149, '2021-12-11 16:24:04', 61.02, 188.82),
(150, '2021-12-11 16:24:05', 69.19, 156.14),
(151, '2021-12-11 16:24:06', 58.64, 140.55),
(152, '2021-12-11 16:24:07', 41.64, 137.81),
(153, '2021-12-11 16:24:08', 48.54, 129.54),
(154, '2021-12-11 16:24:10', 53.26, 168.24),
(155, '2021-12-11 16:24:11', 53.64, 112.24),
(156, '2021-12-11 16:24:13', 57.22, 187.96),
(157, '2021-12-11 16:24:15', 51.3, 194.77),
(158, '2021-12-11 16:24:16', 47.32, 143.79),
(159, '2021-12-11 16:24:17', 61.07, 166.17),
(160, '2021-12-11 16:24:18', 51.13, 146.5),
(161, '2021-12-11 16:24:19', 48.8, 226.3),
(162, '2021-12-11 16:24:20', 54.01, 163.99),
(163, '2021-12-11 16:24:21', 58.93, 242.94),
(164, '2021-12-11 16:24:22', 43.63, 196.65),
(165, '2021-12-11 16:24:23', 48.27, 234.17),
(166, '2021-12-11 16:24:24', 52.76, 179.91),
(167, '2021-12-11 16:24:26', 44.42, 170.97),
(168, '2021-12-11 16:24:27', 46.73, 196.79),
(169, '2021-12-11 16:24:28', 55.41, 177.86),
(170, '2021-12-11 16:24:30', 60.64, 187.22),
(171, '2021-12-11 16:24:31', 64.69, 223.69),
(172, '2021-12-11 16:24:33', 44.08, 195.58),
(173, '2021-12-11 16:24:35', 57.83, 204.15),
(174, '2021-12-11 16:24:36', 58.13, 153.15),
(175, '2021-12-11 16:24:37', 50.63, 191.03),
(176, '2021-12-11 16:24:38', 59.47, 202.25),
(177, '2021-12-11 16:24:39', 56.3, 184.43),
(178, '2021-12-11 16:24:40', 45.93, 176.55),
(179, '2021-12-11 16:24:41', 52.3, 186.47),
(180, '2021-12-11 16:24:42', 40.1, 222.5),
(181, '2021-12-11 16:24:43', 47.5, 131.9),
(182, '2021-12-11 16:24:44', 42.2, 160.47),
(183, '2021-12-11 16:24:45', 43.62, 197.63),
(184, '2021-12-11 16:24:46', 45.75, 197.84),
(185, '2021-12-11 16:24:47', 49.01, 199.75),
(186, '2021-12-11 16:24:48', 57.61, 181.2),
(187, '2021-12-11 16:24:49', 52.5, 209.75),
(188, '2021-12-11 16:24:50', 44.02, 184.05),
(189, '2021-12-11 16:24:51', 45.6, 131.02),
(190, '2021-12-11 16:24:52', 50.18, 168.02),
(191, '2021-12-11 16:24:53', 51.7, 223.24),
(192, '2021-12-11 16:24:54', 42.86, 175.36),
(193, '2021-12-11 16:24:55', 42.18, 169.14),
(194, '2021-12-11 16:24:56', 35.54, 163.77),
(195, '2021-12-11 16:24:58', 46.63, 172.85),
(196, '2021-12-11 16:25:00', 61.48, 161.92),
(197, '2021-12-11 16:25:01', 46.88, 144.38),
(198, '2021-12-11 16:25:03', 63.45, 186.64),
(199, '2021-12-11 16:25:05', 55.34, 110.89),
(200, '2021-12-11 16:25:06', 40.92, 123.48),
(201, '2021-12-11 16:25:07', 45.6, 188.02),
(202, '2021-12-11 16:25:08', 50.72, 175.01),
(203, '2021-12-11 16:25:09', 34.75, 231.51),
(204, '2021-12-11 16:25:10', 37.66, 197.13),
(205, '2021-12-11 16:25:12', 65.36, 185.7),
(206, '2021-12-11 16:25:13', 56.35, 192.54),
(207, '2021-12-11 16:25:14', 47.36, 195.63),
(208, '2021-12-11 16:25:15', 45.35, 180.52),
(209, '2021-12-11 16:25:16', 50.29, 187.29),
(210, '2021-12-11 16:25:17', 57.85, 173.53),
(211, '2021-12-11 16:25:18', 39.89, 250.81),
(212, '2021-12-11 16:25:19', 64.98, 194.68),
(213, '2021-12-11 16:25:20', 57.04, 218.63),
(214, '2021-12-11 16:25:21', 55.61, 175.19),
(215, '2021-12-11 16:25:22', 51.9, 94.05),
(216, '2021-12-11 16:25:23', 36.31, 162.99),
(217, '2021-12-11 16:25:24', 48.74, 149.62),
(218, '2021-12-11 16:25:25', 50.02, 185.22),
(219, '2021-12-11 16:25:26', 50.38, 201.05),
(220, '2021-12-11 16:25:27', 63.75, 188.04),
(221, '2021-12-11 16:25:28', 59.67, 184.5),
(222, '2021-12-11 16:25:29', 35.56, 156.67),
(223, '2021-12-11 16:25:30', 38.36, 204.11),
(224, '2021-12-11 16:25:31', 48.43, 127.01),
(225, '2021-12-11 16:25:32', 60.39, 205.39),
(226, '2021-12-11 16:25:33', 56.34, 150.93),
(227, '2021-12-11 16:25:34', 44, 219.7),
(228, '2021-12-11 16:25:35', 61.62, 209.13),
(229, '2021-12-11 16:25:36', 54.22, 175.96),
(230, '2021-12-11 16:25:37', 64.55, 145.09);

-- --------------------------------------------------------

--
-- Table structure for table `tower`
--

CREATE TABLE `tower` (
  `id_tower` int(11) NOT NULL,
  `id_sensor` int(11) NOT NULL,
  `id_area` int(11) NOT NULL,
  `name_tower` varchar(100) NOT NULL,
  `height_tower` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `level_user` int(1) NOT NULL,
  `name_user` varchar(30) NOT NULL,
  `username_user` varchar(15) NOT NULL,
  `password_user` varchar(65) NOT NULL,
  `email_user` varchar(30) NOT NULL,
  `token_user` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id_area`);

--
-- Indexes for table `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`id_sensor`);

--
-- Indexes for table `tower`
--
ALTER TABLE `tower`
  ADD PRIMARY KEY (`id_tower`),
  ADD KEY `id_sensor` (`id_sensor`),
  ADD KEY `id_area` (`id_area`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sensor`
--
ALTER TABLE `sensor`
  MODIFY `id_sensor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT for table `tower`
--
ALTER TABLE `tower`
  MODIFY `id_tower` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tower`
--
ALTER TABLE `tower`
  ADD CONSTRAINT `tower_ibfk_1` FOREIGN KEY (`id_sensor`) REFERENCES `sensor` (`id_sensor`),
  ADD CONSTRAINT `tower_ibfk_2` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
