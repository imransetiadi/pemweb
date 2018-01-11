-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 06, 2018 at 05:00 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id4181147_db_tiketpesawat`
--

-- --------------------------------------------------------

--
-- Table structure for table `tabel_pegawai`
--

CREATE TABLE `tabel_pegawai` (
  `no_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `alamat_pegawai` text NOT NULL,
  `telepon` int(14) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `tmp_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `umur_pegawai` int(100) NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_pegawai`
--

INSERT INTO `tabel_pegawai` (`no_pegawai`, `nama_pegawai`, `alamat_pegawai`, `telepon`, `jenis_kelamin`, `tmp_lahir`, `tgl_lahir`, `umur_pegawai`, `foto`) VALUES
(1213123, 'ucup', 'london', 2147483647, 'Pria', 'london', '2007-02-18', 9, 'youtube.png'),
(1234312, 'jekson', 'brazil', 0, '26', '31412415124', '0000-00-00', 1990, '1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_konsumen`
--

CREATE TABLE `tbl_konsumen` (
  `no_identitas` int(11) NOT NULL,
  `nama_konsumen` varchar(100) NOT NULL,
  `almt_konsumen` text NOT NULL,
  `telepon` int(14) NOT NULL,
  `umur` int(100) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `tmp_lahir` varchar(50) NOT NULL,
  `tgl_lahir` datetime NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_konsumen`
--

INSERT INTO `tbl_konsumen` (`no_identitas`, `nama_konsumen`, `almt_konsumen`, `telepon`, `umur`, `jenis_kelamin`, `tmp_lahir`, `tgl_lahir`, `foto`) VALUES
(1, 'imran', 'imrans', 8, 19, 'Pria', 'gak tau', '0000-00-00 00:00:00', 'bro.jpg'),
(2, 'ayam', 'bearat', 99, 25, 'Pria', 'france', '1991-02-03 00:00:00', 'RazerChroma.png'),
(3, 'harlika', 'kp baru', 8, 25, 'Wanita', 'lampung', '0000-00-00 00:00:00', 'youtube.png'),
(4, 'haqi', 'unjungkulon', 2147483647, 9, 'Pria', 'lampung', '2007-12-16 00:00:00', 'lalu1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pembayaran`
--

CREATE TABLE `tbl_pembayaran` (
  `no_pembayaran` int(20) NOT NULL,
  `no_tiket` int(11) NOT NULL,
  `tgl_pembayaran` date NOT NULL,
  `hari_pembayaran` text NOT NULL,
  `jumlah_tiket` int(100) NOT NULL,
  `harga_tiket` text NOT NULL,
  `total_pembayaran` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pembayaran`
--

INSERT INTO `tbl_pembayaran` (`no_pembayaran`, `no_tiket`, `tgl_pembayaran`, `hari_pembayaran`, `jumlah_tiket`, `harga_tiket`, `total_pembayaran`) VALUES
(1, 123, '1997-02-03', 'Senin', 2, '1000000', '2000000'),
(2, 9999, '2018-01-20', 'Sabtu', 9, '3000000', '27000000'),
(3, 1231, '2018-01-03', 'Selasa', 6, '2000000', '12000000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tiket`
--

CREATE TABLE `tbl_tiket` (
  `no_konsumen` int(20) NOT NULL,
  `no_tiket` int(20) NOT NULL,
  `tgl_berangkat` date NOT NULL,
  `hari_berangkat` text NOT NULL,
  `waktu_berangkat` time NOT NULL,
  `no_tujuan` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tiket`
--

INSERT INTO `tbl_tiket` (`no_konsumen`, `no_tiket`, `tgl_berangkat`, `hari_berangkat`, `waktu_berangkat`, `no_tujuan`) VALUES
(3, 123, '1997-12-12', 'Rabu', '02:04:00', 1),
(1, 1231, '2018-01-16', 'Sabtu', '01:00:00', 1),
(4, 9999, '2018-01-10', 'Rabu', '01:59:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tujuan`
--

CREATE TABLE `tbl_tujuan` (
  `no_tujuan` int(50) NOT NULL,
  `kota_tujuan` text NOT NULL,
  `no_tiket` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tujuan`
--

INSERT INTO `tbl_tujuan` (`no_tujuan`, `kota_tujuan`, `no_tiket`) VALUES
(2, 'bekasi', 1231),
(3, 'jawa', 9999),
(999, 'kol', 123);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_pemesanan`
--

CREATE TABLE `transaksi_pemesanan` (
  `kode_pembayaran` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `kode_reservasi` int(11) DEFAULT NULL,
  `total_pembayaran` float NOT NULL,
  `tgl_pembayaran` date NOT NULL,
  `tgl_keberangkatan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabel_pegawai`
--
ALTER TABLE `tabel_pegawai`
  ADD PRIMARY KEY (`no_pegawai`);

--
-- Indexes for table `tbl_konsumen`
--
ALTER TABLE `tbl_konsumen`
  ADD PRIMARY KEY (`no_identitas`);

--
-- Indexes for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD PRIMARY KEY (`no_pembayaran`),
  ADD KEY `no_tiket` (`no_tiket`);

--
-- Indexes for table `tbl_tiket`
--
ALTER TABLE `tbl_tiket`
  ADD PRIMARY KEY (`no_tiket`),
  ADD KEY `no_konsumen` (`no_konsumen`);

--
-- Indexes for table `tbl_tujuan`
--
ALTER TABLE `tbl_tujuan`
  ADD PRIMARY KEY (`no_tujuan`);

--
-- Indexes for table `transaksi_pemesanan`
--
ALTER TABLE `transaksi_pemesanan`
  ADD PRIMARY KEY (`kode_pembayaran`),
  ADD KEY `FK_membayar` (`kode_reservasi`),
  ADD KEY `FK_verifikasi` (`admin_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_konsumen`
--
ALTER TABLE `tbl_konsumen`
  MODIFY `no_identitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  MODIFY `no_pembayaran` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD CONSTRAINT `tbl_pembayaran_ibfk_1` FOREIGN KEY (`no_tiket`) REFERENCES `tbl_tiket` (`no_tiket`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_tiket`
--
ALTER TABLE `tbl_tiket`
  ADD CONSTRAINT `tbl_tiket_ibfk_1` FOREIGN KEY (`no_konsumen`) REFERENCES `tbl_konsumen` (`no_identitas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi_pemesanan`
--
ALTER TABLE `transaksi_pemesanan`
  ADD CONSTRAINT `FK_membayar` FOREIGN KEY (`kode_reservasi`) REFERENCES `reservasi` (`kode_reservasi`),
  ADD CONSTRAINT `FK_verifikasi` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
