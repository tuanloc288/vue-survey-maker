-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2023 at 08:52 AM
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
(1, 2, 'images/JAn4qPXyBbiPhXI7.png', 'VueJS 3', 'vuejs-3', 1, 'Vue is a front-end JavaScript framework written in JavaScript. <br/> Similar frameworks to Vue are React and Angular, but Vue is more lightweight and easier to start with. <br/> Vue is distributed as a JavaScript file, and can be added to a web page with a script tag:', '2023-11-15 00:38:36', '2023-11-30 22:36:46', '2023-12-29 17:00:00'),
(2, 2, 'images/95BWoWV3iwYBmLRu.png', 'Laravel 10', 'laravel-10', 1, 'Laravel is a web application framework with expressive, elegant syntax. A web framework provides a structure and starting point for creating your application, allowing you to focus on creating something amazing while we sweat the details. <br/> Laravel strives to provide an amazing developer experience while providing powerful features such as thorough dependency injection, an expressive database abstraction layer, queues and scheduled jobs, unit and integration testing, and more. <br/> Whether you are new to PHP web frameworks or have years of experience, Laravel is a framework that can grow with you. We\'ll help you take your first steps as a web developer or give you a boost as you take your expertise to the next level. We can\'t wait to see what you build.', '2023-11-15 02:54:10', '2023-11-30 22:36:33', '2023-12-29 17:00:00'),
(3, 2, 'images/7Hm24JmHE3kXMhMv.png', 'TailwindCSS', 'tailwindcss', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu convallis erat, sit amet porttitor mauris. Nulla viverra rutrum nulla, vel ullamcorper nibh accumsan nec. Nullam vitae est eget turpis congue condimentum sit amet et dui. Sed fermentum et purus ut euismod. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu convallis erat, sit amet porttitor mauris. Nulla viverra rutrum nulla, vel ullamcorper nibh accumsan nec. Nullam vitae est eget turpis congue condimentum sit amet et dui. Sed fermentum et purus ut euismod. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu convallis erat, sit amet porttitor mauris. Nulla viverra rutrum nulla, vel ullamcorper nibh accumsan nec. Nullam vitae est eget turpis congue condimentum sit amet et dui. Sed fermentum et purus ut euismod. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu convallis erat, sit amet porttitor mauris. Nulla viverra rutrum nulla, vel ullamcorper nibh accumsan nec. Nullam vitae est eget turpis congue condimentum sit amet et dui. Sed fermentum et purus ut euismod.', '2023-11-15 06:03:17', '2023-11-25 04:44:31', '2023-11-29 17:00:00'),
(4, 2, 'images/8xfX8okNDnaWtoTi.png', 'CakePHP', 'cakephp', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu convallis erat, sit amet porttitor mauris. Nulla viverra rutrum nulla, vel ullamcorper nibh accumsan nec. Nullam vitae est eget turpis congue condimentum sit amet et dui. Sed fermentum et purus ut euismod.', '2023-11-15 06:07:11', '2023-11-15 06:07:25', NULL),
(5, 2, 'images/xwCuvNGUPoAtj838.png', 'CodeIgniter', 'codeigniter', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu convallis erat, sit amet porttitor mauris. Nulla viverra rutrum nulla, vel ullamcorper nibh accumsan nec. Nullam vitae est eget turpis congue condimentum sit amet et dui. Sed fermentum et purus ut euismod.', '2023-11-15 06:08:55', '2023-11-15 06:09:57', NULL),
(6, 2, 'images/tZtjXBW9nlbGCwVb.png', 'Yii', 'yii', 1, NULL, '2023-11-15 06:09:26', '2023-11-17 00:42:41', '2023-11-22 17:00:00'),
(7, 2, 'images/Wz2gDk1F815gT982.png', 'Symfony', 'symfony', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu convallis erat, sit amet porttitor mauris. Nulla viverra rutrum nulla, vel ullamcorper nibh accumsan nec. Nullam vitae est eget turpis congue condimentum sit amet et dui. Sed fermentum et purus ut euismod.', '2023-11-15 06:09:38', '2023-11-15 06:10:08', NULL),
(8, 2, 'images/bReZqQMvm25TNSKG.png', 'Zend', 'zend', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eu convallis erat, sit amet porttitor mauris. Nulla viverra rutrum nulla, vel ullamcorper nibh accumsan nec. Nullam vitae est eget turpis congue condimentum sit amet et dui. Sed fermentum et purus ut euismod.', '2023-11-15 06:10:27', '2023-11-15 06:10:27', NULL),
(9, 2, 'images/VWis1hYDuuwAsuWa.png', 'ReactJS', 'reactjs', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id arcu imperdiet, elementum risus at, feugiat leo. Mauris sed velit a libero porta semper. Vivamus eu sapien ex. Ut venenatis arcu nulla, a imperdiet lectus dignissim eu. Fusce sit amet purus ullamcorper ipsum porttitor posuere. Vivamus vulputate quis metus at sollicitudin. Vestibulum consequat pharetra gravida. Nulla sed orci facilisis, hendrerit ante ac, fringilla ligula. Integer vel lorem in velit fringilla finibus sed sed justo. Maecenas augue justo, rutrum a risus sit amet, fringilla luctus enim. Cras interdum venenatis tincidunt.', '2023-11-15 06:24:40', '2023-11-15 06:24:40', '2023-11-22 17:00:00'),
(10, 2, 'images/F8wLXMM26tzoVhQz.png', 'NextJS', 'nextjs', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id arcu imperdiet, elementum risus at, feugiat leo. Mauris sed velit a libero porta semper. Vivamus eu sapien ex. Ut venenatis arcu nulla, a imperdiet lectus dignissim eu. Fusce sit amet purus ullamcorper ipsum porttitor posuere. Vivamus vulputate quis metus at sollicitudin. Vestibulum consequat pharetra gravida. Nulla sed orci facilisis, hendrerit ante ac, fringilla ligula. Integer vel lorem in velit fringilla finibus sed sed justo. Maecenas augue justo, rutrum a risus sit amet, fringilla luctus enim. Cras interdum venenatis tincidunt.', '2023-11-15 06:24:56', '2023-11-15 06:24:56', NULL),
(11, 2, 'images/PbbnwBrnDoeNANyh.png', 'PHP', 'php', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id arcu imperdiet, elementum risus at, feugiat leo. Mauris sed velit a libero porta semper. Vivamus eu sapien ex. Ut venenatis arcu nulla, a imperdiet lectus dignissim eu. Fusce sit amet purus ullamcorper ipsum porttitor posuere. Vivamus vulputate quis metus at sollicitudin. Vestibulum consequat pharetra gravida. Nulla sed orci facilisis, hendrerit ante ac, fringilla ligula. Integer vel lorem in velit fringilla finibus sed sed justo. Maecenas augue justo, rutrum a risus sit amet, fringilla luctus enim. Cras interdum venenatis tincidunt.', '2023-11-15 06:25:07', '2023-11-15 06:25:07', NULL),
(12, 2, 'images/ioH22lQZyomI9Ric.png', 'Java', 'java', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id arcu imperdiet, elementum risus at, feugiat leo. Mauris sed velit a libero porta semper. Vivamus eu sapien ex. Ut venenatis arcu nulla, a imperdiet lectus dignissim eu. Fusce sit amet purus ullamcorper ipsum porttitor posuere. Vivamus vulputate quis metus at sollicitudin. Vestibulum consequat pharetra gravida. Nulla sed orci facilisis, hendrerit ante ac, fringilla ligula. Integer vel lorem in velit fringilla finibus sed sed justo. Maecenas augue justo, rutrum a risus sit amet, fringilla luctus enim. Cras interdum venenatis tincidunt.', '2023-11-15 06:25:22', '2023-11-15 06:25:22', NULL),
(13, 2, 'images/xcPn7V76ENBgStkt.png', 'General knowledge', 'general-knowledge', 0, NULL, '2023-11-15 06:26:10', '2023-11-16 09:44:23', '2023-11-22 17:00:00'),
(14, 2, 'images/YdiFcTJ5nMb54s5E.png', 'General knowledge 2', 'general-knowledge-2', 1, 'This is the second general knowledge survey.', '2023-11-15 06:26:28', '2023-11-22 02:48:18', '2023-12-29 17:00:00'),
(15, 1, 'images/2YFzop7gFpqGQ9O3.png', 'Test survey on another account', 'test-survey-on-another-account', 1, NULL, '2023-11-24 02:25:32', '2023-11-25 04:56:47', '2023-12-31 17:00:00'),
(16, 3, NULL, 'test 30/11', 'test-3011', 1, NULL, '2023-11-30 02:50:50', '2023-11-30 02:51:51', '2023-12-01 17:00:00'),
(17, 2, 'images/pgOowCCxY4bK7FIh.png', 'Sample survey 1', 'sample-survey-1', 1, NULL, '2023-11-30 07:19:22', '2023-12-01 00:51:12', '2023-12-29 17:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `surveys`
--
ALTER TABLE `surveys`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `surveys`
--
ALTER TABLE `surveys`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
