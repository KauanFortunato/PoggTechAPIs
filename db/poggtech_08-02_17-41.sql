-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2025 at 06:41 PM
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
(2, 15, 12, 0, '2025-02-07 17:12:58'),
(3, 15, 3, 1, '2025-02-08 15:44:51'),
(4, 15, 6, 0, '2025-02-08 16:46:34');

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
  `category` varchar(50) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `seller_type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `user_id`, `title`, `description`, `price`, `category`, `image_url`, `created_at`, `updated_at`, `seller_type`) VALUES
(3, 15, 'Xbox Series X, 1tb, Preto', 'A nova série Xbox Jogue milhares de jogos em quatro gerações de console – todos os jogos têm uma ótima aparência e funcionam perfeitamente no Xbox Series\r\nExperimente velocidade e desempenho de próxima geração com Xbox Velocity Architecture, com SSD personalizado e software integrado\r\nJogue milhares de jogos de quatro gerações de Xbox com compatibilidade retroativa, incluindo títulos otimizados no lançamento\r\nO Xbox O Game Pass Ultimate inclui mais de 100 jogos de alta qualidade para consoles, PC, dispositivos móveis Android, multijogador online e uma assinatura do EA Play por um baixo preço mensal (assinatura vendida separadamente).\r\nUm Xbox Smart Delivery permite que você jogue a melhor versão do seu jogo, independentemente do console que você usa', 553.02, 'Consolas', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.frandroid.com%2Fwp-content%2Fuploads%2F2019%2F12%2Fmicrosoft-xbox-series-x-frandroid.png&f=1&nofb=1&ipt=281df20b316491d50fe00567631c17c72c5f055c2f346eb4a1d418755b3f64e4&ipo=images', '2024-12-05 20:28:39', '2025-02-07 15:45:13', 'admin'),
(4, 18, 'Xbox 360', 'Console em bom estado', 110.98, 'Consolas', 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.pngall.com%2Fwp-content%2Fuploads%2F2016%2F07%2FXbox-Free-Download-PNG.png&f=1&nofb=1&ipt=f1e2015ce576a3b63e40ab904d61db31b73a96df9fd250d40612ce6475e4f112&ipo=images', '2025-01-09 18:40:07', '2025-01-09 18:40:07', 'admin'),
(5, 19, '2DS Azul/Preto', 'O Nintendo 2DS mantém muitas das mesmas características de hardware como o Nintendo DS 3 incluindo o mesmo Nintendo 3DS gameplay controla, ao contrário de compatibilidade com a vasta biblioteca existente de jogos de Nintendo DS, bem como recursos de conectividade sem fio, como acesso a Nintendo eShop, além de funcionalidade StreetPass e o SpotPass.', 85.00, 'Consolas', 'https://pt.static.webuy.com/product_images/Jogos/3DS%20Consolas/S2DSAZUC_l.jpg', '2025-01-09 18:59:43', '2025-01-09 18:59:43', 'user'),
(6, 15, 'Grand Theft Auto V (5) 2 discos', 'Los Santos - uma alastrando sun-soaked metrópole cheio de self-help gurus, starlets, e desvanecimento celebridades, inveja do ocidental mundo, agora struggling para stay afloat em uma era de econômica incerteza e barato reality TV.\r\n\r\nAmidst o turmoil, três muito diferentes criminosos enredo suas próprias chances de sobrevivência e sucesso: Franklin, antiga rua gângster, agora procurando real oportunidades e grave dinheiro; Michael, um profissional ex-con aposentadoria é um muito menos do que ele esperança isso Seria e Trevor, um maníaco violento dirigido pela próxima grande pontuação. Ficando sem opções, a tripulação arrisca tudo em uma série de assaltos ousados e perigosas que podem defini-las pelo resto da vida.\r\n\r\nO maior, mais dinâmica e mais diversas abrir mundo jamais criado, Grand Theft Auto V combina narrativa e jogabilidade em novas formas, como jogadores repetidamente saltar dentro e fora da vida dos três personagens de chumbo do jogo, jogando todos os lados da história do jogo entrelaçadas.\r\n\r\nTodas as características clássicas da inovadora série de retorno, incluindo a incrível atenção ao detalhe e Grand Theft Auto sombriamente humorístico leve na cultura moderna, ao lado de uma abordagem nova e ambiciosa para abrir o mundo multiplayer.', 15.00, 'Jogos', 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.mobygames.com%2Fimages%2Fcovers%2Fl%2F310047-grand-theft-auto-v-xbox-360-front-cover.png&f=1&nofb=1&ipt=a5a027b8d145bae2e159a60e0958edc92e65b02d9d1624ac08dd830a1b841c64&ipo=images', '2025-01-09 18:59:43', '2025-01-09 18:59:43', 'admin'),
(7, 15, 'New Super Mario Bros', 'New Super Mario Bros características enorme vívida 2D mundos inspiraram por aqueles das aventuras de Mario clássicas, mas combinado com lindamente prestados personagens 3D que quase parecem saltar para fora da tela. Cada mundo tem um tema diferente e apresenta vários níveis, que devem ser concluídos antes de avançar para o próximo. Os jogadores também devem dominar mini fortaleza do mundo cada e bater um personagem chefe antes que podem progredir para o próximo mundo. Só depois de derrotar todos os chefes um personagem será pronto para enfrentar o derradeiro desafio do Bowser ele mesmo.', 28.00, 'Jogos', 'https://pt.static.webuy.com/product_images/Jogos/DS%20Jogos/045496463106_l.jpg', '2025-01-11 23:26:18', '2025-01-11 23:26:18', 'admin'),
(8, 15, 'Inazuma Eleven', 'Sequências de anime cativante enriquecem o enredo nesta aventura e os jogadores são capazes de explorar a cidade no jogo para procurar potenciais companheiros de equipe. Existem mais de 1000 personagens no jogo que você pode explorar, cada um com suas próprias estatísticas, habilidades únicas e habilidades especiais.', 18.00, 'Jogos', 'https://pt.static.webuy.com/product_images/Jogos/DS%20Jogos/045496470685_l.jpg', '2025-01-11 23:26:18', '2025-01-11 23:26:18', 'admin'),
(9, 15, 'PS4 Official DualShock 4 Branco Controller (V2)', NULL, 55.92, 'Acessórios', 'https://pt.static.webuy.com/product_images/Jogos/Playstation4%20Acessorios/0711719894650_l.jpg', '2025-01-11 23:29:49', '2025-01-11 23:29:49', 'user'),
(10, 15, 'Playstation Move Motion Controller V1 (CECH-ZCM 1) (PS3/PS4)', 'PlayStation Move redefine os jogos de movimento com experiência de jogo mais envolvente e realista só é possível no sistema PlayStation3. O controlador simples, fácil de usar captura uma gama completa de movimento, dando-lhe controle final sobre como você joga o jogo. Com uma variada selecção de jogos e os novos lançamento todo o tempo, pode desfrutar de horas de diversão com amigos e família.', 12.32, 'Acessórios', 'https://pt.static.webuy.com/product_images/Jogos/Playstation4%20Acessorios/SPS3ACCMOVE_l.jpg', '2025-01-11 23:29:49', '2025-01-11 23:29:49', 'admin'),
(11, 15, 'Xbox 360 Kinect (Sem FA)', NULL, 10.00, 'Acessórios', 'https://pt.static.webuy.com/product_images/Jogos/Xbox%20360%20Acess%C3%B3rios/S360KINSNXB_l.jpg', '2025-01-11 23:29:49', '2025-01-11 23:29:49', 'admin'),
(12, 15, 'Oficial Gamecube Indigo Controller', NULL, 48.99, 'Acessórios', 'https://pt.static.webuy.com/product_images/Jogos/GameCube%20Acess%C3%B3rios/4902370505559_l.jpg', '2025-01-11 23:31:19', '2025-01-11 23:31:19', 'admin'),
(13, 15, 'Gamecube, Indigo (Sem Jogo), Sem Caixa', 'Um olhar para o hardware do Nintendo Game Cube e você sabe que é diferente.\r\n\r\nA forma compacta não é apenas prática, que o projeto original é um símbolo do compromisso da Nintendo para se concentrar na criação de jogos de vídeo mais original e inovador do mundo.', 150.00, 'Consolas', 'https://pt.static.webuy.com/product_images/Jogos/GameCube%20Consolas/045496370008_l.jpg', '2025-01-11 23:31:19', '2025-01-11 23:31:19', 'admin'),
(14, 15, 'Gamecube, Tales of Symphonia L.E + G.B Player,(Sem Jogo)\r\n', NULL, 225.00, 'Consolas', 'https://pt.static.webuy.com/product_images/Jogos/GameCube%20Consolas/SGCUGAMETS003_l.jpg', '2025-01-11 23:44:12', '2025-01-11 23:44:12', 'admin'),
(15, 15, 'Nintendo Switch Lite Consola, 32GB Azul, Caixa', NULL, 165.00, 'Consolas', 'https://pt.static.webuy.com/product_images/Jogos/Switch%20Consolas/0454964NSL32BL01_l.jpg', '2025-01-11 23:44:12', '2025-01-11 23:44:12', 'admin'),
(16, 15, 'Switch Consola, 64GB OLED + Branca Joy-Con', NULL, 265.00, 'Consolas', 'https://pt.static.webuy.com/product_images/Jogos/Switch%20Consolas/0454964NS64V3WH02_l.jpg', '2025-01-11 23:44:12', '2025-01-11 23:44:12', 'admin'),
(17, 15, 'Generico 3rd Party Joy-Con Comfort Grip', NULL, 15.00, 'Acessórios', 'https://pt.static.webuy.com/product_images/Jogos/Switch%20Acessorios/SNSWVAL08_l.jpg', '2025-01-11 23:44:12', '2025-01-11 23:44:12', 'admin'),
(18, 15, 'Official Nintendo Switch Preto Carry Case', NULL, 8.00, 'Acessórios', 'https://pt.static.webuy.com/product_images/Jogos/Switch%20Acessorios/45496430597_l.jpg', '2025-01-11 23:44:12', '2025-01-11 23:44:12', 'admin'),
(19, 15, 'Nintendo Switch Joy-Con Direito Verde Pastel, Sem Correia', NULL, 42.00, 'Acessórios', 'https://pt.static.webuy.com/product_images/Jogos/Switch%20Acessorios/04549643PGRR_l.jpg', '2025-01-11 23:44:12', '2025-01-11 23:44:12', 'admin'),
(20, 15, 'PS Vita Preto 3G, Descontada', NULL, 140.00, 'Consolas', 'https://pt.static.webuy.com/product_images/Jogos/PS%20Vita%20Consolas/SPSVNEG3GC_l.jpg', '2025-01-11 23:44:12', '2025-02-07 03:14:14', 'admin'),
(21, 15, 'King Kong', NULL, 1.50, 'Jogos', 'https://pt.static.webuy.com/product_images/Jogos/PC%20Jogos/3307210201669_l.jpg', '2025-01-11 23:44:12', '2025-01-11 23:44:12', 'admin'),
(22, 15, 'Pro Evolution Soccer 6', 'PES6 para o PS2 é quase idênticos à versão 360 magistral: jogável através do éter, graças à compatibilidade jogar Net e PSP-para-PSP, mas com Visual de sempre-assim-ligeiramente degradada. Não importa. Pro Evolution tem sido sempre a jogabilidade e 6 tem isso tudo e muito mais. Esta vez ao redor, o sistema de disparo foi refinado. Os jogadores são capazes de assumir um pop de gol mais instintivamente do que da última vez para fora, e voleios e metade-voleios tiveram um re-vamp também. Fintas, ao contrário, dribles e reter a posse após um tackle de slide são também novos recursos para 2006. As coisas podem ficar mais físicas no PES6, com defensores fechando os atacantes muito mais em evidência, defensiva de bloqueio (legal ou ilegal) e esperto novo se transforma para os jogadores mais altamente cotados no jogo. Essas coisas levam tempo para aprender, mas é muito divertido ficar lá.', 2.00, 'Jogos', 'https://pt.static.webuy.com/product_images/Jogos/Playstation2%20Jogos/4012927120088_l.jpg', '2025-01-11 23:44:12', '2025-01-11 23:44:12', 'admin'),
(23, 18, 'Spider-Man 2', 'Desta vez lá é onde que você não pode ir.\n\nDois anos se passaram desde que Peter Parker primeiro hit nas ruas de Nova York como o combatente do crime em conflito Spider-Man. Agora ele encontra-se lutando contra seu vilão mais diabólico, no entanto, a mecanizada, vários tentáculos Doc Ock. O Nefasto Doc Ock foi Dr. Otto Octavius, um brilhante físico nuclear. Mas um acidente transformou-o de um pesquisador tímido para criminosos insano megalomaníaco que culpa Spider-Man para sua transformação horrível. Agora o cientista Peter uma vez idolatrado por seu notável intelecto marcou nosso lançador-web para a morte.', 6.00, 'Jogos', 'https://pt.static.webuy.com/product_images/Jogos/Playstation2%20Jogos/5030917027598_l.jpg', '2025-01-11 23:44:12', '2025-01-11 23:44:12', 'user');

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
-- Table structure for table `user_history`
--

CREATE TABLE `user_history` (
  `user_history_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Structure for view `v_cart_fav`
--
DROP TABLE IF EXISTS `v_cart_fav`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cart_fav`  AS SELECT `favorites`.`favorite_id` AS `favorite_id`, `favorites`.`product_id` AS `product_id`, `favorites`.`user_id` AS `user_id`, `favorites`.`tipo` AS `tipo`, `favorites`.`created_at` AS `created_at`, `products`.`title` AS `title`, `products`.`price` AS `price`, `products`.`category` AS `category`, `products`.`image_url` AS `image_url`, `products`.`seller_type` AS `seller_type` FROM (`favorites` join `products` on(`favorites`.`product_id` = `products`.`product_id`)) ;

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
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_category` (`category`);

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
-- Indexes for table `user_history`
--
ALTER TABLE `user_history`
  ADD PRIMARY KEY (`user_history_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category` (`category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
-- AUTO_INCREMENT for table `user_history`
--
ALTER TABLE `user_history`
  MODIFY `user_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category`) REFERENCES `categories` (`name`),
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`reviewed_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_history`
--
ALTER TABLE `user_history`
  ADD CONSTRAINT `user_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_history_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `user_history_ibfk_3` FOREIGN KEY (`category`) REFERENCES `categories` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
