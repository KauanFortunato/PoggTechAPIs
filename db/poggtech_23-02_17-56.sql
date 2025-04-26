-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2025 at 01:56 AM
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
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`, `created_at`) VALUES
(1, 'Consolas', 'Consolas de todas as marcas', '2024-11-23 21:49:49'),
(2, 'Jogos', 'Videojogos', '2024-11-23 21:49:49'),
(3, 'Acessórios', 'Dispositivos para usar com consolas', '2024-11-23 21:49:49');

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
(1, 4, '2025-02-17 19:40:22'),
(17, 23, '2025-02-22 18:14:33');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `favorite_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tipo` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`favorite_id`, `user_id`, `product_id`, `tipo`, `created_at`) VALUES
(128, 15, 24, 1, '2025-02-22 23:20:52');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `gallery_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `caption` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id_message`, `chat_id`, `sender_id`, `receiver_id`, `message`, `timestamp`) VALUES
(20, 1, 15, 18, 'E a Margarida como vai AKA clarinha AKA clarinha AKA clara AKA cla AKA cl AKA c?', '2025-02-17 19:44:43'),
(74, 1, 15, 18, 'K', '2025-02-19 08:48:56'),
(75, 1, 15, 18, 'Jj', '2025-02-19 08:49:00'),
(76, 1, 15, 18, 'Hjj', '2025-02-19 08:49:03'),
(77, 1, 18, 15, 'Gay', '2025-02-19 10:41:07'),
(78, 1, 15, 18, 'Nigga', '2025-02-19 10:41:15'),
(79, 1, 18, 15, 'O brunao é bem gostoso', '2025-02-19 10:41:16'),
(80, 1, 15, 18, '3', '2025-02-19 10:41:23'),
(81, 1, 15, 18, 'Ahm?', '2025-02-19 10:41:26'),
(82, 1, 18, 15, 'A', '2025-02-19 10:41:33'),
(83, 1, 18, 15, 'A', '2025-02-19 10:41:34'),
(84, 1, 18, 15, 'D', '2025-02-19 10:41:35'),
(85, 1, 15, 18, 'Nigga stop spamenting in my app because ele é ruim', '2025-02-19 10:42:06'),
(86, 1, 18, 15, 'Aquelas gaja filha da puta, tava a falar bem burra vão trabalhar de coveiro', '2025-02-19 10:42:09'),
(87, 1, 18, 15, 'Porta do crlh', '2025-02-19 10:42:18'),
(88, 1, 15, 18, 'Nigga', '2025-02-19 10:42:20'),
(89, 1, 18, 15, 'Ola', '2025-02-19 10:42:46'),
(90, 1, 15, 18, 'Ola', '2025-02-19 10:42:55'),
(91, 1, 18, 15, 'Filho da puta', '2025-02-19 10:43:06'),
(92, 1, 15, 18, 'Imundo', '2025-02-19 12:15:41'),
(93, 1, 15, 18, 'Mama a minha pika', '2025-02-19 12:15:51'),
(94, 1, 18, 15, 'Gayy', '2025-02-19 12:16:39'),
(95, 1, 18, 15, 'Vagabunda', '2025-02-19 12:16:49'),
(96, 1, 18, 15, 'Safada', '2025-02-19 12:16:51'),
(97, 1, 18, 15, 'Gordo', '2025-02-19 12:16:59'),
(98, 1, 15, 18, 'Dhdh', '2025-02-20 11:54:16'),
(99, 1, 15, 18, 'Ola', '2025-02-20 11:54:17'),
(100, 1, 15, 18, 'Ola', '2025-02-20 11:54:18'),
(101, 1, 15, 18, 'Ola', '2025-02-20 11:54:19'),
(102, 1, 15, 18, 'Ila', '2025-02-20 11:54:20'),
(103, 1, 15, 18, 'Hdbnf', '2025-02-20 11:54:21'),
(104, 1, 15, 18, 'Bjfjdjfi', '2025-02-20 11:54:22'),
(105, 1, 15, 18, 'Ndjdjd', '2025-02-20 11:54:24'),
(106, 1, 15, 18, 'Arthur morgan', '2025-02-20 11:54:28'),
(108, 17, 15, 18, 'Oi, esse item está disponível?', '2025-02-22 18:14:33'),
(109, 17, 15, 18, 'Oi, esse item está disponível?', '2025-02-22 18:14:41'),
(110, 17, 15, 18, 'Oi, esse item está disponível?', '2025-02-22 18:15:13'),
(111, 17, 15, 18, 'Oi, esse item está disponível?', '2025-02-22 18:19:31');

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
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `seller_type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `user_id`, `title`, `description`, `price`, `price_before`, `category`, `image_url`, `created_at`, `updated_at`, `seller_type`) VALUES
(3, 15, 'Xbox Series X, 1tb, Preto', 'A nova série Xbox Jogue milhares de jogos em quatro gerações de console – todos os jogos têm uma ótima aparência e funcionam perfeitamente no Xbox Series\r\nExperimente velocidade e desempenho de próxima geração com Xbox Velocity Architecture, com SSD personalizado e software integrado\r\nJogue milhares de jogos de quatro gerações de Xbox com compatibilidade retroativa, incluindo títulos otimizados no lançamento\r\nO Xbox O Game Pass Ultimate inclui mais de 100 jogos de alta qualidade para consoles, PC, dispositivos móveis Android, multijogador online e uma assinatura do EA Play por um baixo preço mensal (assinatura vendida separadamente).\r\nUm Xbox Smart Delivery permite que você jogue a melhor versão do seu jogo, independentemente do console que você usa', 553.02, 590.23, 'Consolas', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.frandroid.com%2Fwp-content%2Fuploads%2F2019%2F12%2Fmicrosoft-xbox-series-x-frandroid.png&f=1&nofb=1&ipt=281df20b316491d50fe00567631c17c72c5f055c2f346eb4a1d418755b3f64e4&ipo=images', '2024-12-05 20:28:39', '2025-02-21 19:12:21', 'admin'),
(4, 18, 'Xbox 360', 'Console em bom estado', 110.98, 120.00, 'Consolas', 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.pngall.com%2Fwp-content%2Fuploads%2F2016%2F07%2FXbox-Free-Download-PNG.png&f=1&nofb=1&ipt=f1e2015ce576a3b63e40ab904d61db31b73a96df9fd250d40612ce6475e4f112&ipo=images', '2025-01-09 18:40:07', '2025-02-21 19:12:21', 'admin'),
(5, 19, '2DS Azul/Preto', 'O Nintendo 2DS mantém muitas das mesmas características de hardware como o Nintendo DS 3 incluindo o mesmo Nintendo 3DS gameplay controla, ao contrário de compatibilidade com a vasta biblioteca existente de jogos de Nintendo DS, bem como recursos de conectividade sem fio, como acesso a Nintendo eShop, além de funcionalidade StreetPass e o SpotPass.', 85.00, 122.00, 'Consolas', 'https://pt.static.webuy.com/product_images/Jogos/3DS%20Consolas/S2DSAZUC_l.jpg', '2025-01-09 18:59:43', '2025-02-21 19:12:21', 'user'),
(6, 15, 'Grand Theft Auto V (5) 2 discos', 'Los Santos - uma alastrando sun-soaked metrópole cheio de self-help gurus, starlets, e desvanecimento celebridades, inveja do ocidental mundo, agora struggling para stay afloat em uma era de econômica incerteza e barato reality TV.\r\n\r\nAmidst o turmoil, três muito diferentes criminosos enredo suas próprias chances de sobrevivência e sucesso: Franklin, antiga rua gângster, agora procurando real oportunidades e grave dinheiro; Michael, um profissional ex-con aposentadoria é um muito menos do que ele esperança isso Seria e Trevor, um maníaco violento dirigido pela próxima grande pontuação. Ficando sem opções, a tripulação arrisca tudo em uma série de assaltos ousados e perigosas que podem defini-las pelo resto da vida.\r\n\r\nO maior, mais dinâmica e mais diversas abrir mundo jamais criado, Grand Theft Auto V combina narrativa e jogabilidade em novas formas, como jogadores repetidamente saltar dentro e fora da vida dos três personagens de chumbo do jogo, jogando todos os lados da história do jogo entrelaçadas.\r\n\r\nTodas as características clássicas da inovadora série de retorno, incluindo a incrível atenção ao detalhe e Grand Theft Auto sombriamente humorístico leve na cultura moderna, ao lado de uma abordagem nova e ambiciosa para abrir o mundo multiplayer.', 15.00, 20.00, 'Jogos', 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.mobygames.com%2Fimages%2Fcovers%2Fl%2F310047-grand-theft-auto-v-xbox-360-front-cover.png&f=1&nofb=1&ipt=a5a027b8d145bae2e159a60e0958edc92e65b02d9d1624ac08dd830a1b841c64&ipo=images', '2025-01-09 18:59:43', '2025-02-21 19:13:26', 'admin'),
(7, 15, 'New Super Mario Bros', 'New Super Mario Bros características enorme vívida 2D mundos inspiraram por aqueles das aventuras de Mario clássicas, mas combinado com lindamente prestados personagens 3D que quase parecem saltar para fora da tela. Cada mundo tem um tema diferente e apresenta vários níveis, que devem ser concluídos antes de avançar para o próximo. Os jogadores também devem dominar mini fortaleza do mundo cada e bater um personagem chefe antes que podem progredir para o próximo mundo. Só depois de derrotar todos os chefes um personagem será pronto para enfrentar o derradeiro desafio do Bowser ele mesmo.', 28.00, NULL, 'Jogos', 'https://pt.static.webuy.com/product_images/Jogos/DS%20Jogos/045496463106_l.jpg', '2025-01-11 23:26:18', '2025-01-11 23:26:18', 'admin'),
(8, 15, 'Inazuma Eleven', 'Sequências de anime cativante enriquecem o enredo nesta aventura e os jogadores são capazes de explorar a cidade no jogo para procurar potenciais companheiros de equipe. Existem mais de 1000 personagens no jogo que você pode explorar, cada um com suas próprias estatísticas, habilidades únicas e habilidades especiais.', 18.00, 20.00, 'Jogos', 'https://pt.static.webuy.com/product_images/Jogos/DS%20Jogos/045496470685_l.jpg', '2025-01-11 23:26:18', '2025-02-21 19:12:21', 'admin'),
(9, 15, 'PS4 Official DualShock 4 Branco Controller (V2)', NULL, 55.92, NULL, 'Acessórios', 'https://pt.static.webuy.com/product_images/Jogos/Playstation4%20Acessorios/0711719894650_l.jpg', '2025-01-11 23:29:49', '2025-01-11 23:29:49', 'user'),
(10, 15, 'Playstation Move Motion Controller V1 (CECH-ZCM 1) (PS3/PS4)', 'PlayStation Move redefine os jogos de movimento com experiência de jogo mais envolvente e realista só é possível no sistema PlayStation3. O controlador simples, fácil de usar captura uma gama completa de movimento, dando-lhe controle final sobre como você joga o jogo. Com uma variada selecção de jogos e os novos lançamento todo o tempo, pode desfrutar de horas de diversão com amigos e família.', 12.32, NULL, 'Acessórios', 'https://pt.static.webuy.com/product_images/Jogos/Playstation4%20Acessorios/SPS3ACCMOVE_l.jpg', '2025-01-11 23:29:49', '2025-01-11 23:29:49', 'admin'),
(11, 15, 'Xbox 360 Kinect (Sem FA)', NULL, 10.00, NULL, 'Acessórios', 'https://pt.static.webuy.com/product_images/Jogos/Xbox%20360%20Acess%C3%B3rios/S360KINSNXB_l.jpg', '2025-01-11 23:29:49', '2025-01-11 23:29:49', 'admin'),
(12, 15, 'Oficial Gamecube Indigo Controller', NULL, 48.99, 71.99, 'Acessórios', 'https://pt.static.webuy.com/product_images/Jogos/GameCube%20Acess%C3%B3rios/4902370505559_l.jpg', '2025-01-11 23:31:19', '2025-02-21 19:12:21', 'admin'),
(13, 15, 'Gamecube, Indigo (Sem Jogo), Sem Caixa', 'Um olhar para o hardware do Nintendo Game Cube e você sabe que é diferente.\r\n\r\nA forma compacta não é apenas prática, que o projeto original é um símbolo do compromisso da Nintendo para se concentrar na criação de jogos de vídeo mais original e inovador do mundo.', 150.00, NULL, 'Consolas', 'https://pt.static.webuy.com/product_images/Jogos/GameCube%20Consolas/045496370008_l.jpg', '2025-01-11 23:31:19', '2025-01-11 23:31:19', 'admin'),
(14, 15, 'Gamecube, Tales of Symphonia L.E + G.B Player,(Sem Jogo)\r\n', NULL, 225.00, 250.00, 'Consolas', 'https://pt.static.webuy.com/product_images/Jogos/GameCube%20Consolas/SGCUGAMETS003_l.jpg', '2025-01-11 23:44:12', '2025-02-21 19:12:51', 'admin'),
(15, 15, 'Nintendo Switch Lite Consola, 32GB Azul, Caixa', NULL, 165.00, 180.00, 'Consolas', 'https://pt.static.webuy.com/product_images/Jogos/Switch%20Consolas/0454964NSL32BL01_l.jpg', '2025-01-11 23:44:12', '2025-02-21 19:12:58', 'admin'),
(16, 15, 'Switch Consola, 64GB OLED + Branca Joy-Con', NULL, 265.00, NULL, 'Consolas', 'https://pt.static.webuy.com/product_images/Jogos/Switch%20Consolas/0454964NS64V3WH02_l.jpg', '2025-01-11 23:44:12', '2025-01-11 23:44:12', 'admin'),
(17, 15, 'Generico 3rd Party Joy-Con Comfort Grip', '', 15.00, NULL, 'Acessórios', 'https://pt.static.webuy.com/product_images/Jogos/Switch%20Acessorios/SNSWVAL08_l.jpg', '2025-01-11 23:44:12', '2025-02-21 19:12:21', 'admin'),
(18, 15, 'Official Nintendo Switch Preto Carry Case', NULL, 8.00, NULL, 'Acessórios', 'https://pt.static.webuy.com/product_images/Jogos/Switch%20Acessorios/45496430597_l.jpg', '2025-01-11 23:44:12', '2025-01-11 23:44:12', 'admin'),
(19, 15, 'Nintendo Switch Joy-Con Direito Verde Pastel, Sem Correia', NULL, 42.00, NULL, 'Acessórios', 'https://pt.static.webuy.com/product_images/Jogos/Switch%20Acessorios/04549643PGRR_l.jpg', '2025-01-11 23:44:12', '2025-01-11 23:44:12', 'admin'),
(20, 15, 'PS Vita Preto 3G, Descontada', NULL, 140.00, 155.00, 'Consolas', 'https://pt.static.webuy.com/product_images/Jogos/PS%20Vita%20Consolas/SPSVNEG3GC_l.jpg', '2025-01-11 23:44:12', '2025-02-21 19:13:10', 'admin'),
(21, 15, 'King Kong', NULL, 1.50, NULL, 'Jogos', 'https://pt.static.webuy.com/product_images/Jogos/PC%20Jogos/3307210201669_l.jpg', '2025-01-11 23:44:12', '2025-01-11 23:44:12', 'admin'),
(22, 15, 'Pro Evolution Soccer 6', 'PES6 para o PS2 é quase idênticos à versão 360 magistral: jogável através do éter, graças à compatibilidade jogar Net e PSP-para-PSP, mas com Visual de sempre-assim-ligeiramente degradada. Não importa. Pro Evolution tem sido sempre a jogabilidade e 6 tem isso tudo e muito mais. Esta vez ao redor, o sistema de disparo foi refinado. Os jogadores são capazes de assumir um pop de gol mais instintivamente do que da última vez para fora, e voleios e metade-voleios tiveram um re-vamp também. Fintas, ao contrário, dribles e reter a posse após um tackle de slide são também novos recursos para 2006. As coisas podem ficar mais físicas no PES6, com defensores fechando os atacantes muito mais em evidência, defensiva de bloqueio (legal ou ilegal) e esperto novo se transforma para os jogadores mais altamente cotados no jogo. Essas coisas levam tempo para aprender, mas é muito divertido ficar lá.', 2.00, NULL, 'Jogos', 'https://pt.static.webuy.com/product_images/Jogos/Playstation2%20Jogos/4012927120088_l.jpg', '2025-01-11 23:44:12', '2025-01-11 23:44:12', 'admin'),
(23, 18, 'Spider-Man 2', 'Desta vez lá é onde que você não pode ir.\n\nDois anos se passaram desde que Peter Parker primeiro hit nas ruas de Nova York como o combatente do crime em conflito Spider-Man. Agora ele encontra-se lutando contra seu vilão mais diabólico, no entanto, a mecanizada, vários tentáculos Doc Ock. O Nefasto Doc Ock foi Dr. Otto Octavius, um brilhante físico nuclear. Mas um acidente transformou-o de um pesquisador tímido para criminosos insano megalomaníaco que culpa Spider-Man para sua transformação horrível. Agora o cientista Peter uma vez idolatrado por seu notável intelecto marcou nosso lançador-web para a morte.', 6.00, NULL, 'Jogos', 'https://pt.static.webuy.com/product_images/Jogos/Playstation2%20Jogos/5030917027598_l.jpg', '2025-01-11 23:44:12', '2025-01-11 23:44:12', 'user'),
(24, 15, 'Gameboy Advance, Branco', NULL, 90.00, 100.00, 'Consolas', 'https://pt.static.webuy.com/product_images/Jogos/GBA%20Consolas/SNINGBACAW002_l.jpg', '2025-02-19 00:10:21', '2025-02-21 19:12:36', 'user');

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
(3, 4),
(4, 8),
(6, 2),
(13, 3),
(15, 2),
(16, 7),
(17, 4),
(18, 1),
(19, 1),
(20, 1),
(21, 3),
(22, 4),
(23, 3),
(24, 9);

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
(15, 'bCXhKqZvrYTAZm867tMzpyNWWz33', 'Kauan', 'Fortunato', 'kauanmatiasfortunato@gmail.com', '910 937 234', '2024-11-27 20:52:50'),
(18, 'A2YOrJ9js0ZUcec9r9EW9o4kXEZ2', 'Diogo', 'Dioguinho', 'sayodiggo@gmail.com', '', '2024-12-02 00:17:17'),
(19, 'gO3K6796eQTMiVgss8MTarijpCg1', 'Rodrigo', 'Alexandre', 'rodrigoalexandre@gmail.com', '', '2024-12-06 22:35:17'),
(20, 'sC0UoxF2GwNtSiF2dWTo9UTFxN22', 'Bitman', 'Biman', 'bitman@gmail.com', '', '2024-12-06 23:42:22'),
(21, 'dbfjtKdnmdPpYoA5WfIOqbr3KOD3', 'Joao', 'Santos', 'joaosantos@gmail.com', '', '2024-12-09 18:02:46'),
(22, '0pFZo8kGEGgrBs780ERuVTQ94CA2', 'santos', 'fortunato', 'santosfortunato@gmail.com', '', '2024-12-09 18:08:58'),
(23, '55CpNAK9azXHrAS5rUYzxAakmvz1', 'Maria', 'Santos', 'maria@gmail.com', '', '2024-12-10 19:09:25'),
(25, 'QFTTiIROtzLbSR0GpAslYStGYwD2', 'Diogo', 'Esteves', 'diogadaesteves@gmail.com', '', '2025-02-07 03:25:13');

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

-- --------------------------------------------------------

--
-- Table structure for table `user_history`
--

CREATE TABLE `user_history` (
  `user_history_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `action` enum('view','buy','fav','') NOT NULL DEFAULT 'view',
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
(52, 15, 4, 'view', '2025-02-23 00:55:56');

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
,`created_at` timestamp
,`title` varchar(150)
,`price` decimal(10,2)
,`category` varchar(50)
,`image_url` varchar(255)
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
,`image_url` varchar(255)
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
,`image_url` varchar(255)
,`created_at` timestamp
,`updated_at` timestamp
,`seller_type` varchar(20)
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
,`image_product` varchar(255)
,`last_message_time` timestamp
,`last_message_time_format` varchar(10)
);

-- --------------------------------------------------------

--
-- Structure for view `v_cart_fav`
--
DROP TABLE IF EXISTS `v_cart_fav`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cart_fav`  AS SELECT `favorites`.`favorite_id` AS `favorite_id`, `favorites`.`product_id` AS `product_id`, `favorites`.`user_id` AS `user_id`, `favorites`.`tipo` AS `tipo`, `favorites`.`created_at` AS `created_at`, `products`.`title` AS `title`, `products`.`price` AS `price`, `products`.`category` AS `category`, `products`.`image_url` AS `image_url`, `products`.`seller_type` AS `seller_type` FROM (`favorites` join `products` on(`favorites`.`product_id` = `products`.`product_id`)) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_popular_products`  AS SELECT `p`.`product_id` AS `product_id`, `p`.`user_id` AS `user_id`, `p`.`title` AS `title`, `p`.`description` AS `description`, `p`.`price` AS `price`, `p`.`price_before` AS `price_before`, `p`.`category` AS `category`, `p`.`image_url` AS `image_url`, `p`.`created_at` AS `created_at`, `p`.`updated_at` AS `updated_at`, `p`.`seller_type` AS `seller_type`, `pv`.`view_count` AS `view_count` FROM (`products` `p` join `products_views` `pv` on(`p`.`product_id` = `pv`.`product_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_product_details`
--
DROP TABLE IF EXISTS `v_product_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_product_details`  AS SELECT `p`.`product_id` AS `product_id`, `p`.`user_id` AS `user_id`, `p`.`title` AS `title`, `p`.`description` AS `description`, `p`.`price` AS `price`, `p`.`price_before` AS `price_before`, round((`p`.`price_before` - `p`.`price`) / `p`.`price_before` * 100,2) AS `discount_percentage`, `p`.`category` AS `category`, `p`.`image_url` AS `image_url`, `p`.`created_at` AS `created_at`, `p`.`updated_at` AS `updated_at`, `p`.`seller_type` AS `seller_type` FROM `products` AS `p` ;

-- --------------------------------------------------------

--
-- Structure for view `v_user_chats`
--
DROP TABLE IF EXISTS `v_user_chats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user_chats`  AS SELECT `p`.`user_id` AS `owner_id`, `c`.`chat_id` AS `chat_id`, `c`.`product_id` AS `product_id`, `p`.`title` AS `product_title`, `p`.`price` AS `product_price`, `m`.`id_message` AS `id_message`, `m`.`sender_id` AS `user_id`, `m`.`receiver_id` AS `chat_with`, `u2`.`name` AS `chat_with_name`, `u2`.`last_name` AS `chat_with_last_name`, `m`.`message` AS `last_message`, `p`.`image_url` AS `image_product`, `m`.`timestamp` AS `last_message_time`, date_format(`m`.`timestamp`,'%H:%i') AS `last_message_time_format` FROM (((`chats` `c` join `messages` `m` on(`c`.`chat_id` = `m`.`chat_id`)) join `products` `p` on(`c`.`product_id` = `p`.`product_id`)) join `users` `u2` on(`m`.`receiver_id` = `u2`.`user_id`)) WHERE `m`.`timestamp` = (select max(`m2`.`timestamp`) from `messages` `m2` where `m2`.`chat_id` = `m`.`chat_id`)union select `p`.`user_id` AS `owner_id`,`c`.`chat_id` AS `chat_id`,`c`.`product_id` AS `product_id`,`p`.`title` AS `product_title`,`p`.`price` AS `product_price`,`m`.`id_message` AS `id_message`,`m`.`receiver_id` AS `user_id`,`m`.`sender_id` AS `chat_with`,`u1`.`name` AS `chat_with_name`,`u1`.`last_name` AS `chat_with_last_name`,`m`.`message` AS `last_message`,`p`.`image_url` AS `image_product`,`m`.`timestamp` AS `last_message_time`,date_format(`m`.`timestamp`,'%H:%i') AS `last_message_time_format` from (((`chats` `c` join `messages` `m` on(`c`.`chat_id` = `m`.`chat_id`)) join `products` `p` on(`c`.`product_id` = `p`.`product_id`)) join `users` `u1` on(`m`.`sender_id` = `u1`.`user_id`)) where `m`.`timestamp` = (select max(`m2`.`timestamp`) from `messages` `m2` where `m2`.`chat_id` = `m`.`chat_id`)  ;

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
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `user_id` (`user_id`),
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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_category` (`category`);

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
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_history`
--
ALTER TABLE `user_history`
  ADD PRIMARY KEY (`user_history_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users_tokens`
--
ALTER TABLE `users_tokens`
  MODIFY `id_token` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_history`
--
ALTER TABLE `user_history`
  MODIFY `user_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
