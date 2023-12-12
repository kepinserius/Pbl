-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Des 2023 pada 11.46
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobnew`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `NIP` int(25) NOT NULL,
  `username` int(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokumenprestasi`
--

CREATE TABLE `dokumenprestasi` (
  `id_dokumen` int(11) NOT NULL,
  `id_prestasi` int(255) NOT NULL,
  `dokumen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `NIP` int(25) NOT NULL,
  `username` int(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` int(25) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `prodi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `username`, `password`, `Nama`, `prodi`) VALUES
(123123, 'asdasd', 'asdasd', '', 'qweqwe'),
(123456, 'asdasd', 'asd', 'qweqwe', 'qweqwe'),
(321321, '321321', 'asdasd', 'zxczxc', 'zxczxc');

-- --------------------------------------------------------

--
-- Struktur dari tabel `prestasi`
--

CREATE TABLE `prestasi` (
  `id_prestasi` int(11) NOT NULL,
  `nama_prestasi` varchar(255) NOT NULL,
  `jenis_prestasi` varchar(255) NOT NULL,
  `thn_prestasi` int(255) NOT NULL,
  `dokumen` varchar(255) NOT NULL,
  `mahasiswa` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `prestasi`
--

INSERT INTO `prestasi` (`id_prestasi`, `nama_prestasi`, `jenis_prestasi`, `thn_prestasi`, `dokumen`, `mahasiswa`) VALUES
(11, 'Basket', 'Non-Akademik', 2023, 'image-1702377495782.jpg', 123123),
(12, 'Voli', 'Non-Akademik', 2021, 'image-1702377635866.jpg', 123456);

-- --------------------------------------------------------

--
-- Struktur dari tabel `superadmin`
--

CREATE TABLE `superadmin` (
  `NIP` int(25) NOT NULL,
  `username` int(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`NIP`);

--
-- Indeks untuk tabel `dokumenprestasi`
--
ALTER TABLE `dokumenprestasi`
  ADD PRIMARY KEY (`id_dokumen`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`NIP`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indeks untuk tabel `prestasi`
--
ALTER TABLE `prestasi`
  ADD PRIMARY KEY (`id_prestasi`),
  ADD KEY `mahasiswa` (`mahasiswa`);

--
-- Indeks untuk tabel `superadmin`
--
ALTER TABLE `superadmin`
  ADD PRIMARY KEY (`NIP`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dokumenprestasi`
--
ALTER TABLE `dokumenprestasi`
  MODIFY `id_dokumen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `prestasi`
--
ALTER TABLE `prestasi`
  MODIFY `id_prestasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `prestasi`
--
ALTER TABLE `prestasi`
  ADD CONSTRAINT `prestasi_ibfk_1` FOREIGN KEY (`mahasiswa`) REFERENCES `mahasiswa` (`NIM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
