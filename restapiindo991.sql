-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Bulan Mei 2022 pada 08.27
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restapiindo991`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftarfilmfavorits`
--

CREATE TABLE `daftarfilmfavorits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idfilm` bigint(20) UNSIGNED DEFAULT NULL,
  `iduser` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `films`
--

CREATE TABLE `films` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_film` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produksi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sinopsis` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_tayang` date NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `films`
--

INSERT INTO `films` (`id`, `judul`, `jenis_film`, `produksi`, `sinopsis`, `tanggal_tayang`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'KKN DESA PENARI', 'Horror', 'Fuji Film', 'Sekelompok mahasiswa kkn', '2022-05-28', 'kkn.jpg', '2022-05-28 06:39:01', '2022-05-28 06:39:01'),
(2, 'Dr.Strange', 'Superhero', 'Fuji Film', 'Seorang dukun yang mencoba menyelamatkan universe', '2022-05-28', 'Drstrange.jpg', '2022-05-28 07:14:47', '2022-05-28 07:14:47'),
(3, 'Hitman 2', 'Action', 'Fuji Film', 'Seorang tentara yang meninggalkan istri untuk berperang', '2022-05-28', 'hitman.jpg', '2022-05-28 07:15:35', '2022-05-28 07:15:35'),
(4, 'Sonic 2', 'Cartoon', 'Universe', 'Seekor landak yang mencoba menyelamatkan temannya', '2022-05-28', 'sonic.jpg', '2022-05-28 07:17:18', '2022-05-28 07:17:18'),
(5, 'Kuntilanak 2', 'Horor', 'Rans Entertaiment', 'Kuntilanak 3 berkisah tentang petualangan Dinda di Sekolah Mata Hati. Seusai pulang dari Ujung Sedo, Dinda merasa berbeda dari sebelumnya, seakan ada kekuatan di dalam dirinya yang terlepas tiap kali amarah menguasai.', '2022-05-30', 'kuntilanak.jpg', '2022-05-28 07:19:48', '2022-05-28 07:21:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_05_27_140911_create_films_table', 1),
(6, '2022_05_28_083606_add_role_to_users_table', 1),
(7, '2022_05_28_084711_add_username_to_users_table', 1),
(8, '2022_05_28_093904_create_daftarfilmfavorits_table', 1),
(9, '2022_05_28_143905_create_ratingfilms_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'API Token', '3c7e18900a2b9c06b3344b15c3c2ce1c7315c95c400af31bc16f72c9a905a388', '[\"*\"]', '2022-05-28 23:26:29', '2022-05-28 06:35:05', '2022-05-28 23:26:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ratingfilms`
--

CREATE TABLE `ratingfilms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idfilm` bigint(20) UNSIGNED DEFAULT NULL,
  `iduser` bigint(20) UNSIGNED DEFAULT NULL,
  `rating` enum('1','2','3','4','5') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ratingfilms`
--

INSERT INTO `ratingfilms` (`id`, `idfilm`, `iduser`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '5', '2022-05-28 07:49:27', '2022-05-28 07:49:27'),
(2, 2, 1, '4', '2022-05-28 07:51:08', '2022-05-28 07:51:08'),
(3, 3, 1, '4', '2022-05-28 07:51:52', '2022-05-28 07:51:52'),
(4, 4, 1, '4', '2022-05-28 07:52:37', '2022-05-28 07:52:37'),
(5, 5, 1, '4', '2022-05-28 07:54:03', '2022-05-28 07:54:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `username`) VALUES
(1, 'Tengku Adriantama', 'Tengku@mail.com', NULL, '$2y$10$eBejcfa0KMacNeKI.CEpfeFPfo1dfPUf3Fqvcxu1agI4Hjoh8kHO.', NULL, '2022-05-28 06:35:04', '2022-05-28 06:35:04', 'admin', 'Tengku');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `daftarfilmfavorits`
--
ALTER TABLE `daftarfilmfavorits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daftarfilmfavorits_idfilm_foreign` (`idfilm`),
  ADD KEY `daftarfilmfavorits_iduser_foreign` (`iduser`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `ratingfilms`
--
ALTER TABLE `ratingfilms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratingfilms_idfilm_foreign` (`idfilm`),
  ADD KEY `ratingfilms_iduser_foreign` (`iduser`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `daftarfilmfavorits`
--
ALTER TABLE `daftarfilmfavorits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `films`
--
ALTER TABLE `films`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `ratingfilms`
--
ALTER TABLE `ratingfilms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `daftarfilmfavorits`
--
ALTER TABLE `daftarfilmfavorits`
  ADD CONSTRAINT `daftarfilmfavorits_idfilm_foreign` FOREIGN KEY (`idfilm`) REFERENCES `films` (`id`),
  ADD CONSTRAINT `daftarfilmfavorits_iduser_foreign` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `ratingfilms`
--
ALTER TABLE `ratingfilms`
  ADD CONSTRAINT `ratingfilms_idfilm_foreign` FOREIGN KEY (`idfilm`) REFERENCES `films` (`id`),
  ADD CONSTRAINT `ratingfilms_iduser_foreign` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
