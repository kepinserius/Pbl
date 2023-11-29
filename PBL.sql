-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 29, 2023 at 12:27 PM
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
-- Database: `PBL`
--

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `NIP` int(25) NOT NULL,
  `username` int(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dokumenPrestasi`
--

CREATE TABLE `dokumenPrestasi` (
  `id_dokumen` int(255) NOT NULL,
  `id_prestasi` int(255) NOT NULL,
  `dokumen` varchar(255) NOT NULL,
  `admin` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Dosen`
--

CREATE TABLE `Dosen` (
  `NIP` int(25) NOT NULL,
  `username` int(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Mahasiswa`
--

CREATE TABLE `Mahasiswa` (
  `NIM` int(25) NOT NULL,
  `username` int(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Prodi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Prestasi`
--

CREATE TABLE `Prestasi` (
  `id_prestasi` int(255) NOT NULL,
  `nama_prestasi` varchar(255) NOT NULL,
  `jenis_prestasi` varchar(255) NOT NULL,
  `thn_prestasi` int(255) NOT NULL,
  `mahasiswa` int(255) NOT NULL,
  `dosen` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `superAdmin`
--

CREATE TABLE `superAdmin` (
  `NIP` int(25) NOT NULL,
  `username` int(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`NIP`);

--
-- Indexes for table `dokumenPrestasi`
--
ALTER TABLE `dokumenPrestasi`
  ADD PRIMARY KEY (`id_dokumen`),
  ADD KEY `id_prestasi` (`id_prestasi`,`admin`),
  ADD KEY `admin` (`admin`);

--
-- Indexes for table `Dosen`
--
ALTER TABLE `Dosen`
  ADD PRIMARY KEY (`NIP`);

--
-- Indexes for table `Mahasiswa`
--
ALTER TABLE `Mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indexes for table `Prestasi`
--
ALTER TABLE `Prestasi`
  ADD PRIMARY KEY (`id_prestasi`),
  ADD KEY `mahasiswa` (`mahasiswa`,`dosen`),
  ADD KEY `dosen` (`dosen`);

--
-- Indexes for table `superAdmin`
--
ALTER TABLE `superAdmin`
  ADD PRIMARY KEY (`NIP`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokumenPrestasi`
--
ALTER TABLE `dokumenPrestasi`
  ADD CONSTRAINT `dokumenprestasi_ibfk_1` FOREIGN KEY (`admin`) REFERENCES `Admin` (`NIP`),
  ADD CONSTRAINT `dokumenprestasi_ibfk_2` FOREIGN KEY (`id_prestasi`) REFERENCES `Prestasi` (`id_prestasi`);

--
-- Constraints for table `Prestasi`
--
ALTER TABLE `Prestasi`
  ADD CONSTRAINT `prestasi_ibfk_1` FOREIGN KEY (`mahasiswa`) REFERENCES `Mahasiswa` (`NIM`),
  ADD CONSTRAINT `prestasi_ibfk_2` FOREIGN KEY (`dosen`) REFERENCES `Dosen` (`NIP`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
