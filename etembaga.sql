-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2020 at 12:48 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `etembaga`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_administrator`
--

CREATE TABLE `tb_administrator` (
  `id_admin` varchar(30) NOT NULL,
  `nama_admin` varchar(50) NOT NULL,
  `username_admin` varchar(30) NOT NULL,
  `pass_admin` varchar(30) NOT NULL,
  `notlp_admin` int(15) NOT NULL,
  `email_admin` varchar(50) NOT NULL,
  `alamat_admin` text NOT NULL,
  `kodepos_admin` int(10) NOT NULL,
  `kota_admin` text NOT NULL,
  `prov_admin` text NOT NULL,
  `noktp_admin` int(30) NOT NULL,
  `role` enum('admin','pemilik') NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_administrator`
--

INSERT INTO `tb_administrator` (`id_admin`, `nama_admin`, `username_admin`, `pass_admin`, `notlp_admin`, `email_admin`, `alamat_admin`, `kodepos_admin`, `kota_admin`, `prov_admin`, `noktp_admin`, `role`) VALUES
('1', 'Admin', 'admin', 'admin', 21, 'admin@gmail.com', '-', 910, '-', 'Jakarta', 91292002, 'admin'),
('2', 'Pemilik ', 'pemilik', 'pemilik', 21819189, 'pemilik@gmail.com', '-', 14350, '-', '-', 2333, 'pemilik'),
('4', 'helen', 'helen', 'helen', 12389, 'helen@gmail.com', 'BAKSARI', 1, 'boyolali', 'jawa tengah', 1234567, '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang_masuk`
--

CREATE TABLE `tb_barang_masuk` (
  `id` int(11) NOT NULL,
  `id_produk` varchar(30) NOT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang_masuk`
--

INSERT INTO `tb_barang_masuk` (`id`, `id_produk`, `tgl_masuk`, `jumlah`) VALUES
(7, 'PRD-0002', '2019-09-01', 2),
(8, 'PRD-0001', '2019-09-03', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tb_biayakirim`
--

CREATE TABLE `tb_biayakirim` (
  `id_ongkir` varchar(30) NOT NULL,
  `kota_kirim` text NOT NULL,
  `biaya` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_biayakirim`
--

INSERT INTO `tb_biayakirim` (`id_ongkir`, `kota_kirim`, `biaya`) VALUES
('BYK-0001', 'Indrmayu', 400000),
('BYK-0002', 'Cirebon', 385000),
('BYK-0003', 'Solo', 125000),
('BYK-0004', 'Magelang', 150000),
('BYK-0005', 'Jogjakarta', 185000),
('BYK-0006', 'Klaten', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` varchar(30) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `stok` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`id_kategori`, `nama_kategori`, `stok`) VALUES
('KTG-0001', 'Pajangan rumah', NULL),
('KTG-0002', 'Hiasan Dinding', NULL),
('KTG-0003', 'Figura ', NULL),
('KTG-0004', 'Lampu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kurir`
--

CREATE TABLE `tb_kurir` (
  `id_kurir` varchar(30) NOT NULL,
  `nama_kurir` varchar(50) NOT NULL,
  `notlp_kurir` int(15) NOT NULL,
  `username_kurir` varchar(30) DEFAULT NULL,
  `pass_kurir` varchar(30) DEFAULT NULL,
  `alamat_kurir` text DEFAULT NULL,
  `jeniskel_kurir` char(15) NOT NULL,
  `noktp_kurir` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kurir`
--

INSERT INTO `tb_kurir` (`id_kurir`, `nama_kurir`, `notlp_kurir`, `username_kurir`, `pass_kurir`, `alamat_kurir`, `jeniskel_kurir`, `noktp_kurir`) VALUES
('1233', 'Bambang', 1221321, 'qq', 'qq', 'cfddf', 'Laki Laki', 121),
('KUR-1234', 'Agus', 22121, '123', '123', 'saas', '', 11212),
('KUR-1235', 'Khadafi', 2147483647, 'khadafi99', '123456', 'Jl. Kemanggisan No 5T, Boyolali', 'Laki Laki', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` varchar(30) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `username_pelanggan` varchar(50) NOT NULL,
  `pass_pelanggan` varchar(50) NOT NULL,
  `alamat_pelanggan` varchar(1000) NOT NULL,
  `kodepos_pel` int(10) NOT NULL,
  `kotapel` text NOT NULL,
  `provpel` varchar(20) NOT NULL,
  `email` varchar(250) NOT NULL,
  `notlp_pel` int(13) NOT NULL,
  `tgl_daftar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `username_pelanggan`, `pass_pelanggan`, `alamat_pelanggan`, `kodepos_pel`, `kotapel`, `provpel`, `email`, `notlp_pel`, `tgl_daftar`) VALUES
('', '', '', '', '', 0, '', '0', '', 0, NULL),
('CUS-0001', 'Nanda', 'username', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'address', 0, '', '', 'email', 2147483647, NULL),
('PEL_001', '', '', '', '', 0, '', '0', '', 0, NULL),
('PEL_002', 'nanda', 'nanda', 'nanda', 'ds baksari', 1, 'boyolali', '1', 'roudhatulnandilia2@gmail.com', 231231, '2019-09-07');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `id_pembayaran` varchar(30) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `jam_bayar` time NOT NULL,
  `jumlah_bayar` int(11) DEFAULT 0,
  `id_pesanan` varchar(30) NOT NULL,
  `norek_pembeli` varchar(30) NOT NULL,
  `status` enum('on_checking','Approved','Reject') NOT NULL DEFAULT 'on_checking'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pembayaran`
--

INSERT INTO `tb_pembayaran` (`id_pembayaran`, `tgl_bayar`, `jam_bayar`, `jumlah_bayar`, `id_pesanan`, `norek_pembeli`, `status`) VALUES
('BYR-0001', '2019-09-03', '12:00:00', 1400, '', '', 'on_checking'),
('BYR-0002', '0000-00-00', '11:11:00', 890000, 'INV-0010', '', 'on_checking'),
('BYR-0007', '2019-10-03', '00:00:10', 15120000, 'INV-0018', 'zksbej', 'on_checking'),
('INV-0003', '0000-00-00', '00:00:09', 4000, 'INV-0015', '17273718', 'on_checking'),
('INV-0004', '0000-00-00', '00:00:09', 100, 'INV-0016', '26372919', 'on_checking'),
('INV-0005', '0000-00-00', '00:00:09', 100, 'INV-0016', '26372919', 'on_checking'),
('INV-0006', '0000-00-00', '00:00:09', 100, 'INV-0017', '145794', 'on_checking');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pemesanan`
--

CREATE TABLE `tb_pemesanan` (
  `id_pesanan` varchar(30) NOT NULL,
  `tgl_pesanan` date NOT NULL,
  `total_harga` double NOT NULL,
  `penerima` varchar(50) NOT NULL,
  `alamat_penerima` text DEFAULT NULL,
  `id_pengiriman` varchar(30) DEFAULT NULL,
  `id_ongkir` varchar(30) DEFAULT NULL,
  `id_pembayaran` varchar(30) DEFAULT NULL,
  `id_pelanggan` varchar(30) DEFAULT NULL,
  `id_kurir` varchar(30) DEFAULT NULL,
  `status` enum('draft','confirm','on_process','delivered','cancel') DEFAULT 'draft'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pemesanan`
--

INSERT INTO `tb_pemesanan` (`id_pesanan`, `tgl_pesanan`, `total_harga`, `penerima`, `alamat_penerima`, `id_pengiriman`, `id_ongkir`, `id_pembayaran`, `id_pelanggan`, `id_kurir`, `status`) VALUES
('INV-0011', '2019-09-03', 1400, 'Mas Boy', 'Jl. jalan jalan', '', 'BYK-0001', NULL, NULL, '1233', 'delivered'),
('INV-0012', '0000-00-00', 4000, 'username', 'Jl. Delima Barat Blok S No.3, RT.14/RW.3Kota Jakarta SelatanDaerah Khusus Ibukota Jakarta12440', NULL, NULL, NULL, 'CUS-0001', NULL, 'draft'),
('INV-0013', '0000-00-00', 6000, 'username', 'Jl. Delima Barat Blok S No.3, RT.14/RW.3Kota Jakarta SelatanDaerah Khusus Ibukota Jakarta12440', NULL, NULL, NULL, 'CUS-0001', NULL, 'draft'),
('INV-0014', '0000-00-00', 2000, 'username', 'Jl. Delima Barat Blok S No.3, RT.14/RW.3Kota Jakarta SelatanDaerah Khusus Ibukota Jakarta12440', NULL, NULL, NULL, 'CUS-0001', NULL, 'draft'),
('INV-0015', '0000-00-00', 4000, 'username', 'jsdndb djdjd xjdjd 383892', NULL, NULL, NULL, 'CUS-0001', NULL, 'draft'),
('INV-0016', '0000-00-00', 100, 'username', 'Jl. Delima Barat Blok S No.3, RT.14/RW.3Kota Jakarta SelatanDaerah Khusus Ibukota Jakarta12440', NULL, NULL, NULL, 'CUS-0001', NULL, 'draft'),
('INV-0017', '0000-00-00', 100, 'usernamey', 'Jl. Delima Barat Blok S No.3, RT.14/RW.3Kota Jakarta SelatanDaerah Khusus Ibukota Jakarta12440', NULL, NULL, NULL, 'CUS-0001', NULL, 'draft'),
('INV-0018', '0000-00-00', 15120000, 'nanda', 'dndn dmdmd djjdd djdjd', NULL, NULL, NULL, 'PEL_002', NULL, 'draft');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pemesanandetail`
--

CREATE TABLE `tb_pemesanandetail` (
  `id_detailpesanan` int(11) NOT NULL,
  `jumlah` double NOT NULL,
  `id_pesanan` varchar(30) NOT NULL,
  `subtotal` int(100) NOT NULL,
  `id_produk` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pemesanandetail`
--

INSERT INTO `tb_pemesanandetail` (`id_detailpesanan`, `jumlah`, `id_pesanan`, `subtotal`, `id_produk`) VALUES
(19, 2, 'INV-0011', 200, 'PRD-0001'),
(20, 2, 'INV-0011', 200, 'PRD-0001'),
(21, 2, 'INV-0012', 4000, 'PRD-0002'),
(22, 3, 'INV-0013', 6000, 'PRD-0002'),
(23, 1, 'INV-0014', 2000, 'PRD-0002'),
(24, 2, 'INV-0015', 4000, 'PRD-0002'),
(25, 1, 'INV-0016', 100, 'PRD-0001'),
(26, 1, 'INV-0017', 100, 'PRD-0001'),
(27, 2, 'INV-0018', 15120000, 'PRD-0001');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengiriman`
--

CREATE TABLE `tb_pengiriman` (
  `id_pengiriman` varchar(30) NOT NULL,
  `id_kurir` varchar(30) NOT NULL,
  `status` enum('on_process','delivered') DEFAULT 'on_process',
  `id_pesanan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengiriman`
--

INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_kurir`, `status`, `id_pesanan`) VALUES
('KRM-0001', '1233', 'delivered', 'INV-0011'),
('KRM-0002', '1233', 'on_process', 'INV-0012'),
('KRM-0003', '1233', 'on_process', 'INV-0013'),
('KRM-0004', '1233', 'on_process', 'INV-0014'),
('KRM-0005', '1233', 'on_process', 'INV-0015'),
('KRM-0006', '1233', 'on_process', 'INV-0016'),
('KRM-0007', '1233', 'on_process', 'INV-0017'),
('KRM-0008', '1233', 'on_process', 'INV-0018');

-- --------------------------------------------------------

--
-- Table structure for table `tb_produk`
--

CREATE TABLE `tb_produk` (
  `id_produk` varchar(30) NOT NULL,
  `id_kategori` varchar(30) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `stok_produk` int(50) NOT NULL,
  `harga_produk` double NOT NULL,
  `des_produk` text NOT NULL,
  `terjual` int(50) NOT NULL,
  `size` varchar(10) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_produk`
--

INSERT INTO `tb_produk` (`id_produk`, `id_kategori`, `nama_produk`, `stok_produk`, `harga_produk`, `des_produk`, `terjual`, `size`, `photo`) VALUES
('PRD-0001', '', 'BATH UP', 2, 7560000, 'Bath Up yang indah dibuat dari kuningan terpilih sehingga kualitas tidak diragukan lagi', 8, '', 'image_1570050698.jpg'),
('PRD-0002', '', 'Vas Bunga', 2, 200000, 'Vas Bunga indah, 1 set ada 3 buah vas. Vas dengan desain elegan ini akan mempercantik meja ruang tamu, ruang berkumpul, dan tata ruang yang indah', 0, '', 'image_1570050666.jpg'),
('PRD-0003', '', 'Hiasan Garuda', 0, 500000, 'Figura Garuda yang gagah terbuat dari tembaga pilihan akan memperindah tata ruang dan untuk kualitas tidak diragukan ', 0, '', 'image_1570050951.jpg'),
('PRD-0004', '', 'Lampu Hias', 0, 2500000, 'Lampu hias, 1 set nya terdapat dua buah lampu cantik ini cocok untuk dipasang pada dinding ruangan Anda. Produk ini terbuat dari tembaga pilihan', 0, '', 'image_1570051070.jpg'),
('PRD-0005', '', 'Teko dan 6 gelas', 0, 1850000, 'Teko dan Gelas cantik ini siapmenemani waktu kebersamaan dengan keluarga. desain yang elegan menambah kenyamanan menikmati waktu bersama. Untuk Kualitas sudah tidak diragukanlagi karena terbuat dari bahan-bahan tembaga pilihan', 0, '', 'image_1570051217.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `telepon`
--

CREATE TABLE `telepon` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `nomor` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `telepon`
--

INSERT INTO `telepon` (`id`, `nama`, `nomor`) VALUES
(1, 'Mas', '02198989'),
(2, 'Boy', '0127878');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_administrator`
--
ALTER TABLE `tb_administrator`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_barang_masuk`
--
ALTER TABLE `tb_barang_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_biayakirim`
--
ALTER TABLE `tb_biayakirim`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tb_kurir`
--
ALTER TABLE `tb_kurir`
  ADD PRIMARY KEY (`id_kurir`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `tb_pemesanan`
--
ALTER TABLE `tb_pemesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_kurir` (`id_kurir`) USING BTREE;

--
-- Indexes for table `tb_pemesanandetail`
--
ALTER TABLE `tb_pemesanandetail`
  ADD PRIMARY KEY (`id_detailpesanan`);

--
-- Indexes for table `tb_pengiriman`
--
ALTER TABLE `tb_pengiriman`
  ADD PRIMARY KEY (`id_pengiriman`);

--
-- Indexes for table `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `telepon`
--
ALTER TABLE `telepon`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang_masuk`
--
ALTER TABLE `tb_barang_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_pemesanandetail`
--
ALTER TABLE `tb_pemesanandetail`
  MODIFY `id_detailpesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `telepon`
--
ALTER TABLE `telepon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_pemesanan`
--
ALTER TABLE `tb_pemesanan`
  ADD CONSTRAINT `tb_pemesanan_ibfk_1` FOREIGN KEY (`id_kurir`) REFERENCES `tb_kurir` (`id_kurir`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
