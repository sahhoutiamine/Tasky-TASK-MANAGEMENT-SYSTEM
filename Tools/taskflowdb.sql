-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 09, 2026 at 10:24 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taskflowdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `team_id` int NOT NULL,
  `status` enum('planning','active','on_hold','completed') DEFAULT 'planning',
  `deadline` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `description`, `team_id`, `status`, `deadline`, `created_at`, `updated_at`) VALUES
(1, 'Project Management System', 'Système de gestion de projets', 1, 'active', '2026-06-30', '2026-01-09 10:24:29', '2026-01-09 10:24:29'),
(2, 'Testing Platform', 'Plateforme de tests automatisés', 2, 'planning', '2026-04-15', '2026-01-09 10:24:29', '2026-01-09 10:24:29'),
(3, 'Admin Dashboard', 'Dashboard de supervision', 3, 'on_hold', '2026-05-01', '2026-01-09 10:24:29', '2026-01-09 10:24:29');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text,
  `task_type` enum('feature','bug','maintenance') NOT NULL,
  `project_id` int NOT NULL,
  `assignee_id` int DEFAULT NULL,
  `reporter_id` int NOT NULL,
  `priority` enum('low','medium','high','critical') DEFAULT 'medium',
  `status` enum('todo','in_progress','in_review','done') DEFAULT 'todo',
  `estimated_hours` decimal(5,2) DEFAULT NULL,
  `actual_hours` decimal(5,2) DEFAULT '0.00',
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `task_type`, `project_id`, `assignee_id`, `reporter_id`, `priority`, `status`, `estimated_hours`, `actual_hours`, `due_date`, `created_at`, `updated_at`) VALUES
(1, 'Create database schema', 'Design and create initial database schema', 'feature', 1, 1, 3, 'high', 'in_progress', 6.50, 2.00, '2026-02-01', '2026-01-09 10:24:40', '2026-01-09 10:24:40'),
(2, 'Fix login bug', 'Resolve authentication issue on login page', 'bug', 1, 1, 2, 'critical', 'todo', 3.00, 0.00, '2026-01-20', '2026-01-09 10:24:40', '2026-01-09 10:24:40'),
(3, 'Write unit tests', 'Add unit tests for user module', 'maintenance', 2, 4, 5, 'medium', 'todo', 5.00, 0.00, '2026-02-10', '2026-01-09 10:24:40', '2026-01-09 10:24:40'),
(4, 'Create admin UI', 'Design admin dashboard interface', 'feature', 3, NULL, 6, 'low', 'todo', 8.00, 0.00, '2026-03-01', '2026-01-09 10:24:40', '2026-01-09 10:24:40');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Alpha Team', 'Équipe principale de développement', '2026-01-09 10:24:05'),
(2, 'Beta Team', 'Équipe de test et validation', '2026-01-09 10:24:05'),
(3, 'Gamma Team', 'Équipe de gestion de projets', '2026-01-09 10:24:05');

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('developer','tester','manager','admin') DEFAULT 'developer',
  `team_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`id`, `username`, `email`, `password_hash`, `role`, `team_id`, `created_at`) VALUES
(1, 'ahmed_dev', 'ahmed@company.com', '$2y$10$hash1', 'developer', 1, '2026-01-09 10:24:19'),
(2, 'sara_test', 'sara@company.com', '$2y$10$hash2', 'tester', 1, '2026-01-09 10:24:19'),
(3, 'youssef_mgr', 'youssef@company.com', '$2y$10$hash3', 'manager', 1, '2026-01-09 10:24:19'),
(4, 'amina_dev', 'amina@company.com', '$2y$10$hash4', 'developer', 2, '2026-01-09 10:24:19'),
(5, 'karim_test', 'karim@company.com', '$2y$10$hash5', 'tester', 2, '2026-01-09 10:24:19'),
(6, 'admin', 'admin@company.com', '$2y$10$adminhash', 'admin', 3, '2026-01-09 10:24:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `assignee_id` (`assignee_id`),
  ADD KEY `reporter_id` (`reporter_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `team_id` (`team_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`assignee_id`) REFERENCES `team_members` (`id`),
  ADD CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`reporter_id`) REFERENCES `team_members` (`id`);

--
-- Constraints for table `team_members`
--
ALTER TABLE `team_members`
  ADD CONSTRAINT `team_members_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
