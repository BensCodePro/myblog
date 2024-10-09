-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-06-2024 a las 03:36:44
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `myblog_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `disabled` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `category`, `slug`, `disabled`) VALUES
(7, 'Noticias 2', 'noticias', 0),
(8, 'Comunidad', 'comunidad', 0),
(9, 'Blog', 'blog', 0),
(10, 'Eventos', 'eventos', 0),
(11, 'Convivencia', 'convivencia', 0),
(13, 'Redes cor', 'redes', 0),
(14, 'redes', 'redes6091', 0),
(15, 'IT team', 'it-team', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(1024) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `content`, `image`, `date`, `slug`) VALUES
(9, 5, 3, 'videos', '<p><iframe frameborder=\"0\" src=\"//www.youtube.com/embed/4AoRVc89rBs?start=19785\" width=\"640\" height=\"360\" class=\"note-video-clip\"></iframe><br></p>', 'uploads/1714874200tech_girl.jpg', '2024-05-04 21:56:40', 'videos'),
(10, 5, 11, 'Noticias uno', '<p style=\"text-align: center; \">Noticias de la comunidad...</p>', 'uploads/1714958151tecno.jpg', '2024-05-05 21:15:51', 'noticias-uno'),
(11, 5, 8, 'Noticias Dos', '<ul><li style=\"text-align: center; \">Nuestras noticias dos</li></ul>', 'uploads/1714958214notebooks.jpg', '2024-05-05 21:16:54', 'noticias-dos'),
(12, 5, 8, 'Noticias Tres', '<ul><li style=\"text-align: center; \">Nuestras noticias dos</li></ul>', 'uploads/1714958214notebooks.jpg', '2024-05-05 21:16:54', 'noticias-dos5605'),
(13, 5, 9, 'Noticias Cuatro', '<p>Nuestros estudiantes...</p>', 'uploads/1714958358tech_girl.jpg', '2024-05-05 21:19:18', 'noticias-cuatro'),
(15, 5, 14, 'Noticias de hoy', '<ul><li style=\"text-align: center; \">Últimas noticias</li></ul>', 'uploads/1715779330fachada _Liceoisaura.jpg', '2024-05-15 09:22:10', 'noticias-de-hoy'),
(16, 5, 8, 'Web', '<p>msmsmmsmsmsmsmsm</p>', 'uploads/1716512616fachada _Liceoisaura.jpg', '2024-05-23 21:03:36', 'web');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(1024) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `image`, `date`, `role`) VALUES
(5, 'Benjude', 'benjudepremier10@gmail.com', '$2y$10$B3MKlB0onKwD85MRC1atEO0YwG8EhMvtrc1X0yqDcBzgr7O7NihGq', '', '2024-04-21 22:15:29', 'user'),
(13, 'Estherbb', 'Estherbb@gmail.com', '$2y$10$KkON6EBYTU8nY3QpJ3EBPupX2r.xvg7MPW.fBKbrn./PP9Ghj0Jvy', '', '2024-04-27 17:39:48', 'user'),
(14, 'Lauture', 'lauturejs@gmail.com', '$2y$10$lz1NsbaGYnSqq/iq892n2.R5NNx7ldiIbGAZtBD3ZYoHEukt8mE3W', '', '2024-05-04 10:19:47', 'user'),
(15, 'Benjude', 'benjudepremier22@gmail.com', '$2y$10$/QU5fFFF8C5xWCsakUVQP.97a4l/3rhVrhA2Oz6xpwlZ7O7nHVWSy', '', '2024-05-05 21:31:54', 'admin'),
(16, 'Mauricio', 'mfuentesv@demstgo.cl', '$2y$10$Wvdb2ehm7ZEYPMSkv4a9bufq2K9kyYuEaDQpnLkB5eqcJO2ZqEmKm', '', '2024-05-05 21:35:18', 'admin'),
(19, 'Juan', 'juanpablo@gmail.com', '$2y$10$ILSbN.aiPQEOmvw.zciHkeJjwmJmXArcpVm7F4h2yUpggIZbwZ.4u', '', '2024-05-08 23:02:00', 'admin'),
(20, 'Daniel', 'danie@demstgo.lc', '$2y$10$KgodUzxRgL95HQdNxdBe5uzGxRHSuMGxlEAffgyGaowq9ZToMflw6', '', '2024-05-15 09:16:57', 'user'),
(21, 'Alan', 'alnffffs@gmail.com', '$2y$10$c.WLiWGbYX6wLJFBPJQ5Ce.Fw38.tAShbNOpNHdTke2o56BnTbTSy', '', '2024-05-23 21:01:32', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`),
  ADD KEY `category` (`category`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `title` (`title`),
  ADD KEY `slug` (`slug`),
  ADD KEY `content` (`content`(768));

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
