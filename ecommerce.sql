-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2023 at 09:02 PM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `baohanh`
--

CREATE TABLE `baohanh` (
  `ma_bao_hanh` int NOT NULL,
  `ma_chi_tiet_san_pham` varchar(256) NOT NULL,
  `ma_khach_hang` varchar(256) NOT NULL,
  `ngay_lap` timestamp NULL DEFAULT NULL,
  `ngay_het_han` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `baohanh`
--

INSERT INTO `baohanh` (`ma_bao_hanh`, `ma_chi_tiet_san_pham`, `ma_khach_hang`, `ngay_lap`, `ngay_het_han`) VALUES
(10, '123131233', 'bttan', '2023-04-26 02:59:42', '2025-04-26 02:59:42'),
(11, '168110773010', 'bttan1', '2023-05-05 10:12:49', '2025-05-05 10:12:49'),
(12, '168242581415', 'bttan1', '2023-05-05 10:12:49', '2025-05-05 10:12:49'),
(13, '168248983214', 'bttan1', '2023-05-05 10:12:49', '2025-05-05 10:12:49'),
(14, '168249009615', 'bttan1', '2023-05-05 10:12:49', '2025-05-05 10:12:49');

-- --------------------------------------------------------

--
-- Table structure for table `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `ma_san_pham` int DEFAULT NULL,
  `ma_chi_tiet_san_pham` varchar(256) NOT NULL,
  `ma_don_hang` int NOT NULL,
  `don_gia` double DEFAULT NULL,
  `giam_gia_san_pham` int DEFAULT '0',
  `thoi_gian_bao_hanh` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`ma_san_pham`, `ma_chi_tiet_san_pham`, `ma_don_hang`, `don_gia`, `giam_gia_san_pham`, `thoi_gian_bao_hanh`) VALUES
(2, '12312', 158, 34848000, 10, 24),
(2, '123131233', 158, 34848000, 10, 24),
(2, '12323123', 160, 15290000, 17, 24),
(3, '1234321', 158, 33000000, 10, 24),
(3, '132123', 158, 33000000, 10, 24),
(1, '1680449329623', 157, 15840000, 10, 24),
(1, '16804493296231', 157, 15840000, 10, 24),
(1, '16804493296a', 159, 15840000, 10, 24),
(1, '16807669518', 159, 15840000, 10, 24),
(1, '16807672529', 161, 19679000, 0, 24),
(1, '168110773010', 162, 19679000, 0, 24),
(1, '168242581415', 162, 19679000, 0, 24),
(1, '168248983214', 162, 19679000, 0, 24),
(1, '168249009615', 162, 19679000, 0, 24),
(1, '168330430111', 163, 21646900, 0, 24);

-- --------------------------------------------------------

--
-- Table structure for table `chitietphieunhap`
--

CREATE TABLE `chitietphieunhap` (
  `ma_san_pham` int NOT NULL,
  `ma_phieu_nhap` int NOT NULL,
  `so_luong_nhap_hang` int DEFAULT NULL,
  `don_gia` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `chitietphieunhap`
--

INSERT INTO `chitietphieunhap` (`ma_san_pham`, `ma_phieu_nhap`, `so_luong_nhap_hang`, `don_gia`) VALUES
(1, 7, 10, 17890000),
(1, 8, 5, 19679000),
(1, 9, 5, 21646900),
(1, 11, 10, 21863369),
(1, 12, 10, 22082002.69),
(1, 13, 5, 22302822),
(1, 14, 5, 24533104),
(1, 15, 6, 26986414.4),
(1, 16, 10, 29685055),
(2, 7, 10, 15290000),
(2, 11, 10, 16819000),
(2, 16, 10, 16987190),
(3, 7, 10, 19490000),
(11, 10, 10, 32990000),
(13, 11, 10, 117790000),
(13, 16, 10, 118967900),
(14, 11, 10, 27490000),
(14, 16, 10, 27764900),
(23, 10, 10, 17230000),
(23, 11, 10, 18953000),
(23, 16, 10, 19142530),
(24, 11, 10, 17490000),
(24, 16, 10, 17664900),
(27, 10, 10, 22990000),
(27, 11, 10, 25289000),
(27, 16, 10, 25541890),
(28, 11, 10, 25690000),
(28, 16, 10, 25946900),
(31, 10, 10, 19679000),
(32, 11, 10, 16819000),
(32, 16, 10, 16987190),
(33, 11, 10, 21439000),
(33, 16, 10, 21653390),
(37, 10, 10, 12990000),
(37, 11, 10, 14289000),
(37, 16, 10, 14431890),
(38, 11, 10, 47490000),
(38, 16, 10, 47964900),
(42, 11, 10, 23790000),
(42, 16, 10, 24027900),
(43, 11, 10, 117790000),
(43, 16, 10, 118967900),
(46, 11, 10, 41990000),
(46, 16, 10, 42409900),
(47, 11, 10, 34790000),
(47, 16, 10, 35137900),
(48, 11, 10, 13499000),
(48, 16, 10, 13633990),
(49, 11, 10, 16990000),
(49, 16, 10, 17159900),
(50, 16, 10, 29490000);

-- --------------------------------------------------------

--
-- Table structure for table `chitietquyenhang`
--

CREATE TABLE `chitietquyenhang` (
  `ma_nhom_quyen` int NOT NULL,
  `ma_quyen_hang` int NOT NULL,
  `ma_chuc_nang` int NOT NULL,
  `trang_thai` tinyint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `chitietquyenhang`
--

INSERT INTO `chitietquyenhang` (`ma_nhom_quyen`, `ma_quyen_hang`, `ma_chuc_nang`, `trang_thai`) VALUES
(0, 1, 1, 0),
(0, 2, 1, 0),
(0, 2, 3, 0),
(0, 3, 1, 0),
(0, 3, 2, 0),
(0, 3, 3, 0),
(0, 3, 4, 0),
(0, 4, 1, 0),
(0, 4, 2, 0),
(0, 4, 3, 0),
(0, 4, 4, 0),
(0, 5, 1, 0),
(0, 5, 2, 0),
(0, 5, 3, 0),
(0, 5, 4, 0),
(0, 6, 1, 0),
(0, 6, 2, 1),
(0, 6, 3, 1),
(0, 6, 4, 0),
(0, 7, 1, 0),
(0, 7, 2, 0),
(0, 7, 3, 1),
(0, 7, 4, 0),
(0, 8, 1, 0),
(0, 8, 2, 0),
(0, 8, 3, 0),
(0, 8, 4, 0),
(0, 9, 1, 0),
(0, 9, 2, 0),
(0, 9, 3, 1),
(0, 9, 4, 0),
(0, 10, 1, 0),
(0, 10, 2, 0),
(0, 10, 3, 0),
(0, 10, 4, 0),
(0, 11, 1, 0),
(0, 11, 2, 0),
(0, 11, 4, 0),
(0, 12, 1, 0),
(0, 12, 2, 0),
(0, 12, 3, 0),
(0, 12, 4, 0),
(1, 1, 1, 1),
(1, 2, 1, 1),
(1, 2, 3, 1),
(1, 3, 1, 1),
(1, 3, 2, 1),
(1, 3, 3, 1),
(1, 3, 4, 1),
(1, 4, 1, 1),
(1, 4, 2, 1),
(1, 4, 3, 1),
(1, 4, 4, 1),
(1, 5, 1, 1),
(1, 5, 2, 1),
(1, 5, 3, 1),
(1, 5, 4, 1),
(1, 6, 1, 1),
(1, 6, 2, 1),
(1, 6, 3, 1),
(1, 6, 4, 1),
(1, 7, 1, 1),
(1, 7, 2, 1),
(1, 7, 3, 1),
(1, 7, 4, 1),
(1, 8, 1, 1),
(1, 8, 2, 1),
(1, 8, 3, 1),
(1, 8, 4, 1),
(1, 9, 1, 1),
(1, 9, 2, 1),
(1, 9, 3, 1),
(1, 9, 4, 1),
(1, 10, 1, 1),
(1, 10, 2, 1),
(1, 10, 3, 1),
(1, 10, 4, 1),
(1, 11, 1, 1),
(1, 11, 2, 1),
(1, 11, 4, 1),
(1, 12, 1, 1),
(1, 12, 2, 1),
(1, 12, 3, 1),
(1, 12, 4, 1),
(6, 1, 1, 0),
(6, 2, 1, 0),
(6, 2, 3, 0),
(6, 3, 1, 1),
(6, 3, 2, 1),
(6, 3, 3, 1),
(6, 3, 4, 1),
(6, 4, 1, 0),
(6, 4, 2, 0),
(6, 4, 3, 0),
(6, 4, 4, 0),
(6, 5, 1, 1),
(6, 5, 2, 1),
(6, 5, 3, 1),
(6, 5, 4, 1),
(6, 6, 1, 0),
(6, 6, 2, 0),
(6, 6, 3, 0),
(6, 6, 4, 0),
(6, 7, 1, 0),
(6, 7, 2, 0),
(6, 7, 3, 0),
(6, 7, 4, 0),
(6, 8, 1, 0),
(6, 8, 2, 0),
(6, 8, 3, 0),
(6, 8, 4, 0),
(6, 9, 1, 0),
(6, 9, 2, 0),
(6, 9, 3, 0),
(6, 9, 4, 0),
(6, 10, 1, 0),
(6, 10, 2, 0),
(6, 10, 3, 0),
(6, 10, 4, 0),
(6, 11, 1, 0),
(6, 11, 2, 0),
(6, 11, 4, 0),
(6, 12, 1, 0),
(6, 12, 2, 0),
(6, 12, 3, 0),
(6, 12, 4, 0),
(11, 1, 1, 0),
(11, 2, 1, 0),
(11, 2, 3, 0),
(11, 3, 1, 0),
(11, 3, 2, 0),
(11, 3, 3, 0),
(11, 3, 4, 0),
(11, 4, 1, 0),
(11, 4, 2, 0),
(11, 4, 3, 0),
(11, 4, 4, 0),
(11, 5, 1, 1),
(11, 5, 2, 1),
(11, 5, 3, 1),
(11, 5, 4, 1),
(11, 6, 1, 0),
(11, 6, 2, 0),
(11, 6, 3, 0),
(11, 6, 4, 0),
(11, 7, 1, 0),
(11, 7, 2, 0),
(11, 7, 3, 0),
(11, 7, 4, 0),
(11, 8, 1, 0),
(11, 8, 2, 0),
(11, 8, 3, 0),
(11, 8, 4, 0),
(11, 9, 1, 0),
(11, 9, 2, 0),
(11, 9, 3, 0),
(11, 9, 4, 0),
(11, 10, 1, 0),
(11, 10, 2, 0),
(11, 10, 3, 0),
(11, 10, 4, 0),
(11, 11, 1, 0),
(11, 11, 2, 0),
(11, 11, 4, 0),
(11, 12, 1, 0),
(11, 12, 2, 0),
(11, 12, 3, 0),
(11, 12, 4, 0),
(12, 1, 1, 0),
(12, 2, 1, 1),
(12, 2, 3, 0),
(12, 3, 1, 1),
(12, 3, 2, 0),
(12, 3, 3, 0),
(12, 3, 4, 0),
(12, 4, 1, 1),
(12, 4, 2, 0),
(12, 4, 3, 0),
(12, 4, 4, 0),
(12, 5, 1, 1),
(12, 5, 2, 0),
(12, 5, 3, 0),
(12, 5, 4, 0),
(12, 6, 1, 1),
(12, 6, 2, 0),
(12, 6, 3, 0),
(12, 6, 4, 0),
(12, 7, 1, 1),
(12, 7, 2, 0),
(12, 7, 3, 0),
(12, 7, 4, 0),
(12, 8, 1, 1),
(12, 8, 2, 0),
(12, 8, 3, 0),
(12, 8, 4, 0),
(12, 9, 1, 1),
(12, 9, 2, 0),
(12, 9, 3, 0),
(12, 9, 4, 0),
(12, 10, 1, 1),
(12, 10, 2, 0),
(12, 10, 3, 0),
(12, 10, 4, 0),
(12, 11, 1, 1),
(12, 11, 2, 0),
(12, 11, 4, 0),
(12, 12, 1, 0),
(12, 12, 2, 0),
(12, 12, 3, 0),
(12, 12, 4, 0),
(13, 1, 1, 0),
(13, 2, 1, 0),
(13, 2, 3, 0),
(13, 3, 1, 0),
(13, 3, 2, 0),
(13, 3, 3, 0),
(13, 3, 4, 0),
(13, 4, 1, 0),
(13, 4, 2, 0),
(13, 4, 3, 0),
(13, 4, 4, 0),
(13, 5, 1, 0),
(13, 5, 2, 0),
(13, 5, 3, 0),
(13, 5, 4, 0),
(13, 6, 1, 0),
(13, 6, 2, 0),
(13, 6, 3, 0),
(13, 6, 4, 0),
(13, 7, 1, 0),
(13, 7, 2, 0),
(13, 7, 3, 0),
(13, 7, 4, 0),
(13, 8, 1, 0),
(13, 8, 2, 0),
(13, 8, 3, 0),
(13, 8, 4, 0),
(13, 9, 1, 0),
(13, 9, 2, 0),
(13, 9, 3, 0),
(13, 9, 4, 0),
(13, 10, 1, 0),
(13, 10, 2, 0),
(13, 10, 3, 0),
(13, 10, 4, 0),
(13, 11, 1, 0),
(13, 11, 2, 0),
(13, 11, 4, 0),
(13, 12, 1, 0),
(13, 12, 2, 0),
(13, 12, 3, 0),
(13, 12, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chitietsanpham`
--

CREATE TABLE `chitietsanpham` (
  `ma_chi_tiet_san_pham` varchar(256) NOT NULL,
  `ma_san_pham` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `chitietsanpham`
--

INSERT INTO `chitietsanpham` (`ma_chi_tiet_san_pham`, `ma_san_pham`) VALUES
('168348280911', 1),
('1683482809131', 13),
('1683482809141', 14),
('168348280921', 2),
('1683482809231', 23),
('1683482809241', 24),
('1683482809271', 27),
('1683482809281', 28),
('1683482809321', 32),
('1683482809331', 33),
('1683482809371', 37),
('1683482809381', 38),
('1683482809421', 42),
('1683482809431', 43),
('1683482809461', 46),
('1683482809471', 47),
('1683482809481', 48),
('1683482809491', 49),
('168348306112', 1),
('168348319013', 1),
('168348327214', 1),
('168348331715', 1),
('1683483514110', 1),
('1683483514111', 1),
('1683483514112', 1),
('1683483514113', 1),
('1683483514114', 1),
('1683483514115', 1),
('16834835141310', 13),
('16834835141311', 13),
('1683483514132', 13),
('1683483514133', 13),
('1683483514134', 13),
('1683483514135', 13),
('1683483514136', 13),
('1683483514137', 13),
('1683483514138', 13),
('1683483514139', 13),
('16834835141410', 14),
('16834835141411', 14),
('1683483514142', 14),
('1683483514143', 14),
('1683483514144', 14),
('1683483514145', 14),
('1683483514146', 14),
('1683483514147', 14),
('1683483514148', 14),
('1683483514149', 14),
('168348351416', 1),
('168348351417', 1),
('168348351418', 1),
('168348351419', 1),
('1683483514210', 2),
('1683483514211', 2),
('168348351422', 2),
('168348351423', 2),
('16834835142310', 23),
('16834835142311', 23),
('1683483514232', 23),
('1683483514233', 23),
('1683483514234', 23),
('1683483514235', 23),
('1683483514236', 23),
('1683483514237', 23),
('1683483514238', 23),
('1683483514239', 23),
('168348351424', 2),
('16834835142410', 24),
('16834835142411', 24),
('1683483514242', 24),
('1683483514243', 24),
('1683483514244', 24),
('1683483514245', 24),
('1683483514246', 24),
('1683483514247', 24),
('1683483514248', 24),
('1683483514249', 24),
('168348351425', 2),
('168348351426', 2),
('168348351427', 2),
('16834835142710', 27),
('16834835142711', 27),
('1683483514272', 27),
('1683483514273', 27),
('1683483514274', 27),
('1683483514275', 27),
('1683483514276', 27),
('1683483514277', 27),
('1683483514278', 27),
('1683483514279', 27),
('168348351428', 2),
('16834835142810', 28),
('16834835142811', 28),
('1683483514282', 28),
('1683483514283', 28),
('1683483514284', 28),
('1683483514285', 28),
('1683483514286', 28),
('1683483514287', 28),
('1683483514288', 28),
('1683483514289', 28),
('168348351429', 2),
('16834835143210', 32),
('16834835143211', 32),
('1683483514322', 32),
('1683483514323', 32),
('1683483514324', 32),
('1683483514325', 32),
('1683483514326', 32),
('1683483514327', 32),
('1683483514328', 32),
('1683483514329', 32),
('16834835143310', 33),
('16834835143311', 33),
('1683483514332', 33),
('1683483514333', 33),
('1683483514334', 33),
('1683483514335', 33),
('1683483514336', 33),
('1683483514337', 33),
('1683483514338', 33),
('1683483514339', 33),
('16834835143710', 37),
('16834835143711', 37),
('1683483514372', 37),
('1683483514373', 37),
('1683483514374', 37),
('1683483514375', 37),
('1683483514376', 37),
('1683483514377', 37),
('1683483514378', 37),
('1683483514379', 37),
('16834835143810', 38),
('16834835143811', 38),
('1683483514382', 38),
('1683483514383', 38),
('1683483514384', 38),
('1683483514385', 38),
('1683483514386', 38),
('1683483514387', 38),
('1683483514388', 38),
('1683483514389', 38),
('16834835144210', 42),
('16834835144211', 42),
('1683483514422', 42),
('1683483514423', 42),
('1683483514424', 42),
('1683483514425', 42),
('1683483514426', 42),
('1683483514427', 42),
('1683483514428', 42),
('1683483514429', 42),
('16834835144310', 43),
('16834835144311', 43),
('1683483514432', 43),
('1683483514433', 43),
('1683483514434', 43),
('1683483514435', 43),
('1683483514436', 43),
('1683483514437', 43),
('1683483514438', 43),
('1683483514439', 43),
('16834835144610', 46),
('16834835144611', 46),
('1683483514462', 46),
('1683483514463', 46),
('1683483514464', 46),
('1683483514465', 46),
('1683483514466', 46),
('1683483514467', 46),
('1683483514468', 46),
('1683483514469', 46),
('16834835144710', 47),
('16834835144711', 47),
('1683483514472', 47),
('1683483514473', 47),
('1683483514474', 47),
('1683483514475', 47),
('1683483514476', 47),
('1683483514477', 47),
('1683483514478', 47),
('1683483514479', 47),
('16834835144810', 48),
('16834835144811', 48),
('1683483514482', 48),
('1683483514483', 48),
('1683483514484', 48),
('1683483514485', 48),
('1683483514486', 48),
('1683483514487', 48),
('1683483514488', 48),
('1683483514489', 48),
('16834835144910', 49),
('16834835144911', 49),
('1683483514492', 49),
('1683483514493', 49),
('1683483514494', 49),
('1683483514495', 49),
('1683483514496', 49),
('1683483514497', 49),
('1683483514498', 49),
('1683483514499', 49),
('1683483514501', 50),
('16834835145010', 50),
('1683483514502', 50),
('1683483514503', 50),
('1683483514504', 50),
('1683483514505', 50),
('1683483514506', 50),
('1683483514507', 50),
('1683483514508', 50),
('1683483514509', 50);

-- --------------------------------------------------------

--
-- Table structure for table `chucnang`
--

CREATE TABLE `chucnang` (
  `ma_chuc_nang` int NOT NULL,
  `ten_chuc_nang` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `chucnang`
--

INSERT INTO `chucnang` (`ma_chuc_nang`, `ten_chuc_nang`) VALUES
(1, 'READ'),
(2, 'CREATE'),
(3, 'UPDATE'),
(4, 'DELETE');

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `ma_don_hang` int NOT NULL,
  `ma_khach_hang` varchar(256) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ma_nhan_vien` varchar(256) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hinh_thuc_thanh_toan` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'Trả khi nhận hàng',
  `thoi_gian_dat_mua` timestamp NOT NULL,
  `trang_thai` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'Chờ xử lý',
  `hien_thi` tinyint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `donhang`
--

INSERT INTO `donhang` (`ma_don_hang`, `ma_khach_hang`, `ma_nhan_vien`, `hinh_thuc_thanh_toan`, `thoi_gian_dat_mua`, `trang_thai`, `hien_thi`) VALUES
(157, 'bttan', '', 'postpaid', '2023-04-13 03:51:02', 'đã hủy', 1),
(158, 'bttan', 'hung', 'postpaid', '2023-04-13 04:04:01', 'hoàn thành', 1),
(159, 'bttan', '', 'postpaid', '2023-04-25 07:30:36', 'đã hủy', 1),
(160, 'bttan', 'hung', 'postpaid', '2023-04-26 01:16:58', 'đã hủy', 1),
(161, 'bttan', NULL, 'prepaid', '2023-05-05 02:41:09', 'chờ xử lý', 1),
(162, 'bttan1', 'hung', 'postpaid', '2023-05-05 09:58:54', 'hoàn thành', 1),
(163, 'test', NULL, 'postpaid', '2023-05-07 02:17:51', 'chờ xử lý', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hinhanh`
--

CREATE TABLE `hinhanh` (
  `ma_hinh_anh` int NOT NULL,
  `filename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `hinhanh`
--

INSERT INTO `hinhanh` (`ma_hinh_anh`, `filename`) VALUES
(1, '1.jpg'),
(5, 'IMG_6803.JPG'),
(8, '2.jpg'),
(9, 'lenovo.webp'),
(11, '2.webp'),
(12, '3.webp'),
(13, '4.webp'),
(14, '1.webp'),
(67, 'pdf.png'),
(68, 'Mô hình BFD.jpg'),
(69, 'Mô hình BFD.jpg'),
(70, 'Mô hình BFD.jpg'),
(71, 'Mô hình BFD.jpg'),
(72, 'Mô hình BFD.jpg'),
(73, 'Mô hình BFD.jpg'),
(74, 'y.png'),
(75, 'x.png'),
(76, 'y.png'),
(77, 'x.png'),
(78, 'y.png'),
(79, 'x.png'),
(80, 'pdf.png'),
(81, 'import-excel.png'),
(82, 'y.png'),
(83, 'y.png'),
(84, '1wd7yj64l.png'),
(85, '1wd7yj64l.png'),
(86, 'cx.webp'),
(87, 'bx.webp'),
(88, 'ax.webp'),
(89, 'laptop-avita-a.jpg'),
(90, 'Avita Medical.svg'),
(91, 'ax.webp'),
(92, 'bx.webp'),
(93, 'cx.webp');

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `ma_khach_hang` varchar(256) NOT NULL,
  `ten_khach_hang` varchar(256) DEFAULT NULL,
  `ngay_sinh` datetime DEFAULT NULL,
  `gioi_tinh` tinyint DEFAULT NULL,
  `so_dien_thoai` varchar(45) NOT NULL,
  `dia_chi` varchar(256) DEFAULT NULL,
  `avatar` longtext,
  `hien_thi` tinyint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`ma_khach_hang`, `ten_khach_hang`, `ngay_sinh`, `gioi_tinh`, `so_dien_thoai`, `dia_chi`, `avatar`, `hien_thi`) VALUES
('bttan', '12312345123', '2023-03-01 01:00:00', 1, '0706092403', '123123', '1wd7yj64l.png', 1),
('bttan1', '123123', '2023-03-02 00:00:00', 1, '0706092404', '123123', 'avatar.jpg', 1),
('test', 'test1', '2003-01-03 01:00:00', 0, '0706092405', '1231231232', 'avatar.jpg', 1),
('test123', '123123', '0023-12-21 00:00:00', 0, '0707070707', '123123', 'avartar.jpg', 0),
('test2', '123123', '2023-05-04 00:00:00', 0, '123123', '123123', 'avartar.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `ma_nha_cung_cap` int NOT NULL,
  `ten_nha_cung_cap` varchar(256) DEFAULT NULL,
  `so_dien_thoai` varchar(45) DEFAULT NULL,
  `dia_chi` varchar(256) DEFAULT NULL,
  `hien_thi` tinyint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nhacungcap`
--

INSERT INTO `nhacungcap` (`ma_nha_cung_cap`, `ten_nha_cung_cap`, `so_dien_thoai`, `dia_chi`, `hien_thi`) VALUES
(1, 'Phong Vu', '0707007009', 'New York', 1),
(2, 'GearVN', '0890989090', 'Hồ Chí Minh', 1),
(3, 'Cellphone', '0709020432', 'CMT-8-1975', 1),
(4, 'An ', '0706092403', 'ha noi 1945', 1),
(5, '3123123', '0707070707', '123', 0);

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `ma_nhan_vien` varchar(256) NOT NULL,
  `ten_nhan_vien` varchar(256) DEFAULT NULL,
  `so_dien_thoai` varchar(45) DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `gioi_tinh` tinyint DEFAULT NULL,
  `muc_luong` bigint DEFAULT NULL,
  `hien_thi` tinyint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`ma_nhan_vien`, `ten_nhan_vien`, `so_dien_thoai`, `ngay_sinh`, `gioi_tinh`, `muc_luong`, `hien_thi`) VALUES
('hieu', '123123', '0706092403', '2023-04-04', 1, 100000000, 1),
('hung', 'bth2', '0706092403', '2003-03-01', 1, 20000000, 1),
('huy', 'Huy abc', '0706092403', '2023-04-01', 1, 1000000, 1),
('lam', 'lam ne', '0987654321', '2023-04-06', 1, 10000000, 1),
('tesst', '123213', '0706092033', '2023-05-04', 0, 20000000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nhomquyen`
--

CREATE TABLE `nhomquyen` (
  `ma_nhom_quyen` int NOT NULL,
  `ten_nhom_quyen` varchar(256) NOT NULL,
  `mo_ta` varchar(256) DEFAULT 'Không',
  `trang_thai` tinyint DEFAULT '1',
  `mac_dinh` tinyint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nhomquyen`
--

INSERT INTO `nhomquyen` (`ma_nhom_quyen`, `ten_nhom_quyen`, `mo_ta`, `trang_thai`, `mac_dinh`) VALUES
(0, 'khách hàng', 'mặc định', 1, 1),
(1, 'quản lý', 'trùmmm', 1, 0),
(6, 'nhân viên', 'test1', 1, 0),
(11, 'abc', '', 1, 0),
(12, 'superman', '', 1, 0),
(13, 'test1', '123', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phieunhap`
--

CREATE TABLE `phieunhap` (
  `ma_phieu_nhap` int NOT NULL,
  `ma_nha_cung_cap` int NOT NULL,
  `ma_nhan_vien` varchar(256) NOT NULL,
  `ngay_lap` timestamp NOT NULL,
  `ti_le_loi_nhuan` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `phieunhap`
--

INSERT INTO `phieunhap` (`ma_phieu_nhap`, `ma_nha_cung_cap`, `ma_nhan_vien`, `ngay_lap`, `ti_le_loi_nhuan`) VALUES
(7, 1, 'hung', '2023-04-26 01:21:35', NULL),
(8, 1, 'hung', '2023-05-05 11:31:41', NULL),
(9, 1, 'hung', '2023-05-07 11:20:53', 1),
(10, 2, 'hung', '2023-05-07 11:25:41', 10),
(11, 1, 'hung', '2023-05-07 13:06:48', 1),
(12, 1, 'hung', '2023-05-07 13:11:01', 1),
(13, 1, 'hung', '2023-05-07 13:13:10', 10),
(14, 2, 'hung', '2023-05-07 13:14:31', 10),
(15, 2, 'hung', '2023-05-07 13:15:17', 10),
(16, 1, 'hung', '2023-05-07 13:18:33', 20);

-- --------------------------------------------------------

--
-- Table structure for table `quyenhang`
--

CREATE TABLE `quyenhang` (
  `ma_quyen_hang` int NOT NULL,
  `ten_quyen_hang` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `quyenhang`
--

INSERT INTO `quyenhang` (`ma_quyen_hang`, `ten_quyen_hang`) VALUES
(1, 'statistics'),
(2, 'decentralization'),
(3, 'brands'),
(4, 'auth-groups'),
(5, 'products'),
(6, 'orders'),
(7, 'customers'),
(8, 'employees'),
(9, 'accounts'),
(10, 'import-orders'),
(11, 'guarantee'),
(12, 'suppliers');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `ma_san_pham` int NOT NULL,
  `ten_san_pham` varchar(512) NOT NULL,
  `hinh_anh` json NOT NULL,
  `bao_hanh` int NOT NULL,
  `gia_goc` double NOT NULL,
  `giam_gia` int DEFAULT NULL,
  `mo_ta_san_pham` longtext,
  `thuong_hieu` varchar(512) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `the_he_cpu` varchar(512) DEFAULT NULL,
  `cpu` varchar(512) DEFAULT NULL,
  `series_cpu` varchar(512) DEFAULT NULL,
  `chip_do_hoa_roi` varchar(512) DEFAULT NULL,
  `ten_ram` varchar(512) DEFAULT NULL,
  `man_hinh` varchar(512) DEFAULT NULL,
  `luu_tru` varchar(512) DEFAULT NULL,
  `so_cong_luu_tru_toi_da` varchar(512) DEFAULT NULL,
  `kieu_khe_m2_ho_tro` varchar(512) DEFAULT NULL,
  `cong_xuat_hinh` varchar(512) DEFAULT NULL,
  `cong_ket_noi` varchar(512) DEFAULT NULL,
  `ket_noi_khong_day` varchar(512) DEFAULT NULL,
  `ban_phim` varchar(512) DEFAULT NULL,
  `he_dieu_hanh` varchar(512) DEFAULT NULL,
  `kich_thuoc` varchar(512) DEFAULT NULL,
  `pin` varchar(512) DEFAULT NULL,
  `khoi_luong` float DEFAULT NULL,
  `series_laptop` varchar(512) DEFAULT NULL,
  `part_number` varchar(512) DEFAULT NULL,
  `mau_sac` varchar(512) DEFAULT NULL,
  `phu_kien_di_kem` varchar(512) DEFAULT NULL,
  `den_led` tinyint DEFAULT '0',
  `man_hinh_cam_ung` tinyint DEFAULT '0',
  `dung_luong_ram` int DEFAULT NULL,
  `so_luong_da_ban` int NOT NULL DEFAULT '0',
  `noi_bat` tinyint DEFAULT '0',
  `hien_thi` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`ma_san_pham`, `ten_san_pham`, `hinh_anh`, `bao_hanh`, `gia_goc`, `giam_gia`, `mo_ta_san_pham`, `thuong_hieu`, `created_at`, `updated_at`, `the_he_cpu`, `cpu`, `series_cpu`, `chip_do_hoa_roi`, `ten_ram`, `man_hinh`, `luu_tru`, `so_cong_luu_tru_toi_da`, `kieu_khe_m2_ho_tro`, `cong_xuat_hinh`, `cong_ket_noi`, `ket_noi_khong_day`, `ban_phim`, `he_dieu_hanh`, `kich_thuoc`, `pin`, `khoi_luong`, `series_laptop`, `part_number`, `mau_sac`, `phu_kien_di_kem`, `den_led`, `man_hinh_cam_ung`, `dung_luong_ram`, `so_luong_da_ban`, `noi_bat`, `hien_thi`) VALUES
(1, 'Laptop Lenovo Ideapad Slim 5 14ITL05 (i5-1135G7/RAM 8GB/256GB SSD/ Windows 11)', '[\"slim.webp\", \"slim1.webp\", \"slim2.webp\", \"slim3.webp\"]', 24, 35622066, 0, 'Laptop Lenovo Ideapad Slim 5 14ITL05-82FE016PVN Xám được xem là dòng laptop mỏng nhẹ, hiện đại và nhã nhặn của nhà Lenovo. Với thiết kế độc đáo bên ngoài và cấu hình mạnh mẽ bên trong, chắc chắn sẽ là một sự lựa chọn hoàn hảo dành cho các bạn, đặc biệt là nhân viên văn phòng', 'Lenovo', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nhân, 8 luồng ) i5-1135G7', 'Core i5', 'Onboard Intel Iris Xe Graphics', ' DDR4 3200MHz', '14\" ( 1920 x 1080 ) IPS không cảm ứng , Màn hình chống lóa , HD webcam', '256GB SSD M.2 NVMe', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x SD card slot , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , không phím số , LED', 'Windows 11 Home SL Windows 11', '32.157 x 21.159 x 1.79 ~ 1.99', '44 Wh , Pin liền', 1, 'Ideapad', '82FE016PVN', 'Xám', 'Adapter', 0, 0, 8, 12, 1, 1),
(2, 'Laptop Lenovo IdeaPad 3 15IAU7 (i3-1215U/RAM 8GB/512GB SSD/ Windows 11)', '[\"15iau7.webp\", \"15iau71.webp\", \"15iau72.webp\"]', 24, 20384628, 17, 'Laptop Lenovo IdeaPad 3 15IAU7 - 82RK001NVN một thiết bị phù hợp cho những ai đang tìm kiếm một chiếc laptop có thể xử lý được nhanh chóng các tác vụ công việc văn phòng hay học tập. Thiết kế nhỏ gọn, bộ vi xử lý Intel Core i3 mang lại hiệu năng ổn định hứa hẹn sẽ là một sản phẩm được đa số người dùng ưa thích.', 'Lenovo', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Core i3 , Intel Core thế hệ thứ 12', 'Intel Core i3-1215U ( 1.2 GHz - 4.4GHz / 10MB / 6 nhân, 8 luồng ) i3-1215U', 'Core i3', 'Onboard Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD TN Màn hình chống lóa , HD webcam', '512GB SSD M.2 NVMe', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Data / Power Delivery , 1 x USB 3.2 , 1 x USB 2.0 , 1 x SD card slot , Audio combo', 'WiFi 802.11ac , Bluetooth 5.0', 'thường , có phím số', 'Windows 11 Home Windows 11', '35.92 x 23.65 x 1.99', '3 cell 45', 1, 'Ideapad', '82RK001NVN', 'Xanh', 'Adapter', 0, 0, 8, 2, 0, 1),
(3, 'Laptop Lenovo Ideapad 5 - 15IAL7 (i5-1235U/RAM 8GB/512GB SSD/ Windows 11)', '[\"15ial7.webp\", \"15ial71.webp\", \"15ial72.webp\"]', 36, 21439000, 18, 'Laptop Lenovo Ideapad 5 - 15IAL7 -82SF006LVN là một siêu phẩm được đánh giá cao trong phân khúc tầm giá. Chiếc máy tính này được trang bị màn hình hiển thị kích thước lớn, chất lượng hình ảnh sắc nét cùng hiệu năng hoạt động ổn định đây sẽ là “người bạn” đồng hành với bạn từ công việc đến giải trí, thư giãn.', 'Lenovo', '2023-04-25 08:04:35', '2023-05-07 05:05:57', 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1235U ( 1.3 GHz - 4.4GHz / 12MB / 10 nhân, 12 luồng ) i5-1235U', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'GDDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe', '1 x 2.5\" SATA , 1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB Type C / DisplayPort / Data / Power Delivery , 2 x USB 3.2 , 1 x SD card slot , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , có phím số', 'Windows 11 Home Windows 11', '35.667 x 23.313 x 1.69', '57', 1, 'Ideapad', '82SF006LVN', 'Xanh', 'Adapter', 0, 0, 8, 2, 0, 1),
(4, 'Laptop Lenovo Legion 5 15IAH7-82RC0036VN', '[\"15iah7.webp\", \"15iah71.webp\", \"15iah72.webp\"]', 36, 38990000, 18, 'Laptop Lenovo Legion 5 15IAH7 82RC0036VN là dòng laptop Gaming cao cấp với thiết kế độc đáo và ấn tượng đến từ nhà Lenovo. Sở hữu cấu hình khủng với hiệu năng điện toán mạnh mẽ nhờ bộ vi xử lý Intel Core i7 Gen 12 mới mẻ, có thể cân được mọi tựa game đình đám hiện nay cũng như sẵn sàng hỗ trợ cho người dùng xử lý mọi tác vụ đồ họa, thiết kế, văn phòng dễ dàng hơn.', 'Lenovo', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 12', 'Intel Core i7-12700H ( 2.3 GHz - 4.7 GHz / 24MB / 14 nhân, 20 luồng ) i7-12700H', 'Core i7', 'RTX 3050Ti 4GB GDDR6 / Intel Iris Xe Graphics', 'DDR5 4800MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 165Hz , không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB Type C / DisplayPort / Power Delivery , 3 x USB 3.2 , 1 x Thunderbolt 4 , Không , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '35.88 x 26.235 x 1.999', '4 cell 80', 2.3, 'Legion', '82RC0036VN', 'Xám', 'Adapter', 0, 0, 8, 0, 1, 1),
(5, 'Laptop Lenovo ThinkBook 15 G4 IAP (i5-1235U/RAM 8GB/256GB SSD/ FreeDOS)', '[\"think.webp\", \"think1.webp\", \"think2.webp\", \"think3.webp\"]', 24, 21000000, NULL, 'Laptop Lenovo ThinkBook 15 G4 IAP 21DJ00CMVN với vẻ ngoài độc lạ, bắt mắt cùng hiệu năng ổn định từ CPU Intel Core i5 Gen 12 cùng khả năng đa nhiệm mượt mà với RAM 8GB DDR4, phù hợp với nhu cầu sử dụng của người làm văn phòng. Đây sẽ là sản phẩm mang đến cho bạn những trải nghiệm ấn tượng.', 'Lenovo', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1235U ( 1.3 GHz - 4.4GHz / 12MB / 10 nhân, 12 luồng ) i5-1235U', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , Màn hình chống lóa , FHD webcam', '256GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x Thunderbolt 4 , 1 x SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ac , Bluetooth 5.0', 'thường , có phím số , LED', 'No OS FreeDOS', '35.7 x 23.5 x 1.89', '3 cell 45', 1.7, 'Thinkbook', '21DJ00CMVN', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(6, 'Laptop Lenovo ThinkBook 14-IML (20RV00B6VN) (14\" FHD/i3-10110U/4GB/256GB SSD/Intel UHD/Free DOS/1.5kg)', '[\"14iml.webp\", \"14iml1.webp\", \"14iml2.webp\", \"14iml3.webp\"]', 12, 12590000, NULL, 'Được thiết kế cho những người có công việc hay phải di chuyển thường xuyên, laptop Lenovo ThinkBook 14-IML (20RV00B6VN) có thiết kế mỏng 17.9mm nên việc cho vào ba lô hay cầm tay mang đi sẽ trở nên dễ dàng hơn bao giờ hết. Ngoài ra với bộ xử lý Intel Core thế hệ mới nhất hỗ trợ tối ưu cho hệ điều hành Windows 10, chiếc laptop doanh nghiệp kích thước 14\" này có thể giúp bạn giải quyết tốt mọi tác vụ ở bất cứ đâu.', 'Lenovo', '2023-04-25 08:04:35', NULL, 'Core i3 , Intel Core thế hệ thứ 10', 'Intel Core i3-10110U ( 2.1 GHz - 4.1 GHz / 4MB / 2 nhân, 4 luồng ) i3-10110U', 'Core i3', 'Onboard Intel UHD Graphics', 'DDR4 2666MHz', '14\" ( 1920 x 1080 ) Full HD TN không cảm ứng , HD webcam', '256GB SSD M.2 NVMe', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C, 1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.1 , 1 x SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ac , Bluetooth 5.0', 'thường , không phím số , không đèn', 'Free DOS Free DOS', '32 x 23 x 1.79', '3 cell 45', 1.5, 'Thinkbook', '20RV00B6VN', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(7, 'Laptop Lenovo V15 G2 ITL (i3-1115G4/RAM 8GB/256GB SSD/ Windows 11)', '[\"v15g2itl.webp\", \"v15g2itl1.webp\", \"v15g2itl2.webp\", \"v15g2itl3.webp\"]', 12, 12990000, NULL, 'Laptop Lenovo V15 G2 ITL-82KB00QMVN Đen là một sản phẩm thuộc phân khúc cao cấp của thương hiệu nổi tiếng Lenovo. Chiếc máy tính xách tay này được trang bị trang bị chip Intel Core thế hệ thứ 11 mang lại hiệu năng vượt trội. Bên cạnh đó là kiểu dáng đẹp mắt cùng thiết kế thanh lịch phù hợp với nhiều đối tượng sử dụng.', 'Lenovo', '2023-04-25 08:04:35', NULL, 'Core i3 , Intel Core thế hệ thứ 11', 'Intel Core i3-1115G4 ( 3.0 GHz - 4.10 GHz / 6MB / 2 nhân, 4 luồng ) i3-1115G4', 'Core i3', 'Onboard Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD TN không cảm ứng , Màn hình chống lóa , HD webcam', '256GB SSD M.2 NVMe', '1 x 2.5\" SATA , 1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C , 1 x USB 3.2 , 1 x USB 2.0 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ac , Bluetooth 5.0', 'thường , có phím số', 'Windows 11 Home Windows 11', '35.92 x 23.58 x 1.99', '2 cell 38', 1.7, 'Lenovo V', '82KB00QMVN', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(8, 'Laptop Lenovo ThinkPad X1 Carbon Gen 10 (i5-1240P/RAM 16GB/512GB SSD/ Windows 11 Pro)', '[\"x1carbon.webp\", \"x1carbonl1.webp\", \"x1carbonl2.webp\", \"x1carbon3.webp\"]', 36, 47490000, NULL, 'Đang cập nhật...', 'Lenovo', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1240P ( 1.7 GHz - 4.4GHz / 12MB / 12 nhân, 16 luồng ) i5-1240P', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'LPDDR5 5200MHz', '14\" ( 2240 x 1400 ) IPS Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB 3.2 , 2 x Thunderbolt 4 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường', 'Windows 11 Pro Windows 11 Pro', '31.56 x 22.25 x 1.536', '57', 1.1, 'ThinkPad', '21CB009WVN', 'Đen', 'Adapter', 0, 0, 8, 0, 1, 1),
(9, 'Laptop Lenovo ThinkPad E15 Gen 4 (i7-1255U/RAM 8GB/512GB SSD/ FreeDOS)', '[\"e15gen4.webp\", \"e15gen41.webp\", \"e15gen42.webp\"]', 24, 24590000, 7, 'Laptop Lenovo ThinkPad E15 Gen 4 21E600CMVA tông đen đơn giản sang trọng với thiết kế khá độc đáo ấn tượng, bền bỉ kèm theo cấu hình bên trong đỉnh cao nhờ bộ vi xử lý Intel Core i7 thế hệ thứ 12. Sản phẩm laptop phù hợp với mọi đối tượng từ học sinh, sinh viên đến nhân viên văn phòng, đáp ứng tốt các tác vụ văn phòng hay làm đồ họa đều tốt.', 'Lenovo', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 12', 'Intel Core i7-1255U ( 1.7 GHz - 4.7GHz / 12MB / 10 nhân, 12 luồng ) i7-1255U', 'Core i7', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB 3.2 , 1 x USB 2.0 , 1 x Thunderbolt 4 , Không , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , LED', 'No OS FreeDOS', '36.5 x 24.0 x1.89', '3 cell 45', 1.7, 'Thinkbook', '21E600CMVA', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(10, 'Laptop Lenovo ThinkBook 16 G4+ IAP (i5-1240P/RAM 16GB/512GB SSD/ Windows 11)', '[\"16g4iap.webp\", \"16g4iap1.webp\", \"16g4iap2.webp\"]', 24, 29490000, 7, 'Đang cập nhật...', 'Lenovo', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1240P ( 1.7 GHz - 4.4GHz / 12MB / 12 nhân, 16 luồng ) i5-1240P', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'LPDDR5 4800MHz', '16\" ( 2560 x 1600 ) WQXGA IPS không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe', '2 x M.2 SATA/NVMe', 'M.2 SATA/NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x USB 2.0 , 1 x Thunderbolt 4 , 1 x SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ac , Bluetooth 5.1', 'thường , có phím số , LED', 'Windows 11 Home Windows 11', '35.6 x 25.1 x 1.65', '72', 1.8, 'Thinkbook', '21CY003FVN', 'Xám', 'Adapter', 0, 0, 8, 0, 1, 1),
(11, 'Laptop ACER Nitro 5 AN515-46-R5Z2 (Ryzen 7 6800H/RAM 8GB/512GB SSD/ Windows 11)', '[\"an515.webp\", \"an5151.webp\", \"an5152.webp\"]', 12, 36289000, 0, 'Laptop Acer Nitro 5 AN515-46-R5Z2 - NH.QH3SV.001 là dòng laptop gaming cao cấp quốc dân đến từ thương hiệu nổi tiếng Acer sở hữu cấu hình mạnh mẽ vượt trội kèm với thiết kế đẹp mắt, ấn tượng và thu hút mọi ánh nhìn, chiếc laptop Acer Gaming chính hãng này chắc hẳn sẽ làm hài lòng ngay cả những khách hàng khó tính.', 'Acer', '2023-04-25 08:04:35', '2023-05-07 11:25:41', 'Ryzen 7', 'AMD Ryzen 7 6800H ( 3.2 GHz - 4.7 GHz / 16MB / 8 nhân, 16 luồng ) Ryzen 7 6800H', 'AMD Ryzen 7', 'AMD Radeon 680M', 'DDR5 4800MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 144Hz , HD webcam', '512GB SSD M.2 NVMe', '1 x 2.5\" SATA , 1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort , 3 x USB 3.2 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '36.04 x 27.109 x 2.59 - 2.69', '57', 2, 'Nitro 5', 'NH.QH3SV.001', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(12, 'Laptop ACER Swift 3 SF314-511-55QE (i5-1135G7/RAM 16GB/512GB SSD/ Windows 11)', '[\"sf314.webp\", \"sf3141.webp\", \"sf3142.webp\"]', 12, 23790000, 25, 'Acer Swift 3 SF314-511-55QE NX.ABNSV.003 của Acer sở hữu hiệu năng mạnh mẽ đến từ chip Intel core thế hệ 11 cùng với Ram chạy đa nhiệm mượt mà và bộ nhớ SSD có dung lượng lớn. Cùng với màu sắc và kiểu dáng sang trọng hiện đại phù hợp cho nhu cầu học tập và làm việc với hiệu suất cao của các bạn sinh viên và nhân viên văn phòng.', 'Acer', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nhân, 8 luồng ) i5-1135G7', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'LPDDR4X 4266MHz', '14\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , HD webcam', '512GB SSD M.2 NVMe', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort , 2 x USB 3.2 , 1 x 3.5 mm', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , không phím số , LED', 'Windows 11 Home Windows 11', '32.28 x 21.22 x 1.59', '56', 1.2, 'Swift 3', 'NX.ABNSV.003', 'Bạc', 'Adapter', 0, 0, 8, 0, 1, 1),
(13, 'Laptop ACER Predator Helios 16 PH16-71-94N1 (i9-13900HX/RAM 32GB/Windows 11)', '[\"ph16.webp\", \"ph161.webp\", \"ph162.webp\"]', 12, 142761480, 0, 'Acer Predator Helios 16 là một chiếc máy tính xách tay đến từ nhà Acer chuyên dùng cho những chiến binh game thủ. Predator Helios có thiết kế màu đen mạnh mẽ, và được trang bị với màn hình 16 inch có độ phân giải Full HD. Máy sử dụng chip xử lý Intel Core i9 và card đồ họa GEFORCE RTX™ 4080, cung cấp hiệu suất xử lý và đồ họa tuyệt vời cho trải nghiệm gaming tuyệt đỉnh.', 'Acer', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Core i9 , Intel Core thế hệ thứ 13', 'Intel Core i9-13900HX ( 2.2 GHz - 5.4GHz / 36MB / 24 nhân, 32 luồng ) i9-13900HX', 'Core i9', 'Intel UHD Graphics 770', 'DDR5 4800MHz', '16\" ( 2560 x 1600 ) WQXGA IPS 240Hz , không cảm ứng , Màn hình chống lóa , HD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '3 x USB 3.2 , 1 x Thunderbolt 4 , 1 x micro SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , có phím số , RGB', 'Windows 11 Home SL Windows 11', '35.778 x 27.874 x 2.490 - 2.690', '4 cell 90', 2, 'Predator', 'NH.QJSSV.002', 'Đen', 'Adapter', 0, 0, 16, 0, 0, 1),
(14, 'Laptop ACER Nitro 5 AN515-57-71VV (i7-11800H/RAM 8GB/RTX 3050/512GB SSD/ Windows 11)', '[\"an51557.webp\", \"an515571.webp\", \"an515572.webp\"]', 12, 33317880, 5, 'Laptop Acer Nitro 5 AN515-57-71VV (NH.QENSV.005) là dòng laptop thuộc phân khúc cao cấp được nhiều người lựa chọn. Với thiết kế vô cùng mạnh mẽ đậm chất gaming cùng với con chip Intel Core i7 mang lại hiệu năng vượt trội, tự tin chiến mọi loại game, hứa hẹn mang đến cho người dùng trải nghiệm tuyệt vời hơn các dòng laptop trong cùng phân khúc.', 'Acer', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Core i7 , Intel Core thế hệ thứ 11', 'Intel Core i7-11800H ( 2.3 GHz - 4.6 GHz / 24MB / 8 nhân, 16 luồng ) i7-11800H', 'Core i7', 'Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 144Hz , không cảm ứng , HD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe - Hỗ trợ Intel Optane', 'M.2 NVMe (Hỗ trợ Intel Optane)', '1 x HDMI', '1 x USB Type C , 3 x USB 3.2 , 1 x 3.5 mm , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '36.34 x 25.5 x 2.39', '4 cell 57', 2, 'Nitro 5', 'NH.QENSV.005', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(15, 'Laptop ACER Predator Triton 300 PT315-53-7440 (i7-11800H/RAM 8GB/512GB SSD/ Windows 11)', '[\"7440.webp\", \"74401.webp\", \"74402.webp\"]', 12, 36990000, NULL, 'Laptop ACER Predator Triton 300 (PT315-53-7440 NH.QDRSV.003) cực phẩm gaming được bao bọc bởi thiết kế nguyên khối mạnh mẽ, mọi đường nét của laptop đều toát lên vẻ cá tính nổi bật. Bên trong mang hiệu năng hoàn hảo cho việc xử lý thông tin, chơi game mượt mà, đồ họa đẹp mắt. Đem lại cho bạn những trải nghiệm thú vị khi sử dụng chiếc laptop này.', 'Acer', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 11', 'Intel Core i7-11800H ( 2.3 GHz - 4.6 GHz / 24MB / 8 nhân, 16 luồng ) i7-11800H', 'Core i7', 'Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 2560 x 1440 ) Quad HD (2K) IPS 165Hz , không cảm ứng , HD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI , 1 x mini DisplayPort', '3 x USB 3.2 , 1 x Thunderbolt 4 , 1 x 3.5 mm , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '35.3 x 25.5 x 1.99', '4 cell 59', 2, 'Predator', 'NH.QDRSV.003', 'Đen', 'Adapter', 0, 0, 16, 0, 0, 1),
(16, 'Laptop ACER Predator Helios 300 PH315-54-99S6 (i9-11900H/RAM 16GB/512GB SSD/ Windows 10)', '[\"99s6.webp\", \"99s61.webp\", \"99s62.webp\"]', 12, 41990000, 5, 'Laptop Acer PH315-54-99S6 Predator Helios 300  (NH.QC2SV.006) thu hút không chỉ nhờ vẻ ngoài mạnh mẽ mà còn là vì cấu hình vượt trội, mang đến trải nghiệm làm việc và giải trí rất đáng để mong đợi. Phiên bản laptop cao cấp với tính cơ động hứa hẹn sẽ là người bạn tuyệt vời đồng hành cùng bạn đến bất kỳ đâu. ', 'Acer', '2023-04-25 08:04:35', NULL, 'Core i9 , Intel Core thế hệ thứ 11', 'Intel Core i9-11900H ( 2.5 GHz - 4.9 GHz / 24MB / 8 nhân, 16 luồng ) i9-11900H', 'Core i9', 'Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 2560 x 1440 ) Quad HD (2K) IPS 165Hz , không cảm ứng , HD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI , 1 x mini DisplayPort', '1 x USB Type C / Thunderbolt , 3 x USB 3.2 , 1 x 3.5 mm , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , RGB', 'Windows 10 Home 64-bit Windows 10', '36.3 x 25.5 x 2.29', '4 cell 59', 2.3, 'Predator', 'NH.QC2SV.006', 'Đen', 'Adapter', 0, 0, 16, 0, 0, 1),
(17, 'Laptop ACER Swift 3 SF314-71-74WD (i7-12700H/RAM 16GB/1TB SSD/ Windows 11)', '[\"74wd.webp\", \"74wd1.webp\", \"74wd2.webp\"]', 12, 34790000, NULL, 'Đang cập nhật...', 'Acer', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 12', 'Intel Core i7-12700H ( 2.3 GHz - 4.7GHz / 24MB / 14 nhân, 20 luồng ) i7-12700H', 'Core i7', 'Onboard Intel Iris Xe Graphics', 'LPDDR5 6400MHz', '14\" ( 2880 x 1800 ) OLED không cảm ứng , HD webcam', '1TB SSD M.2 NVMe', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB Type C , 2 x USB 3.2 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , không phím số , LED', 'Windows 11 Home Windows 11', '31.29 x 21.40 x 1.79', '3 cell 57', 1.4, 'Swift 3', 'NX.KAWSV.001', 'Vàng', 'Adapter', 0, 0, 4, 0, 0, 1),
(18, 'Laptop Acer Swift 3 SF315-52-38YQ (NX.GZBSV.003) (15.6\" FHD/i3-8130U/4GB/1TB HDD/UHD 620/Win10/1.6 kg)', '[\"38yq.webp\", \"38yq1.webp\", \"38yq2.webp\"]', 12, 13499000, NULL, 'Màu Rose Gold sang trọng bao phủ ngoại hình Acer Swift 3 SF315-52-38YQ, đây là màu sắc “không tuổi” ở thời điểm hiện tại do phù hợp với mọi lứa tuổi người dùng. Bên cạnh ngoại hình hấp dẫn, máy còn nổi bật nhờ việc đầu tư pin lớn lên tới 4 cell 48Wh (pin liền) nhưng khối lượng thân máy rất nhẹ cho người dùng cảm giác như một quyển notebook : Chỉ 1.6kg.', 'Acer', '2023-04-25 08:04:35', NULL, 'Core i3 , Intel Core thế hệ thứ 8', 'Intel Core i3-8130U ( 2.2 GHz - 3.4 GHz / 4MB / 2 nhân, 4 luồng ) i3-8130U', 'Core i3', 'Onboard Intel UHD Graphics 620', 'DDR4 2666MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , HD webcam', '1TB HDD 5400RPM', '1 x 2.5\" SATA , 1 x M.2 SATA/NVMe', 'M.2 SATA/NVMe', '1 x HDMI', '1 x USB Type C , 2 x USB 3.0 , 1 x USB 2.0 , 1 x SD card slot', 'WiFi 802.11ac , Bluetooth 4.2', 'thường , có phím số , không đèn', 'Windows 10 Home SL 64-bit Windows 10', '34 x 23 x 1.8', '4 cell 48', 1.6, 'Swift 3', 'NX.GZBSV.003', 'Vàng', 'Adapter', 0, 0, 8, 0, 0, 1),
(19, 'Laptop ACER Aspire 5 A514-54-5127 (i5-1135G7/RAM 8GB/512GB SSD/ Windows 11)', '[\"5127.webp\", \"51271.webp\", \"51272.webp\"]', 12, 16990000, 12, 'Thuộc dòng Aspire 5 thế hệ mới nhất của ACER, Laptop ACER Aspire 5 A514-54-5127 NX.A28SV.007 khẳng định vị thế của riêng bạn với thiết kế sang trọng, cá tính và mỏng nhẹ đáng kinh ngạc và hiệu năng sẵn sàng bứt phá.', 'Acer', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nhân, 8 luồng ) i5-1135G7', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'DDR4 2666MHz', '14\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , HD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C , 3 x USB 3.2 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , không phím số , LED', 'Windows 11 Home SL Windows 11', '32.8 x 22.3 x 1.8', '48', 1.5, 'Aspire 5', 'NX.A28SV.007', 'Bạc', 'Adapter', 0, 0, 32, 0, 0, 1),
(20, 'Laptop ACER Nitro 5 AN515-58-52SP (i5-12500H/RAM 8GB/RTX 3050/512GB SSD/ Windows 11)', '[\"52sp.webp\", \"52sp1.webp\", \"52sp2.webp\"]', 12, 29490000, 15, 'Laptop ACER Nitro 5 AN515 -58 -52SP NH.QFHSV.001 được ACER cho ra mắt với vẻ ngoài thu hút hơn bởi thiết kế đậm chất gaming, các cạnh được vát theo khối hình học đầy mạnh mẽ. Đối với những ai là fan của nhà Acer đang muốn tìm hiểu về những dòng laptop gaming Nitro 5 Tiger 2022 mới nhất thì đây sẽ cỗ máy với bộ vi xử lý Intel tuyệt vời nhất dành cho bạn. ', 'Acer', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-12500H ( 2.5 GHz - 4.5 GHz / 18MB / 12 nhân, 16 luồng ) i5-12500H', 'Core i5', 'Intel Iris Xe Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 144Hz , không cảm ứng , HD webcam', '512GB SSD M.2 NVMe', '1 x 2.5\" SATA , 2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '3 x USB 3.2 , 1 x Thunderbolt 4 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '36.04 x 27.109 x 2.59', '4 cell 57', 2.5, 'Nitro 5', 'NH.QFHSV.001', 'Đen', 'Adapter', 0, 0, 16, 0, 0, 1),
(21, 'Laptop ASUS TUF Gaming FX506HC-HN144W (i5-11400H/RAM 8GB/RTX 3050/512GB SSD/ Windows 11)', '[\"fx506.webp\", \"fx5061.webp\", \"fx5062.webp\"]', 24, 25990000, 21, 'Laptop ASUS TUF Gaming FX506HC-HN144W 90NR0724-M00FJ0 là một chiếc laptop gaming thuộc hạng nặng với bộ vi xử lý thế hệ mới Intel Core 11 mới nhất và một thiết lập âm thanh tổng thể tuyệt vời. Bằng những cải tiến tối ưu về cả hiệu năng lẫn kiểu dáng Asus muốn mang lại cho người dùng một sản phẩm hoàn hảo mang đến trải nghiệm mới mẻ và vượt trội hơn bao giờ hết.', 'Asus', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-11400H ( 2.7 GHz - 4.5 GHz / 12MB / 6 nhân, 12 luồng ) i5-11400H', 'Core i5', 'Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 144Hz , không cảm ứng , Màn hình chống lóa , HD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '3 x USB 3.2 , 1 x Thunderbolt 4 , 1 x 3.5 mm , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , RGB', 'Windows 11 Home Windows 11', '35.9 x 25.6 x 2.45', '3 cell 48', 2.5, 'TUF Gaming', '90NR0724-M00FJ0', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(22, 'Laptop ASUS Gaming ROG Strix G513IE-HN246W (Ryzen 7 4800H/RAM 8GB/512GB SSD/ Windows 11)', '[\"g513.webp\", \"g5131.webp\", \"g5132.webp\"]', 24, 26990000, 15, 'Laptop Asus Gaming ROG Strix G513IE-HN246W khoác lên mình một ngoại hình Gaming ấn tượng, mạnh mẽ phù hợp với các game thủ. Đây sẽ là một ứng cử viên sáng giá với khả năng đáp ứng những nhu cầu sử dụng những tác vụ thông thường một cách nhanh chóng, đồng thời hứa hẹn mang đến cho bạn những trải nghiệm trong từng trận game tuyệt vời.', 'Asus', '2023-04-25 08:04:35', NULL, 'Ryzen 7 , AMD Ryzen thế hệ thứ 4', 'AMD Ryzen 7 4800H ( 2.9 GHz - 4.2 GHz / 8MB / 8 nhân, 16 luồng ) Ryzen 7 4800H', 'AMD Ryzen 7', 'AMD Radeon Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 144Hz , Màn hình chống lóa', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 3 x USB 3.2 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , RGB 4 vùng', 'Windows 11 Home Windows 11', '35.4 x 25.9 x 2.06 ~ 2.59', '4 cell 56', 2.1, 'ROG', '90NR0313-M00FJ0', 'Xám', 'Adapter', 0, 0, 16, 0, 0, 1),
(23, 'Laptop ASUS Expertbook B5 B5302CEA-L50916W (i5-1135G7/RAM 8GB/512GB SSD/ Windows 11)', '[\"b530.webp\", \"b5301.webp\", \"b5302.webp\"]', 24, 22971036, 0, 'Đang cập nhật...', 'Asus', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Core i5 , Intel Core thế hệ thứ 11 , Intel EVO', 'Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nhân, 8 luồng ) i5-1135G7', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '13.3\" ( 1920 x 1080 ) Full HD Màn hình chống lóa , HD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x micro HDMI', '1 x USB 3.2 , 2 x Thunderbolt 4 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.0', 'thường , không phím số , LED', 'Windows 11 Home Windows 11', '30.90 x 21.06 x 1.69', '4 cell 66', 1, 'ExpertBook', '90NR00301-M00FJ0', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(24, 'Laptop ASUS Vivobook X515EA-BQ3015W (i7-1165G7/RAM 8GB/512GB SSD/ Windows 11)', '[\"x515.webp\", \"x5151.webp\", \"x5152.webp\"]', 24, 21197880, 0, 'Đang cập nhật...', 'Asus', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Core i7 , Intel Core thế hệ thứ 11', 'Intel Core i7-1165G7 ( 2.8 GHz - 4.7 GHz / 12MB / 4 nhân, 8 luồng ) i7-1165G7', 'Core i7', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , Màn hình chống lóa , VGA webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB 3.2 Type C , 1 x USB 3.2 , 2 x USB 2.0 , Audio combo', 'WiFi 802.11ac , Bluetooth 4.1', 'thường , có phím số , không đèn', 'Windows 11 Home Windows 11', '36.00 x 23.50 x 1.99', '2 cell 37', 1, 'VivoBook', '90NR3123-M00FJ0', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(25, 'Laptop ASUS ROG Strix SCAR 18 G834JY-N6039W (i9-13980HX/RAM 64GB/RTX 4090/2TB SSD/ Windows 11)', '[\"g834.webp\", \"g8341.webp\", \"g8342.webp\"]', 24, 125000000, 8, 'Laptop ROG Strix SCAR luôn là đầu tàu trong dải sản phẩm Laptop Gaming của ROG, và 2023 cũng không khác biệt. ROG Strix SCAR 16 và 18 với khung máy hoàn toàn mới và màn hình tỷ lệ 16:10 thời thượng, trang bị tấm nền lên đên 2K 240Hz, đạt chuẩn ROG Nebula. Bộ vi xử lý CPU Intel Core™ i9 13980HX cho hiệu năng chơi game tuyệt đỉnh, GPU lên đến NVIDIA GeForce RTX 4090 Laptop cùng hệ thống tản nhiệt tân tiến mang đến trải nghiệm chơi game mượt mà nhất trên nền tảng đồ họa đến từ tương lai.', 'Asus', '2023-04-25 08:04:35', NULL, 'Core i9 , Intel Core thế hệ thứ 13', 'Intel Core i9-13980HX ( 2.2 GHz - 5.6GHz / 36MB / 24 nhân, 32 luồng ) i9-13980HX', 'Core i9', 'Intel UHD Graphics 770', 'DDR5 4800MHz', '18\" ( 2560 x 1600 ) WQXGA 240Hz , không cảm ứng , Màn hình chống lóa , HD webcam', '2TB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x Thunderbolt 4 , Audio combo , LAN 2500 Mbps', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '39.9 x 29.4 x 2.31 ~ 3.08', '4 cell 90', 3.1, 'ROG', '90NR31032-M00FJ0', 'Đen', 'Adapter', 0, 0, 16, 0, 0, 1),
(26, 'Laptop Dell Inspiron 14 5420 (i5-1235U/RAM 8GB/512GB SSD/ Windows 11 + Office)', '[\"5420.webp\", \"54201.webp\", \"54202.webp\"]', 24, 22990000, 14, 'Laptop Dell Inspiron 14 5420 i5 U085W11SLU chiếc laptop dành cho đa dạng nhu cầu sử dụng? Đúng, với dòng series mới này của Dell hãng đã tinh chỉnh lựa chọn linh kiện khá hợp lý với chip Intel core i5 thế hệ 12 mới nhất tại thời điểm ra mắt. Dải nhu cầu chi tiết cho chiếc laptop này nằm ở các yêu cầu như học sinh, sinh viên, nhân viên văn phòng là chủ yếu, hỗ trợ đầy đủ hiệu năng với các vụ vừa phải.', 'Dell', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1235U ( 1.3 GHz - 4.4GHz / 12MB / 10 nhân, 12 luồng ) i5-1235U', 'Core i5', 'Onboard Intel UHD Graphics', 'DDR4 3200MHz', '14\" ( 1920 x 1200 ) Full HD+ WVA không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C , 2 x USB 3.2 , 1 x SD card slot , 1 x 3.5 mm', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , không phím số , LED', 'Windows 11 Home SL + Office Home & Student 2021 Windows 11 + Office', '22.75 x 31.4 x 1.837', '4 cell 54', 1.5, 'Inspiron', 'i5U085W11SLU', 'Bạc', 'Adapter', 0, 0, 8, 0, 0, 1),
(27, 'Laptop Dell Vostro 3510 (i5-1135G7/RAM 8GB/512GB SSD/ Windows 11 + Office)', '[\"3510.webp\", \"35101.webp\", \"35102.webp\"]', 12, 30650268, 24, 'Laptop Dell Vostro 3510 P112F002BBL với thiết kế vẻ ngoài đơn giản thanh lịch, bên trong với hiệu năng xử lý khá mạnh mẽ cùng với chip Intel core i5. Được tối ưu hóa trọng lượng, mang đến trải nghiệm nhẹ nhàng và thoải mái cho người dùng. Là lựa chọn hoàn hảo cho những người thích sự gọn nhẹ và linh hoạt, nhất là các bạn sinh viên và nhân viên văn phòng.', 'Dell', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nhân, 8 luồng ) i5-1135G7', 'Core i5', 'Intel Iris Xe Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD WVA không cảm ứng , HD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB 3.2 , 1 x USB 2.0 , 1 x SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số', 'Windows 11 Home SL + Office Home & Student 2021 Windows 11 + Office', '35.8 x 23.5 x 1.89', '3 cell 42', 1, 'Vostro', 'P112F002BBL', 'Đen', 'Adapter, dây nguồn, HDSD,…', 0, 0, 16, 0, 0, 1),
(28, 'Laptop Dell Vostro 5620 (i5-1240P/RAM 16GB/512GB SSD/ Windows 11)', '[\"5620.webp\", \"56201.webp\"]', 12, 31136280, 11, 'Laptop Dell Vostro 5620 70282719 được thiết kế theo phong cách hiện đại với tông màu xám thanh lịch. Vostro 5620 cũng được trang bị hiệu năng vượt trội từ bộ vi xử lý và màn hình lên đến 16 inch phù hợp với khả năng xử lý công việc, học tập, giải trí và đa nhiệm dễ dàng. Đây sẽ là sự lựa chọn hoàn hảo dành cho những khách hàng yêu thích sử dụng dòng laptop có màn hình hiển thị lớn. ', 'Dell', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1240P ( 1.7 GHz - 4.4GHz / 12MB / 12 nhân, 16 luồng ) i5-1240P', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '16\" ( 1920 x 1200 ) WUXGA WVA không cảm ứng , FHD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB 3.2 , 2 x Thunderbolt 4 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.0', 'thường , không phím số , LED', 'Windows 11 Home Windows 11', '35.6 x 25.2 x 1.8', '4 cell', 1, 'Vostro', '70282719', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(29, 'Laptop Dell Inspiron 14 T7420 (i5-1235U/RAM 8GB/512GB SSD/ Windows 11 + Office)', '[\"t7420.webp\", \"t74201.webp\", \"t74202.webp\"]', 24, 24890000, 11, 'Đang cập nhật...', 'Dell', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1235U ( 1.3 GHz - 4.4GHz / 12MB / 10 nhân, 12 luồng ) i5-1235U', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '14\" ( 1920 x 1200 ) Full HD+ WVA cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB Type C / DisplayPort / Power Delivery , 1 x USB 3.2 , 1 x SD card slot , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , không phím số , LED', 'Windows 11 Home SL + Office Home & Student 2021 Windows 11 + Office', '31.40 x 22.75 x 1.78', '4 cell 54', 1.6, 'Inspiron', 'N4I5021W', 'Bạc', 'Adapter', 0, 0, 8, 0, 0, 1),
(30, 'Laptop Dell Inspiron 15 5625 (Ryzen 7 5825U/RAM 8GB/512GB SSD/ Windows 11 + Office)', '[\"5625.webp\", \"56251.webp\", \"56252.webp\"]', 12, 22990000, 18, 'Laptop Dell Inspiron 15 5625 99VP91 Bạc được thiết kế theo xu hướng tối giản theo đúng tiêu chuẩn của một chiếc máy tính phổ thông. Cùng với hiệu năng mạnh mẽ, laptop này sẽ giúp đáp ứng tốt các nhu cầu và hứa hẹn sẽ mang đến trải nghiệm tuyệt vời đến khách hàng.', 'Dell', '2023-04-25 08:04:35', NULL, 'Ryzen 7', 'AMD Ryzen 7 5825U ( 2.0 GHz - 4.5 GHz / 16MB / 8 nhân, 16 luồng ) Ryzen 7 5825U', 'AMD Ryzen 7', 'Onboard AMD Radeon Graphics', 'DDR4 3200MHz', '16\" ( 1920 x 1200 ) Full HD+ WVA không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x SD card slot , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , LED', 'Windows 11 Home SL + Office Home & Student 2021 Windows 11 + Office', '35.68 x 25.19 x 1.79', '4 cell 54', 1.8, 'Inspiron', '99VP91', 'Bạc', 'Adapter', 0, 0, 16, 0, 0, 1),
(31, 'Laptop HP Envy x360 13-bf0096TU (i5-1230U/RAM 8GB/512GB SSD/ Windows 11)', '[\"13.webp\", \"131.webp\", \"132.webp\", \"slim3.webp\"]', 24, 21646900, 0, 'Khi cầm trên tay chiếc Laptop HP Envy x360 13-bf0096TU, mình đã thực sự bị chinh phục bởi những gì mà HP đã mang đến trên chiếc máy này. Thiết kế mỏng nhẹ của máy cùng với chất liệu nhôm cao cấp tạo nên một sự sang trọng và hiện đại. Màn hình cảm ứng Full HD 13.3 inch cho hình ảnh sắc nét và đẹp mắt. Bàn phím có đèn nền LED cho phép làm việc trong điều kiện ánh sáng yếu và độ nhạy cao giúp người dùng nhập liệu dễ dàng. Độ hoàn thiện cũng như chi tiết được chăm chút tỉ mỉ, tạo nên một sản phẩm đáng giá cho người sử dụng.', 'HP', '2023-04-25 08:04:35', '2023-05-07 11:25:41', 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nhân, 8 luồng ) i5-1135G7', 'Core i5', 'Onboard Intel Iris Xe Graphics', ' DDR4 3200MHz', '14\" ( 1920 x 1080 ) IPS không cảm ứng , Màn hình chống lóa , HD webcam', '256GB SSD M.2 NVMe', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x SD card slot , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , không phím số , LED', 'Windows 11 Home SL Windows 11', '32.157 x 21.159 x 1.79 ~ 1.99', '44 Wh , Pin liền', 1, 'Ideapad', '82FE016PVN', 'Xám', 'Adapter', 0, 0, 8, 0, 1, 1),
(32, 'Laptop HP Victus 16-e1107AX (Ryzen 5 6600H/RAM 8GB/512GB SSD/ Windows 11)', '[\"16.webp\", \"161.webp\", \"162.webp\"]', 24, 20384628, 17, 'Trong thế giới của những người yêu thích trò chơi điện tử, việc sở hữu một chiếc laptop gaming chất lượng là điều vô cùng quan trọng. Và Laptop HP Victus 16-e1107AX chính là một trong số những sản phẩm được các game thủ tin dùng. Được HP - thương hiệu nổi tiếng trong lĩnh vực công nghệ - sản xuất, chiếc laptop này không chỉ có thiết kế đẹp mắt mà còn được trang bị những tính năng hiện đại, cấu hình mạnh mẽ và độ bền cao. Không những thế, nó còn đáp ứng được các tiêu chuẩn về chất lượng và an toàn môi trường, là một sự lựa chọn hoàn hảo cho những người dùng đang tìm kiếm một chiếc laptop đáp ứng được nhu cầu chơi game của mình.', 'HP', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Core i3 , Intel Core thế hệ thứ 12', 'Intel Core i3-1215U ( 1.2 GHz - 4.4GHz / 10MB / 6 nhân, 8 luồng ) i3-1215U', 'Core i3', 'Onboard Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD TN Màn hình chống lóa , HD webcam', '512GB SSD M.2 NVMe', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Data / Power Delivery , 1 x USB 3.2 , 1 x USB 2.0 , 1 x SD card slot , Audio combo', 'WiFi 802.11ac , Bluetooth 5.0', 'thường , có phím số', 'Windows 11 Home Windows 11', '35.92 x 23.65 x 1.99', '3 cell 45', 1, 'Ideapad', '82RK001NVN', 'Xanh', 'Adapter', 0, 0, 8, 2, 0, 1),
(33, 'Laptop HP Pavilion 14-dv2050TU (i3-1215U/RAM 4GB/256GB SSD/ Windows 11)', '[\"14.webp\", \"141.webp\", \"142.webp\"]', 36, 25984068, 18, 'Laptop HP Pavilion 14-dv2050TU - 6K7G7PA là sự lựa chọn không thể bỏ qua nếu bạn đang tìm kiếm một chiếc laptop phục vụ cho các tác vụ cơ bản hàng ngày. Chiếc laptop HP này có vẻ ngoài tinh tế, gọn nhẹ dễ dàng di chuyển và sở hữu hiệu năng ổn định giúp bạn xử lý công việc nhanh chóng.', 'HP', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1235U ( 1.3 GHz - 4.4GHz / 12MB / 10 nhân, 12 luồng ) i5-1235U', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'GDDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe', '1 x 2.5\" SATA , 1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB Type C / DisplayPort / Data / Power Delivery , 2 x USB 3.2 , 1 x SD card slot , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , có phím số', 'Windows 11 Home Windows 11', '35.667 x 23.313 x 1.69', '57', 1, 'Ideapad', '82SF006LVN', 'Xanh', 'Adapter', 0, 0, 8, 2, 0, 1),
(34, 'Laptop HP Pavilion 15-eg2037TX (i5-1235U/RAM 8GB/256GB SSD/ Windows 11)', '[\"15.webp\", \"151.webp\", \"152.webp\"]', 36, 38990000, 18, 'Laptop HP Pavilion 15-eg2037TX - 6K783PA là sản phẩm thuộc phân khúc cao cấp sở hữu Intel Core i5 cho hiệu năng ổn định, màn hình 15.6 inch hiển thị lớn cùng thiết kế tinh tế. Đây sẽ là một công cụ làm việc hiệu quả đặc biệt phù hợp với những đối tượng khách hàng là nhân viên văn phòng.', 'HP', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 12', 'Intel Core i7-12700H ( 2.3 GHz - 4.7 GHz / 24MB / 14 nhân, 20 luồng ) i7-12700H', 'Core i7', 'Intel Iris Xe Graphics', 'DDR5 4800MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 165Hz , không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB Type C / DisplayPort / Power Delivery , 3 x USB 3.2 , 1 x Thunderbolt 4 , Không , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '35.88 x 26.235 x 1.999', '4 cell 80', 2.3, 'Legion', '82RC0036VN', 'Xám', 'Adapter', 0, 0, 8, 0, 1, 1),
(35, 'Laptop HP Envy x360 13-bf0114TU (i5-1230U/RAM 8GB/512GB SSD/ Windows 11)', '[\"12.webp\", \"121.webp\", \"122.webp\", \"123.webp\"]', 24, 21000000, NULL, 'Đang cập nhật...', 'HP', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1235U ( 1.3 GHz - 4.4GHz / 12MB / 10 nhân, 12 luồng ) i5-1235U', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , Màn hình chống lóa , FHD webcam', '256GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x Thunderbolt 4 , 1 x SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ac , Bluetooth 5.0', 'thường , có phím số , LED', 'No OS FreeDOS', '35.7 x 23.5 x 1.89', '3 cell 45', 1.7, 'Thinkbook', '21DJ00CMVN', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(36, 'Laptop LG Gram 16ZD90Q (i5-1240P/RAM 16GB/512GB SSD/ Free DOS)', '[\"90.webp\", \"901.webp\", \"902.webp\", \"903.webp\"]', 12, 12590000, NULL, 'Laptop LG Gram 16ZD90Q-G.AX55A5 thuộc dòng laptop cao cấp thế hệ mới, sở hữu thiết kế sang trọng với trọng lượng siêu nhẹ mang đến sự linh hoạt và thuận tiện cho những khách hàng thường xuyên di chuyển. Cùng với đó là hiệu năng mạnh mẽ bền bỉ với CPU Intel Core i5 và RAM đa nhiệm, giúp đáp ứng hầu hết các nhu cầu từ cơ bản đến nâng cao của khách hàng.', 'LG', '2023-04-25 08:04:35', NULL, 'Core i3 , Intel Core thế hệ thứ 10', 'Intel Core i3-10110U ( 2.1 GHz - 4.1 GHz / 4MB / 2 nhân, 4 luồng ) i3-10110U', 'Core i3', 'Onboard Intel UHD Graphics', 'DDR4 2666MHz', '14\" ( 1920 x 1080 ) Full HD TN không cảm ứng , HD webcam', '256GB SSD M.2 NVMe', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C, 1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.1 , 1 x SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ac , Bluetooth 5.0', 'thường , không phím số , không đèn', 'Free DOS Free DOS', '32 x 23 x 1.79', '3 cell 45', 1.5, 'Thinkbook', '20RV00B6VN', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(37, 'Laptop LG Gram 2023 17Z90R-G.AH78A5 (i7-1360P/RAM 16GB/1TB SSD/ Windows 11)', '[\"17.webp\", \"171.webp\", \"172.webp\"]', 12, 17318268, 0, 'Laptop LG Gram 16ZD90Q-G.AX55A5 thuộc dòng laptop cao cấp thế hệ mới, sở hữu thiết kế sang trọng với trọng lượng siêu nhẹ mang đến sự linh hoạt và thuận tiện cho những khách hàng thường xuyên di chuyển. Cùng với đó là hiệu năng mạnh mẽ bền bỉ với CPU Intel Core i5 và RAM đa nhiệm, giúp đáp ứng hầu hết các nhu cầu từ cơ bản đến nâng cao của khách hàng.', 'LG', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Core i3 , Intel Core thế hệ thứ 11', 'Intel Core i3-1115G4 ( 3.0 GHz - 4.10 GHz / 6MB / 2 nhân, 4 luồng ) i3-1115G4', 'Core i3', 'Onboard Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD TN không cảm ứng , Màn hình chống lóa , HD webcam', '256GB SSD M.2 NVMe', '1 x 2.5\" SATA , 1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C , 1 x USB 3.2 , 1 x USB 2.0 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ac , Bluetooth 5.0', 'thường , có phím số', 'Windows 11 Home Windows 11', '35.92 x 23.58 x 1.99', '2 cell 38', 1, 'Lenovo V', '82KB00QMVN', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(38, 'Laptop LG Gram 14ZD90Q (i3-1220P/RAM 8GB/256GB SSD/ Free DOS)', '[\"zd.webp\", \"zd1.webp\", \"zd2.webp\"]', 36, 57557880, 0, 'Đang cập nhật...', 'LG', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1240P ( 1.7 GHz - 4.4GHz / 12MB / 12 nhân, 16 luồng ) i5-1240P', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'LPDDR5 5200MHz', '14\" ( 2240 x 1400 ) IPS Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB 3.2 , 2 x Thunderbolt 4 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường', 'Windows 11 Pro Windows 11 Pro', '31.56 x 22.25 x 1.536', '57', 1, 'ThinkPad', '21CB009WVN', 'Đen', 'Adapter', 0, 0, 8, 0, 1, 1),
(39, 'Laptop LG Gram 17ZD90Q (i7-1260P/RAM 16GB/256GB SSD/ Free DOS)', '[\"0q.webp\", \"0q1.webp\", \"0q2.webp\"]', 24, 24590000, 7, 'Đang cập nhật...', 'LG', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 12', 'Intel Core i7-1255U ( 1.7 GHz - 4.7GHz / 12MB / 10 nhân, 12 luồng ) i7-1255U', 'Core i7', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB 3.2 , 1 x USB 2.0 , 1 x Thunderbolt 4 , Không , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , LED', 'No OS FreeDOS', '36.5 x 24.0 x1.89', '3 cell 45', 1.7, 'Thinkbook', '21E600CMVA', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(40, 'Laptop LG Gram 2021 16Z90P (i7-1165G7/RAM 16GB/256GB SSD/ Windows 10)', '[\"z9.webp\", \"z91.webp\", \"z92.webp\"]', 24, 29490000, 7, 'Laptop LG Gram 17ZD90Q-G.AX73A5 là một thiết bị hoàn hảo với thiết kế siêu gọn nhẹ, màn hình hiển thị cao cấp và hiệu năng mạnh mẽ sẵn sàng đáp ứng mọi nhu cầu làm việc, giải trí mọi nơi mọi lúc. Thuộc phân khúc sản phẩm cao cấp chiếc laptop LG này hứa hẹn sẽ làm bạn hài lòng với những lợi ích mang lại.', 'LG', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1240P ( 1.7 GHz - 4.4GHz / 12MB / 12 nhân, 16 luồng ) i5-1240P', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'LPDDR5 4800MHz', '16\" ( 2560 x 1600 ) WQXGA IPS không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe', '2 x M.2 SATA/NVMe', 'M.2 SATA/NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x USB 2.0 , 1 x Thunderbolt 4 , 1 x SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ac , Bluetooth 5.1', 'thường , có phím số , LED', 'Windows 11 Home Windows 11', '35.6 x 25.1 x 1.65', '72', 1.8, 'Thinkbook', '21CY003FVN', 'Xám', 'Adapter', 0, 0, 8, 0, 1, 1),
(41, 'Laptop MSI Gaming GF63 Thin 11SC (i5-11400H/RAM 8GB/GTX 1650/512GB SSD/ Windows 11)', '[\"msi.webp\", \"msi1.webp\", \"msi2.webp\"]', 12, 32990000, NULL, 'Đang cập nhật...', 'MSI', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-11400H ( 2.7 GHz - 4.5 GHz / 12MB / 6 nhân, 12 luồng ) i5-11400H', 'Core i5', 'Intel UHD Graphics', 'DDR4 2666MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS HD webcam', '512GB SSD M.2 NVMe', '1 x 2.5\" SATA , 1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C , 3 x USB 3.2 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , không phím số , LED', 'Windows 11 Home Windows 11', '35.9 x 25.4 x 2.17', '3 cell 51', 1.9, 'Modern', '665VN', 'Đen', 'Adapter 120W, dây nguồn. Balô và Chuột', 0, 0, 8, 0, 0, 1),
(42, 'Laptop MSI Modern 14 C11M (i3-1115G4/RAM 8GB/512GB SSD/ Win 11)', '[\"c11m.webp\", \"c11m1.webp\", \"c11m2.webp\"]', 12, 28833480, 18, 'Đang cập nhật...', 'MSI', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Core i3 , Intel Core thế hệ thứ 11', 'Intel Core i3-1115G4 ( 3.0 GHz - 4.10 GHz / 6MB / 2 nhân, 4 luồng ) i3-1115G4', 'Core i3', 'Onboard Intel UHD Graphics', 'DDR4 3200MHz', '14\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , Màn hình chống lóa , HD webcam', '512GB SSD M.2 NVMe', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort , 1 x USB 3.2 , 2 x USB 2.0 , 1 x micro SD card slot , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , không phím số , LED', 'Windows 11 Home Windows 11', '31.99 x 22.3 x 1.935', '3 cell 39', 1, 'Modern', '011VN', 'Đen', 'Adapter', 0, 0, 8, 0, 1, 1),
(43, 'Laptop MSI GF66 12UCK-804VN (i7-12650H/RAM 8GB/512GB SSD/ Windows 11)', '[\"12uck.webp\", \"12uck1.webp\", \"12uck2.webp\"]', 12, 142761480, 0, 'Đang cập nhật...', 'MSI', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Core i7 , Intel Core thế hệ thứ 12', 'Intel Core i7-12650H ( 2.3 GHz - 4.7 GHz / 24MB / 10 nhân, 16 luồng ) i7-12650H', 'Core i7', 'Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 144Hz , HD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C , 2 x USB 3.2 , 1 x USB 2.0 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , có phím số , RGB', 'Windows 11 Home SL Windows 11', '35.9 x 25.9 x 2.49', '3 cell 53', 2, 'Katana GF', 'NH.QJSSV.002', 'Đen', 'Adapter', 0, 0, 16, 0, 0, 1),
(44, 'Laptop MSI Katana 15 B13VEK (i7-13620H/RAM 8GB/512GB SSD/ Windows 11)', '[\"katana.webp\", \"katana1.webp\", \"katana2.webp\"]', 12, 27490000, 5, 'Đang cập nhật...', 'MSI', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 13', 'Intel Core i7-13620H ( 2.4 GHz - 4.9GHz / 24MB / 10 nhân, 16 luồng ) i7-13620H', 'Core i7', 'Intel UHD Graphics', 'DDR5 5200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 144Hz , không cảm ứng , HD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort , 2 x USB 3.2 , 1 x USB 2.0 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '35.9 x 25.9 x 2.49', '3 cell 53', 2.2, 'Katana', '252VN', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(45, 'Laptop MSI Modern 15 A10M (i5-10210U/RAM 8GB/512GB SSD/ Windows 10)', '[\"a10m.webp\", \"a10m1.webp\", \"a10m2.webp\"]', 12, 36990000, NULL, 'Laptop MSI Modern 15 A10M 667VN là chiếc laptop thời trang với kiểu dáng nhỏ gọn mang trong mình sức mạnh từ bộ vi xử lý i5 thuộc thế hệ thứ 10 cho khả năng xử lý công việc, giải trí tiện ích đáng kinh ngạc.', 'MSI', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 10', 'Intel Core i5-10210U ( 2.1 GHz - 4.2 GHz / 6MB / 4 nhân, 8 luồng ) i5-10210U', 'Core i5', 'Onboard Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , HD webcam', '512GB SSD M.2 NVMe', '1 x M.2 SATA/NVMe', 'M.2 SATA/NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort , 3 x USB 3.2 , 1 x micro SD card slot , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , LED', 'Windows 10 Home 64-bit Windows 10', '35.7 x 23.4 x 1.89', '3 cell 52', 1.6, 'Modern', '667VN', 'Xám', 'Adapter', 0, 0, 16, 0, 0, 1),
(46, 'Laptop Huawei Matebook 14 KLVD (i5-1135G7/RAM 8GB/512GB SSD/ Windows 11)', '[\"klvd.webp\", \"klvd1.webp\", \"klvd2.webp\"]', 12, 50891880, 5, 'Laptop Huawei Matebook 14 KLVD WDH9 sở hữu thiết kế mỏng, nhẹ nhàng và hướng đến sự nhanh chóng với hiệu năng mạnh mẽ. Màn hình 2k mang lại trải nghiệm hình ảnh sống động, đây sẽ là chiếc máy phù hợp cho làm việc văn phòng, học tập hoặc đáp ứng các nhu cầu giải trí khác', 'Huawei', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nhân, 8 luồng ) i5-1135G7', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'DDR4 2667MHz', '14\" ( 2160 x 1440 ) Quad HD (2K) IPS không cảm ứng , HD webcam', '512GB SSD M.2 NVMe', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , không phím số , LED', 'Windows 11 Home SL Windows 11', '30.75 x 22.38 x 1.59', '4 cell 56', 1, 'Matebook', 'WDH9', 'Xám', 'Adapter', 0, 0, 16, 0, 0, 1);
INSERT INTO `sanpham` (`ma_san_pham`, `ten_san_pham`, `hinh_anh`, `bao_hanh`, `gia_goc`, `giam_gia`, `mo_ta_san_pham`, `thuong_hieu`, `created_at`, `updated_at`, `the_he_cpu`, `cpu`, `series_cpu`, `chip_do_hoa_roi`, `ten_ram`, `man_hinh`, `luu_tru`, `so_cong_luu_tru_toi_da`, `kieu_khe_m2_ho_tro`, `cong_xuat_hinh`, `cong_ket_noi`, `ket_noi_khong_day`, `ban_phim`, `he_dieu_hanh`, `kich_thuoc`, `pin`, `khoi_luong`, `series_laptop`, `part_number`, `mau_sac`, `phu_kien_di_kem`, `den_led`, `man_hinh_cam_ung`, `dung_luong_ram`, `so_luong_da_ban`, `noi_bat`, `hien_thi`) VALUES
(47, 'Laptop Huawei Matebook D14 (i3-1115G4/RAM 8GB/256GB SSD/ Windows 11)', '[\"d14.webp\", \"d141.webp\", \"d142.webp\"]', 12, 42165480, 0, 'Đang cập nhật...', 'Huawei', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Core i3 , Intel Core thế hệ thứ 11', 'Intel Core i3-1115G4 ( 3.0 GHz - 4.10 GHz / 6MB / 2 nhân, 4 luồng ) i3-1115G4', 'Core i3', 'Onboard Intel Iris Xe Graphics', 'LPDDR4X 2667MHz', '14\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , Màn hình chống lóa , HD webcam', '256GB SSD M.2 NVMe', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C , 1 x USB 3.2 , 1 x USB 2.0 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'không phím số , LED', 'Windows 11 Home Windows 11', '31.29 x 21.40 x 1.79', '56', 1, 'Matebook', 'NbD-WDI9', 'Bạc', 'Adapter', 0, 0, 4, 0, 0, 1),
(48, 'MacBook Air 2020 13.3 inch MGN63SA/A (M1/8GB/SSD256GB)', '[\"sa.webp\", \"sa1.webp\", \"sa2.webp\"]', 12, 16360788, 0, 'Các dòng sản phẩm của thương hiệu Apple luôn được đánh giá cao về chất lượng cũng như về hình dáng, mẫu mã. Nếu bạn đang cần một chiếc laptop mỏng, nhẹ, nhỏ gọn để tiện mang theo bên mình thì lựa chọn Laptop APPLE MacBook Air 2020 MGN63SA/A là vô cùng hợp lý.', 'Macbook', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Apple M', 'Apple M1 chip Apple M1', 'Apple M1', 'Onboard', 'LPDDR4 3733MHz', '13.3\" ( 2560 x 1600 ) IPS không cảm ứng , HD webcam', '256GB SSD', '1 x M.2 NVMe', 'M.2 SATA/NVMe', '1 x HDMI', '2 x Thunderbolt 3 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.0', 'thường , không phím số , LED', 'macOS', '30.41 x 21.24 x 0.41 ~ 1.61', '4 cell 48', 1, 'Macbook Air', 'MGN63SA/A', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(49, 'MacBook Air 2022 13.6 inch MLY33SA/A (M2/ 8GB/ SSD 256GB)', '[\"33.webp\", \"331.webp\", \"332.webp\"]', 12, 20591880, 12, 'Đang cập nhật...', 'Macbook', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Apple M', 'Apple M2 chip Apple M2', 'Apple M2', 'Onboard', 'LPDDR4 3733MHz', '13.6\" ( 2560 x 1664 ) IPS HD webcam', '256GB SSD', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x Thunderbolt , 1 x 3.5 mm', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.0', 'thường , không phím số , LED', 'macOS', '30.41 x 21.5 x 1.13', '48', 1, 'Macbook Air', 'MLY33SA/A', 'Midnight', 'Adapter', 0, 0, 32, 0, 0, 1),
(50, 'MacBook Pro 2020 13.3 inch MYDC2SA/A (M1/8GB/SSD512GB)', '[\"my.webp\", \"my1.webp\", \"my2.webp\"]', 12, 35388000, 15, 'Laptop APPLE MacBook Pro 2020 MYDC2SA/A là dòng máy tính xách tay đến từ thương hiệu công nghệ hàng đầu thế giới, sở hữu chip Apple M1 tiên tiến với hiệu năng ấn tượng, ổ cứng lưu trữ 512GB SSD cùng màn hình 13.3 inches IPS, sản phẩm là sự lựa chọn tuyệt vời cho những khách hàng ưa chuộng sự đẳng cấp.', 'Macbook', '2023-04-25 08:04:35', '2023-05-07 13:18:34', 'Apple M', 'Apple M1 chip Apple M1', 'Apple M1', 'Onboard', 'LPDDR4 3733MHz', '13.3\" ( 2560 x 1600 ) IPS không cảm ứng , HD webcam', '512GB SSD', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x Thunderbolt 3 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.0', 'thường , không phím số , không đèn', 'macOS', '21.24 x 30.41 x 1.56', '4 cell 57', 1, 'MacBook Pro', 'MYDC2SA/A', 'Bạc', 'Adapter', 0, 0, 16, 0, 0, 1),
(51, 'MacBook Air 2022 13.6 inch MLXW3SA/A (M2/ 8GB/ SSD 256GB)', '[\"3sa.webp\", \"3sa1.webp\", \"3sa2.webp\"]', 24, 25990000, 21, 'Đang cập nhật...', 'Macbook', '2023-04-25 08:04:35', NULL, 'Apple M', 'Apple M2 chip Apple M2', 'Apple M2', 'Onboard', 'LPDDR4 3733MHz', '13.6\" ( 2560 x 1664 ) IPS HD webcam', '256GB SSD', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x Thunderbolt , 1 x 3.5 mm', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.0', 'thường , không phím số , LED', 'macOS', '30.41 x 21.5 x 1.13', '4 cell 57', 1.3, 'Macbook Air', 'MLXW3SA/A', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(52, 'MacBook Pro 2022 13.3 inch MNEJ3SA/A (M2/ 8GB/ SSD 512GB)', '[\"mn.webp\", \"mn1.webp\"]', 24, 26990000, 15, 'MacBook Pro M2 - MNEJ3SA/A là là một sản phẩm cao cấp đến từ thương hiệu nổi tiếng hàng đầu Apple. Chiếc laptop này sở hữu thiết kế hiện đại, màn hình hiển thị sắc nét, hiệu năng vượt trội, đây hứa hẹn sẽ là một sản phẩm mang đến cho bạn những trải nghiệm tuyệt vời, phù hợp với nhiều đối tượng khách hành khác nhau.', 'Macbook', '2023-04-25 08:04:35', NULL, 'Apple M', 'Apple M2 chip Apple M2', 'Apple M2', 'Onboard', 'LPDDR4 3733MHz', '13.3\" ( 2560 x 1600 ) không cảm ứng , HD webcam', '256GB SSD', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x Thunderbolt , 1 x 3.5 mm', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , không phím số , không đèn', 'macOS', '30.4 x 21.2 x 1.5', '4 cell 56', 1.4, 'MacBook Pro', 'MNEJ3SA/A', 'Xám', 'Adapter', 0, 0, 16, 0, 0, 1),
(53, 'MacBook Pro 2018 13.3 inch MR9U2', '[\"mr.webp\", \"mr1.webp\"]', 24, 17230000, NULL, 'Đang cập nhật...', 'Macbook', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 8', 'Intel Core i5 ( 1.6 GHz - 3.6 GHz / 4MB / 2 nhân, 4 luồng )', 'Core i5', 'Onboard Intel HD Graphics', 'LPDDR4 3733MHz', '13.3\" ( 1920 x 1080 ) Full HD Màn hình chống lóa , HD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x micro HDMI', '1 x USB 3.2 , 2 x Thunderbolt 4 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.0', 'thường , không phím số , LED', 'macOS', '30.90 x 21.06 x 1.69', '4 cell 66', 1.4, 'ExpertBook', 'MR9U2', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(54, 'MacBook Air 2019 MVFN2SA/A', '[\"mv.webp\", \"mv1.webp\", \"mv2.webp\"]', 24, 17490000, NULL, 'Laptop MacBook Air 2019 MVFN2SA/A được làm từ hợp kim nhôm do Apple tạo ra mang lại sức mạnh, độ bền và hoàn thiện đến mức hoàn hảo - mà không cần khai thác bất kỳ nhôm mới nào từ trái đất. Chất liệu được thiết kế từ việc sử dụng các mảnh nhôm tái chế được chế tạo lại đến mức nguyên tử. Kết quả là một khung vỏ vô cùng đẹp và mạnh mẽ như bất kỳ thứ gì chúng ta đã tạo ra, và đây là chiếc Mac \"xanh\" nhất từng được tạo ra.', 'Macbook', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 8', 'Intel Core i5 ( 1.6 GHz - 3.6 GHz / 4MB / 2 nhân, 4 luồng )', 'Core i5', 'Onboard Intel UHD Graphics', 'DDR3L 2133MHz', '13.3\" ( 2560 x 1600 ) IPS không cảm ứng , HD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x Thunderbolt 3 , 1 x 3.5 mm', 'WiFi 802.11ac , Bluetooth 4.2', 'thường , không phím số , LED', 'macOS', '30.4 x 21.2 x 1.6', '50', 1.3, 'Macbook Air', 'MVFN2', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(55, 'Laptop APPLE MacBook Pro 14\" (Apple M2/RAM 16GB/512GB SSD/ macOS)', '[\"m2.webp\", \"m21.webp\"]', 24, 125000000, 8, 'Đang cập nhật...', 'Macbook', '2023-04-25 08:04:35', NULL, 'Apple M', 'Apple M2 chip Apple M2', 'Apple M2', 'Onboard', 'LPDDR4 3733MHz', '14.2\" ( 3024 x 1964 ) 120Hz , không cảm ứng , HD webcam', '2TB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '3 x Thunderbolt 4 , 1 x SD card slot , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , không phím số , LED', 'macOS', '31.26 x 22.12 x 1.55', '4 cell 90', 1.6, 'MacBook Pro', 'MPHH3SA/A', 'Bạc', 'Adapter', 0, 0, 16, 0, 0, 1),
(56, 'MacBook Pro 2019 16 inch MVVL2SA/A', '[\"vl.webp\", \"vl1.webp\", \"vl2.webp\"]', 24, 22990000, 14, 'MacBook Pro mới có màn hình Retina 16 inch tuyệt đẹp - màn hình Retina lớn nhất từng được trang bị trên một máy tính xách tay Mac. Màn hình có độ sáng 500 nits và tỷ lệ tương phản cao khiến cho các điểm ảnh hiển thị nổi bật và mang lại màu trắng sáng, đồng thời mang lại màu đen sâu nhờ sự căn chỉnh hình ảnh chính xác của các phân tử tinh thể lỏng. Và với gam màu rộng P3 cho phép hình ảnh và video luôn chân thực, rực rỡ, sống động. Vì vậy, bất kể bạn ở đâu, bạn sẽ giải quyết công việc của mình dưới ánh sáng tốt nhất có thể.', 'Macbook', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 9', 'Intel Core i7', 'Core i7', 'Intel UHD Graphics', 'LPDDR4 3733MHz', '16\" ( 3072 x 1920 ) IPS không cảm ứng , HD webcam', '512GB SSD M.2 NVMe', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '4 x Thunderbolt 3 , 1 x 3.5 mm', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , không phím số , LED', 'macOS', '35.79 x 24.59 x 1.62', '100', 2, 'MacBook Pro', 'MVVL2SA/A', 'Bạc', 'Adapter', 0, 0, 8, 0, 0, 1),
(57, 'MacBook Pro 2021 14 inch MKGR3SA/A (M1 Pro/16GB/SSD512GB)', '[\"mk.webp\", \"mk1.webp\", \"mk2.webp\"]', 12, 22990000, 0, 'Laptop APPLE MacBook Pro 2021 14 inch MKGR3SA/A là sản phẩm MacBook mới nhất và mạnh mẽ nhất kế thừa những tinh hoa từ đời MacBook tốt nhất cùng với những nâng cấp. Hiệu năng nó mang lại sẽ đủ sức để có thể giải quyết được những công việc multimedia nặng nhất hiện nay.', 'Macbook', '2023-04-25 08:04:35', NULL, 'Apple M', 'Apple M1 Pro chip Apple M1 Pro', 'Apple M1 Pro', 'Onboard', 'LPDDR4 3733MHz', '14\" ( 3024 x 1964 ) không cảm ứng , HD webcam', '512GB SSD', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '3 x Thunderbolt 4 , Có , 1 x 3.5 mm', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.0', 'thường , có phím số', 'macOS', '31.26 x 22.12 x 1.55', '70', 1.6, 'MacBook Pro', 'MKGR3SA/A', 'Bạc', 'Adapter, dây nguồn, HDSD,…', 0, 0, 16, 0, 0, 1),
(58, 'Laptop APPLE MacBook Pro 14\" (Apple M1 Max/RAM 32GB/1TB SSD/ macOS)', '[\"m1.webp\", \"m11.webp\", \"m12.webp\"]', 12, 109990000, 0, 'Laptop APPLE MacBook Pro 14 inch Z15H000VQ là một trong những dòng laptop cao cấp đến từ thương hiệu Apple đang được người dùng yêu thích. Với thiết kế nhỏ gọn nhưng sang trọng, đẳng cấp và hiệu năng hoạt động vượt trội nhờ chip Apple M1 Max và hệ điều hành macOS. Hứa hẹn sẽ chinh phục người dùng ngay cái nhìn đầu tiên.', 'Macbook', '2023-04-25 08:04:35', NULL, 'Apple M', 'Apple M1 Max chip Apple M1 Max', 'Apple M1 Max', 'Onboard', 'LPDDR4 3733MHz', '14\" ( 3024 x 1964 ) không cảm ứng , HD webcam', '1TB SSD', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '3 x Thunderbolt 4 , 1 x SD card slot , 1 x 3.5 mm', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.0', 'thường , không phím số', 'macOS', '31.26 x 22.12 x 1.55', '4 cell', 1.6, 'MacBook Pro', 'Z15H000VQ', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(59, 'MacBook Air 2020 MVH42SA/A (i5/512GB)', '[\"vh.webp\", \"vh1.webp\"]', 24, 24890000, 11, 'Đang cập nhật...', 'Macbook', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 8', 'Intel Core i5 ( 1.6 GHz - 3.6 GHz / 4MB / 2 nhân, 4 luồng )', 'Core i5', 'Onboard Intel Iris Plus Graphics', 'LPDDR4 3733MHz', '13.3\" ( 2560 x 1600 ) IPS không cảm ứng , HD webcam', '512GB SSD', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x Thunderbolt 3 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , không phím số , LED', 'macOS', '30.41 x 21.24 x 1.61', '4 cell 54', 1.3, 'Macbook Air', 'MVH42SA/A', 'Bạc', 'Adapter', 0, 0, 8, 0, 0, 1),
(60, 'MacBook Pro 2018 13.3 inch MR9R2', '[\"r9.webp\", \"r91.webp\"]', 12, 49890000, 18, 'Đang cập nhật...', 'Macbook', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 8', 'Intel Core i5 ( 1.6 GHz - 3.6 GHz / 4MB / 2 nhân, 4 luồng )', 'Core i5', 'Onboard', 'LPDDR4 3733MHz', '13.3\" ( 2560 x 1600 ) không cảm ứng , HD webcam', '512GB SSD M.2 NVMe', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '3 x Thunderbolt 4 , 1 x SD card slot , 1 x 3.5 mm', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , không phím số , không đèn', 'macOS', '1.49 x 30.41 x 21.24', '4 cell 54', 1.3, 'MacBook Pro', 'MR9R2', 'Bạc', 'Adapter', 0, 0, 16, 0, 0, 1),
(62, '12', '[\"cx.webp\", \"bx.webp\", \"ax.webp\"]', 12, 12, 0, '121', 'Acer', '1970-01-20 05:38:04', NULL, '12', '12', '12', '12', '12', '12', '12', '12', '12', '12', '12', '12', '12', '12', '12', '12', 12, '12', '12', '12', '12', 0, 1, 12, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

CREATE TABLE `taikhoan` (
  `ma_tai_khoan` int NOT NULL,
  `ten_dang_nhap` varchar(45) NOT NULL,
  `ma_nhom_quyen` int DEFAULT NULL,
  `mat_khau` longtext,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`ma_tai_khoan`, `ten_dang_nhap`, `ma_nhom_quyen`, `mat_khau`, `created_at`) VALUES
(1, 'bttan', 0, '$2y$10$ydoh4aF9R11V/0cJYqD0cuDj.7EhWNpXeObNAE0tr74hdDub3xmZe', '2023-03-24 11:32:15'),
(2, 'bttan1', 0, '$2y$10$npvkuJLXKjOKDFz3vgV2OOUKyopzReaY5.1wpHqQy49oBtwgPZD1.', '2023-03-24 11:38:09'),
(3, 'hung', 1, '$2y$10$T4R2dSyO2owZoX29PUEMDe2TLHgTcRH/WD.Duw3gTGxT5200hzkdq', '2023-04-02 10:08:23'),
(4, 'lam', 6, '$2y$10$ydoh4aF9R11V/0cJYqD0cuDj.7EhWNpXeObNAE0tr74hdDub3xmZe', '2023-04-06 04:35:50'),
(6, 'huy', 12, '$2y$10$ydoh4aF9R11V/0cJYqD0cuDj.7EhWNpXeObNAE0tr74hdDub3xmZe', '2023-04-07 03:59:03'),
(7, 'hieu', 11, '$2y$10$ydoh4aF9R11V/0cJYqD0cuDj.7EhWNpXeObNAE0tr74hdDub3xmZe', '2023-04-08 01:59:07'),
(11, 'test', 0, '$2y$10$jfbwaz3aCzF.R7Su0uWJ7OqnOw6.biuvqUZV0gXk0lqsTWzJqaD.S', '2023-05-07 02:16:41');

-- --------------------------------------------------------

--
-- Table structure for table `thuonghieu`
--

CREATE TABLE `thuonghieu` (
  `ma_thuong_hieu` int NOT NULL,
  `ten_thuong_hieu` varchar(45) NOT NULL,
  `icon` longtext NOT NULL,
  `hinh_anh` longtext NOT NULL,
  `hien_thi` tinyint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `thuonghieu`
--

INSERT INTO `thuonghieu` (`ma_thuong_hieu`, `ten_thuong_hieu`, `icon`, `hinh_anh`, `hien_thi`) VALUES
(1, 'Lenovo', 'lenovo.svg', 'lenovo.webp', 1),
(2, 'Asus', 'asus.svg', 'asus.webp', 1),
(3, 'Macbook', 'macbook.svg', 'hp.webp', 1),
(5, 'HP', 'hp.svg', 'macbook-pro.png', 1),
(6, 'Acer', 'acer.svg', 'acer.jpg', 1),
(7, 'Huawei', 'huawei.svg', 'huawei.jpg', 1),
(8, 'Dell', 'dell.svg', 'dell.jpg', 1),
(9, 'LG', 'lg.svg', 'lg.jpg', 1),
(11, 'Huy', 'Avita Medical.svg', 'laptop-avita-a.jpg', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `baohanh`
--
ALTER TABLE `baohanh`
  ADD PRIMARY KEY (`ma_bao_hanh`);

--
-- Indexes for table `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`ma_chi_tiet_san_pham`,`ma_don_hang`),
  ADD KEY `pk_ma_don_hang_idx` (`ma_don_hang`);

--
-- Indexes for table `chitietphieunhap`
--
ALTER TABLE `chitietphieunhap`
  ADD PRIMARY KEY (`ma_san_pham`,`ma_phieu_nhap`),
  ADD KEY `pk_ctpn_pn_idx` (`ma_phieu_nhap`);

--
-- Indexes for table `chitietquyenhang`
--
ALTER TABLE `chitietquyenhang`
  ADD PRIMARY KEY (`ma_nhom_quyen`,`ma_quyen_hang`,`ma_chuc_nang`);

--
-- Indexes for table `chitietsanpham`
--
ALTER TABLE `chitietsanpham`
  ADD PRIMARY KEY (`ma_chi_tiet_san_pham`);

--
-- Indexes for table `chucnang`
--
ALTER TABLE `chucnang`
  ADD PRIMARY KEY (`ma_chuc_nang`);

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`ma_don_hang`);

--
-- Indexes for table `hinhanh`
--
ALTER TABLE `hinhanh`
  ADD PRIMARY KEY (`ma_hinh_anh`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`ma_khach_hang`,`so_dien_thoai`);

--
-- Indexes for table `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`ma_nha_cung_cap`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`ma_nhan_vien`);

--
-- Indexes for table `nhomquyen`
--
ALTER TABLE `nhomquyen`
  ADD PRIMARY KEY (`ma_nhom_quyen`);

--
-- Indexes for table `phieunhap`
--
ALTER TABLE `phieunhap`
  ADD PRIMARY KEY (`ma_phieu_nhap`);

--
-- Indexes for table `quyenhang`
--
ALTER TABLE `quyenhang`
  ADD PRIMARY KEY (`ma_quyen_hang`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`ma_san_pham`);

--
-- Indexes for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`ma_tai_khoan`,`ten_dang_nhap`);

--
-- Indexes for table `thuonghieu`
--
ALTER TABLE `thuonghieu`
  ADD PRIMARY KEY (`ma_thuong_hieu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `baohanh`
--
ALTER TABLE `baohanh`
  MODIFY `ma_bao_hanh` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `chucnang`
--
ALTER TABLE `chucnang`
  MODIFY `ma_chuc_nang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `ma_don_hang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `hinhanh`
--
ALTER TABLE `hinhanh`
  MODIFY `ma_hinh_anh` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `nhacungcap`
--
ALTER TABLE `nhacungcap`
  MODIFY `ma_nha_cung_cap` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nhomquyen`
--
ALTER TABLE `nhomquyen`
  MODIFY `ma_nhom_quyen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `phieunhap`
--
ALTER TABLE `phieunhap`
  MODIFY `ma_phieu_nhap` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `quyenhang`
--
ALTER TABLE `quyenhang`
  MODIFY `ma_quyen_hang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `ma_san_pham` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `ma_tai_khoan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `thuonghieu`
--
ALTER TABLE `thuonghieu`
  MODIFY `ma_thuong_hieu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `pk_ma_don_hang` FOREIGN KEY (`ma_don_hang`) REFERENCES `donhang` (`ma_don_hang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chitietphieunhap`
--
ALTER TABLE `chitietphieunhap`
  ADD CONSTRAINT `pk_ctpn_pn` FOREIGN KEY (`ma_phieu_nhap`) REFERENCES `phieunhap` (`ma_phieu_nhap`),
  ADD CONSTRAINT `pk_ctpn_sp` FOREIGN KEY (`ma_san_pham`) REFERENCES `sanpham` (`ma_san_pham`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
