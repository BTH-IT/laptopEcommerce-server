-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2023 at 09:54 AM
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
  `ngay_het_han` timestamp NULL DEFAULT NULL,
  `hien_thi` tinyint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `baohanh`
--

INSERT INTO `baohanh` (`ma_bao_hanh`, `ma_chi_tiet_san_pham`, `ma_khach_hang`, `ngay_lap`, `ngay_het_han`, `hien_thi`) VALUES
(2, '168042680612', 'bttan', '2023-04-03 09:23:50', '2025-04-03 09:23:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
<<<<<<< HEAD
  `ma_san_pham` int DEFAULT NULL,
=======
  `ma_san_pham` int NOT NULL,
>>>>>>> fd5fad15f18963627a066fbc01c5653cfee71d02
  `ma_chi_tiet_san_pham` varchar(256) NOT NULL,
  `ma_don_hang` int NOT NULL,
  `don_gia` double DEFAULT NULL,
  `giam_gia_san_pham` int DEFAULT '0',
  `thoi_gian_bao_hanh` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `chitiethoadon`
--

<<<<<<< HEAD
INSERT INTO `chitiethoadon` (`ma_san_pham`, `ma_chi_tiet_san_pham`, `ma_don_hang`, `don_gia`, `giam_gia_san_pham`, `thoi_gian_bao_hanh`) VALUES
(1, '168042680612', 148, 11000000, 10, 24),
(1, '168042730413', 149, 11000000, 10, 24),
(1, '168044932914', 150, 11000000, 10, 24),
(1, '1680449329612', 156, 15840000, 10, 24),
(1, '16804493296121', 156, 15840000, 10, 24),
(1, '168044932962', 156, 15840000, 10, 24);
=======
INSERT INTO `chitiethoadon` (`ma_san_pham`, `ma_chi_tiet_san_pham`, `ma_don_hang`, `so_luong_da_mua`, `don_gia`, `giam_gia_san_pham`, `thoi_gian_bao_hanh`) VALUES
(1, 168042680612, 126, 1, 2000000, 10, 24);
>>>>>>> fd5fad15f18963627a066fbc01c5653cfee71d02

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
(1, 2, 1, 11000000),
(1, 3, 1, 11000000),
(1, 4, 2, 13200000),
(1, 6, 1, 10000000),
(2, 2, 1, 22000000),
(2, 3, 2, 22000000),
(2, 4, 3, 26400000),
(2, 6, 1, 31680000),
(3, 2, 1, 33000000),
(7, 5, 2, 80000000),
(8, 5, 2, 90000000);

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
(0, 9, 3, 0),
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
(6, 3, 1, 0),
(6, 3, 2, 0),
(6, 3, 3, 0),
(6, 3, 4, 0),
(6, 4, 1, 0),
(6, 4, 2, 0),
(6, 4, 3, 0),
(6, 4, 4, 0),
(6, 5, 1, 0),
(6, 5, 2, 0),
(6, 5, 3, 0),
(6, 5, 4, 0),
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
(11, 12, 4, 0);

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
('12312', 2),
('123131233', 2),
('12322', 4),
('12323123', 2),
('1234321', 3),
('132123', 3),
('168042665910', 2),
('168042679012', 2),
('168044932913', 2),
('16804493296', 3),
('1680449329623', 1),
('16804493296231', 1),
('16804493296a', 1),
('168076695112', 2),
('16807669518', 1),
('168076725213', 2),
('16807672529', 1),
('16807683761', 7),
('168110773010', 1),
('168110773014', 2),
('21323', 4),
('222', 2),
('3221', 4),
('333', 2),
('333334', 4),
('42321', 4),
('444', 2),
('555', 2),
('666', 2),
('777', 3),
('888', 3),
('999', 3);

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
(148, 'bttan', 'hung', 'postpaid', '2023-04-03 09:23:36', 'hoàn thành', 1),
(149, 'bttan', '', 'postpaid', '2023-04-05 01:24:16', 'chờ xử lý', 1),
(150, 'bttan', NULL, 'postpaid', '2023-04-13 02:43:56', 'chờ xử lý', 1),
(151, 'bttan', NULL, 'postpaid', '2023-04-13 02:50:40', 'chờ xử lý', 1),
(152, 'bttan', NULL, 'postpaid', '2023-04-13 02:50:41', 'chờ xử lý', 1),
(153, 'bttan', NULL, 'postpaid', '2023-04-13 02:50:42', 'chờ xử lý', 1),
(154, 'bttan', NULL, 'postpaid', '2023-04-13 02:50:42', 'chờ xử lý', 1),
(155, 'bttan', NULL, 'postpaid', '2023-04-13 02:50:42', 'chờ xử lý', 1),
(156, 'bttan', NULL, 'postpaid', '2023-04-13 02:51:23', 'chờ xử lý', 1);

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
(2, '1.jpg'),
(3, '1.jpg'),
(4, '1.jpg'),
(5, 'IMG_6803.JPG'),
(6, '2.jpg'),
(7, '2.jpg'),
(8, '2.jpg'),
(9, 'lenovo.webp'),
(10, 'lenovo.webp'),
(11, '2.webp'),
(12, '3.webp'),
(13, '4.webp'),
(14, '1.webp'),
(15, '4.webp'),
(16, '2.webp'),
(17, '1.webp'),
(18, '3.webp'),
(19, '4.webp'),
(20, '2.webp'),
(21, '3.webp'),
(22, '1.webp'),
(23, '4.webp'),
(24, '3.webp'),
(25, '1.webp'),
(26, '2.webp'),
(27, '4.webp'),
(28, '3.webp'),
(29, '2.webp'),
(30, '1.webp'),
(31, '4.webp'),
(32, '3.webp'),
(33, '2.webp'),
(34, '1.webp'),
(35, '4.webp'),
(36, '3.webp'),
(37, '2.webp'),
(38, '1.webp'),
(39, '4.webp'),
(40, '3.webp'),
(41, '2.webp'),
(42, '1.webp'),
(43, '4.webp'),
(44, '3.webp'),
(45, '2.webp'),
(46, '1.webp'),
(47, '4.webp'),
(48, '3.webp'),
(49, '2.webp'),
(50, '1.webp'),
(51, '4.webp'),
(52, '3.webp'),
(53, '2.webp'),
(54, '1.webp'),
(55, '4.webp'),
(56, '3.webp'),
(57, '2.webp'),
(58, '1.webp'),
(59, '4.webp'),
(60, '3.webp'),
(61, '1.webp'),
(62, '2.webp'),
(63, '4.webp'),
(64, '3.webp'),
(65, '4.webp'),
(66, '3.webp');

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `ma_khach_hang` varchar(256) NOT NULL,
  `ten_khach_hang` varchar(256) DEFAULT NULL,
  `ngay_sinh` datetime DEFAULT NULL,
  `gioi_tinh` tinyint DEFAULT NULL,
  `so_dien_thoai` varchar(45) DEFAULT NULL,
  `dia_chi` varchar(256) DEFAULT NULL,
  `avatar` longtext,
  `hien_thi` tinyint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`ma_khach_hang`, `ten_khach_hang`, `ngay_sinh`, `gioi_tinh`, `so_dien_thoai`, `dia_chi`, `avatar`, `hien_thi`) VALUES
('bttan', '123123', '2023-03-01 00:00:00', 1, '123123', '123123', 'avatar.jpg', 1),
('bttan1', '123123', '2023-03-02 00:00:00', 1, '123123', '123123', 'avatar.jpg', 1);

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
(1, 'Phong Vu', '0707007009', '123', 1),
(2, 'GearVN', '0890989090', '123', 1),
(3, 'Cellphone', '0123013010', '231', 1),
(4, 'An ', '0706092403', 'ha noi 1945', 1);

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
  `muc_luong` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`ma_nhan_vien`, `ten_nhan_vien`, `so_dien_thoai`, `ngay_sinh`, `gioi_tinh`, `muc_luong`) VALUES
('hieu', '123123', '123123', '2023-04-04', 1, 1000000),
('hung', 'bth2', '123', '2003-03-01', 1, 20000000),
('huy', 'Huy abc', '0706092403', '2023-04-01', 1, 1000000),
('lam', 'lam ne', '0987654321', '2023-04-06', 1, 10000000);

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
(1, 'quản lý', 'trùm', 1, 0),
(6, 'nhân viên', 'test', 1, 0),
(11, 'abc', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phieunhap`
--

CREATE TABLE `phieunhap` (
  `ma_phieu_nhap` int NOT NULL,
  `ma_nha_cung_cap` int NOT NULL,
  `ma_nhan_vien` varchar(256) NOT NULL,
  `ngay_lap` timestamp NOT NULL,
  `hien_thi` tinyint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `phieunhap`
--

INSERT INTO `phieunhap` (`ma_phieu_nhap`, `ma_nha_cung_cap`, `ma_nhan_vien`, `ngay_lap`, `hien_thi`) VALUES
(1, 1, 'hung', '2023-03-07 10:17:58', 0),
(2, 1, 'hung', '2023-04-02 10:28:49', 1),
(3, 4, 'hung', '2023-04-06 02:42:30', 1),
(4, 1, 'hung', '2023-04-06 02:47:31', 1),
(5, 2, 'hung', '2023-04-06 03:06:16', 1),
(6, 2, 'hung', '2023-04-10 01:22:10', 1);

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
  `mo_ta_san_pham` longtext NOT NULL,
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
  `den_led` varchar(512) DEFAULT NULL,
  `man_hinh_cam_ung` tinyint DEFAULT NULL,
  `dung_luong_ram` int DEFAULT NULL,
  `so_luong_da_ban` int NOT NULL DEFAULT '0',
  `noi_bat` tinyint DEFAULT '0',
  `hien_thi` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`ma_san_pham`, `ten_san_pham`, `hinh_anh`, `bao_hanh`, `gia_goc`, `giam_gia`, `mo_ta_san_pham`, `thuong_hieu`, `created_at`, `updated_at`, `the_he_cpu`, `cpu`, `series_cpu`, `chip_do_hoa_roi`, `ten_ram`, `man_hinh`, `luu_tru`, `so_cong_luu_tru_toi_da`, `kieu_khe_m2_ho_tro`, `cong_xuat_hinh`, `cong_ket_noi`, `ket_noi_khong_day`, `ban_phim`, `he_dieu_hanh`, `kich_thuoc`, `pin`, `khoi_luong`, `series_laptop`, `part_number`, `mau_sac`, `phu_kien_di_kem`, `den_led`, `man_hinh_cam_ung`, `dung_luong_ram`, `so_luong_da_ban`, `noi_bat`, `hien_thi`) VALUES
(1, 'Laptop hưng nè', '[\"4.webp\", \"3.webp\"]', 24, 15840000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', '2023-04-10 01:22:10', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, 1, 1, 1),
(2, '2', '[\"4.webp\", \"3.webp\"]', 24, 34848000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', '2023-04-10 01:22:10', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, 2, 0, 1),
(3, '3', '[\"4.webp\", \"3.webp\"]', 24, 33000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', '2023-04-06 02:40:02', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, 3, 0, 1),
(4, '4', '[\"4.webp\", \"3.webp\"]', 24, 40000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', '2023-04-06 02:40:03', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, 4, 1, 1),
(5, '5', '[\"4.webp\", \"3.webp\"]', 24, 50000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', '2023-03-13 01:18:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, 1),
(6, '6', '[\"4.webp\", \"3.webp\"]', 24, 70000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1),
(7, '7', '[\"4.webp\", \"3.webp\"]', 24, 88000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', '2023-04-06 03:06:16', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, 7, 0, 1),
(8, '8', '[\"4.webp\", \"3.webp\"]', 24, 99000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', '2023-04-06 03:06:16', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, 8, 0, 1),
(9, '9', '[\"4.webp\", \"3.webp\"]', 24, 100000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 1),
(10, '10', '[\"4.webp\", \"3.webp\"]', 24, 110000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', '2023-02-13 01:10:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 1),
(11, '11', '[\"4.webp\", \"3.webp\"]', 24, 120000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 0, 1),
(12, '12', '[\"4.webp\", \"3.webp\"]', 24, 130000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 0, 1),
(13, '13', '[\"4.webp\", \"3.webp\"]', 24, 140000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 0, 1),
(14, '14', '[\"4.webp\", \"3.webp\"]', 24, 150000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 0, 1),
(15, '15', '[\"4.webp\", \"3.webp\"]', 24, 160000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 0, 1),
(16, '16', '[\"4.webp\", \"3.webp\"]', 24, 170000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 0, 1),
(17, '17', '[\"4.webp\", \"3.webp\"]', 24, 180000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 0, 1),
(18, '18', '[\"4.webp\", \"3.webp\"]', 24, 190000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 0, 1),
(19, '19', '[\"4.webp\", \"3.webp\"]', 24, 200000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, 0, 1),
(20, '20', '[\"4.webp\", \"3.webp\"]', 24, 210000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0, 1),
(21, '21', '[\"4.webp\", \"3.webp\"]', 24, 220000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, 0, 1),
(22, '22', '[\"4.webp\", \"3.webp\"]', 24, 230000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', '2023-03-13 01:18:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, 1, 1),
(23, '23', '[\"4.webp\", \"3.webp\"]', 24, 240000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, 0, 1),
(24, '24', '[\"4.webp\", \"3.webp\"]', 24, 250000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 0, 1),
(25, '25', '[\"4.webp\", \"3.webp\"]', 24, 260000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 0, 1),
(26, '26', '[\"4.webp\", \"3.webp\"]', 24, 270000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, 0, 1),
(27, '27', '[\"4.webp\", \"3.webp\"]', 24, 280000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 0, 1),
(28, '28', '[\"4.webp\", \"3.webp\"]', 24, 290000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, 0, 1),
(29, '29', '[\"4.webp\", \"3.webp\"]', 24, 300000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, 0, 1),
(30, '30', '[\"4.webp\", \"3.webp\"]', 24, 310000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 0, 1),
(31, '31', '[\"4.webp\", \"3.webp\"]', 24, 320000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, 0, 1),
(32, '32', '[\"4.webp\", \"3.webp\"]', 24, 330000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, 0, 1),
(33, '33', '[\"4.webp\", \"3.webp\"]', 24, 340000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, 0, 1),
(34, '34', '[\"4.webp\", \"3.webp\"]', 24, 350000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, 0, 1),
(35, '35', '[\"4.webp\", \"3.webp\"]', 24, 360000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, 0, 1),
(36, '36', '[\"4.webp\", \"3.webp\"]', 24, 370000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 0, 1),
(37, '37', '[\"4.webp\", \"3.webp\"]', 24, 380000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, 0, 1),
(38, '38', '[\"4.webp\", \"3.webp\"]', 24, 390000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, 0, 1),
(39, '39', '[\"4.webp\", \"3.webp\"]', 24, 400000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, 0, 1),
(40, '40', '[\"4.webp\", \"3.webp\"]', 24, 410000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 0, 1),
(41, '41', '[\"4.webp\", \"3.webp\"]', 24, 420000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 41, 0, 1),
(42, '42', '[\"4.webp\", \"3.webp\"]', 24, 430000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, 0, 1),
(43, '43', '[\"4.webp\", \"3.webp\"]', 24, 440000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, 0, 1),
(44, '44', '[\"4.webp\", \"3.webp\"]', 24, 450000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44, 0, 1),
(45, '45', '[\"4.webp\", \"3.webp\"]', 24, 460000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45, 0, 1),
(46, '46', '[\"4.webp\", \"3.webp\"]', 24, 470000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, 0, 1),
(47, '47', '[\"4.webp\", \"3.webp\"]', 24, 480000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 47, 0, 1),
(48, '48', '[\"4.webp\", \"3.webp\"]', 24, 490000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 48, 0, 1),
(49, '49', '[\"4.webp\", \"3.webp\"]', 24, 500000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, 0, 1),
(50, '50', '[\"4.webp\", \"3.webp\"]', 24, 510000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, 0, 1),
(51, '51', '[\"4.webp\", \"3.webp\"]', 24, 520000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 51, 0, 1),
(52, '52', '[\"4.webp\", \"3.webp\"]', 24, 530000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52, 0, 1),
(53, '53', '[\"4.webp\", \"3.webp\"]', 24, 540000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 53, 0, 1),
(54, '54', '[\"4.webp\", \"3.webp\"]', 24, 550000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, 0, 1),
(55, '55', '[\"4.webp\", \"3.webp\"]', 24, 560000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55, 0, 1),
(56, '56', '[\"4.webp\", \"3.webp\"]', 24, 570000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, 0, 1),
(57, '57', '[\"4.webp\", \"3.webp\"]', 24, 580000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 57, 0, 1),
(58, '58', '[\"4.webp\", \"3.webp\"]', 24, 590000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', '2023-02-12 04:38:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, 0, 1),
(59, '59', '[\"4.webp\", \"3.webp\"]', 24, 600000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 59, 0, 1),
(60, '60', '[\"4.webp\", \"3.webp\"]', 24, 610000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, 0, 1),
(61, '61', '[\"4.webp\", \"3.webp\"]', 24, 620000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 61, 0, 1),
(62, '62', '[\"4.webp\", \"3.webp\"]', 24, 630000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 62, 0, 1),
(63, '63', '[\"4.webp\", \"3.webp\"]', 24, 640000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 63, 0, 1),
(64, '64', '[\"4.webp\", \"3.webp\"]', 24, 650000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 64, 0, 1),
(65, '65', '[\"4.webp\", \"3.webp\"]', 24, 660000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, 0, 1),
(66, '66', '[\"4.webp\", \"3.webp\"]', 24, 670000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 66, 0, 1),
(67, '67', '[\"4.webp\", \"3.webp\"]', 24, 680000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', '2023-02-13 01:10:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 67, 0, 1),
(68, '68', '[\"4.webp\", \"3.webp\"]', 24, 690000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68, 0, 1),
(69, '69', '[\"4.webp\", \"3.webp\"]', 24, 700000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 69, 0, 1),
(70, '70', '[\"4.webp\", \"3.webp\"]', 24, 710000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, 0, 1),
(71, '71', '[\"4.webp\", \"3.webp\"]', 24, 720000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 71, 0, 1),
(72, '72', '[\"4.webp\", \"3.webp\"]', 24, 730000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 72, 0, 1),
(73, '73', '[\"4.webp\", \"3.webp\"]', 24, 740000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 73, 0, 1),
(74, '74', '[\"4.webp\", \"3.webp\"]', 24, 750000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 74, 0, 1),
(75, '75', '[\"4.webp\", \"3.webp\"]', 24, 760000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75, 0, 1),
(76, '76', '[\"4.webp\", \"3.webp\"]', 24, 770000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76, 0, 1),
(77, '77', '[\"4.webp\", \"3.webp\"]', 24, 780000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 77, 0, 1),
(78, '78', '[\"4.webp\", \"3.webp\"]', 24, 790000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 78, 0, 1),
(79, '79', '[\"4.webp\", \"3.webp\"]', 24, 800000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 79, 0, 1),
(80, '80', '[\"4.webp\", \"3.webp\"]', 24, 810000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, 0, 1),
(81, '81', '[\"4.webp\", \"3.webp\"]', 24, 820000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 81, 0, 1),
(82, '82', '[\"4.webp\", \"3.webp\"]', 24, 830000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82, 0, 1),
(83, '83', '[\"4.webp\", \"3.webp\"]', 24, 840000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, 0, 1),
(84, '84', '[\"4.webp\", \"3.webp\"]', 24, 850000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84, 0, 1),
(85, '85', '[\"4.webp\", \"3.webp\"]', 24, 860000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, 0, 1),
(86, '86', '[\"4.webp\", \"3.webp\"]', 24, 870000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, 0, 1),
(87, '87', '[\"4.webp\", \"3.webp\"]', 24, 880000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 87, 0, 1),
(88, '88', '[\"4.webp\", \"3.webp\"]', 24, 890000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, 0, 1),
(89, '89', '[\"4.webp\", \"3.webp\"]', 24, 900000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, 0, 1),
(90, '90', '[\"4.webp\", \"3.webp\"]', 24, 910000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, 0, 1),
(91, '91', '[\"4.webp\", \"3.webp\"]', 24, 920000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, 0, 1),
(92, '92', '[\"4.webp\", \"3.webp\"]', 24, 930000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, 0, 1),
(93, '93', '[\"4.webp\", \"3.webp\"]', 24, 940000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, 0, 1),
(94, '94', '[\"4.webp\", \"3.webp\"]', 24, 950000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94, 0, 1),
(95, '95', '[\"4.webp\", \"3.webp\"]', 24, 960000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, 0, 1),
(96, '96', '[\"4.webp\", \"3.webp\"]', 24, 970000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, 0, 1),
(97, '97', '[\"4.webp\", \"3.webp\"]', 24, 980000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, 0, 1),
(98, '98', '[\"4.webp\", \"3.webp\"]', 24, 990000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, 0, 1),
(99, '99', '[\"4.webp\", \"3.webp\"]', 24, 1000000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, 0, 1),
(100, '100', '[\"4.webp\", \"3.webp\"]', 24, 1100000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, 0, 1),
(101, '101', '[\"4.webp\", \"3.webp\"]', 24, 1200000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, 0, 1),
(102, '102', '[\"4.webp\", \"3.webp\"]', 24, 1300000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, 0, 1),
(103, '103', '[\"4.webp\", \"3.webp\"]', 24, 1400000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, 0, 1),
(104, '104', '[\"4.webp\", \"3.webp\"]', 24, 1500000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, 0, 1),
(105, '105', '[\"4.webp\", \"3.webp\"]', 24, 1600000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 105, 0, 1),
(106, '106', '[\"4.webp\", \"3.webp\"]', 24, 1700000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 106, 0, 1),
(107, '107', '[\"4.webp\", \"3.webp\"]', 24, 1800000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 107, 0, 1),
(108, '108', '[\"4.webp\", \"3.webp\"]', 24, 1900000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 108, 0, 1),
(109, '109', '[\"4.webp\", \"3.webp\"]', 24, 2000000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 109, 0, 1),
(110, '110', '[\"4.webp\", \"3.webp\"]', 24, 2100000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 110, 0, 1),
(111, '111', '[\"4.webp\", \"3.webp\"]', 24, 2200000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111, 0, 1),
(112, '112', '[\"4.webp\", \"3.webp\"]', 24, 2300000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 112, 0, 1),
(113, '113', '[\"4.webp\", \"3.webp\"]', 24, 2400000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 113, 0, 1),
(114, '114', '[\"4.webp\", \"3.webp\"]', 24, 2500000000, 10, 'Đang cập nhật.....', 'Lenovo', '2023-02-06 07:50:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 114, 0, 1),
(123123149, '1', '[\"4.webp\", \"3.webp\", \"2.webp\", \"1.webp\"]', 1, 1, 1, '', 'Asus', '2023-03-12 10:53:55', '2023-03-13 01:15:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

CREATE TABLE `taikhoan` (
  `ma_tai_khoan` int NOT NULL,
  `ten_dang_nhap` varchar(45) NOT NULL,
  `ma_nhom_quyen` int DEFAULT NULL,
  `mat_khau` longtext,
  `created_at` timestamp NULL DEFAULT NULL,
  `hien_thi` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`ma_tai_khoan`, `ten_dang_nhap`, `ma_nhom_quyen`, `mat_khau`, `created_at`, `hien_thi`) VALUES
(1, 'bttan', 0, '$2y$10$12QGE/POO4/oaU.g7Fq3juFcl8AAJyJEZAxRpq.pLLWsieYHV8qOy', '2023-03-24 11:32:15', 1),
(2, 'bttan1', 0, '$2y$10$npvkuJLXKjOKDFz3vgV2OOUKyopzReaY5.1wpHqQy49oBtwgPZD1.', '2023-03-24 11:38:09', 1),
(3, 'hung', 1, '$2y$10$T4R2dSyO2owZoX29PUEMDe2TLHgTcRH/WD.Duw3gTGxT5200hzkdq', '2023-04-02 10:08:23', 1),
(4, 'lam', 11, '$2y$10$FH.XFfsp.whb6EOQ.LyLI.kCMOfQZ.Rg.Q7BqWn8UK/4fRxVbLmxq', '2023-04-06 04:35:50', 1),
(6, 'huy', 11, '$2y$10$fgElQGaKTqah1nqaCDrM5uddEZvWi0lUy.7Ts7Je17fUablL1tipm', '2023-04-07 03:59:03', 1),
(7, 'hieu', 6, '$2y$10$rmWN.HAj9PszOfuNhw2kuuERu6JD0NuxMT.0F.SJBe/re5MxcZGTq', '2023-04-08 01:59:07', 1);

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
(1, 'Lenovo', '<svg fill=\"#000000\" width=\"32\" height=\"32\" viewBox=\"0 0 32 32\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M27.005 15.229c-0.63-0.005-1.13 0.526-1.089 1.151-0.021 0.63 0.479 1.151 1.104 1.156 0.63 0.005 1.125-0.526 1.089-1.156 0.021-0.625-0.479-1.146-1.104-1.151zM18.323 15.229c-0.625-0.005-1.13 0.526-1.083 1.151-0.021 0.63 0.474 1.151 1.104 1.156 0.625 0.005 1.125-0.526 1.083-1.156 0.021-0.625-0.474-1.146-1.104-1.151zM8.979 15.156c-0.339-0.010-0.661 0.141-0.87 0.411-0.203 0.286-0.286 0.635-0.229 0.979l1.969-0.813c-0.146-0.349-0.49-0.578-0.87-0.578zM0 10.667v10.667h32v-10.667zM6.677 18.438h-3.708v-5.333h1.146v4.297h2.563zM9.099 17.609c0.432 0.005 0.854-0.146 1.177-0.438l0.714 0.547c-0.51 0.505-1.193 0.786-1.911 0.786-1.224 0.12-2.297-0.823-2.333-2.052-0.036-1.234 0.979-2.234 2.214-2.188 0.609-0.031 1.203 0.214 1.62 0.667 0.271 0.328 0.443 0.724 0.495 1.146l-2.885 1.203c0.245 0.224 0.573 0.344 0.911 0.328zM15.609 18.438h-1.13v-2.339c-0.016-0.5-0.443-0.891-0.948-0.865-0.5-0.031-0.927 0.365-0.932 0.865v2.339h-1.125v-4.109h1.13v0.589c0.318-0.411 0.813-0.651 1.333-0.656 0.927-0.052 1.698 0.703 1.667 1.63zM18.255 18.505c-1.87-0.078-2.734-2.359-1.38-3.656 1.349-1.292 3.594-0.339 3.594 1.531-0.005 1.208-1.010 2.172-2.214 2.125zM21.984 18.432l-1.688-4.104h1.286l1.021 2.802 1.021-2.802h1.286l-1.693 4.104zM26.932 18.505c-1.865-0.078-2.729-2.359-1.38-3.656 1.354-1.292 3.594-0.339 3.594 1.531-0.005 1.208-1.005 2.172-2.214 2.125zM29.599 17.948h-0.188v0.49h-0.109v-0.49h-0.182v-0.104h0.479zM30.323 18.438h-0.109v-0.422l-0.182 0.286h-0.016l-0.182-0.286v0.422h-0.109v-0.594h0.12l0.177 0.281 0.177-0.281h0.12z\" /></svg>', 'lenovo.webp', 1),
(2, 'Asus', '<svg fill=\"#000000\" width=\"32\" height=\"32\" viewBox=\"0 0 24 24\" role=\"img\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M23.904 10.788V9.522h-4.656c-.972 0-1.41.6-1.482 1.182v.018-1.2h-1.368v1.266h1.362zm-6.144.456-1.368-.078v1.458c0 .456-.228.594-1.02.594H14.28c-.654 0-.93-.186-.93-.594v-1.596l-1.386-.102v1.812h-.03c-.078-.528-.276-1.14-1.596-1.23L6 11.22c0 .666.474 1.062 1.218 1.14l3.024.306c.24.018.414.09.414.288 0 .216-.18.24-.456.24H5.946V11.22l-1.386-.09v3.348h5.646c1.26 0 1.662-.654 1.722-1.2h.03c.156.864.912 1.2 2.19 1.2h1.41c1.494 0 2.202-.456 2.202-1.524zm4.398.258-4.338-.258c0 .666.438 1.11 1.182 1.17l3.09.24c.24.018.384.078.384.276 0 .186-.168.258-.516.258h-4.212v1.29h4.302c1.356 0 1.95-.474 1.95-1.554 0-.972-.534-1.338-1.842-1.422zm-10.194-1.98h1.386v1.266h-1.386zM3.798 11.07l-1.506-.15L0 14.478h1.686zm7.914-1.548h-4.23c-.984 0-1.416.612-1.518 1.2v-1.2H3.618c-.33 0-.486.102-.642.33l-.648.936h9.384z\" /></svg>', 'asus.webp', 1),
(3, 'Macbook', '<svg fill=\"#000000\" width=\"32\" height=\"32\" viewBox=\"0 0 1920 1920\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M972.669 550.592c74.37 0 213.815-103.393 360.63-88.315 61.446 2.608 233.881 25.282 344.644 190.462-8.843 5.895-205.88 122.78-203.5 366.184 2.495 290.908 249.982 387.499 252.816 388.973-2.268 6.575-39.566 137.857-130.489 273.448-78.565 117.111-159.965 233.655-288.3 236.036-126.18 2.494-166.767-76.298-311.087-76.298-144.206 0-189.214 73.917-308.706 78.792-123.913 4.762-218.237-126.52-297.37-243.178-161.892-238.87-285.578-674.665-119.491-968.86 82.42-146.133 229.8-238.643 389.879-241.024 121.646-2.267 236.603 83.78 310.974 83.78ZM1367.75 0c13.038 110.536-34.69 221.525-105.093 301.45-70.743 79.813-186.494 141.94-299.977 133.55-15.305-108.495 41.947-221.184 107.248-292.154C1142.939 63.034 1266.172 3.855 1367.75 0Z\" fill-rule=\"evenodd\" /></svg>', 'hp.webp', 1),
(5, 'HP', '<svg viewBox=\"0.85 0.85 431.99799999999993 432\" xmlns=\"http://www.w3.org/2000/svg\" width=\"32\" height=\"32\"><path d=\"M216.85 432.85c-2.147 0-4.285-.038-6.42-.1l44.144-121.318h60.75c10.663 0 22.368-8.197 26.015-18.212l47.89-131.546c7.836-21.537-4.5-39.157-27.417-39.157h-84.28L206.82 316.833h-.027l-40.09 110.153C71.594 404.376.85 318.878.85 216.85c0-99.085 66.72-182.58 157.683-208.026l-41.365 113.693h-.012L48.39 311.432l45.777.004 58.48-160.53h34.405l-58.48 160.53 45.76.008 54.498-149.77c7.84-21.537-4.497-39.157-27.393-39.157h-38.48L207.14 1.077c3.22-.143 6.454-.227 9.708-.227 119.294 0 216 96.706 216 216 0 119.293-96.706 216-216 216zm130.692-282.06h-34.395L264.98 282.948h34.396z\" /></svg>', 'macbook-pro.png', 1),
(6, 'Acer', '<svg fill=\"#000000\" width=\"32\" height=\"32\" viewBox=\"0 0 24 24\" role=\"img\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M23.943 9.364c-.085-.113-.17-.198-.595-.226-.113 0-.453-.029-1.048-.029-1.56 0-2.636.482-3.175 1.417.142-.935-.765-1.417-2.749-1.417-2.324 0-3.798.935-4.393 2.834-.226.709-.226 1.276-.056 1.73h-.567c-.425.027-.992.056-1.36.056-.85 0-1.39-.142-1.588-.425-.17-.255-.17-.737.057-1.446.368-1.162 1.247-1.672 2.664-1.672.737 0 1.445.085 1.445.085.085 0 .142-.113.142-.198l-.028-.085-.057-.397c-.028-.255-.227-.397-.567-.453-.311-.029-.567-.029-.907-.029h-.028c-1.842 0-3.146.624-3.854 1.814.255-1.219-.596-1.814-2.551-1.814-1.105 0-1.9.029-2.353.085-.368.057-.595.199-.68.454l-.17.51c-.028.085.029.142.142.142.085 0 .425-.057.992-.086a24.816 24.816 0 0 1 1.672-.085c1.077 0 1.559.284 1.389.822-.029.114-.114.199-.255.227-1.02.17-1.842.284-2.438.369-1.7.226-2.692.736-2.947 1.587-.369 1.162.538 1.728 2.72 1.728 1.078 0 2.013-.056 2.75-.198.425-.085.652-.17.737-.453l.396-1.304c-.028 1.304.85 1.955 2.721 1.955.794 0 1.559-.028 1.927-.085.369-.056.567-.141.652-.425l.085-.396c.397.623 1.276.935 2.608.935 1.417 0 2.239-.029 2.465-.114a.523.523 0 0 0 .369-.311l.028-.085.17-.539c.029-.085-.028-.142-.142-.142l-.906.057c-.596.029-1.077.057-1.418.057-.651 0-1.076-.057-1.332-.142-.368-.142-.538-.397-.51-.822l2.863-.368c1.275-.17 2.154-.567 2.579-1.19l-.992 3.315c-.028.057 0 .114.028.142.029.028.085.057.199.057h1.19c.198 0 .283-.114.312-.199l1.048-3.656c.142-.481.567-.708 1.36-.708.71 0 1.22 0 1.56.028h.028c.057 0 .17-.028.255-.17l.17-.51c0-.085 0-.17-.057-.227zM4.841 13.73c-.368.057-.907.085-1.587.085-1.219 0-1.729-.255-1.587-.737.113-.34.425-.567.935-.624l2.75-.368zm12.669-2.95c-.114.369-.652.624-1.616.766l-2.295.311.056-.198c.199-.624.454-1.02.794-1.247.34-.227.907-.34 1.7-.34 1.05.028 1.503.255 1.36.708z\"/></svg>', 'acer.jpg', 1),
(7, 'Microsoft', '<svg width=\"32\" height=\"32\" viewBox=\"0 0 17 17\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><path d=\"M0 2.339l6.967-0.959v6.732h-6.967v-5.773zM0 14.661l6.967 0.959v-6.65h-6.967v5.691zM7.734 1.277v6.835h9.266v-8.112l-9.266 1.277zM7.734 15.723l9.266 1.277v-8.030h-9.266v6.753z\" fill=\"#000000\" /></svg>', 'microsoft.webp', 1),
(8, 'Dell', '<svg fill=\"#000000\" width=\"32\" height=\"32\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\" role=\"img\"><path d=\"M17.963 14.6V9.324h1.222v4.204h2.14v1.07h-3.362zm-9.784-3.288l2.98-2.292c.281.228.56.458.841.687l-2.827 2.14.611.535 2.827-2.216c.281.228.56.458.841.688a295.83 295.83 0 0 1-2.827 2.216l.61.536 2.83-2.295-.001-1.986h1.223v4.204h2.216v1.07h-3.362v-1.987c-.995.763-1.987 1.529-2.981 2.292l-2.981-2.292c-.144.729-.653 1.36-1.312 1.694-.285.147-.597.24-.915.276-.183.022-.367.017-.551.017H3.516V9.325H5.69a2.544 2.544 0 0 1 1.563.557c.454.36.778.872.927 1.43m-3.516-.917v3.21l.953-.001a1.377 1.377 0 0 0 1.036-.523 1.74 1.74 0 0 0 .182-1.889 1.494 1.494 0 0 0-.976-.766c-.166-.04-.338-.03-.507-.032h-.688zM11.82 0h.337a11.94 11.94 0 0 1 5.405 1.373 12.101 12.101 0 0 1 4.126 3.557A11.93 11.93 0 0 1 24 11.82v.36a11.963 11.963 0 0 1-3.236 8.033A11.967 11.967 0 0 1 12.182 24h-.361a11.993 11.993 0 0 1-4.145-.806 12.04 12.04 0 0 1-4.274-2.836A12.057 12.057 0 0 1 .576 15.67 12.006 12.006 0 0 1 0 12.181v-.361a11.924 11.924 0 0 1 1.992-6.396 12.211 12.211 0 0 1 4.71-4.172A11.875 11.875 0 0 1 11.82 0m-.153 1.23a10.724 10.724 0 0 0-6.43 2.375 10.78 10.78 0 0 0-3.319 4.573 10.858 10.858 0 0 0 .193 8.12 10.788 10.788 0 0 0 3.546 4.421 10.698 10.698 0 0 0 4.786 1.946c1.456.209 2.955.124 4.376-.26a10.756 10.756 0 0 0 5.075-3.062 10.742 10.742 0 0 0 2.686-5.28 10.915 10.915 0 0 0-.122-4.682 10.77 10.77 0 0 0-7.098-7.626 10.78 10.78 0 0 0-3.693-.525z\"/></svg>', 'dell.jpg', 1),
(9, 'Razer', '<svg fill=\"#000000\" width=\"32\" height=\"32\" viewBox=\"0 0 14 14\" role=\"img\" focusable=\"false\" aria-hidden=\"true\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"m 9.9036492,12.940318 c -0.020706,-0.034 -0.061818,-0.046 -0.091227,-0.028 -0.029409,0.018 -0.024407,-0.05 0.011103,-0.1523 0.045714,-0.1312 0.046014,-0.2588 9.803e-4,-0.4375 -0.1243273,-0.4929 -0.1275582,-0.56 -0.03341,-0.6944 0.13333,-0.1904 0.06542,-0.3086 -0.1771831,-0.3086 -0.2747624,0 -0.5205261,-0.1985 -0.5205261,-0.4204 0,-0.2146 0.2112233,-0.3908 0.5294587,-0.4418 0.563579,-0.09 0.741492,-0.5516004 0.3031209,-0.7864004 -0.2139341,-0.1145 -0.2297289,-0.1147 -0.7507851,-0.01 -2.0856753,0.4229004 -2.4035506,0.4598004 -2.8613578,0.3327 -0.1247874,-0.035 -0.3179453,-0.1429 -0.4292387,-0.2407 -0.5491146,-0.482 -0.5447633,-1.5423 0.008,-1.9773 0.1338901,-0.1053 0.1794838,-0.2095 0.2346003,-0.5366 0.037611,-0.2234 0.1173152,-0.5092 0.1770931,-0.6351 0.1147744,-0.2419 0.4806841,-0.656 0.6180053,-0.6994 0.06772,-0.021 0.068321,-0.069 0.004,-0.2846 -0.061919,-0.2066 -0.063119,-0.3586 -0.006,-0.7518 0.039212,-0.2712 0.071321,-0.5689 0.071321,-0.6617 0,-0.1621 -0.009,-0.1672 -0.2252375,-0.129 -0.486776,0.086 -0.763619,0.5181 -0.6367309,0.9934 0.035411,0.1329 0.042713,0.2415 0.016105,0.2415 -0.1087426,0 -0.2353105,-0.2834 -0.2353105,-0.5269 0,-0.4519 0.2524456,-0.7796 0.7446532,-0.9665 l 0.2808042,-0.1065 -0.1276183,-0.1622 c -0.2813543,-0.3577 -0.7119734,-0.4382 -1.0086824,-0.1885 -0.2723316,0.2291 -0.4156346,0.5894 -0.5839951,1.4682 -0.1721816,0.8987 -0.357067,1.4422 -0.6213962,1.8263 -0.4057917,0.5899 -1.0965388,0.5991 -1.5284883,0.021 -0.1298989,-0.174 -0.1539561,-0.4202 -0.077523,-0.7938 l 0.049115,-0.2403 -0.1420326,0.2102 c -0.1640092,0.2427 -0.3971791,0.3007 -0.620436,0.1545 -0.079324,-0.052 -0.1991997,-0.094 -0.2664599,-0.094 -0.078324,0 -0.2226467,-0.1293 -0.4011502,-0.3591 -0.153356,-0.1975 -0.3276383,-0.3745 -0.3872862,-0.3936 -0.062419,-0.02 -0.094628,-0.07 -0.075923,-0.1191 0.026608,-0.069 0.061318,-0.064 0.1921376,0.029 0.087826,0.062 0.3116534,0.1438 0.4974691,0.1806 0.253376,0.05 0.3795938,0.114 0.5048914,0.2546 l 0.1670501,0.1875 0.095729,-0.1273 c 0.052716,-0.07 0.1443032,-0.1962 0.203661,-0.2803 0.1502051,-0.213 0.4797939,-0.2143 0.6185255,0 0.082725,0.1262 0.087826,0.1931 0.031409,0.417 -0.1006402,0.3996 -0.082525,0.5639 0.080324,0.7266 0.1893567,0.1894 0.2883264,0.1858 0.5174851,-0.019 0.1714614,-0.1532 0.2096028,-0.2657 0.4789136,-1.4121 0.3974792,-1.692 0.5553765,-2.0156 1.1085423,-2.2718 0.313414,-0.145 0.6099329,-0.1423 1.0152044,0.01 0.3947983,0.1477 0.670411,0.438 0.7702309,0.8112 0.042813,0.1601 0.1142342,0.2804 0.1785935,0.3008 0.059018,0.019 0.2422527,0.1407 0.4072521,0.2711 0.3642492,0.288 0.6605681,0.777 0.6613483,1.0916 4.802e-4,0.1867 0.021507,0.2251 0.1236771,0.2251 0.2152745,0 0.4949984,0.1829 0.9499848,0.621 l 0.4424219,0.426 0.111244,-0.1373 c 0.172151,-0.2126 0.20283,-0.5027 0.08042,-0.7607 -0.108403,-0.2285 -0.3932777,-0.4487 -0.580994,-0.4491 -0.057817,0 -0.1051115,-0.027 -0.1051115,-0.06 0,-0.062 0.1197759,-0.084 0.3298185,-0.061 0.202841,0.022 0.459608,0.2473 0.576803,0.5054 0.131439,0.2893 0.139482,0.5216 0.02881,0.8317 l -0.08042,0.2253 0.205072,0 c 0.270521,0 0.595938,-0.1401 0.676883,-0.2913 0.102681,-0.1919 0.07602,-0.5489 -0.06242,-0.8348 -0.07002,-0.1446 -0.395459,-0.5507 -0.723167,-0.9023 -0.8712105,-0.9347 -1.1916465,-1.4675 -1.1916465,-1.9813 0,-0.2846 0.2030108,-0.5938 0.4841651,-0.7371 0.4277274,-0.2183 0.7934674,-0.1264 1.1321294,0.2845 0.208042,0.2524 0.223807,0.2438 0.09943,-0.054 -0.10109,-0.2419 -0.02911,-0.4529 0.192088,-0.5632 0.07342,-0.037 0.187576,-0.1155 0.253616,-0.1753 0.08493,-0.077 0.23516,-0.1133 0.513644,-0.1246 0.23332,-0.01 0.452756,-0.055 0.538922,-0.1113 0.181744,-0.11900005 0.182294,-0.11900005 0.192627,0.018 0.006,0.078 -0.04141,0.1236 -0.152385,0.1459 -0.08853,0.018 -0.289807,0.1559 -0.447295,0.307 -0.228088,0.2186 -0.328928,0.2746 -0.495528,0.2746 -0.235401,0 -0.26825,0.099 -0.119066,0.3604 0.124057,0.2169 0.109613,0.3463 -0.05732,0.5132 -0.214394,0.2144 -0.350635,0.1839 -0.682104,-0.1528 -0.240843,-0.2447 -0.333831,-0.3004 -0.501851,-0.3004 -0.257527,0 -0.350385,0.09 -0.350385,0.3385 0,0.3132 0.07632,0.4355 0.723967,1.1608 1.10032,1.2322 1.376463,1.6574 1.377653,2.1215 0.002,0.8593 -0.971551,1.5189 -1.80063,1.2196 -0.188116,-0.068 -0.243053,-0.06 -0.5373103,0.074 -0.4134539,0.1892 -1.0624185,0.2127 -1.3853853,0.05 -0.2016505,-0.1015 -0.2138942,-0.1014 -0.3003201,0 -0.1663698,0.2019 -0.450555,0.365 -0.8121835,0.4659 -0.86745,0.2423 -0.8879562,0.2651 -0.5452434,0.6078 0.1773531,0.1773 0.2434029,0.2042 0.5021505,0.2042 0.2187556,0 0.356747,-0.04 0.5192157,-0.1502 0.2805941,-0.1904 0.2988096,-0.1883 0.190087,0.022 -0.1692308,0.3272 -0.7913673,0.477 -1.1694806,0.2814 -0.092528,-0.048 -0.2526858,-0.1831 -0.3558267,-0.3006 l -0.1875262,-0.2136 -0.087226,0.1355 c -0.1363809,0.2117 -0.1796739,0.5644 -0.094528,0.7699 0.1748924,0.4222 0.9104329,0.5039 1.9204357,0.2131 0.6658596,-0.1917 1.630959,-0.2696 2.0216462,-0.1632 0.304581,0.083 0.598999,0.3978 0.655977,0.7015 0.09333,0.4975004 -0.247075,0.9620004 -0.7548167,1.0301004 -0.1341803,0.018 -0.2612584,0.061 -0.2823847,0.095 -0.023807,0.038 9.503e-4,0.047 0.064919,0.023 0.056817,-0.022 0.1954386,0 0.3080314,0.046 0.210784,0.088 0.310804,0.2877 0.253646,0.5063 -0.0159,0.061 -0.005,0.1539 0.02481,0.2067 0.03781,0.068 -0.011,0.2309 -0.164399,0.5497 -0.1531058,0.3182 -0.2069719,0.498 -0.180614,0.6031 0.038612,0.1537 0.011503,0.1969 -0.055417,0.089 z M 7.3536547,7.0540176 c 0.130029,-0.066 0.2804541,-0.1878 0.3342903,-0.27 0.090527,-0.1381 0.090427,-0.1607 -4.802e-4,-0.2996 -0.054116,-0.083 -0.1230369,-0.1501 -0.1531559,-0.1501 -0.1323397,0 -0.4065719,0.1406 -0.563719,0.2891 -0.1440432,0.1361 -0.4599079,0.6575 -0.4599079,0.7591 0,0.039 0.5233769,-0.1654 0.8429727,-0.3285 z m 2.2919372,-0.2885 c 0.084525,-0.034 0.061618,-0.074 -0.1354807,-0.2396 -0.3146343,-0.2639 -0.7170549,-0.4903 -0.8728917,-0.4912 -0.1856356,0 -0.3492447,0.2015 -0.2749324,0.3403 0.094728,0.1771 0.2647294,0.3049 0.4908572,0.3692 0.2441332,0.069 0.6457436,0.08 0.7924476,0.021 z m -1.6453433,-1.1039 c 0.103441,-0.1034 0.088827,-0.5615 -0.025107,-0.7868 -0.1337101,-0.2645 -0.3775032,-0.5826 -0.4464439,-0.5826 -0.078023,0 -0.072422,0.9728 0.007,1.181 0.097229,0.2558 0.3107432,0.3423 0.4647393,0.1884 z\" /></svg>', 'razer.jpg', 1);

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
  ADD PRIMARY KEY (`ma_khach_hang`);

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
  MODIFY `ma_bao_hanh` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chucnang`
--
ALTER TABLE `chucnang`
  MODIFY `ma_chuc_nang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `ma_don_hang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `hinhanh`
--
ALTER TABLE `hinhanh`
  MODIFY `ma_hinh_anh` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `nhacungcap`
--
ALTER TABLE `nhacungcap`
  MODIFY `ma_nha_cung_cap` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nhomquyen`
--
ALTER TABLE `nhomquyen`
  MODIFY `ma_nhom_quyen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `phieunhap`
--
ALTER TABLE `phieunhap`
  MODIFY `ma_phieu_nhap` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `quyenhang`
--
ALTER TABLE `quyenhang`
  MODIFY `ma_quyen_hang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `ma_san_pham` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123123150;

--
-- AUTO_INCREMENT for table `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `ma_tai_khoan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `thuonghieu`
--
ALTER TABLE `thuonghieu`
  MODIFY `ma_thuong_hieu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
