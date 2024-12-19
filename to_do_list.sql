-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2024 at 02:27 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `to_do_list`
--

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `status` enum('In Progress','Done') DEFAULT 'In Progress',
  `due_date` date NOT NULL DEFAULT current_timestamp(),
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `task_name`, `status`, `due_date`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Matematika', 'Done', '2024-12-20', NULL, '2024-12-13 03:38:13', '2024-12-13 03:38:19'),
(2, 1, 'Pengcit', 'Done', '2024-12-27', NULL, '2024-12-13 03:49:23', '2024-12-13 05:41:47'),
(3, 1, 'Matematika', 'Done', '2024-12-20', NULL, '2024-12-13 04:17:30', '2024-12-13 05:20:51'),
(4, 1, 'UAS_IMK', 'Done', '2024-12-19', NULL, '2024-12-13 05:42:04', '2024-12-13 06:37:18'),
(5, 5, 'imk', 'Done', '2024-12-13', NULL, '2024-12-13 07:02:42', '2024-12-13 07:02:45'),
(6, 1, 'UAS IMK', 'Done', '2024-12-19', NULL, '2024-12-19 11:24:46', '2024-12-19 11:24:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`) VALUES
(1, 'nadjwatasyasafira@gmail.com', 'nadee_', '$2y$10$8zNzAujwUsXB0dH/8.NAcuTdqN9fqirPU9oIiYpex4kUiYxruqrwa'),
(2, 'erlinsari82@gmail.com', 'sari', '$2y$10$c7khWWgJGGBL0laBnxco5.ppU72UgB1GHWOahLZp7X4wTGRXkVaRS'),
(3, 'anggi@gmail.com', 'anggi', '$2y$10$EFj5IyyQ0yzYw/wkzWU5H.NwhuGZCHABriMgBjH4.aCUXwduEqSAa'),
(4, 'aulia@gmail.com', 'aulia', '$2y$10$smg.F51UxjhzmWLt.U7yu.Wr3BblkKKvQytQ7w75Njs/h1NiH8TVi'),
(5, 'enji@gmail.com', 'enji', '$2y$10$LrPzE8h2BHJErTZdskg3ROvZPgFQtSH1YuufYOqoMQfI0dtsdTrsi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
