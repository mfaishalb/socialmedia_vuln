-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Agu 2025 pada 11.39
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social_media`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `comment`, `dateAdded`, `lastUpdated`) VALUES
(1, 2, 1, 'Mantap! Semangat bro!', '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(2, 3, 1, 'Gue juga lagi belajar nih.', '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(3, 1, 2, 'Setuju, cuacanya enak buat jalan.', '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(4, 5, 3, 'Ayo gas futsal!', '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(5, 4, 4, 'Film apa tuh?', '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(6, 2, 5, 'Wah Bali emang keren!', '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(7, 1, 7, 'HAHHAA', '2025-08-24 07:37:57', '2025-08-24 07:37:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `friends`
--

CREATE TABLE `friends` (
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `friends`
--

INSERT INTO `friends` (`user_id`, `friend_id`, `dateAdded`, `lastUpdated`) VALUES
(1, 3, '2025-08-24 07:29:16', '2025-08-24 07:29:16'),
(2, 3, '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(2, 4, '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(3, 5, '2025-08-24 07:04:59', '2025-08-24 07:04:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `likes`
--

CREATE TABLE `likes` (
  `post_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `likes`
--

INSERT INTO `likes` (`post_id`, `friend_id`, `dateAdded`, `lastUpdated`) VALUES
(1, 2, '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(1, 3, '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(2, 1, '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(3, 5, '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(4, 1, '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(5, 2, '2025-08-24 07:04:59', '2025-08-24 07:04:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post` varchar(500) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `post`, `image`, `dateAdded`, `lastUpdated`) VALUES
(1, 1, 'driving safe bro', 'images/1756018938LINE_ALBUM_hue_250823_1.jpg', '2025-08-24 07:02:18', '2025-08-24 07:02:18'),
(2, 1, 'Lagi belajar pentesting web!', '', '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(3, 2, 'Hari ini cuaca bagus banget.', '', '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(4, 3, 'Siapa yang mau main futsal weekend ini?', '', '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(5, 4, 'Baru selesai nonton film seru.', '', '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(6, 5, 'Lagi explore Bali, indah banget!', '', '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(7, 1, 'shit i felt depressed', 'images/1756020490Screenshot 2023-12-04 193030.png', '2025-08-24 07:28:10', '2025-08-24 07:28:10'),
(8, 2, 'GOTCHA', 'images/175602550220230926_093840.jpg', '2025-08-24 08:51:42', '2025-08-24 08:51:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dob` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `location` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `dob`, `location`, `education`, `image`, `dateAdded`, `lastUpdated`) VALUES
(1, 'faishal', 'faishal3025.rpl2@smkprestasiprima.sch.id', '0811104388', '$2y$10$t5ZG/tfjZfcYmd1tV1fc3u.U3.7z.zs7VTneOYCjgaprqQajItR6.', '2025-08-23 17:00:00', 'depok', 's1', 'images/1756018862ChatGPT Image 14 Agu 2025, 11.11.53.png', '2025-08-24 07:01:02', '2025-08-24 07:01:02'),
(2, 'Alice', 'alice@example.com', '0811111111', 'password123', '1998-12-31 17:00:00', 'Jakarta', 'Universitas A', '', '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(3, 'Bob', 'bob@example.com', '0822222222', 'password123', '2000-02-01 17:00:00', 'Bandung', 'Universitas B', '', '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(4, 'Charlie', 'charlie@example.com', '0833333333', 'password123', '1998-03-02 17:00:00', 'Surabaya', 'Universitas C', '', '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(5, 'Diana', 'diana@example.com', '0844444444', 'password123', '2001-04-03 17:00:00', 'Medan', 'Universitas D', '', '2025-08-24 07:04:59', '2025-08-24 07:04:59'),
(6, 'Evan', 'evan@example.com', '0855555555', 'password123', '1997-05-04 17:00:00', 'Bali', 'Universitas E', '', '2025-08-24 07:04:59', '2025-08-24 07:04:59');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indeks untuk tabel `friends`
--
ALTER TABLE `friends`
  ADD UNIQUE KEY `user_id` (`user_id`,`friend_id`),
  ADD KEY `friend_id` (`friend_id`);

--
-- Indeks untuk tabel `likes`
--
ALTER TABLE `likes`
  ADD UNIQUE KEY `post_id` (`post_id`,`friend_id`),
  ADD KEY `friend_id` (`friend_id`);

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Ketidakleluasaan untuk tabel `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
