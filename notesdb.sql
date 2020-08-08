-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2020 at 12:33 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `notesdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(5, '2016_06_01_000004_create_oauth_clients_table', 1),
(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(7, '2020_08_02_190727_create_notes_table', 1),
(8, '2020_08_02_190741_create_notesdescription_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `total_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `user_id`, `title`, `date`, `total_time`, `created_at`, `updated_at`) VALUES
(53, 4, 'Hiking', '2020-09-02', '9h', '2020-08-07 22:17:24', '2020-08-07 22:17:24'),
(54, 4, 'Camping', '2020-10-14', '2 days', '2020-08-07 22:28:49', '2020-08-07 22:28:49'),
(59, 1, 'School', '2022-07-02', '22', '2020-08-07 22:35:05', '2020-08-07 22:35:05');

-- --------------------------------------------------------

--
-- Table structure for table `notesdescription`
--

CREATE TABLE `notesdescription` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notes_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notesdescription`
--

INSERT INTO `notesdescription` (`id`, `notes_id`, `user_id`, `description`, `created_at`, `updated_at`) VALUES
(138, 53, 4, 'Take water', '2020-08-07 22:17:24', '2020-08-07 22:17:24'),
(139, 54, 4, 'Take pad', '2020-08-07 22:28:49', '2020-08-07 22:28:49'),
(140, 54, 4, 'Take sleeping bag', '2020-08-07 22:28:49', '2020-08-07 22:28:49'),
(145, 59, 1, 'pencil', '2020-08-07 22:35:05', '2020-08-07 22:35:05');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('029377daf4e57114080fe207ae40b48d43519cb4ec6265b011ac05a750d8e28f44ef722b0550e2f8', 4, 8, NULL, '[]', 0, '2020-08-03 21:39:47', '2020-08-03 21:39:47', '2021-08-03 23:39:47'),
('05fc922f80142abe09ff58c9b609ed3377f843f92295f05b6815f8aa9a4323d51a8dee31adf463fc', 4, 8, NULL, '[]', 0, '2020-08-03 21:32:50', '2020-08-03 21:32:50', '2021-08-03 23:32:50'),
('079b2068971eb38c4e85aebc86f1139eee00c2dce57bab43ed23f5eef1f8ec3bd56d7b9eae63520f', 7, 7, 'MyApp', '[]', 0, '2020-08-06 14:05:35', '2020-08-06 14:05:35', '2021-08-06 16:05:35'),
('07e184f9adcc58a2c060b106b5a33528a1d1c91fdb54a6db03bcd4d22c028e49487a964a014d9b24', 4, 8, NULL, '[]', 0, '2020-08-03 20:19:51', '2020-08-03 20:19:51', '2021-08-03 22:19:51'),
('08ff29523f7729b757563ad3919cc8d33d38dee7b0676e50dda538f83c1a0f57188a891f625040bf', 1, 8, NULL, '[]', 0, '2020-08-07 20:04:48', '2020-08-07 20:04:48', '2021-08-07 22:04:48'),
('09534ed71bfa3bc8d9614bca1bffe0c25cec125160375866ead49237bd44e5b66a5a01ee2c7e2f2e', 4, 8, NULL, '[]', 0, '2020-08-03 21:56:18', '2020-08-03 21:56:18', '2021-08-03 23:56:18'),
('0cdc7a7e91defb386adfb0876ae04f3df02137c66d5865de43ed854e7430932aa13c4cdff1c7e9d7', 4, 8, NULL, '[]', 0, '2020-08-03 19:01:46', '2020-08-03 19:01:46', '2021-08-03 21:01:46'),
('118e59f3651ce24e809f897b0c68758da3c40a7b532dc8e6f376d9628b95c7d5a48c59d04ac18a6c', 1, 8, NULL, '[]', 0, '2020-08-04 13:41:48', '2020-08-04 13:41:48', '2021-08-04 15:41:48'),
('119cc8c392fde12e5881b455a9201f0300fe35b720193c0b2d49baa5f47ec0b8638bfb6bee450e91', 4, 8, NULL, '[]', 0, '2020-08-04 13:45:35', '2020-08-04 13:45:35', '2021-08-04 15:45:35'),
('154b999c529680f9080021a62c030702a44e517cdf5e0020b74187a455f1c4855dfad64c92daec8b', 1, 8, NULL, '[]', 0, '2020-08-04 13:34:48', '2020-08-04 13:34:48', '2021-08-04 15:34:48'),
('17c344ee31b4cdea30b99ed79ab65fbd9139b8e79a448643a82c5fea9158ce7513ee2436bc84339d', 4, 7, 'MyApp', '[]', 0, '2020-08-03 19:01:38', '2020-08-03 19:01:38', '2021-08-03 21:01:38'),
('17c397207f529e6c263f9be1bfb883842c0bdf7885febae835f4b2b78f683806fbd0babed12080fe', 4, 8, NULL, '[]', 0, '2020-08-03 21:55:05', '2020-08-03 21:55:05', '2021-08-03 23:55:05'),
('22a78c26f915c9468dd295e76353cb1cf266f7f0abd2414eb11346678a1c97ea80574b528105a94a', 4, 8, NULL, '[]', 0, '2020-08-03 21:53:22', '2020-08-03 21:53:22', '2021-08-03 23:53:22'),
('243421294ad5db1fca28e20a702bc32bfa31745aa9442112dfd6baf92170a871a5a8c03eb72b68a2', 8, 7, 'MyApp', '[]', 0, '2020-08-06 14:06:42', '2020-08-06 14:06:42', '2021-08-06 16:06:42'),
('2b4e12f00ddb93cd72187356fe5f2cd1e42062b08b432a69fb2111217823caa609a28c1cae5f73bf', 4, 8, NULL, '[]', 0, '2020-08-03 19:21:18', '2020-08-03 19:21:18', '2021-08-03 21:21:18'),
('2e7256e6c9a38470df9b10841e75990e484a39303c16a6f69e1d712519b5fbdd33cd7b81672ed960', 4, 8, NULL, '[]', 0, '2020-08-03 21:52:31', '2020-08-03 21:52:31', '2021-08-03 23:52:31'),
('3492dbe84519b1e4565d44d9d7a41aea216622dd72c3f2234bef933550ab291b449c9706e69524c2', 4, 8, NULL, '[]', 0, '2020-08-03 21:17:51', '2020-08-03 21:17:51', '2021-08-03 23:17:51'),
('398587c45a77c8501b284849180cd35770395372cbf1733f5932226776517d26cbb69d3a17dec64d', 4, 8, NULL, '[]', 0, '2020-08-04 13:34:59', '2020-08-04 13:34:59', '2021-08-04 15:34:59'),
('3d21e1543062348d03b493cfa36b0ce88904de532ec97b54281763f3e9cce2a903fda39287aba937', 3, 7, 'MyApp', '[]', 0, '2020-08-03 19:00:42', '2020-08-03 19:00:42', '2021-08-03 21:00:42'),
('43f2eb67a8ec5d3e791335a3f227294be2d95de61f13ee460dd45dabfd16f7a175094e067e2a1a8e', 5, 7, 'MyApp', '[]', 0, '2020-08-06 14:00:49', '2020-08-06 14:00:49', '2021-08-06 16:00:49'),
('44b34632d92c4d3f5a44280c78f4c9f49e67164a6a4a87e60090dbbf9915397e29047db0b5dfcb48', 4, 8, NULL, '[]', 0, '2020-08-03 21:19:42', '2020-08-03 21:19:42', '2021-08-03 23:19:42'),
('4501a99164207acbdafe9e40c52c7711a8d3362cced71d7914d1b78c314de84a853329b9abc7f2b7', 4, 8, NULL, '[]', 0, '2020-08-03 21:56:06', '2020-08-03 21:56:06', '2021-08-03 23:56:06'),
('46ee34b4af06ed3ed312d579a8ca0e51595866d10d173914259159831cfebea23e627bc1ab160927', 4, 8, NULL, '[]', 0, '2020-08-03 21:12:59', '2020-08-03 21:12:59', '2021-08-03 23:12:59'),
('48d77a0140b16a1bcdfd9f1d736b2bf299ef9fbd7f79c76f9678e19df97524ffe86865d12dab3d6b', 1, 8, NULL, '[]', 0, '2020-08-06 20:03:53', '2020-08-06 20:03:53', '2021-08-06 22:03:53'),
('4a7ad2b8baa70b78a7b7357042f73e8ff2188642fe3a29a234fe31e3f09e6e566fa34c8fc792f51e', 4, 8, NULL, '[]', 0, '2020-08-03 21:44:58', '2020-08-03 21:44:58', '2021-08-03 23:44:58'),
('529d80bbcf2d12433d7426512359869a3cf9e081d2bf479cc3bc291ead8a6d559fc52260fb31ad7d', 4, 8, NULL, '[]', 0, '2020-08-03 21:39:28', '2020-08-03 21:39:28', '2021-08-03 23:39:28'),
('5ba4c5e7616ccfb84e5e54fa4c701fc41193af252dd22830191905ee792e6d9fd1018b99c398d680', 4, 8, NULL, '[]', 0, '2020-08-03 19:32:48', '2020-08-03 19:32:48', '2021-08-03 21:32:48'),
('5bcf1156ad6f7c24e8ed60eceb2e4a742ab76c7e7a65d9b18ffb9813428fbd3339d7e9ad926f4be4', 1, 8, NULL, '[]', 0, '2020-08-04 13:45:45', '2020-08-04 13:45:45', '2021-08-04 15:45:45'),
('5d29173cd059bebc7af56c237fddc77e276edbf483ff4910ffeb66a4177466a632fc47e2d6902834', 2, 8, NULL, '[]', 0, '2020-08-02 17:44:34', '2020-08-02 17:44:34', '2021-08-02 19:44:34'),
('60bc0b391452b7aea63b62bfa8cb57577cfc9460097e25543a4137f47d599cf4a3c6c395d8b0e875', 4, 8, NULL, '[]', 0, '2020-08-03 21:12:38', '2020-08-03 21:12:38', '2021-08-03 23:12:38'),
('61b9c4becec6db99ed751f30ce182ea557a6290535eaf912a6489f6e907a713b2b6fa893196989a4', 4, 8, NULL, '[]', 0, '2020-08-03 21:24:00', '2020-08-03 21:24:00', '2021-08-03 23:24:00'),
('61baf1c54186637beafba18cf5d9e25ea52345631b3eff8c4ea22d4505678f015c312fffbc504386', 4, 8, NULL, '[]', 0, '2020-08-03 19:29:00', '2020-08-03 19:29:00', '2021-08-03 21:29:00'),
('63241d3552c6007b8bc3754ca7954ae6161ec00c902331a31d8d017431db604b305a2bd798bb01c2', 1, 8, NULL, '[]', 0, '2020-08-06 14:05:21', '2020-08-06 14:05:21', '2021-08-06 16:05:21'),
('6b73eef16272f8366c50a96ebf608984655da0887569aab7c834cec88d660a619767e114af178d5f', 4, 8, NULL, '[]', 0, '2020-08-03 19:50:56', '2020-08-03 19:50:56', '2021-08-03 21:50:56'),
('7487da8dcdabd948203aa88a1350ba32d4472e4130d52d10c1020708dfa9ed25d780dfa6461377f9', 1, 8, NULL, '[]', 0, '2020-08-07 22:43:13', '2020-08-07 22:43:13', '2021-08-08 00:43:13'),
('7504094ccf207319a681ed960bf167bc1b8408a7e8f5e52df924ebe212164c20db82211ef11fa011', 4, 8, NULL, '[]', 0, '2020-08-07 22:12:01', '2020-08-07 22:12:01', '2021-08-08 00:12:01'),
('7c72e72ddc8b5d6c8b19ec4f3db947df69e3acb861d09a83c9687c25f4978fbbff14794de244e51c', 4, 8, NULL, '[]', 0, '2020-08-03 21:56:52', '2020-08-03 21:56:52', '2021-08-03 23:56:52'),
('803a98315b3fdc0551c872fbaa486f830c5c33175c9e7228e8176c27266a0a77012b25d55af936f7', 1, 8, NULL, '[]', 0, '2020-08-04 13:44:40', '2020-08-04 13:44:40', '2021-08-04 15:44:40'),
('81b967067e0865016fcc7595dd7a30d2861ae24d577e1e997ec6f627687bc6e4e3dd934e4f57c6ef', 4, 8, NULL, '[]', 0, '2020-08-07 22:09:41', '2020-08-07 22:09:41', '2021-08-08 00:09:41'),
('82cd02f3b5eb7715e86dd3a1400a8c17f20249776644c18a08b58aa06fc000b30f9b3f4d1ef4740d', 4, 8, NULL, '[]', 0, '2020-08-03 21:52:59', '2020-08-03 21:52:59', '2021-08-03 23:52:59'),
('83ba80e9d5f7c3d7f46b8c0e0f1fd020291bf36841262089259d4ac426e1084abce44d1ac7020fcb', 2, 7, 'MyApp', '[]', 0, '2020-08-03 18:38:08', '2020-08-03 18:38:08', '2021-08-03 20:38:08'),
('84a8d435c78d7f770b9203b24fd5b943f13dd941be8c23a49170f6a9484099c686c5f44744cd1248', 4, 8, NULL, '[]', 0, '2020-08-03 19:23:52', '2020-08-03 19:23:52', '2021-08-03 21:23:52'),
('85b9b235ad9c5f609caf5f219f1b49bec4a61b0cd0541f93169c8eb40e45c86ceffa9aa5d2401e5d', 4, 8, NULL, '[]', 0, '2020-08-03 21:55:27', '2020-08-03 21:55:27', '2021-08-03 23:55:27'),
('86df00ec2076797d13903e6d5d41289e7dbfad3be3ec8d272391dc4fd87d70e66ca60b485e0d5cfc', 4, 8, NULL, '[]', 0, '2020-08-03 21:51:17', '2020-08-03 21:51:17', '2021-08-03 23:51:17'),
('885c8ca02d074c2c22d8bab64b61ea30fb06caa272cc3d5cdaef39912093dd2d6a7f67cb7b65ccd7', 4, 8, NULL, '[]', 0, '2020-08-03 21:55:20', '2020-08-03 21:55:20', '2021-08-03 23:55:20'),
('89f0e0e8e41b4c260a3473f3973d4ba61b0ad0e12602b9f3cb2be1f613511782431f63fa6be7756f', 1, 8, NULL, '[]', 0, '2020-08-06 14:01:06', '2020-08-06 14:01:06', '2021-08-06 16:01:06'),
('8e19fedb3d8e39f05e16f2bdf13f1f54a276cdf708f8e3c6dfce3307b9fc566beff6c9287553072c', 4, 8, NULL, '[]', 0, '2020-08-03 21:57:03', '2020-08-03 21:57:03', '2021-08-03 23:57:03'),
('952ec38cd7de942639920e3aed7ef35c4885aad24e95e6d5aef3898c8850bb6f6a9b20ec3a50b8ac', 4, 8, NULL, '[]', 0, '2020-08-03 21:13:16', '2020-08-03 21:13:16', '2021-08-03 23:13:16'),
('996368e0a016f962192e25a0d5a3677813de460bc60eb63bf65fd22fd71d1f8674cb1b2aedc60bae', 4, 8, NULL, '[]', 0, '2020-08-07 22:38:33', '2020-08-07 22:38:33', '2021-08-08 00:38:33'),
('9d4d2f24913bc4c1c9869e74196effa604391de5a049086c33c965d087660984e491ef9e4f522c29', 4, 8, NULL, '[]', 0, '2020-08-03 19:30:30', '2020-08-03 19:30:30', '2021-08-03 21:30:30'),
('a1f815bfbf54eccafe1bf312842cd8b278c264a6bf656d6cc965ad0dcd1bab87f25fbc41083f65e4', 4, 8, NULL, '[]', 0, '2020-08-03 21:51:35', '2020-08-03 21:51:35', '2021-08-03 23:51:35'),
('b3c5011b4f0fdde117932124a152decd5752d65a104c0423a9494e3e8b779d93f68236b91a974ffe', 4, 8, NULL, '[]', 0, '2020-08-03 21:25:46', '2020-08-03 21:25:46', '2021-08-03 23:25:46'),
('b5800c9b7afde4ce8ff53fd3bff32d8031506b6a4b228ef2c15a039fd5f18d0966de36810119aac4', 1, 8, NULL, '[]', 0, '2020-08-07 22:10:27', '2020-08-07 22:10:27', '2021-08-08 00:10:27'),
('b830edadbacc88a28cb85ceeb558db4b872e1c16ace85710bd54f33e79752a042c9f37132cd81b2f', 4, 8, NULL, '[]', 0, '2020-08-03 21:59:41', '2020-08-03 21:59:41', '2021-08-03 23:59:41'),
('bd5b5f8dc2e80db3af66d288ab2ef68e268c8695062705b95a16b3a4bbb59606f7b4b74cde599e97', 1, 8, NULL, '[]', 0, '2020-08-04 20:44:57', '2020-08-04 20:44:57', '2021-08-04 22:44:57'),
('bf532295c7612a1a3e592e331a10e149155a3174daabaf7956903a9f242ff29d2da6453f4c455004', 4, 8, NULL, '[]', 0, '2020-08-03 21:48:59', '2020-08-03 21:48:59', '2021-08-03 23:48:59'),
('bf9ac97f8c5866884a522daf51290c5d7d2768ae2db66d48c954b371a44bc6456fd805207f9babd5', 4, 8, NULL, '[]', 0, '2020-08-03 21:37:33', '2020-08-03 21:37:33', '2021-08-03 23:37:33'),
('c087c9ab060272f5ee875c51b1f08ab60598a24e0c9d6429a795808b41d60cb3e47fd4b1a3736d29', 4, 8, NULL, '[]', 0, '2020-08-03 21:55:41', '2020-08-03 21:55:41', '2021-08-03 23:55:41'),
('c371b40eb906f88c5c29a89479cb74270f7eab311146e6c1d9aff103e2a414c3c15b6cfa3bce7b5e', 4, 8, NULL, '[]', 0, '2020-08-03 19:26:12', '2020-08-03 19:26:12', '2021-08-03 21:26:12'),
('c411a97a632289ccca2230d07d65f4b18f9cb49ab6774d59ea4bc9e94e5cbdb4a0620da74f120f7e', 1, 8, NULL, '[]', 0, '2020-08-07 22:31:09', '2020-08-07 22:31:09', '2021-08-08 00:31:09'),
('c485848130ef6fe49bb5dbda37d9b444e8526531404f3652be5e8c9191f6fe5a551da019bcebd235', 4, 8, NULL, '[]', 0, '2020-08-03 21:25:51', '2020-08-03 21:25:51', '2021-08-03 23:25:51'),
('c7b2d0a60520c364799529f661d15c585bf4ca087aea64113bcc1a6e9ad2ba7f1c5e354931464fd6', 1, 8, NULL, '[]', 0, '2020-08-04 13:41:49', '2020-08-04 13:41:49', '2021-08-04 15:41:49'),
('cde4ec4464c72bcacc66ce0f1e78700078ef40887479a20a85ca84ef0113c6392c0825f4f6ebf23f', 4, 8, NULL, '[]', 0, '2020-08-03 21:57:17', '2020-08-03 21:57:17', '2021-08-03 23:57:17'),
('dd27ea476c1c2bf86f052ce3569603089117ac4f16592f1be159563f16298370ad36bbab60c82a44', 6, 7, 'MyApp', '[]', 0, '2020-08-06 14:04:32', '2020-08-06 14:04:32', '2021-08-06 16:04:32'),
('e101a994ae6c88f17f519bba78ab64ea97c8ea8cee521540d1b2718d5d0fcb05f8e7ce9e59f96dd6', 4, 8, NULL, '[]', 0, '2020-08-03 19:47:16', '2020-08-03 19:47:16', '2021-08-03 21:47:16'),
('e1c6aa75897c922ddf52fe0765302ed5736defe93a94723c7d7cb0d9c1e757eee55e11ed203887a5', 1, 8, NULL, '[]', 0, '2020-08-04 13:43:35', '2020-08-04 13:43:35', '2021-08-04 15:43:35'),
('e5f5bec1f19561acb85f09019f94dd48fbb528b0f0a18a058fce7197512363cf2a2672281f310bf4', 4, 8, NULL, '[]', 0, '2020-08-03 21:18:48', '2020-08-03 21:18:48', '2021-08-03 23:18:48'),
('ef3681d9f2b336146d6e93dbf8cfc6f3e5d9874effafee9b6a3e7408e448c098471fe3ade369daf4', 4, 8, NULL, '[]', 0, '2020-08-03 21:55:53', '2020-08-03 21:55:53', '2021-08-03 23:55:53'),
('f6e55e0ac079111cad920232c289aecb8ee8ef0c4387513bbc936a4bb5d421c7a86a4d3b8481975b', 4, 8, NULL, '[]', 0, '2020-08-03 21:48:16', '2020-08-03 21:48:16', '2021-08-03 23:48:16'),
('fdb4cdc521a78b54313e77b4165c543cc27759258d3c5ed2c7762bbf525a630d0bbd921456796424', 4, 8, NULL, '[]', 0, '2020-08-03 21:56:31', '2020-08-03 21:56:31', '2021-08-03 23:56:31');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'HFsRYvE0UGWCfgsZpQXrD28Fx6gbJiQSCWJaRxPJ', NULL, 'http://localhost', 1, 0, 0, '2020-08-02 17:26:51', '2020-08-02 17:26:51'),
(2, NULL, 'Laravel Password Grant Client', 'wjNugnt5wyiDhkW3bd3TaU0qmze0FiU0xiLpWV4b', 'users', 'http://localhost', 0, 1, 0, '2020-08-02 17:26:51', '2020-08-02 17:26:51'),
(3, NULL, 'Laravel Personal Access Client', 'kzQmQWo5HcSdsihVEARJWmm3eGrzShyexWl1MSKZ', NULL, 'http://localhost', 1, 0, 0, '2020-08-02 17:33:32', '2020-08-02 17:33:32'),
(4, NULL, 'Laravel Password Grant Client', 'hugxFHUSB8HycyWSn4qWNwXzn97B3sk1I72mOD0j', 'users', 'http://localhost', 0, 1, 0, '2020-08-02 17:33:32', '2020-08-02 17:33:32'),
(5, NULL, 'Laravel Personal Access Client', 'BLHOvMOvYGpm3mR5UxUeAMH1beJg0lKwjfXGf0fq', NULL, 'http://localhost', 1, 0, 0, '2020-08-02 17:35:35', '2020-08-02 17:35:35'),
(6, NULL, 'Laravel Password Grant Client', 'SWJHuavurr7YlKpXuWLmZBcwX3cxJMC1iXuQ9owG', 'users', 'http://localhost', 0, 1, 0, '2020-08-02 17:35:35', '2020-08-02 17:35:35'),
(7, NULL, 'Laravel Personal Access Client', 'LYEf8E34drJhLOnXnBMLeQ9eYLK57tqjHbwhNtsE', NULL, 'http://localhost', 1, 0, 0, '2020-08-02 17:42:48', '2020-08-02 17:42:48'),
(8, NULL, 'Laravel Password Grant Client', 'iBNU3rvOWy7E7u9j7mnU08Oa2ceuMsvMbGdvdCJI', 'users', 'http://localhost', 0, 1, 0, '2020-08-02 17:42:48', '2020-08-02 17:42:48');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-08-02 17:26:51', '2020-08-02 17:26:51'),
(2, 3, '2020-08-02 17:33:32', '2020-08-02 17:33:32'),
(3, 5, '2020-08-02 17:35:35', '2020-08-02 17:35:35'),
(4, 7, '2020-08-02 17:42:48', '2020-08-02 17:42:48');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('028713908c67fd1d25e3594170df6599ab18e03509e1dfb0c86ec627c8bc7ed3be46d4f0b52d9fd6', '9d4d2f24913bc4c1c9869e74196effa604391de5a049086c33c965d087660984e491ef9e4f522c29', 0, '2021-08-03 21:30:30'),
('2029a70466ffb4242ea2b39c65128d6f2f20981dc17f59410c1efc64b3b72c4d98db723104054350', '529d80bbcf2d12433d7426512359869a3cf9e081d2bf479cc3bc291ead8a6d559fc52260fb31ad7d', 0, '2021-08-03 23:39:28'),
('2926f760cf0d18a7f4ecb5970c5499171f38cd3e4e0239b645e132533b42e8ee71cd5d6dcff27874', '4a7ad2b8baa70b78a7b7357042f73e8ff2188642fe3a29a234fe31e3f09e6e566fa34c8fc792f51e', 0, '2021-08-03 23:44:58'),
('2c74e19cda80ca0e1cdad3f99f456176a8596e44616d369419479a1c4f09a2c5873a483e2f07ff5c', '029377daf4e57114080fe207ae40b48d43519cb4ec6265b011ac05a750d8e28f44ef722b0550e2f8', 0, '2021-08-03 23:39:47'),
('2fbf5be27500e0fe1c6f8ce7a601f1e875e88920aaaa5f46d39107de4e89fa968e8f6d875dfc75ff', '85b9b235ad9c5f609caf5f219f1b49bec4a61b0cd0541f93169c8eb40e45c86ceffa9aa5d2401e5d', 0, '2021-08-03 23:55:27'),
('2fdef039fdb1bb5b5dc73baac526002dde0f872e014e8d7f634b48cc8fabad35ad38e950a972c534', '09534ed71bfa3bc8d9614bca1bffe0c25cec125160375866ead49237bd44e5b66a5a01ee2c7e2f2e', 0, '2021-08-03 23:56:18'),
('3491f69f7da4662e0165c372b367acc874af7ba18361f66b2a0fe79de853caa0ad60358505d75f38', '63241d3552c6007b8bc3754ca7954ae6161ec00c902331a31d8d017431db604b305a2bd798bb01c2', 0, '2021-08-06 16:05:22'),
('3d7848f42fa67d6850b6bce0e3cf0b487eff958917b24ac7553f8c6a7b4004a055d406f2c78064cc', '60bc0b391452b7aea63b62bfa8cb57577cfc9460097e25543a4137f47d599cf4a3c6c395d8b0e875', 0, '2021-08-03 23:12:38'),
('465b3fbacaebbddc52dcba8bf1864cb875210b7728ad715ba35bf98efbf97c4c568dea18d0008597', '81b967067e0865016fcc7595dd7a30d2861ae24d577e1e997ec6f627687bc6e4e3dd934e4f57c6ef', 0, '2021-08-08 00:09:41'),
('4ed7fee2e10b0b562d9f671cd7320ee67545037f6e611801260fbca919c0516eb41313faf78749ff', '2b4e12f00ddb93cd72187356fe5f2cd1e42062b08b432a69fb2111217823caa609a28c1cae5f73bf', 0, '2021-08-03 21:21:18'),
('5583e5fed149e9e16f43cc5987deb60ea486399da0bcd58e0e90343580ce4f7350961842fecd5bda', '84a8d435c78d7f770b9203b24fd5b943f13dd941be8c23a49170f6a9484099c686c5f44744cd1248', 0, '2021-08-03 21:23:52'),
('55a20bdaf1ffe3c852a9f40bf5ab872fbc6cf1066fcc08658f6e22cbd2ad417aeb2d60d622c437d5', '7504094ccf207319a681ed960bf167bc1b8408a7e8f5e52df924ebe212164c20db82211ef11fa011', 0, '2021-08-08 00:12:01'),
('5fd5cbe70d4c42d1d7faa579d8b45c992f8dcdc17b061e580f9bfabd948d77e24772101d2701800d', '952ec38cd7de942639920e3aed7ef35c4885aad24e95e6d5aef3898c8850bb6f6a9b20ec3a50b8ac', 0, '2021-08-03 23:13:16'),
('629de61457f048dc60322aaf68d53056cf82d3f77fc1080f3f758c89748620996468595fdf35d691', 'e101a994ae6c88f17f519bba78ab64ea97c8ea8cee521540d1b2718d5d0fcb05f8e7ce9e59f96dd6', 0, '2021-08-03 21:47:16'),
('63fe9a76874c0db1c8702a717059744bb44b8c128a694e53f725b36f2a2a9cdd32edbd64a3c52bd7', '61baf1c54186637beafba18cf5d9e25ea52345631b3eff8c4ea22d4505678f015c312fffbc504386', 0, '2021-08-03 21:29:00'),
('711006c6202f925478137688eaa05eaafbfe4f14fe4e83b58a4b0d5cdf74371f0461d81e7f4b6d5f', '48d77a0140b16a1bcdfd9f1d736b2bf299ef9fbd7f79c76f9678e19df97524ffe86865d12dab3d6b', 0, '2021-08-06 22:03:53'),
('74b42bd7a8ef740593e8b19fec7ab44e13c2f7679548b8b46c9ab1500a7af8f52a2df46935c19391', '5d29173cd059bebc7af56c237fddc77e276edbf483ff4910ffeb66a4177466a632fc47e2d6902834', 0, '2021-08-02 19:44:34'),
('755b4226b78cdfe25ff17c8432caa6f5ec32aa8b89b2480cdce8469107f1fffa06a76d1d4d8c5e9d', '996368e0a016f962192e25a0d5a3677813de460bc60eb63bf65fd22fd71d1f8674cb1b2aedc60bae', 0, '2021-08-08 00:38:33'),
('7614c034d84a1443471f398f9ff28c778b3881e3579cfcf77b869104651ef67eb4cc46dccc55accd', '44b34632d92c4d3f5a44280c78f4c9f49e67164a6a4a87e60090dbbf9915397e29047db0b5dfcb48', 0, '2021-08-03 23:19:42'),
('766fc4721b9a023122a0dbbe649725775270b53a94599469bb568581034df46a0e1817a7fb7a7230', '6b73eef16272f8366c50a96ebf608984655da0887569aab7c834cec88d660a619767e114af178d5f', 0, '2021-08-03 21:50:56'),
('7ad980f73b2ccdd94f745c3e43d58e29b77acd711a25227673b6aed33d2d6134102d318f281033a7', 'bd5b5f8dc2e80db3af66d288ab2ef68e268c8695062705b95a16b3a4bbb59606f7b4b74cde599e97', 0, '2021-08-04 22:44:57'),
('821e319f30a1e064324cb4c8667503e5f70c7fa7a914f582dd12adac492e4480b8c4cd9c216cdf3e', '2e7256e6c9a38470df9b10841e75990e484a39303c16a6f69e1d712519b5fbdd33cd7b81672ed960', 0, '2021-08-03 23:52:31'),
('85989cd426ba122beec9a775041079998be05c5a9d26012c52f0657126728bbb62c0154f5d12eac5', '17c397207f529e6c263f9be1bfb883842c0bdf7885febae835f4b2b78f683806fbd0babed12080fe', 0, '2021-08-03 23:55:05'),
('87f1e6cbd94b8831526f2e19981ca0c2f7601c50d944a984218a54a2f76968cb597f1087dee57821', '82cd02f3b5eb7715e86dd3a1400a8c17f20249776644c18a08b58aa06fc000b30f9b3f4d1ef4740d', 0, '2021-08-03 23:52:59'),
('895fb6167a48d89142fe480d473acf709be842d4224464e81bdeb80bd67d18edeaba6ba52975616f', '4501a99164207acbdafe9e40c52c7711a8d3362cced71d7914d1b78c314de84a853329b9abc7f2b7', 0, '2021-08-03 23:56:06'),
('8a3132cb6ffaac89c8699901401d385b30d6db97a7fd4da76aa47f89278fcf05e5eff9a3f1e3ca4b', 'f6e55e0ac079111cad920232c289aecb8ee8ef0c4387513bbc936a4bb5d421c7a86a4d3b8481975b', 0, '2021-08-03 23:48:16'),
('8e3e70a02c80f9815f2da8d828b87a5315e907899fa1e05e93f87cde0d91b7f48bcb0f675f679e0d', 'cde4ec4464c72bcacc66ce0f1e78700078ef40887479a20a85ca84ef0113c6392c0825f4f6ebf23f', 0, '2021-08-03 23:57:17'),
('8ff98d724f51202c86fbf0b4a7b519c581d5334a2d2b5a19930b6faf7923bd7ce8f7ed6fbcf902d8', '86df00ec2076797d13903e6d5d41289e7dbfad3be3ec8d272391dc4fd87d70e66ca60b485e0d5cfc', 0, '2021-08-03 23:51:17'),
('933ffe996f5454b674acf844005e87e98e3ade6756655936efe44720b55772f553b1f482f278dd4f', 'c485848130ef6fe49bb5dbda37d9b444e8526531404f3652be5e8c9191f6fe5a551da019bcebd235', 0, '2021-08-03 23:25:51'),
('93ddd96cca41ee6351623f0457c45a62cac3f3fe25f818976f1b65f04e2ea147d65e01803e10ada9', 'b3c5011b4f0fdde117932124a152decd5752d65a104c0423a9494e3e8b779d93f68236b91a974ffe', 0, '2021-08-03 23:25:46'),
('9b53a2847d8c75009d099405980ed802b9dc9d18f4712feacff7c1d59e146d5aaa0108e8e4c7f670', 'b5800c9b7afde4ce8ff53fd3bff32d8031506b6a4b228ef2c15a039fd5f18d0966de36810119aac4', 0, '2021-08-08 00:10:27'),
('9c9842c0a573da3f14596a4aae2c6ebad08ebe791a8e7a1f342e8cfdc7c1ca1eb78d98ad85b5b366', 'fdb4cdc521a78b54313e77b4165c543cc27759258d3c5ed2c7762bbf525a630d0bbd921456796424', 0, '2021-08-03 23:56:31'),
('9d07147c87117d20ea239c009c5a3028faa90d940bb49ec633d9c59b6b666bd434b4b052c280f0c2', '05fc922f80142abe09ff58c9b609ed3377f843f92295f05b6815f8aa9a4323d51a8dee31adf463fc', 0, '2021-08-03 23:32:50'),
('a4981875def281eb22a0476a4d2509d758d4825670cf92ae32d6a80d19f86616b07da21d7a71de14', '885c8ca02d074c2c22d8bab64b61ea30fb06caa272cc3d5cdaef39912093dd2d6a7f67cb7b65ccd7', 0, '2021-08-03 23:55:20'),
('a53f183a5e2b6f02a93d8f77186b8bec53e5868e77fb6c9186d6768d3b29bfe1666d9d5cc24001ae', '118e59f3651ce24e809f897b0c68758da3c40a7b532dc8e6f376d9628b95c7d5a48c59d04ac18a6c', 0, '2021-08-04 15:41:48'),
('a6a15a94a7fed5b928e2a740e515ee1d78cbb55119674c40b572c2d672f6423babe2575e55e4941b', '22a78c26f915c9468dd295e76353cb1cf266f7f0abd2414eb11346678a1c97ea80574b528105a94a', 0, '2021-08-03 23:53:22'),
('a8be748e2d78a192b8ab3bd60a48bd1d0e101ab5a48f80692e40a3ce342273ee9c780cbe8d618e40', 'c411a97a632289ccca2230d07d65f4b18f9cb49ab6774d59ea4bc9e94e5cbdb4a0620da74f120f7e', 0, '2021-08-08 00:31:09'),
('b5f54197537ab0271a80a9cae94d21806262391be4757d53f72f909ee917a37a2440f522ac6e5228', '7487da8dcdabd948203aa88a1350ba32d4472e4130d52d10c1020708dfa9ed25d780dfa6461377f9', 0, '2021-08-08 00:43:13'),
('b7b823c985de337d3ab7c692d53c863c890cd6239ac5c60fcd81193b69d16591e8f056ca60b96c50', '7c72e72ddc8b5d6c8b19ec4f3db947df69e3acb861d09a83c9687c25f4978fbbff14794de244e51c', 0, '2021-08-03 23:56:52'),
('bb6b00b12b9474ac49398f28c1c5adfbb5040e9ead24d1117984f569d1087d6d2cec7653201ede0b', '398587c45a77c8501b284849180cd35770395372cbf1733f5932226776517d26cbb69d3a17dec64d', 0, '2021-08-04 15:34:59'),
('bb8597a34117a6d6698f7975c0af45013acffa812633b0ca27fa37425268f0bdb8bdef329c602a6d', '119cc8c392fde12e5881b455a9201f0300fe35b720193c0b2d49baa5f47ec0b8638bfb6bee450e91', 0, '2021-08-04 15:45:35'),
('bcedeee2b2c5cb26091020eb8349420e9eff08a4bb6e15110d1edf5a8f30714ce508199d672d652e', '61b9c4becec6db99ed751f30ce182ea557a6290535eaf912a6489f6e907a713b2b6fa893196989a4', 0, '2021-08-03 23:24:00'),
('bd38a5715f74641da47ddd4cd23cf05be535a5fbdb22c3409f5c817f23af92c06b3db8430b6053d6', 'c087c9ab060272f5ee875c51b1f08ab60598a24e0c9d6429a795808b41d60cb3e47fd4b1a3736d29', 0, '2021-08-03 23:55:41'),
('c16755001cdfe233e5fb3495706eabef0e5ff1624d772886235d5e44d5f8cbc9bd4678c51acec0be', '0cdc7a7e91defb386adfb0876ae04f3df02137c66d5865de43ed854e7430932aa13c4cdff1c7e9d7', 0, '2021-08-03 21:01:46'),
('c33fcf08f390503f5d5b9a511b9e57fb3a6bd02ccbb2793d758c157dd37603d3af98bd04bf79ab0e', '5bcf1156ad6f7c24e8ed60eceb2e4a742ab76c7e7a65d9b18ffb9813428fbd3339d7e9ad926f4be4', 0, '2021-08-04 15:45:45'),
('c5daaa14a9d30992083a2c2934f865b555e0fa839390b88517d6e486711b9a7d32da7ddfcf773e11', '07e184f9adcc58a2c060b106b5a33528a1d1c91fdb54a6db03bcd4d22c028e49487a964a014d9b24', 0, '2021-08-03 22:19:51'),
('c714a4ed64b7289d2c9d664cf66015d18b7c9340ec2d752fbc08cc6c32fcbe09e2ad9a69cc5ea996', 'c7b2d0a60520c364799529f661d15c585bf4ca087aea64113bcc1a6e9ad2ba7f1c5e354931464fd6', 0, '2021-08-04 15:41:49'),
('c77e0d07b894b610e1a34fa2195f028931d87725f90daadab86fde5539fe4207a6bfacc51cac044e', 'bf9ac97f8c5866884a522daf51290c5d7d2768ae2db66d48c954b371a44bc6456fd805207f9babd5', 0, '2021-08-03 23:37:33'),
('d33e3f88925d46da24cb64145cc65f132d5642dec0521de5315d8c9e4bb1d4c2467b1ef59cc826ea', '3492dbe84519b1e4565d44d9d7a41aea216622dd72c3f2234bef933550ab291b449c9706e69524c2', 0, '2021-08-03 23:17:51'),
('d4f3d7f7dc493c4a0c7d16b45f24d347415c980bfa96eaebef56f199d7d0a0de0ec98e1afe419040', '89f0e0e8e41b4c260a3473f3973d4ba61b0ad0e12602b9f3cb2be1f613511782431f63fa6be7756f', 0, '2021-08-06 16:01:06'),
('d8c234688e9c37838436da2920859030f7809ebcf033e595c67482bb784b95e1b5eb877d19d4503f', 'e5f5bec1f19561acb85f09019f94dd48fbb528b0f0a18a058fce7197512363cf2a2672281f310bf4', 0, '2021-08-03 23:18:48'),
('df45fe7d33a1d8ce9831ac1537ad34bfcb9642081f76eaa60be622018f0c44684ee348b668c0c539', '154b999c529680f9080021a62c030702a44e517cdf5e0020b74187a455f1c4855dfad64c92daec8b', 0, '2021-08-04 15:34:48'),
('dffcf21fb2879e58ff124e470e538444f2b128956253daf667f62c3f3249aa7202d5b0412a6f38a2', 'a1f815bfbf54eccafe1bf312842cd8b278c264a6bf656d6cc965ad0dcd1bab87f25fbc41083f65e4', 0, '2021-08-03 23:51:35'),
('f20220f5127617eba9e97394902b03f69bd2667a9bf79be41bf584113ae40496dce7aaeb9d038917', 'bf532295c7612a1a3e592e331a10e149155a3174daabaf7956903a9f242ff29d2da6453f4c455004', 0, '2021-08-03 23:48:59'),
('f227944fd29494af09191903cb1092d39bcfee5bfe519f85c9dcb805117b72b7e35c7732c44f29c0', 'ef3681d9f2b336146d6e93dbf8cfc6f3e5d9874effafee9b6a3e7408e448c098471fe3ade369daf4', 0, '2021-08-03 23:55:53'),
('f56f8c2dfb97ab3cb714b3a96bb672f60534f6517d976e61b445534565c15d518eb73be0d7c91221', '8e19fedb3d8e39f05e16f2bdf13f1f54a276cdf708f8e3c6dfce3307b9fc566beff6c9287553072c', 0, '2021-08-03 23:57:03'),
('f5d5415d42c6aa265762ccced176dcfff5f59d303672b30cfb6b2ed3eb214f466bd9ad5161759e18', 'b830edadbacc88a28cb85ceeb558db4b872e1c16ace85710bd54f33e79752a042c9f37132cd81b2f', 0, '2021-08-03 23:59:41'),
('f95ff8906833cbcad139f0f0864d43f481de7625b1c666cf03e9d880fb55d1b47570e36a6a2dfb97', '803a98315b3fdc0551c872fbaa486f830c5c33175c9e7228e8176c27266a0a77012b25d55af936f7', 0, '2021-08-04 15:44:40'),
('fa0e6a59ebc876e237c1bc0ec3522907ad6cfd93b386a36b2841291c674461e03082bff3539db914', '46ee34b4af06ed3ed312d579a8ca0e51595866d10d173914259159831cfebea23e627bc1ab160927', 0, '2021-08-03 23:12:59'),
('fa6bc1453c9ebe42581dc3055ebfcf817e7aa9c1b9e1110153017244b28f9e5babe5e7d6d5db2a0e', '08ff29523f7729b757563ad3919cc8d33d38dee7b0676e50dda538f83c1a0f57188a891f625040bf', 0, '2021-08-07 22:04:48'),
('faadf8c205dc15e2f8e8714541b31340590bb7c44b10a79140913bbc5c281c5f14faf4f7161dc078', 'c371b40eb906f88c5c29a89479cb74270f7eab311146e6c1d9aff103e2a414c3c15b6cfa3bce7b5e', 0, '2021-08-03 21:26:12'),
('fb0485280771fce7d6a81898e52a69b4d6197fd08337a3bd18b80085c6ea1be902ce3c879bd2d367', '5ba4c5e7616ccfb84e5e54fa4c701fc41193af252dd22830191905ee792e6d9fd1018b99c398d680', 0, '2021-08-03 21:32:48'),
('fbcce1f786afdb4f99c705ebb30076ebbc37e79e25f7d677af930c48077544a816cc491ceff2b253', 'e1c6aa75897c922ddf52fe0765302ed5736defe93a94723c7d7cb0d9c1e757eee55e11ed203887a5', 0, '2021-08-04 15:43:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role_id`, `token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$mB2XfE80EVOaz974hjGkrOkaN3vPKkdwVEAvoRFMWVbfqWioHukHy', 1, NULL, NULL, '2020-08-02 17:15:22', '2020-08-02 17:15:22'),
(4, 'shejza', 'shejza@gmail.com', '$2y$10$N3Mwx5yV0w7CenghGHalmecU/20vp11Yez/kCKtf6IjrEoLQi00R.', 2, NULL, NULL, '2020-08-03 19:01:38', '2020-08-08 08:32:03'),
(5, 'test', 'test@gmail.com', '$2y$10$p.Td4r1B8ly7ER5Y/DlS1eAW1YJg.UJO6TFTI0mZ1NVa5JZYu0X5q', 2, NULL, NULL, '2020-08-06 14:00:49', '2020-08-06 14:00:49'),
(6, 'test2', 'test2@gmail.com', '$2y$10$6TJAdGjsO1pdJryJp2LR.OK4dgKy/7qhv6qng1xvgWdDgWraY8XVa', 2, NULL, NULL, '2020-08-06 14:04:32', '2020-08-08 08:32:26'),
(7, 'test', 'rr@gmail.com', '$2y$10$sEEVzSpjRMs7fo5sYFQtcOoPev8aWN8vXjPTIp8IN0MqFFPDW2y3G', 2, NULL, NULL, '2020-08-06 14:05:35', '2020-08-06 14:05:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_user_id_foreign` (`user_id`);

--
-- Indexes for table `notesdescription`
--
ALTER TABLE `notesdescription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notesdescription_notes_id_foreign` (`notes_id`),
  ADD KEY `notesdescription_user_id_foreign` (`user_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `notesdescription`
--
ALTER TABLE `notesdescription`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notesdescription`
--
ALTER TABLE `notesdescription`
  ADD CONSTRAINT `notesdescription_notes_id_foreign` FOREIGN KEY (`notes_id`) REFERENCES `notes` (`id`),
  ADD CONSTRAINT `notesdescription_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
