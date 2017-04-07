-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-04-07 09:04:40
-- 服务器版本： 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `review5.2`
--

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2017_03_21_081553_create_products_table', 1),
('2017_03_21_081615_create_reviews_table', 1),
('2017_03_21_085822_create_products_table', 2),
('2017_03_21_090021_create_reviews_table', 3);

-- --------------------------------------------------------

--
-- 表的结构 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `published` int(11) NOT NULL,
  `rating_cache` double(8,2) NOT NULL,
  `rating_count` int(11) NOT NULL,
  `pricing` double(8,2) NOT NULL,
  `short_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `long_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `products`
--

INSERT INTO `products` (`id`, `name`, `published`, `rating_cache`, `rating_count`, `pricing`, `short_description`, `long_description`, `icon`, `created_at`, `updated_at`) VALUES
(1, '产品1', 1, 3.50, 10, 2.00, '这是短描述', '这里是长描述', '', '2017-03-21 16:00:00', '2017-04-06 23:02:40');

-- --------------------------------------------------------

--
-- 表的结构 `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `approved` int(11) NOT NULL,
  `spam` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `rating`, `comment`, `approved`, `spam`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 2, '这是我的第一条留言，希望不要出问题', 0, 0, '2017-03-21 18:03:57', '2017-03-21 18:03:57'),
(2, 1, 0, 2, '这是我的第一条留言，希望不要出问题', 1, 0, '2017-03-21 18:06:34', '2017-03-21 18:06:34'),
(3, 1, 0, 3, '这是我的第一条留言，希望没问题', 1, 0, '2017-03-21 18:06:57', '2017-03-21 18:06:57'),
(4, 1, 0, 3, '这又是一个我的留言。。。', 0, 0, '2017-03-21 19:11:45', '2017-03-21 19:11:45'),
(5, 1, 0, 5, '我又要在这里留言了。。。', 0, 0, '2017-03-21 19:12:18', '2017-03-21 19:12:18'),
(6, 1, 0, 5, '哎呀，不小心又留了个言', 0, 0, '2017-03-21 19:14:18', '2017-03-21 19:14:18'),
(7, 1, 0, 5, '哎呀，不小心又留了个言', 0, 0, '2017-03-21 19:52:47', '2017-03-21 19:52:47'),
(8, 1, 0, 2, 'fnksnfjskfskjfksfakjf留言', 0, 0, '2017-04-06 23:02:18', '2017-04-06 23:02:18'),
(9, 1, 0, 4, '适当放松放松放松放松法守法萨斯gas个', 0, 0, '2017-04-06 23:02:28', '2017-04-06 23:02:28'),
(10, 1, 0, 4, '对股市跌幅高达gas哥哥阿股份公司发', 0, 0, '2017-04-06 23:02:40', '2017-04-06 23:02:40');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
