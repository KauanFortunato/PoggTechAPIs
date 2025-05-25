-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2025 at 12:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poggtech`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(255) NOT NULL DEFAULT 'ic_all_categories',
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `icon`, `description`, `created_at`) VALUES
(1, 'Consolas', 'ic_category_consoles', 'Consolas de todas as marcas.', '2024-11-23 21:49:49'),
(2, 'Jogos', 'ic_category_games', 'Videojogos', '2024-11-23 21:49:49'),
(3, 'Acessórios', 'ic_category_accessories', 'Dispositivos para usar com consolas.', '2024-11-23 21:49:49'),
(4, 'Colecionáveis', 'ic_category_collectables', 'Action figures, peluches, posters, etc.', '2025-05-08 12:43:42'),
(5, 'Retro Gaming', 'ic_category_retro', 'Consolas antigas (ex: NES, Mega Drive), cartuchos, etc.', '2025-05-08 12:44:50');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `chat_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`chat_id`, `product_id`, `timestamp`) VALUES
(23, 3, '2025-03-12 12:12:54'),
(24, 3, '2025-03-12 12:15:41'),
(25, 4, '2025-04-14 15:54:58'),
(26, 24, '2025-05-07 23:57:34');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `gallery_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`gallery_id`, `product_id`, `created_at`) VALUES
(5, 3, '2025-04-23 15:05:38'),
(6, 6, '2025-04-23 15:05:38'),
(7, 7, '2025-04-23 15:05:38'),
(8, 8, '2025-04-23 15:05:38'),
(9, 9, '2025-04-23 15:05:38'),
(10, 10, '2025-04-23 15:05:38'),
(11, 11, '2025-04-23 15:05:38'),
(12, 12, '2025-04-23 15:05:38'),
(13, 13, '2025-04-23 15:05:38'),
(14, 14, '2025-04-23 15:05:38'),
(15, 15, '2025-04-23 15:05:38'),
(16, 16, '2025-04-23 15:05:38'),
(17, 17, '2025-04-23 15:05:38'),
(18, 18, '2025-04-23 15:05:38'),
(19, 19, '2025-04-23 15:05:38'),
(20, 20, '2025-04-23 15:05:38'),
(21, 21, '2025-04-23 15:05:38'),
(22, 22, '2025-04-23 15:05:38'),
(23, 24, '2025-04-23 15:05:38'),
(24, 4, '2025-04-23 15:05:38'),
(25, 23, '2025-04-23 15:05:38'),
(26, 5, '2025-04-23 15:05:38'),
(42, 46, '2025-05-11 13:56:22');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`image_id`, `gallery_id`, `path`) VALUES
(50, 5, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_microsoft-xbox-series-x-frandroid-20828593.png'),
(51, 5, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_Xbox-Series-X-Test-1987881512.jpg'),
(52, 5, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_1603387292316-1_9szne9sb-4097509527.jpeg'),
(53, 24, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_Xbox-Free-Download-PNG-721582555.png'),
(54, 24, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_s-l1600-2392549085.jpg'),
(55, 24, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_microsoft-xbox-360-s-slim-500gb-console-kinect-40-sport-bundle-2660298083.jpg'),
(56, 26, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_S2DSAZUC_l.webp'),
(57, 26, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_81Rw0RTY7-L-3412856433.jpg'),
(58, 26, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_P1040543-1664434788.jpg'),
(59, 6, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_310047-grand-theft-auto-v-xbox-360-front-cover-3516295299.png'),
(60, 6, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_gta5+xbox+360-4013109471.jpg'),
(61, 6, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_maxresdefault-1674275056.jpg'),
(62, 7, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_045496463106_l.webp'),
(63, 7, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_maxresdefault-2961303710.jpg'),
(64, 8, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_045496470685_l.webp'),
(65, 8, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_thumb-1920-675017-3002037112.jpg'),
(66, 9, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_0711719894650_l.webp'),
(67, 9, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_controle-dualshock-4-playstation-4-branco-glacial-4283629037.jpg'),
(68, 9, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_Controle-PS4-branco-original-20211211203934.3013630015-2776290154.jpg'),
(69, 10, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_SPS3ACCMOVE_l.webp'),
(70, 10, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_219d14f79b-1992264298.jpg'),
(71, 10, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_m27033734871_1-648256890.jpg'),
(72, 11, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_S360KINSNXB_l.webp'),
(73, 11, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_81rcVeXg0eL._SL1500_-3398597712.jpg'),
(74, 12, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_4902370505559_l.webp'),
(75, 12, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_530-4256306619.jpg'),
(76, 12, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_nintendo-gamecube-indigo-controller-eu-front-1586193238-21-679705842.jpg'),
(77, 13, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_045496370008_l.webp'),
(78, 13, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_8bqpngw7mcy41-2363194276.jpg'),
(79, 14, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_SGCUGAMETS003_l.webp'),
(80, 14, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_Nintendo-Pack-GameCube-Tales-Of-Symphonia-4242111777.jpg'),
(81, 15, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_0454964NSL32BL01_l.webp'),
(82, 15, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_nintendoSwitchLiteBlue2.jpeg'),
(83, 15, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_nintendoSwitchLiteBlue1.jpeg'),
(84, 15, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_switch-lite-blue.original-228031678.jpg'),
(85, 15, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_nintendo-switch-lite-blue.large-2499490508.jpg'),
(86, 15, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_maxresdefault-4184497264.jpg'),
(87, 16, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_0454964NS64V3WH02_l.webp'),
(88, 16, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_analisis-nintendo-switch-oled-2508427-1487409988.jpg'),
(89, 16, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_switch-oled-box-1530977926.jpg'),
(90, 17, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_SNSWVAL08_l.webp'),
(91, 17, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_carga-juega-joy-conjpg-3958737233.jpg'),
(92, 18, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_45496430597_l.webp'),
(93, 18, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_91rnayc9sql-sl1500-11f07-4159512826.jpg'),
(94, 19, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_04549643PGRR_l.webp'),
(95, 20, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_SPSVNEG3GC_l.webp'),
(96, 20, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_pa.218733.10-2175641084.jpg'),
(97, 20, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_s-l1200-1441668164.jpg'),
(98, 20, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_71TJsL5wVqL._SL1500_-3134506695.jpg'),
(99, 21, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_3307210201669_l.jpg'),
(100, 21, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_maxresdefault-3827021646.jpg'),
(101, 22, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_4012927120088_l.webp'),
(102, 22, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_216719835-1908607705.jpg'),
(103, 23, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_SNINGBACAW002_l.webp'),
(104, 23, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_D_NQ_NP_960854-MLB73805607416_012024-O-3674319310.webp'),
(105, 23, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_D_NQ_NP_2X_665115-MLB25195695981_112016-F-1009604948.jpg'),
(106, 25, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_5030917027598_l.webp'),
(107, 25, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_s-l1600-426613892.jpg'),
(108, 42, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_6820ac864dcad6.85035500.jpg'),
(109, 42, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_6820ac864df164.74578465.jpg'),
(110, 42, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_6820ac864e1774.66367431.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id_message` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id_message`, `chat_id`, `sender_id`, `receiver_id`, `message`, `timestamp`, `is_read`) VALUES
(123, 23, 28, 15, 'Mordekai enviou', '2025-03-12 12:12:54', 1),
(124, 24, 26, 15, 'Kauan Sites aleatorios', '2025-03-12 12:15:41', 1),
(125, 23, 15, 28, 'Dono do produto', '2025-03-12 12:16:39', 1),
(127, 23, 28, 15, 'Broo', '2025-04-11 20:29:47', 1),
(128, 23, 28, 15, 'Broo', '2025-04-11 20:31:22', 1),
(129, 23, 28, 15, 'Broo', '2025-04-11 20:32:14', 1),
(130, 23, 28, 15, 'Broo', '2025-04-11 20:43:51', 1),
(131, 23, 28, 15, 'Broo', '2025-04-11 20:44:25', 1),
(132, 23, 28, 15, 'Broo', '2025-04-11 20:46:35', 1),
(133, 23, 28, 15, 'Sua mae ainda ta disponivel?', '2025-04-11 20:46:55', 1),
(134, 23, 28, 15, 'Sua mae ainda ta disponivel?', '2025-04-11 20:47:29', 1),
(135, 23, 28, 15, 'E ai?', '2025-04-11 20:49:09', 1),
(136, 23, 28, 15, 'E aiasdasdsa?', '2025-04-11 20:49:18', 1),
(137, 23, 28, 15, 'E ai mano?', '2025-04-12 13:42:33', 1),
(138, 23, 28, 15, 'E ai mano?', '2025-04-12 13:44:30', 1),
(139, 23, 28, 15, 'E ai mano?', '2025-04-12 13:44:47', 1),
(140, 23, 28, 15, 'E ai mano?', '2025-04-12 13:45:00', 1),
(141, 23, 28, 15, 'E ai mano?', '2025-04-12 13:48:14', 1),
(142, 23, 28, 15, 'E ai mano?', '2025-04-14 13:36:52', 1),
(143, 23, 28, 15, 'E ai mano?', '2025-04-14 14:05:40', 1),
(144, 24, 26, 15, 'E ai mano?', '2025-04-14 14:06:37', 1),
(145, 25, 15, 18, 'Oi, esse item está disponível?', '2025-04-14 15:54:58', 1),
(146, 25, 18, 15, 'Esta sim', '2025-04-14 15:56:45', 1),
(147, 25, 15, 18, 'Mas vc tem quantos anos bb?', '2025-04-14 15:57:34', 1),
(148, 24, 26, 15, 'E ai mano?', '2025-04-15 14:47:27', 1),
(149, 24, 26, 15, 'E ai mano?', '2025-04-15 14:47:40', 1),
(150, 24, 26, 15, 'E ai mano?', '2025-04-15 14:48:16', 1),
(151, 24, 26, 15, 'E ai mano?', '2025-04-15 14:49:23', 1),
(152, 24, 26, 15, 'E ai mano?', '2025-04-15 14:50:20', 1),
(153, 24, 26, 15, 'E ai mano?', '2025-04-15 14:51:58', 1),
(154, 24, 26, 15, 'E ai mano?', '2025-04-15 14:52:12', 1),
(155, 24, 26, 15, 'E ai mano?', '2025-04-15 14:53:26', 1),
(156, 24, 26, 15, 'E ai mano?', '2025-04-15 14:54:56', 1),
(157, 24, 26, 15, 'E ai mano?', '2025-04-15 14:55:26', 1),
(158, 24, 26, 15, 'E ai mano?', '2025-04-15 14:55:48', 1),
(159, 24, 26, 15, 'E ai mano?', '2025-04-15 14:56:33', 1),
(160, 24, 26, 15, 'E ai mano?', '2025-04-15 15:00:56', 1),
(161, 24, 26, 15, 'E ai mano?', '2025-04-15 15:02:37', 1),
(162, 24, 26, 15, 'E ai mano?', '2025-04-15 15:03:31', 1),
(163, 24, 26, 15, 'E ai mano?', '2025-04-15 15:04:58', 1),
(164, 24, 26, 15, 'E ai mano?', '2025-04-15 15:06:18', 1),
(165, 24, 26, 15, 'E ai mano?', '2025-04-15 15:07:47', 1),
(166, 24, 26, 15, 'E ai mano?', '2025-04-15 15:08:31', 1),
(167, 24, 26, 15, 'E ai mano?', '2025-04-15 15:09:18', 1),
(168, 24, 26, 15, 'E ai mano?', '2025-04-15 15:09:51', 1),
(169, 24, 26, 15, 'E ai mano?', '2025-04-15 15:15:55', 1),
(170, 24, 26, 15, 'E ai mano?', '2025-04-15 15:16:36', 1),
(171, 24, 26, 15, 'E ai mano?', '2025-04-15 15:24:20', 1),
(172, 24, 26, 15, 'E ai mano?', '2025-04-15 15:24:38', 1),
(173, 24, 26, 15, 'E ai mano?', '2025-04-15 15:25:25', 1),
(174, 24, 26, 15, 'E ai mano?', '2025-04-15 15:26:59', 1),
(175, 24, 26, 15, 'E ai mano?', '2025-04-15 15:29:45', 1),
(176, 24, 26, 15, 'E ai mano?', '2025-04-15 15:32:07', 1),
(177, 24, 26, 15, 'E ai mano?', '2025-04-15 16:16:53', 1),
(178, 24, 26, 15, 'E ai mano?', '2025-04-15 16:17:02', 1),
(179, 24, 26, 15, 'E ai mano?', '2025-04-15 16:19:44', 1),
(180, 24, 26, 15, 'E ai mano?', '2025-04-15 16:19:50', 1),
(181, 24, 26, 15, 'E ai mano?', '2025-04-15 16:19:56', 1),
(182, 24, 26, 15, 'E ai mano?', '2025-04-15 16:20:38', 1),
(183, 24, 26, 15, 'E ai mano?', '2025-04-15 16:20:45', 1),
(184, 24, 26, 15, 'E ai mano?', '2025-04-15 16:20:50', 1),
(185, 24, 26, 15, 'E ai mano?', '2025-04-15 16:22:17', 1),
(186, 24, 26, 15, 'E ai mano?', '2025-04-15 16:31:12', 1),
(187, 24, 26, 15, 'E ai mano?', '2025-04-15 16:55:56', 1),
(188, 24, 26, 15, 'E ai mano?', '2025-04-15 17:00:30', 1),
(189, 24, 26, 15, 'E ai mano?', '2025-04-15 17:01:12', 1),
(190, 24, 26, 15, 'E ai mano?', '2025-04-15 17:03:53', 1),
(191, 24, 26, 15, 'E ai mano?', '2025-04-15 17:03:57', 1),
(192, 26, 28, 15, 'Oi, esse item está disponível?', '2025-05-07 23:57:34', 0),
(193, 24, 26, 15, 'E ai mano?', '2025-05-09 14:37:31', 1),
(194, 26, 15, 28, 'E ai mano?', '2025-05-09 14:38:42', 1),
(195, 26, 15, 28, 'E ai mano?', '2025-05-09 14:38:45', 1),
(196, 26, 15, 28, 'E ai mano?', '2025-05-09 14:38:55', 1),
(197, 23, 15, 28, 'E ai mano?', '2025-05-09 14:39:24', 1),
(198, 24, 26, 15, 'E ai mano?', '2025-05-10 14:07:14', 0),
(199, 23, 15, 28, 'E ai mano?', '2025-05-10 14:08:46', 1),
(200, 23, 15, 28, 'E ai mano?', '2025-05-10 14:08:51', 1),
(201, 23, 15, 28, 'E ai mano?', '2025-05-10 14:08:54', 1),
(202, 23, 15, 28, 'E ai mano?', '2025-05-10 14:09:16', 1),
(203, 24, 26, 15, 'E ai mano?', '2025-05-11 13:35:57', 0),
(204, 23, 15, 28, 'E ai mano?', '2025-05-11 13:36:30', 1),
(205, 23, 15, 28, 'Vai querer o produto?', '2025-05-11 14:30:14', 1),
(206, 23, 15, 28, 'Vai querer o produto?', '2025-05-11 14:30:24', 1),
(207, 23, 15, 28, 'Vai querer o produto?', '2025-05-11 14:30:57', 1),
(208, 26, 28, 15, 'Oi, esse item está disponível?', '2025-05-11 14:36:17', 0),
(209, 23, 15, 28, 'Vai querer o produto?', '2025-05-11 18:01:10', 1),
(210, 23, 28, 15, 'Nigga', '2025-05-11 18:01:50', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','completed','failed') DEFAULT 'pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `price_before` decimal(10,2) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `cover` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `seller_type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `user_id`, `title`, `description`, `price`, `price_before`, `category`, `quantity`, `cover`, `location`, `created_at`, `updated_at`, `seller_type`) VALUES
(3, 15, 'Xbox Series X, 1tb, Preto', 'A nova série Xbox Jogue milhares de jogos em quatro gerações de console – todos os jogos têm uma ótima aparência e funcionam perfeitamente no Xbox Series\r\nExperimente velocidade e desempenho de próxima geração com Xbox Velocity Architecture, com SSD personalizado e software integrado\r\nJogue milhares de jogos de quatro gerações de Xbox com compatibilidade retroativa, incluindo títulos otimizados no lançamento\r\nO Xbox O Game Pass Ultimate inclui mais de 100 jogos de alta qualidade para consoles, PC, dispositivos móveis Android, multijogador online e uma assinatura do EA Play por um baixo preço mensal (assinatura vendida separadamente).\r\nUm Xbox Smart Delivery permite que você jogue a melhor versão do seu jogo, independentemente do console que você usa', 523.02, 590.23, 'Consolas', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_Xbox-Series-X-Test-1987881512.jpg', NULL, '2024-12-05 20:28:39', '2025-05-06 11:18:11', 'admin'),
(4, 18, 'Xbox 360', 'Console em bom estado', 110.98, 120.00, 'Consolas', 1, 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.pngall.com%2Fwp-content%2Fuploads%2F2016%2F07%2FXbox-Free-Download-PNG.png&f=1&nofb=1&ipt=f1e2015ce576a3b63e40ab904d61db31b73a96df9fd250d40612ce6475e4f112&ipo=images', NULL, '2025-01-09 18:40:07', '2025-02-21 19:12:21', 'admin'),
(5, 19, '2DS Azul/Preto', 'O Nintendo 2DS mantém muitas das mesmas características de hardware como o Nintendo DS 3 incluindo o mesmo Nintendo 3DS gameplay controla, ao contrário de compatibilidade com a vasta biblioteca existente de jogos de Nintendo DS, bem como recursos de conectividade sem fio, como acesso a Nintendo eShop, além de funcionalidade StreetPass e o SpotPass.', 85.00, 122.00, 'Retro Gaming', 1, 'https://pt.static.webuy.com/product_images/Jogos/3DS%20Consolas/S2DSAZUC_l.jpg', NULL, '2025-01-09 18:59:43', '2025-05-08 13:51:53', 'user'),
(6, 15, 'Grand Theft Auto V (5) 2 discos', 'Los Santos - uma alastrando sun-soaked metrópole cheio de self-help gurus, starlets, e desvanecimento celebridades, inveja do ocidental mundo, agora struggling para stay afloat em uma era de econômica incerteza e barato reality TV.\r\n\r\nAmidst o turmoil, três muito diferentes criminosos enredo suas próprias chances de sobrevivência e sucesso: Franklin, antiga rua gângster, agora procurando real oportunidades e grave dinheiro; Michael, um profissional ex-con aposentadoria é um muito menos do que ele esperança isso Seria e Trevor, um maníaco violento dirigido pela próxima grande pontuação. Ficando sem opções, a tripulação arrisca tudo em uma série de assaltos ousados e perigosas que podem defini-las pelo resto da vida.\r\n\r\nO maior, mais dinâmica e mais diversas abrir mundo jamais criado, Grand Theft Auto V combina narrativa e jogabilidade em novas formas, como jogadores repetidamente saltar dentro e fora da vida dos três personagens de chumbo do jogo, jogando todos os lados da história do jogo entrelaçadas.\r\n\r\nTodas as características clássicas da inovadora série de retorno, incluindo a incrível atenção ao detalhe e Grand Theft Auto sombriamente humorístico leve na cultura moderna, ao lado de uma abordagem nova e ambiciosa para abrir o mundo multiplayer.', 15.00, 20.00, 'Jogos', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_310047-grand-theft-auto-v-xbox-360-front-cover-3516295299.png', NULL, '2025-01-09 18:59:43', '2025-04-29 16:52:41', 'admin'),
(7, 15, 'New Super Mario Bros 2ds', 'New Super Mario Bros características enorme vívida 2D mundos inspiraram por aqueles das aventuras de Mario clássicas, mas combinado com lindamente prestados personagens 3D que quase parecem saltar para fora da tela. Cada mundo tem um tema diferente e apresenta vários níveis, que devem ser concluídos antes de avançar para o próximo. Os jogadores também devem dominar mini fortaleza do mundo cada e bater um personagem chefe antes que podem progredir para o próximo mundo. Só depois de derrotar todos os chefes um personagem será pronto para enfrentar o derradeiro desafio do Bowser ele mesmo.', 23.00, 28.00, 'Jogos', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_045496463106_l.webp', NULL, '2025-01-11 23:26:18', '2025-04-29 16:56:31', 'admin'),
(8, 15, 'Inazuma Eleven', 'Sequências de anime cativante enriquecem o enredo nesta aventura e os jogadores são capazes de explorar a cidade no jogo para procurar potenciais companheiros de equipe. Existem mais de 1000 personagens no jogo que você pode explorar, cada um com suas próprias estatísticas, habilidades únicas e habilidades especiais.', 18.00, 20.00, 'Jogos', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_045496470685_l.webp', NULL, '2025-01-11 23:26:18', '2025-04-29 16:58:55', 'admin'),
(9, 15, 'PS4 Official DualShock 4 Branco Controller (V2)', NULL, 54.92, 55.92, 'Acessórios', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_0711719894650_l.webp', NULL, '2025-01-11 23:29:49', '2025-04-29 17:04:03', 'user'),
(10, 15, 'Playstation Move Motion Controller V1 (CECH-ZCM 1) (PS3/PS4)', 'PlayStation Move redefine os jogos de movimento com experiência de jogo mais envolvente e realista só é possível no sistema PlayStation3. O controlador simples, fácil de usar captura uma gama completa de movimento, dando-lhe controle final sobre como você joga o jogo. Com uma variada selecção de jogos e os novos lançamento todo o tempo, pode desfrutar de horas de diversão com amigos e família.', 11.32, 12.32, 'Acessórios', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_SPS3ACCMOVE_l.webp', NULL, '2025-01-11 23:29:49', '2025-04-29 17:07:23', 'admin'),
(11, 15, 'Xbox 360 Kinect (Sem FA)', NULL, 10.00, NULL, 'Acessórios', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_S360KINSNXB_l.webp', NULL, '2025-01-11 23:29:49', '2025-04-29 21:39:35', 'admin'),
(12, 15, 'Oficial Gamecube Indigo Controller', NULL, 48.99, 71.99, 'Colecionáveis', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_4902370505559_l.webp', NULL, '2025-01-11 23:31:19', '2025-05-08 13:53:12', 'admin'),
(13, 15, 'Gamecube, Indigo (Sem Jogo), Sem Caixa', 'Um olhar para o hardware do Nintendo Game Cube e você sabe que é diferente.\r\n\r\nA forma compacta não é apenas prática, que o projeto original é um símbolo do compromisso da Nintendo para se concentrar na criação de jogos de vídeo mais original e inovador do mundo.', 150.00, NULL, 'Colecionáveis', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_045496370008_l.webp', NULL, '2025-01-11 23:31:19', '2025-05-08 13:53:18', 'admin'),
(14, 15, 'Gamecube, Tales of Symphonia L.E + G.B Player,(Sem Jogo)\n', NULL, 225.00, 250.00, 'Retro Gaming', 1, 'https://pt.static.webuy.com/product_images/Jogos/GameCube%20Consolas/SGCUGAMETS003_l.jpg', NULL, '2025-01-11 23:44:12', '2025-05-08 13:52:24', 'admin'),
(15, 15, 'Nintendo Switch Lite Consola, 32GB Azul, Caixa', NULL, 165.00, 180.00, 'Consolas', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_0454964NSL32BL01_l.webp', NULL, '2025-01-11 23:44:12', '2025-04-29 21:12:52', 'admin'),
(16, 15, 'Switch Consola, 64GB OLED + Branca Joy-Con', NULL, 265.00, NULL, 'Consolas', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_0454964NS64V3WH02_l.webp', NULL, '2025-01-11 23:44:12', '2025-04-29 21:15:26', 'admin'),
(17, 15, 'Generico 3rd Party Joy-Con Comfort Grip', '', 15.00, NULL, 'Acessórios', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_SNSWVAL08_l.webp', NULL, '2025-01-11 23:44:12', '2025-04-29 21:17:07', 'admin'),
(18, 15, 'Official Nintendo Switch Preto Carry Case', NULL, 8.00, NULL, 'Acessórios', 10, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_45496430597_l.webp', NULL, '2025-01-11 23:44:12', '2025-05-23 11:32:27', 'admin'),
(19, 15, 'Nintendo Switch Joy-Con Direito Verde Pastel, Sem Correia', NULL, 42.00, NULL, 'Acessórios', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_04549643PGRR_l.webp', NULL, '2025-01-11 23:44:12', '2025-04-29 21:20:45', 'admin'),
(20, 15, 'PS Vita Preto 3G, Descontada', NULL, 140.00, 155.00, 'Retro Gaming', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_SPSVNEG3GC_l.webp', NULL, '2025-01-11 23:44:12', '2025-05-08 13:52:49', 'admin'),
(21, 15, 'King Kong pc game', NULL, 1.50, NULL, 'Jogos', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_3307210201669_l.jpg', NULL, '2025-01-11 23:44:12', '2025-04-29 21:25:26', 'admin'),
(22, 15, 'Pro Evolution Soccer 6', 'PES6 para o PS2 é quase idênticos à versão 360 magistral: jogável através do éter, graças à compatibilidade jogar Net e PSP-para-PSP, mas com Visual de sempre-assim-ligeiramente degradada. Não importa. Pro Evolution tem sido sempre a jogabilidade e 6 tem isso tudo e muito mais. Esta vez ao redor, o sistema de disparo foi refinado. Os jogadores são capazes de assumir um pop de gol mais instintivamente do que da última vez para fora, e voleios e metade-voleios tiveram um re-vamp também. Fintas, ao contrário, dribles e reter a posse após um tackle de slide são também novos recursos para 2006. As coisas podem ficar mais físicas no PES6, com defensores fechando os atacantes muito mais em evidência, defensiva de bloqueio (legal ou ilegal) e esperto novo se transforma para os jogadores mais altamente cotados no jogo. Essas coisas levam tempo para aprender, mas é muito divertido ficar lá.', 2.00, NULL, 'Jogos', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_4012927120088_l.webp', NULL, '2025-01-11 23:44:12', '2025-04-29 21:26:50', 'admin'),
(23, 18, 'Spider-Man 2', 'Desta vez lá é onde que você não pode ir.\n\nDois anos se passaram desde que Peter Parker primeiro hit nas ruas de Nova York como o combatente do crime em conflito Spider-Man. Agora ele encontra-se lutando contra seu vilão mais diabólico, no entanto, a mecanizada, vários tentáculos Doc Ock. O Nefasto Doc Ock foi Dr. Otto Octavius, um brilhante físico nuclear. Mas um acidente transformou-o de um pesquisador tímido para criminosos insano megalomaníaco que culpa Spider-Man para sua transformação horrível. Agora o cientista Peter uma vez idolatrado por seu notável intelecto marcou nosso lançador-web para a morte.', 6.00, NULL, 'Jogos', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_5030917027598_l.webp', NULL, '2025-01-11 23:44:12', '2025-04-29 21:32:44', 'user'),
(24, 15, 'Gameboy Advance, Branco', NULL, 90.00, 100.00, 'Retro Gaming', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_SNINGBACAW002_l.webp', NULL, '2025-02-19 00:10:21', '2025-05-08 13:52:56', 'user'),
(46, 28, 'tralalero tralala', 'xghxhxhxhxhxhxhxxxbxbhxhxhxdtdygdgdgdgdgg', 25.00, NULL, 'Colecionáveis', 1, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_6820ac864dcad6.85035500.jpg', 'Rua de Santa Catarina, Porto, Portugal', '2025-05-11 13:56:22', '2025-05-11 13:56:22', 'user');

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `create_gallery_afeter_product` AFTER INSERT ON `products` FOR EACH ROW BEGIN
    INSERT INTO gallery (product_id) VALUES (NEW.product_id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_price_before` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN
  IF NEW.price < OLD.price THEN
    SET NEW.price_before = OLD.price;
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `products_views`
--

CREATE TABLE `products_views` (
  `product_id` int(11) NOT NULL,
  `view_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_views`
--

INSERT INTO `products_views` (`product_id`, `view_count`) VALUES
(3, 68),
(4, 109),
(5, 29),
(6, 41),
(7, 19),
(8, 14),
(9, 12),
(10, 23),
(11, 15),
(12, 73),
(13, 26),
(14, 22),
(15, 76),
(16, 26),
(17, 23),
(18, 66),
(19, 22),
(20, 9),
(21, 15),
(22, 16),
(23, 10),
(24, 56),
(46, 16);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `reviewer_id` int(11) NOT NULL,
  `reviewed_user_id` int(11) NOT NULL,
  `rating` tinyint(5) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `reviewer_id`, `reviewed_user_id`, `rating`, `comment`, `created_at`) VALUES
(3, 15, 18, 2, 'Muito ruim esse vendedor.', '2024-12-08 01:32:38');

-- --------------------------------------------------------

--
-- Table structure for table `saved`
--

CREATE TABLE `saved` (
  `saved_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tipo` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `saved`
--

INSERT INTO `saved` (`saved_id`, `user_id`, `product_id`, `tipo`, `quantity`, `created_at`) VALUES
(203, 28, 18, 0, 3, '2025-05-23 17:15:30'),
(234, 28, 4, 0, 1, '2025-05-23 14:55:25'),
(260, 28, 19, 0, 1, '2025-05-23 17:39:03'),
(261, 28, 18, 1, 1, '2025-05-23 17:50:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `firebase_uid` varchar(128) NOT NULL,
  `name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `firebase_uid`, `name`, `last_name`, `email`, `phone`, `created_at`) VALUES
(15, 'bCXhKqZvrYTAZm867tMzpyNWWz33', 'Kauan', 'Fortunato', 'kauanmatiasfortunato@gmail.com', '910937520', '2024-11-27 20:52:50'),
(18, 'A2YOrJ9js0ZUcec9r9EW9o4kXEZ2', 'Diogo', 'Dioguinho', 'sayodiggo@gmail.com', '', '2024-12-02 00:17:17'),
(19, 'gO3K6796eQTMiVgss8MTarijpCg1', 'Rodrigo', 'Alexandre', 'rodrigoalexandre@gmail.com', '', '2024-12-06 22:35:17'),
(20, 'sC0UoxF2GwNtSiF2dWTo9UTFxN22', 'Bitman', 'Biman', 'bitman@gmail.com', '', '2024-12-06 23:42:22'),
(21, 'dbfjtKdnmdPpYoA5WfIOqbr3KOD3', 'Joao', 'Santos', 'joaosantos@gmail.com', '', '2024-12-09 18:02:46'),
(22, '0pFZo8kGEGgrBs780ERuVTQ94CA2', 'santos', 'fortunato', 'santosfortunato@gmail.com', '', '2024-12-09 18:08:58'),
(23, '55CpNAK9azXHrAS5rUYzxAakmvz1', 'Maria', 'Santos', 'maria@gmail.com', '', '2024-12-10 19:09:25'),
(25, 'QFTTiIROtzLbSR0GpAslYStGYwD2', 'Diogo', 'Esteves', 'diogadaesteves@gmail.com', '', '2025-02-07 03:25:13'),
(26, 'bw116RwG62h3Ugfh9cMBaMHfl2o1', 'Kauan', 'Sites Aleatorios', 'kauansitesaleatorios@gmail.com', '123 999 233', '2025-02-26 20:31:28'),
(27, 'B0etnmMLDJh4pUuF4vc9QCXMyiv2', 'bor', 'Bro', 'cuzinhoroxo@gmail.com', '', '2025-02-26 20:39:15'),
(28, '6P6mwx4gURUuk4CDPda8zQbcB1q1', 'Mordekai', 'AS', 'mordekaias360@gmail.com', '123 XXX XXX', '2025-03-10 17:49:41');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `trg_create_wallet_after_user_insert` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO wallet (user_id, balance)
    VALUES (NEW.user_id, 0.00);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users_tokens`
--

CREATE TABLE `users_tokens` (
  `id_token` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_tokens`
--

INSERT INTO `users_tokens` (`id_token`, `user_id`, `token`, `create_at`) VALUES
(16, 15, 'cfqdAvsOTqurJQWIaM3Efe:APA91bGozKvoQ-OnoMCawcnIxnUJlhJJ-99KxuaQSgyAS-WZOLo10-kcR8tR3yeJHfyWoEtfTYdiVsn8IeI_67_5jn6zWOhl2bFxSUrwbRNXO7G7LPsZrqI', '2025-04-14 15:58:39'),
(32, 28, 'eg9zGf7ESXesfzacTf2xMh:APA91bGguHAI1OUyeyMvpbbTPxlcHjKTGy98gA8p5ICsVxLIGhQCIRDy9PuY8u11RiF8kr-Oxuc9ZrkL9pb91nswS2v7rD1QjzKq03pFNQ0S0ahcrlRDy4Y', '2025-05-10 14:16:06');

-- --------------------------------------------------------

--
-- Table structure for table `user_history`
--

CREATE TABLE `user_history` (
  `user_history_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `action` enum('view','buy','fav','search') NOT NULL DEFAULT 'view',
  `accessed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_history`
--

INSERT INTO `user_history` (`user_history_id`, `user_id`, `product_id`, `action`, `accessed_at`) VALUES
(1, 15, 4, 'view', '2025-02-22 19:32:31'),
(2, 15, 4, 'view', '2025-02-22 19:33:04'),
(3, 15, 24, 'view', '2025-02-22 20:22:37'),
(4, 15, 24, 'view', '2025-02-22 20:31:09'),
(5, 15, 24, 'view', '2025-02-22 21:21:30'),
(6, 15, 23, 'view', '2025-02-22 21:21:31'),
(7, 15, 23, 'view', '2025-02-22 21:21:32'),
(8, 15, 22, 'view', '2025-02-22 21:21:34'),
(9, 15, 22, 'view', '2025-02-22 21:21:36'),
(10, 15, 21, 'view', '2025-02-22 21:21:39'),
(11, 15, 18, 'view', '2025-02-22 21:21:41'),
(12, 15, 16, 'view', '2025-02-22 21:21:44'),
(13, 15, 16, 'view', '2025-02-22 21:21:46'),
(14, 15, 4, 'view', '2025-02-22 22:12:58'),
(15, 15, 4, 'view', '2025-02-22 22:13:11'),
(16, 15, 4, 'view', '2025-02-22 22:13:13'),
(17, 15, 4, 'view', '2025-02-22 22:13:15'),
(18, 15, 22, 'view', '2025-02-22 22:14:22'),
(19, 15, 15, 'view', '2025-02-22 22:21:31'),
(20, 15, 16, 'view', '2025-02-22 23:11:33'),
(21, 15, 13, 'view', '2025-02-22 23:11:41'),
(22, 15, 16, 'view', '2025-02-22 23:11:45'),
(23, 15, 24, 'view', '2025-02-22 23:11:47'),
(24, 15, 24, 'view', '2025-02-22 23:11:48'),
(25, 15, 24, 'view', '2025-02-22 23:11:50'),
(26, 15, 20, 'view', '2025-02-22 23:11:52'),
(27, 15, 16, 'view', '2025-02-22 23:11:53'),
(28, 15, 3, 'view', '2025-02-22 23:11:54'),
(29, 15, 21, 'view', '2025-02-22 23:22:55'),
(30, 15, 24, 'view', '2025-02-22 23:34:29'),
(31, 15, 16, 'view', '2025-02-22 23:54:32'),
(32, 15, 24, 'view', '2025-02-23 00:03:03'),
(33, 15, 4, 'view', '2025-02-23 00:03:09'),
(34, 15, 24, 'view', '2025-02-23 00:38:20'),
(35, 15, 3, 'view', '2025-02-23 00:38:22'),
(36, 15, 13, 'view', '2025-02-23 00:38:25'),
(37, 15, 17, 'view', '2025-02-23 00:38:27'),
(38, 15, 16, 'view', '2025-02-23 00:38:29'),
(39, 15, 22, 'view', '2025-02-23 00:38:36'),
(40, 15, 21, 'view', '2025-02-23 00:38:38'),
(41, 15, 23, 'view', '2025-02-23 00:38:41'),
(42, 15, 17, 'view', '2025-02-23 00:43:51'),
(43, 15, 3, 'view', '2025-02-23 00:43:54'),
(44, 15, 17, 'view', '2025-02-23 00:44:07'),
(45, 15, 17, 'view', '2025-02-23 00:44:07'),
(46, 15, 19, 'view', '2025-02-23 00:55:37'),
(47, 15, 15, 'view', '2025-02-23 00:55:40'),
(48, 15, 13, 'view', '2025-02-23 00:55:43'),
(49, 15, 6, 'view', '2025-02-23 00:55:46'),
(50, 15, 6, 'view', '2025-02-23 00:55:48'),
(51, 15, 3, 'view', '2025-02-23 00:55:52'),
(52, 15, 4, 'view', '2025-02-23 00:55:56'),
(53, 15, 21, 'view', '2025-02-23 01:26:08'),
(54, 15, 19, 'view', '2025-02-23 01:26:10'),
(55, 15, 6, 'view', '2025-02-24 13:35:36'),
(56, 15, 6, 'view', '2025-02-24 13:42:28'),
(57, 15, 6, 'view', '2025-02-24 13:44:48'),
(58, 15, 6, 'view', '2025-02-24 13:44:51'),
(59, 15, 6, 'view', '2025-02-24 13:44:59'),
(60, 15, 12, 'view', '2025-02-24 13:45:07'),
(61, 15, 13, 'view', '2025-02-24 13:45:10'),
(62, 15, 4, 'view', '2025-02-24 13:45:13'),
(63, 15, 12, 'view', '2025-02-24 14:36:01'),
(64, 15, 6, 'view', '2025-02-24 14:36:04'),
(65, 15, 19, 'view', '2025-02-24 14:36:07'),
(66, 15, 3, 'view', '2025-02-24 14:36:11'),
(67, 15, 17, 'view', '2025-02-24 14:36:13'),
(68, 15, 17, 'view', '2025-02-24 14:36:16'),
(69, 15, 7, 'view', '2025-02-24 14:36:17'),
(70, 15, 21, 'view', '2025-02-24 14:36:19'),
(71, 15, 5, 'view', '2025-02-24 14:36:21'),
(72, 15, 6, 'view', '2025-02-24 14:36:25'),
(73, 27, 22, 'view', '2025-02-26 21:00:50'),
(74, 27, 23, 'view', '2025-02-26 21:04:07'),
(75, 27, 7, 'view', '2025-02-26 21:04:11'),
(76, 27, 22, 'view', '2025-02-26 21:04:13'),
(77, 27, 4, 'view', '2025-02-26 21:04:16'),
(78, 15, 21, 'view', '2025-02-28 12:41:03'),
(79, 15, 5, 'view', '2025-02-28 12:41:06'),
(80, 15, 7, 'view', '2025-02-28 12:41:12'),
(81, 15, 5, 'view', '2025-02-28 12:42:07'),
(82, 15, 5, 'view', '2025-03-01 16:45:00'),
(83, 15, 5, 'view', '2025-03-01 16:45:02'),
(84, 15, 5, 'view', '2025-03-01 16:56:40'),
(85, 15, 15, 'view', '2025-03-01 16:56:42'),
(86, 15, 7, 'view', '2025-03-01 16:56:44'),
(87, 15, 14, 'view', '2025-03-01 17:04:38'),
(88, 15, 5, 'view', '2025-03-01 17:04:40'),
(89, 15, 13, 'view', '2025-03-01 17:05:17'),
(90, 15, 14, 'view', '2025-03-01 17:05:18'),
(91, 15, 12, 'view', '2025-03-01 17:05:33'),
(92, 15, 6, 'view', '2025-03-01 17:05:36'),
(93, 15, 14, 'view', '2025-03-01 17:05:40'),
(94, 15, 14, 'view', '2025-03-01 17:12:28'),
(95, 15, 14, 'view', '2025-03-01 17:13:30'),
(96, 15, 14, 'view', '2025-03-01 17:14:01'),
(97, 15, 14, 'view', '2025-03-01 17:14:30'),
(98, 15, 14, 'view', '2025-03-01 17:14:33'),
(99, 15, 14, 'view', '2025-03-01 20:50:25'),
(100, 15, 3, 'view', '2025-03-03 14:35:02'),
(101, 15, 8, 'view', '2025-03-03 14:35:05'),
(102, 15, 14, 'view', '2025-03-03 14:35:09'),
(103, 15, 6, 'view', '2025-03-03 14:35:13'),
(104, 15, 5, 'view', '2025-03-03 14:35:16'),
(105, 15, 7, 'view', '2025-03-03 14:35:20'),
(106, 15, 13, 'view', '2025-03-03 14:35:22'),
(107, 15, 7, 'view', '2025-03-03 14:36:13'),
(108, 15, 22, 'view', '2025-03-03 14:36:16'),
(109, 15, 7, 'view', '2025-03-03 14:37:26'),
(110, 15, 8, 'view', '2025-03-03 14:37:42'),
(111, 15, 12, 'view', '2025-03-03 14:37:45'),
(112, 15, 16, 'view', '2025-03-03 14:37:47'),
(113, 15, 22, 'view', '2025-03-03 14:37:48'),
(114, 15, 17, 'view', '2025-03-03 14:39:04'),
(115, 15, 19, 'view', '2025-03-03 14:39:06'),
(116, 15, 24, 'view', '2025-03-03 14:39:08'),
(117, 15, 15, 'view', '2025-03-03 14:39:11'),
(118, 15, 18, 'view', '2025-03-03 14:39:14'),
(119, 15, 24, 'view', '2025-03-03 14:39:32'),
(120, 15, 6, 'view', '2025-03-03 14:44:07'),
(121, 15, 13, 'view', '2025-03-03 14:44:10'),
(122, 15, 24, 'view', '2025-03-03 14:44:12'),
(123, 15, 14, 'view', '2025-03-03 14:45:36'),
(124, 15, 22, 'view', '2025-03-03 14:57:22'),
(125, 15, 8, 'view', '2025-03-03 15:16:26'),
(126, 15, 8, 'view', '2025-03-03 15:22:08'),
(127, 15, 14, 'view', '2025-03-03 15:22:10'),
(128, 15, 20, 'view', '2025-03-03 19:14:56'),
(129, 15, 13, 'view', '2025-03-03 19:15:09'),
(130, 15, 5, 'view', '2025-03-03 19:16:36'),
(131, 15, 11, 'view', '2025-03-03 19:17:32'),
(132, 15, 11, 'view', '2025-03-03 19:17:41'),
(133, 15, 23, 'view', '2025-03-03 19:17:45'),
(134, 26, 5, 'view', '2025-03-03 19:20:46'),
(135, 26, 3, 'view', '2025-03-03 19:21:09'),
(136, 15, 7, 'view', '2025-03-03 19:24:03'),
(137, 15, 11, 'view', '2025-03-05 09:20:52'),
(138, 15, 15, 'view', '2025-03-05 09:21:28'),
(139, 15, 22, 'view', '2025-03-05 09:21:31'),
(140, 15, 15, 'view', '2025-03-05 09:21:32'),
(141, 15, 7, 'view', '2025-03-05 09:21:34'),
(142, 15, 19, 'view', '2025-03-05 09:21:36'),
(143, 15, 9, 'view', '2025-03-05 09:21:37'),
(144, 15, 16, 'view', '2025-03-05 09:21:45'),
(145, 15, 14, 'view', '2025-03-05 13:10:57'),
(146, 15, 17, 'view', '2025-03-05 13:11:02'),
(147, 15, 17, 'view', '2025-03-05 13:11:04'),
(148, 15, 9, 'view', '2025-03-05 13:11:06'),
(149, 15, 11, 'view', '2025-03-05 13:11:08'),
(150, 15, 24, 'view', '2025-03-05 15:08:06'),
(151, 15, 9, 'view', '2025-03-06 18:05:20'),
(152, 26, 13, 'view', '2025-03-07 11:11:43'),
(153, 26, 5, 'view', '2025-03-07 11:11:53'),
(154, 26, 4, 'view', '2025-03-07 11:12:29'),
(155, 26, 4, 'view', '2025-03-08 14:52:02'),
(156, 26, 14, 'view', '2025-03-08 14:52:08'),
(157, 26, 14, 'view', '2025-03-08 14:52:16'),
(158, 26, 4, 'view', '2025-03-10 17:10:47'),
(159, 26, 14, 'view', '2025-03-10 17:28:00'),
(160, 26, 15, 'view', '2025-03-10 17:44:06'),
(180, 26, 15, 'view', '2025-03-10 17:53:24'),
(181, 28, 11, 'view', '2025-03-10 17:53:41'),
(182, 28, 10, 'view', '2025-03-10 17:53:45'),
(183, 28, 10, 'view', '2025-03-10 17:55:35'),
(184, 28, 12, 'view', '2025-03-10 17:56:12'),
(185, 28, 10, 'view', '2025-03-10 17:58:48'),
(186, 28, 19, 'view', '2025-03-10 17:59:19'),
(187, 15, 18, 'view', '2025-03-10 17:59:57'),
(188, 15, 6, 'view', '2025-03-10 18:00:04'),
(189, 15, 16, 'view', '2025-03-10 18:00:12'),
(190, 15, 5, 'view', '2025-03-10 18:00:30'),
(191, 15, 10, 'view', '2025-03-10 18:00:44'),
(192, 15, 10, 'view', '2025-03-10 18:00:53'),
(193, 15, 24, 'view', '2025-03-10 18:01:14'),
(194, 15, 5, 'view', '2025-03-10 18:01:27'),
(195, 15, 14, 'view', '2025-03-10 18:01:37'),
(196, 15, 4, 'view', '2025-03-10 18:02:02'),
(197, 15, 17, 'view', '2025-03-10 18:02:21'),
(198, 15, 9, 'view', '2025-03-10 18:03:12'),
(199, 15, 16, 'view', '2025-03-10 18:03:27'),
(200, 15, 14, 'view', '2025-03-10 18:04:02'),
(201, 15, 4, 'view', '2025-03-10 18:04:48'),
(202, 15, 17, 'view', '2025-03-10 18:05:22'),
(203, 15, 6, 'view', '2025-03-10 18:05:36'),
(204, 15, 3, 'view', '2025-03-10 18:05:47'),
(205, 15, 4, '', '2025-03-10 18:08:27'),
(206, 15, 4, '', '2025-03-10 18:09:17'),
(207, 15, 4, '', '2025-03-10 18:11:32'),
(208, 15, 13, 'view', '2025-03-10 18:12:21'),
(209, 15, 21, 'view', '2025-03-10 18:12:49'),
(210, 15, 19, 'view', '2025-03-10 18:15:52'),
(211, 15, 14, 'view', '2025-03-10 18:16:01'),
(212, 15, 5, 'view', '2025-03-10 18:16:39'),
(213, 15, 4, 'view', '2025-03-10 18:19:00'),
(214, 15, 23, 'view', '2025-03-10 18:19:40'),
(215, 15, 7, 'view', '2025-03-10 18:20:30'),
(216, 15, 24, 'view', '2025-03-10 18:21:30'),
(217, 15, 24, 'view', '2025-03-10 18:21:32'),
(218, 15, 21, 'view', '2025-03-10 18:23:40'),
(219, 15, 15, 'view', '2025-03-10 18:25:08'),
(220, 28, 4, 'view', '2025-03-10 18:27:03'),
(221, 28, 4, 'view', '2025-03-10 18:28:34'),
(222, 28, 4, 'view', '2025-03-10 18:28:41'),
(223, 28, 19, 'view', '2025-03-10 18:29:26'),
(224, 28, 3, 'view', '2025-03-10 18:29:43'),
(225, 15, 8, 'view', '2025-03-10 18:32:08'),
(226, 15, 4, 'view', '2025-03-10 18:33:02'),
(227, 15, 4, 'view', '2025-03-10 18:33:14'),
(228, 15, 8, 'view', '2025-03-10 18:33:21'),
(229, 15, 4, 'view', '2025-03-10 18:33:31'),
(230, 15, 3, 'view', '2025-03-10 18:35:23'),
(231, 28, 3, 'view', '2025-03-12 12:12:30'),
(232, 26, 3, 'view', '2025-03-12 12:15:12'),
(233, 15, 3, 'view', '2025-03-31 13:07:28'),
(234, 15, 24, 'view', '2025-04-02 13:04:48'),
(235, 15, 6, 'view', '2025-04-02 13:08:36'),
(236, 15, 17, 'view', '2025-04-03 13:10:33'),
(237, 15, 5, 'view', '2025-04-03 17:39:05'),
(238, 15, 22, 'view', '2025-04-03 17:39:12'),
(239, 15, 13, 'view', '2025-04-03 17:40:08'),
(240, 15, 24, 'view', '2025-04-03 17:41:03'),
(241, 15, 24, 'view', '2025-04-03 17:41:05'),
(242, 15, 3, 'view', '2025-04-05 15:53:31'),
(243, 15, 18, 'view', '2025-04-05 16:03:38'),
(244, 15, 18, 'view', '2025-04-05 16:03:44'),
(245, 15, 18, 'view', '2025-04-05 16:07:16'),
(246, 15, 17, 'view', '2025-04-05 16:07:20'),
(247, 15, 18, 'view', '2025-04-05 16:08:14'),
(248, 15, 18, 'view', '2025-04-05 16:08:47'),
(249, 15, 18, 'view', '2025-04-05 16:09:16'),
(250, 15, 18, 'view', '2025-04-05 16:09:35'),
(251, 15, 18, 'view', '2025-04-05 16:12:25'),
(252, 15, 17, 'view', '2025-04-05 16:12:30'),
(253, 15, 18, 'view', '2025-04-05 16:12:35'),
(254, 15, 18, 'view', '2025-04-05 16:13:27'),
(255, 15, 18, 'view', '2025-04-05 16:13:33'),
(256, 15, 18, 'view', '2025-04-05 16:13:35'),
(257, 15, 18, 'view', '2025-04-05 16:13:38'),
(258, 15, 18, 'view', '2025-04-05 16:15:47'),
(259, 15, 18, 'view', '2025-04-05 16:16:00'),
(260, 15, 18, 'view', '2025-04-05 16:16:35'),
(261, 15, 18, 'view', '2025-04-05 16:18:40'),
(262, 15, 18, 'view', '2025-04-05 16:25:53'),
(263, 15, 18, 'view', '2025-04-05 16:25:57'),
(264, 15, 3, 'view', '2025-04-05 16:26:16'),
(265, 15, 3, 'view', '2025-04-05 16:27:08'),
(266, 15, 3, 'view', '2025-04-05 16:27:15'),
(267, 15, 18, 'view', '2025-04-05 16:27:17'),
(268, 15, 3, 'view', '2025-04-05 16:27:36'),
(269, 15, 3, 'view', '2025-04-05 16:27:40'),
(270, 15, 3, 'view', '2025-04-05 16:27:45'),
(271, 15, 18, 'view', '2025-04-07 12:24:33'),
(272, 15, 5, 'view', '2025-04-08 11:49:24'),
(273, 15, 5, 'view', '2025-04-10 16:42:17'),
(274, 15, 15, 'view', '2025-04-10 17:02:34'),
(275, 15, 14, 'view', '2025-04-12 13:00:43'),
(276, 15, 19, 'view', '2025-04-12 13:01:41'),
(277, 15, 23, 'view', '2025-04-12 13:01:43'),
(278, 15, 24, 'view', '2025-04-12 13:01:47'),
(279, 15, 20, 'view', '2025-04-12 13:01:50'),
(280, 15, 21, 'view', '2025-04-12 13:07:09'),
(281, 15, 3, 'view', '2025-04-14 14:55:54'),
(282, 15, 13, 'view', '2025-04-14 15:54:47'),
(283, 15, 11, 'view', '2025-04-14 15:54:51'),
(284, 15, 13, 'view', '2025-04-14 15:54:53'),
(285, 15, 4, 'view', '2025-04-14 15:54:56'),
(286, 15, 19, 'view', '2025-04-16 16:04:36'),
(287, 15, 7, 'view', '2025-04-21 14:38:32'),
(288, 15, 22, 'view', '2025-04-21 18:25:14'),
(290, 15, 21, 'view', '2025-04-25 14:20:35'),
(291, 15, 21, 'view', '2025-04-25 14:55:22'),
(293, 15, 22, 'view', '2025-04-26 14:22:46'),
(294, 15, 21, 'view', '2025-04-26 14:22:49'),
(295, 15, 5, 'view', '2025-04-26 14:22:53'),
(296, 15, 3, 'view', '2025-04-27 18:13:58'),
(297, 15, 15, 'view', '2025-04-28 10:13:36'),
(298, 15, 10, 'view', '2025-04-28 10:13:47'),
(299, 15, 15, 'view', '2025-04-28 10:18:08'),
(300, 15, 15, 'view', '2025-04-28 10:18:22'),
(301, 15, 18, 'view', '2025-04-28 10:18:24'),
(302, 15, 10, 'view', '2025-04-28 10:26:04'),
(303, 15, 10, 'view', '2025-04-28 10:26:16'),
(304, 15, 23, 'view', '2025-04-29 10:09:51'),
(305, 15, 23, 'view', '2025-04-29 10:10:18'),
(306, 15, 8, 'view', '2025-04-29 10:10:45'),
(307, 15, 8, 'view', '2025-04-29 10:10:54'),
(308, 15, 8, 'view', '2025-04-29 10:11:09'),
(309, 15, 15, 'view', '2025-04-29 10:11:16'),
(310, 15, 18, 'view', '2025-04-29 10:11:28'),
(311, 15, 6, 'view', '2025-04-29 10:11:40'),
(312, 15, 6, 'view', '2025-04-29 10:12:18'),
(313, 15, 6, 'view', '2025-04-29 10:13:18'),
(314, 15, 6, 'view', '2025-04-29 10:13:58'),
(315, 15, 6, 'view', '2025-04-29 10:16:43'),
(316, 15, 6, 'view', '2025-04-29 10:17:43'),
(317, 15, 6, 'view', '2025-04-29 10:17:54'),
(318, 15, 6, 'view', '2025-04-29 10:20:19'),
(319, 15, 6, 'view', '2025-04-29 10:21:59'),
(320, 15, 6, 'view', '2025-04-29 10:22:39'),
(321, 15, 6, 'view', '2025-04-29 10:23:20'),
(322, 15, 6, 'view', '2025-04-29 10:26:49'),
(323, 15, 6, 'view', '2025-04-29 10:28:32'),
(324, 15, 6, 'view', '2025-04-29 10:30:42'),
(325, 15, 6, 'view', '2025-04-29 10:33:10'),
(326, 15, 6, 'view', '2025-04-29 12:37:09'),
(327, 15, 9, 'view', '2025-04-29 12:51:13'),
(328, 15, 3, 'view', '2025-04-29 12:53:44'),
(329, 15, 3, 'view', '2025-04-29 12:53:52'),
(330, 15, 3, 'view', '2025-04-29 12:54:05'),
(331, 15, 3, 'view', '2025-04-29 12:55:49'),
(332, 15, 11, 'view', '2025-04-29 12:56:13'),
(333, 15, 11, 'view', '2025-04-29 12:56:40'),
(334, 15, 11, 'view', '2025-04-29 13:02:53'),
(335, 15, 18, 'view', '2025-04-29 13:03:27'),
(336, 15, 18, 'view', '2025-04-29 13:03:40'),
(337, 15, 18, 'view', '2025-04-29 13:08:55'),
(338, 15, 18, 'view', '2025-04-29 13:09:30'),
(339, 15, 18, 'view', '2025-04-29 13:11:45'),
(340, 15, 18, 'view', '2025-04-29 13:12:14'),
(341, 15, 18, 'view', '2025-04-29 13:14:52'),
(342, 15, 18, 'view', '2025-04-29 13:16:09'),
(343, 15, 18, 'view', '2025-04-29 13:16:39'),
(344, 15, 18, 'view', '2025-04-29 13:17:09'),
(345, 15, 18, 'view', '2025-04-29 13:17:22'),
(346, 15, 18, 'view', '2025-04-29 13:18:52'),
(347, 15, 18, 'view', '2025-04-29 13:19:34'),
(348, 15, 4, 'view', '2025-04-29 13:20:01'),
(349, 15, 4, 'view', '2025-04-29 13:20:40'),
(350, 15, 4, 'view', '2025-04-29 13:21:11'),
(351, 15, 24, 'view', '2025-04-29 13:21:34'),
(352, 15, 24, 'view', '2025-04-29 13:24:14'),
(353, 15, 24, 'view', '2025-04-29 13:25:37'),
(354, 15, 24, 'view', '2025-04-29 13:25:49'),
(355, 15, 4, 'view', '2025-04-29 13:26:08'),
(356, 15, 4, 'view', '2025-04-29 13:34:40'),
(357, 15, 24, 'view', '2025-04-29 13:34:55'),
(358, 15, 24, 'view', '2025-04-29 13:35:24'),
(359, 15, 24, 'view', '2025-04-29 13:36:45'),
(360, 15, 24, 'view', '2025-04-29 13:38:43'),
(361, 15, 24, 'view', '2025-04-29 13:39:42'),
(362, 15, 24, 'view', '2025-04-29 13:40:16'),
(363, 15, 24, 'view', '2025-04-29 13:40:24'),
(364, 15, 24, 'view', '2025-04-29 13:41:31'),
(365, 15, 4, 'view', '2025-04-29 13:41:36'),
(366, 15, 4, 'view', '2025-04-29 13:41:39'),
(367, 15, 4, 'view', '2025-04-29 13:42:10'),
(368, 15, 4, 'view', '2025-04-29 13:42:48'),
(369, 15, 4, 'view', '2025-04-29 13:43:56'),
(370, 15, 4, 'view', '2025-04-29 13:48:21'),
(371, 15, 4, 'view', '2025-04-29 13:48:42'),
(372, 15, 4, 'view', '2025-04-29 13:49:35'),
(373, 15, 4, 'view', '2025-04-29 13:49:53'),
(374, 15, 4, 'view', '2025-04-29 13:50:27'),
(375, 15, 4, 'view', '2025-04-29 13:51:00'),
(376, 15, 4, 'view', '2025-04-29 13:51:22'),
(377, 15, 4, 'view', '2025-04-29 13:52:18'),
(378, 15, 4, 'view', '2025-04-29 13:52:54'),
(379, 15, 4, 'view', '2025-04-29 13:53:11'),
(380, 15, 4, 'view', '2025-04-29 13:53:25'),
(381, 15, 4, 'view', '2025-04-29 13:53:38'),
(382, 15, 4, 'view', '2025-04-29 13:53:58'),
(383, 15, 4, 'view', '2025-04-29 13:55:57'),
(384, 15, 4, 'view', '2025-04-29 13:56:30'),
(385, 15, 4, 'view', '2025-04-29 14:10:26'),
(386, 15, 23, 'view', '2025-04-29 14:10:36'),
(387, 15, 21, 'view', '2025-04-29 14:10:53'),
(388, 15, 21, 'view', '2025-04-29 14:13:24'),
(389, 15, 16, 'view', '2025-04-29 14:15:05'),
(390, 15, 7, 'view', '2025-04-29 14:15:55'),
(391, 15, 7, 'view', '2025-04-29 14:15:59'),
(392, 15, 7, 'view', '2025-04-29 14:19:58'),
(393, 15, 7, 'view', '2025-04-29 14:20:40'),
(394, 15, 7, 'view', '2025-04-29 14:20:44'),
(395, 15, 16, 'view', '2025-04-29 14:20:45'),
(396, 15, 4, 'view', '2025-04-29 14:20:50'),
(397, 15, 24, 'view', '2025-04-29 15:54:42'),
(398, 15, 24, 'view', '2025-04-29 15:54:48'),
(405, 15, 24, 'view', '2025-04-29 16:16:32'),
(411, 15, 24, 'view', '2025-04-29 16:25:52'),
(412, 15, 24, 'view', '2025-04-29 16:25:54'),
(415, 15, 18, 'view', '2025-04-29 16:30:37'),
(416, 15, 24, 'view', '2025-04-29 16:30:46'),
(417, 15, 3, 'view', '2025-04-29 16:30:50'),
(418, 15, 5, 'view', '2025-04-29 16:30:55'),
(419, 15, 5, 'view', '2025-04-29 16:31:10'),
(420, 15, 3, 'view', '2025-04-29 16:41:18'),
(421, 15, 4, 'view', '2025-04-29 16:44:57'),
(422, 15, 4, 'view', '2025-04-29 16:45:11'),
(423, 15, 4, 'view', '2025-04-29 16:46:01'),
(424, 15, 4, 'view', '2025-04-29 16:46:40'),
(425, 15, 5, 'view', '2025-04-29 16:50:14'),
(426, 15, 6, 'view', '2025-04-29 16:53:38'),
(427, 15, 8, 'view', '2025-04-29 17:01:01'),
(428, 15, 8, 'view', '2025-04-29 21:01:12'),
(429, 15, 4, 'view', '2025-04-29 21:01:18'),
(430, 15, 5, 'view', '2025-04-29 21:01:21'),
(431, 15, 3, 'view', '2025-04-29 21:01:26'),
(432, 15, 3, 'view', '2025-04-29 21:36:59'),
(433, 15, 5, 'view', '2025-04-29 21:37:08'),
(434, 15, 6, 'view', '2025-04-29 21:37:16'),
(435, 15, 11, 'view', '2025-04-29 21:37:27'),
(436, 15, 11, 'view', '2025-04-29 21:40:08'),
(437, 15, 6, 'view', '2025-04-29 21:40:14'),
(439, 15, 6, 'view', '2025-04-30 12:18:14'),
(440, 15, 6, 'view', '2025-04-30 12:46:14'),
(441, 15, 6, 'view', '2025-05-01 12:56:44'),
(442, 28, 3, 'view', '2025-05-01 12:57:20'),
(443, 28, 14, 'view', '2025-05-01 12:57:24'),
(444, 28, 3, 'view', '2025-05-01 12:57:27'),
(445, 28, 4, 'view', '2025-05-01 12:57:31'),
(446, 28, 24, 'view', '2025-05-01 12:57:36'),
(447, 28, 3, 'view', '2025-05-01 12:57:43'),
(448, 28, 3, 'view', '2025-05-01 12:58:11'),
(449, 28, 3, 'view', '2025-05-01 12:58:28'),
(450, 28, 3, 'view', '2025-05-01 12:58:44'),
(451, 28, 3, 'view', '2025-05-01 12:58:51'),
(452, 28, 12, 'view', '2025-05-01 13:44:54'),
(453, 28, 5, 'view', '2025-05-01 13:52:47'),
(454, 28, 5, 'view', '2025-05-01 14:13:51'),
(455, 28, 5, 'view', '2025-05-01 14:13:57'),
(456, 28, 5, 'view', '2025-05-01 14:21:43'),
(457, 28, 3, 'view', '2025-05-01 14:43:01'),
(458, 28, 10, 'view', '2025-05-01 14:49:03'),
(459, 28, 10, 'view', '2025-05-01 14:53:34'),
(460, 28, 10, 'view', '2025-05-01 15:01:16'),
(461, 28, 10, 'view', '2025-05-01 15:05:27'),
(462, 28, 10, 'view', '2025-05-01 15:19:49'),
(463, 28, 4, 'view', '2025-05-01 15:19:58'),
(464, 28, 5, 'view', '2025-05-01 15:20:28'),
(465, 28, 12, 'view', '2025-05-01 15:34:52'),
(466, 28, 20, 'view', '2025-05-02 03:12:51'),
(467, 28, 12, 'view', '2025-05-02 11:12:47'),
(468, 28, 12, 'view', '2025-05-02 11:12:55'),
(469, 28, 12, 'view', '2025-05-03 12:45:21'),
(470, 28, 12, 'view', '2025-05-03 12:45:31'),
(471, 28, 12, 'view', '2025-05-03 14:10:21'),
(472, 28, 12, 'view', '2025-05-03 14:11:11'),
(473, 28, 12, 'view', '2025-05-03 14:12:36'),
(474, 28, 12, 'view', '2025-05-03 14:13:34'),
(475, 28, 12, 'view', '2025-05-03 14:14:32'),
(476, 28, 12, 'view', '2025-05-03 14:14:47'),
(477, 28, 12, 'view', '2025-05-03 14:15:21'),
(478, 28, 12, 'view', '2025-05-03 14:15:58'),
(479, 28, 12, 'view', '2025-05-03 14:17:27'),
(480, 28, 12, 'view', '2025-05-03 14:17:45'),
(481, 28, 12, 'view', '2025-05-03 14:19:07'),
(482, 28, 12, 'view', '2025-05-03 14:19:44'),
(483, 28, 12, 'view', '2025-05-03 14:20:13'),
(484, 28, 12, 'view', '2025-05-03 14:20:38'),
(485, 28, 12, 'view', '2025-05-03 14:21:23'),
(486, 28, 15, 'view', '2025-05-03 14:21:36'),
(487, 28, 15, 'view', '2025-05-03 14:27:19'),
(488, 28, 15, 'view', '2025-05-03 14:31:13'),
(489, 28, 15, 'view', '2025-05-03 14:37:57'),
(490, 28, 15, 'view', '2025-05-03 14:46:10'),
(491, 28, 15, 'view', '2025-05-03 14:46:38'),
(492, 28, 15, 'view', '2025-05-03 14:46:57'),
(493, 28, 15, 'view', '2025-05-03 14:47:43'),
(494, 28, 15, 'view', '2025-05-03 14:48:19'),
(495, 28, 15, 'view', '2025-05-03 14:49:13'),
(496, 28, 15, 'view', '2025-05-03 14:56:53'),
(497, 28, 15, 'view', '2025-05-03 15:02:44'),
(498, 28, 15, 'view', '2025-05-03 15:07:42'),
(499, 28, 15, 'view', '2025-05-03 15:09:29'),
(500, 28, 15, 'view', '2025-05-03 15:10:50'),
(501, 28, 15, 'view', '2025-05-03 15:11:46'),
(502, 28, 15, 'view', '2025-05-03 15:13:42'),
(503, 28, 15, 'view', '2025-05-03 15:14:17'),
(504, 28, 15, 'view', '2025-05-03 15:15:32'),
(505, 28, 15, 'view', '2025-05-03 15:15:38'),
(506, 28, 15, 'view', '2025-05-03 15:15:59'),
(507, 28, 15, 'view', '2025-05-03 15:18:04'),
(508, 28, 15, 'view', '2025-05-05 14:11:03'),
(509, 28, 4, 'view', '2025-05-05 17:14:30'),
(510, 28, 17, 'view', '2025-05-05 17:14:34'),
(511, 28, 17, 'view', '2025-05-05 17:14:36'),
(512, 28, 17, 'view', '2025-05-05 17:14:38'),
(513, 28, 15, 'view', '2025-05-05 17:16:35'),
(514, 28, 15, 'view', '2025-05-05 18:23:28'),
(515, 28, 15, 'view', '2025-05-05 18:45:18'),
(516, 28, 15, 'view', '2025-05-05 18:55:12'),
(517, 28, 4, 'view', '2025-05-06 11:09:26'),
(518, 28, 9, 'view', '2025-05-06 11:16:27'),
(519, 28, 3, 'view', '2025-05-06 11:21:24'),
(520, 28, 13, 'view', '2025-05-06 18:07:26'),
(521, 28, 13, 'view', '2025-05-06 18:12:40'),
(522, 28, 13, 'view', '2025-05-06 18:15:25'),
(523, 28, 24, 'view', '2025-05-06 18:20:54'),
(524, 28, 24, 'view', '2025-05-06 18:20:57'),
(525, 28, 3, 'view', '2025-05-06 18:21:00'),
(526, 28, 9, 'view', '2025-05-06 19:10:12'),
(527, 28, 18, 'view', '2025-05-06 19:10:19'),
(528, 28, 9, 'view', '2025-05-06 19:10:24'),
(529, 28, 9, 'view', '2025-05-06 19:10:29'),
(530, 28, 4, 'view', '2025-05-06 19:10:54'),
(531, 28, 19, 'view', '2025-05-06 19:11:01'),
(532, 28, 13, 'view', '2025-05-06 19:11:06'),
(533, 28, 15, 'view', '2025-05-06 19:11:09'),
(534, 28, 4, 'view', '2025-05-06 19:18:07'),
(535, 28, 19, 'view', '2025-05-06 19:18:11'),
(536, 28, 6, 'view', '2025-05-06 19:18:15'),
(537, 28, 24, 'view', '2025-05-07 18:03:56'),
(538, 28, 5, 'view', '2025-05-07 18:44:32'),
(539, 28, 24, 'view', '2025-05-07 20:06:42'),
(540, 28, 20, 'view', '2025-05-07 20:08:21'),
(541, 28, 18, 'view', '2025-05-07 20:10:05'),
(542, 28, 10, 'view', '2025-05-07 20:27:27'),
(543, 28, 10, 'view', '2025-05-07 20:38:52'),
(544, 28, 10, 'view', '2025-05-07 21:57:15'),
(545, 28, 10, 'view', '2025-05-07 21:57:18'),
(546, 28, 10, 'view', '2025-05-07 21:57:20'),
(547, 28, 10, 'view', '2025-05-07 22:38:30'),
(548, 28, 10, 'view', '2025-05-07 22:38:35'),
(549, 28, 12, 'view', '2025-05-07 22:38:41'),
(550, 28, 12, 'view', '2025-05-07 23:02:34'),
(551, 28, 24, 'view', '2025-05-07 23:57:33'),
(552, 28, 4, 'view', '2025-05-08 00:07:51'),
(553, 28, 20, 'view', '2025-05-08 00:08:23'),
(554, 28, 17, 'view', '2025-05-08 00:08:25'),
(555, 28, 17, 'view', '2025-05-08 00:09:32'),
(556, 28, 17, 'view', '2025-05-08 00:09:34'),
(557, 28, 20, 'view', '2025-05-08 00:09:36'),
(558, 28, 3, 'view', '2025-05-08 00:19:50'),
(559, 28, 3, 'view', '2025-05-08 01:11:00'),
(560, 28, 19, 'view', '2025-05-08 01:19:49'),
(561, 28, 19, 'view', '2025-05-08 12:37:16'),
(562, 28, 19, 'view', '2025-05-08 12:37:22'),
(563, 28, 19, 'view', '2025-05-08 12:43:49'),
(564, 28, 15, 'view', '2025-05-09 12:27:24'),
(565, 28, 19, 'view', '2025-05-09 12:33:20'),
(566, 28, 12, 'view', '2025-05-09 14:27:45'),
(567, 28, 12, 'view', '2025-05-09 15:44:27'),
(568, 28, 13, 'view', '2025-05-09 15:44:30'),
(569, 28, 15, 'view', '2025-05-09 15:44:41'),
(570, 28, 12, 'view', '2025-05-09 15:44:47'),
(571, 28, 13, 'view', '2025-05-09 15:48:50'),
(572, 28, 9, 'view', '2025-05-09 15:48:52'),
(573, 28, 4, 'view', '2025-05-09 15:51:54'),
(574, 28, 3, 'view', '2025-05-09 15:52:00'),
(575, 28, 3, 'view', '2025-05-09 15:57:04'),
(576, 28, 3, 'view', '2025-05-10 14:35:01'),
(577, 28, 3, 'view', '2025-05-10 14:35:06'),
(578, 28, 24, 'view', '2025-05-10 15:08:22'),
(579, 28, 13, 'view', '2025-05-10 15:08:25'),
(580, 28, 13, 'view', '2025-05-10 15:53:01'),
(581, 28, 13, 'view', '2025-05-10 15:55:47'),
(582, 28, 13, 'view', '2025-05-10 15:56:03'),
(583, 28, 4, 'view', '2025-05-10 15:57:53'),
(584, 28, 4, 'view', '2025-05-10 16:02:27'),
(585, 28, 15, 'view', '2025-05-10 16:02:37'),
(586, 28, 15, 'view', '2025-05-10 16:06:22'),
(587, 28, 15, 'view', '2025-05-10 16:07:56'),
(588, 28, 15, 'view', '2025-05-10 16:08:55'),
(589, 28, 15, 'view', '2025-05-10 16:08:58'),
(590, 28, 15, 'view', '2025-05-10 16:09:01'),
(591, 28, 15, 'view', '2025-05-10 16:09:03'),
(592, 28, 15, 'view', '2025-05-10 16:09:05'),
(593, 28, 15, 'view', '2025-05-10 16:09:18'),
(594, 28, 15, 'view', '2025-05-10 16:09:21'),
(595, 28, 15, 'view', '2025-05-10 16:09:23'),
(596, 28, 15, 'view', '2025-05-10 16:16:43'),
(597, 28, 15, 'view', '2025-05-10 16:16:46'),
(598, 28, 15, 'view', '2025-05-10 16:16:51'),
(599, 28, 15, 'view', '2025-05-11 13:33:53'),
(600, 28, 15, 'view', '2025-05-11 13:33:56'),
(601, 28, 15, 'view', '2025-05-11 13:33:58'),
(602, 28, 15, 'view', '2025-05-11 13:34:03'),
(603, 28, 15, 'view', '2025-05-11 13:34:35'),
(604, 28, 15, 'view', '2025-05-11 13:34:48'),
(605, 28, 15, 'view', '2025-05-11 13:34:50'),
(606, 28, 15, 'view', '2025-05-11 13:34:52'),
(607, 28, 15, 'view', '2025-05-11 13:34:54'),
(608, 28, 15, 'view', '2025-05-11 13:35:01'),
(609, 28, 15, 'view', '2025-05-11 13:35:04'),
(610, 28, 6, 'view', '2025-05-11 13:35:10'),
(611, 28, 6, 'view', '2025-05-11 13:38:17'),
(612, 28, 6, 'view', '2025-05-11 13:38:20'),
(613, 28, 46, 'view', '2025-05-11 13:56:55'),
(614, 28, 46, 'view', '2025-05-11 13:57:42'),
(615, 28, 46, 'view', '2025-05-11 14:17:53'),
(616, 28, 3, 'view', '2025-05-11 14:34:36'),
(617, 28, 24, 'view', '2025-05-11 14:36:04'),
(618, 28, 46, 'view', '2025-05-11 17:55:09'),
(619, 28, 46, 'view', '2025-05-11 17:58:04'),
(620, 28, 46, 'view', '2025-05-11 17:58:10'),
(621, 28, 46, 'view', '2025-05-11 17:58:26'),
(622, 28, 46, 'view', '2025-05-11 17:58:34'),
(623, 28, 11, 'view', '2025-05-11 18:00:51'),
(624, 28, 24, 'view', '2025-05-11 18:00:56'),
(625, 28, 18, 'view', '2025-05-11 19:03:27'),
(626, 28, 12, 'view', '2025-05-11 19:03:32'),
(627, 28, 12, 'view', '2025-05-11 19:04:54'),
(628, 28, 12, 'view', '2025-05-11 19:04:56'),
(629, 28, 12, 'view', '2025-05-11 19:08:32'),
(630, 28, 12, 'view', '2025-05-11 19:09:30'),
(631, 28, 12, 'view', '2025-05-11 19:09:33'),
(632, 28, 12, 'view', '2025-05-11 19:11:32'),
(633, 28, 12, 'view', '2025-05-11 19:11:34'),
(634, 28, 12, 'view', '2025-05-11 19:11:37'),
(635, 28, 12, 'view', '2025-05-11 19:11:45'),
(636, 28, 12, 'view', '2025-05-11 19:12:02'),
(637, 28, 12, 'view', '2025-05-11 19:12:18'),
(638, 28, 12, 'view', '2025-05-11 19:12:22'),
(639, 28, 12, 'view', '2025-05-11 19:12:52'),
(640, 28, 12, 'view', '2025-05-11 19:12:55'),
(641, 28, 12, 'view', '2025-05-11 19:13:48'),
(642, 28, 12, 'view', '2025-05-11 19:14:32'),
(643, 28, 18, 'view', '2025-05-11 19:14:34'),
(644, 28, 24, 'view', '2025-05-11 19:14:36'),
(645, 28, 24, 'view', '2025-05-11 19:16:23'),
(646, 28, 24, 'view', '2025-05-11 19:16:29'),
(647, 28, 24, 'view', '2025-05-11 19:16:42'),
(648, 28, 24, 'view', '2025-05-11 19:19:18'),
(649, 28, 24, 'view', '2025-05-11 19:19:25'),
(650, 28, 3, 'view', '2025-05-11 19:19:54'),
(651, 28, 3, 'view', '2025-05-11 19:19:58'),
(652, 28, 3, 'view', '2025-05-11 19:23:44'),
(653, 28, 3, 'view', '2025-05-11 19:28:27'),
(654, 28, 3, 'view', '2025-05-11 19:28:29'),
(655, 28, 3, 'view', '2025-05-11 19:28:31'),
(656, 28, 3, 'view', '2025-05-11 19:28:36'),
(657, 28, 3, 'view', '2025-05-11 19:36:50'),
(658, 28, 3, 'view', '2025-05-11 19:36:53'),
(659, 28, 3, 'view', '2025-05-11 19:36:57'),
(660, 28, 3, 'view', '2025-05-11 19:37:04'),
(661, 28, 3, 'view', '2025-05-11 20:25:22'),
(662, 28, 3, 'view', '2025-05-11 20:46:58'),
(663, 28, 11, 'view', '2025-05-13 19:35:26'),
(664, 28, 16, 'view', '2025-05-17 10:49:07'),
(665, 28, 16, 'view', '2025-05-17 13:11:42'),
(666, 28, 11, 'view', '2025-05-17 14:27:56'),
(667, 28, 22, 'view', '2025-05-17 14:30:34'),
(668, 28, 22, 'view', '2025-05-17 14:30:37'),
(669, 28, 7, 'view', '2025-05-17 14:40:09'),
(670, 28, 7, 'view', '2025-05-17 15:39:03'),
(671, 28, 46, 'view', '2025-05-19 16:25:44'),
(672, 28, 46, 'view', '2025-05-19 16:26:13'),
(673, 28, 46, 'view', '2025-05-19 16:26:28'),
(674, 28, 46, 'view', '2025-05-19 16:26:43'),
(675, 28, 7, 'view', '2025-05-19 16:26:46'),
(676, 28, 46, 'view', '2025-05-19 16:27:09'),
(677, 28, 4, 'view', '2025-05-19 16:27:12'),
(678, 28, 4, 'view', '2025-05-19 16:27:33'),
(679, 28, 15, 'view', '2025-05-19 16:27:47'),
(680, 28, 15, 'view', '2025-05-19 16:27:58'),
(681, 28, 3, 'view', '2025-05-19 16:28:03'),
(682, 28, 16, 'view', '2025-05-19 16:28:52'),
(683, 28, 16, 'view', '2025-05-19 16:30:11'),
(684, 28, 16, 'view', '2025-05-19 16:30:57'),
(685, 28, 16, 'view', '2025-05-19 17:11:36'),
(686, 28, 4, 'view', '2025-05-19 17:39:16'),
(687, 28, 3, 'view', '2025-05-19 17:43:45'),
(688, 28, 4, 'view', '2025-05-19 17:44:57'),
(689, 28, 15, 'view', '2025-05-19 17:45:03'),
(690, 28, 4, 'view', '2025-05-19 17:45:07'),
(691, 28, 4, 'view', '2025-05-19 17:45:10'),
(692, 28, 4, 'view', '2025-05-19 17:45:19'),
(693, 28, 16, 'view', '2025-05-19 17:46:02'),
(694, 28, 16, 'view', '2025-05-19 17:47:11'),
(695, 28, 16, 'view', '2025-05-19 17:47:18'),
(696, 28, 4, 'view', '2025-05-19 17:48:12'),
(697, 28, 4, 'view', '2025-05-19 17:48:33'),
(698, 28, 15, 'view', '2025-05-19 17:48:52'),
(699, 28, 16, 'view', '2025-05-19 17:49:27'),
(700, 28, 3, 'view', '2025-05-19 17:49:31'),
(701, 28, 3, 'view', '2025-05-19 17:50:37'),
(702, 28, 3, 'view', '2025-05-19 17:50:43'),
(703, 28, 3, 'view', '2025-05-19 17:50:46'),
(704, 28, 46, 'view', '2025-05-19 17:51:32'),
(705, 28, 46, 'view', '2025-05-19 17:51:57'),
(706, 28, 3, 'view', '2025-05-19 17:52:01'),
(707, 28, 16, 'view', '2025-05-19 17:52:04'),
(708, 28, 4, 'view', '2025-05-19 17:52:08'),
(709, 28, 16, 'view', '2025-05-19 17:52:32'),
(710, 28, 3, 'view', '2025-05-23 09:43:19'),
(711, 28, 46, 'view', '2025-05-23 10:22:48'),
(712, 28, 15, 'view', '2025-05-23 10:22:52'),
(713, 28, 17, 'view', '2025-05-23 10:22:58'),
(714, 28, 15, 'view', '2025-05-23 10:23:17'),
(715, 28, 15, 'view', '2025-05-23 10:25:19'),
(716, 28, 18, 'view', '2025-05-23 10:25:27'),
(717, 28, 18, 'view', '2025-05-23 10:26:29'),
(718, 28, 18, 'view', '2025-05-23 10:26:35'),
(719, 28, 18, 'view', '2025-05-23 10:27:44'),
(720, 28, 18, 'view', '2025-05-23 10:27:48'),
(721, 28, 18, 'view', '2025-05-23 10:27:50'),
(722, 28, 18, 'view', '2025-05-23 10:29:38'),
(723, 28, 18, 'view', '2025-05-23 10:30:13'),
(724, 28, 18, 'view', '2025-05-23 10:30:24'),
(725, 28, 18, 'view', '2025-05-23 10:31:38'),
(726, 28, 18, 'view', '2025-05-23 11:00:24'),
(727, 28, 18, 'view', '2025-05-23 11:02:20'),
(728, 28, 18, 'view', '2025-05-23 11:03:09'),
(729, 28, 4, 'view', '2025-05-23 11:07:59'),
(730, 28, 12, 'view', '2025-05-23 11:59:07'),
(731, 28, 12, 'view', '2025-05-23 12:12:36'),
(732, 28, 4, 'view', '2025-05-23 13:48:26'),
(733, 28, 4, 'view', '2025-05-23 13:48:47'),
(734, 28, 4, 'view', '2025-05-23 13:51:50'),
(735, 28, 4, 'view', '2025-05-23 13:52:03'),
(736, 28, 4, 'view', '2025-05-23 13:52:42'),
(737, 28, 4, 'view', '2025-05-23 13:52:52'),
(738, 28, 4, 'view', '2025-05-23 13:53:26'),
(739, 28, 12, 'view', '2025-05-23 13:53:34'),
(740, 28, 4, 'view', '2025-05-23 13:53:38'),
(741, 28, 4, 'view', '2025-05-23 13:56:40'),
(742, 28, 4, 'view', '2025-05-23 13:56:51'),
(743, 28, 4, 'view', '2025-05-23 13:57:09'),
(744, 28, 4, 'view', '2025-05-23 13:58:36'),
(745, 28, 4, 'view', '2025-05-23 13:58:38'),
(746, 28, 4, 'view', '2025-05-23 13:58:42'),
(747, 28, 4, 'view', '2025-05-23 13:59:36'),
(748, 28, 4, 'view', '2025-05-23 13:59:45'),
(749, 28, 4, 'view', '2025-05-23 14:03:09'),
(750, 28, 12, 'view', '2025-05-23 14:03:13'),
(751, 28, 12, 'view', '2025-05-23 14:03:40'),
(752, 28, 12, 'view', '2025-05-23 14:05:25'),
(753, 28, 12, 'view', '2025-05-23 14:05:34'),
(754, 28, 12, 'view', '2025-05-23 14:06:02'),
(755, 28, 4, 'view', '2025-05-23 14:06:05'),
(756, 28, 4, 'view', '2025-05-23 14:06:26'),
(757, 28, 4, 'view', '2025-05-23 14:06:36'),
(758, 28, 4, 'view', '2025-05-23 14:08:18'),
(759, 28, 12, 'view', '2025-05-23 14:08:25'),
(760, 28, 12, 'view', '2025-05-23 14:09:18'),
(761, 28, 12, 'view', '2025-05-23 14:09:31'),
(762, 28, 12, 'view', '2025-05-23 14:09:58'),
(763, 28, 12, 'view', '2025-05-23 14:11:49'),
(764, 28, 12, 'view', '2025-05-23 14:11:51'),
(765, 28, 12, 'view', '2025-05-23 14:12:47'),
(766, 28, 12, 'view', '2025-05-23 14:13:07'),
(767, 28, 12, 'view', '2025-05-23 14:13:54'),
(768, 28, 4, 'view', '2025-05-23 14:14:14'),
(769, 28, 4, 'view', '2025-05-23 14:16:14'),
(770, 28, 4, 'view', '2025-05-23 14:17:36'),
(771, 28, 4, 'view', '2025-05-23 14:17:41'),
(772, 28, 12, 'view', '2025-05-23 14:17:45'),
(773, 28, 12, 'view', '2025-05-23 14:21:34'),
(774, 28, 4, 'view', '2025-05-23 14:55:24'),
(775, 28, 18, 'view', '2025-05-23 15:11:24'),
(776, 28, 18, 'view', '2025-05-23 15:11:29'),
(777, 28, 18, 'view', '2025-05-23 15:12:25'),
(778, 28, 18, 'view', '2025-05-23 16:03:17'),
(779, 28, 18, 'view', '2025-05-23 17:15:28'),
(780, 28, 20, 'view', '2025-05-23 17:17:12'),
(781, 28, 9, 'view', '2025-05-23 17:22:38'),
(782, 28, 12, 'view', '2025-05-23 17:22:44'),
(783, 28, 12, 'view', '2025-05-23 17:22:51'),
(784, 28, 12, 'view', '2025-05-23 17:25:54'),
(785, 28, 12, 'view', '2025-05-23 17:26:18'),
(786, 28, 13, 'view', '2025-05-23 17:32:03'),
(787, 28, 12, 'view', '2025-05-23 17:32:06'),
(788, 28, 11, 'view', '2025-05-23 17:33:29'),
(789, 28, 4, 'view', '2025-05-23 17:33:32'),
(790, 28, 16, 'view', '2025-05-23 17:33:36'),
(791, 28, 19, 'view', '2025-05-23 17:33:39'),
(792, 28, 19, 'view', '2025-05-23 17:37:24'),
(793, 28, 19, 'view', '2025-05-23 17:37:27'),
(794, 28, 19, 'view', '2025-05-23 17:38:47'),
(795, 28, 19, 'view', '2025-05-23 17:39:00'),
(796, 28, 9, 'view', '2025-05-23 17:44:04'),
(797, 28, 13, 'view', '2025-05-23 17:44:06'),
(798, 28, 10, 'view', '2025-05-23 17:44:08'),
(799, 28, 18, 'view', '2025-05-23 17:44:35'),
(800, 28, 18, 'view', '2025-05-23 17:50:47'),
(801, 28, 10, 'view', '2025-05-23 17:50:49'),
(802, 28, 18, 'view', '2025-05-23 17:51:03');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_cart_fav`
-- (See below for the actual view)
--
CREATE TABLE `v_cart_fav` (
`favorite_id` int(11)
,`product_id` int(11)
,`user_id` int(11)
,`tipo` tinyint(1)
,`quantity` int(11)
,`created_at` timestamp
,`title` varchar(150)
,`price` decimal(10,2)
,`category` varchar(50)
,`cover` varchar(255)
,`seller_type` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_message_details`
-- (See below for the actual view)
--
CREATE TABLE `v_message_details` (
`id_message` int(11)
,`chat_id` int(11)
,`owner_id` int(11)
,`sender_id` int(11)
,`sender_name` varchar(100)
,`sender_last_name` varchar(100)
,`receiver_id` int(11)
,`receiver_name` varchar(100)
,`receiver_last_name` varchar(100)
,`product_id` int(11)
,`product_title` varchar(150)
,`message` text
,`timestamp` timestamp
,`timestamp_format` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_popular_products`
-- (See below for the actual view)
--
CREATE TABLE `v_popular_products` (
`product_id` int(11)
,`user_id` int(11)
,`title` varchar(150)
,`description` text
,`price` decimal(10,2)
,`price_before` decimal(10,2)
,`category` varchar(50)
,`quantity` int(11)
,`cover` varchar(255)
,`created_at` timestamp
,`updated_at` timestamp
,`seller_type` varchar(20)
,`view_count` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_product_details`
-- (See below for the actual view)
--
CREATE TABLE `v_product_details` (
`product_id` int(11)
,`user_id` int(11)
,`title` varchar(150)
,`description` text
,`price` decimal(10,2)
,`price_before` decimal(10,2)
,`discount_percentage` decimal(17,2)
,`category` varchar(50)
,`quantity` int(11)
,`cover` varchar(255)
,`location` varchar(255)
,`created_at` timestamp
,`updated_at` timestamp
,`seller_type` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_product_full_details`
-- (See below for the actual view)
--
CREATE TABLE `v_product_full_details` (
`product_id` int(11)
,`user_id` int(11)
,`title` varchar(150)
,`description` text
,`price` decimal(10,2)
,`price_before` decimal(10,2)
,`discount_percentage` decimal(17,2)
,`category` varchar(50)
,`quantity` int(11)
,`cover` varchar(255)
,`location` varchar(255)
,`created_at` varchar(19)
,`updated_at` varchar(19)
,`seller_type` varchar(20)
,`views` int(11)
,`favorites_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_user_chats`
-- (See below for the actual view)
--
CREATE TABLE `v_user_chats` (
`owner_id` int(11)
,`chat_id` int(11)
,`product_id` int(11)
,`product_title` varchar(150)
,`product_price` decimal(10,2)
,`id_message` int(11)
,`user_id` int(11)
,`chat_with` int(11)
,`chat_with_name` varchar(100)
,`chat_with_last_name` varchar(100)
,`last_message` mediumtext
,`cover_product` varchar(255)
,`last_message_time` timestamp
,`last_message_time_format` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `balance` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`id`, `user_id`, `balance`) VALUES
(1, 22, 0.00),
(2, 23, 0.00),
(3, 28, 123.56),
(4, 18, 0.00),
(5, 27, 0.00),
(6, 15, 0.00),
(7, 26, 0.00),
(8, 21, 0.00),
(9, 19, 0.00),
(10, 25, 0.00),
(11, 20, 0.00);

-- --------------------------------------------------------

--
-- Structure for view `v_cart_fav`
--
DROP TABLE IF EXISTS `v_cart_fav`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cart_fav`  AS SELECT `saved`.`saved_id` AS `favorite_id`, `saved`.`product_id` AS `product_id`, `saved`.`user_id` AS `user_id`, `saved`.`tipo` AS `tipo`, `saved`.`quantity` AS `quantity`, `saved`.`created_at` AS `created_at`, `products`.`title` AS `title`, `products`.`price` AS `price`, `products`.`category` AS `category`, `products`.`cover` AS `cover`, `products`.`seller_type` AS `seller_type` FROM (`saved` join `products` on(`saved`.`product_id` = `products`.`product_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_message_details`
--
DROP TABLE IF EXISTS `v_message_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_message_details`  AS SELECT `m`.`id_message` AS `id_message`, `c`.`chat_id` AS `chat_id`, `p`.`user_id` AS `owner_id`, `m`.`sender_id` AS `sender_id`, `sender`.`name` AS `sender_name`, `sender`.`last_name` AS `sender_last_name`, `m`.`receiver_id` AS `receiver_id`, `receiver`.`name` AS `receiver_name`, `receiver`.`last_name` AS `receiver_last_name`, `c`.`product_id` AS `product_id`, `p`.`title` AS `product_title`, `m`.`message` AS `message`, `m`.`timestamp` AS `timestamp`, date_format(`m`.`timestamp`,'%H:%i') AS `timestamp_format` FROM ((((`messages` `m` join `chats` `c` on(`m`.`chat_id` = `c`.`chat_id`)) join `users` `sender` on(`m`.`sender_id` = `sender`.`user_id`)) join `users` `receiver` on(`m`.`receiver_id` = `receiver`.`user_id`)) join `products` `p` on(`c`.`product_id` = `p`.`product_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_popular_products`
--
DROP TABLE IF EXISTS `v_popular_products`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_popular_products`  AS SELECT `p`.`product_id` AS `product_id`, `p`.`user_id` AS `user_id`, `p`.`title` AS `title`, `p`.`description` AS `description`, `p`.`price` AS `price`, `p`.`price_before` AS `price_before`, `p`.`category` AS `category`, `p`.`quantity` AS `quantity`, `p`.`cover` AS `cover`, `p`.`created_at` AS `created_at`, `p`.`updated_at` AS `updated_at`, `p`.`seller_type` AS `seller_type`, `pv`.`view_count` AS `view_count` FROM (`products` `p` join `products_views` `pv` on(`p`.`product_id` = `pv`.`product_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_product_details`
--
DROP TABLE IF EXISTS `v_product_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_product_details`  AS SELECT `p`.`product_id` AS `product_id`, `p`.`user_id` AS `user_id`, `p`.`title` AS `title`, `p`.`description` AS `description`, `p`.`price` AS `price`, `p`.`price_before` AS `price_before`, round((`p`.`price_before` - `p`.`price`) / `p`.`price_before` * 100,2) AS `discount_percentage`, `p`.`category` AS `category`, `p`.`quantity` AS `quantity`, `p`.`cover` AS `cover`, `p`.`location` AS `location`, `p`.`created_at` AS `created_at`, `p`.`updated_at` AS `updated_at`, `p`.`seller_type` AS `seller_type` FROM `products` AS `p` ;

-- --------------------------------------------------------

--
-- Structure for view `v_product_full_details`
--
DROP TABLE IF EXISTS `v_product_full_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_product_full_details`  AS SELECT `p`.`product_id` AS `product_id`, `p`.`user_id` AS `user_id`, `p`.`title` AS `title`, `p`.`description` AS `description`, `p`.`price` AS `price`, `p`.`price_before` AS `price_before`, round((`p`.`price_before` - `p`.`price`) / `p`.`price_before` * 100,2) AS `discount_percentage`, `p`.`category` AS `category`, `p`.`quantity` AS `quantity`, `p`.`cover` AS `cover`, `p`.`location` AS `location`, date_format(`p`.`created_at`,'%d/%m/%y %H:%i') AS `created_at`, date_format(`p`.`updated_at`,'%d/%m/%y %H:%i') AS `updated_at`, `p`.`seller_type` AS `seller_type`, ifnull(`pv`.`view_count`,0) AS `views`, count(distinct `f`.`saved_id`) AS `favorites_count` FROM ((`products` `p` left join `products_views` `pv` on(`p`.`product_id` = `pv`.`product_id`)) left join `saved` `f` on(`p`.`product_id` = `f`.`product_id`)) GROUP BY `p`.`product_id` ;

-- --------------------------------------------------------

--
-- Structure for view `v_user_chats`
--
DROP TABLE IF EXISTS `v_user_chats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user_chats`  AS SELECT `p`.`user_id` AS `owner_id`, `c`.`chat_id` AS `chat_id`, `c`.`product_id` AS `product_id`, `p`.`title` AS `product_title`, `p`.`price` AS `product_price`, `m`.`id_message` AS `id_message`, `m`.`sender_id` AS `user_id`, `m`.`receiver_id` AS `chat_with`, `u2`.`name` AS `chat_with_name`, `u2`.`last_name` AS `chat_with_last_name`, `m`.`message` AS `last_message`, `p`.`cover` AS `cover_product`, `m`.`timestamp` AS `last_message_time`, date_format(`m`.`timestamp`,'%H:%i') AS `last_message_time_format` FROM (((`chats` `c` join `messages` `m` on(`c`.`chat_id` = `m`.`chat_id`)) join `products` `p` on(`c`.`product_id` = `p`.`product_id`)) join `users` `u2` on(`m`.`receiver_id` = `u2`.`user_id`)) WHERE `m`.`timestamp` = (select max(`m2`.`timestamp`) from `messages` `m2` where `m2`.`chat_id` = `m`.`chat_id`)union select `p`.`user_id` AS `owner_id`,`c`.`chat_id` AS `chat_id`,`c`.`product_id` AS `product_id`,`p`.`title` AS `product_title`,`p`.`price` AS `product_price`,`m`.`id_message` AS `id_message`,`m`.`receiver_id` AS `user_id`,`m`.`sender_id` AS `chat_with`,`u1`.`name` AS `chat_with_name`,`u1`.`last_name` AS `chat_with_last_name`,`m`.`message` AS `last_message`,`p`.`cover` AS `cover_product`,`m`.`timestamp` AS `last_message_time`,date_format(`m`.`timestamp`,'%H:%i') AS `last_message_time_format` from (((`chats` `c` join `messages` `m` on(`c`.`chat_id` = `m`.`chat_id`)) join `products` `p` on(`c`.`product_id` = `p`.`product_id`)) join `users` `u1` on(`m`.`sender_id` = `u1`.`user_id`)) where `m`.`timestamp` = (select max(`m2`.`timestamp`) from `messages` `m2` where `m2`.`chat_id` = `m`.`chat_id`)  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`chat_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`gallery_id`),
  ADD KEY `gallery_ibfk_1` (`product_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `images_ibfk_1` (`gallery_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `messages_ibfk_4` (`chat_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_category` (`category`);
ALTER TABLE `products` ADD FULLTEXT KEY `title` (`title`,`description`,`category`);

--
-- Indexes for table `products_views`
--
ALTER TABLE `products_views`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `reviewer_id` (`reviewer_id`),
  ADD KEY `reviewed_user_id` (`reviewed_user_id`);

--
-- Indexes for table `saved`
--
ALTER TABLE `saved`
  ADD PRIMARY KEY (`saved_id`),
  ADD UNIQUE KEY `unique_cart_item` (`user_id`,`product_id`,`tipo`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `firebase_uid` (`firebase_uid`);

--
-- Indexes for table `users_tokens`
--
ALTER TABLE `users_tokens`
  ADD PRIMARY KEY (`id_token`),
  ADD UNIQUE KEY `no_dup` (`id_token`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_history`
--
ALTER TABLE `user_history`
  ADD PRIMARY KEY (`user_history_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `saved`
--
ALTER TABLE `saved`
  MODIFY `saved_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users_tokens`
--
ALTER TABLE `users_tokens`
  MODIFY `id_token` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user_history`
--
ALTER TABLE `user_history`
  MODIFY `user_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=803;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`gallery_id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_4` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`chat_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category`) REFERENCES `categories` (`name`),
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `products_views`
--
ALTER TABLE `products_views`
  ADD CONSTRAINT `products_views_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`reviewed_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `saved`
--
ALTER TABLE `saved`
  ADD CONSTRAINT `saved_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `saved_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `users_tokens`
--
ALTER TABLE `users_tokens`
  ADD CONSTRAINT `users_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_history`
--
ALTER TABLE `user_history`
  ADD CONSTRAINT `user_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_history_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
