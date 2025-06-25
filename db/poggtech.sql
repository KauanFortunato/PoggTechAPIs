-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2025 at 11:55 PM
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
  `seller_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`chat_id`, `product_id`, `seller_id`, `buyer_id`, `timestamp`) VALUES
(66, 5, 19, 28, '2025-06-24 22:05:11');

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
(63, 67, '2025-06-14 21:56:02');

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
(171, 63, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_684deff2256a45.02643957.jpg'),
(172, 63, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_684deff225b0a7.47364033.jpg'),
(173, 63, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_684f612baac333.02104368.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
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
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id_message`, `chat_id`, `sender_id`, `message`, `timestamp`, `is_read`) VALUES
(461, 66, 28, 'Hi, is this item available?', '2025-06-24 22:05:11', 0),
(462, 66, 28, 'Olaaa', '2025-06-24 22:05:17', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
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
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `user_name`, `user_phone`, `location`, `status`, `shipping_status`, `created_at`) VALUES
(66, 52, 39.96, 'Kauan Fortunato', '910937520**', 'Rua dom duarte 2', 'pago', 'transito', '2025-06-18 20:17:15'),
(70, 52, 2.00, 'kauan fortunatoss', '910937520', 'niggaaa', 'pago', 'enviado', '2025-06-18 21:08:21'),
(71, 52, 2.00, 'kauan fortunatoss', '910937520', 'Rua Dom Duarte 2, Amadora, Portugal', 'pago', 'enviado', '2025-06-19 00:29:11'),
(72, 52, 2.00, 'kauan fortunatoss', '910937520', 'Rússia', 'pago', 'entregue', '2025-06-19 00:31:43'),
(73, 52, 10.00, 'kauan fortunatoss', '910937520', 'Nugaal, Somália', 'pendente', 'confirmado', '2025-06-19 00:34:16'),
(74, 28, 48.99, 'Mordekai', '910 937 520', 'Blatten, Suíça', 'pago', 'entregue', '2025-06-21 13:32:44'),
(75, 15, 1109.80, 'Kauan Fortunato', '910937520', 'Amadora, Portugal', 'pago', 'confirmado', '2025-06-24 10:09:45');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`) VALUES
(47, 66, 23, 1, 6.00),
(48, 66, 10, 3, 11.32),
(52, 70, 22, 1, 2.00),
(53, 71, 22, 1, 2.00),
(54, 72, 22, 1, 2.00),
(55, 73, 11, 1, 10.00),
(56, 74, 12, 1, 48.99),
(57, 75, 4, 10, 110.98);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
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
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `order_id`, `amount`, `status`, `created_at`) VALUES
(37, 52, 66, 39.96, '', '2025-06-18 20:17:15'),
(41, 52, 70, 2.00, 'concluido', '2025-06-18 21:08:21'),
(42, 52, 71, 2.00, 'concluido', '2025-06-19 00:29:11'),
(43, 52, 72, 2.00, 'concluido', '2025-06-19 00:31:43'),
(44, 52, 73, 10.00, 'concluido', '2025-06-19 00:34:16'),
(45, 28, 74, 48.99, 'concluido', '2025-06-21 13:32:44'),
(46, 15, 75, 1109.80, 'concluido', '2025-06-24 10:09:45');

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
  `rating` decimal(10,1) NOT NULL DEFAULT 0.0,
  `cover` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('sold','nostock','available') NOT NULL DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `user_id`, `title`, `description`, `price`, `price_before`, `category`, `quantity`, `rating`, `cover`, `location`, `created_at`, `updated_at`, `status`) VALUES
(3, 15, 'Xbox Series X, 1tb, Preto', 'A nova série Xbox Jogue milhares de jogos em quatro gerações de console – todos os jogos têm uma ótima aparência e funcionam perfeitamente no Xbox Series\r\nExperimente velocidade e desempenho de próxima geração com Xbox Velocity Architecture, com SSD personalizado e software integrado\r\nJogue milhares de jogos de quatro gerações de Xbox com compatibilidade retroativa, incluindo títulos otimizados no lançamento\r\nO Xbox O Game Pass Ultimate inclui mais de 100 jogos de alta qualidade para consoles, PC, dispositivos móveis Android, multijogador online e uma assinatura do EA Play por um baixo preço mensal (assinatura vendida separadamente).\r\nUm Xbox Smart Delivery permite que você jogue a melhor versão do seu jogo, independentemente do console que você usa', 523.02, 590.23, 'Consolas', 10, 3.0, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_Xbox-Series-X-Test-1987881512.jpg', NULL, '2024-12-05 20:28:39', '2025-06-23 01:01:39', 'available'),
(4, 18, 'Xbox 360', 'Console em bom estado', 110.98, 120.00, 'Consolas', 10, 3.0, 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.pngall.com%2Fwp-content%2Fuploads%2F2016%2F07%2FXbox-Free-Download-PNG.png&f=1&nofb=1&ipt=f1e2015ce576a3b63e40ab904d61db31b73a96df9fd250d40612ce6475e4f112&ipo=images', NULL, '2025-01-09 18:40:07', '2025-06-18 21:59:53', 'available'),
(5, 19, '2DS Azul/Preto', 'O Nintendo 2DS mantém muitas das mesmas características de hardware como o Nintendo DS 3 incluindo o mesmo Nintendo 3DS gameplay controla, ao contrário de compatibilidade com a vasta biblioteca existente de jogos de Nintendo DS, bem como recursos de conectividade sem fio, como acesso a Nintendo eShop, além de funcionalidade StreetPass e o SpotPass.', 85.00, 122.00, 'Retro Gaming', 1, 3.7, 'https://pt.static.webuy.com/product_images/Jogos/3DS%20Consolas/S2DSAZUC_l.jpg', NULL, '2025-01-09 18:59:43', '2025-06-13 22:28:29', 'available'),
(6, 28, 'Grand Theft Auto V (5) 2 discos', 'Los Santos - uma alastrando sun-soaked metrópole cheio de self-help gurus, starlets, e desvanecimento celebridades, inveja do ocidental mundo, agora struggling para stay afloat em uma era de econômica incerteza e barato reality TV.\r\n\r\nAmidst o turmoil, três muito diferentes criminosos enredo suas próprias chances de sobrevivência e sucesso: Franklin, antiga rua gângster, agora procurando real oportunidades e grave dinheiro; Michael, um profissional ex-con aposentadoria é um muito menos do que ele esperança isso Seria e Trevor, um maníaco violento dirigido pela próxima grande pontuação. Ficando sem opções, a tripulação arrisca tudo em uma série de assaltos ousados e perigosas que podem defini-las pelo resto da vida.\r\n\r\nO maior, mais dinâmica e mais diversas abrir mundo jamais criado, Grand Theft Auto V combina narrativa e jogabilidade em novas formas, como jogadores repetidamente saltar dentro e fora da vida dos três personagens de chumbo do jogo, jogando todos os lados da história do jogo entrelaçadas.\r\n\r\nTodas as características clássicas da inovadora série de retorno, incluindo a incrível atenção ao detalhe e Grand Theft Auto sombriamente humorístico leve na cultura moderna, ao lado de uma abordagem nova e ambiciosa para abrir o mundo multiplayer.', 15.00, 20.00, 'Jogos', 10, 3.3, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_310047-grand-theft-auto-v-xbox-360-front-cover-3516295299.png', NULL, '2025-01-09 18:59:43', '2025-06-18 21:59:53', 'available'),
(7, 28, 'New Super Mario Bros 2ds', 'New Super Mario Bros características enorme vívida 2D mundos inspiraram por aqueles das aventuras de Mario clássicas, mas combinado com lindamente prestados personagens 3D que quase parecem saltar para fora da tela. Cada mundo tem um tema diferente e apresenta vários níveis, que devem ser concluídos antes de avançar para o próximo. Os jogadores também devem dominar mini fortaleza do mundo cada e bater um personagem chefe antes que podem progredir para o próximo mundo. Só depois de derrotar todos os chefes um personagem será pronto para enfrentar o derradeiro desafio do Bowser ele mesmo.', 23.00, 28.00, 'Jogos', 10, 2.8, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_045496463106_l.webp', NULL, '2025-01-11 23:26:18', '2025-06-18 21:59:53', 'available'),
(8, 28, 'Inazuma Eleven', 'Sequências de anime cativante enriquecem o enredo nesta aventura e os jogadores são capazes de explorar a cidade no jogo para procurar potenciais companheiros de equipe. Existem mais de 1000 personagens no jogo que você pode explorar, cada um com suas próprias estatísticas, habilidades únicas e habilidades especiais.', 18.00, 20.00, 'Jogos', 10, 2.6, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_045496470685_l.webp', NULL, '2025-01-11 23:26:18', '2025-06-18 21:59:53', 'available'),
(9, 15, 'PS4 Official DualShock 4 Branco Controller (V2)', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 54.92, 55.92, 'Acessórios', 1, 4.0, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_0711719894650_l.webp', NULL, '2025-01-11 23:29:49', '2025-06-15 00:46:30', 'available'),
(10, 15, 'Playstation Move Motion Controller V1 (CECH-ZCM 1) (PS3/PS4)', 'PlayStation Move redefine os jogos de movimento com experiência de jogo mais envolvente e realista só é possível no sistema PlayStation3. O controlador simples, fácil de usar captura uma gama completa de movimento, dando-lhe controle final sobre como você joga o jogo. Com uma variada selecção de jogos e os novos lançamento todo o tempo, pode desfrutar de horas de diversão com amigos e família.', 11.32, 12.32, 'Acessórios', 10, 2.8, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_SPS3ACCMOVE_l.webp', NULL, '2025-01-11 23:29:49', '2025-06-18 21:59:53', 'available'),
(11, 15, 'Xbox 360 Kinect (Sem FA)', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 10.00, NULL, 'Acessórios', 10, 3.3, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_S360KINSNXB_l.webp', NULL, '2025-01-11 23:29:49', '2025-06-15 00:46:32', 'available'),
(12, 15, 'Oficial Gamecube Indigo Controller', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 48.99, 71.99, 'Colecionáveis', 10, 3.8, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_4902370505559_l.webp', NULL, '2025-01-11 23:31:19', '2025-06-15 00:46:34', 'available'),
(13, 15, 'Gamecube, Indigo (Sem Jogo), Sem Caixa', 'Um olhar para o hardware do Nintendo Game Cube e você sabe que é diferente.\r\n\r\nA forma compacta não é apenas prática, que o projeto original é um símbolo do compromisso da Nintendo para se concentrar na criação de jogos de vídeo mais original e inovador do mundo.', 150.00, NULL, 'Colecionáveis', 10, 2.7, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_045496370008_l.webp', NULL, '2025-01-11 23:31:19', '2025-06-12 21:34:30', 'available'),
(14, 15, 'Gamecube, Tales of Symphonia L.E + G.B Player,(Sem Jogo)\n', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 225.00, 250.00, 'Retro Gaming', 10, 3.0, 'https://pt.static.webuy.com/product_images/Jogos/GameCube%20Consolas/SGCUGAMETS003_l.jpg', NULL, '2025-01-11 23:44:12', '2025-06-18 21:59:53', 'available'),
(15, 15, 'Nintendo Switch Lite Consola, 32GB Azul, Caixa', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 165.00, 180.00, 'Consolas', 10, 2.8, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_0454964NSL32BL01_l.webp', NULL, '2025-01-11 23:44:12', '2025-06-15 00:46:38', 'available'),
(16, 15, 'Switch Consola, 64GB OLED + Branca Joy-Con', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 265.00, NULL, 'Consolas', 10, 2.8, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_0454964NS64V3WH02_l.webp', NULL, '2025-01-11 23:44:12', '2025-06-15 00:46:40', 'available'),
(17, 15, 'Generico 3rd Party Joy-Con Comfort Grip', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 15.00, NULL, 'Acessórios', 10, 3.0, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_SNSWVAL08_l.webp', NULL, '2025-01-11 23:44:12', '2025-06-18 21:59:53', 'available'),
(18, 15, 'Official Nintendo Switch Preto Carry Case', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 8.00, NULL, 'Acessórios', 10, 2.8, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_45496430597_l.webp', NULL, '2025-01-11 23:44:12', '2025-06-15 00:46:43', 'available'),
(19, 15, 'Nintendo Switch Joy-Con Direito Verde Pastel, Sem Correia', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 42.00, NULL, 'Acessórios', 10, 3.2, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_04549643PGRR_l.webp', NULL, '2025-01-11 23:44:12', '2025-06-15 00:46:41', 'available'),
(20, 15, 'PS Vita Preto 3G, Descontada', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 140.00, 155.00, 'Retro Gaming', 10, 3.2, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_SPSVNEG3GC_l.webp', NULL, '2025-01-11 23:44:12', '2025-06-15 00:46:45', 'available'),
(21, 19, 'King Kong pc game', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 1.50, NULL, 'Jogos', 10, 3.5, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_3307210201669_l.jpg', NULL, '2025-01-11 23:44:12', '2025-06-18 21:59:53', 'available'),
(22, 15, 'Pro Evolution Soccer 6', 'PES6 para o PS2 é quase idênticos à versão 360 magistral: jogável através do éter, graças à compatibilidade jogar Net e PSP-para-PSP, mas com Visual de sempre-assim-ligeiramente degradada. Não importa. Pro Evolution tem sido sempre a jogabilidade e 6 tem isso tudo e muito mais. Esta vez ao redor, o sistema de disparo foi refinado. Os jogadores são capazes de assumir um pop de gol mais instintivamente do que da última vez para fora, e voleios e metade-voleios tiveram um re-vamp também. Fintas, ao contrário, dribles e reter a posse após um tackle de slide são também novos recursos para 2006. As coisas podem ficar mais físicas no PES6, com defensores fechando os atacantes muito mais em evidência, defensiva de bloqueio (legal ou ilegal) e esperto novo se transforma para os jogadores mais altamente cotados no jogo. Essas coisas levam tempo para aprender, mas é muito divertido ficar lá.', 2.00, NULL, 'Jogos', 10, 3.3, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_4012927120088_l.webp', NULL, '2025-01-11 23:44:12', '2025-06-18 22:01:36', 'available'),
(23, 18, 'Spider-Man 2', 'Desta vez lá é onde que você não pode ir.\n\nDois anos se passaram desde que Peter Parker primeiro hit nas ruas de Nova York como o combatente do crime em conflito Spider-Man. Agora ele encontra-se lutando contra seu vilão mais diabólico, no entanto, a mecanizada, vários tentáculos Doc Ock. O Nefasto Doc Ock foi Dr. Otto Octavius, um brilhante físico nuclear. Mas um acidente transformou-o de um pesquisador tímido para criminosos insano megalomaníaco que culpa Spider-Man para sua transformação horrível. Agora o cientista Peter uma vez idolatrado por seu notável intelecto marcou nosso lançador-web para a morte.', 6.00, NULL, 'Jogos', 1, 3.3, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_5030917027598_l.webp', NULL, '2025-01-11 23:44:12', '2025-06-12 21:34:30', 'available'),
(24, 22, 'Gameboy Advance, Branco', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.', 90.00, 100.00, 'Retro Gaming', 1, 3.5, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_SNINGBACAW002_l.webp', NULL, '2025-02-19 00:10:21', '2025-06-16 19:15:28', 'available'),
(67, 28, 'sla meu fi n ta dando', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sociosqu platea lorem sollicitudin phasellus eu a augue taciti nibh lectus hac sem taciti vivamus primis. Erat nec taciti sed augue vivamus volutpat finibus.\r\nEu nibh quis conubia maecenas turpis hendrerit. Ligula nostra ornare sollicitudin in pulvinar vitae posuere. Sed quis netus elit varius senectus sollicitudin mauris pulvinar vitae eros leo vitae. Maecenas suscipit arcu orci suspendisse est.\r\nNam consectetur fermentum tempor fusce ac donec. Consectetur ac porttitor rutrum suscipit donec nec tincidunt condimentum fames phasellus at nisi sed sit. Faucibus mollis taciti ornare ante iaculis sit condimentum himenaeos dictum quisque rutrum lorem viverra. Lectus feugiat justo lectus litora aliquet netus varius tempor.\r\nUrna eros sodales lacinia euismod ut ac quis. Tincidunt ac turpis sed vehicula dui fringilla sociosqu leo varius. Aliquam nulla ullamcorper odio urna pharetra tempus maecenas eros porta sapien.', 25.40, NULL, 'Colecionáveis', 1, 0.0, 'http://poggers.ddns.net/PoggTech-APIs/uploads/img_684deff2256a45.02643957.jpg', 'Braga, Rua 21 de Agosto, Vimeiro, Portugal', '2025-06-14 21:56:02', '2025-06-16 23:22:16', 'available');

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
CREATE TRIGGER `trg_quantity_above_zero` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN
    IF NEW.quantity > 0 THEN
        SET NEW.status = 'available';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_quantity_zero` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN
    IF NEW.quantity = 0 THEN
        IF NEW.seller_type = 'admin' THEN
            SET NEW.status = 'nostock';
        ELSEIF NEW.seller_type = 'user' THEN
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
-- Table structure for table `reviews`
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
-- Dumping data for table `reviews`
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
(188, 52, 22, 5, 'ola2', '2025-06-18 22:01:16');

--
-- Triggers `reviews`
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
(470, 52, 8, 1, 1, '2025-06-17 21:01:30'),
(479, 52, 12, 1, 1, '2025-06-18 08:52:34'),
(480, 52, 15, 1, 1, '2025-06-18 08:52:36'),
(482, 52, 6, 1, 1, '2025-06-18 08:55:33'),
(483, 52, 20, 1, 1, '2025-06-18 08:56:35'),
(484, 52, 14, 1, 1, '2025-06-18 08:56:55'),
(507, 52, 23, 0, 1, '2025-06-23 15:23:12'),
(508, 52, 9, 0, 1, '2025-06-23 15:23:17'),
(509, 52, 17, 0, 1, '2025-06-23 15:23:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `firebase_uid`, `name`, `email`, `avatar`, `phone`, `type`, `isActive`, `created_at`) VALUES
(15, 'bCXhKqZvrYTAZm867tMzpyNWWz33', 'Kauan Fortunato', 'kauanmatiasfortunato@gmail.com', 'http://poggers.ddns.net/PoggTech-APIs/uploads/avatars/avatar_6854376ddbd0e5.60378070.jpg', '910937520', 'admin', 1, '2024-11-27 20:52:50'),
(18, 'A2YOrJ9js0ZUcec9r9EW9o4kXEZ2', 'Diogo Dioguinho', 'sayodiggo@gmail.com', 'http://poggers.ddns.net/PoggTech-APIs/uploads/avatars/poggers-11645679-default-avatar.png', ' 910310242', 'admin', 1, '2024-12-02 00:17:17'),
(19, 'gO3K6796eQTMiVgss8MTarijpCg1', 'Rodrigo Alexandre', 'rodrigoalexandre@gmail.com', 'http://poggers.ddns.net/PoggTech-APIs/uploads/avatars/poggers-11645679-default-avatar.png', '930 463 424', 'user', 1, '2024-12-06 22:35:17'),
(20, 'sC0UoxF2GwNtSiF2dWTo9UTFxN22', 'Bitman Biman', 'bitmanniggers@gmail.com', 'http://poggers.ddns.net/PoggTech-APIs/uploads/avatars/poggers-11645679-default-avatar.png', '', 'user', 1, '2024-12-06 23:42:22'),
(21, 'dbfjtKdnmdPpYoA5WfIOqbr3KOD3', 'Joao Santos', 'joaosantos@gmail.com', 'http://poggers.ddns.net/PoggTech-APIs/uploads/avatars/poggers-11645679-default-avatar.png', '', 'user', 1, '2024-12-09 18:02:46'),
(22, '0pFZo8kGEGgrBs780ERuVTQ94CA2', 'santos fortunato', 'santosfortunato@gmail.com', 'http://poggers.ddns.net/PoggTech-APIs/uploads/avatars/poggers-11645679-default-avatar.png', '', 'user', 1, '2024-12-09 18:08:58'),
(25, 'QFTTiIROtzLbSR0GpAslYStGYwD2', 'Diogo', 'diogadaesteves@gmail.com', 'http://poggers.ddns.net/PoggTech-APIs/uploads/avatars/poggers-11645679-default-avatar.png', '', 'user', 1, '2025-02-07 03:25:13'),
(28, '6P6mwx4gURUuk4CDPda8zQbcB1q1', 'Mordekai', 'mordekaias360@gmail.com', 'http://poggers.ddns.net/PoggTech-APIs/uploads/avatars/avatar_68503d2961fc17.32085439.jpg', '910937520', 'user', 1, '2025-03-10 17:49:41'),
(52, 'vbxr9cOIaCUTcNezNMg6BiaqoVF3', 'Kauan Fortunato', 'kauansitesaleatorios@gmail.com', 'http://poggers.ddns.net/PoggTech-APIs/uploads/avatars/avatar_6851ff9639e229.90938837.jpg', '910937520', 'user', 1, '2025-06-17 21:01:21'),
(56, 'mTzlbv4FhAcZVWDoI2lGdTiU7xX2', 'Kauan Fortunato', 'kauan1312@gmail.com', 'http://poggers.ddns.net/PoggTech-APIs/uploads/poggers-11645679-default-avatar.png', NULL, 'user', 1, '2025-06-21 22:15:03');

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
(38, 28, 'cNQrYoKhSM6dH3bJuAwcR8:APA91bFfhjZ0pEB_D54I_lNHUEkVzi2xl16-Xpiy7agTAy3uG4HrKWpYP1f93bV5oMzugcut77XFDkCX8Phw4xN0ygEQt_u0cPkCTBV5OjbaJ8m4tVfjMhU', '2025-06-04 08:49:10'),
(40, 28, 'f_6YJWjtQ3in1Yz7MgMSxC:APA91bGOYT-tDAmo3H29OATztCwX6JAQXpiTDJ7v2sBWr3Pa6lE262rubmRGqNdiyb0cccCYBMFkCQMQptJnuGvvdVAJjhB3iYRygT8p9cW8pIdJP2pPTOU', '2025-06-05 12:35:34'),
(86, 28, 'cfTlNz3vQ5q-M5jAGegdWG:APA91bG0FUU2f20E95el8SWL2Nlb2ltApE7RiaRfEnJLMqNDmDVjRv4bIYAb59evEms3zcNSxqjweHg-kVN2FnVBAQ07ng4beCXGNcY3r9ZCImFc0ntgkkU', '2025-06-24 22:05:05');

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
(1429, 28, 67, 'view', '2025-06-14 21:56:11'),
(1430, 28, 13, 'view', '2025-06-14 22:18:13'),
(1431, 28, 13, 'view', '2025-06-14 22:18:21'),
(1432, 28, 67, 'view', '2025-06-14 22:29:37'),
(1433, 28, 13, 'view', '2025-06-14 22:32:41'),
(1434, 28, 13, 'view', '2025-06-14 22:34:43'),
(1435, 28, 13, 'view', '2025-06-14 22:35:58'),
(1436, 28, 67, 'view', '2025-06-14 22:36:06'),
(1437, 28, 12, 'view', '2025-06-15 00:27:38'),
(1438, 28, 15, 'view', '2025-06-15 00:27:41'),
(1439, 28, 13, 'view', '2025-06-15 00:37:41'),
(1440, 28, 14, 'view', '2025-06-15 00:39:08'),
(1441, 28, 14, 'view', '2025-06-15 00:45:45'),
(1442, 28, 13, 'view', '2025-06-15 00:45:50'),
(1443, 28, 13, 'view', '2025-06-15 00:47:01'),
(1444, 28, 14, 'view', '2025-06-15 00:47:04'),
(1445, 28, 15, 'view', '2025-06-15 13:12:22'),
(1446, 28, 67, 'view', '2025-06-15 14:00:48'),
(1447, 28, 67, 'view', '2025-06-15 14:01:49'),
(1448, 28, 67, 'view', '2025-06-15 14:01:52'),
(1449, 28, 67, 'view', '2025-06-15 14:16:23'),
(1450, 28, 67, 'view', '2025-06-15 14:16:26'),
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
(1483, 28, 67, 'view', '2025-06-15 22:44:44'),
(1484, 28, 67, 'view', '2025-06-16 00:09:51'),
(1485, 28, 67, 'view', '2025-06-16 00:09:57'),
(1486, 28, 5, 'view', '2025-06-16 00:10:22'),
(1487, 28, 67, 'view', '2025-06-16 00:11:28'),
(1488, 28, 67, 'view', '2025-06-16 11:18:11'),
(1489, 28, 67, 'view', '2025-06-16 11:18:14'),
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
(1500, 28, 67, 'view', '2025-06-16 12:39:15'),
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
(1528, 28, 67, 'view', '2025-06-16 19:03:47'),
(1529, 28, 67, 'view', '2025-06-16 19:05:14'),
(1530, 28, 24, 'view', '2025-06-16 19:05:21'),
(1531, 28, 24, 'view', '2025-06-16 19:06:02'),
(1532, 28, 24, 'view', '2025-06-16 19:06:30'),
(1533, 28, 24, 'view', '2025-06-16 19:07:52'),
(1534, 28, 24, 'view', '2025-06-16 19:08:09'),
(1535, 28, 24, 'view', '2025-06-16 19:09:46'),
(1536, 28, 24, 'view', '2025-06-16 19:10:57'),
(1537, 28, 24, 'view', '2025-06-16 19:11:13'),
(1538, 28, 67, 'view', '2025-06-16 19:11:17'),
(1539, 28, 5, 'view', '2025-06-16 19:11:24'),
(1540, 28, 5, 'view', '2025-06-16 20:21:17'),
(1541, 28, 5, 'view', '2025-06-16 20:35:57'),
(1542, 28, 5, 'view', '2025-06-16 21:17:16'),
(1543, 28, 5, 'view', '2025-06-16 21:17:20'),
(1544, 28, 5, 'view', '2025-06-16 21:22:30'),
(1545, 28, 5, 'view', '2025-06-16 21:26:19'),
(1546, 28, 5, 'view', '2025-06-16 21:36:48'),
(1547, 28, 67, 'view', '2025-06-16 21:36:49'),
(1548, 28, 67, 'view', '2025-06-16 21:39:24'),
(1549, 28, 67, 'view', '2025-06-16 21:39:26'),
(1550, 28, 67, 'view', '2025-06-16 21:40:02'),
(1551, 28, 67, 'view', '2025-06-16 21:56:39'),
(1552, 28, 5, 'view', '2025-06-16 21:59:30'),
(1553, 28, 67, 'view', '2025-06-16 22:07:39'),
(1554, 28, 5, 'view', '2025-06-16 22:08:04'),
(1555, 28, 3, 'view', '2025-06-16 22:08:10'),
(1556, 28, 67, 'view', '2025-06-16 23:22:27'),
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
(1636, 52, 67, 'view', '2025-06-23 15:18:25'),
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
(1667, 15, 22, 'view', '2025-06-24 09:07:04');
INSERT INTO `user_history` (`user_history_id`, `user_id`, `product_id`, `action`, `accessed_at`) VALUES
(1668, 15, 12, 'view', '2025-06-24 09:07:06'),
(1669, 15, 5, 'view', '2025-06-24 09:07:09'),
(1670, 15, 5, 'view', '2025-06-24 09:08:28'),
(1671, 15, 16, 'view', '2025-06-24 09:09:11'),
(1672, 15, 9, 'view', '2025-06-24 09:09:17'),
(1673, 15, 9, 'view', '2025-06-24 22:04:46'),
(1674, 28, 5, 'view', '2025-06-24 22:05:09');

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
,`seller_type` enum('admin','user')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_chats_details`
-- (See below for the actual view)
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
-- Stand-in structure for view `v_message_details`
-- (See below for the actual view)
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
-- Stand-in structure for view `v_order_details`
-- (See below for the actual view)
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
-- Stand-in structure for view `v_popular_products`
-- (See below for the actual view)
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
-- Stand-in structure for view `v_product_details`
-- (See below for the actual view)
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
-- Stand-in structure for view `v_review_details`
-- (See below for the actual view)
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
(3, 28, 999284.13),
(4, 18, 0.00),
(6, 15, 99998890.19),
(8, 21, 0.00),
(9, 19, 0.00),
(10, 25, 0.00),
(11, 20, 0.00),
(33, 52, 280.40),
(37, 56, 1.00);

-- --------------------------------------------------------

--
-- Structure for view `v_cart_fav`
--
DROP TABLE IF EXISTS `v_cart_fav`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cart_fav`  AS SELECT `s`.`saved_id` AS `favorite_id`, `s`.`product_id` AS `product_id`, `s`.`user_id` AS `user_id`, `s`.`tipo` AS `tipo`, `s`.`quantity` AS `quantity`, `s`.`created_at` AS `created_at`, `p`.`title` AS `title`, `p`.`price` AS `price`, `p`.`category` AS `category`, `p`.`cover` AS `cover`, `u`.`type` AS `seller_type` FROM ((`saved` `s` join `products` `p` on(`s`.`product_id` = `p`.`product_id`)) left join `users` `u` on(`p`.`user_id` = `u`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_chats_details`
--
DROP TABLE IF EXISTS `v_chats_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_chats_details`  AS SELECT `chats`.`chat_id` AS `chat_id`, `chats`.`product_id` AS `product_id`, `products`.`title` AS `product_title`, `products`.`price` AS `product_price`, `products`.`cover` AS `cover_product`, `chats`.`seller_id` AS `seller_id`, `chats`.`buyer_id` AS `buyer_id`, `chats`.`timestamp` AS `timestamp` FROM (`chats` join `products` on(`chats`.`product_id` = `products`.`product_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_message_details`
--
DROP TABLE IF EXISTS `v_message_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_message_details`  AS SELECT `m`.`id_message` AS `id_message`, `c`.`chat_id` AS `chat_id`, `p`.`user_id` AS `owner_id`, `m`.`sender_id` AS `sender_id`, `sender`.`name` AS `sender_name`, CASE WHEN `m`.`sender_id` = `c`.`seller_id` THEN `c`.`buyer_id` ELSE `c`.`seller_id` END AS `receiver_id`, CASE WHEN `m`.`sender_id` = `c`.`seller_id` THEN `buyer`.`name` ELSE `seller`.`name` END AS `receiver_name`, `c`.`product_id` AS `product_id`, `p`.`title` AS `product_title`, `p`.`cover` AS `product_cover`, `m`.`message` AS `message`, cast(`m`.`timestamp` as date) AS `date_raw`, CASE WHEN cast(`m`.`timestamp` as date) = curdate() THEN 'Hoje' WHEN cast(`m`.`timestamp` as date) = curdate() - interval 1 day THEN 'Ontem' ELSE date_format(`m`.`timestamp`,'%d de %M') END AS `date_label`, `m`.`timestamp` AS `TIMESTAMP`, date_format(`m`.`timestamp`,'%H:%i') AS `timestamp_format` FROM (((((`messages` `m` join `chats` `c` on(`m`.`chat_id` = `c`.`chat_id`)) join `products` `p` on(`c`.`product_id` = `p`.`product_id`)) join `users` `sender` on(`m`.`sender_id` = `sender`.`user_id`)) join `users` `seller` on(`c`.`seller_id` = `seller`.`user_id`)) join `users` `buyer` on(`c`.`buyer_id` = `buyer`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_order_details`
--
DROP TABLE IF EXISTS `v_order_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_order_details`  AS SELECT `o`.`id` AS `order_id`, `o`.`user_id` AS `user_id`, `o`.`status` AS `status`, `o`.`created_at` AS `created_at`, `oi`.`product_id` AS `product_id`, `oi`.`quantity` AS `quantity`, `oi`.`unit_price` AS `unit_price`, `oi`.`quantity`* `oi`.`unit_price` AS `total_item_value`, `p`.`title` AS `product_title`, `p`.`cover` AS `product_cover`, `p`.`category` AS `product_category` FROM ((`orders` `o` join `order_items` `oi` on(`o`.`id` = `oi`.`order_id`)) join `products` `p` on(`oi`.`product_id` = `p`.`product_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_popular_products`
--
DROP TABLE IF EXISTS `v_popular_products`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_popular_products`  AS SELECT `p`.`product_id` AS `product_id`, `p`.`user_id` AS `user_id`, `u`.`name` AS `user_name`, `p`.`title` AS `title`, `p`.`description` AS `description`, `p`.`price` AS `price`, `p`.`price_before` AS `price_before`, round((`p`.`price_before` - `p`.`price`) / `p`.`price_before` * 100,2) AS `discount_percentage`, `p`.`category` AS `category`, `p`.`quantity` AS `quantity`, `p`.`rating` AS `rating`, `p`.`cover` AS `cover`, `p`.`created_at` AS `created_at`, `p`.`updated_at` AS `updated_at`, `u`.`type` AS `seller_type`, `p`.`status` AS `status`, `pv`.`view_count` AS `view_count` FROM ((`products` `p` join `products_views` `pv` on(`p`.`product_id` = `pv`.`product_id`)) left join `users` `u` on(`p`.`user_id` = `u`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_product_details`
--
DROP TABLE IF EXISTS `v_product_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_product_details`  AS SELECT `p`.`product_id` AS `product_id`, `p`.`user_id` AS `user_id`, `u`.`name` AS `user_name`, `p`.`title` AS `title`, `p`.`description` AS `description`, `p`.`price` AS `price`, `p`.`price_before` AS `price_before`, round((`p`.`price_before` - `p`.`price`) / `p`.`price_before` * 100,2) AS `discount_percentage`, `p`.`category` AS `category`, `p`.`quantity` AS `quantity`, `p`.`cover` AS `cover`, `p`.`rating` AS `rating`, `p`.`location` AS `location`, `p`.`created_at` AS `created_at`, `p`.`updated_at` AS `updated_at`, `u`.`type` AS `seller_type`, `p`.`status` AS `status`, count(`r`.`review_id`) AS `review_count` FROM ((`products` `p` left join `reviews` `r` on(`r`.`product_id` = `p`.`product_id`)) left join `users` `u` on(`u`.`user_id` = `p`.`user_id`)) GROUP BY `p`.`product_id` ;

-- --------------------------------------------------------

--
-- Structure for view `v_product_full_details`
--
DROP TABLE IF EXISTS `v_product_full_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_product_full_details`  AS SELECT `p`.`product_id` AS `product_id`, `p`.`user_id` AS `user_id`, `p`.`title` AS `title`, `p`.`description` AS `description`, `p`.`price` AS `price`, `p`.`price_before` AS `price_before`, round((`p`.`price_before` - `p`.`price`) / `p`.`price_before` * 100,2) AS `discount_percentage`, `p`.`category` AS `category`, `p`.`quantity` AS `quantity`, `p`.`rating` AS `rating`, `p`.`cover` AS `cover`, `p`.`location` AS `location`, date_format(`p`.`created_at`,'%d/%m/%y %H:%i') AS `created_at`, date_format(`p`.`updated_at`,'%d/%m/%y %H:%i') AS `updated_at`, `u`.`type` AS `seller_type`, `p`.`status` AS `status`, ifnull(`pv`.`view_count`,0) AS `views`, count(distinct `f`.`saved_id`) AS `favorites_count` FROM (((`products` `p` left join `users` `u` on(`p`.`user_id` = `u`.`user_id`)) left join `products_views` `pv` on(`p`.`product_id` = `pv`.`product_id`)) left join `saved` `f` on(`p`.`product_id` = `f`.`product_id`)) GROUP BY `p`.`product_id` ;

-- --------------------------------------------------------

--
-- Structure for view `v_review_details`
--
DROP TABLE IF EXISTS `v_review_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_review_details`  AS SELECT `r`.`review_id` AS `review_id`, `r`.`product_id` AS `product_id`, `r`.`user_id` AS `user_id`, `u`.`name` AS `user_name`, `u`.`avatar` AS `user_avatar`, `r`.`rating` AS `rating`, `r`.`comment` AS `comment`, `r`.`created_at` AS `created_at` FROM (`reviews` `r` join `users` `u` on(`r`.`user_id` = `u`.`user_id`)) ;

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
  ADD KEY `product_id` (`product_id`),
  ADD KEY `chats_ibfk_2` (`buyer_id`),
  ADD KEY `chats_ibfk_3` (`seller_id`);

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
  ADD KEY `messages_ibfk_2` (`chat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `payments_ibfk_2` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_category` (`category`);
ALTER TABLE `products` ADD FULLTEXT KEY `title` (`title`,`description`,`category`);
ALTER TABLE `products` ADD FULLTEXT KEY `title_2` (`title`,`description`,`category`);

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
  ADD UNIQUE KEY `idx_product_user` (`product_id`,`user_id`),
  ADD KEY `reviewer_id` (`user_id`);

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
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=463;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `saved`
--
ALTER TABLE `saved`
  MODIFY `saved_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=512;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `users_tokens`
--
ALTER TABLE `users_tokens`
  MODIFY `id_token` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `user_history`
--
ALTER TABLE `user_history`
  MODIFY `user_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1675;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chats_ibfk_3` FOREIGN KEY (`seller_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`chat_id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

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
