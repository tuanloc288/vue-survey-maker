-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2023 at 08:01 AM
-- Server version: 8.0.30
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_vue_survey`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_13_093356_create_surveys_table', 2),
(6, '2023_11_13_093807_create_survey_questions_table', 2),
(7, '2023_11_13_093845_create_survey_answers_table', 2),
(8, '2023_11_13_093914_create_survey_question_answers_table', 2),
(10, '2023_11_15_061304_add_image_column_to_survey_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'main', '84dec5782b7d7a3618c5ae813190cfb366aebce072e4322cae0b908e67c36b32', '[\"*\"]', NULL, '2023-11-13 06:39:20', '2023-11-13 06:39:20'),
(2, 'App\\Models\\User', 1, 'main', 'be0a8b3c7d47144024a4aa75262a6e9d084fee099e161c184674e899080576da', '[\"*\"]', NULL, '2023-11-13 06:58:57', '2023-11-13 06:58:57'),
(3, 'App\\Models\\User', 1, 'main', '85c969d840facacac0b187ae51282307b2189e012b2fb90b05609219f97be5ae', '[\"*\"]', NULL, '2023-11-13 06:59:00', '2023-11-13 06:59:00'),
(4, 'App\\Models\\User', 1, 'main', '946cff0946625436ca46fd872f5b27c8651bd11e4614d73c5d454975e0753252', '[\"*\"]', NULL, '2023-11-13 07:00:17', '2023-11-13 07:00:17'),
(5, 'App\\Models\\User', 2, 'main', 'f97842c15b3a466d8db88182c5d69a565e00f08dbbd439322d81a32b92d5128b', '[\"*\"]', NULL, '2023-11-13 07:03:31', '2023-11-13 07:03:31'),
(6, 'App\\Models\\User', 2, 'main', '9e0702fb86cba5541907586904337c7493b786d303a5bda490217442fa268531', '[\"*\"]', NULL, '2023-11-13 07:05:13', '2023-11-13 07:05:13'),
(7, 'App\\Models\\User', 1, 'main', '2f069ca3a2c2ccec9b67ec5237215e30b1e90e9124facd7dfc111ab781572c2a', '[\"*\"]', NULL, '2023-11-13 07:06:54', '2023-11-13 07:06:54'),
(8, 'App\\Models\\User', 2, 'main', '4e8aa27a58b790ac960d18bf147ed58cf50611093bccd3dee3197b7b578468cd', '[\"*\"]', NULL, '2023-11-13 07:08:12', '2023-11-13 07:08:12'),
(9, 'App\\Models\\User', 1, 'main', '23ac226d6e7efd727fc8f977dd1a49286be24194c8d306922008aec1e5551d68', '[\"*\"]', NULL, '2023-11-13 07:26:05', '2023-11-13 07:26:05'),
(10, 'App\\Models\\User', 2, 'main', 'f87e4105a9ab087caed0d87d7b095e37c0f52b75543ef14c4caee6727ce5d61a', '[\"*\"]', NULL, '2023-11-13 07:28:26', '2023-11-13 07:28:26'),
(11, 'App\\Models\\User', 2, 'main', '2a98e6071c050e09c75cdb5f88c514f246b9b5d8f2bf0e9af26b59190dfba023', '[\"*\"]', NULL, '2023-11-13 07:29:00', '2023-11-13 07:29:00'),
(12, 'App\\Models\\User', 1, 'main', '5a1da57a0ea05fae8d27ed896de022e446c49e94cdcae919977e9f4d625e810b', '[\"*\"]', NULL, '2023-11-13 07:46:57', '2023-11-13 07:46:57'),
(21, 'App\\Models\\User', 1, 'main', 'aff282ad762dc1c0ad6c4dc32d62a3ee9bab9902b1272f5b0b97be1c2be4374c', '[\"*\"]', NULL, '2023-11-14 00:05:06', '2023-11-14 00:05:06'),
(22, 'App\\Models\\User', 2, 'main', '9e59719775721be76b666e1e0d26cbe7f9dc4d22e0b044f74c47d7500e254a5c', '[\"*\"]', NULL, '2023-11-14 01:30:11', '2023-11-14 01:30:11'),
(25, 'App\\Models\\User', 1, 'main', 'c535a5f1924c1f35349bd7f9764de36c1b675383232a473ef9cd43ba22d72e7d', '[\"*\"]', '2023-11-14 08:28:02', '2023-11-14 08:09:33', '2023-11-14 08:28:02'),
(27, 'App\\Models\\User', 2, 'main', '64a681e277af36f1b101d69c560f600c40c979f6646148735f10a7cc45774a4c', '[\"*\"]', '2023-11-15 03:48:28', '2023-11-14 23:56:49', '2023-11-15 03:48:28'),
(28, 'App\\Models\\User', 2, 'main', '25adabb00c7bfa406d6409045b20b0c314957d36b796d4e2e8dd0270be5fafa4', '[\"*\"]', '2023-11-15 04:27:47', '2023-11-15 04:17:40', '2023-11-15 04:27:47'),
(29, 'App\\Models\\User', 2, 'main', '58776dce00815d7c47a9874081d20c6bd32f6718b0d5f320c31517f6d9067559', '[\"*\"]', '2023-11-15 04:50:40', '2023-11-15 04:28:19', '2023-11-15 04:50:40'),
(30, 'App\\Models\\User', 2, 'main', '009540304f008f0d4b2a8b24323f6ed4e025830ea1486562875a1b8c37e59cbf', '[\"*\"]', '2023-11-15 07:43:01', '2023-11-15 05:37:35', '2023-11-15 07:43:01'),
(31, 'App\\Models\\User', 2, 'main', 'c2223362262c29f61541f12d51509c8bacb8325218ebf1334d1ae2fdd0ac97c0', '[\"*\"]', '2023-11-15 08:10:22', '2023-11-15 08:10:16', '2023-11-15 08:10:22'),
(32, 'App\\Models\\User', 2, 'main', 'b9f0fd4e8d207b9ed58fd65b664f275ea9c28bbeee52729631655d721c013e28', '[\"*\"]', NULL, '2023-11-15 23:15:49', '2023-11-15 23:15:49'),
(42, 'App\\Models\\User', 2, 'main', 'e518c29ec545024fbf6278ec91a37b007a9cdbfc9f77b3062d42580cb06b3a00', '[\"*\"]', '2023-11-16 03:11:58', '2023-11-16 03:11:56', '2023-11-16 03:11:58'),
(52, 'App\\Models\\User', 2, 'main', 'ae86155f3ed78f6a73a5def93183a2151f4fbab1e1a0caaf95e4497c42db3493', '[\"*\"]', '2023-11-16 09:48:39', '2023-11-16 07:51:03', '2023-11-16 09:48:39'),
(53, 'App\\Models\\User', 2, 'main', '960ae64cc34907cbd993468fdf2b3fa0bdce27f59fce675f9038d5b2470b5faf', '[\"*\"]', '2023-11-16 23:55:54', '2023-11-16 23:32:18', '2023-11-16 23:55:54');

-- --------------------------------------------------------

--
-- Table structure for table `surveys`
--

CREATE TABLE `surveys` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expire_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `surveys`
--

INSERT INTO `surveys` (`id`, `user_id`, `image`, `title`, `slug`, `status`, `description`, `created_at`, `updated_at`, `expire_date`) VALUES
(1, 2, 'images/JAn4qPXyBbiPhXI7.png', 'VueJS', 'vuejs', 1, 'Vue is a front-end JavaScript framework written in JavaScript. <br/> Similar frameworks to Vue are React and Angular, but Vue is more lightweight and easier to start with. <br/> Vue is distributed as a JavaScript file, and can be added to a web page with a script tag:', '2023-11-15 00:38:36', '2023-11-16 23:50:45', '2023-11-22 17:00:00'),
(2, 2, 'images/95BWoWV3iwYBmLRu.png', 'Laravel 10', 'laravel-10', 1, 'Laravel is a web application framework with expressive, elegant syntax. A web framework provides a structure and starting point for creating your application, allowing you to focus on creating something amazing while we sweat the details. <br/> Laravel strives to provide an amazing developer experience while providing powerful features such as thorough dependency injection, an expressive database abstraction layer, queues and scheduled jobs, unit and integration testing, and more. <br/> Whether you are new to PHP web frameworks or have years of experience, Laravel is a framework that can grow with you. We\'ll help you take your first steps as a web developer or give you a boost as you take your expertise to the next level. We can\'t wait to see what you build.', '2023-11-15 02:54:10', '2023-11-15 07:42:35', '2023-11-22 17:00:00'),
(3, 2, 'images/7Hm24JmHE3kXMhMv.png', 'TailwindCSS', 'tailwindcss', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu convallis erat, sit amet porttitor mauris. Nulla viverra rutrum nulla, vel ullamcorper nibh accumsan nec. Nullam vitae est eget turpis congue condimentum sit amet et dui. Sed fermentum et purus ut euismod.', '2023-11-15 06:03:17', '2023-11-15 06:08:03', NULL),
(4, 2, 'images/8xfX8okNDnaWtoTi.png', 'CakePHP', 'cakephp', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu convallis erat, sit amet porttitor mauris. Nulla viverra rutrum nulla, vel ullamcorper nibh accumsan nec. Nullam vitae est eget turpis congue condimentum sit amet et dui. Sed fermentum et purus ut euismod.', '2023-11-15 06:07:11', '2023-11-15 06:07:25', NULL),
(5, 2, 'images/xwCuvNGUPoAtj838.png', 'CodeIgniter', 'codeigniter', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu convallis erat, sit amet porttitor mauris. Nulla viverra rutrum nulla, vel ullamcorper nibh accumsan nec. Nullam vitae est eget turpis congue condimentum sit amet et dui. Sed fermentum et purus ut euismod.', '2023-11-15 06:08:55', '2023-11-15 06:09:57', NULL),
(6, 2, 'images/tZtjXBW9nlbGCwVb.png', 'Yii', 'yii', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu convallis erat, sit amet porttitor mauris. Nulla viverra rutrum nulla, vel ullamcorper nibh accumsan nec. Nullam vitae est eget turpis congue condimentum sit amet et dui. Sed fermentum et purus ut euismod.', '2023-11-15 06:09:26', '2023-11-15 06:10:03', NULL),
(7, 2, 'images/Wz2gDk1F815gT982.png', 'Symfony', 'symfony', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu convallis erat, sit amet porttitor mauris. Nulla viverra rutrum nulla, vel ullamcorper nibh accumsan nec. Nullam vitae est eget turpis congue condimentum sit amet et dui. Sed fermentum et purus ut euismod.', '2023-11-15 06:09:38', '2023-11-15 06:10:08', NULL),
(8, 2, 'images/bReZqQMvm25TNSKG.png', 'Zend', 'zend', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu convallis erat, sit amet porttitor mauris. Nulla viverra rutrum nulla, vel ullamcorper nibh accumsan nec. Nullam vitae est eget turpis congue condimentum sit amet et dui. Sed fermentum et purus ut euismod.', '2023-11-15 06:10:27', '2023-11-15 06:10:27', NULL),
(9, 2, 'images/VWis1hYDuuwAsuWa.png', 'ReactJS', 'reactjs', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id arcu imperdiet, elementum risus at, feugiat leo. Mauris sed velit a libero porta semper. Vivamus eu sapien ex. Ut venenatis arcu nulla, a imperdiet lectus dignissim eu. Fusce sit amet purus ullamcorper ipsum porttitor posuere. Vivamus vulputate quis metus at sollicitudin. Vestibulum consequat pharetra gravida. Nulla sed orci facilisis, hendrerit ante ac, fringilla ligula. Integer vel lorem in velit fringilla finibus sed sed justo. Maecenas augue justo, rutrum a risus sit amet, fringilla luctus enim. Cras interdum venenatis tincidunt.', '2023-11-15 06:24:40', '2023-11-15 06:24:40', '2023-11-22 17:00:00'),
(10, 2, 'images/F8wLXMM26tzoVhQz.png', 'NextJS', 'nextjs', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id arcu imperdiet, elementum risus at, feugiat leo. Mauris sed velit a libero porta semper. Vivamus eu sapien ex. Ut venenatis arcu nulla, a imperdiet lectus dignissim eu. Fusce sit amet purus ullamcorper ipsum porttitor posuere. Vivamus vulputate quis metus at sollicitudin. Vestibulum consequat pharetra gravida. Nulla sed orci facilisis, hendrerit ante ac, fringilla ligula. Integer vel lorem in velit fringilla finibus sed sed justo. Maecenas augue justo, rutrum a risus sit amet, fringilla luctus enim. Cras interdum venenatis tincidunt.', '2023-11-15 06:24:56', '2023-11-15 06:24:56', NULL),
(11, 2, 'images/PbbnwBrnDoeNANyh.png', 'PHP', 'php', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id arcu imperdiet, elementum risus at, feugiat leo. Mauris sed velit a libero porta semper. Vivamus eu sapien ex. Ut venenatis arcu nulla, a imperdiet lectus dignissim eu. Fusce sit amet purus ullamcorper ipsum porttitor posuere. Vivamus vulputate quis metus at sollicitudin. Vestibulum consequat pharetra gravida. Nulla sed orci facilisis, hendrerit ante ac, fringilla ligula. Integer vel lorem in velit fringilla finibus sed sed justo. Maecenas augue justo, rutrum a risus sit amet, fringilla luctus enim. Cras interdum venenatis tincidunt.', '2023-11-15 06:25:07', '2023-11-15 06:25:07', NULL),
(12, 2, 'images/ioH22lQZyomI9Ric.png', 'Java', 'java', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id arcu imperdiet, elementum risus at, feugiat leo. Mauris sed velit a libero porta semper. Vivamus eu sapien ex. Ut venenatis arcu nulla, a imperdiet lectus dignissim eu. Fusce sit amet purus ullamcorper ipsum porttitor posuere. Vivamus vulputate quis metus at sollicitudin. Vestibulum consequat pharetra gravida. Nulla sed orci facilisis, hendrerit ante ac, fringilla ligula. Integer vel lorem in velit fringilla finibus sed sed justo. Maecenas augue justo, rutrum a risus sit amet, fringilla luctus enim. Cras interdum venenatis tincidunt.', '2023-11-15 06:25:22', '2023-11-15 06:25:22', NULL),
(13, 2, 'images/xcPn7V76ENBgStkt.png', 'General knowledge', 'general-knowledge', 0, NULL, '2023-11-15 06:26:10', '2023-11-16 09:44:23', '2023-11-22 17:00:00'),
(14, 2, 'images/YdiFcTJ5nMb54s5E.png', 'General knowledge 2', 'general-knowledge-2', 1, 'This is the second general knowledge survey.', '2023-11-15 06:26:28', '2023-11-16 09:00:22', '2023-12-29 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `survey_answers`
--

CREATE TABLE `survey_answers` (
  `id` bigint UNSIGNED NOT NULL,
  `survey_id` bigint UNSIGNED NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `survey_answers`
--

INSERT INTO `survey_answers` (`id`, `survey_id`, `start_date`, `end_date`) VALUES
(1, 2, '2023-11-16 00:33:49', '2023-11-16 00:33:49'),
(2, 2, '2023-11-16 00:34:58', '2023-11-16 00:34:58'),
(3, 14, '2023-11-16 09:03:12', '2023-11-16 09:03:12'),
(4, 14, '2023-11-16 09:12:59', '2023-11-16 09:12:59'),
(5, 14, '2023-11-16 09:14:23', '2023-11-16 09:14:23'),
(6, 1, '2023-11-16 23:54:28', '2023-11-16 23:54:28');

-- --------------------------------------------------------

--
-- Table structure for table `survey_questions`
--

CREATE TABLE `survey_questions` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `survey_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `survey_questions`
--

INSERT INTO `survey_questions` (`id`, `type`, `question`, `description`, `data`, `survey_id`, `created_at`, `updated_at`) VALUES
(4, 'radio', 'Question 1', NULL, '{\"options\":[{\"uuid\":\"310ead79-2da3-4a8c-82c2-8594bd35e3fb\",\"text\":\"Radio 1\"},{\"uuid\":\"88d1ec4a-a80d-42a2-b0e7-4142198d2a12\",\"text\":\"Radio 2\"},{\"uuid\":\"e64498e3-0785-4461-8af5-d56c3744791b\",\"text\":\"Radio 3\"}]}', 2, '2023-11-15 02:54:10', '2023-11-15 05:38:18'),
(5, 'textarea', 'Question 2', 'Lorem ipsum q2', '[]', 2, '2023-11-15 02:54:10', '2023-11-15 04:22:25'),
(6, 'select', 'Question 3', NULL, '{\"options\":[{\"uuid\":\"174fa4fe-fbcb-4e6f-85c3-ca14fa6fa0f8\",\"text\":\"Select 1\"},{\"uuid\":\"b0b86408-22db-4229-a539-4f4a939d87c5\",\"text\":\"Select 2\"},{\"uuid\":\"bb521a06-f23e-47ed-9dac-aedd03c72319\",\"text\":\"Select 3\"}]}', 2, '2023-11-15 02:54:10', '2023-11-15 04:22:25'),
(7, 'text', 'Question 4', 'lorem ipsum q4', '[]', 2, '2023-11-15 02:55:37', '2023-11-15 04:22:25'),
(8, 'checkbox', 'Question 5', 'lorem ipsum q5', '{\"options\":[{\"uuid\":\"5f505c86-5270-4e15-aab2-e1958fbf9071\",\"text\":\"Checkbox 1\"},{\"uuid\":\"63685e3a-cdc4-474a-9294-a7eb7218faa8\",\"text\":\"Checkbox 2\"},{\"uuid\":\"d1d03606-4c01-48e1-8bb3-bedfa93351f0\",\"text\":\"Checkbox 3\"}]}', 2, '2023-11-15 03:30:49', '2023-11-15 05:39:30'),
(9, 'radio', 'Question 6', NULL, '{\"options\":[{\"uuid\":\"95b123cb-8ba3-46ba-aa4b-17df32c8efed\",\"text\":\"R-1\"},{\"uuid\":\"25c442ed-ea10-483e-98ba-b042854bf39e\",\"text\":\"R-2\"},{\"uuid\":\"4376d311-379b-460c-8557-87e5915186bc\",\"text\":\"R-3\"}]}', 2, '2023-11-15 04:20:16', '2023-11-15 05:46:39'),
(16, 'select', 'From which country are you?', 'Its just good to get to know more about our candidates.', '{\"options\":[{\"uuid\":\"e47d16d5-90aa-440d-8d8a-454e6cc9b2c2\",\"text\":\"Vietnam\"},{\"uuid\":\"7e7ee8ff-7d1b-4824-ad08-5daa3eeb14c2\",\"text\":\"India\"},{\"uuid\":\"a2738d7b-2132-47b7-b76d-2363cff9ce96\",\"text\":\"Singapore\"},{\"uuid\":\"345f0448-f581-4509-8e58-514142d7f12a\",\"text\":\"Taiwan\"},{\"uuid\":\"d870f61b-a778-4c1a-a2a0-e881f494f2b6\",\"text\":\"Other\"}]}', 14, '2023-11-16 02:24:43', '2023-11-16 02:24:43'),
(17, 'checkbox', 'What programming language can you use?', 'A programming language is a formal language comprising a set of instructions that produce various kinds of output. These instructions can be used to create computer programs that implement specific algorithms and logical operations. <br/> There are numerous programming languages, each designed for specific purposes and with unique features.', '{\"options\":[{\"uuid\":\"1d04925a-7bfd-4d6a-b7ae-1462b59ace01\",\"text\":\"Java\"},{\"uuid\":\"b1e86c77-ca29-461e-b85d-d7fa2ce6034b\",\"text\":\"Javascript\"},{\"uuid\":\"13cddb85-e04e-43b0-852a-80f1f9004fb9\",\"text\":\"Typescript\"},{\"uuid\":\"d3820d03-66e6-4c24-8a8d-a4235cd927ed\",\"text\":\"PHP\"},{\"uuid\":\"0df9dc2c-0341-4b11-a89b-c1918605416e\",\"text\":\"C#\"},{\"uuid\":\"d38669f7-4f1c-47eb-8266-6f24fa8d1a18\",\"text\":\"C \\/ C++\"},{\"uuid\":\"10661f09-f5cc-40dc-a4e6-dfd56a822d7b\",\"text\":\"Other\"}]}', 14, '2023-11-16 02:24:43', '2023-11-16 02:24:43'),
(18, 'radio', 'What PHP framework you like the most?', 'PHP is a popular server-side scripting language used for web development. It is often utilized to create dynamic web pages and manage the content of websites. To streamline the process of web development, various PHP frameworks have been developed to provide structure, standardize workflows, and promote code reusability.', '{\"options\":[{\"uuid\":\"5c997311-08bf-4c6a-9f5f-e5e2e48053aa\",\"text\":\"Laravel\"},{\"uuid\":\"148a72a6-e67c-4e1c-83b6-0bd2870684e5\",\"text\":\"Yii\"},{\"uuid\":\"dc6c89e1-a774-4ab0-9f44-0dfd5fb739ec\",\"text\":\"Zend\"},{\"uuid\":\"63b027e6-0bc7-4910-afae-ff35ba494439\",\"text\":\"CakePHP\"},{\"uuid\":\"b3b71533-b20f-4b40-ba54-0b246b3210ed\",\"text\":\"Codeigniter\"},{\"uuid\":\"330067be-6d54-4461-bec2-cac193ca1e69\",\"text\":\"Symfony\"},{\"uuid\":\"b4b72f1f-6ef6-4a97-8aa3-38198aadde94\",\"text\":\"Other\"}]}', 14, '2023-11-16 02:24:43', '2023-11-16 02:24:43'),
(19, 'text', 'What is your favorite phrase about web development?', 'These is multiple phrase in web development, so which is your favorite one?', '[]', 14, '2023-11-16 02:24:43', '2023-11-16 02:24:43'),
(20, 'text', 'What do you think about the job opportunity in the future of web developer?', 'Just write down your honest opinion...', '[]', 14, '2023-11-16 02:24:43', '2023-11-16 02:24:43'),
(21, 'radio', 'What is the main purpose of the \'data\' instance in a Vue component?', NULL, '{\"options\":[{\"uuid\":\"c4b59437-99e0-4c7c-989c-af2255f674c6\",\"text\":\"To define methods for the component\"},{\"uuid\":\"2e448947-809f-4696-a303-5deb2185e5ee\",\"text\":\"To handle user interactions\"},{\"uuid\":\"3071ec91-a0a1-41df-a8bd-968d42b95f96\",\"text\":\"To define computed properties\"},{\"uuid\":\"b0c6fbc5-6e37-4cec-b8e7-824ecf324d9a\",\"text\":\"To define variables\"}]}', 1, '2023-11-16 23:40:51', '2023-11-16 23:50:45'),
(22, 'radio', 'How do you define a computed property in Vue', NULL, '{\"options\":[{\"uuid\":\"0af6d02b-4e69-480a-bca4-6a86821416f1\",\"text\":\"As a variable inside the \'computed\' instance\"},{\"uuid\":\"8c8ee11c-9d7c-436d-a72c-5e38b0e20200\",\"text\":\"As a method inside the \'computed\'  instance\"},{\"uuid\":\"1c346e2b-e654-4428-8c1a-c206ff8c7e2a\",\"text\":\"As a variable inside the \'methods\' instance\"},{\"uuid\":\"0f6ad0ff-03b2-4e3f-ba5e-06f5a671ab5a\",\"text\":\"As a method inside the \'methods\' instance\"}]}', 1, '2023-11-16 23:40:51', '2023-11-16 23:49:04'),
(23, 'radio', 'Which Vue directive is used to conditionally display an element?', NULL, '{\"options\":[{\"uuid\":\"86e611f5-e901-430f-b272-aaf395ec55e0\",\"text\":\"v-model\"},{\"uuid\":\"ddd58931-0caf-4c75-b496-9fe35c2979f0\",\"text\":\"v-bind\"},{\"uuid\":\"afa88f0f-3fd0-4e71-8538-f8d0486db28e\",\"text\":\"v-show\"},{\"uuid\":\"d2f61a8d-99ba-4adc-8354-3ad0c009b637\",\"text\":\"v-for\"}]}', 1, '2023-11-16 23:45:30', '2023-11-16 23:45:30'),
(24, 'radio', 'Which language is Vue written in?', NULL, '{\"options\":[{\"uuid\":\"ca1edc98-4cf8-481c-8dd4-94bd9f1e22e0\",\"text\":\"Javascript\"},{\"uuid\":\"4739b620-50da-4584-a6e2-5487db41e005\",\"text\":\"Python\"},{\"uuid\":\"b07a2419-9d1d-45b6-a868-6db3806a9f1f\",\"text\":\"C++\"},{\"uuid\":\"22fa58e6-0296-4dbd-92a0-f86081a2909d\",\"text\":\"C\"}]}', 1, '2023-11-16 23:45:30', '2023-11-16 23:49:04'),
(25, 'radio', 'Which Vue directive is used for list rendering?', NULL, '{\"options\":[{\"uuid\":\"7cfa75b2-1810-4c22-8643-b4882cd26b06\",\"text\":\"v-show\"},{\"uuid\":\"eed78ede-76b5-4ba3-af9b-106b806ac523\",\"text\":\"v-for\"},{\"uuid\":\"3b7f83de-88b7-4273-b1c6-e57aa24aa163\",\"text\":\"v-bind\"},{\"uuid\":\"c8e0e1e7-c60c-4fb1-9719-067e1cb2d47e\",\"text\":\"v-if\"}]}', 1, '2023-11-16 23:45:30', '2023-11-16 23:45:30'),
(26, 'textarea', 'What do you think about the component-driven coding style of Vuejs?', NULL, '[]', 1, '2023-11-16 23:45:30', '2023-11-16 23:45:30'),
(27, 'text', 'What do you think about this quick survey/quiz?', NULL, '[]', 1, '2023-11-16 23:45:30', '2023-11-16 23:45:30');

-- --------------------------------------------------------

--
-- Table structure for table `survey_question_answers`
--

CREATE TABLE `survey_question_answers` (
  `id` bigint UNSIGNED NOT NULL,
  `survey_question_id` bigint UNSIGNED NOT NULL,
  `survey_answer_id` bigint UNSIGNED NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `survey_question_answers`
--

INSERT INTO `survey_question_answers` (`id`, `survey_question_id`, `survey_answer_id`, `answer`, `created_at`, `updated_at`) VALUES
(19, 4, 1, 'Radio 1', '2023-11-16 00:33:49', '2023-11-16 00:33:49'),
(20, 5, 1, 'Test survey answer 1 q2', '2023-11-16 00:33:49', '2023-11-16 00:33:49'),
(21, 6, 1, 'Select 1', '2023-11-16 00:33:49', '2023-11-16 00:33:49'),
(22, 7, 1, 'Test survey answer 1 q4', '2023-11-16 00:33:49', '2023-11-16 00:33:49'),
(23, 8, 1, '[\"Checkbox 1\",\"Checkbox 2\"]', '2023-11-16 00:33:49', '2023-11-16 00:33:49'),
(24, 9, 1, 'R-1', '2023-11-16 00:33:49', '2023-11-16 00:33:49'),
(25, 4, 2, 'Radio 2', '2023-11-16 00:34:58', '2023-11-16 00:34:58'),
(26, 5, 2, 'Test survey answer 2 q2', '2023-11-16 00:34:58', '2023-11-16 00:34:58'),
(27, 6, 2, 'Select 2', '2023-11-16 00:34:58', '2023-11-16 00:34:58'),
(28, 7, 2, 'Test survey answer 2 q4', '2023-11-16 00:34:58', '2023-11-16 00:34:58'),
(29, 8, 2, '[\"Checkbox 2\",\"Checkbox 3\"]', '2023-11-16 00:34:58', '2023-11-16 00:34:58'),
(30, 9, 2, 'R-2', '2023-11-16 00:34:58', '2023-11-16 00:34:58'),
(31, 16, 3, 'Vietnam', '2023-11-16 09:03:12', '2023-11-16 09:03:12'),
(32, 17, 3, '[\"Java\",\"Javascript\",\"Typescript\",\"PHP\"]', '2023-11-16 09:03:12', '2023-11-16 09:03:12'),
(33, 18, 3, 'Laravel', '2023-11-16 09:03:12', '2023-11-16 09:03:12'),
(34, 19, 3, 'Work with business logic and designing UI', '2023-11-16 09:03:12', '2023-11-16 09:03:12'),
(35, 20, 3, 'For me personally, i think it gonna be hard for freshman/newbie to get a job, since it already hard enough for those with many YOEs.', '2023-11-16 09:03:12', '2023-11-16 09:03:12'),
(36, 16, 4, 'India', '2023-11-16 09:12:59', '2023-11-16 09:12:59'),
(37, 17, 4, '[\"C \\/ C++\",\"C#\",\"Typescript\",\"Javascript\",\"Java\",\"PHP\",\"Other\"]', '2023-11-16 09:12:59', '2023-11-16 09:12:59'),
(38, 18, 4, 'Codeigniter', '2023-11-16 09:12:59', '2023-11-16 09:12:59'),
(39, 19, 4, 'All phrases', '2023-11-16 09:12:59', '2023-11-16 09:12:59'),
(40, 20, 4, 'It depend on who take this survey :))', '2023-11-16 09:12:59', '2023-11-16 09:12:59'),
(41, 16, 5, 'Singapore', '2023-11-16 09:14:23', '2023-11-16 09:14:23'),
(42, 17, 5, '[\"C \\/ C++\",\"C#\"]', '2023-11-16 09:14:23', '2023-11-16 09:14:23'),
(43, 18, 5, 'Zend', '2023-11-16 09:14:23', '2023-11-16 09:14:23'),
(44, 19, 5, 'Designing UI', '2023-11-16 09:14:23', '2023-11-16 09:14:23'),
(45, 20, 5, 'Its gonna be hard to get a DECENT job', '2023-11-16 09:14:23', '2023-11-16 09:14:23'),
(46, 21, 6, 'To define variables', '2023-11-16 23:54:28', '2023-11-16 23:54:28'),
(47, 22, 6, 'As a method inside the \'computed\'  instance', '2023-11-16 23:54:28', '2023-11-16 23:54:28'),
(48, 23, 6, 'v-show', '2023-11-16 23:54:28', '2023-11-16 23:54:28'),
(49, 24, 6, 'Javascript', '2023-11-16 23:54:28', '2023-11-16 23:54:28'),
(50, 25, 6, 'v-for', '2023-11-16 23:54:28', '2023-11-16 23:54:28'),
(51, 26, 6, 'Good for me that i already have the experience with Reactjs which is another frontend framework with the same coding style. So overall, i can adapt to Vue pretty quickly.', '2023-11-16 23:54:28', '2023-11-16 23:54:28'),
(52, 27, 6, 'Good', '2023-11-16 23:54:28', '2023-11-16 23:54:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Tuan Loc', 'loc@gmail.com', NULL, '$2y$10$0rChoyUcVmGJPk/UNxCRZu70yCh6JnY0Yo5seZPF9SHMPO1gpW2ea', 'uf9wznU24zds6aQboa3cGWmvtrvS2ZJRot8LFetVE8hk6huoU7K8TMWpzkt6', '2023-11-13 06:39:20', '2023-11-13 06:39:20'),
(2, 'Tester 1', 'testerone@gmail.com', NULL, '$2y$10$M/chjZf7Cc/hHGaguPLzj.yMfRcs7Lasf6m9ZnXCcNIq8cuY3W3o6', 'Ud47NSz6t7NMKk1nHu9Ob434kqUTuvOxE2zT3Ru2bJyenQxUWulwW71i9Gw5', '2023-11-13 07:03:31', '2023-11-13 07:03:31'),
(3, 'Tester 2', 'testertwo@gmail.com', NULL, '$2y$10$86lQftjViINkMcQWSdoGBuTLzqb9GWIZDP8GPOGOzVup2LVfdRDou', NULL, '2023-11-16 07:35:37', '2023-11-16 07:35:37');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `surveys`
--
ALTER TABLE `surveys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_answers`
--
ALTER TABLE `survey_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_questions`
--
ALTER TABLE `survey_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_question_answers`
--
ALTER TABLE `survey_question_answers`
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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `surveys`
--
ALTER TABLE `surveys`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `survey_answers`
--
ALTER TABLE `survey_answers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `survey_questions`
--
ALTER TABLE `survey_questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `survey_question_answers`
--
ALTER TABLE `survey_question_answers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
