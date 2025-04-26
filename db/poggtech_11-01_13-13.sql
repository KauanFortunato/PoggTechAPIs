-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2025 at 02:13 PM
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
  `tipo` enum('favorito','carrinho') NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
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
  `category_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `seller_type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `user_id`, `title`, `description`, `price`, `category_id`, `image_url`, `created_at`, `updated_at`, `seller_type`) VALUES
(3, 15, 'Xbox Series X, 1tb, Preto', 'A nova série Xbox Jogue milhares de jogos em quatro gerações de console – todos os jogos têm uma ótima aparência e funcionam perfeitamente no Xbox Series\r\nExperimente velocidade e desempenho de próxima geração com Xbox Velocity Architecture, com SSD personalizado e software integrado\r\nJogue milhares de jogos de quatro gerações de Xbox com compatibilidade retroativa, incluindo títulos otimizados no lançamento\r\nO Xbox O Game Pass Ultimate inclui mais de 100 jogos de alta qualidade para consoles, PC, dispositivos móveis Android, multijogador online e uma assinatura do EA Play por um baixo preço mensal (assinatura vendida separadamente).\r\nUm Xbox Smart Delivery permite que você jogue a melhor versão do seu jogo, independentemente do console que você usa', 553.02, 1, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.frandroid.com%2Fwp-content%2Fuploads%2F2019%2F12%2Fmicrosoft-xbox-series-x-frandroid.png&f=1&nofb=1&ipt=281df20b316491d50fe00567631c17c72c5f055c2f346eb4a1d418755b3f64e4&ipo=images', '2024-12-05 20:28:39', '2025-01-07 15:27:15', 'admin'),
(4, 18, 'Xbox 360', 'Console em bom estado', 110.98, 3, 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.pngall.com%2Fwp-content%2Fuploads%2F2016%2F07%2FXbox-Free-Download-PNG.png&f=1&nofb=1&ipt=f1e2015ce576a3b63e40ab904d61db31b73a96df9fd250d40612ce6475e4f112&ipo=images', '2025-01-09 18:40:07', '2025-01-09 18:40:07', 'admin'),
(5, 19, '2DS Azul/Preto', 'O Nintendo 2DS mantém muitas das mesmas características de hardware como o Nintendo DS 3 incluindo o mesmo Nintendo 3DS gameplay controla, ao contrário de compatibilidade com a vasta biblioteca existente de jogos de Nintendo DS, bem como recursos de conectividade sem fio, como acesso a Nintendo eShop, além de funcionalidade StreetPass e o SpotPass.', 85.00, 1, 'https://pt.static.webuy.com/product_images/Jogos/3DS%20Consolas/S2DSAZUC_l.jpg', '2025-01-09 18:59:43', '2025-01-09 18:59:43', 'user'),
(6, 15, 'Grand Theft Auto V (5) 2 Discs', 'Los Santos - uma alastrando sun-soaked metrópole cheio de self-help gurus, starlets, e desvanecimento celebridades, inveja do ocidental mundo, agora struggling para stay afloat em uma era de econômica incerteza e barato reality TV.\r\n\r\nAmidst o turmoil, três muito diferentes criminosos enredo suas próprias chances de sobrevivência e sucesso: Franklin, antiga rua gângster, agora procurando real oportunidades e grave dinheiro; Michael, um profissional ex-con aposentadoria é um muito menos do que ele esperança isso Seria e Trevor, um maníaco violento dirigido pela próxima grande pontuação. Ficando sem opções, a tripulação arrisca tudo em uma série de assaltos ousados e perigosas que podem defini-las pelo resto da vida.\r\n\r\nO maior, mais dinâmica e mais diversas abrir mundo jamais criado, Grand Theft Auto V combina narrativa e jogabilidade em novas formas, como jogadores repetidamente saltar dentro e fora da vida dos três personagens de chumbo do jogo, jogando todos os lados da história do jogo entrelaçadas.\r\n\r\nTodas as características clássicas da inovadora série de retorno, incluindo a incrível atenção ao detalhe e Grand Theft Auto sombriamente humorístico leve na cultura moderna, ao lado de uma abordagem nova e ambiciosa para abrir o mundo multiplayer.', 15.00, 2, 'https://pt.static.webuy.com/product_images/Jogos/Xbox%20360%20Jogos/5026555258043_l.jpg', '2025-01-09 18:59:43', '2025-01-09 18:59:43', 'admin');

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
(15, 'bCXhKqZvrYTAZm867tMzpyNWWz33', 'Kauan', 'Matias', 'kauanmatiasfortunato@gmail.com', '910 937 234', '2024-11-27 20:52:50'),
(18, 'A2YOrJ9js0ZUcec9r9EW9o4kXEZ2', 'Diogo', 'Dioguinho', 'sayodiggo@gmail.com', '', '2024-12-02 00:17:17'),
(19, 'gO3K6796eQTMiVgss8MTarijpCg1', 'Rodrigo', 'Alexandre', 'rodrigoalexandre@gmail.com', '', '2024-12-06 22:35:17'),
(20, 'sC0UoxF2GwNtSiF2dWTo9UTFxN22', 'Bitman', 'Biman', 'bitman@gmail.com', '', '2024-12-06 23:42:22'),
(21, 'dbfjtKdnmdPpYoA5WfIOqbr3KOD3', 'Joao', 'Santos', 'joaosantos@gmail.com', '', '2024-12-09 18:02:46'),
(22, '0pFZo8kGEGgrBs780ERuVTQ94CA2', 'santos', 'fortunato', 'santosfortunato@gmail.com', '', '2024-12-09 18:08:58'),
(23, '55CpNAK9azXHrAS5rUYzxAakmvz1', 'Maria', 'Santos', 'maria@gmail.com', '', '2024-12-10 19:09:25');

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
  ADD KEY `category_id` (`category_id`);

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
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`reviewed_user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
