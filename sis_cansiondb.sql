-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2023 at 06:57 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sis_cansiondb`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(3, 'Guitarra', '2023-11-30 09:02:37', '2023-11-30 09:02:37');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(191) NOT NULL,
  `correo` varchar(191) NOT NULL,
  `ciudad` varchar(191) DEFAULT NULL,
  `telefono` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `correo`, `ciudad`, `telefono`, `created_at`, `updated_at`) VALUES
(1, 'BolviaMar', 'boliviamar@gmail.com', 'La Paz', '79512385', '2023-11-18 03:42:23', '2023-11-18 03:42:23');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_16_035121_create_categorias_table', 1),
(6, '2023_11_16_035147_create_productos_table', 1),
(7, '2023_11_16_042519_create_clientes_table', 1),
(8, '2023_11_16_043044_create_ordens_table', 1),
(9, '2023_11_16_172928_create_permission_tables', 1),
(10, '2023_11_17_070027_add_estado_to_ordens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5);

-- --------------------------------------------------------

--
-- Table structure for table `ordens`
--

CREATE TABLE `ordens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Orden` varchar(191) NOT NULL,
  `clientes_id` bigint(20) UNSIGNED NOT NULL,
  `estado` enum('Solicitado','En proceso','Enviado','Entregado','Cancelado') DEFAULT 'Solicitado',
  `pais` varchar(191) NOT NULL,
  `ciudad` varchar(191) NOT NULL,
  `direccion` varchar(191) NOT NULL,
  `ZIP` varchar(191) NOT NULL,
  `Productos` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ordens`
--

INSERT INTO `ordens` (`id`, `Orden`, `clientes_id`, `estado`, `pais`, `ciudad`, `direccion`, `ZIP`, `Productos`, `created_at`, `updated_at`) VALUES
(1, 'OR01', 1, 'Entregado', 'Bolivia', 'La Paz', 'Calle Melchor Jimenez #872', '000000', '10 Guitarras acústicas de roble color negro', '2023-11-18 03:43:03', '2023-11-18 05:32:17'),
(2, 'OR02', 1, 'En proceso', 'Bolivia', 'dsa', 'fsa', 'dadsa', 'jhbgvjfcbvbfcngvh,', '2023-11-30 08:45:29', '2023-11-30 08:45:29');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Ver categoría', 'web', '2023-11-18 03:49:59', '2023-11-18 03:49:59'),
(2, 'Vista categoría', 'web', '2023-11-18 03:50:27', '2023-11-18 03:50:27'),
(3, 'Crear categoría', 'web', '2023-11-18 03:50:40', '2023-11-18 03:50:40'),
(4, 'Editar categoría', 'web', '2023-11-18 03:50:51', '2023-11-18 03:50:51'),
(5, 'Eliminar categoría', 'web', '2023-11-18 03:51:05', '2023-11-18 03:51:05'),
(6, 'Ver cliente', 'web', '2023-11-18 03:51:17', '2023-11-18 03:51:17'),
(7, 'Vista cliente', 'web', '2023-11-18 03:51:46', '2023-11-18 03:51:46'),
(8, 'Crear cliente', 'web', '2023-11-18 03:51:53', '2023-11-18 03:51:53'),
(9, 'Editar cliente', 'web', '2023-11-18 03:51:59', '2023-11-18 03:57:41'),
(10, 'Eliminar cliente', 'web', '2023-11-18 03:52:06', '2023-11-18 03:52:06'),
(11, 'Ver orden', 'web', '2023-11-18 03:52:19', '2023-11-18 03:52:19'),
(12, 'Vista orden', 'web', '2023-11-18 03:52:30', '2023-11-18 03:52:30'),
(13, 'Crear orden', 'web', '2023-11-18 03:52:36', '2023-11-18 03:52:36'),
(14, 'Editar orden', 'web', '2023-11-18 03:52:42', '2023-11-18 03:52:42'),
(15, 'Eliminar orden', 'web', '2023-11-18 03:52:48', '2023-11-18 03:52:48'),
(16, 'Ver permiso', 'web', '2023-11-18 03:53:01', '2023-11-18 03:53:01'),
(17, 'Vista permiso', 'web', '2023-11-18 03:53:12', '2023-11-18 03:53:12'),
(18, 'Crear permiso', 'web', '2023-11-18 03:53:19', '2023-11-18 03:53:19'),
(19, 'Editar permiso', 'web', '2023-11-18 03:53:25', '2023-11-18 03:53:25'),
(20, 'Eliminar permiso', 'web', '2023-11-18 03:53:30', '2023-11-18 03:53:30'),
(21, 'Ver producto', 'web', '2023-11-18 03:53:42', '2023-11-18 03:53:42'),
(22, 'Vista producto', 'web', '2023-11-18 03:53:53', '2023-11-18 03:53:53'),
(23, 'Crear producto', 'web', '2023-11-18 03:53:59', '2023-11-18 03:53:59'),
(24, 'Editar producto', 'web', '2023-11-18 03:54:04', '2023-11-18 03:54:04'),
(25, 'Eliminar producto', 'web', '2023-11-18 03:54:11', '2023-11-18 03:54:11'),
(26, 'Ver rol', 'web', '2023-11-18 03:54:30', '2023-11-18 03:54:30'),
(27, 'Vista rol', 'web', '2023-11-18 03:54:39', '2023-11-18 03:54:39'),
(28, 'Crear rol', 'web', '2023-11-18 03:54:45', '2023-11-18 03:54:45'),
(29, 'Editar rol', 'web', '2023-11-18 03:54:52', '2023-11-18 03:54:52'),
(30, 'Eliminar rol', 'web', '2023-11-18 03:54:59', '2023-11-18 03:54:59'),
(31, 'Ver usuario', 'web', '2023-11-18 03:55:13', '2023-11-18 03:55:13'),
(32, 'Vista usuario', 'web', '2023-11-18 03:55:27', '2023-11-18 03:55:27'),
(33, 'Crear usuario', 'web', '2023-11-18 03:55:34', '2023-11-18 03:55:34'),
(34, 'Editar usuario', 'web', '2023-11-18 03:55:41', '2023-11-18 03:55:41'),
(35, 'Eliminar usuario', 'web', '2023-11-18 03:55:47', '2023-11-18 03:55:47');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(191) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categorias_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `descripcion`, `stock`, `precio`, `categorias_id`, `created_at`, `updated_at`) VALUES
(4, 'Guitarra de madera de roble negra', 111, 11111.00, 3, '2023-11-30 09:02:56', '2023-11-30 09:02:56'),
(5, 'Guitarra', 33, 321321.00, 3, '2023-11-30 09:17:10', '2023-11-30 09:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2023-11-18 03:39:53', '2023-11-18 03:39:53'),
(2, 'Vendedor', 'web', '2023-11-18 03:59:08', '2023-11-18 03:59:08'),
(3, 'Asistente', 'web', '2023-11-18 04:00:26', '2023-11-18 04:00:26');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(1, 3),
(2, 2),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 2),
(6, 3),
(7, 2),
(7, 3),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(11, 3),
(12, 2),
(12, 3),
(13, 2),
(14, 2),
(15, 2),
(21, 2),
(21, 3),
(22, 2),
(22, 3),
(23, 3),
(24, 3),
(25, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mario Figueroa', 'mfigueroa@gmail.com', '2023-11-18 03:39:52', '$2y$12$0hjdB/PpdWQ7PTZDuEH5ouOaJ7cOw7hxZ9FYfdt69GCyiMuHSbwG2', 'j3Fn9kL4Suzw25qyKqLCwSHJLh1IWmuqAgvfQMFM1n4SpFOAASQkVavhc4Bs', '2023-11-18 03:39:53', '2023-11-18 03:39:53'),
(2, 'Test', 'test@gmail.com', '2023-11-18 03:39:53', '$2y$12$0hjdB/PpdWQ7PTZDuEH5ouOaJ7cOw7hxZ9FYfdt69GCyiMuHSbwG2', 'gLlFRQrWph5jUIQ2H5LbhoGHC5rRJvioqs7T3DA8luZROH3W2PGKgSzEQ1YF', '2023-11-18 03:39:53', '2023-11-18 03:39:53'),
(3, 'Irma Rojas', 'Irojas@gmail.com', NULL, '$2y$12$lRKvaZw80aI7mcGcRoNpWucGNAdpWITtv/TL7oYfmodeVYDbOmoym', NULL, '2023-11-18 04:01:22', '2023-11-18 04:01:22'),
(4, 'Eduardo Gutierrez', 'Egutierrez@gmail.com', NULL, '$2y$12$6.V4eVy.6WAh7TiV3S5daOHLWJZjK200WK5XgBL.K1VxlgvOCrL7.', NULL, '2023-11-18 04:01:47', '2023-11-18 04:01:47'),
(5, 'Carlos Vallejos', 'Cvallejps@gmail.com', NULL, '$2y$12$fM8fSoulBE5I6/4RjdZW7.jceRLyoF0ISw26D1YVwUU1L6bDarLOG', NULL, '2023-11-18 04:02:31', '2023-11-18 04:02:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clientes_correo_unique` (`correo`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `ordens`
--
ALTER TABLE `ordens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordens_clientes_id_foreign` (`clientes_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_categorias_id_foreign` (`categorias_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ordens`
--
ALTER TABLE `ordens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ordens`
--
ALTER TABLE `ordens`
  ADD CONSTRAINT `ordens_clientes_id_foreign` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_categorias_id_foreign` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
