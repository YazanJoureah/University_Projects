-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 30 ديسمبر 2023 الساعة 11:12
-- إصدار الخادم: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- بنية الجدول `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(20) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `price` float NOT NULL,
  `img` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `ISBN`, `category`, `description`, `price`, `img`) VALUES
(1, 'Artifice', 'Sharon Cameron', ' 1338813951', 'Art', 'A dramatic story of duplicity and resistance, betrayal and loyalty, set against the backdrop of World War II, by the #1 New York Times bestselling author of The Light in Hidden Places.', 12.48, 'Artifice.jpg'),
(2, 'Overdue or Die: A Haunted Library Mystery, Book 7', 'Allison Brook', 'B0CCYVFJP2', 'Art', '\"Carrie Singleton has more than her fair share on her plate: her job at the Clover Ridge Library, preparing for her wedding to Dylan Avery, and hoping that the local art gallery doesn’t steal away one of her part-time employees. Her fiancé, Dylan, accompanies her to the beautiful home of Victor Zalinka—art collector and successful businessman—to select paintings for an art show at the library. While Carrie muses that Victor home would be the perfect wedding venue, Dylan spots a forgery among the paintings in Victor collection.\r\n\r\nThen Martha Mallory is found murdered in her art gallery. With the assistance of Evelyn, the library ghost; the resident cat, Smoky Joe; and the office manager of Dylan’s private investigation company, Carrie comes up with a suspect list long enough to rival the size of an encyclopedia. During her investigation, Carrie stumbles across a terrible truth: Martha’s murder was part of something far bigger and more dangerous than she could have ever imagined. And it all leads back to the art gallery.\r\n\r\nHow far will Carrie go to find the killer and uncover the truth? If the killer finds her first—will Carrie finally be taken out of circulation?\"', 10.25, 'Overdue or Die A Haunted Library Mystery, Book 7.jpg'),
(3, 'Watership Down: The Graphic Novel ', ' Richard Adams', '1984857193', 'Art', 'A beautiful and faithful graphic novel adaptation of Richard Adams’s beloved story of a group of rabbits on an epic journey in search of home.', 14.2, 'Watership_Down _The_Graphic_Novel.jpg');

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `user_password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`id`, `user_name`, `email`, `user_password`) VALUES
(1, 'joshwa', 'sss@gmail.com', '$2y$10$9b7MQAbb4SW0e7C1Sn.gQuyNPu/GSwgJJSu5ginX1vx21NMNmHVy2'),
(2, 'yazan', 'sus@gmail.com', '$2y$10$0d11xanj5qNLCQgyuiSzGuocWS110AKcT4Zeu6.9kZO94cM2fb7Ji'),
(3, 'yazan1', 'susu@gmail.com', '$2y$10$DI/q.xDpa15ceBBDyZLsVuexzCW52fbRqLMmj2B1H7tJA0071S6XO'),
(4, 'gak', 'happy@gmail.com', '$2y$10$rwkHWDosn/WjaZocP/L3wu2oo48h6tjQGSg/7.U6jzaDF/fRC3sHq'),
(5, 'Noor', 'Noor@gmail.com', '$2y$10$LUFRsyeymRx9enfpccvwmel/Ed35YRgRwWpF/rvSJSzGSq/HcnwyS'),
(6, 'karzat', 'karzat@gmail.com', '$2y$10$meh3Q.hEOzH6f0inND0dI.53GfG0NPzOvrRF6e4zlKTl/av0QkbJ6');

-- --------------------------------------------------------

--
-- بنية الجدول `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) UNSIGNED NOT NULL,
  `book_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `wishlist`
--

INSERT INTO `wishlist` (`id`, `book_id`, `user_id`) VALUES
(1, 2, 2),
(2, 3, 2),
(3, 1, 1),
(4, 2, 1),
(5, 3, 1),
(6, 1, 2),
(7, 1, 5),
(8, 1, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
