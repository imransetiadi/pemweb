-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2017 at 05:27 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tiketpesawat`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `account_name` varchar(30) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `nomor_hp` int(11) DEFAULT NULL,
  `alamat` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `tempat_lahir` varchar(30) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `account_name` varchar(30) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `nomor_hp` int(11) DEFAULT NULL,
  `alamat` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `tempat_lahir` varchar(30) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `kode_reservasi` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `tgl_keberangkatan` date NOT NULL,
  `harga_tiket` float NOT NULL,
  `kelas_tiket` varchar(30) NOT NULL,
  `tujuan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'imran', 'imran', 8, 19, 'Pria', 'gak tau', '1997-10-15 00:00:00', 'adi pantai.jpg'),
(3, 'harlika', 'kp baru', 8, 25, 'Pria', 'lampung', '1991-01-01 00:00:00', '3.PNG');

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket` (
  `nomor_tiket` int(11) NOT NULL,
  `kode_pembayaran` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`kode_reservasi`),
  ADD KEY `FK_melakukan` (`customer_id`);

--
-- Indexes for table `tbl_konsumen`
--
ALTER TABLE `tbl_konsumen`
  ADD PRIMARY KEY (`no_identitas`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`nomor_tiket`),
  ADD KEY `FK_mencetak` (`kode_pembayaran`);

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
  MODIFY `no_identitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `FK_melakukan` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `tiket`
--
ALTER TABLE `tiket`
  ADD CONSTRAINT `FK_mencetak` FOREIGN KEY (`kode_pembayaran`) REFERENCES `transaksi_pemesanan` (`kode_pembayaran`);

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
