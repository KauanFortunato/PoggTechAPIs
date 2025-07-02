-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02/07/2025 às 22:27
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `poggtech`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(255) NOT NULL DEFAULT 'ic_all_categories',
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `icon`, `description`, `created_at`) VALUES
(1, 'Consolas', 'ic_category_consoles', 'Consolas de todas as marcas.', '2024-11-23 21:49:49'),
(2, 'Jogos', 'ic_category_games', 'Videojogos', '2024-11-23 21:49:49'),
(3, 'Acessórios', 'ic_category_accessories', 'Dispositivos para usar com consolas.', '2024-11-23 21:49:49'),
(4, 'Colecionáveis', 'ic_category_collectables', 'Action figures, peluches, posters, etc.', '2025-05-08 12:43:42'),
(5, 'Retro Gaming', 'ic_category_retro', 'Consolas antigas (ex: NES, Mega Drive), cartuchos, etc.', '2025-05-08 12:44:50');

-- --------------------------------------------------------

--
-- Estrutura para tabela `chats`
--

CREATE TABLE `chats` (
  `chat_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `seller_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `chats`
--

INSERT INTO `chats` (`chat_id`, `product_id`, `seller_id`, `buyer_id`, `timestamp`) VALUES
(66, 5, 19, 28, '2025-06-24 22:05:11'),
(67, 5, 19, 20, '2025-06-27 23:00:37'),
(68, 6, 28, 20, '2025-06-28 13:34:34');

-- --------------------------------------------------------

--
-- Estrutura para tabela `gallery`
--

CREATE TABLE `gallery` (
  `gallery_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `gallery`
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
(98, 105, '2025-07-02 18:53:11'),
(99, 106, '2025-07-02 18:54:26'),
(100, 107, '2025-07-02 18:55:17'),
(101, 108, '2025-07-02 18:55:55'),
(102, 109, '2025-07-02 18:57:07'),
(103, 110, '2025-07-02 18:58:06'),
(104, 111, '2025-07-02 18:58:56'),
(105, 112, '2025-07-02 18:59:52'),
(106, 113, '2025-07-02 19:00:25'),
(107, 114, '2025-07-02 19:01:27'),
(108, 115, '2025-07-02 19:02:15'),
(109, 116, '2025-07-02 19:02:57'),
(110, 117, '2025-07-02 19:03:35'),
(111, 118, '2025-07-02 19:04:13'),
(112, 119, '2025-07-02 19:14:00'),
(113, 120, '2025-07-02 19:14:47'),
(114, 121, '2025-07-02 19:15:33'),
(115, 122, '2025-07-02 19:16:08'),
(116, 123, '2025-07-02 19:16:48'),
(117, 124, '2025-07-02 19:17:56'),
(118, 125, '2025-07-02 19:18:44'),
(119, 126, '2025-07-02 19:19:11'),
(120, 127, '2025-07-02 19:19:55'),
(121, 128, '2025-07-02 19:22:08'),
(122, 129, '2025-07-02 19:22:47'),
(123, 130, '2025-07-02 19:23:53'),
(124, 131, '2025-07-02 19:24:25'),
(125, 132, '2025-07-02 19:25:09'),
(126, 133, '2025-07-02 19:25:48'),
(127, 134, '2025-07-02 19:26:24'),
(128, 135, '2025-07-02 19:30:48'),
(129, 136, '2025-07-02 19:31:38'),
(130, 137, '2025-07-02 19:32:06'),
(131, 138, '2025-07-02 19:32:58'),
(132, 139, '2025-07-02 19:33:28'),
(133, 140, '2025-07-02 19:34:17'),
(134, 142, '2025-07-02 19:34:54'),
(135, 143, '2025-07-02 19:37:05'),
(136, 144, '2025-07-02 19:37:52'),
(137, 145, '2025-07-02 19:38:20'),
(139, 147, '2025-07-02 19:41:27'),
(140, 148, '2025-07-02 19:42:07'),
(141, 150, '2025-07-02 19:43:00'),
(142, 151, '2025-07-02 19:44:18'),
(143, 152, '2025-07-02 19:44:47'),
(144, 153, '2025-07-02 19:45:27'),
(145, 154, '2025-07-02 19:45:57'),
(146, 155, '2025-07-02 19:46:31'),
(147, 156, '2025-07-02 19:47:04'),
(148, 157, '2025-07-02 19:47:32'),
(149, 158, '2025-07-02 19:47:53');

-- --------------------------------------------------------

--
-- Estrutura para tabela `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `images`
--

INSERT INTO `images` (`image_id`, `gallery_id`, `path`) VALUES
(50, 5, 'img_microsoft-xbox-series-x-frandroid-20828593.png'),
(51, 5, 'img_Xbox-Series-X-Test-1987881512.jpg'),
(52, 5, 'img_1603387292316-1_9szne9sb-4097509527.jpeg'),
(53, 24, 'img_Xbox-Free-Download-PNG-721582555.png'),
(54, 24, 'img_s-l1600-2392549085.jpg'),
(55, 24, 'img_microsoft-xbox-360-s-slim-500gb-console-kinect-40-sport-bundle-2660298083.jpg'),
(56, 26, 'img_S2DSAZUC_l.webp'),
(57, 26, 'img_81Rw0RTY7-L-3412856433.jpg'),
(58, 26, 'img_P1040543-1664434788.jpg'),
(59, 6, 'img_310047-grand-theft-auto-v-xbox-360-front-cover-3516295299.png'),
(60, 6, 'img_gta5+xbox+360-4013109471.jpg'),
(61, 6, 'img_maxresdefault-1674275056.jpg'),
(62, 7, 'img_045496463106_l.webp'),
(63, 7, 'img_maxresdefault-2961303710.jpg'),
(64, 8, 'img_045496470685_l.webp'),
(65, 8, 'img_thumb-1920-675017-3002037112.jpg'),
(66, 9, 'img_0711719894650_l.webp'),
(67, 9, 'img_controle-dualshock-4-playstation-4-branco-glacial-4283629037.jpg'),
(68, 9, 'img_Controle-PS4-branco-original-20211211203934.3013630015-2776290154.jpg'),
(69, 10, 'img_SPS3ACCMOVE_l.webp'),
(70, 10, 'img_219d14f79b-1992264298.jpg'),
(71, 10, 'img_m27033734871_1-648256890.jpg'),
(72, 11, 'img_S360KINSNXB_l.webp'),
(73, 11, 'img_81rcVeXg0eL._SL1500_-3398597712.jpg'),
(74, 12, 'img_4902370505559_l.webp'),
(75, 12, 'img_530-4256306619.jpg'),
(76, 12, 'img_nintendo-gamecube-indigo-controller-eu-front-1586193238-21-679705842.jpg'),
(77, 13, 'img_045496370008_l.webp'),
(78, 13, 'img_8bqpngw7mcy41-2363194276.jpg'),
(79, 14, 'img_SGCUGAMETS003_l.webp'),
(80, 14, 'img_Nintendo-Pack-GameCube-Tales-Of-Symphonia-4242111777.jpg'),
(81, 15, 'img_0454964NSL32BL01_l.webp'),
(82, 15, 'img_nintendoSwitchLiteBlue2.jpeg'),
(83, 15, 'img_nintendoSwitchLiteBlue1.jpeg'),
(84, 15, 'img_switch-lite-blue.original-228031678.jpg'),
(85, 15, 'img_nintendo-switch-lite-blue.large-2499490508.jpg'),
(86, 15, 'img_maxresdefault-4184497264.jpg'),
(87, 16, 'img_0454964NS64V3WH02_l.webp'),
(88, 16, 'img_analisis-nintendo-switch-oled-2508427-1487409988.jpg'),
(89, 16, 'img_switch-oled-box-1530977926.jpg'),
(90, 17, 'img_SNSWVAL08_l.webp'),
(91, 17, 'img_carga-juega-joy-conjpg-3958737233.jpg'),
(92, 18, 'img_45496430597_l.webp'),
(93, 18, 'img_91rnayc9sql-sl1500-11f07-4159512826.jpg'),
(94, 19, 'img_04549643PGRR_l.webp'),
(95, 20, 'img_SPSVNEG3GC_l.webp'),
(96, 20, 'img_pa.218733.10-2175641084.jpg'),
(97, 20, 'img_s-l1200-1441668164.jpg'),
(98, 20, 'img_71TJsL5wVqL._SL1500_-3134506695.jpg'),
(99, 21, 'img_3307210201669_l.jpg'),
(100, 21, 'img_maxresdefault-3827021646.jpg'),
(101, 22, 'img_4012927120088_l.webp'),
(102, 22, 'img_216719835-1908607705.jpg'),
(103, 23, 'img_SNINGBACAW002_l.webp'),
(104, 23, 'img_D_NQ_NP_960854-MLB73805607416_012024-O-3674319310.webp'),
(105, 23, 'img_D_NQ_NP_2X_665115-MLB25195695981_112016-F-1009604948.jpg'),
(106, 25, 'img_5030917027598_l.webp'),
(107, 25, 'img_s-l1600-426613892.jpg'),
(217, 98, 'img_686580175c7975.74578249.jpg'),
(218, 99, 'img_68658062ebd063.47804790.jpg'),
(219, 100, 'img_686580954fa1d6.44155101.jpg'),
(220, 101, 'img_686580c5d4a2c4.24642675.jpg'),
(221, 102, 'img_686581037bc700.59793341.jpg'),
(222, 103, 'img_68658145ace471.38514579.jpg'),
(223, 104, 'img_68658170a146d9.75882565.jpg'),
(224, 105, 'img_686581a8c952b0.13122351.jpg'),
(225, 106, 'img_686581d63337a2.25015618.jpg'),
(226, 107, 'img_68658207b2e5c1.65756193.jpg'),
(227, 108, 'img_686582376969a8.98180526.jpg'),
(228, 109, 'img_6865826140bd17.87980173.jpg'),
(229, 110, 'img_686582875433a1.07305475.jpg'),
(230, 111, 'img_686582adbe4e32.19149268.jpg'),
(231, 112, 'img_686584f8a4a6e3.81758202.jpg'),
(232, 113, 'img_686585275834e2.64609742.jpg'),
(233, 114, 'img_68658555ea1426.70273372.jpg'),
(234, 115, 'img_686585785599c5.01915973.jpg'),
(235, 116, 'img_686585a05122a2.36973331.jpg'),
(236, 117, 'img_686585e4339d62.07099423.jpg'),
(237, 118, 'img_68658614329776.65705059.jpg'),
(238, 119, 'img_6865862f78c037.86682373.jpg'),
(239, 120, 'img_6865865bbff505.49030100.jpg'),
(240, 121, 'img_686586e1000f62.41947582.jpg'),
(241, 122, 'img_686587073ea663.69674748.jpg'),
(242, 123, 'img_68658749146dd7.77475128.jpg'),
(243, 124, 'img_68658769e0c0b5.98464910.jpg'),
(244, 125, 'img_68658795896e05.55865093.jpg'),
(245, 126, 'img_686587bc1572d3.80311178.jpg'),
(246, 127, 'img_686587e0406761.53616619.jpg'),
(247, 128, 'img_686588e8af5875.05841196.jpg'),
(248, 129, 'img_6865891a77f587.67543269.jpg'),
(249, 130, 'img_68658936848e45.21835908.jpg'),
(250, 131, 'img_6865896ac9c0b5.24295446.jpg'),
(251, 132, 'img_68658988b32619.56979582.jpg'),
(252, 133, 'img_686589b9a8b552.51730003.jpg'),
(253, 134, 'img_686589de2edff2.23383184.jpg'),
(254, 135, 'img_68658a61b365b4.40210747.jpg'),
(255, 136, 'img_68658a90679131.82806766.jpg'),
(256, 137, 'img_68658aac037124.63370805.jpg'),
(258, 139, 'img_68658b67707435.53950979.jpg'),
(259, 140, 'img_68658b8f3d4ba7.03614852.jpg'),
(260, 141, 'img_68658bc437c1a0.18414608.jpg'),
(261, 142, 'img_68658c12c677b0.77277030.jpg'),
(262, 143, 'img_68658c2f2c24e1.56874598.jpg'),
(263, 144, 'img_68658c575bb989.25720472.jpg'),
(264, 145, 'img_68658c75343b84.08553720.jpg'),
(265, 146, 'img_68658c97affd52.10153414.jpg'),
(266, 147, 'img_68658cb85e15e7.89416155.jpg'),
(267, 148, 'img_68658cd42f5e44.32299930.jpg'),
(268, 149, 'img_68658ce9df2a34.25153620.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `messages`
--

CREATE TABLE `messages` (
  `id_message` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `messages`
--

INSERT INTO `messages` (`id_message`, `chat_id`, `sender_id`, `message`, `timestamp`, `is_read`) VALUES
(461, 66, 28, 'Hi, is this item available?', '2025-06-24 22:05:11', 0),
(462, 66, 28, 'Olaaa', '2025-06-24 22:05:17', 0),
(464, 66, 19, 'Oi tudo bem?', '2025-06-27 09:11:04', 1),
(465, 66, 19, 'Oi tudo bem?', '2025-06-27 09:11:32', 1),
(466, 66, 19, 'Oi tudo bem?', '2025-06-27 09:25:34', 1),
(467, 66, 19, 'Oi tudo bem?', '2025-06-27 09:25:46', 1),
(468, 66, 19, 'Oi tudo bem?', '2025-06-27 09:26:03', 1),
(469, 66, 19, 'Oi tudo bem?', '2025-06-27 09:26:42', 1),
(470, 66, 19, 'Oi tudo bem?', '2025-06-27 09:42:26', 1),
(471, 66, 19, 'Oi tudo bem?', '2025-06-27 09:42:29', 1),
(472, 66, 19, 'O produto disponível sim', '2025-06-27 09:42:46', 1),
(473, 67, 20, 'Olá, este artigo ainda está disponível?', '2025-06-27 23:00:37', 0),
(474, 67, 20, 'Olá, este artigo ainda está disponível?', '2025-06-27 23:01:03', 0),
(475, 67, 20, 'Olá, este artigo ainda está disponível?', '2025-06-27 23:02:52', 0),
(476, 67, 20, 'Olá, este artigo ainda está disponível?', '2025-06-27 23:05:03', 0),
(477, 67, 20, 'Olá, este artigo ainda está disponível?', '2025-06-28 13:21:03', 0),
(478, 67, 20, 'Olá, este artigo ', '2025-06-28 13:21:15', 0),
(479, 68, 20, 'Olá, este artigo ainda está disponível?', '2025-06-28 13:34:34', 0),
(480, 68, 20, 'Olaaa', '2025-06-29 20:20:20', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `location` varchar(255) NOT NULL,
  `status` enum('pendente','pago','cancelado') DEFAULT 'pendente',
  `shipping_status` enum('confirmado','enviado','transito','entregue','cancelado') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `user_name`, `user_phone`, `location`, `status`, `shipping_status`, `created_at`) VALUES
(66, 52, 39.96, 'Kauan Fortunato', '910937520**', 'Rua dom duarte 2', 'pago', 'enviado', '2025-06-18 20:17:15'),
(70, 52, 2.00, 'kauan fortunatoss', '910937520', 'niggaaa', 'pago', 'enviado', '2025-06-18 21:08:21'),
(71, 52, 2.00, 'kauan fortunatoss', '910937520', 'Rua Dom Duarte 2, Amadora, Portugal', 'pago', 'enviado', '2025-06-19 00:29:11'),
(72, 52, 2.00, 'kauan fortunatoss', '910937520', 'Rússia', 'pago', 'entregue', '2025-06-19 00:31:43'),
(73, 52, 10.00, 'kauan fortunatoss', '910937520', 'Nugaal, Somália', 'pendente', 'confirmado', '2025-06-19 00:34:16'),
(74, 28, 48.99, 'Mordekai', '910 937 520', 'Blatten, Suíça', 'pago', 'entregue', '2025-06-21 13:32:44'),
(75, 15, 1109.80, 'Kauan Fortunato', '910937520', 'Amadora, Portugal', 'pago', 'confirmado', '2025-06-24 10:09:45'),
(76, 20, 56.99, 'Bitman Biman', '123123123', 'Rua Dom Pedro II - Centro, Guarulhos - SP, Brasil', 'pago', 'confirmado', '2025-06-28 12:13:56'),
(77, 20, 54.92, 'Bitman Biman', '25252525', 'Rügen, Alemanha', 'pago', 'confirmado', '2025-06-28 13:38:08'),
(78, 20, 54.92, 'Bitman Biman', '123123', 'Geórgia', 'pago', 'confirmado', '2025-06-28 13:42:46'),
(79, 20, 54.92, 'Bitman Biman', '123123', 'Hyderabad, Telangana, Índia', 'pago', 'confirmado', '2025-06-28 13:43:51'),
(80, 20, 54.92, 'Bitman Biman', '123123', 'Gdansk, Polônia', 'pago', 'confirmado', '2025-06-28 13:55:30'),
(81, 20, 629.39, 'Bitman Biman', '123123123', 'Amadora, Portugal', 'pago', 'confirmado', '2025-06-28 13:56:11'),
(82, 20, 48.99, 'Bitman Biman', '645123123', 'HSR Layout, Bangalore, Karnataka, Índia', 'pago', 'confirmado', '2025-06-28 13:57:53'),
(83, 20, 48.99, 'Bitman Biman', '123123', 'Ystad, Suécia', 'pago', 'confirmado', '2025-06-28 13:59:04'),
(84, 20, 103.91, 'Bitman Biman', '123123', 'TT. Xuân Mai, Chương Mỹ, Hanói, Vietnã', 'pago', 'confirmado', '2025-06-28 14:18:02'),
(85, 20, 54.92, 'Bitman Biman', '62434346', 'Hsinchu, North District, Hsinchu City, Taiwan', 'pago', 'confirmado', '2025-06-28 16:24:03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`) VALUES
(47, 66, 23, 1, 6.00),
(48, 66, 10, 3, 11.32),
(52, 70, 22, 1, 2.00),
(53, 71, 22, 1, 2.00),
(54, 72, 22, 1, 2.00),
(55, 73, 11, 1, 10.00),
(56, 74, 12, 1, 48.99),
(57, 75, 4, 10, 110.98),
(58, 76, 12, 1, 48.99),
(59, 76, 22, 1, 2.00),
(60, 76, 23, 1, 6.00),
(61, 77, 9, 1, 54.92),
(62, 78, 9, 1, 54.92),
(63, 79, 9, 1, 54.92),
(64, 80, 9, 1, 54.92),
(65, 81, 9, 7, 54.92),
(66, 81, 12, 5, 48.99),
(67, 82, 12, 1, 48.99),
(68, 83, 12, 1, 48.99),
(69, 84, 9, 1, 54.92),
(70, 84, 12, 1, 48.99),
(71, 85, 9, 1, 54.92);

-- --------------------------------------------------------

--
-- Estrutura para tabela `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pendente','concluido','falhou') DEFAULT 'pendente',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `order_id`, `amount`, `status`, `created_at`) VALUES
(37, 52, 66, 39.96, 'concluido', '2025-06-18 20:17:15'),
(41, 52, 70, 2.00, 'concluido', '2025-06-18 21:08:21'),
(42, 52, 71, 2.00, 'concluido', '2025-06-19 00:29:11'),
(43, 52, 72, 2.00, 'concluido', '2025-06-19 00:31:43'),
(44, 52, 73, 10.00, 'concluido', '2025-06-19 00:34:16'),
(45, 28, 74, 48.99, 'concluido', '2025-06-21 13:32:44'),
(46, 15, 75, 1109.80, 'concluido', '2025-06-24 10:09:45'),
(47, 20, 76, 56.99, 'concluido', '2025-06-28 12:13:56'),
(48, 20, 78, 54.92, 'concluido', '2025-06-28 13:42:46'),
(49, 20, 80, 54.92, 'concluido', '2025-06-28 13:55:30'),
(50, 20, 81, 629.39, 'concluido', '2025-06-28 13:56:11'),
(51, 20, 82, 48.99, 'concluido', '2025-06-28 13:57:53'),
(52, 20, 83, 48.99, 'concluido', '2025-06-28 13:59:04'),
(53, 20, 84, 103.91, 'concluido', '2025-06-28 14:18:02'),
(54, 20, 85, 54.92, 'concluido', '2025-06-28 16:24:03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `products`
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
  `rating` decimal(10,1) NOT NULL DEFAULT 0.0,
  `cover` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('sold','nostock','available') NOT NULL DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `products`
--

INSERT INTO `products` (`product_id`, `user_id`, `title`, `description`, `price`, `price_before`, `category`, `quantity`, `rating`, `cover`, `location`, `created_at`, `updated_at`, `status`) VALUES
(3, 15, 'Xbox Series X, 1tb, Preto', 'A nova série Xbox Jogue milhares de jogos em quatro gerações de console – todos os jogos têm uma ótima aparência e funcionam perfeitamente no Xbox Series\nExperimente velocidade e desempenho de próxima geração com Xbox Velocity Architecture, com SSD personalizado e software integrado\nJogue milhares de jogos de quatro gerações de Xbox com compatibilidade retroativa, incluindo títulos otimizados no lançamento\nO Xbox O Game Pass Ultimate inclui mais de 100 jogos de alta qualidade para consoles, PC, dispositivos móveis Android, multijogador online e uma assinatura do EA Play por um baixo preço mensal (assinatura vendida separadamente).\nUm Xbox Smart Delivery permite que você jogue a melhor versão do seu jogo, independentemente do console que você usa', 523.02, 590.23, 'Consolas', 31, 3.0, 'img_Xbox-Series-X-Test-1987881512.jpg', NULL, '2024-12-05 20:28:39', '2025-06-29 17:55:46', 'available'),
(4, 18, 'Xbox 360', 'Console em bom estado', 110.98, 120.00, 'Consolas', 31, 3.0, 'img_Xbox-Free-Download-PNG-721582555.png', NULL, '2025-01-09 18:40:07', '2025-06-29 17:55:46', 'available'),
(5, 19, '2DS Azul/Preto', 'O Nintendo 2DS mantém muitas das mesmas características de hardware como o Nintendo DS 3 incluindo o mesmo Nintendo 3DS gameplay controla, ao contrário de compatibilidade com a vasta biblioteca existente de jogos de Nintendo DS, bem como recursos de conectividade sem fio, como acesso a Nintendo eShop, além de funcionalidade StreetPass e o SpotPass.', 85.00, 122.00, 'Retro Gaming', 1, 3.7, 'img_S2DSAZUC_l.webp', NULL, '2025-01-09 18:59:43', '2025-06-29 17:55:46', 'available'),
(6, 28, 'Grand Theft Auto V (5) 2 discos', 'Los Santos - uma alastrando sun-soaked metrópole cheio de self-help gurus, starlets, e desvanecimento celebridades, inveja do ocidental mundo, agora struggling para stay afloat em uma era de econômica incerteza e barato reality TV.\r\n\r\nAmidst o turmoil, três muito diferentes criminosos enredo suas próprias chances de sobrevivência e sucesso: Franklin, antiga rua gângster, agora procurando real oportunidades e grave dinheiro; Michael, um profissional ex-con aposentadoria é um muito menos do que ele esperança isso Seria e Trevor, um maníaco violento dirigido pela próxima grande pontuação. Ficando sem opções, a tripulação arrisca tudo em uma série de assaltos ousados e perigosas que podem defini-las pelo resto da vida.\r\n\r\nO maior, mais dinâmica e mais diversas abrir mundo jamais criado, Grand Theft Auto V combina narrativa e jogabilidade em novas formas, como jogadores repetidamente saltar dentro e fora da vida dos três personagens de chumbo do jogo, jogando todos os lados da história do jogo entrelaçadas.\r\n\r\nTodas as características clássicas da inovadora série de retorno, incluindo a incrível atenção ao detalhe e Grand Theft Auto sombriamente humorístico leve na cultura moderna, ao lado de uma abordagem nova e ambiciosa para abrir o mundo multiplayer.', 15.00, 20.00, 'Jogos', 1, 3.3, 'img_310047-grand-theft-auto-v-xbox-360-front-cover-3516295299.png', NULL, '2025-01-09 18:59:43', '2025-06-29 17:55:46', 'available'),
(7, 28, 'New Super Mario Bros 2ds', 'New Super Mario Bros características enorme vívida 2D mundos inspiraram por aqueles das aventuras de Mario clássicas, mas combinado com lindamente prestados personagens 3D que quase parecem saltar para fora da tela. Cada mundo tem um tema diferente e apresenta vários níveis, que devem ser concluídos antes de avançar para o próximo. Os jogadores também devem dominar mini fortaleza do mundo cada e bater um personagem chefe antes que podem progredir para o próximo mundo. Só depois de derrotar todos os chefes um personagem será pronto para enfrentar o derradeiro desafio do Bowser ele mesmo.', 23.00, 28.00, 'Jogos', 1, 2.8, 'img_045496463106_l.webp', NULL, '2025-01-11 23:26:18', '2025-06-29 17:55:46', 'available'),
(8, 28, 'Inazuma Eleven', 'Sequências de anime cativante enriquecem o enredo nesta aventura e os jogadores são capazes de explorar a cidade no jogo para procurar potenciais companheiros de equipe. Existem mais de 1000 personagens no jogo que você pode explorar, cada um com suas próprias estatísticas, habilidades únicas e habilidades especiais.', 18.00, 20.00, 'Jogos', 1, 2.6, 'img_045496470685_l.webp', NULL, '2025-01-11 23:26:18', '2025-06-29 17:55:46', 'available'),
(9, 15, 'PS4 Official DualShock 4 Branco Controller (V2)', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 54.92, 55.92, 'Acessórios', 31, 4.0, 'img_0711719894650_l.webp', NULL, '2025-01-11 23:29:49', '2025-07-02 19:50:23', 'available'),
(10, 15, 'Playstation Move Motion Controller V1 (CECH-ZCM 1) (PS3/PS4)', 'PlayStation Move redefine os jogos de movimento com experiência de jogo mais envolvente e realista só é possível no sistema PlayStation3. O controlador simples, fácil de usar captura uma gama completa de movimento, dando-lhe controle final sobre como você joga o jogo. Com uma variada selecção de jogos e os novos lançamento todo o tempo, pode desfrutar de horas de diversão com amigos e família.', 11.32, 12.32, 'Acessórios', 31, 2.8, 'img_SPS3ACCMOVE_l.webp', NULL, '2025-01-11 23:29:49', '2025-06-29 17:55:46', 'available'),
(11, 15, 'Xbox 360 Kinect (Sem FA)', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 10.00, NULL, 'Acessórios', 31, 3.3, 'img_S360KINSNXB_l.webp', NULL, '2025-01-11 23:29:49', '2025-06-29 17:55:46', 'available'),
(12, 15, 'Oficial Gamecube Indigo Controller', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 48.99, 71.99, 'Colecionáveis', 31, 3.8, 'img_4902370505559_l.webp', NULL, '2025-01-11 23:31:19', '2025-07-02 19:50:23', 'available'),
(13, 15, 'Gamecube, Indigo (Sem Jogo), Sem Caixa', 'Um olhar para o hardware do Nintendo Game Cube e você sabe que é diferente.\r\n\r\nA forma compacta não é apenas prática, que o projeto original é um símbolo do compromisso da Nintendo para se concentrar na criação de jogos de vídeo mais original e inovador do mundo.', 150.00, NULL, 'Colecionáveis', 31, 2.7, 'img_045496370008_l.webp', NULL, '2025-01-11 23:31:19', '2025-06-29 17:55:46', 'available'),
(14, 15, 'Gamecube, Tales of Symphonia L.E + G.B Player,(Sem Jogo)\n', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 225.00, 250.00, 'Retro Gaming', 31, 3.0, 'img_SGCUGAMETS003_l.webp', NULL, '2025-01-11 23:44:12', '2025-06-29 17:55:46', 'available'),
(15, 15, 'Nintendo Switch Lite Consola, 32GB Azul, Caixa', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 165.00, 180.00, 'Consolas', 31, 2.8, 'img_0454964NSL32BL01_l.webp', NULL, '2025-01-11 23:44:12', '2025-06-29 17:55:46', 'available'),
(16, 15, 'Switch Consola, 64GB OLED + Branca Joy-Con', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 265.00, NULL, 'Consolas', 31, 2.8, 'img_0454964NS64V3WH02_l.webp', NULL, '2025-01-11 23:44:12', '2025-06-29 17:55:46', 'available'),
(17, 15, 'Generico 3rd Party Joy-Con Comfort Grip', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 15.00, NULL, 'Acessórios', 31, 3.0, 'img_SNSWVAL08_l.webp', NULL, '2025-01-11 23:44:12', '2025-06-29 17:55:46', 'available'),
(18, 15, 'Official Nintendo Switch Preto Carry Case', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 8.00, NULL, 'Acessórios', 31, 2.8, 'img_45496430597_l.webp', NULL, '2025-01-11 23:44:12', '2025-06-29 17:55:46', 'available'),
(19, 15, 'Nintendo Switch Joy-Con Direito Verde Pastel, Sem Correia', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 42.00, NULL, 'Acessórios', 31, 3.2, 'img_04549643PGRR_l.webp', NULL, '2025-01-11 23:44:12', '2025-06-29 17:55:46', 'available'),
(20, 15, 'PS Vita Preto 3G, Descontada', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 140.00, 155.00, 'Retro Gaming', 31, 3.2, 'img_SPSVNEG3GC_l.webp', NULL, '2025-01-11 23:44:12', '2025-06-29 17:55:46', 'available'),
(21, 19, 'King Kong pc game', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 1.50, NULL, 'Jogos', 1, 3.5, 'img_3307210201669_l.jpg', NULL, '2025-01-11 23:44:12', '2025-06-29 17:55:46', 'available'),
(22, 15, 'Pro Evolution Soccer 6', 'PES6 para o PS2 é quase idênticos à versão 360 magistral: jogável através do éter, graças à compatibilidade jogar Net e PSP-para-PSP, mas com Visual de sempre-assim-ligeiramente degradada. Não importa. Pro Evolution tem sido sempre a jogabilidade e 6 tem isso tudo e muito mais. Esta vez ao redor, o sistema de disparo foi refinado. Os jogadores são capazes de assumir um pop de gol mais instintivamente do que da última vez para fora, e voleios e metade-voleios tiveram um re-vamp também. Fintas, ao contrário, dribles e reter a posse após um tackle de slide são também novos recursos para 2006. As coisas podem ficar mais físicas no PES6, com defensores fechando os atacantes muito mais em evidência, defensiva de bloqueio (legal ou ilegal) e esperto novo se transforma para os jogadores mais altamente cotados no jogo. Essas coisas levam tempo para aprender, mas é muito divertido ficar lá.', 2.00, NULL, 'Jogos', 31, 3.3, 'img_4012927120088_l.webp', NULL, '2025-01-11 23:44:12', '2025-06-29 17:55:46', 'available'),
(23, 18, 'Spider-Man 2', 'Desta vez lá é onde que você não pode ir.\n\nDois anos se passaram desde que Peter Parker primeiro hit nas ruas de Nova York como o combatente do crime em conflito Spider-Man. Agora ele encontra-se lutando contra seu vilão mais diabólico, no entanto, a mecanizada, vários tentáculos Doc Ock. O Nefasto Doc Ock foi Dr. Otto Octavius, um brilhante físico nuclear. Mas um acidente transformou-o de um pesquisador tímido para criminosos insano megalomaníaco que culpa Spider-Man para sua transformação horrível. Agora o cientista Peter uma vez idolatrado por seu notável intelecto marcou nosso lançador-web para a morte.', 6.00, NULL, 'Jogos', 31, 3.3, 'img_5030917027598_l.webp', NULL, '2025-01-11 23:44:12', '2025-06-29 17:55:46', 'available'),
(24, 22, 'Gameboy Advance, Branco', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 90.00, 100.00, 'Retro Gaming', 1, 3.5, 'img_SNINGBACAW002_l.webp', NULL, '2025-02-19 00:10:21', '2025-06-29 17:55:46', 'available'),
(105, 15, 'Mickey Mouse Magical Mirror', 'Em Mickey Mouse Magical Mirror, um fantasma travesso aprisiona um rato Mickey que anda dormindo no espelho titular. Preso em um universo alternativo que estranhamente se assemelha a sua própria casa, Mickey anseia para voltar através do espelho para sua cama e sonhos doces. Voltar não será fácil, embora Mickey deve primeiro recuperar as peças quebradas espelho que foram espalhados sobre a casa pelo poltergeist pranky.\r\n\r\nOs jovens têm a certeza de aplaudir o simples mas elegante jogo mecânica jogadores controlar uma luva, apontando e clicando para orientar Mickey para o seu próximo destino. Assim como em um autêntico Mickey cartoon, você terá que enganar os inimigos e puxar gags. Charme e grande humor resultam quando Mickey controla alguns brinquedos incríveis como faz o fantasma de fazer problemas.', 8.00, NULL, 'Jogos', 31, 4.2, 'img_686580175c7975.74578249.jpg', '', '2025-07-02 18:53:11', '2025-07-02 20:22:57', 'available'),
(106, 15, 'LEGO Marvel Super Heroes: Universe in Peril', 'Os Avengers não são os únicos a juntar as peças em LEGO Marvel Super Heroes: Universe in Peril! O Dr. Doom alia vários supervilões para criar a arma derradeira e Nick Fury vê-se obrigado a convocar super-heróis de todo o mundo para que, juntos, possam derrotar os mauzões! Será que os maiores heróis do mundo conseguirão suplantar o poder combinado de Dr. Doom, Loki, Dr. Octopus e tantos outros para salvar o planeta?\r\n\r\nO LEGO Marvel Super Heroes: Universe in Peril reúne personagens do universo Marvel, desde as favoritas dos fãs Iron Man, Spider-Man e Wolverine às menos conhecidas, tais como Squirrel Girl e Howard the Duck! Há mais de 150 super-heróis e supervilões para desbloquear, cada qual com as suas próprias habilidades e animações. O Captain America pode usar o escudo para redirecionar lasers e criar novas plataformas, e o Iron Man consegue voar, disparar mísseis e lançar o seu poderoso Unibeam do peito – e se te vires rodeado de inimigos ferozes, o Hulk esmaga-os por ti!\r\n\r\nLuta como nunca antes lutaste com o Hulk, o Abomination e outros – Minifiguras enormes com uma força inigualável! Certas personagens podem tornar-se gigantes para desferir golpes devastadores sobre os inimigos e desbloquear novas habilidades. Os jogadores mais criativos podem também inventar super-heróis personalizados ao combinar partes e poderes de várias personagens para criar uma figura única que combata o crime – ou que o cometa.', 8.00, NULL, 'Jogos', 31, 3.8, 'img_68658062ebd063.47804790.jpg', '', '2025-07-02 18:54:26', '2025-07-02 20:22:57', 'available'),
(107, 15, 'Wii Sports (Cardboard Sleeve)', 'Faz o aquecimento e entra em acção com o famoso jogo de desportos que te vai cativar desde o primeiro balançar de raquete! Wii Sports oferece cinco experiências desportivas distintas, utilizando o Comando Remoto Wii para proporcionar uma sensação natural, intuitiva e realista. No jogo de Ténis, segura o comando como se fosse uma raquete e balança-o de maneira a poderes fazer todo o tipo de jogadas jogadas batidas do lado direito ou esquerdo, bolas altas e baixas, dependendo da velocidade a que balanças e do ângulo. No jogo de Basebol, o comando é manuseado como um taco com o qual vais poder bater bolas rápidas e fazer um home run.\r\n\r\nNo Golfe, agarra o comando como se de um taco de golfe se tratasse e balança-o de forma a atirar a bola para o green. Com o Bowling, levanta o Comando Remoto Wii como se fosse mesmo uma bola de bowling, e balança os braços para a lançares. No jogo de Boxe, usa o comando Nunchuck e o Comando Remoto Wii como se fossem luvas, de maneira a fintares e soqueares os teus adversários. Independentemente de seres um desportista exímio ou um principiante, o Wii Sports é uma experiência que vais querer sempre repetir!', 8.00, NULL, 'Jogos', 31, 3.6, 'img_686580954fa1d6.44155101.jpg', '', '2025-07-02 18:55:17', '2025-07-02 20:22:57', 'available'),
(108, 15, 'Wii Fit Plus - Game Only', 'Wii Fit Plus agora vai permitir que você verifique e monitorar 4 áreas do seu físico, IMC (índice de massa corporal), centro de gravidade, e calorias queimadas durante o treino você pode então definir seus objetivos, contra essas áreas. O teste de IMC mede o seu peso/altura Wii Fit Plus tomará esta medida e deixá-lo-á saber como você justo em comparação com o ideal. Uma vez que você está ciente de seu IMC você pode definir metas para reduzir esta medida, por participar da Wii Fit Plus exercícios e apresentando um estilo de vida mais saudável. O seu centro de gravidade é medido através do Wii Fit Plus teste de idade em que você vai assumir o equilíbrio de vários em uma tentativa de manter o seu Wii Fit Plus idade tão perto ou menor do que a idade real.', 1.00, NULL, 'Jogos', 31, 4.2, 'img_686580c5d4a2c4.24642675.jpg', '', '2025-07-02 18:55:55', '2025-07-02 20:22:57', 'available'),
(109, 15, 'Wii Sports Resort (Normal DVD Case)', 'Em Wii Sports Resort és convidado a viajar até a uma soalheira ilha onde a diversão e a competição se unem e onde toda a acção desportiva pode ser controlada com um comando fantástico! Lembras-te da emoção de bateres a bola pela primeira vez em Wii Sports Tennis? Nesses primeiros momentos com o Comando Wii na tua mão, tornou-se claro que estavas perante uma nova era no mundo dos videojogos.\r\n\r\nO Wii Sports Resort eleva os controlos divertidos e intuitivos do Wii Sports original a um novo nível, introduzindo toda uma nova gama de actividades divertidas e fisicamente envolventes. Num desafio, ver-te-ás envolvido em acção de esgrima numa plataforma cercada de um mar azul tranquilo. Mas por mais apelativa que a água possa parecer, o objectivo do exercício é certificares-te de que é o teu adversário que acaba por ir parar à água! Os controlos com precisão garantem que cada movimento que fazes com a espada é reproduzido com a máxima precisão.', 19.98, NULL, 'Jogos', 31, 3.8, 'img_686581037bc700.59793341.jpg', '', '2025-07-02 18:57:07', '2025-07-02 20:22:57', 'available'),
(110, 15, 'Tomb Raider II starring Lara Croft, Platinum Ed., Perfeito', '', 46.92, NULL, 'Jogos', 31, 3.6, 'img_68658145ace471.38514579.jpg', '', '2025-07-02 18:58:06', '2025-07-02 20:22:57', 'available'),
(111, 15, 'MediEvil, Platinum Ed., Caixa', '', 30.00, NULL, 'Jogos', 31, 4.2, 'img_68658170a146d9.75882565.jpg', '', '2025-07-02 18:58:56', '2025-07-02 20:22:57', 'available'),
(112, 15, 'Final Fantasy VIII (4 Discos), Caixa', '', 35.00, NULL, 'Jogos', 31, 3.6, 'img_686581a8c952b0.13122351.jpg', '', '2025-07-02 18:59:52', '2025-07-02 20:22:57', 'available'),
(113, 15, 'Red Dead Redemption 2 (2 Disc) (Sem DLC)', 'Conhecido como Grand Theft Auto do velho oeste, dá sequência a Red Dead Redemption, trazendo muita ação numa aventura. Considerado um \"conto épico da vida no interior implacável da América\", o game sempre surpreendeu seus fãs, com a riqueza na história do game, da jogabilidade, seus personagens com suas personalidades bem marcantes e de seus mapas com suas diversas opções de exploração. Red Dead Redemption 2 o jogo possui mundo aberto, criando muito mais possibilidades para os jogadores. Sinta-se no velho oeste, a ambientação do game tenta trazer aos players uma imersão a época que o jogo se passa, utilize seus revólveres, monte em seu cavalo e explore as cidades, florestas, lagos, fazendas e muitas outras coisas presentes em Red Dead Redemption.', 28.00, NULL, 'Jogos', 31, 4.2, 'img_686581d63337a2.25015618.jpg', '', '2025-07-02 19:00:25', '2025-07-02 20:22:57', 'available'),
(114, 15, 'FIFA 17', 'FIFA 17 transforma a maneira de jogar, competir e conectar emocionalmente com o jogo. FIFA 17 submerge-lo em experiências futebol autênticos, aproveitando a sofisticação de um novo motor de jogo, enquanto introduzindo-lhe jogadores de futebol cheio de profundidade e emoção, e levá-lo a marca novos mundos acessíveis apenas no jogo. completa inovação na forma como os jogadores pensam e movimento, interagir fisicamente com os adversários, e executar no ataque permite que você possui todos os momentos em campo.', 3.50, NULL, 'Jogos', 31, 4.2, 'img_68658207b2e5c1.65756193.jpg', '', '2025-07-02 19:01:27', '2025-07-02 20:22:57', 'available'),
(115, 15, 'Mario Kart 8 Deluxe', 'Acertar a estrada com a versão definitiva do Mario Kart 8 e jogar a qualquer hora, em qualquer lugar! Corrida seus amigos ou batalha-los em um modo de batalha revista em campos de batalha novos e de retorno. Reproduza localmente em até 4 jogadores multiplayer em 1080p enquanto estiver jogando no modo TV. Além disso, os Inklings aparecem como novos personagens convidados, juntamente com os favoritos que retornam, como King Boo, Dry Bones e Bowser Jr.!', 48.00, NULL, 'Jogos', 31, 3.6, 'img_686582376969a8.98180526.jpg', '', '2025-07-02 19:02:15', '2025-07-02 20:22:57', 'available'),
(116, 15, 'Gran Turismo 5', 'Isto é sem demo ou spin-off, este é jogo que todos carro entusiastas está esperando como lendário real condução simulador finalmente rola fora da produção linha. O resultado do quatro anos trabalho por uma equipe de centenas.\r\n\r\nEscusado será dizer que o novo jogo parece surpreendente - mesmo distante melhor do que Gran Turismo 5 Prologue - mas como sempre beleza do Gran Turismo é que conduz tão realista quanto parece. Com 950 carros diferentes modelados para um maior grau de precisão do que nunca, isto também possui fabricantes mais do que qualquer outro jogo - incluindo, pela primeira vez, Lamborghini e Bugatti.\r\n\r\nOutras fã demandas que finalmente foram atendidas, incluindo totalmente realista danos-modelagem, um 16 jogadores online modo, dinâmico tempo mudanças e noite corridas. Mais realista do que isso e você iria ser nocauteado pelos vapores de gasolina.', 4.00, NULL, 'Jogos', 31, 3.6, 'img_6865826140bd17.87980173.jpg', '', '2025-07-02 19:02:57', '2025-07-02 20:23:42', 'available'),
(117, 15, 'Call of Duty: Modern Warfare (2019)', 'Acelera para uma reinvenção inovadora e orientada para a narrativa da clássica série Call Of Duty: Modern Warfare.\r\n\r\nMergulha numa inovadora e ousada encarnação da série Modern Warfare.\r\n\r\nDesenvolvido pela Infinity Ward, os criadores originais da série Modern Warfare, esta versão embarca-te numa visceral campanha de um jogador, que irá desafiar os teus limites e desbravar caminhos para esta série de jogos.\r\n\r\nEnvolve-te em vertiginosas operações secretas juntamente com um equipa internacional de operacionais especialistas e lutadores pela liberdade, abrindo o teu caminho por entre icónicos monumentos europeus e zonas voláteis do Médio Oriente.', 20.00, NULL, 'Jogos', 31, 4.2, 'img_686582875433a1.07305475.jpg', '', '2025-07-02 19:03:35', '2025-07-02 20:23:42', 'available'),
(118, 15, 'New Super Mario Bros 2', 'Mario e seus amigos do Reino do cogumelo estão nesta última parcela da série de aventura de plataforma lateral famoso. Mais recente aventura de Mario está repleto de todo a lado-desdobramento jogabilidade clássica que pode desfrutar de todas as idades. Mas o que realmente torna o padrão-ouro em divertido de plataformas é a verdadeira riqueza de novos recursos e elementos de jogabilidade.\r\n\r\nJunte-se a Mario e Luigi como você joga através de mais de 80 níveis, enfrentar novos inimigos e tentativa de alcançar o objetivo final, para coletar moedas 1 milhão. New Super Mario Bros. 2 promete entregar uma divertida aventura cheia de jogabilidade que pode desfrutar de todas as idades.', 15.00, NULL, 'Jogos', 31, 3.8, 'img_686582adbe4e32.19149268.jpg', '', '2025-07-02 19:04:13', '2025-07-02 20:23:42', 'available'),
(119, 15, 'Buzz Controllers Wired (PS2/PS3)', 'Os Buzz controladores para Playstation 2..', 25.00, NULL, 'Acessórios', 31, 3.6, 'img_686584f8a4a6e3.81758202.jpg', '', '2025-07-02 19:14:00', '2025-07-02 20:23:42', 'available'),
(120, 15, 'Official Sony PlayStation 2 DualShock 2 Controller - Prateado', '', 40.00, NULL, 'Acessórios', 31, 3.8, 'img_686585275834e2.64609742.jpg', '', '2025-07-02 19:14:47', '2025-07-02 20:23:42', 'available'),
(121, 15, 'Eye Toy Camara', 'EyeToy é uma câmera USB que representa um aprimoramento tecnológico emocionante para PlayStation 2. Ele literalmente coloca os jogadores no centro de uma experiência de jogo única. Pela primeira vez, os jogadores contará ao vivo na tela dentro do jogo em si e serão capazes de fisicamente interagir com e manipular caracteres jogo-destaque e removendo o controlador de jogos tradicionais e usando o movimento do corpo, tecnologia sem fio do EyeToy é incrivelmente simples e instantaneamente jogável, oferecendo entretenimento convincente para experientes e jogadores novatos.', 0.75, NULL, 'Acessórios', 31, 4.2, 'img_68658555ea1426.70273372.jpg', '', '2025-07-02 19:15:33', '2025-07-02 20:23:42', 'available'),
(122, 15, 'Xbox S-Controller', '', 30.00, NULL, 'Acessórios', 31, 3.8, 'img_686585785599c5.01915973.jpg', '', '2025-07-02 19:16:08', '2025-07-02 20:23:42', 'available'),
(123, 15, 'Generico XBox Remote Control + Dongle', '', 0.50, NULL, 'Acessórios', 31, 4.2, 'img_686585a05122a2.36973331.jpg', '', '2025-07-02 19:16:48', '2025-07-02 20:23:42', 'available'),
(124, 15, 'Logic3 TopDrive GT-X Wheel & Pedals', '', 12.00, NULL, 'Acessórios', 31, 3.8, 'img_686585e4339d62.07099423.jpg', '', '2025-07-02 19:17:56', '2025-07-02 20:23:42', 'available'),
(125, 15, 'Xbox360 Oficial Controller (Wireless)', 'Características:\r\nTecnologia sem fios de 2.4 GHz com alcance de 30-pés.\r\nUsar até quatro controladores simultaneamente no único console.\r\nPorta de fone de ouvido integrado para Xbox LIVE jogar.\r\nBotões de ombro direito e nova esquerda são projetados para facilidade de uso', 35.00, NULL, 'Acessórios', 31, 3.8, 'img_68658614329776.65705059.jpg', '', '2025-07-02 19:18:44', '2025-07-02 20:23:42', 'available'),
(126, 15, 'Mad Catz - Gears Of War 3 Headset', 'Com Gears do TRITTON of War 3 Dolby 7.1 Surround Sound Headset. Poderosa tecnologia Dolby Headphone empurra no meio de uma zona de guerra 3D, onde os sons de cada bala espaciais e explosão em expansão são ouvidos com extrema precisão.\r\n\r\nDiodos emissores de luz pulsante luz vermelha para fazer a mola de gráficos para a vida. E com a característica distinta de monitoramento seletivo de voz, você tem a opção de ouvir sua própria voz através de fone de ouvido.', 55.00, NULL, 'Colecionáveis', 31, 3.6, 'img_6865862f78c037.86682373.jpg', '', '2025-07-02 19:19:11', '2025-07-02 20:23:42', 'available'),
(127, 15, 'X360 Official Wireless Pad Halo Reach', 'O planeta depende de você. Dinamitar as forças da Aliança como nunca antes com o Xbox 360 Halo: controlador sem fios de alcance. Projetado pela Bungie em prata elegante e completa com um Halo: hélice de veículo atingir Banshee para seu avatar e salvar a humanidade. acessar seus jogos e mídia, ou ligar e desligar o console Xbox 360.', 55.00, NULL, 'Colecionáveis', 31, 4.2, 'img_6865865bbff505.49030100.jpg', '', '2025-07-02 19:19:55', '2025-07-02 20:23:42', 'available'),
(128, 15, 'Gamecube Memory Card 59', '', 18.00, NULL, 'Acessórios', 31, 3.8, 'img_686586e1000f62.41947582.jpg', '', '2025-07-02 19:22:08', '2025-07-02 20:23:42', 'available'),
(129, 15, 'Generico PSP Speaker Set (3rd Party)', '', 8.00, NULL, 'Acessórios', 31, 4.2, 'img_686587073ea663.69674748.jpg', '', '2025-07-02 19:22:47', '2025-07-02 20:23:42', 'available'),
(130, 15, 'Guitar Hero (Solo Guitarra Inalambrica)', 'Guitar Hero sem fio apenas guitarra para Xbox 360.', 52.00, NULL, 'Acessórios', 31, 4.2, 'img_68658749146dd7.77475128.jpg', '', '2025-07-02 19:23:53', '2025-07-02 20:26:09', 'available'),
(131, 15, 'Pokewalker', '', 58.00, NULL, 'Acessórios', 31, 3.8, 'img_68658769e0c0b5.98464910.jpg', '', '2025-07-02 19:24:25', '2025-07-02 20:26:09', 'available'),
(132, 15, 'Guitar Hero On Tour (Solo Accesorio)', '', 10.00, NULL, 'Acessórios', 31, 3.6, 'img_68658795896e05.55865093.jpg', '', '2025-07-02 19:25:09', '2025-07-02 20:26:09', 'available'),
(133, 15, 'Nintendo DS MP3 Player', 'Com o Nintendo MP3 Player, os jogadores agora só têm que carregar um dispositivo para desfrutar de dois dos seus passatempos favoritos - jogos e música. Este simples, fácil de usar acessório permite que os fãs da Nintendo desfrutar em 150 de suas músicas selecionadas, enquanto em movimento. Do cada canção título claramente listadas as informações na tela do Nintendo DS para que canções podem ser selecionadas facilmente.', 15.00, NULL, 'Acessórios', 31, 4.2, 'img_686587bc1572d3.80311178.jpg', '', '2025-07-02 19:25:48', '2025-07-02 20:26:09', 'available'),
(134, 15, 'Cargador Nintendo DS Lite Generico', '', 6.00, NULL, 'Acessórios', 31, 3.6, 'img_686587e0406761.53616619.jpg', '', '2025-07-02 19:26:24', '2025-07-02 20:26:09', 'available'),
(135, 15, 'Gameboy Advance, SP AGS-001, Mario Ed. Limitada (Sem Jogo), Descontada', '', 115.00, NULL, 'Colecionáveis', 31, 3.6, 'img_686588e8af5875.05841196.jpg', '', '2025-07-02 19:30:48', '2025-07-02 20:26:09', 'available'),
(136, 15, 'Gameboy Advance, SP AGS-001, Zelda Ed. Limitada (Sin Juego), Caixa', '', 290.00, NULL, 'Colecionáveis', 31, 4.2, 'img_6865891a77f587.67543269.jpg', '', '2025-07-02 19:31:38', '2025-07-02 20:26:09', 'available'),
(137, 15, 'Gameboy Advance, SP AGS-001, Tribal Ed. Limitada, Descontada', '', 115.00, NULL, 'Colecionáveis', 31, 3.6, 'img_68658936848e45.21835908.jpg', '', '2025-07-02 19:32:06', '2025-07-02 20:26:09', 'available'),
(138, 15, 'Sony PSone Consola, Branco, Sem Caixa', '', 75.00, NULL, 'Retro Gaming', 31, 4.2, 'img_6865896ac9c0b5.24295446.jpg', '', '2025-07-02 19:32:58', '2025-07-02 20:26:09', 'available'),
(139, 15, 'Sony Playstation Net Yaroze Consola DTL-H3002, Preto, Descontada', '', 520.00, NULL, 'Retro Gaming', 31, 3.6, 'img_68658988b32619.56979582.jpg', '', '2025-07-02 19:33:28', '2025-07-02 20:26:09', 'available'),
(140, 15, 'Gameboy Advance, Glaciar, Descontada', '', 80.00, NULL, 'Retro Gaming', 31, 3.8, 'img_686589b9a8b552.51730003.jpg', '', '2025-07-02 19:34:17', '2025-07-02 20:26:09', 'available'),
(142, 15, 'Gameboy Advance, SP AGS-001, Prateado, Descontada', '', 110.00, NULL, 'Retro Gaming', 31, 3.6, 'img_686589de2edff2.23383184.jpg', '', '2025-07-02 19:34:54', '2025-07-02 20:26:09', 'available'),
(143, 15, 'Sega Multi-Mega, Caixa', 'O Sega Multi-Mega é um sistema de videogame que combina os recursos do console Mega Drive e o complemento Mega-CD em uma unidade. Esse console da Sega garante uma experiência de jogo suave. Com um slot para cartucho e uma unidade de CD, o console Sega Multi-Mega permite reproduzir convenientemente cartuchos e CDs. Ele também suporta os formatos de áudio e CD + G CD. Construído com uma tela LCD retroiluminada e botões de controle de CD, esse console da Sega é fácil de operar.', 850.00, NULL, 'Retro Gaming', 31, 3.8, 'img_68658a61b365b4.40210747.jpg', '', '2025-07-02 19:37:05', '2025-07-02 20:26:09', 'available'),
(144, 15, 'Sega Mega CD 1, Caixa', '', 500.00, NULL, 'Retro Gaming', 31, 4.2, 'img_68658a90679131.82806766.jpg', '', '2025-07-02 19:37:52', '2025-07-02 20:26:09', 'available'),
(145, 15, 'Sega Mega Drive II (Sem Jogo), Caixa', '', 120.00, NULL, 'Retro Gaming', 31, 3.6, 'img_68658aac037124.63370805.jpg', '', '2025-07-02 19:38:20', '2025-07-02 20:26:09', 'available'),
(147, 15, 'Xbox One S 500GB Branco, Descontada', 'Joga maiores jogos line-up, incluindo Xbox 360 clássicos, em um console de 40% menor. Só não deixe que seu tamanho enganá-lo: com uma fonte de alimentação interna e até 500GB de armazenamento interno, o Xbox One S é o mais avançado Xbox nunca.', 125.00, NULL, 'Consolas', 31, 3.8, 'img_68658b67707435.53950979.jpg', '', '2025-07-02 19:41:27', '2025-07-02 20:26:09', 'available'),
(148, 15, 'Xbox One S 1TB Military Verde (Sem Jogo), Descontada', 'Joga maiores jogos line-up, incluindo Xbox 360 clássicos, em um console de 40% menor. Só não deixe que seu tamanho enganá-lo: com uma fonte de alimentação interna e até 1TB de armazenamento interno, o Xbox One S é o mais avançado Xbox nunca.', 160.00, NULL, 'Consolas', 31, 4.2, 'img_68658b8f3d4ba7.03614852.jpg', '', '2025-07-02 19:42:07', '2025-07-02 20:26:09', 'available'),
(150, 15, 'Xbox One X, 1TB, Preto, Descontada', 'O console mais poderoso do mundo.\r\nA Experiência imersiva true Gaming 4K com 40% mais poderoso do que qualquer outro console.', 170.00, NULL, 'Consolas', 31, 3.6, 'img_68658bc437c1a0.18414608.jpg', '', '2025-07-02 19:43:00', '2025-07-02 20:26:09', 'available'),
(151, 15, 'PS3 Super Slim 500GB, Descontada', 'O menor e mais leve \"Super Slim PS3\" embala toda a diversão do jogo que você esperaria do PlayStation mas numa estrutura super fina.\r\n\r\nPor alterar a arquitetura do design interno e remover o disc-fed tray para uma deslizante tampa superior do disco de carga, o \"Super Slim PS3\" é o PS3 lançado até à data.', 120.00, NULL, 'Consolas', 31, 3.8, 'img_68658c12c677b0.77277030.jpg', '', '2025-07-02 19:44:18', '2025-07-02 20:26:09', 'available'),
(152, 15, 'PS3 80GB Descontada', 'PS3 oferece a próxima geração de entretenimento interativo. Desfrute de filmes de disco Blu-ray, a alta definição de ponta de jogos, música fácil, vídeo e foto de armazenamento, acesso gratuito à PLAYSTATION rede e muito mais.', 95.00, NULL, 'Consolas', 31, 3.8, 'img_68658c2f2c24e1.56874598.jpg', '', '2025-07-02 19:44:47', '2025-07-02 20:26:09', 'available'),
(153, 15, 'PS3 Slim 320GB Vermelho, Descontada', 'Então o que ele tem de diferente? Para começar isso é muito mais leve, fresco e mais quieto do que o anterior, isso armazena muito mais!\r\n\r\nO novo Playstation 3 Slim pesa aproximadamente dois-terços do tamanho do primeiro PS3, mas embala um hard drive de duas vezes o seu tamanho original - agora confortavelmente grande320GB.', 185.00, NULL, 'Consolas', 31, 4.2, 'img_68658c575bb989.25720472.jpg', '', '2025-07-02 19:45:27', '2025-07-02 20:26:09', 'available'),
(154, 15, 'Playstation 5 Console, 825GB, Branco, Sem Caixa', '', 420.00, NULL, 'Consolas', 31, 4.2, 'img_68658c75343b84.08553720.jpg', '', '2025-07-02 19:45:57', '2025-07-02 20:26:09', 'available'),
(155, 15, 'Playstation 5 Pro, 2TB, Branco, Caixa', '', 770.00, NULL, 'Consolas', 31, 3.8, 'img_68658c97affd52.10153414.jpg', '', '2025-07-02 19:46:31', '2025-07-02 20:26:09', 'available'),
(156, 15, 'Playstation 4 Slim 1TB Preto, Caixa', 'Experimente, cores vibrantes incrivelmente vivas, com efeitos visuais deslumbrantes HDR. 30% mais fino, 16% mais leve do que o modelo PS4 originais. Todos os maiores de TV, filmes e mais de seus aplicativos de entretenimento favoritas.\r\n\r\n', 230.00, NULL, 'Consolas', 31, 3.8, 'img_68658cb85e15e7.89416155.jpg', '', '2025-07-02 19:47:04', '2025-07-02 20:26:09', 'available'),
(157, 15, 'Switch 2 Console, 256GB + Preto Joy-Con 2, (Sem DLC) Caixa', '', 470.00, NULL, 'Consolas', 31, 3.8, 'img_68658cd42f5e44.32299930.jpg', '', '2025-07-02 19:47:32', '2025-07-02 20:26:09', 'available'),
(158, 15, 'Switch 2 Console, 256GB + Preto Joy-Con 2, (Sem DLC) Descontada', '', 450.00, NULL, 'Consolas', 31, 3.8, 'img_68658ce9df2a34.25153620.jpg', '', '2025-07-02 19:47:53', '2025-07-02 20:26:09', 'available');

--
-- Acionadores `products`
--
DELIMITER $$
CREATE TRIGGER `create_gallery_afeter_product` AFTER INSERT ON `products` FOR EACH ROW BEGIN
    INSERT INTO gallery (product_id) VALUES (NEW.product_id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_quantity_zero` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN
    DECLARE tipo_vendedor VARCHAR(10);

    SELECT type INTO tipo_vendedor
    FROM users
    WHERE user_id = NEW.user_id;

    IF NEW.quantity = 0 THEN
        IF tipo_vendedor = 'admin' THEN
            SET NEW.status = 'nostock';
        ELSEIF tipo_vendedor = 'user' THEN
            SET NEW.status = 'sold';
        END IF;
    END IF;
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
-- Estrutura para tabela `products_views`
--

CREATE TABLE `products_views` (
  `product_id` int(11) NOT NULL,
  `view_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `products_views`
--

INSERT INTO `products_views` (`product_id`, `view_count`) VALUES
(3, 80),
(4, 142),
(5, 102),
(6, 85),
(7, 21),
(8, 14),
(9, 26),
(10, 28),
(11, 21),
(12, 89),
(13, 47),
(14, 22),
(15, 86),
(16, 35),
(17, 27),
(18, 85),
(19, 29),
(20, 9),
(21, 16),
(22, 29),
(23, 10),
(24, 80);

-- --------------------------------------------------------

--
-- Estrutura para tabela `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` tinyint(5) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `reviews`
--

INSERT INTO `reviews` (`review_id`, `user_id`, `product_id`, `rating`, `comment`, `created_at`) VALUES
(54, 18, 3, 3, 'Não gostei, veio com defeito.', '2024-12-18 14:20:58'),
(57, 19, 3, 3, 'Excelente produto, superou minhas expectativas!', '2025-05-02 09:49:26'),
(61, 22, 4, 2, 'Não funcionou como esperado.', '2025-05-12 10:11:07'),
(62, 19, 4, 2, 'Excelente produto, superou minhas expectativas!', '2025-02-27 20:47:13'),
(63, 20, 4, 3, 'Excelente produto, superou minhas expectativas!', '2025-05-18 02:42:38'),
(65, 20, 5, 5, 'Qualidade ótima!', '2025-05-18 00:50:24'),
(66, 15, 5, 5, 'Entrega rápida e tudo certo.', '2025-03-28 15:45:44'),
(67, 19, 5, 3, 'Muito bom pelo custo-benefício.', '2025-02-26 16:19:29'),
(70, 15, 6, 2, 'Bom, mas poderia ser melhor.', '2025-04-18 18:45:56'),
(71, 18, 6, 5, 'Entrega rápida e tudo certo.', '2025-03-11 18:30:55'),
(73, 22, 6, 1, 'Já comprei outras vezes, sempre bom.', '2025-03-10 01:29:05'),
(74, 20, 6, 5, 'Não gostei, veio com defeito.', '2025-03-16 04:04:53'),
(76, 19, 7, 3, 'Já comprei outras vezes, sempre bom.', '2025-03-21 07:42:40'),
(79, 25, 7, 2, 'Produto dentro do esperado.', '2025-03-29 09:16:42'),
(80, 22, 7, 2, 'Não gostei, veio com defeito.', '2025-04-10 14:04:44'),
(81, 18, 7, 4, 'Qualidade ótima!', '2024-12-03 08:15:54'),
(82, 19, 8, 4, 'Produto dentro do esperado.', '2025-05-07 04:12:19'),
(84, 20, 8, 2, 'Bom, mas poderia ser melhor.', '2025-05-24 08:54:22'),
(85, 15, 8, 3, 'Não recomendo esse produto.', '2025-01-27 22:11:16'),
(86, 18, 8, 1, 'Não gostei, veio com defeito.', '2024-12-09 15:13:45'),
(87, 25, 8, 3, 'Já comprei outras vezes, sempre bom.', '2025-03-05 23:10:08'),
(88, 25, 9, 4, 'Produto dentro do esperado.', '2025-03-18 01:59:03'),
(90, 19, 9, 4, 'Já comprei outras vezes, sempre bom.', '2025-02-23 20:44:29'),
(91, 15, 9, 4, 'Entrega rápida e tudo certo.', '2025-05-18 10:56:34'),
(92, 18, 9, 5, 'Muito bom pelo custo-benefício.', '2024-12-31 19:03:42'),
(94, 15, 10, 3, 'Produto dentro do esperado.', '2025-02-25 05:28:35'),
(97, 21, 10, 3, 'Excelente produto, superou minhas expectativas!', '2025-03-29 15:27:01'),
(98, 19, 10, 4, 'Não funcionou como esperado.', '2025-05-19 08:41:25'),
(99, 25, 10, 1, 'Não funcionou como esperado.', '2025-01-26 05:21:23'),
(100, 18, 11, 2, 'Já comprei outras vezes, sempre bom.', '2025-02-04 15:17:29'),
(101, 19, 11, 5, 'Produto dentro do esperado.', '2025-02-19 14:59:41'),
(102, 15, 11, 2, 'Entrega rápida e tudo certo.', '2025-01-10 02:39:34'),
(103, 22, 11, 5, 'Já comprei outras vezes, sempre bom.', '2025-02-04 20:17:00'),
(104, 21, 11, 2, 'Excelente produto, superou minhas expectativas!', '2025-01-05 00:28:06'),
(105, 20, 11, 4, 'Entrega rápida e tudo certo.', '2025-01-30 04:01:41'),
(106, 15, 12, 2, 'Produto dentro do esperado.', '2025-03-09 10:33:55'),
(108, 22, 12, 2, 'Não recomendo esse produto.', '2025-03-17 16:11:22'),
(109, 19, 12, 5, 'Produto dentro do esperado.', '2025-04-18 10:04:14'),
(110, 18, 12, 5, 'Qualidade ótima!', '2025-02-24 19:59:25'),
(111, 20, 12, 5, 'Qualidade ótima!', '2025-04-18 05:51:40'),
(112, 21, 13, 2, 'Qualidade ótima!', '2025-05-09 21:19:43'),
(114, 22, 13, 1, 'Qualidade ótima!', '2025-03-01 06:55:24'),
(115, 19, 13, 3, 'Não funcionou como esperado.', '2025-01-20 08:23:26'),
(116, 25, 13, 3, 'Qualidade ótima!', '2024-12-23 15:56:33'),
(117, 18, 13, 3, 'Não recomendo esse produto.', '2025-01-11 01:58:25'),
(118, 18, 14, 1, 'Não gostei, veio com defeito.', '2025-04-01 08:37:08'),
(119, 25, 14, 4, 'Muito bom pelo custo-benefício.', '2025-04-01 15:59:15'),
(121, 15, 14, 3, 'Não recomendo esse produto.', '2025-05-19 13:18:55'),
(122, 22, 14, 5, 'Já comprei outras vezes, sempre bom.', '2025-02-06 14:11:22'),
(123, 20, 14, 2, 'Já comprei outras vezes, sempre bom.', '2025-04-16 06:31:52'),
(125, 15, 15, 2, 'Já comprei outras vezes, sempre bom.', '2024-12-07 11:00:17'),
(126, 25, 15, 4, 'Bom, mas poderia ser melhor.', '2025-01-21 04:40:27'),
(129, 18, 15, 1, 'Já comprei outras vezes, sempre bom.', '2025-04-30 01:18:37'),
(130, 21, 16, 4, 'Bom, mas poderia ser melhor.', '2025-03-23 07:53:35'),
(132, 19, 16, 4, 'Já comprei outras vezes, sempre bom.', '2024-12-04 16:54:38'),
(134, 25, 16, 5, 'Excelente produto, superou minhas expectativas!', '2025-01-21 03:17:50'),
(135, 20, 16, 2, 'Não recomendo esse produto.', '2025-04-15 05:51:02'),
(136, 20, 17, 1, 'Não funcionou como esperado.', '2025-01-09 11:27:15'),
(137, 18, 17, 4, 'Produto dentro do esperado.', '2025-05-07 13:47:06'),
(138, 15, 17, 3, 'Bom, mas poderia ser melhor.', '2025-04-09 14:14:28'),
(142, 25, 18, 4, 'Não gostei, veio com defeito.', '2025-03-14 13:55:20'),
(143, 19, 18, 2, 'Não recomendo esse produto.', '2024-12-23 11:18:16'),
(144, 20, 18, 4, 'Produto dentro do esperado.', '2025-03-02 23:23:07'),
(145, 22, 18, 1, 'Entrega rápida e tudo certo.', '2025-05-16 05:14:30'),
(146, 15, 18, 5, 'Produto dentro do esperado.', '2025-01-18 14:56:06'),
(147, 18, 18, 1, 'Produto dentro do esperado.', '2025-03-15 17:23:25'),
(149, 20, 19, 3, 'Entrega rápida e tudo certo.', '2025-05-23 11:06:36'),
(150, 19, 19, 1, 'Não gostei, veio com defeito.', '2025-03-09 15:53:11'),
(151, 21, 19, 3, 'Excelente produto, superou minhas expectativas!', '2025-05-04 02:40:02'),
(152, 18, 19, 5, 'Já comprei outras vezes, sempre bom.', '2025-01-08 00:32:59'),
(153, 22, 19, 3, 'Qualidade ótima!', '2025-01-25 01:56:27'),
(154, 18, 20, 5, 'Produto dentro do esperado.', '2025-02-18 13:31:06'),
(156, 19, 20, 4, 'Qualidade ótima!', '2024-12-02 16:31:53'),
(158, 15, 20, 2, 'Não gostei, veio com defeito.', '2025-04-28 21:12:35'),
(159, 21, 20, 1, 'Produto dentro do esperado.', '2025-04-14 10:47:06'),
(160, 18, 21, 1, 'Não funcionou como esperado.', '2025-01-19 19:18:11'),
(161, 19, 21, 4, 'Muito bom pelo custo-benefício.', '2025-02-17 18:49:27'),
(162, 15, 21, 5, 'Qualidade ótima!', '2024-12-10 22:41:22'),
(164, 25, 21, 4, 'Não recomendo esse produto.', '2024-12-11 19:20:32'),
(166, 22, 22, 3, 'Qualidade ótima!', '2025-03-31 01:53:32'),
(167, 15, 22, 5, 'Já comprei outras vezes, sempre bom.', '2025-04-29 04:59:01'),
(168, 25, 22, 1, 'Já comprei outras vezes, sempre bom.', '2025-05-07 12:49:12'),
(169, 19, 22, 3, 'Não recomendo esse produto.', '2025-03-16 08:13:35'),
(170, 21, 22, 2, 'Não funcionou como esperado.', '2025-01-22 18:11:26'),
(171, 18, 22, 4, 'Não recomendo esse produto.', '2025-02-16 12:15:36'),
(172, 18, 23, 2, 'Entrega rápida e tudo certo.', '2025-01-06 19:49:17'),
(174, 22, 23, 5, 'Qualidade ótima!', '2025-04-02 18:52:47'),
(177, 15, 23, 3, 'Excelente produto, superou minhas expectativas!', '2025-01-16 22:12:25'),
(180, 22, 24, 1, 'Bom, mas poderia ser melhor.', '2025-02-10 11:48:40'),
(181, 20, 24, 5, 'Não gostei, veio com defeito.', '2025-01-16 10:43:36'),
(182, 15, 24, 4, 'Não funcionou como esperado.', '2025-02-08 20:37:05'),
(183, 21, 24, 1, 'Produto dentro do esperado.', '2025-02-03 16:45:56'),
(188, 52, 22, 5, 'ola2', '2025-06-18 22:01:16'),
(244, 19, 105, 4, 'O produto é bom, mas a entrega demorou um pouco.', '2025-07-02 20:22:57'),
(245, 20, 105, 5, 'Excelente produto, super recomendo! Atendeu todas as minhas expectativas.', '2025-07-02 20:22:57'),
(246, 21, 105, 3, 'O produto é razoável, mas poderia ser melhor em termos de qualidade.', '2025-07-02 20:22:57'),
(247, 22, 105, 4, 'A qualidade do produto é boa, mas achei o preço um pouco elevado.', '2025-07-02 20:22:57'),
(248, 52, 105, 5, 'Perfeito! Superou todas as minhas expectativas, adorei!', '2025-07-02 20:22:57'),
(249, 19, 106, 5, 'Produto excelente, superou minhas expectativas!', '2025-07-02 20:22:57'),
(250, 20, 106, 4, 'Produto bom, entrega dentro do prazo.', '2025-07-02 20:22:57'),
(251, 21, 106, 2, 'O produto não é o que eu esperava, deixou a desejar.', '2025-07-02 20:22:57'),
(252, 22, 106, 3, 'Produto ok, mas não é tudo isso.', '2025-07-02 20:22:57'),
(253, 52, 106, 5, 'Adorei o produto, muito bom mesmo, recomendo!', '2025-07-02 20:22:57'),
(254, 19, 107, 3, 'O produto não é ruim, mas não atendeu totalmente às minhas expectativas.', '2025-07-02 20:22:57'),
(255, 20, 107, 4, 'Bom produto, mas o acabamento poderia ser melhor.', '2025-07-02 20:22:57'),
(256, 21, 107, 5, 'Maravilhoso, superou minhas expectativas!', '2025-07-02 20:22:57'),
(257, 22, 107, 2, 'Produto fraco, não gostei muito da qualidade.', '2025-07-02 20:22:57'),
(258, 52, 107, 4, 'Produto bom, mas o preço poderia ser mais acessível.', '2025-07-02 20:22:57'),
(259, 19, 108, 4, 'A qualidade é boa, mas achei o design um pouco antiquado.', '2025-07-02 20:22:57'),
(260, 20, 108, 5, 'Excelente! Funciona muito bem e a entrega foi rápida!', '2025-07-02 20:22:57'),
(261, 21, 108, 3, 'Produto ok, mas não vale o preço cobrado.', '2025-07-02 20:22:57'),
(262, 22, 108, 5, 'Produto de excelente qualidade, totalmente recomendado!', '2025-07-02 20:22:57'),
(263, 52, 108, 4, 'Produto muito bom, mas o serviço de atendimento ao cliente deixou a desejar.', '2025-07-02 20:22:57'),
(264, 19, 109, 5, 'Produto ótimo, super recomendo!', '2025-07-02 20:22:57'),
(265, 20, 109, 2, 'Infelizmente não gostei do produto, não correspondeu às expectativas.', '2025-07-02 20:22:57'),
(266, 21, 109, 3, 'O produto é bom, mas tem algumas falhas que precisam ser corrigidas.', '2025-07-02 20:22:57'),
(267, 22, 109, 4, 'Gostei, mas o preço poderia ser mais competitivo.', '2025-07-02 20:22:57'),
(268, 52, 109, 5, 'Produto excelente, vale cada centavo!', '2025-07-02 20:22:57'),
(269, 19, 110, 4, 'Muito bom, mas o produto poderia ter mais recursos.', '2025-07-02 20:22:57'),
(270, 20, 110, 3, 'Não gostei muito, o produto deixou a desejar em alguns aspectos.', '2025-07-02 20:22:57'),
(271, 21, 110, 5, 'Perfeito, gostei muito! Recomendo para todos!', '2025-07-02 20:22:57'),
(272, 22, 110, 2, 'Achei o produto fraco e não condiz com o descrito.', '2025-07-02 20:22:57'),
(273, 52, 110, 4, 'Bom produto, mas acho que poderia ter uma versão mais barata.', '2025-07-02 20:22:57'),
(274, 19, 111, 5, 'Simplesmente incrível, superou minhas expectativas!', '2025-07-02 20:22:57'),
(275, 20, 111, 4, 'Produto muito bom, mas a embalagem poderia ser mais cuidadosa.', '2025-07-02 20:22:57'),
(276, 21, 111, 3, 'Produto ok, mas poderia ser melhor no geral.', '2025-07-02 20:22:57'),
(277, 22, 111, 5, 'Produto excelente, super funcional, recomendo muito!', '2025-07-02 20:22:57'),
(278, 52, 111, 4, 'Produto bom, mas o preço poderia ser mais acessível.', '2025-07-02 20:22:57'),
(279, 19, 112, 2, 'Não gostei do produto, a qualidade deixou a desejar.', '2025-07-02 20:22:57'),
(280, 20, 112, 5, 'Produto excelente, recomendo demais!', '2025-07-02 20:22:57'),
(281, 21, 112, 4, 'Bom produto, mas o design poderia ser mais moderno.', '2025-07-02 20:22:57'),
(282, 22, 112, 3, 'Produto razoável, mas não compraria novamente.', '2025-07-02 20:22:57'),
(283, 52, 112, 4, 'Muito bom, mas poderia ter mais opções de cores.', '2025-07-02 20:22:57'),
(284, 19, 113, 5, 'Produto perfeito, super funcional!', '2025-07-02 20:22:57'),
(285, 20, 113, 4, 'Produto bom, mas achei o preço um pouco elevado.', '2025-07-02 20:22:57'),
(286, 21, 113, 3, 'Produto mediano, não esperava muito mais por esse preço.', '2025-07-02 20:22:57'),
(287, 22, 113, 5, 'Amei o produto! Realmente fez a diferença no meu dia a dia.', '2025-07-02 20:22:57'),
(288, 52, 113, 4, 'Gostei, mas acho que poderia ser um pouco mais durável.', '2025-07-02 20:22:57'),
(289, 19, 114, 4, 'Produto bom, mas o processo de entrega poderia ser mais rápido.', '2025-07-02 20:22:57'),
(290, 20, 114, 5, 'Produto incrível, estou muito satisfeito!', '2025-07-02 20:22:57'),
(291, 21, 114, 3, 'Produto não atendeu totalmente as minhas expectativas.', '2025-07-02 20:22:57'),
(292, 22, 114, 5, 'Produto excelente, vale cada centavo!', '2025-07-02 20:22:57'),
(293, 52, 114, 4, 'Muito bom, só demorou um pouco para chegar.', '2025-07-02 20:22:57'),
(294, 19, 115, 3, 'Ok, mas poderia ser mais durável.', '2025-07-02 20:22:57'),
(295, 20, 115, 5, 'Produto excelente! Superou todas as minhas expectativas!', '2025-07-02 20:22:57'),
(296, 21, 115, 4, 'Bom produto, mas poderia ser mais barato.', '2025-07-02 20:22:57'),
(297, 22, 115, 2, 'Infelizmente, não gostei do produto, achei que poderia ser melhor.', '2025-07-02 20:22:57'),
(298, 52, 115, 4, 'Gostei, mas o design poderia ser mais moderno.', '2025-07-02 20:22:57'),
(299, 19, 116, 4, 'Produto bom, mas a embalagem poderia ser mais cuidadosa.', '2025-07-02 20:23:42'),
(300, 20, 116, 5, 'Produto excelente! Superou todas as minhas expectativas.', '2025-07-02 20:23:42'),
(301, 21, 116, 3, 'Produto razoável, mas não vale o preço.', '2025-07-02 20:23:42'),
(302, 22, 116, 2, 'Não gostei muito, o produto não funcionou como esperado.', '2025-07-02 20:23:42'),
(303, 52, 116, 4, 'Gostei, mas poderia ter mais funcionalidades.', '2025-07-02 20:23:42'),
(304, 19, 117, 5, 'Produto de excelente qualidade, super recomendo!', '2025-07-02 20:23:42'),
(305, 20, 117, 4, 'Bom produto, mas poderia ser mais durável.', '2025-07-02 20:23:42'),
(306, 21, 117, 3, 'Produto ok, mas não cumpre 100% o que promete.', '2025-07-02 20:23:42'),
(307, 22, 117, 4, 'Gostei muito, mas o preço poderia ser mais acessível.', '2025-07-02 20:23:42'),
(308, 52, 117, 5, 'Superou minhas expectativas, vale a pena cada centavo!', '2025-07-02 20:23:42'),
(309, 19, 118, 2, 'Infelizmente não gostei, a qualidade deixou a desejar.', '2025-07-02 20:23:42'),
(310, 20, 118, 5, 'Produto maravilhoso, super recomendado!', '2025-07-02 20:23:42'),
(311, 21, 118, 4, 'Bom, mas poderia ter mais recursos.', '2025-07-02 20:23:42'),
(312, 22, 118, 3, 'Produto razoável, mas o custo benefício não é tão bom.', '2025-07-02 20:23:42'),
(313, 52, 118, 5, 'Produto incrível, super funcional e de ótima qualidade!', '2025-07-02 20:23:42'),
(314, 19, 119, 4, 'Produto muito bom, mas a entrega demorou um pouco.', '2025-07-02 20:23:42'),
(315, 20, 119, 5, 'Produto perfeito, atendeu todas as minhas expectativas.', '2025-07-02 20:23:42'),
(316, 21, 119, 3, 'Produto ok, mas não faz tudo o que promete.', '2025-07-02 20:23:42'),
(317, 22, 119, 2, 'Não gostei muito, o produto não funciona bem.', '2025-07-02 20:23:42'),
(318, 52, 119, 4, 'Gostei, mas o preço é um pouco alto para o que oferece.', '2025-07-02 20:23:42'),
(319, 19, 120, 5, 'Produto sensacional! Recomendo sem dúvida!', '2025-07-02 20:23:42'),
(320, 20, 120, 3, 'Produto bom, mas achei o acabamento um pouco fraco.', '2025-07-02 20:23:42'),
(321, 21, 120, 4, 'Muito bom! Mas poderia ter mais opções de cores.', '2025-07-02 20:23:42'),
(322, 22, 120, 2, 'Produto não correspondeu às minhas expectativas.', '2025-07-02 20:23:42'),
(323, 52, 120, 5, 'Excelente produto, vale a pena cada centavo!', '2025-07-02 20:23:42'),
(324, 19, 121, 4, 'Produto bom, mas poderia ser mais resistente.', '2025-07-02 20:23:42'),
(325, 20, 121, 5, 'Excelente! Produto de alta qualidade, recomendo muito.', '2025-07-02 20:23:42'),
(326, 21, 121, 3, 'Produto razoável, mas o preço é um pouco alto.', '2025-07-02 20:23:42'),
(327, 22, 121, 4, 'Gostei, mas poderia ter mais funcionalidades.', '2025-07-02 20:23:42'),
(328, 52, 121, 5, 'Produto maravilhoso, super funcional e eficiente!', '2025-07-02 20:23:42'),
(329, 19, 122, 2, 'Não gostei, o produto não funcionou como esperado.', '2025-07-02 20:23:42'),
(330, 20, 122, 5, 'Incrível! Superou todas as minhas expectativas!', '2025-07-02 20:23:42'),
(331, 21, 122, 4, 'Produto bom, mas poderia ser mais durável.', '2025-07-02 20:23:42'),
(332, 22, 122, 3, 'Produto ok, mas não vale o preço cobrado.', '2025-07-02 20:23:42'),
(333, 52, 122, 5, 'Produto fantástico, vale muito a pena!', '2025-07-02 20:23:42'),
(334, 19, 123, 4, 'Muito bom, mas o design poderia ser mais moderno.', '2025-07-02 20:23:42'),
(335, 20, 123, 5, 'Produto excelente, estou muito satisfeito!', '2025-07-02 20:23:42'),
(336, 21, 123, 3, 'Ok, mas poderia ser mais durável e ter mais opções.', '2025-07-02 20:23:42'),
(337, 22, 123, 4, 'Produto bom, mas o preço poderia ser mais acessível.', '2025-07-02 20:23:42'),
(338, 52, 123, 5, 'Super recomendo, vale a pena o investimento!', '2025-07-02 20:23:42'),
(339, 19, 124, 2, 'Infelizmente não gostei do produto, ele não funciona como prometido.', '2025-07-02 20:23:42'),
(340, 20, 124, 5, 'Produto excelente! Super funcional, recomendo a todos!', '2025-07-02 20:23:42'),
(341, 21, 124, 3, 'Produto razoável, mas poderia ser mais durável e melhorar o design.', '2025-07-02 20:23:42'),
(342, 22, 124, 4, 'Gostei, mas o preço poderia ser mais baixo.', '2025-07-02 20:23:42'),
(343, 52, 124, 5, 'Maravilhoso, atendeu a todas as minhas necessidades!', '2025-07-02 20:23:42'),
(344, 19, 125, 3, 'Bom, mas poderia ser mais resistente.', '2025-07-02 20:23:42'),
(345, 20, 125, 5, 'Produto excelente, vale cada centavo!', '2025-07-02 20:23:42'),
(346, 21, 125, 4, 'Muito bom! Só o preço que poderia ser mais acessível.', '2025-07-02 20:23:42'),
(347, 22, 125, 2, 'Não gostei, não correspondeu ao que esperava.', '2025-07-02 20:23:42'),
(348, 52, 125, 5, 'Produto incrível, realmente me surpreendeu!', '2025-07-02 20:23:42'),
(349, 19, 126, 4, 'Produto bom, mas acho que o acabamento poderia ser melhor.', '2025-07-02 20:23:42'),
(350, 20, 126, 5, 'Excelente produto, super recomendo!', '2025-07-02 20:23:42'),
(351, 21, 126, 3, 'Produto ok, mas não tem grande diferencial.', '2025-07-02 20:23:42'),
(352, 22, 126, 2, 'Produto fraco, não atendeu minhas expectativas.', '2025-07-02 20:23:42'),
(353, 52, 126, 4, 'Gostei muito do produto, mas acho que o preço poderia ser mais acessível.', '2025-07-02 20:23:42'),
(354, 19, 127, 5, 'Produto sensacional! Realmente vale a pena comprar!', '2025-07-02 20:23:42'),
(355, 20, 127, 4, 'Produto muito bom, mas a entrega demorou um pouco.', '2025-07-02 20:23:42'),
(356, 21, 127, 3, 'Produto bom, mas o preço é alto para a qualidade oferecida.', '2025-07-02 20:23:42'),
(357, 22, 127, 4, 'Gostei muito do produto, mas poderia ter mais opções de cores.', '2025-07-02 20:23:42'),
(358, 52, 127, 5, 'Excelente! Superou todas as minhas expectativas!', '2025-07-02 20:23:42'),
(359, 19, 128, 2, 'Produto não atendeu às minhas expectativas, qualidade baixa.', '2025-07-02 20:23:42'),
(360, 20, 128, 5, 'Produto incrível, recomendo a todos sem hesitar!', '2025-07-02 20:23:42'),
(361, 21, 128, 4, 'Produto bom, mas o acabamento poderia ser melhor.', '2025-07-02 20:23:42'),
(362, 22, 128, 3, 'Produto ok, mas o preço não justifica a qualidade.', '2025-07-02 20:23:42'),
(363, 52, 128, 5, 'Produto de ótima qualidade, vale muito a pena!', '2025-07-02 20:23:42'),
(364, 19, 129, 4, 'Produto bom, mas poderia ser mais resistente.', '2025-07-02 20:23:42'),
(365, 20, 129, 5, 'Perfeito, atendeu totalmente minhas expectativas!', '2025-07-02 20:23:42'),
(366, 21, 129, 3, 'Produto razoável, mas não sei se compraria novamente.', '2025-07-02 20:23:42'),
(367, 22, 129, 4, 'Muito bom, mas poderia ter mais funcionalidades.', '2025-07-02 20:23:42'),
(368, 52, 129, 5, 'Incrível, super funcional e de alta qualidade!', '2025-07-02 20:23:42'),
(644, 19, 130, 5, 'Produto excelente! Atendeu todas as minhas expectativas.', '2025-07-02 20:26:09'),
(645, 20, 130, 4, 'Muito bom, mas o preço poderia ser mais acessível.', '2025-07-02 20:26:09'),
(646, 21, 130, 3, 'Produto razoável, mas não é tudo isso que anunciam.', '2025-07-02 20:26:09'),
(647, 22, 130, 5, 'Perfeito! Super recomendo para todos!', '2025-07-02 20:26:09'),
(648, 52, 130, 4, 'Gostei muito do produto, mas a entrega poderia ser mais rápida.', '2025-07-02 20:26:09'),
(649, 19, 131, 2, 'Infelizmente não gostei, a qualidade não correspondeu ao esperado.', '2025-07-02 20:26:09'),
(650, 20, 131, 4, 'Produto bom, mas poderia ter mais funcionalidades.', '2025-07-02 20:26:09'),
(651, 21, 131, 5, 'Excelente! Produto de alta qualidade, super recomendo!', '2025-07-02 20:26:09'),
(652, 22, 131, 3, 'Produto ok, mas o preço não vale a qualidade oferecida.', '2025-07-02 20:26:09'),
(653, 52, 131, 5, 'Produto maravilhoso, vale cada centavo!', '2025-07-02 20:26:09'),
(654, 19, 132, 3, 'Produto razoável, mas tem alguns pontos a melhorar.', '2025-07-02 20:26:09'),
(655, 20, 132, 4, 'Produto muito bom, atendeu minhas necessidades.', '2025-07-02 20:26:09'),
(656, 21, 132, 5, 'Simplesmente perfeito! Super recomendo!', '2025-07-02 20:26:09'),
(657, 22, 132, 2, 'Não gostei, o produto não funcionou bem para mim.', '2025-07-02 20:26:09'),
(658, 52, 132, 4, 'Bom, mas poderia ser mais durável.', '2025-07-02 20:26:09'),
(659, 19, 133, 4, 'Produto bom, mas poderia ter mais opções de cores.', '2025-07-02 20:26:09'),
(660, 20, 133, 5, 'Excelente! Superou todas as minhas expectativas!', '2025-07-02 20:26:09'),
(661, 21, 133, 3, 'Produto bom, mas o acabamento poderia ser melhor.', '2025-07-02 20:26:09'),
(662, 22, 133, 4, 'Gostei muito, mas achei o preço um pouco alto.', '2025-07-02 20:26:09'),
(663, 52, 133, 5, 'Perfeito! Atendeu todas as minhas expectativas!', '2025-07-02 20:26:09'),
(664, 19, 134, 5, 'Produto sensacional! Amei! Vale a pena cada centavo.', '2025-07-02 20:26:09'),
(665, 20, 134, 3, 'Produto ok, mas poderia ser mais durável e resistente.', '2025-07-02 20:26:09'),
(666, 21, 134, 4, 'Muito bom! Só o preço que poderia ser mais acessível.', '2025-07-02 20:26:09'),
(667, 22, 134, 2, 'Infelizmente não gostei, a qualidade deixou a desejar.', '2025-07-02 20:26:09'),
(668, 52, 134, 4, 'Produto muito bom, mas poderia ter mais recursos.', '2025-07-02 20:26:09'),
(669, 19, 135, 4, 'Bom, mas o preço poderia ser mais baixo.', '2025-07-02 20:26:09'),
(670, 20, 135, 5, 'Excelente! Produto muito bom, super recomendo!', '2025-07-02 20:26:09'),
(671, 21, 135, 3, 'Produto razoável, mas não tem grande diferencial.', '2025-07-02 20:26:09'),
(672, 22, 135, 2, 'Não gostei muito, achei que poderia ser melhor.', '2025-07-02 20:26:09'),
(673, 52, 135, 4, 'Gostei, mas achei o produto um pouco frágil.', '2025-07-02 20:26:09'),
(674, 19, 136, 5, 'Perfeito! Superou todas as minhas expectativas!', '2025-07-02 20:26:09'),
(675, 20, 136, 4, 'Produto bom, mas poderia ser mais durável.', '2025-07-02 20:26:09'),
(676, 21, 136, 3, 'Produto ok, mas o custo-benefício não é o melhor.', '2025-07-02 20:26:09'),
(677, 22, 136, 4, 'Muito bom, mas o design poderia ser mais moderno.', '2025-07-02 20:26:09'),
(678, 52, 136, 5, 'Produto excelente, muito satisfeito com a compra!', '2025-07-02 20:26:09'),
(679, 19, 137, 4, 'Produto bom, mas achei o preço um pouco elevado.', '2025-07-02 20:26:09'),
(680, 20, 137, 5, 'Excelente! Produto de ótima qualidade, recomendo!', '2025-07-02 20:26:09'),
(681, 21, 137, 3, 'Produto razoável, mas poderia ser mais resistente.', '2025-07-02 20:26:09'),
(682, 22, 137, 2, 'Infelizmente não gostei, achei que poderia ser melhor.', '2025-07-02 20:26:09'),
(683, 52, 137, 4, 'Gostei muito do produto, mas o processo de entrega demorou um pouco.', '2025-07-02 20:26:09'),
(684, 19, 138, 5, 'Produto excelente, super recomendo!', '2025-07-02 20:26:09'),
(685, 20, 138, 3, 'Bom produto, mas poderia ser mais durável.', '2025-07-02 20:26:09'),
(686, 21, 138, 4, 'Gostei, mas o preço poderia ser mais acessível.', '2025-07-02 20:26:09'),
(687, 22, 138, 5, 'Muito bom, super funcional, gostei bastante!', '2025-07-02 20:26:09'),
(688, 52, 138, 4, 'Produto muito bom, mas a embalagem poderia ser mais cuidadosa.', '2025-07-02 20:26:09'),
(689, 19, 139, 2, 'Não gostei do produto, não cumpriu o prometido.', '2025-07-02 20:26:09'),
(690, 20, 139, 4, 'Produto bom, mas poderia ser mais resistente.', '2025-07-02 20:26:09'),
(691, 21, 139, 5, 'Excelente! Produto de alta qualidade, recomendo!', '2025-07-02 20:26:09'),
(692, 22, 139, 3, 'Produto razoável, mas não sei se compraria novamente.', '2025-07-02 20:26:09'),
(693, 52, 139, 4, 'Muito bom, mas acho que poderia ser mais durável.', '2025-07-02 20:26:09'),
(694, 19, 140, 5, 'Perfeito! Produto de excelente qualidade!', '2025-07-02 20:26:09'),
(695, 20, 140, 4, 'Produto bom, mas o acabamento poderia ser melhor.', '2025-07-02 20:26:09'),
(696, 21, 140, 3, 'Produto razoável, mas poderia ser melhor.', '2025-07-02 20:26:09'),
(697, 22, 140, 2, 'Não gostei muito, o produto não atendeu minhas expectativas.', '2025-07-02 20:26:09'),
(698, 52, 140, 5, 'Excelente produto, super funcional!', '2025-07-02 20:26:09'),
(699, 19, 142, 3, 'Produto bom, mas o acabamento deixou a desejar.', '2025-07-02 20:26:09'),
(700, 20, 142, 4, 'Produto bom, mas o preço poderia ser mais acessível.', '2025-07-02 20:26:09'),
(701, 21, 142, 5, 'Excelente, vale a pena cada centavo!', '2025-07-02 20:26:09'),
(702, 22, 142, 2, 'Produto não atendeu minhas expectativas, não compraria novamente.', '2025-07-02 20:26:09'),
(703, 52, 142, 4, 'Muito bom, mas poderia ter mais funcionalidades.', '2025-07-02 20:26:09'),
(704, 19, 143, 5, 'Produto perfeito! Super recomendo!', '2025-07-02 20:26:09'),
(705, 20, 143, 4, 'Muito bom, mas o design poderia ser mais moderno.', '2025-07-02 20:26:09'),
(706, 21, 143, 3, 'Produto razoável, mas o custo-benefício não é o melhor.', '2025-07-02 20:26:09'),
(707, 22, 143, 2, 'Não gostei, o produto não funcionou como eu esperava.', '2025-07-02 20:26:09'),
(708, 52, 143, 5, 'Produto incrível, recomendo a todos!', '2025-07-02 20:26:09'),
(709, 19, 144, 4, 'Bom produto, mas poderia ser mais durável.', '2025-07-02 20:26:09'),
(710, 20, 144, 5, 'Excelente! Produto super funcional e de alta qualidade.', '2025-07-02 20:26:09'),
(711, 21, 144, 3, 'Produto ok, mas não atendeu totalmente minhas expectativas.', '2025-07-02 20:26:09'),
(712, 22, 144, 4, 'Gostei muito, mas o preço poderia ser mais acessível.', '2025-07-02 20:26:09'),
(713, 52, 144, 5, 'Produto de ótima qualidade, vale cada centavo!', '2025-07-02 20:26:09'),
(714, 19, 145, 2, 'Não gostei muito, o produto não funcionou como eu esperava.', '2025-07-02 20:26:09'),
(715, 20, 145, 4, 'Produto bom, mas o acabamento poderia ser melhor.', '2025-07-02 20:26:09'),
(716, 21, 145, 3, 'Produto razoável, mas o custo-benefício não é o melhor.', '2025-07-02 20:26:09'),
(717, 22, 145, 5, 'Produto maravilhoso, super recomendo!', '2025-07-02 20:26:09'),
(718, 52, 145, 4, 'Produto bom, mas poderia ter mais funcionalidades.', '2025-07-02 20:26:09'),
(719, 19, 147, 5, 'Produto excelente, super recomendo para todos!', '2025-07-02 20:26:09'),
(720, 20, 147, 4, 'Bom produto, mas o preço poderia ser mais baixo.', '2025-07-02 20:26:09'),
(721, 21, 147, 3, 'Produto ok, mas a qualidade poderia ser melhor.', '2025-07-02 20:26:09'),
(722, 22, 147, 2, 'Não gostei, o produto não funcionou como eu esperava.', '2025-07-02 20:26:09'),
(723, 52, 147, 5, 'Produto de excelente qualidade, vale cada centavo!', '2025-07-02 20:26:09'),
(724, 19, 148, 4, 'Produto muito bom, mas poderia ser mais durável.', '2025-07-02 20:26:09'),
(725, 20, 148, 5, 'Produto excelente, vale muito a pena!', '2025-07-02 20:26:09'),
(726, 21, 148, 3, 'Produto razoável, mas o custo-benefício não é o melhor.', '2025-07-02 20:26:09'),
(727, 22, 148, 5, 'Produto maravilhoso, super recomendo!', '2025-07-02 20:26:09'),
(728, 52, 148, 4, 'Bom produto, mas poderia ser mais resistente.', '2025-07-02 20:26:09'),
(729, 19, 150, 4, 'Produto bom, mas o acabamento poderia ser melhor.', '2025-07-02 20:26:09'),
(730, 20, 150, 5, 'Excelente produto, recomendo a todos!', '2025-07-02 20:26:09'),
(731, 21, 150, 3, 'Produto razoável, mas poderia ser mais durável.', '2025-07-02 20:26:09'),
(732, 22, 150, 2, 'Infelizmente não gostei, achei que poderia ser melhor.', '2025-07-02 20:26:09'),
(733, 52, 150, 4, 'Bom produto, mas o processo de entrega demorou um pouco.', '2025-07-02 20:26:09'),
(734, 19, 151, 3, 'Produto ok, mas não vale o preço cobrado.', '2025-07-02 20:26:09'),
(735, 20, 151, 5, 'Produto excelente! Super recomendo!', '2025-07-02 20:26:09'),
(736, 21, 151, 4, 'Produto muito bom, mas o preço poderia ser mais acessível.', '2025-07-02 20:26:09'),
(737, 22, 151, 2, 'Não gostei, não cumpriu o prometido.', '2025-07-02 20:26:09'),
(738, 52, 151, 5, 'Produto incrível, vale muito a pena!', '2025-07-02 20:26:09'),
(739, 19, 152, 4, 'Produto muito bom, mas poderia ser mais resistente.', '2025-07-02 20:26:09'),
(740, 20, 152, 5, 'Produto maravilhoso! Super funcional!', '2025-07-02 20:26:09'),
(741, 21, 152, 3, 'Produto razoável, mas poderia ter mais recursos.', '2025-07-02 20:26:09'),
(742, 22, 152, 2, 'Não gostei, o produto não atendeu minhas expectativas.', '2025-07-02 20:26:09'),
(743, 52, 152, 5, 'Perfeito! Super recomendo!', '2025-07-02 20:26:09'),
(744, 19, 153, 5, 'Produto incrível, super funcional, recomendo!', '2025-07-02 20:26:09'),
(745, 20, 153, 4, 'Muito bom, mas o acabamento poderia ser mais refinado.', '2025-07-02 20:26:09'),
(746, 21, 153, 3, 'Produto bom, mas tem alguns pontos a melhorar.', '2025-07-02 20:26:09'),
(747, 22, 153, 5, 'Excelente, vale muito a pena!', '2025-07-02 20:26:09'),
(748, 52, 153, 4, 'Gostei muito, mas poderia ser mais durável.', '2025-07-02 20:26:09'),
(749, 19, 154, 4, 'Produto bom, mas o preço poderia ser mais acessível.', '2025-07-02 20:26:09'),
(750, 20, 154, 5, 'Excelente produto, super recomendo!', '2025-07-02 20:26:09'),
(751, 21, 154, 3, 'Produto razoável, mas o custo-benefício não é o melhor.', '2025-07-02 20:26:09'),
(752, 22, 154, 5, 'Perfeito! Super recomendo para todos!', '2025-07-02 20:26:09'),
(753, 52, 154, 4, 'Produto muito bom, mas poderia ter mais funcionalidades.', '2025-07-02 20:26:09'),
(754, 19, 155, 2, 'Produto não atendeu minhas expectativas, qualidade baixa.', '2025-07-02 20:26:09'),
(755, 20, 155, 5, 'Produto maravilhoso, super recomendo!', '2025-07-02 20:26:09'),
(756, 21, 155, 4, 'Bom, mas poderia ter mais opções de cores.', '2025-07-02 20:26:09'),
(757, 22, 155, 3, 'Produto ok, mas poderia ser mais durável.', '2025-07-02 20:26:09'),
(758, 52, 155, 5, 'Produto incrível, vale cada centavo!', '2025-07-02 20:26:09'),
(759, 19, 156, 4, 'Produto bom, mas o acabamento poderia ser melhor.', '2025-07-02 20:26:09'),
(760, 20, 156, 5, 'Excelente! Produto de alta qualidade!', '2025-07-02 20:26:09'),
(761, 21, 156, 3, 'Produto razoável, mas não atendeu minhas expectativas.', '2025-07-02 20:26:09'),
(762, 22, 156, 2, 'Não gostei, o produto não funcionou como eu esperava.', '2025-07-02 20:26:09'),
(763, 52, 156, 5, 'Produto perfeito! Recomendo muito!', '2025-07-02 20:26:09'),
(764, 19, 157, 4, 'Produto bom, mas poderia ser mais resistente.', '2025-07-02 20:26:09'),
(765, 20, 157, 5, 'Produto excelente! Vale a pena comprar!', '2025-07-02 20:26:09'),
(766, 21, 157, 3, 'Produto ok, mas não tem grande diferencial.', '2025-07-02 20:26:09'),
(767, 22, 157, 2, 'Não gostei, o produto não funciona bem para mim.', '2025-07-02 20:26:09'),
(768, 52, 157, 5, 'Produto maravilhoso, super recomendo!', '2025-07-02 20:26:09'),
(769, 19, 158, 5, 'Produto perfeito, super funcional!', '2025-07-02 20:26:09'),
(770, 20, 158, 4, 'Muito bom, mas o preço poderia ser mais acessível.', '2025-07-02 20:26:09'),
(771, 21, 158, 3, 'Produto razoável, mas o acabamento poderia ser melhor.', '2025-07-02 20:26:09'),
(772, 22, 158, 2, 'Não gostei, o produto não atendeu minhas expectativas.', '2025-07-02 20:26:09'),
(773, 52, 158, 5, 'Produto incrível, super recomendo para todos!', '2025-07-02 20:26:09');

--
-- Acionadores `reviews`
--
DELIMITER $$
CREATE TRIGGER `update_product_rating` AFTER INSERT ON `reviews` FOR EACH ROW BEGIN
    DECLARE avg_rating DECIMAL(3,2);

    SELECT AVG(r.rating)
    INTO avg_rating
    FROM reviews r
    WHERE r.product_id = NEW.product_id;

    UPDATE products
    SET rating = avg_rating
    WHERE product_id = NEW.product_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_product_rating_after_delete` AFTER DELETE ON `reviews` FOR EACH ROW BEGIN
    DECLARE avg_rating DECIMAL(3,2);

    -- Recalcula a média considerando os reviews restantes
    SELECT AVG(r.rating)
    INTO avg_rating
    FROM reviews r
    WHERE r.product_id = OLD.product_id;

    UPDATE products
    SET rating = IFNULL(avg_rating, 0)  -- Se não houver mais reviews, define como 0
    WHERE product_id = OLD.product_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_product_rating_after_update` AFTER UPDATE ON `reviews` FOR EACH ROW BEGIN
    DECLARE avg_rating DECIMAL(3,2);

    -- Recalcula a média para o produto do review atualizado
    SELECT AVG(r.rating)
    INTO avg_rating
    FROM reviews r
    WHERE r.product_id = NEW.product_id;

    UPDATE products
    SET rating = avg_rating
    WHERE product_id = NEW.product_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `saved`
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
-- Despejando dados para a tabela `saved`
--

INSERT INTO `saved` (`saved_id`, `user_id`, `product_id`, `tipo`, `quantity`, `created_at`) VALUES
(507, 52, 23, 0, 1, '2025-06-23 15:23:12'),
(508, 52, 9, 0, 1, '2025-06-23 15:23:17'),
(509, 52, 17, 0, 1, '2025-06-23 15:23:22'),
(529, 52, 21, 1, 1, '2025-06-29 16:51:04'),
(530, 28, 16, 1, 1, '2025-07-02 11:44:27');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `firebase_uid` varchar(128) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'http://poggers.ddns.net/PoggTech-APIs/uploads/poggers-11645679-default-avatar.png',
  `phone` varchar(20) DEFAULT NULL,
  `type` enum('admin','user') NOT NULL DEFAULT 'user',
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`user_id`, `firebase_uid`, `name`, `email`, `avatar`, `phone`, `type`, `isActive`, `created_at`) VALUES
(15, 'bCXhKqZvrYTAZm867tMzpyNWWz33', 'Kauan Fortunato', 'kauanmatiasfortunato@gmail.com', 'avatar_6854376ddbd0e5.60378070.jpg', '910937520', 'admin', 1, '2024-11-27 20:52:50'),
(18, 'A2YOrJ9js0ZUcec9r9EW9o4kXEZ2', 'Diogo Dioguinho', 'sayodiggo@gmail.com', 'poggers-11645679-default-avatar.png', ' 910310242', 'admin', 1, '2024-12-02 00:17:17'),
(19, 'gO3K6796eQTMiVgss8MTarijpCg1', 'Rodrigo Alexandre', 'rodrigoalexandre@gmail.com', 'poggers-11645679-default-avatar.png', '930 463 424', 'user', 1, '2024-12-06 22:35:17'),
(20, 'sC0UoxF2GwNtSiF2dWTo9UTFxN22', 'Bitman Biman', 'bitman@gmail.com', 'avatar_68619ff63c3389.23023391.jpg', '', 'user', 1, '2024-12-06 23:42:22'),
(21, 'dbfjtKdnmdPpYoA5WfIOqbr3KOD3', 'Joao Santos', 'joaosantos@gmail.com', 'poggers-11645679-default-avatar.png', '', 'user', 1, '2024-12-09 18:02:46'),
(22, '0pFZo8kGEGgrBs780ERuVTQ94CA2', 'santos fortunato', 'santosfortunato@gmail.com', 'poggers-11645679-default-avatar.png', '', 'user', 1, '2024-12-09 18:08:58'),
(25, 'QFTTiIROtzLbSR0GpAslYStGYwD2', 'Diogo', 'diogadaesteves@gmail.com', 'poggers-11645679-default-avatar.png', '', 'user', 1, '2025-02-07 03:25:13'),
(28, '6P6mwx4gURUuk4CDPda8zQbcB1q1', 'Mordekai', 'mordekaias360@gmail.com', 'avatar_68651bf1999314.15505745.jpg', '910937520', 'user', 1, '2025-03-10 17:49:41'),
(52, 'vbxr9cOIaCUTcNezNMg6BiaqoVF3', 'Kauan Fortunato', 'kauansitesaleatorios@gmail.com', 'avatar_686186a7c69280.19976823.jpg', '910937520', 'user', 1, '2025-06-17 21:01:21'),
(56, 'mTzlbv4FhAcZVWDoI2lGdTiU7xX2', 'Kauan Fortunato', 'kauan1312@gmail.com', 'poggers-11645679-default-avatar.png', NULL, 'user', 1, '2025-06-21 22:15:03');

--
-- Acionadores `users`
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
-- Estrutura para tabela `users_tokens`
--

CREATE TABLE `users_tokens` (
  `id_token` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users_tokens`
--

INSERT INTO `users_tokens` (`id_token`, `user_id`, `token`, `create_at`) VALUES
(16, 15, 'cfqdAvsOTqurJQWIaM3Efe:APA91bGozKvoQ-OnoMCawcnIxnUJlhJJ-99KxuaQSgyAS-WZOLo10-kcR8tR3yeJHfyWoEtfTYdiVsn8IeI_67_5jn6zWOhl2bFxSUrwbRNXO7G7LPsZrqI', '2025-04-14 15:58:39'),
(38, 28, 'cNQrYoKhSM6dH3bJuAwcR8:APA91bFfhjZ0pEB_D54I_lNHUEkVzi2xl16-Xpiy7agTAy3uG4HrKWpYP1f93bV5oMzugcut77XFDkCX8Phw4xN0ygEQt_u0cPkCTBV5OjbaJ8m4tVfjMhU', '2025-06-04 08:49:10'),
(40, 28, 'f_6YJWjtQ3in1Yz7MgMSxC:APA91bGOYT-tDAmo3H29OATztCwX6JAQXpiTDJ7v2sBWr3Pa6lE262rubmRGqNdiyb0cccCYBMFkCQMQptJnuGvvdVAJjhB3iYRygT8p9cW8pIdJP2pPTOU', '2025-06-05 12:35:34'),
(108, 20, 'cfTlNz3vQ5q-M5jAGegdWG:APA91bG0FUU2f20E95el8SWL2Nlb2ltApE7RiaRfEnJLMqNDmDVjRv4bIYAb59evEms3zcNSxqjweHg-kVN2FnVBAQ07ng4beCXGNcY3r9ZCImFc0ntgkkU', '2025-06-29 20:19:51');

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_history`
--

CREATE TABLE `user_history` (
  `user_history_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `action` enum('view','buy','fav','search') NOT NULL DEFAULT 'view',
  `accessed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `user_history`
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
(949, 15, 6, 'view', '2025-06-04 12:42:28'),
(950, 15, 6, 'view', '2025-06-04 12:49:43'),
(951, 15, 6, 'view', '2025-06-04 12:51:19'),
(952, 15, 6, 'view', '2025-06-04 13:01:32'),
(953, 15, 6, 'view', '2025-06-04 13:02:25'),
(954, 15, 5, 'view', '2025-06-04 13:03:17'),
(955, 15, 5, 'view', '2025-06-04 13:06:24'),
(956, 15, 6, 'view', '2025-06-04 13:06:34'),
(957, 15, 6, 'view', '2025-06-04 13:07:36'),
(958, 15, 6, 'view', '2025-06-04 13:08:48'),
(959, 15, 6, 'view', '2025-06-04 13:10:29'),
(960, 15, 6, 'view', '2025-06-04 14:00:52'),
(961, 15, 6, 'view', '2025-06-04 14:06:30'),
(962, 15, 6, 'view', '2025-06-04 14:10:32'),
(963, 15, 6, 'view', '2025-06-04 14:13:00'),
(964, 15, 6, 'view', '2025-06-04 14:13:52'),
(965, 15, 6, 'view', '2025-06-04 14:17:20'),
(966, 15, 5, 'view', '2025-06-04 14:17:29'),
(967, 15, 5, 'view', '2025-06-04 14:18:52'),
(968, 15, 5, 'view', '2025-06-04 15:24:18'),
(969, 15, 5, 'view', '2025-06-04 15:24:44'),
(970, 15, 5, 'view', '2025-06-04 15:31:57'),
(971, 15, 5, 'view', '2025-06-04 15:32:17'),
(972, 15, 5, 'view', '2025-06-04 15:35:57'),
(973, 15, 5, 'view', '2025-06-04 15:41:17'),
(974, 15, 6, 'view', '2025-06-04 15:42:39'),
(975, 15, 6, 'view', '2025-06-04 15:42:50'),
(976, 15, 5, 'view', '2025-06-04 15:43:06'),
(977, 15, 6, 'view', '2025-06-04 15:43:12'),
(978, 15, 6, 'view', '2025-06-04 15:48:33'),
(979, 15, 6, 'view', '2025-06-04 15:49:27'),
(980, 15, 5, 'view', '2025-06-04 15:50:09'),
(981, 15, 6, 'view', '2025-06-04 15:51:06'),
(982, 15, 6, 'view', '2025-06-04 15:51:45'),
(983, 15, 6, 'view', '2025-06-04 15:53:39'),
(984, 15, 6, 'view', '2025-06-04 15:53:55'),
(985, 15, 5, 'view', '2025-06-04 15:54:43'),
(986, 15, 6, 'view', '2025-06-04 15:55:02'),
(987, 15, 6, 'view', '2025-06-04 15:56:25'),
(988, 15, 6, 'view', '2025-06-04 15:56:50'),
(989, 15, 5, 'view', '2025-06-04 15:57:05'),
(990, 15, 5, 'view', '2025-06-04 16:01:56'),
(991, 15, 5, 'view', '2025-06-04 16:02:22'),
(992, 15, 6, 'view', '2025-06-04 16:03:57'),
(993, 15, 6, 'view', '2025-06-04 16:04:03'),
(994, 15, 5, 'view', '2025-06-04 16:04:09'),
(995, 15, 5, 'view', '2025-06-04 16:05:07'),
(996, 15, 5, 'view', '2025-06-04 16:17:12'),
(997, 15, 5, 'view', '2025-06-04 16:17:55'),
(998, 15, 5, 'view', '2025-06-04 16:18:30'),
(999, 15, 5, 'view', '2025-06-04 16:19:06'),
(1000, 15, 5, 'view', '2025-06-04 16:19:42'),
(1001, 15, 5, 'view', '2025-06-04 16:21:10'),
(1002, 15, 5, 'view', '2025-06-04 16:23:04'),
(1003, 15, 5, 'view', '2025-06-04 16:24:36'),
(1004, 15, 5, 'view', '2025-06-04 16:25:36'),
(1005, 15, 5, 'view', '2025-06-04 16:27:50'),
(1006, 15, 5, 'view', '2025-06-04 16:28:11'),
(1007, 28, 19, 'view', '2025-06-04 16:31:57'),
(1008, 28, 4, 'view', '2025-06-04 16:31:59'),
(1009, 28, 5, 'view', '2025-06-04 16:32:16'),
(1010, 28, 5, 'view', '2025-06-04 16:37:39'),
(1011, 28, 5, 'view', '2025-06-04 19:53:09'),
(1012, 28, 5, 'view', '2025-06-04 19:53:50'),
(1013, 28, 5, 'view', '2025-06-04 19:54:07'),
(1014, 28, 5, 'view', '2025-06-04 19:57:09'),
(1015, 28, 5, 'view', '2025-06-04 20:00:29'),
(1016, 28, 5, 'view', '2025-06-04 20:50:54'),
(1017, 28, 5, 'view', '2025-06-05 08:27:58'),
(1018, 28, 5, 'view', '2025-06-05 08:50:58'),
(1019, 15, 5, 'view', '2025-06-05 09:04:15'),
(1020, 15, 5, 'view', '2025-06-05 09:17:42'),
(1021, 15, 5, 'view', '2025-06-05 09:19:37'),
(1022, 15, 5, 'view', '2025-06-05 09:19:54'),
(1023, 15, 4, 'view', '2025-06-05 09:22:02'),
(1024, 15, 4, 'view', '2025-06-05 09:22:11'),
(1025, 15, 4, 'view', '2025-06-05 09:25:32'),
(1026, 15, 4, 'view', '2025-06-05 09:26:47'),
(1027, 15, 5, 'view', '2025-06-05 09:28:04'),
(1028, 15, 5, 'view', '2025-06-05 09:28:45'),
(1029, 15, 5, 'view', '2025-06-05 09:29:54'),
(1030, 15, 4, 'view', '2025-06-05 09:31:25'),
(1031, 28, 13, 'view', '2025-06-05 09:41:16'),
(1032, 28, 9, 'view', '2025-06-05 09:45:17'),
(1033, 28, 9, 'view', '2025-06-05 09:45:21'),
(1034, 28, 13, 'view', '2025-06-05 09:45:25'),
(1035, 28, 13, 'view', '2025-06-05 09:45:38'),
(1036, 15, 4, 'view', '2025-06-05 10:31:06'),
(1037, 15, 4, 'view', '2025-06-05 10:44:58'),
(1038, 15, 5, 'view', '2025-06-05 10:45:16'),
(1039, 15, 5, 'view', '2025-06-05 10:47:17'),
(1040, 15, 5, 'view', '2025-06-05 10:50:25'),
(1041, 15, 5, 'view', '2025-06-05 10:50:28'),
(1042, 15, 4, 'view', '2025-06-05 10:50:51'),
(1043, 15, 5, 'view', '2025-06-05 10:51:06'),
(1044, 15, 4, 'view', '2025-06-05 10:51:30'),
(1045, 28, 19, 'view', '2025-06-05 11:05:53'),
(1046, 28, 13, 'view', '2025-06-05 11:06:18'),
(1047, 28, 5, 'view', '2025-06-05 11:06:22'),
(1048, 15, 4, 'view', '2025-06-05 11:08:35'),
(1049, 15, 4, 'view', '2025-06-05 11:33:06'),
(1050, 15, 5, 'view', '2025-06-05 11:33:11'),
(1051, 15, 5, 'view', '2025-06-05 11:33:34'),
(1052, 15, 5, 'view', '2025-06-05 11:33:49'),
(1053, 15, 5, 'view', '2025-06-05 11:35:12'),
(1054, 15, 5, 'view', '2025-06-05 11:39:08'),
(1055, 15, 5, 'view', '2025-06-05 11:39:41'),
(1056, 28, 5, 'view', '2025-06-05 12:44:43'),
(1057, 28, 5, 'view', '2025-06-05 12:54:00'),
(1058, 28, 5, 'view', '2025-06-05 12:54:53'),
(1059, 28, 5, 'view', '2025-06-05 12:57:06'),
(1060, 28, 5, 'view', '2025-06-05 12:57:25'),
(1061, 28, 5, 'view', '2025-06-05 12:58:29'),
(1062, 28, 5, 'view', '2025-06-05 14:49:44'),
(1063, 28, 15, 'view', '2025-06-05 15:03:14'),
(1064, 28, 13, 'view', '2025-06-05 15:03:21'),
(1065, 28, 13, 'view', '2025-06-05 15:03:46'),
(1066, 28, 5, 'view', '2025-06-05 15:04:13'),
(1067, 15, 4, 'view', '2025-06-05 15:51:38'),
(1068, 15, 3, 'view', '2025-06-05 15:52:35'),
(1069, 15, 3, 'view', '2025-06-05 15:52:41'),
(1070, 15, 3, 'view', '2025-06-05 15:52:44'),
(1071, 15, 16, 'view', '2025-06-05 15:53:01'),
(1072, 28, 5, 'view', '2025-06-05 15:59:31'),
(1073, 28, 5, 'view', '2025-06-05 16:03:03'),
(1074, 28, 5, 'view', '2025-06-05 16:03:15'),
(1075, 28, 5, 'view', '2025-06-05 16:05:46'),
(1076, 28, 5, 'view', '2025-06-05 16:07:03'),
(1077, 28, 5, 'view', '2025-06-05 16:08:24'),
(1078, 15, 16, 'view', '2025-06-05 16:09:09'),
(1079, 15, 16, 'view', '2025-06-05 16:11:14'),
(1080, 15, 4, 'view', '2025-06-05 16:12:33'),
(1081, 15, 4, 'view', '2025-06-05 16:12:48'),
(1082, 15, 4, 'view', '2025-06-05 16:12:54'),
(1083, 15, 4, 'view', '2025-06-05 16:13:00'),
(1084, 15, 4, 'view', '2025-06-05 16:13:08'),
(1085, 15, 4, 'view', '2025-06-05 16:17:22'),
(1094, 28, 13, 'view', '2025-06-05 22:16:45'),
(1095, 28, 24, 'view', '2025-06-05 22:18:18'),
(1096, 28, 24, 'view', '2025-06-05 22:27:24'),
(1097, 28, 24, 'view', '2025-06-05 22:27:51'),
(1098, 28, 24, 'view', '2025-06-05 22:31:27'),
(1099, 28, 24, 'view', '2025-06-05 22:32:09'),
(1100, 28, 24, 'view', '2025-06-05 22:34:52'),
(1101, 28, 24, 'view', '2025-06-05 22:36:18'),
(1102, 28, 24, 'view', '2025-06-05 22:36:22'),
(1103, 28, 24, 'view', '2025-06-05 22:36:24'),
(1104, 28, 24, 'view', '2025-06-05 22:36:27'),
(1105, 28, 24, 'view', '2025-06-05 22:37:17'),
(1106, 28, 24, 'view', '2025-06-05 22:37:19'),
(1107, 28, 24, 'view', '2025-06-05 22:37:34'),
(1108, 28, 24, 'view', '2025-06-05 22:37:36'),
(1109, 28, 24, 'view', '2025-06-05 22:37:38'),
(1110, 28, 24, 'view', '2025-06-05 22:38:33'),
(1111, 28, 24, 'view', '2025-06-05 22:38:37'),
(1112, 28, 24, 'view', '2025-06-05 22:38:41'),
(1113, 28, 24, 'view', '2025-06-05 22:39:02'),
(1114, 28, 3, 'view', '2025-06-05 22:57:24'),
(1115, 28, 3, 'view', '2025-06-05 23:00:06'),
(1116, 28, 3, 'view', '2025-06-07 13:50:42'),
(1117, 28, 3, 'view', '2025-06-07 15:03:03'),
(1118, 28, 3, 'view', '2025-06-07 15:13:03'),
(1119, 28, 3, 'view', '2025-06-07 15:16:04'),
(1120, 28, 3, 'view', '2025-06-07 15:16:23'),
(1121, 28, 3, 'view', '2025-06-07 15:16:57'),
(1122, 28, 3, 'view', '2025-06-07 15:19:15'),
(1123, 28, 3, 'view', '2025-06-07 15:20:16'),
(1124, 28, 3, 'view', '2025-06-07 15:21:40'),
(1125, 28, 3, 'view', '2025-06-07 16:26:12'),
(1126, 28, 3, 'view', '2025-06-07 16:26:17'),
(1127, 28, 3, 'view', '2025-06-07 16:26:29'),
(1128, 28, 3, 'view', '2025-06-07 16:26:39'),
(1129, 28, 3, 'view', '2025-06-07 16:33:47'),
(1130, 28, 3, 'view', '2025-06-07 16:36:32'),
(1131, 28, 13, 'view', '2025-06-07 16:36:36'),
(1132, 28, 5, 'view', '2025-06-07 16:36:50'),
(1133, 28, 5, 'view', '2025-06-07 16:37:42'),
(1134, 28, 5, 'view', '2025-06-07 16:47:50'),
(1135, 28, 5, 'view', '2025-06-07 16:56:11'),
(1136, 28, 5, 'view', '2025-06-08 22:37:54'),
(1137, 28, 5, 'view', '2025-06-08 22:38:49'),
(1138, 28, 5, 'view', '2025-06-08 22:51:57'),
(1139, 28, 5, 'view', '2025-06-08 22:55:02'),
(1140, 28, 5, 'view', '2025-06-08 22:55:25'),
(1141, 28, 5, 'view', '2025-06-08 22:57:55'),
(1142, 28, 5, 'view', '2025-06-08 22:59:43'),
(1143, 28, 5, 'view', '2025-06-08 23:01:20'),
(1144, 28, 5, 'view', '2025-06-08 23:04:18'),
(1145, 28, 5, 'view', '2025-06-08 23:05:21'),
(1146, 28, 5, 'view', '2025-06-08 23:07:58'),
(1147, 28, 5, 'view', '2025-06-08 23:08:18'),
(1148, 28, 5, 'view', '2025-06-08 23:08:34'),
(1149, 28, 5, 'view', '2025-06-08 23:11:33'),
(1150, 28, 5, 'view', '2025-06-08 23:11:43'),
(1151, 28, 5, 'view', '2025-06-09 11:12:42'),
(1152, 28, 5, 'view', '2025-06-09 11:12:46'),
(1153, 28, 13, 'view', '2025-06-09 11:13:02'),
(1154, 28, 18, 'view', '2025-06-09 11:20:17'),
(1155, 28, 12, 'view', '2025-06-09 11:20:34'),
(1156, 28, 13, 'view', '2025-06-09 11:24:10'),
(1157, 28, 13, 'view', '2025-06-09 11:24:47'),
(1158, 28, 13, 'view', '2025-06-09 11:25:00'),
(1159, 28, 13, 'view', '2025-06-09 11:26:14'),
(1161, 28, 13, 'view', '2025-06-09 13:20:48'),
(1162, 28, 13, 'view', '2025-06-09 13:21:09'),
(1163, 28, 13, 'view', '2025-06-09 13:21:12'),
(1164, 28, 13, 'view', '2025-06-09 13:24:41'),
(1165, 28, 13, 'view', '2025-06-09 13:24:44'),
(1166, 28, 12, 'view', '2025-06-09 13:24:46'),
(1167, 28, 13, 'view', '2025-06-09 13:24:49'),
(1168, 28, 13, 'view', '2025-06-09 13:25:05'),
(1169, 28, 13, 'view', '2025-06-09 13:31:12'),
(1170, 28, 13, 'view', '2025-06-09 13:31:26'),
(1171, 28, 13, 'view', '2025-06-09 13:44:06'),
(1172, 28, 13, 'view', '2025-06-09 13:52:36'),
(1173, 28, 13, 'view', '2025-06-09 13:53:14'),
(1174, 28, 13, 'view', '2025-06-09 13:53:16'),
(1175, 28, 12, 'view', '2025-06-09 13:53:21'),
(1176, 28, 12, 'view', '2025-06-09 13:58:30'),
(1177, 28, 12, 'view', '2025-06-09 13:59:44'),
(1178, 28, 12, 'view', '2025-06-09 14:05:13'),
(1179, 28, 12, 'view', '2025-06-09 14:05:31'),
(1180, 28, 12, 'view', '2025-06-09 14:08:44'),
(1181, 28, 12, 'view', '2025-06-09 14:11:28'),
(1182, 28, 12, 'view', '2025-06-09 14:12:40'),
(1183, 28, 12, 'view', '2025-06-09 14:34:14'),
(1184, 28, 12, 'view', '2025-06-09 14:39:00'),
(1185, 28, 12, 'view', '2025-06-09 14:39:26'),
(1186, 28, 12, 'view', '2025-06-09 14:43:27'),
(1187, 28, 12, 'view', '2025-06-09 14:43:34'),
(1188, 28, 12, 'view', '2025-06-09 14:46:54'),
(1189, 28, 12, 'view', '2025-06-09 14:48:23'),
(1190, 28, 12, 'view', '2025-06-09 14:48:47'),
(1191, 28, 12, 'view', '2025-06-09 14:49:26'),
(1192, 28, 12, 'view', '2025-06-09 14:49:42'),
(1193, 28, 12, 'view', '2025-06-09 14:50:47'),
(1194, 28, 12, 'view', '2025-06-09 14:54:41'),
(1195, 28, 12, 'view', '2025-06-09 14:58:36'),
(1196, 28, 12, 'view', '2025-06-09 15:01:41'),
(1197, 28, 12, 'view', '2025-06-09 16:02:58'),
(1198, 28, 12, 'view', '2025-06-09 16:03:53'),
(1199, 28, 12, 'view', '2025-06-09 16:04:41'),
(1200, 28, 12, 'view', '2025-06-09 16:04:57'),
(1201, 28, 12, 'view', '2025-06-09 16:10:48'),
(1202, 28, 12, 'view', '2025-06-09 17:52:19'),
(1203, 28, 12, 'view', '2025-06-09 17:58:06'),
(1204, 28, 12, 'view', '2025-06-09 18:03:33'),
(1205, 28, 12, 'view', '2025-06-09 18:03:44'),
(1206, 28, 12, 'view', '2025-06-09 18:03:48'),
(1207, 28, 12, 'view', '2025-06-09 18:14:18'),
(1208, 28, 12, 'view', '2025-06-09 18:17:35'),
(1209, 28, 12, 'view', '2025-06-09 18:20:57'),
(1210, 28, 12, 'view', '2025-06-09 18:30:43'),
(1211, 28, 12, 'view', '2025-06-09 18:34:00'),
(1212, 28, 12, 'view', '2025-06-09 18:34:22'),
(1213, 28, 12, 'view', '2025-06-09 18:34:57'),
(1214, 28, 12, 'view', '2025-06-09 18:36:23'),
(1215, 28, 12, 'view', '2025-06-09 18:36:55'),
(1216, 28, 12, 'view', '2025-06-09 18:37:00'),
(1217, 28, 12, 'view', '2025-06-09 18:38:07'),
(1218, 28, 12, 'view', '2025-06-09 18:38:50'),
(1219, 28, 12, 'view', '2025-06-09 18:39:30'),
(1220, 28, 12, 'view', '2025-06-09 18:44:37'),
(1221, 28, 12, 'view', '2025-06-09 18:44:54'),
(1222, 28, 12, 'view', '2025-06-09 18:47:24'),
(1223, 28, 12, 'view', '2025-06-09 18:49:06'),
(1224, 28, 12, 'view', '2025-06-09 18:49:56'),
(1225, 28, 12, 'view', '2025-06-09 18:51:33'),
(1226, 28, 12, 'view', '2025-06-09 18:53:28'),
(1227, 28, 12, 'view', '2025-06-09 18:53:41'),
(1228, 28, 12, 'view', '2025-06-09 18:54:43'),
(1229, 28, 12, 'view', '2025-06-09 18:54:54'),
(1230, 28, 5, 'view', '2025-06-09 18:55:02'),
(1231, 28, 5, 'view', '2025-06-09 18:55:05'),
(1232, 28, 13, 'view', '2025-06-09 18:55:07'),
(1233, 28, 13, 'view', '2025-06-09 18:55:10'),
(1234, 28, 13, 'view', '2025-06-09 18:57:54'),
(1235, 28, 5, 'view', '2025-06-09 19:01:29'),
(1236, 28, 13, 'view', '2025-06-09 19:01:31'),
(1237, 28, 13, 'view', '2025-06-09 19:11:28'),
(1238, 28, 13, 'view', '2025-06-09 19:21:13'),
(1239, 28, 13, 'view', '2025-06-09 19:22:24'),
(1240, 28, 13, 'view', '2025-06-09 19:22:59'),
(1241, 28, 5, 'view', '2025-06-09 19:23:07'),
(1242, 28, 5, 'view', '2025-06-09 19:23:35'),
(1243, 28, 5, 'view', '2025-06-09 19:26:14'),
(1244, 28, 5, 'view', '2025-06-09 20:06:00'),
(1245, 28, 15, 'view', '2025-06-09 20:06:02'),
(1246, 28, 15, 'view', '2025-06-09 20:06:05'),
(1247, 28, 12, 'view', '2025-06-09 20:06:41'),
(1248, 28, 12, 'view', '2025-06-09 20:06:56'),
(1249, 28, 12, 'view', '2025-06-09 20:07:03'),
(1250, 28, 12, 'view', '2025-06-09 20:12:40'),
(1251, 28, 12, 'view', '2025-06-09 20:12:43'),
(1252, 28, 12, 'view', '2025-06-09 20:12:50'),
(1253, 28, 12, 'view', '2025-06-09 20:12:58'),
(1254, 28, 12, 'view', '2025-06-09 20:13:05'),
(1255, 28, 13, 'view', '2025-06-09 20:13:13'),
(1256, 28, 13, 'view', '2025-06-09 20:23:17'),
(1257, 28, 13, 'view', '2025-06-09 20:23:22'),
(1258, 28, 13, 'view', '2025-06-09 20:53:30'),
(1259, 28, 13, 'view', '2025-06-10 12:52:54'),
(1260, 28, 13, 'view', '2025-06-10 12:53:00'),
(1261, 28, 13, 'view', '2025-06-10 12:53:04'),
(1262, 28, 13, 'view', '2025-06-10 12:53:10'),
(1263, 28, 13, 'view', '2025-06-10 12:53:13'),
(1264, 28, 12, 'view', '2025-06-10 13:23:55'),
(1265, 28, 12, 'view', '2025-06-11 09:11:12'),
(1266, 28, 20, 'view', '2025-06-11 09:11:17'),
(1267, 28, 13, 'view', '2025-06-11 09:11:26'),
(1268, 28, 12, 'view', '2025-06-11 09:11:53'),
(1269, 28, 12, 'view', '2025-06-11 09:12:03'),
(1270, 28, 12, 'view', '2025-06-11 09:12:16'),
(1271, 28, 12, 'view', '2025-06-11 09:12:18'),
(1272, 28, 12, 'view', '2025-06-11 09:12:27'),
(1273, 28, 13, 'view', '2025-06-11 09:12:31'),
(1274, 28, 12, 'view', '2025-06-11 09:12:34'),
(1275, 28, 13, 'view', '2025-06-11 09:12:43'),
(1276, 28, 12, 'view', '2025-06-11 09:12:47'),
(1277, 28, 13, 'view', '2025-06-11 09:12:52'),
(1278, 15, 21, 'view', '2025-06-11 11:56:11'),
(1279, 15, 5, 'view', '2025-06-11 11:57:20'),
(1280, 15, 4, 'view', '2025-06-11 14:23:06'),
(1281, 15, 4, 'view', '2025-06-11 14:23:13'),
(1282, 15, 4, 'view', '2025-06-11 14:25:01'),
(1283, 15, 4, 'view', '2025-06-11 14:25:10'),
(1284, 15, 4, 'view', '2025-06-11 14:25:16'),
(1285, 15, 4, 'view', '2025-06-11 14:25:21'),
(1286, 15, 4, 'view', '2025-06-11 14:25:53'),
(1287, 15, 4, 'view', '2025-06-11 14:26:13'),
(1288, 15, 5, 'view', '2025-06-11 15:17:07'),
(1289, 28, 5, 'view', '2025-06-11 17:58:34'),
(1290, 28, 13, 'view', '2025-06-11 18:29:28'),
(1291, 28, 15, 'view', '2025-06-11 18:29:31'),
(1292, 28, 20, 'view', '2025-06-11 18:29:34'),
(1293, 28, 20, 'view', '2025-06-11 18:29:37'),
(1294, 28, 5, 'view', '2025-06-11 18:29:40'),
(1295, 28, 5, 'view', '2025-06-11 18:31:14'),
(1296, 28, 5, 'view', '2025-06-11 18:32:10'),
(1297, 28, 5, 'view', '2025-06-11 18:33:59'),
(1298, 28, 5, 'view', '2025-06-11 18:34:32'),
(1299, 28, 5, 'view', '2025-06-11 18:36:38'),
(1300, 28, 5, 'view', '2025-06-11 18:36:55'),
(1301, 28, 5, 'view', '2025-06-11 18:37:18'),
(1302, 28, 5, 'view', '2025-06-11 18:37:32'),
(1303, 28, 13, 'view', '2025-06-11 21:33:43'),
(1304, 28, 13, 'view', '2025-06-11 21:38:40'),
(1305, 28, 4, 'view', '2025-06-11 21:50:20'),
(1306, 28, 5, 'view', '2025-06-11 21:50:46'),
(1307, 28, 5, 'view', '2025-06-11 21:52:48'),
(1308, 28, 5, 'view', '2025-06-11 21:54:00'),
(1309, 28, 9, 'view', '2025-06-11 22:10:22'),
(1310, 28, 9, 'view', '2025-06-11 22:28:22'),
(1311, 28, 9, 'view', '2025-06-11 22:29:14'),
(1312, 28, 9, 'view', '2025-06-12 08:13:42'),
(1313, 28, 9, 'view', '2025-06-12 08:15:09'),
(1314, 28, 9, 'view', '2025-06-12 08:15:25'),
(1315, 28, 9, 'view', '2025-06-12 08:20:20'),
(1316, 28, 9, 'view', '2025-06-12 08:20:22'),
(1317, 28, 5, 'view', '2025-06-12 08:20:25'),
(1318, 28, 9, 'view', '2025-06-12 08:20:27'),
(1319, 28, 5, 'view', '2025-06-12 08:20:28'),
(1320, 28, 9, 'view', '2025-06-12 13:48:51'),
(1321, 28, 9, 'view', '2025-06-12 13:48:53'),
(1322, 28, 5, 'view', '2025-06-12 16:00:14'),
(1323, 28, 9, 'view', '2025-06-12 16:00:22'),
(1324, 15, 5, 'view', '2025-06-12 16:00:39'),
(1325, 15, 4, 'view', '2025-06-12 16:00:42'),
(1326, 15, 21, 'view', '2025-06-12 16:00:45'),
(1327, 28, 5, 'view', '2025-06-12 16:00:53'),
(1328, 28, 24, 'view', '2025-06-12 16:01:08'),
(1329, 28, 5, 'view', '2025-06-12 16:01:22'),
(1330, 15, 21, 'view', '2025-06-12 16:01:39'),
(1331, 15, 4, 'view', '2025-06-12 16:02:00'),
(1332, 28, 5, 'view', '2025-06-12 19:28:50'),
(1333, 28, 5, 'view', '2025-06-12 19:29:30'),
(1334, 28, 5, 'view', '2025-06-12 19:30:12'),
(1335, 28, 5, 'view', '2025-06-12 19:31:26'),
(1336, 28, 5, 'view', '2025-06-12 19:31:35'),
(1337, 28, 5, 'view', '2025-06-12 19:32:35'),
(1338, 28, 5, 'view', '2025-06-12 19:32:56'),
(1339, 28, 13, 'view', '2025-06-12 19:51:50'),
(1340, 28, 4, 'view', '2025-06-12 19:52:28'),
(1341, 28, 4, 'view', '2025-06-12 20:02:00'),
(1342, 28, 4, 'view', '2025-06-12 20:04:41'),
(1343, 28, 4, 'view', '2025-06-12 20:06:06'),
(1344, 28, 4, 'view', '2025-06-12 20:06:13'),
(1345, 28, 4, 'view', '2025-06-12 20:07:44'),
(1346, 28, 5, 'view', '2025-06-12 20:07:50'),
(1347, 28, 5, 'view', '2025-06-12 20:08:37'),
(1348, 28, 5, 'view', '2025-06-12 20:10:24'),
(1349, 28, 5, 'view', '2025-06-12 20:21:51'),
(1350, 28, 4, 'view', '2025-06-12 20:22:02'),
(1351, 28, 24, 'view', '2025-06-12 20:22:06'),
(1352, 28, 5, 'view', '2025-06-12 20:22:38'),
(1353, 28, 9, 'view', '2025-06-12 20:22:41'),
(1354, 28, 9, 'view', '2025-06-12 20:26:47'),
(1355, 28, 9, 'view', '2025-06-12 20:33:22'),
(1356, 28, 9, 'view', '2025-06-12 20:34:38'),
(1357, 28, 9, 'view', '2025-06-12 20:51:22'),
(1358, 28, 9, 'view', '2025-06-12 20:53:03'),
(1359, 28, 9, 'view', '2025-06-12 20:53:20'),
(1360, 28, 9, 'view', '2025-06-12 21:11:18'),
(1361, 28, 9, 'view', '2025-06-12 21:11:47'),
(1362, 28, 9, 'view', '2025-06-12 21:13:06'),
(1363, 28, 9, 'view', '2025-06-13 00:12:18'),
(1370, 28, 13, 'view', '2025-06-13 12:29:27'),
(1372, 28, 13, 'view', '2025-06-13 12:29:37'),
(1393, 28, 12, 'view', '2025-06-13 21:06:04'),
(1394, 28, 13, 'view', '2025-06-13 21:06:13'),
(1395, 28, 13, 'view', '2025-06-13 21:06:17'),
(1396, 28, 13, 'view', '2025-06-13 21:06:19'),
(1397, 28, 13, 'view', '2025-06-13 21:08:46'),
(1398, 28, 5, 'view', '2025-06-13 21:08:57'),
(1399, 28, 5, 'view', '2025-06-13 21:21:19'),
(1400, 28, 5, 'view', '2025-06-13 21:21:22'),
(1406, 28, 18, 'view', '2025-06-14 14:13:33'),
(1407, 28, 13, 'view', '2025-06-14 15:01:57'),
(1408, 28, 12, 'view', '2025-06-14 15:16:18'),
(1409, 28, 15, 'view', '2025-06-14 15:16:22'),
(1410, 28, 12, 'view', '2025-06-14 15:23:01'),
(1414, 28, 16, 'view', '2025-06-14 16:52:46'),
(1415, 28, 20, 'view', '2025-06-14 16:54:09'),
(1417, 28, 12, 'view', '2025-06-14 16:55:30'),
(1420, 28, 12, 'view', '2025-06-14 17:47:09'),
(1421, 28, 12, 'view', '2025-06-14 21:46:25'),
(1423, 28, 12, 'view', '2025-06-14 21:46:35'),
(1425, 28, 12, 'view', '2025-06-14 21:48:07'),
(1427, 28, 12, 'view', '2025-06-14 21:53:02'),
(1430, 28, 13, 'view', '2025-06-14 22:18:13'),
(1431, 28, 13, 'view', '2025-06-14 22:18:21'),
(1433, 28, 13, 'view', '2025-06-14 22:32:41'),
(1434, 28, 13, 'view', '2025-06-14 22:34:43'),
(1435, 28, 13, 'view', '2025-06-14 22:35:58'),
(1437, 28, 12, 'view', '2025-06-15 00:27:38'),
(1438, 28, 15, 'view', '2025-06-15 00:27:41'),
(1439, 28, 13, 'view', '2025-06-15 00:37:41'),
(1440, 28, 14, 'view', '2025-06-15 00:39:08'),
(1441, 28, 14, 'view', '2025-06-15 00:45:45'),
(1442, 28, 13, 'view', '2025-06-15 00:45:50'),
(1443, 28, 13, 'view', '2025-06-15 00:47:01'),
(1444, 28, 14, 'view', '2025-06-15 00:47:04'),
(1445, 28, 15, 'view', '2025-06-15 13:12:22'),
(1451, 28, 14, 'view', '2025-06-15 14:16:30'),
(1452, 28, 14, 'view', '2025-06-15 14:17:13'),
(1453, 28, 14, 'view', '2025-06-15 14:17:25'),
(1454, 28, 14, 'view', '2025-06-15 14:18:06'),
(1455, 28, 14, 'view', '2025-06-15 14:19:25'),
(1456, 28, 14, 'view', '2025-06-15 14:32:14'),
(1457, 28, 14, 'view', '2025-06-15 14:32:22'),
(1458, 28, 20, 'view', '2025-06-15 14:32:52'),
(1459, 28, 12, 'view', '2025-06-15 14:32:56'),
(1460, 28, 15, 'view', '2025-06-15 14:34:19'),
(1461, 28, 4, 'view', '2025-06-15 14:37:24'),
(1462, 28, 24, 'view', '2025-06-15 14:37:33'),
(1463, 28, 24, 'view', '2025-06-15 14:40:30'),
(1464, 28, 24, 'view', '2025-06-15 14:41:10'),
(1465, 28, 24, 'view', '2025-06-15 14:50:41'),
(1466, 28, 24, 'view', '2025-06-15 15:10:59'),
(1467, 28, 13, 'view', '2025-06-15 15:11:18'),
(1468, 28, 14, 'view', '2025-06-15 16:27:16'),
(1469, 28, 14, 'view', '2025-06-15 16:27:20'),
(1470, 28, 14, 'view', '2025-06-15 16:28:19'),
(1471, 28, 14, 'view', '2025-06-15 16:30:16'),
(1472, 28, 14, 'view', '2025-06-15 17:00:49'),
(1473, 28, 14, 'view', '2025-06-15 17:25:50'),
(1474, 28, 13, 'view', '2025-06-15 17:25:51'),
(1475, 28, 24, 'view', '2025-06-15 17:26:00'),
(1476, 28, 13, 'view', '2025-06-15 18:00:36'),
(1477, 28, 21, 'view', '2025-06-15 18:00:47'),
(1478, 28, 22, 'view', '2025-06-15 18:00:54'),
(1479, 28, 7, 'view', '2025-06-15 18:01:01'),
(1480, 28, 21, 'view', '2025-06-15 18:01:03'),
(1481, 28, 8, 'view', '2025-06-15 18:01:06'),
(1482, 28, 7, 'view', '2025-06-15 18:01:10'),
(1486, 28, 5, 'view', '2025-06-16 00:10:22'),
(1490, 28, 5, 'view', '2025-06-16 12:06:18'),
(1491, 28, 20, 'view', '2025-06-16 12:06:28'),
(1492, 28, 20, 'view', '2025-06-16 12:11:33'),
(1493, 28, 5, 'view', '2025-06-16 12:16:00'),
(1494, 28, 4, 'view', '2025-06-16 12:21:18'),
(1495, 28, 4, 'view', '2025-06-16 12:21:23'),
(1496, 28, 16, 'view', '2025-06-16 12:21:28'),
(1497, 28, 4, 'view', '2025-06-16 12:21:54'),
(1498, 28, 16, 'view', '2025-06-16 12:22:08'),
(1499, 28, 5, 'view', '2025-06-16 12:30:13'),
(1501, 28, 13, 'view', '2025-06-16 12:39:28'),
(1502, 28, 13, 'view', '2025-06-16 14:32:33'),
(1503, 28, 13, 'view', '2025-06-16 14:33:31'),
(1504, 28, 20, 'view', '2025-06-16 14:36:04'),
(1505, 28, 6, 'view', '2025-06-16 14:37:12'),
(1506, 28, 6, 'view', '2025-06-16 14:37:45'),
(1507, 28, 6, 'view', '2025-06-16 14:38:40'),
(1508, 28, 3, 'view', '2025-06-16 14:38:45'),
(1509, 28, 6, 'view', '2025-06-16 14:39:49'),
(1510, 28, 24, 'view', '2025-06-16 14:43:28'),
(1511, 28, 24, 'view', '2025-06-16 14:44:39'),
(1512, 28, 3, 'view', '2025-06-16 14:45:02'),
(1513, 28, 20, 'view', '2025-06-16 15:18:05'),
(1514, 28, 20, 'view', '2025-06-16 15:31:07'),
(1515, 28, 6, 'view', '2025-06-16 15:40:23'),
(1516, 28, 20, 'view', '2025-06-16 15:41:35'),
(1517, 28, 20, 'view', '2025-06-16 15:41:40'),
(1518, 28, 20, 'view', '2025-06-16 15:50:08'),
(1519, 28, 24, 'view', '2025-06-16 17:45:29'),
(1520, 28, 24, 'view', '2025-06-16 18:57:27'),
(1521, 28, 24, 'view', '2025-06-16 18:57:54'),
(1522, 28, 24, 'view', '2025-06-16 18:59:03'),
(1523, 28, 24, 'view', '2025-06-16 19:00:02'),
(1524, 28, 24, 'view', '2025-06-16 19:00:19'),
(1525, 28, 24, 'view', '2025-06-16 19:02:11'),
(1526, 28, 24, 'view', '2025-06-16 19:02:16'),
(1527, 28, 24, 'view', '2025-06-16 19:02:23'),
(1530, 28, 24, 'view', '2025-06-16 19:05:21'),
(1531, 28, 24, 'view', '2025-06-16 19:06:02'),
(1532, 28, 24, 'view', '2025-06-16 19:06:30'),
(1533, 28, 24, 'view', '2025-06-16 19:07:52'),
(1534, 28, 24, 'view', '2025-06-16 19:08:09'),
(1535, 28, 24, 'view', '2025-06-16 19:09:46'),
(1536, 28, 24, 'view', '2025-06-16 19:10:57'),
(1537, 28, 24, 'view', '2025-06-16 19:11:13'),
(1539, 28, 5, 'view', '2025-06-16 19:11:24'),
(1540, 28, 5, 'view', '2025-06-16 20:21:17'),
(1541, 28, 5, 'view', '2025-06-16 20:35:57'),
(1542, 28, 5, 'view', '2025-06-16 21:17:16'),
(1543, 28, 5, 'view', '2025-06-16 21:17:20'),
(1544, 28, 5, 'view', '2025-06-16 21:22:30'),
(1545, 28, 5, 'view', '2025-06-16 21:26:19'),
(1546, 28, 5, 'view', '2025-06-16 21:36:48'),
(1552, 28, 5, 'view', '2025-06-16 21:59:30'),
(1554, 28, 5, 'view', '2025-06-16 22:08:04'),
(1555, 28, 3, 'view', '2025-06-16 22:08:10'),
(1557, 28, 5, 'view', '2025-06-17 08:45:50'),
(1563, 28, 5, 'view', '2025-06-17 08:48:05'),
(1564, 28, 15, 'view', '2025-06-17 08:49:35'),
(1565, 28, 15, 'view', '2025-06-17 14:20:50'),
(1568, 52, 20, 'view', '2025-06-17 22:16:13'),
(1569, 52, 14, 'view', '2025-06-17 23:12:03'),
(1570, 52, 20, 'view', '2025-06-17 23:15:41'),
(1571, 52, 14, 'view', '2025-06-17 23:49:55'),
(1572, 52, 20, 'view', '2025-06-17 23:52:16'),
(1573, 52, 5, 'view', '2025-06-17 23:52:25'),
(1574, 52, 20, 'view', '2025-06-18 08:53:18'),
(1575, 52, 14, 'view', '2025-06-18 08:55:54'),
(1576, 52, 12, 'view', '2025-06-18 08:57:02'),
(1577, 52, 12, 'view', '2025-06-18 08:57:44'),
(1578, 52, 18, 'view', '2025-06-18 08:57:52'),
(1579, 52, 18, 'view', '2025-06-18 08:58:11'),
(1580, 52, 18, 'view', '2025-06-18 08:58:13'),
(1581, 52, 18, 'view', '2025-06-18 08:58:18'),
(1582, 52, 18, 'view', '2025-06-18 08:58:27'),
(1583, 52, 18, 'view', '2025-06-18 08:58:30'),
(1584, 52, 4, 'view', '2025-06-18 08:58:45'),
(1585, 52, 4, 'view', '2025-06-18 13:11:28'),
(1586, 52, 9, 'view', '2025-06-18 13:11:37'),
(1587, 52, 16, 'view', '2025-06-18 13:11:41'),
(1588, 52, 24, 'view', '2025-06-18 13:11:46'),
(1589, 52, 24, 'view', '2025-06-18 13:12:27'),
(1590, 52, 21, 'view', '2025-06-18 19:10:28'),
(1591, 52, 22, 'view', '2025-06-18 19:10:30'),
(1592, 52, 23, 'view', '2025-06-18 19:13:32'),
(1593, 52, 23, 'view', '2025-06-18 19:13:41'),
(1594, 52, 8, 'view', '2025-06-18 19:13:48'),
(1595, 52, 7, 'view', '2025-06-18 19:13:50'),
(1596, 52, 21, 'view', '2025-06-18 19:13:52'),
(1597, 52, 22, 'view', '2025-06-18 19:13:54'),
(1598, 52, 10, 'view', '2025-06-18 19:14:35'),
(1599, 52, 10, 'view', '2025-06-18 19:16:27'),
(1600, 52, 10, 'view', '2025-06-18 19:18:39'),
(1601, 52, 22, 'view', '2025-06-18 20:04:02'),
(1602, 52, 22, 'view', '2025-06-18 20:07:34'),
(1603, 52, 22, 'view', '2025-06-18 20:08:03'),
(1604, 52, 22, 'view', '2025-06-18 21:35:11'),
(1608, 52, 22, 'view', '2025-06-18 23:07:39'),
(1609, 52, 22, 'view', '2025-06-18 23:31:31'),
(1610, 52, 11, 'view', '2025-06-18 23:34:02'),
(1613, 52, 4, 'view', '2025-06-18 23:41:34'),
(1614, 52, 15, 'view', '2025-06-18 23:41:35'),
(1615, 52, 16, 'view', '2025-06-18 23:41:36'),
(1616, 52, 3, 'view', '2025-06-18 23:41:38'),
(1617, 52, 6, 'view', '2025-06-18 23:41:44'),
(1618, 52, 6, 'view', '2025-06-18 23:42:27'),
(1619, 52, 6, 'view', '2025-06-18 23:49:25'),
(1620, 52, 6, 'view', '2025-06-18 23:52:25'),
(1621, 52, 6, 'view', '2025-06-18 23:55:33'),
(1622, 52, 6, 'view', '2025-06-18 23:56:59'),
(1623, 52, 6, 'view', '2025-06-18 23:58:14'),
(1624, 52, 6, 'view', '2025-06-18 23:58:51'),
(1625, 28, 3, 'view', '2025-06-21 12:32:31'),
(1626, 28, 12, 'view', '2025-06-21 12:32:34'),
(1627, 28, 12, 'view', '2025-06-21 20:01:55'),
(1632, 52, 6, 'view', '2025-06-22 13:50:35'),
(1633, 52, 3, 'view', '2025-06-23 15:18:10'),
(1634, 52, 8, 'view', '2025-06-23 15:18:15'),
(1635, 52, 8, 'view', '2025-06-23 15:18:21'),
(1637, 52, 24, 'view', '2025-06-23 15:18:30'),
(1638, 52, 10, 'view', '2025-06-23 15:19:38'),
(1639, 52, 24, 'view', '2025-06-23 15:19:43'),
(1640, 52, 7, 'view', '2025-06-23 15:20:07'),
(1641, 52, 18, 'view', '2025-06-23 15:20:25'),
(1642, 52, 18, 'view', '2025-06-23 15:21:05'),
(1643, 52, 21, 'view', '2025-06-23 15:21:16'),
(1644, 52, 21, 'view', '2025-06-23 15:21:24'),
(1645, 52, 21, 'view', '2025-06-23 15:21:31'),
(1646, 52, 20, 'view', '2025-06-23 15:21:34'),
(1647, 52, 9, 'view', '2025-06-23 15:21:36'),
(1648, 52, 10, 'view', '2025-06-23 15:21:38'),
(1649, 52, 24, 'view', '2025-06-23 15:21:39'),
(1650, 52, 24, 'view', '2025-06-23 15:21:50'),
(1651, 52, 6, 'view', '2025-06-23 15:21:57'),
(1652, 52, 24, 'view', '2025-06-23 15:23:08'),
(1653, 52, 23, 'view', '2025-06-23 15:23:11'),
(1654, 52, 9, 'view', '2025-06-23 15:23:16'),
(1655, 52, 17, 'view', '2025-06-23 15:23:21'),
(1656, 52, 17, 'view', '2025-06-23 18:56:49'),
(1657, 15, 4, 'view', '2025-06-23 19:02:00'),
(1658, 15, 5, 'view', '2025-06-23 19:02:20'),
(1659, 15, 5, 'view', '2025-06-23 20:30:14'),
(1660, 15, 5, 'view', '2025-06-23 20:30:20'),
(1661, 15, 5, 'view', '2025-06-23 20:34:36'),
(1662, 15, 4, 'view', '2025-06-24 09:06:49'),
(1663, 15, 24, 'view', '2025-06-24 09:06:52'),
(1664, 15, 4, 'view', '2025-06-24 09:06:53'),
(1665, 15, 5, 'view', '2025-06-24 09:06:55'),
(1666, 15, 8, 'view', '2025-06-24 09:07:02'),
(1667, 15, 22, 'view', '2025-06-24 09:07:04'),
(1668, 15, 12, 'view', '2025-06-24 09:07:06'),
(1669, 15, 5, 'view', '2025-06-24 09:07:09'),
(1670, 15, 5, 'view', '2025-06-24 09:08:28'),
(1671, 15, 16, 'view', '2025-06-24 09:09:11'),
(1672, 15, 9, 'view', '2025-06-24 09:09:17'),
(1673, 15, 9, 'view', '2025-06-24 22:04:46'),
(1674, 28, 5, 'view', '2025-06-24 22:05:09'),
(1675, 15, 15, 'view', '2025-06-27 20:44:36'),
(1676, 15, 16, 'view', '2025-06-27 20:45:05'),
(1677, 15, 16, 'view', '2025-06-27 20:45:10'),
(1678, 15, 4, 'view', '2025-06-27 20:45:13'),
(1679, 15, 3, 'view', '2025-06-27 20:45:15'),
(1680, 15, 3, 'view', '2025-06-27 20:47:15'),
(1681, 15, 3, 'view', '2025-06-27 20:56:54'),
(1682, 15, 3, 'view', '2025-06-27 21:03:09'),
(1683, 15, 3, 'view', '2025-06-27 21:10:28'),
(1684, 20, 12, 'view', '2025-06-27 22:50:56'),
(1685, 20, 15, 'view', '2025-06-27 22:56:10'),
(1686, 20, 13, 'view', '2025-06-27 22:56:22'),
(1687, 20, 13, 'view', '2025-06-27 22:59:10'),
(1688, 20, 13, 'fav', '2025-06-27 22:59:11'),
(1689, 20, 5, 'view', '2025-06-27 23:00:35'),
(1690, 20, 5, 'view', '2025-06-27 23:01:01'),
(1691, 20, 5, 'view', '2025-06-27 23:02:50'),
(1692, 20, 12, 'view', '2025-06-28 11:12:26'),
(1693, 20, 12, 'fav', '2025-06-28 11:12:26');
INSERT INTO `user_history` (`user_history_id`, `user_id`, `product_id`, `action`, `accessed_at`) VALUES
(1694, 20, 22, 'view', '2025-06-28 11:12:32'),
(1695, 20, 22, 'fav', '2025-06-28 11:12:33'),
(1696, 20, 23, 'view', '2025-06-28 11:12:36'),
(1697, 20, 23, 'fav', '2025-06-28 11:12:36'),
(1698, 20, 6, 'view', '2025-06-28 11:12:40'),
(1699, 20, 11, 'view', '2025-06-28 11:13:10'),
(1700, 20, 11, 'fav', '2025-06-28 11:13:11'),
(1701, 20, 18, 'view', '2025-06-28 11:13:14'),
(1702, 20, 18, 'fav', '2025-06-28 11:13:15'),
(1703, 20, 13, 'view', '2025-06-28 11:37:35'),
(1704, 20, 9, 'view', '2025-06-28 12:21:28'),
(1705, 20, 21, 'view', '2025-06-28 12:21:34'),
(1706, 20, 9, 'view', '2025-06-28 12:21:37'),
(1707, 20, 9, 'fav', '2025-06-28 12:21:39'),
(1708, 20, 9, 'view', '2025-06-28 12:25:52'),
(1709, 20, 12, 'view', '2025-06-28 12:43:16'),
(1710, 20, 12, 'fav', '2025-06-28 12:43:17'),
(1711, 20, 9, 'view', '2025-06-28 12:43:21'),
(1712, 20, 9, 'fav', '2025-06-28 12:43:22'),
(1713, 20, 9, 'view', '2025-06-28 12:55:43'),
(1714, 20, 9, 'fav', '2025-06-28 12:55:46'),
(1715, 20, 12, 'view', '2025-06-28 12:55:54'),
(1716, 20, 12, 'fav', '2025-06-28 12:55:56'),
(1717, 20, 12, 'view', '2025-06-28 12:57:40'),
(1718, 20, 12, 'fav', '2025-06-28 12:57:41'),
(1719, 20, 12, 'view', '2025-06-28 12:58:54'),
(1720, 20, 12, 'fav', '2025-06-28 12:58:55'),
(1721, 20, 12, 'view', '2025-06-28 13:07:18'),
(1722, 20, 12, 'fav', '2025-06-28 13:07:20'),
(1723, 20, 12, 'view', '2025-06-28 13:08:10'),
(1724, 20, 9, 'view', '2025-06-28 13:14:17'),
(1725, 20, 9, 'fav', '2025-06-28 13:14:18'),
(1726, 20, 9, 'view', '2025-06-28 13:20:54'),
(1727, 20, 5, 'view', '2025-06-28 13:21:01'),
(1728, 20, 6, 'view', '2025-06-28 13:34:31'),
(1729, 20, 9, 'view', '2025-06-28 15:23:50'),
(1730, 20, 9, 'fav', '2025-06-28 15:23:51'),
(1731, 20, 9, 'view', '2025-06-29 13:04:13'),
(1732, 20, 8, 'view', '2025-06-29 13:04:28'),
(1733, 52, 9, 'view', '2025-06-29 18:29:28'),
(1734, 52, 9, 'view', '2025-06-29 18:29:53'),
(1735, 52, 9, 'view', '2025-06-29 18:30:43'),
(1736, 52, 9, 'view', '2025-06-29 18:32:13'),
(1737, 52, 20, 'view', '2025-06-29 18:51:17'),
(1738, 52, 20, 'view', '2025-06-29 18:51:19'),
(1739, 52, 20, 'view', '2025-06-29 18:51:23'),
(1740, 52, 20, 'view', '2025-06-29 18:53:51'),
(1741, 20, 8, 'view', '2025-06-29 19:10:09'),
(1742, 20, 22, 'view', '2025-06-29 19:10:14'),
(1743, 20, 22, 'view', '2025-06-29 19:10:25'),
(1744, 20, 8, 'view', '2025-06-29 19:10:29'),
(1745, 20, 8, 'view', '2025-06-29 19:14:18'),
(1746, 20, 8, 'view', '2025-06-29 19:14:25'),
(1747, 20, 8, 'view', '2025-06-29 19:14:31'),
(1748, 20, 8, 'view', '2025-06-29 19:14:34'),
(1749, 20, 8, 'view', '2025-06-29 19:15:12'),
(1750, 15, 3, 'view', '2025-06-29 20:19:22'),
(1751, 15, 3, 'view', '2025-06-29 20:19:24'),
(1752, 15, 9, 'view', '2025-06-29 20:19:28'),
(1753, 28, 5, 'view', '2025-07-02 10:57:06'),
(1754, 28, 5, 'view', '2025-07-02 18:40:29');

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `v_cart_fav`
-- (Veja abaixo para a visão atual)
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
,`seller_type` enum('admin','user')
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `v_chats_details`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `v_chats_details` (
`chat_id` int(11)
,`product_id` int(11)
,`product_title` varchar(150)
,`product_price` decimal(10,2)
,`cover_product` varchar(255)
,`seller_id` int(11)
,`buyer_id` int(11)
,`timestamp` timestamp
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `v_daily_metrics`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `v_daily_metrics` (
`day` date
,`new_users` decimal(42,0)
,`total_orders` decimal(42,0)
,`total_revenue` decimal(54,2)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `v_message_details`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `v_message_details` (
`id_message` int(11)
,`chat_id` int(11)
,`owner_id` int(11)
,`sender_id` int(11)
,`sender_name` varchar(100)
,`receiver_id` int(11)
,`receiver_name` varchar(100)
,`product_id` int(11)
,`product_title` varchar(150)
,`product_cover` varchar(255)
,`message` text
,`date_raw` date
,`date_label` varchar(70)
,`TIMESTAMP` timestamp
,`timestamp_format` varchar(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `v_monthly_active_users`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `v_monthly_active_users` (
`month` varchar(7)
,`active_users` bigint(21)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `v_order_details`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `v_order_details` (
`order_id` int(11)
,`user_id` int(11)
,`status` enum('pendente','pago','cancelado')
,`created_at` datetime
,`product_id` int(11)
,`quantity` int(11)
,`unit_price` decimal(10,2)
,`total_item_value` decimal(20,2)
,`product_title` varchar(150)
,`product_cover` varchar(255)
,`product_category` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `v_popular_products`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `v_popular_products` (
`product_id` int(11)
,`user_id` int(11)
,`user_name` varchar(100)
,`title` varchar(150)
,`description` text
,`price` decimal(10,2)
,`price_before` decimal(10,2)
,`discount_percentage` decimal(17,2)
,`category` varchar(50)
,`quantity` int(11)
,`rating` decimal(10,1)
,`cover` varchar(255)
,`created_at` timestamp
,`updated_at` timestamp
,`seller_type` enum('admin','user')
,`status` enum('sold','nostock','available')
,`view_count` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `v_products_sales`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `v_products_sales` (
`product_id` int(11)
,`product_name` varchar(150)
,`total_sales` bigint(21)
,`total_quantity_sold` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `v_product_details`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `v_product_details` (
`product_id` int(11)
,`user_id` int(11)
,`user_name` varchar(100)
,`title` varchar(150)
,`description` text
,`price` decimal(10,2)
,`price_before` decimal(10,2)
,`discount_percentage` decimal(17,2)
,`category` varchar(50)
,`quantity` int(11)
,`cover` varchar(255)
,`rating` decimal(10,1)
,`location` varchar(255)
,`created_at` timestamp
,`updated_at` timestamp
,`seller_type` enum('admin','user')
,`status` enum('sold','nostock','available')
,`review_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `v_product_full_details`
-- (Veja abaixo para a visão atual)
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
,`rating` decimal(10,1)
,`cover` varchar(255)
,`location` varchar(255)
,`created_at` varchar(19)
,`updated_at` varchar(19)
,`seller_type` enum('admin','user')
,`status` enum('sold','nostock','available')
,`views` int(11)
,`favorites_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `v_review_details`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `v_review_details` (
`review_id` int(11)
,`product_id` int(11)
,`user_id` int(11)
,`user_name` varchar(100)
,`user_avatar` varchar(255)
,`rating` tinyint(5)
,`comment` text
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `v_total_wallet`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `v_total_wallet` (
`total_balance` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `balance` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `wallet`
--

INSERT INTO `wallet` (`id`, `user_id`, `balance`) VALUES
(1, 22, 0.00),
(3, 28, 999284.13),
(4, 18, 0.00),
(6, 15, 99998890.19),
(8, 21, 0.00),
(9, 19, 0.00),
(10, 25, 0.00),
(11, 20, 25895.97),
(33, 52, 280.40),
(37, 56, 1.00);

-- --------------------------------------------------------

--
-- Estrutura para view `v_cart_fav`
--
DROP TABLE IF EXISTS `v_cart_fav`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cart_fav`  AS SELECT `s`.`saved_id` AS `favorite_id`, `s`.`product_id` AS `product_id`, `s`.`user_id` AS `user_id`, `s`.`tipo` AS `tipo`, `s`.`quantity` AS `quantity`, `s`.`created_at` AS `created_at`, `p`.`title` AS `title`, `p`.`price` AS `price`, `p`.`category` AS `category`, `p`.`cover` AS `cover`, `u`.`type` AS `seller_type` FROM ((`saved` `s` join `products` `p` on(`s`.`product_id` = `p`.`product_id`)) left join `users` `u` on(`p`.`user_id` = `u`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `v_chats_details`
--
DROP TABLE IF EXISTS `v_chats_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_chats_details`  AS SELECT `chats`.`chat_id` AS `chat_id`, `chats`.`product_id` AS `product_id`, `products`.`title` AS `product_title`, `products`.`price` AS `product_price`, `products`.`cover` AS `cover_product`, `chats`.`seller_id` AS `seller_id`, `chats`.`buyer_id` AS `buyer_id`, `chats`.`timestamp` AS `timestamp` FROM (`chats` join `products` on(`chats`.`product_id` = `products`.`product_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `v_daily_metrics`
--
DROP TABLE IF EXISTS `v_daily_metrics`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_daily_metrics`  AS SELECT `daily_data`.`day` AS `day`, sum(`daily_data`.`new_users`) AS `new_users`, sum(`daily_data`.`total_orders`) AS `total_orders`, sum(`daily_data`.`total_revenue`) AS `total_revenue` FROM (select cast(`users`.`created_at` as date) AS `day`,count(0) AS `new_users`,0 AS `total_orders`,0 AS `total_revenue` from `users` group by cast(`users`.`created_at` as date) union all select cast(`orders`.`created_at` as date) AS `day`,0 AS `new_users`,count(0) AS `total_orders`,0 AS `total_revenue` from `orders` group by cast(`orders`.`created_at` as date) union all select cast(`payments`.`created_at` as date) AS `day`,0 AS `new_users`,0 AS `total_orders`,sum(`payments`.`amount`) AS `total_revenue` from `payments` where `payments`.`status` = 'concluido' group by cast(`payments`.`created_at` as date)) AS `daily_data` GROUP BY `daily_data`.`day` ORDER BY `daily_data`.`day` DESC ;

-- --------------------------------------------------------

--
-- Estrutura para view `v_message_details`
--
DROP TABLE IF EXISTS `v_message_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_message_details`  AS SELECT `m`.`id_message` AS `id_message`, `c`.`chat_id` AS `chat_id`, `p`.`user_id` AS `owner_id`, `m`.`sender_id` AS `sender_id`, `sender`.`name` AS `sender_name`, CASE WHEN `m`.`sender_id` = `c`.`seller_id` THEN `c`.`buyer_id` ELSE `c`.`seller_id` END AS `receiver_id`, CASE WHEN `m`.`sender_id` = `c`.`seller_id` THEN `buyer`.`name` ELSE `seller`.`name` END AS `receiver_name`, `c`.`product_id` AS `product_id`, `p`.`title` AS `product_title`, `p`.`cover` AS `product_cover`, `m`.`message` AS `message`, cast(`m`.`timestamp` as date) AS `date_raw`, CASE WHEN cast(`m`.`timestamp` as date) = curdate() THEN 'Hoje' WHEN cast(`m`.`timestamp` as date) = curdate() - interval 1 day THEN 'Ontem' ELSE date_format(`m`.`timestamp`,'%d de %M') END AS `date_label`, `m`.`timestamp` AS `TIMESTAMP`, date_format(`m`.`timestamp`,'%H:%i') AS `timestamp_format` FROM (((((`messages` `m` join `chats` `c` on(`m`.`chat_id` = `c`.`chat_id`)) join `products` `p` on(`c`.`product_id` = `p`.`product_id`)) join `users` `sender` on(`m`.`sender_id` = `sender`.`user_id`)) join `users` `seller` on(`c`.`seller_id` = `seller`.`user_id`)) join `users` `buyer` on(`c`.`buyer_id` = `buyer`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `v_monthly_active_users`
--
DROP TABLE IF EXISTS `v_monthly_active_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_monthly_active_users`  AS SELECT date_format(`user_history`.`accessed_at`,'%Y-%m') AS `month`, count(distinct `user_history`.`user_id`) AS `active_users` FROM `user_history` GROUP BY date_format(`user_history`.`accessed_at`,'%Y-%m') ;

-- --------------------------------------------------------

--
-- Estrutura para view `v_order_details`
--
DROP TABLE IF EXISTS `v_order_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_order_details`  AS SELECT `o`.`id` AS `order_id`, `o`.`user_id` AS `user_id`, `o`.`status` AS `status`, `o`.`created_at` AS `created_at`, `oi`.`product_id` AS `product_id`, `oi`.`quantity` AS `quantity`, `oi`.`unit_price` AS `unit_price`, `oi`.`quantity`* `oi`.`unit_price` AS `total_item_value`, `p`.`title` AS `product_title`, `p`.`cover` AS `product_cover`, `p`.`category` AS `product_category` FROM ((`orders` `o` join `order_items` `oi` on(`o`.`id` = `oi`.`order_id`)) join `products` `p` on(`oi`.`product_id` = `p`.`product_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `v_popular_products`
--
DROP TABLE IF EXISTS `v_popular_products`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_popular_products`  AS SELECT `p`.`product_id` AS `product_id`, `p`.`user_id` AS `user_id`, `u`.`name` AS `user_name`, `p`.`title` AS `title`, `p`.`description` AS `description`, `p`.`price` AS `price`, `p`.`price_before` AS `price_before`, round((`p`.`price_before` - `p`.`price`) / `p`.`price_before` * 100,2) AS `discount_percentage`, `p`.`category` AS `category`, `p`.`quantity` AS `quantity`, `p`.`rating` AS `rating`, `p`.`cover` AS `cover`, `p`.`created_at` AS `created_at`, `p`.`updated_at` AS `updated_at`, `u`.`type` AS `seller_type`, `p`.`status` AS `status`, `pv`.`view_count` AS `view_count` FROM ((`products` `p` join `products_views` `pv` on(`p`.`product_id` = `pv`.`product_id`)) left join `users` `u` on(`p`.`user_id` = `u`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `v_products_sales`
--
DROP TABLE IF EXISTS `v_products_sales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_products_sales`  AS SELECT `p`.`product_id` AS `product_id`, `p`.`title` AS `product_name`, count(`oi`.`id`) AS `total_sales`, sum(`oi`.`quantity`) AS `total_quantity_sold` FROM (`products` `p` join `order_items` `oi` on(`oi`.`product_id` = `p`.`product_id`)) GROUP BY `p`.`product_id` ;

-- --------------------------------------------------------

--
-- Estrutura para view `v_product_details`
--
DROP TABLE IF EXISTS `v_product_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_product_details`  AS SELECT `p`.`product_id` AS `product_id`, `p`.`user_id` AS `user_id`, `u`.`name` AS `user_name`, `p`.`title` AS `title`, `p`.`description` AS `description`, `p`.`price` AS `price`, `p`.`price_before` AS `price_before`, round((`p`.`price_before` - `p`.`price`) / `p`.`price_before` * 100,2) AS `discount_percentage`, `p`.`category` AS `category`, `p`.`quantity` AS `quantity`, `p`.`cover` AS `cover`, `p`.`rating` AS `rating`, `p`.`location` AS `location`, `p`.`created_at` AS `created_at`, `p`.`updated_at` AS `updated_at`, `u`.`type` AS `seller_type`, `p`.`status` AS `status`, count(`r`.`review_id`) AS `review_count` FROM ((`products` `p` left join `reviews` `r` on(`r`.`product_id` = `p`.`product_id`)) left join `users` `u` on(`u`.`user_id` = `p`.`user_id`)) GROUP BY `p`.`product_id` ;

-- --------------------------------------------------------

--
-- Estrutura para view `v_product_full_details`
--
DROP TABLE IF EXISTS `v_product_full_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_product_full_details`  AS SELECT `p`.`product_id` AS `product_id`, `p`.`user_id` AS `user_id`, `p`.`title` AS `title`, `p`.`description` AS `description`, `p`.`price` AS `price`, `p`.`price_before` AS `price_before`, round((`p`.`price_before` - `p`.`price`) / `p`.`price_before` * 100,2) AS `discount_percentage`, `p`.`category` AS `category`, `p`.`quantity` AS `quantity`, `p`.`rating` AS `rating`, `p`.`cover` AS `cover`, `p`.`location` AS `location`, date_format(`p`.`created_at`,'%d/%m/%y %H:%i') AS `created_at`, date_format(`p`.`updated_at`,'%d/%m/%y %H:%i') AS `updated_at`, `u`.`type` AS `seller_type`, `p`.`status` AS `status`, ifnull(`pv`.`view_count`,0) AS `views`, count(distinct `f`.`saved_id`) AS `favorites_count` FROM (((`products` `p` left join `users` `u` on(`p`.`user_id` = `u`.`user_id`)) left join `products_views` `pv` on(`p`.`product_id` = `pv`.`product_id`)) left join `saved` `f` on(`p`.`product_id` = `f`.`product_id`)) GROUP BY `p`.`product_id` ;

-- --------------------------------------------------------

--
-- Estrutura para view `v_review_details`
--
DROP TABLE IF EXISTS `v_review_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_review_details`  AS SELECT `r`.`review_id` AS `review_id`, `r`.`product_id` AS `product_id`, `r`.`user_id` AS `user_id`, `u`.`name` AS `user_name`, `u`.`avatar` AS `user_avatar`, `r`.`rating` AS `rating`, `r`.`comment` AS `comment`, `r`.`created_at` AS `created_at` FROM (`reviews` `r` join `users` `u` on(`r`.`user_id` = `u`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `v_total_wallet`
--
DROP TABLE IF EXISTS `v_total_wallet`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_total_wallet`  AS SELECT sum(`wallet`.`balance`) AS `total_balance` FROM `wallet` ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`chat_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `chats_ibfk_2` (`buyer_id`),
  ADD KEY `chats_ibfk_3` (`seller_id`);

--
-- Índices de tabela `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`gallery_id`),
  ADD KEY `gallery_ibfk_1` (`product_id`);

--
-- Índices de tabela `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `images_ibfk_1` (`gallery_id`);

--
-- Índices de tabela `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `messages_ibfk_2` (`chat_id`);

--
-- Índices de tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Índices de tabela `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `payments_ibfk_2` (`order_id`);

--
-- Índices de tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_category` (`category`);
ALTER TABLE `products` ADD FULLTEXT KEY `title` (`title`,`description`,`category`);
ALTER TABLE `products` ADD FULLTEXT KEY `title_2` (`title`,`description`,`category`);

--
-- Índices de tabela `products_views`
--
ALTER TABLE `products_views`
  ADD PRIMARY KEY (`product_id`);

--
-- Índices de tabela `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD UNIQUE KEY `idx_product_user` (`product_id`,`user_id`),
  ADD KEY `reviewer_id` (`user_id`);

--
-- Índices de tabela `saved`
--
ALTER TABLE `saved`
  ADD PRIMARY KEY (`saved_id`),
  ADD UNIQUE KEY `unique_cart_item` (`user_id`,`product_id`,`tipo`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `firebase_uid` (`firebase_uid`);

--
-- Índices de tabela `users_tokens`
--
ALTER TABLE `users_tokens`
  ADD PRIMARY KEY (`id_token`),
  ADD UNIQUE KEY `no_dup` (`id_token`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `user_history`
--
ALTER TABLE `user_history`
  ADD PRIMARY KEY (`user_history_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Índices de tabela `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `chats`
--
ALTER TABLE `chats`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de tabela `gallery`
--
ALTER TABLE `gallery`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT de tabela `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

--
-- AUTO_INCREMENT de tabela `messages`
--
ALTER TABLE `messages`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=481;

--
-- AUTO_INCREMENT de tabela `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de tabela `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de tabela `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT de tabela `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=774;

--
-- AUTO_INCREMENT de tabela `saved`
--
ALTER TABLE `saved`
  MODIFY `saved_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=539;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de tabela `users_tokens`
--
ALTER TABLE `users_tokens`
  MODIFY `id_token` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT de tabela `user_history`
--
ALTER TABLE `user_history`
  MODIFY `user_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1755;

--
-- AUTO_INCREMENT de tabela `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chats_ibfk_3` FOREIGN KEY (`seller_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`gallery_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`chat_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Restrições para tabelas `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Restrições para tabelas `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category`) REFERENCES `categories` (`name`),
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Restrições para tabelas `products_views`
--
ALTER TABLE `products_views`
  ADD CONSTRAINT `products_views_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `saved`
--
ALTER TABLE `saved`
  ADD CONSTRAINT `saved_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `saved_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `users_tokens`
--
ALTER TABLE `users_tokens`
  ADD CONSTRAINT `users_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `user_history`
--
ALTER TABLE `user_history`
  ADD CONSTRAINT `user_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_history_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
