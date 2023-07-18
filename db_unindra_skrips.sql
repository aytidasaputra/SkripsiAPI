-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2023 at 06:10 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_unindra_skrips`
--

-- --------------------------------------------------------

--
-- Table structure for table `kondisi_rumah`
--

CREATE TABLE `kondisi_rumah` (
  `luas_lantai` varchar(30) NOT NULL,
  `id` int(11) NOT NULL,
  `jenis_lantai` varchar(30) NOT NULL,
  `jenis_dinding` varchar(30) NOT NULL,
  `fasilitas_wc` varchar(30) NOT NULL,
  `sum_air_minum` varchar(20) NOT NULL,
  `bahan_bakar_masak` varchar(30) NOT NULL,
  `jumlah_makan` varchar(30) NOT NULL,
  `biaya_pengobatan` varchar(20) NOT NULL,
  `aset_jual` varchar(20) NOT NULL,
  `nik` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan`
--

CREATE TABLE `pengajuan` (
  `id` int(11) NOT NULL,
  `user` varchar(16) NOT NULL,
  `kd_user` varchar(16) NOT NULL,
  `rt` varchar(10) NOT NULL,
  `rw` varchar(10) NOT NULL,
  `deskripsi` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL,
  `tanggal_pengajuan` datetime NOT NULL,
  `no_pengajuan` varchar(30) NOT NULL,
  `nama_rt` varchar(50) NOT NULL,
  `nama_rw` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengajuan`
--

INSERT INTO `pengajuan` (`id`, `user`, `kd_user`, `rt`, `rw`, `deskripsi`, `status`, `tanggal_pengajuan`, `no_pengajuan`, `nama_rt`, `nama_rw`) VALUES
(1, 'Aditya', '3275021706980012', '05', '010', 'untuk keperluan pekerjaan', 'pending', '2023-07-03 07:38:48', '0', '', ''),
(2, '3275021706980012', 'Aditya', '05', '10', 'Pembuatan SKCK', 'pending', '0000-00-00 00:00:00', 'KTR202300072', '', ''),
(3, '3275021706980012', 'Aditya', '05', '10', 'Pembuatan SKCK', 'pending', '0000-00-00 00:00:00', 'KTR202300073', '', ''),
(4, '3275021706980012', 'Aditya', '05', '10', 'Pembuatan SKCK', 'pending', '2023-07-03 05:51:39', 'KTR202300074', '', ''),
(5, '3275021706980012', 'Aditya', '05', '10', 'Pembuatan SKCK', 'pending', '2023-07-03 06:07:26', 'KTR202300075', '', ''),
(6, 'Aditya', '3275021706980012', '05', '10', 'Pembuatan SKCK', 'pending', '2023-07-03 06:07:40', 'KTR202300076', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users_detail`
--

CREATE TABLE `users_detail` (
  `id` int(11) NOT NULL,
  `kd_users` varchar(16) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `rt` varchar(10) NOT NULL,
  `rw` varchar(10) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `foto` blob NOT NULL,
  `pendapatan` int(11) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `status_perkawinan` varchar(20) NOT NULL,
  `jumlah_anak` int(10) NOT NULL,
  `jenis_kelamin` varchar(2) NOT NULL,
  `tempat_lahir` varchar(15) NOT NULL,
  `agama` varchar(15) NOT NULL,
  `alamat_asal` varchar(50) NOT NULL,
  `tanggal_lahir` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_detail`
--

INSERT INTO `users_detail` (`id`, `kd_users`, `nama`, `rt`, `rw`, `alamat`, `foto`, `pendapatan`, `pekerjaan`, `status_perkawinan`, `jumlah_anak`, `jenis_kelamin`, `tempat_lahir`, `agama`, `alamat_asal`, `tanggal_lahir`) VALUES
(1, '3275021706980012', 'Yono', '05', '10', 'Bekasi', '', 1000000, 'buruh', 'M', 4, 'P', 'Bogor', 'Islam', 'Bogor', '1990-10-01');

-- --------------------------------------------------------

--
-- Table structure for table `users_login`
--

CREATE TABLE `users_login` (
  `nama` varchar(16) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` varchar(10) NOT NULL,
  `last_login` datetime NOT NULL,
  `id` int(11) NOT NULL,
  `email` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_login`
--

INSERT INTO `users_login` (`nama`, `nik`, `password`, `role`, `last_login`, `id`, `email`) VALUES
('Aditya', '3275021706980012', 'admin', 'admin', '2023-07-03 04:22:03', 1, 'aytidasaputra@gmail.com'),
('Dodot', '3275021706980011', 'admin', 'admin', '0000-00-00 00:00:00', 2, 'dadut@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kondisi_rumah`
--
ALTER TABLE `kondisi_rumah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengajuan`
--
ALTER TABLE `pengajuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_detail`
--
ALTER TABLE `users_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_login`
--
ALTER TABLE `users_login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kondisi_rumah`
--
ALTER TABLE `kondisi_rumah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengajuan`
--
ALTER TABLE `pengajuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users_detail`
--
ALTER TABLE `users_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_login`
--
ALTER TABLE `users_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
