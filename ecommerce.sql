-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2023 at 06:35 PM
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
(7, '1234321', 'bttan', '2023-04-26 02:59:42', '2025-04-26 02:59:42'),
(8, '132123', 'bttan', '2023-04-26 02:59:42', '2025-04-26 02:59:42'),
(9, '12312', 'bttan', '2023-04-26 02:59:42', '2025-04-26 02:59:42'),
(10, '123131233', 'bttan', '2023-04-26 02:59:42', '2025-04-26 02:59:42');

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
(1, '16807669518', 159, 15840000, 10, 24);

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
(2, 7, 10, 15290000),
(3, 7, 10, 19490000);

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
('12322', 4),
('168042665910', 2),
('168042679012', 2),
('168044932913', 2),
('16804493296', 3),
('168076695112', 2),
('168076725213', 2),
('16807672529', 1),
('16807683761', 7),
('168110773010', 1),
('168110773014', 2),
('168242581415', 1),
('168248983214', 1),
('168249009615', 1),
('1682490096212', 2),
('168249009635', 3),
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
(157, 'bttan', '', 'postpaid', '2023-04-13 03:51:02', 'đã hủy', 1),
(158, 'bttan', 'hung', 'postpaid', '2023-04-13 04:04:01', 'hoàn thành', 1),
(159, 'bttan', '', 'postpaid', '2023-04-25 07:30:36', 'đã hủy', 1),
(160, 'bttan', 'hung', 'postpaid', '2023-04-26 01:16:58', 'chờ xử lý', 1);

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
(83, 'y.png');

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
('bttan', '12312345', '2023-03-01 01:00:00', 1, '0706092403', '123123', 'y.png', 1),
('bttan1', '123123', '2023-03-02 00:00:00', 1, '0706092404', '123123', 'avatar.jpg', 1);

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
(2, 'GearVN', '0890989090', '09', 1),
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
  `muc_luong` bigint DEFAULT NULL,
  `hien_thi` tinyint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`ma_nhan_vien`, `ten_nhan_vien`, `so_dien_thoai`, `ngay_sinh`, `gioi_tinh`, `muc_luong`, `hien_thi`) VALUES
('hieu', '123123', '0706092403', '2023-04-04', 1, 1000000, 1),
('hung', 'bth2', '0706092403', '2003-03-01', 1, 20000000, 1),
('huy', 'Huy abc', '0706092403', '2023-04-01', 1, 1000000, 1),
('lam', 'lam ne', '0987654321', '2023-04-06', 1, 10000000, 1);

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
(6, 2, 'hung', '2023-04-10 01:22:10', 1),
(7, 1, 'hung', '2023-04-26 01:21:35', 1);

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
(1, 'Laptop Lenovo Ideapad Slim 5 14ITL05 (i5-1135G7/RAM 8GB/256GB SSD/ Windows 11)', '[\"slim.webp\", \"slim1.webp\", \"slim2.webp\", \"slim3.webp\"]', 24, 19679000, 0, 'Laptop Lenovo Ideapad Slim 5 14ITL05-82FE016PVN Xám được xem là dòng laptop mỏng nhẹ, hiện đại và nhã nhặn của nhà Lenovo. Với thiết kế độc đáo bên ngoài và cấu hình mạnh mẽ bên trong, chắc chắn sẽ là một sự lựa chọn hoàn hảo dành cho các bạn, đặc biệt là nhân viên văn phòng', 'Lenovo', '2023-04-25 08:04:35', '2023-04-26 01:21:35', 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nhân, 8 luồng ) i5-1135G7', 'Core i5', 'Onboard Intel Iris Xe Graphics', ' DDR4 3200MHz', '14\" ( 1920 x 1080 ) IPS không cảm ứng , Màn hình chống lóa , HD webcam', '256GB SSD M.2 NVMe /', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x SD card slot , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , không phím số , LED', 'Windows 11 Home SL Windows 11', '32.157 x 21.159 x 1.79 ~ 1.99', '44 Wh , Pin liền', 1, 'Ideapad', '82FE016PVN', 'Xám', 'Adapter', 0, 0, 8, 0, 1, 1),
(2, 'Laptop Lenovo IdeaPad 3 15IAU7 (i3-1215U/RAM 8GB/512GB SSD/ Windows 11)', '[\"15iau7.webp\", \"15iau71.webp\", \"15iau72.webp\"]', 24, 16819000, 17, 'Laptop Lenovo IdeaPad 3 15IAU7 - 82RK001NVN một thiết bị phù hợp cho những ai đang tìm kiếm một chiếc laptop có thể xử lý được nhanh chóng các tác vụ công việc văn phòng hay học tập. Thiết kế nhỏ gọn, bộ vi xử lý Intel Core i3 mang lại hiệu năng ổn định hứa hẹn sẽ là một sản phẩm được đa số người dùng ưa thích.', 'Lenovo', '2023-04-25 08:04:35', '2023-04-26 02:59:42', 'Core i3 , Intel Core thế hệ thứ 12', 'Intel Core i3-1215U ( 1.2 GHz - 4.4GHz / 10MB / 6 nhân, 8 luồng ) i3-1215U', 'Core i3', 'Onboard Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD TN Màn hình chống lóa , HD webcam', '512GB SSD M.2 NVMe /', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Data / Power Delivery , 1 x USB 3.2 , 1 x USB 2.0 , 1 x SD card slot , Audio combo', 'WiFi 802.11ac , Bluetooth 5.0', 'thường , có phím số', 'Windows 11 Home Windows 11', '35.92 x 23.65 x 1.99', '3 cell 45', 1, 'Ideapad', '82RK001NVN', 'Xanh', 'Adapter', 0, 0, 8, 2, 0, 1),
(3, 'Laptop Lenovo Ideapad 5 - 15IAL7 (i5-1235U/RAM 8GB/512GB SSD/ Windows 11)', '[\"15ial7.webp\", \"15ial71.webp\", \"15ial72.webp\"]', 36, 21439000, 18, 'Laptop Lenovo Ideapad 5 - 15IAL7 -82SF006LVN là một siêu phẩm được đánh giá cao trong phân khúc tầm giá. Chiếc máy tính này được trang bị màn hình hiển thị kích thước lớn, chất lượng hình ảnh sắc nét cùng hiệu năng hoạt động ổn định đây sẽ là “người bạn” đồng hành với bạn từ công việc đến giải trí, thư giãn.', 'Lenovo', '2023-04-25 08:04:35', '2023-04-26 02:59:42', 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1235U ( 1.3 GHz - 4.4GHz / 12MB / 10 nhân, 12 luồng ) i5-1235U', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'GDDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe /', '1 x 2.5\" SATA , 1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB Type C / DisplayPort / Data / Power Delivery , 2 x USB 3.2 , 1 x SD card slot , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , có phím số', 'Windows 11 Home Windows 11', '35.667 x 23.313 x 1.69', '57', 1, 'Ideapad', '82SF006LVN', 'Xanh', 'Adapter', 0, 0, 8, 2, 0, 1),
(4, 'Laptop Lenovo Legion 5 15IAH7-82RC0036VN', '[\"15iah7.webp\", \"15iah71.webp\", \"15iah72.webp\"]', 36, 38990000, 18, 'Laptop Lenovo Legion 5 15IAH7 82RC0036VN là dòng laptop Gaming cao cấp với thiết kế độc đáo và ấn tượng đến từ nhà Lenovo. Sở hữu cấu hình khủng với hiệu năng điện toán mạnh mẽ nhờ bộ vi xử lý Intel Core i7 Gen 12 mới mẻ, có thể cân được mọi tựa game đình đám hiện nay cũng như sẵn sàng hỗ trợ cho người dùng xử lý mọi tác vụ đồ họa, thiết kế, văn phòng dễ dàng hơn.', 'Lenovo', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 12', 'Intel Core i7-12700H ( 2.3 GHz - 4.7 GHz / 24MB / 14 nhân, 20 luồng ) i7-12700H', 'Core i7', 'RTX 3050Ti 4GB GDDR6 / Intel Iris Xe Graphics', 'DDR5 4800MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 165Hz , không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB Type C / DisplayPort / Power Delivery , 3 x USB 3.2 , 1 x Thunderbolt 4 , Không , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '35.88 x 26.235 x 1.999', '4 cell 80', 2.3, 'Legion', '82RC0036VN', 'Xám', 'Adapter', 0, 0, 8, 0, 1, 1),
(5, 'Laptop Lenovo ThinkBook 15 G4 IAP (i5-1235U/RAM 8GB/256GB SSD/ FreeDOS)', '[\"think.webp\", \"think1.webp\", \"think2.webp\", \"think3.webp\"]', 24, 21000000, 0, 'Laptop Lenovo ThinkBook 15 G4 IAP 21DJ00CMVN với vẻ ngoài độc lạ, bắt mắt cùng hiệu năng ổn định từ CPU Intel Core i5 Gen 12 cùng khả năng đa nhiệm mượt mà với RAM 8GB DDR4, phù hợp với nhu cầu sử dụng của người làm văn phòng. Đây sẽ là sản phẩm mang đến cho bạn những trải nghiệm ấn tượng.', 'Lenovo', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1235U ( 1.3 GHz - 4.4GHz / 12MB / 10 nhân, 12 luồng ) i5-1235U', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , Màn hình chống lóa , FHD webcam', '256GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x Thunderbolt 4 , 1 x SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ac , Bluetooth 5.0', 'thường , có phím số , LED', 'No OS FreeDOS', '35.7 x 23.5 x 1.89', '3 cell 45', 1.7, 'Thinkbook', '21DJ00CMVN', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(6, 'Laptop Lenovo ThinkBook 14-IML (20RV00B6VN) (14\" FHD/i3-10110U/4GB/256GB SSD/Intel UHD/Free DOS/1.5kg)', '[\"14iml.webp\", \"14iml1.webp\", \"14iml2.webp\", \"14iml3.webp\"]', 12, 12590000, 0, 'Được thiết kế cho những người có công việc hay phải di chuyển thường xuyên, laptop Lenovo ThinkBook 14-IML (20RV00B6VN) có thiết kế mỏng 17.9mm nên việc cho vào ba lô hay cầm tay mang đi sẽ trở nên dễ dàng hơn bao giờ hết. Ngoài ra với bộ xử lý Intel Core thế hệ mới nhất hỗ trợ tối ưu cho hệ điều hành Windows 10, chiếc laptop doanh nghiệp kích thước 14\" này có thể giúp bạn giải quyết tốt mọi tác vụ ở bất cứ đâu.', 'Lenovo', '2023-04-25 08:04:35', NULL, 'Core i3 , Intel Core thế hệ thứ 10', 'Intel Core i3-10110U ( 2.1 GHz - 4.1 GHz / 4MB / 2 nhân, 4 luồng ) i3-10110U', 'Core i3', 'Onboard Intel UHD Graphics', 'DDR4 2666MHz', '14\" ( 1920 x 1080 ) Full HD TN không cảm ứng , HD webcam', '256GB SSD M.2 NVMe /', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C, 1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.1 , 1 x SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ac , Bluetooth 5.0', 'thường , không phím số , không đèn', 'Free DOS Free DOS', '32 x 23 x 1.79', '3 cell 45', 1.5, 'Thinkbook', '20RV00B6VN', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(7, 'Laptop Lenovo V15 G2 ITL (i3-1115G4/RAM 8GB/256GB SSD/ Windows 11)', '[\"v15g2itl.webp\", \"v15g2itl1.webp\", \"v15g2itl2.webp\", \"v15g2itl3.webp\"]', 12, 12990000, 0, 'Laptop Lenovo V15 G2 ITL-82KB00QMVN Đen là một sản phẩm thuộc phân khúc cao cấp của thương hiệu nổi tiếng Lenovo. Chiếc máy tính xách tay này được trang bị trang bị chip Intel Core thế hệ thứ 11 mang lại hiệu năng vượt trội. Bên cạnh đó là kiểu dáng đẹp mắt cùng thiết kế thanh lịch phù hợp với nhiều đối tượng sử dụng.', 'Lenovo', '2023-04-25 08:04:35', NULL, 'Core i3 , Intel Core thế hệ thứ 11', 'Intel Core i3-1115G4 ( 3.0 GHz - 4.10 GHz / 6MB / 2 nhân, 4 luồng ) i3-1115G4', 'Core i3', 'Onboard Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD TN không cảm ứng , Màn hình chống lóa , HD webcam', '256GB SSD M.2 NVMe /', '1 x 2.5\" SATA , 1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C , 1 x USB 3.2 , 1 x USB 2.0 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ac , Bluetooth 5.0', 'thường , có phím số', 'Windows 11 Home Windows 11', '35.92 x 23.58 x 1.99', '2 cell 38', 1.7, 'Lenovo V Series', '82KB00QMVN', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(8, 'Laptop Lenovo ThinkPad X1 Carbon Gen 10 (i5-1240P/RAM 16GB/512GB SSD/ Windows 11 Pro)', '[\"x1carbon.webp\", \"x1carbonl1.webp\", \"x1carbonl2.webp\", \"x1carbon3.webp\"]', 36, 47490000, 0, 'Đang cập nhật...', 'Lenovo', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1240P ( 1.7 GHz - 4.4GHz / 12MB / 12 nhân, 16 luồng ) i5-1240P', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'LPDDR5 5200MHz', '14\" ( 2240 x 1400 ) IPS Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe /', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB 3.2 , 2 x Thunderbolt 4 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường', 'Windows 11 Pro Windows 11 Pro', '31.56 x 22.25 x 1.536', '57', 1.1, 'ThinkPad', '21CB009WVN', 'Đen', 'Adapter', 0, 0, 8, 0, 1, 1),
(9, 'Laptop Lenovo ThinkPad E15 Gen 4 (i7-1255U/RAM 8GB/512GB SSD/ FreeDOS)', '[\"e15gen4.webp\", \"e15gen41.webp\", \"e15gen42.webp\"]', 24, 24590000, 7, 'Laptop Lenovo ThinkPad E15 Gen 4 21E600CMVA tông đen đơn giản sang trọng với thiết kế khá độc đáo ấn tượng, bền bỉ kèm theo cấu hình bên trong đỉnh cao nhờ bộ vi xử lý Intel Core i7 thế hệ thứ 12. Sản phẩm laptop phù hợp với mọi đối tượng từ học sinh, sinh viên đến nhân viên văn phòng, đáp ứng tốt các tác vụ văn phòng hay làm đồ họa đều tốt.', 'Lenovo', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 12', 'Intel Core i7-1255U ( 1.7 GHz - 4.7GHz / 12MB / 10 nhân, 12 luồng ) i7-1255U', 'Core i7', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB 3.2 , 1 x USB 2.0 , 1 x Thunderbolt 4 , Không , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , LED', 'No OS FreeDOS', '36.5 x 24.0 x1.89', '3 cell 45', 1.7, 'Thinkbook', '21E600CMVA', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(10, 'Laptop Lenovo ThinkBook 16 G4+ IAP (i5-1240P/RAM 16GB/512GB SSD/ Windows 11)', '[\"16g4iap.webp\", \"16g4iap1.webp\", \"16g4iap2.webp\"]', 24, 29490000, 7, 'Đang cập nhật...', 'Lenovo', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1240P ( 1.7 GHz - 4.4GHz / 12MB / 12 nhân, 16 luồng ) i5-1240P', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'LPDDR5 4800MHz', '16\" ( 2560 x 1600 ) WQXGA IPS không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 SATA/NVMe', 'M.2 SATA/NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x USB 2.0 , 1 x Thunderbolt 4 , 1 x SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ac , Bluetooth 5.1', 'thường , có phím số , LED', 'Windows 11 Home Windows 11', '35.6 x 25.1 x 1.65', '72', 1.8, 'Thinkbook', '21CY003FVN', 'Xám', 'Adapter', 0, 0, 8, 0, 1, 1),
(11, 'Laptop ACER Nitro 5 AN515-46-R5Z2 (Ryzen 7 6800H/RAM 8GB/512GB SSD/ Windows 11)', '[\"an515.webp\", \"an5151.webp\", \"an5152.webp\"]', 12, 32990000, 0, 'Laptop Acer Nitro 5 AN515-46-R5Z2 - NH.QH3SV.001 là dòng laptop gaming cao cấp quốc dân đến từ thương hiệu nổi tiếng Acer sở hữu cấu hình mạnh mẽ vượt trội kèm với thiết kế đẹp mắt, ấn tượng và thu hút mọi ánh nhìn, chiếc laptop Acer Gaming chính hãng này chắc hẳn sẽ làm hài lòng ngay cả những khách hàng khó tính.', 'Acer', '2023-04-25 08:04:35', NULL, 'Ryzen 7', 'AMD Ryzen 7 6800H ( 3.2 GHz - 4.7 GHz / 16MB / 8 nhân, 16 luồng ) Ryzen 7 6800H', 'AMD Ryzen 7', 'AMD Radeon 680M', 'DDR5 4800MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 144Hz , HD webcam', '512GB SSD M.2 NVMe /', '1 x 2.5\" SATA , 1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort , 3 x USB 3.2 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '36.04 x 27.109 x 2.59 - 2.69', '57', 2.5, 'Nitro 5', 'NH.QH3SV.001', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(12, 'Laptop ACER Swift 3 SF314-511-55QE (i5-1135G7/RAM 16GB/512GB SSD/ Windows 11)', '[\"sf314.webp\", \"sf3141.webp\", \"sf3142.webp\"]', 12, 23790000, 25, 'Acer Swift 3 SF314-511-55QE NX.ABNSV.003 của Acer sở hữu hiệu năng mạnh mẽ đến từ chip Intel core thế hệ 11 cùng với Ram chạy đa nhiệm mượt mà và bộ nhớ SSD có dung lượng lớn. Cùng với màu sắc và kiểu dáng sang trọng hiện đại phù hợp cho nhu cầu học tập và làm việc với hiệu suất cao của các bạn sinh viên và nhân viên văn phòng.', 'Acer', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nhân, 8 luồng ) i5-1135G7', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'LPDDR4X 4266MHz', '14\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , HD webcam', '512GB SSD M.2 NVMe /', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort , 2 x USB 3.2 , 1 x 3.5 mm', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , không phím số , LED', 'Windows 11 Home Windows 11', '32.28 x 21.22 x 1.59', '56', 1.2, 'Swift 3', 'NX.ABNSV.003', 'Bạc', 'Adapter', 0, 0, 8, 0, 1, 1),
(13, 'Laptop ACER Predator Helios 16 PH16-71-94N1 (i9-13900HX/RAM 32GB/Windows 11)', '[\"ph16.webp\", \"ph161.webp\", \"ph162.webp\"]', 12, 117790000, 0, 'Acer Predator Helios 16 là một chiếc máy tính xách tay đến từ nhà Acer chuyên dùng cho những chiến binh game thủ. Predator Helios có thiết kế màu đen mạnh mẽ, và được trang bị với màn hình 16 inch có độ phân giải Full HD. Máy sử dụng chip xử lý Intel Core i9 và card đồ họa GEFORCE RTX™ 4080, cung cấp hiệu suất xử lý và đồ họa tuyệt vời cho trải nghiệm gaming tuyệt đỉnh.', 'Acer', '2023-04-25 08:04:35', NULL, 'Core i9 , Intel Core thế hệ thứ 13', 'Intel Core i9-13900HX ( 2.2 GHz - 5.4GHz / 36MB / 24 nhân, 32 luồng ) i9-13900HX', 'Core i9', 'Intel UHD Graphics 770', 'DDR5 4800MHz', '16\" ( 2560 x 1600 ) WQXGA IPS 240Hz , không cảm ứng , Màn hình chống lóa , HD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '3 x USB 3.2 , 1 x Thunderbolt 4 , 1 x micro SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , có phím số , RGB', 'Windows 11 Home SL Windows 11', '35.778 x 27.874 x 2.490 - 2.690', '4 cell 90', 2.6, 'Predator', 'NH.QJSSV.002', 'Đen', 'Adapter', 0, 0, 16, 0, 0, 1),
(14, 'Laptop ACER Nitro 5 AN515-57-71VV (i7-11800H/RAM 8GB/RTX 3050/512GB SSD/ Windows 11)', '[\"an51557.webp\", \"an515571.webp\", \"an515572.webp\"]', 12, 27490000, 5, 'Laptop Acer Nitro 5 AN515-57-71VV (NH.QENSV.005) là dòng laptop thuộc phân khúc cao cấp được nhiều người lựa chọn. Với thiết kế vô cùng mạnh mẽ đậm chất gaming cùng với con chip Intel Core i7 mang lại hiệu năng vượt trội, tự tin chiến mọi loại game, hứa hẹn mang đến cho người dùng trải nghiệm tuyệt vời hơn các dòng laptop trong cùng phân khúc.', 'Acer', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 11', 'Intel Core i7-11800H ( 2.3 GHz - 4.6 GHz / 24MB / 8 nhân, 16 luồng ) i7-11800H', 'Core i7', 'Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 144Hz , không cảm ứng , HD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe - Hỗ trợ Intel Optane', 'M.2 NVMe (Hỗ trợ Intel Optane)', '1 x HDMI', '1 x USB Type C , 3 x USB 3.2 , 1 x 3.5 mm , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '36.34 x 25.5 x 2.39', '4 cell 57', 2.2, 'Nitro 5', 'NH.QENSV.005', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(15, 'Laptop ACER Predator Triton 300 PT315-53-7440 (i7-11800H/RAM 8GB/512GB SSD/ Windows 11)', '[\"7440.webp\", \"74401.webp\", \"74402.webp\"]', 12, 36990000, 0, 'Laptop ACER Predator Triton 300 (PT315-53-7440 NH.QDRSV.003) cực phẩm gaming được bao bọc bởi thiết kế nguyên khối mạnh mẽ, mọi đường nét của laptop đều toát lên vẻ cá tính nổi bật. Bên trong mang hiệu năng hoàn hảo cho việc xử lý thông tin, chơi game mượt mà, đồ họa đẹp mắt. Đem lại cho bạn những trải nghiệm thú vị khi sử dụng chiếc laptop này.', 'Acer', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 11', 'Intel Core i7-11800H ( 2.3 GHz - 4.6 GHz / 24MB / 8 nhân, 16 luồng ) i7-11800H', 'Core i7', 'Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 2560 x 1440 ) Quad HD (2K) IPS 165Hz , không cảm ứng , HD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI , 1 x mini DisplayPort', '3 x USB 3.2 , 1 x Thunderbolt 4 , 1 x 3.5 mm , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '35.3 x 25.5 x 1.99', '4 cell 59', 2, 'Predator', 'NH.QDRSV.003', 'Đen', 'Adapter', 0, 0, 16, 0, 0, 1),
(16, 'Laptop ACER Predator Helios 300 PH315-54-99S6 (i9-11900H/RAM 16GB/512GB SSD/ Windows 10)', '[\"99s6.webp\", \"99s61.webp\", \"99s62.webp\"]', 12, 41990000, 5, 'Laptop Acer PH315-54-99S6 Predator Helios 300  (NH.QC2SV.006) thu hút không chỉ nhờ vẻ ngoài mạnh mẽ mà còn là vì cấu hình vượt trội, mang đến trải nghiệm làm việc và giải trí rất đáng để mong đợi. Phiên bản laptop cao cấp với tính cơ động hứa hẹn sẽ là người bạn tuyệt vời đồng hành cùng bạn đến bất kỳ đâu. ', 'Acer', '2023-04-25 08:04:35', NULL, 'Core i9 , Intel Core thế hệ thứ 11', 'Intel Core i9-11900H ( 2.5 GHz - 4.9 GHz / 24MB / 8 nhân, 16 luồng ) i9-11900H', 'Core i9', 'Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 2560 x 1440 ) Quad HD (2K) IPS 165Hz , không cảm ứng , HD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI , 1 x mini DisplayPort', '1 x USB Type C / Thunderbolt , 3 x USB 3.2 , 1 x 3.5 mm , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , RGB', 'Windows 10 Home 64-bit Windows 10', '36.3 x 25.5 x 2.29', '4 cell 59', 2.3, 'Predator', 'NH.QC2SV.006', 'Đen', 'Adapter', 0, 0, 16, 0, 0, 1),
(17, 'Laptop ACER Swift 3 SF314-71-74WD (i7-12700H/RAM 16GB/1TB SSD/ Windows 11)', '[\"74wd.webp\", \"74wd1.webp\", \"74wd2.webp\"]', 12, 34790000, 0, 'Đang cập nhật...', 'Acer', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 12', 'Intel Core i7-12700H ( 2.3 GHz - 4.7GHz / 24MB / 14 nhân, 20 luồng ) i7-12700H', 'Core i7', 'Onboard Intel Iris Xe Graphics', 'LPDDR5 6400MHz', '14\" ( 2880 x 1800 ) OLED không cảm ứng , HD webcam', '1TB SSD M.2 NVMe /', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB Type C , 2 x USB 3.2 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , không phím số , LED', 'Windows 11 Home Windows 11', '31.29 x 21.40 x 1.79', '3 cell 57', 1.4, 'Swift 3', 'NX.KAWSV.001', 'Vàng', 'Adapter', 0, 0, 4, 0, 0, 1),
(18, 'Laptop Acer Swift 3 SF315-52-38YQ (NX.GZBSV.003) (15.6\" FHD/i3-8130U/4GB/1TB HDD/UHD 620/Win10/1.6 kg)', '[\"38yq.webp\", \"38yq1.webp\", \"38yq2.webp\"]', 12, 13499000, 0, 'Màu Rose Gold sang trọng bao phủ ngoại hình Acer Swift 3 SF315-52-38YQ, đây là màu sắc “không tuổi” ở thời điểm hiện tại do phù hợp với mọi lứa tuổi người dùng. Bên cạnh ngoại hình hấp dẫn, máy còn nổi bật nhờ việc đầu tư pin lớn lên tới 4 cell 48Wh (pin liền) nhưng khối lượng thân máy rất nhẹ cho người dùng cảm giác như một quyển notebook : Chỉ 1.6kg.', 'Acer', '2023-04-25 08:04:35', NULL, 'Core i3 , Intel Core thế hệ thứ 8', 'Intel Core i3-8130U ( 2.2 GHz - 3.4 GHz / 4MB / 2 nhân, 4 luồng ) i3-8130U', 'Core i3', 'Onboard Intel UHD Graphics 620', 'DDR4 2666MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , HD webcam', '1TB HDD 5400RPM', '1 x 2.5\" SATA , 1 x M.2 SATA/NVMe', 'M.2 SATA/NVMe', '1 x HDMI', '1 x USB Type C , 2 x USB 3.0 , 1 x USB 2.0 , 1 x SD card slot', 'WiFi 802.11ac , Bluetooth 4.2', 'thường , có phím số , không đèn', 'Windows 10 Home SL 64-bit Windows 10', '34 x 23 x 1.8', '4 cell 48', 1.6, 'Swift 3', 'NX.GZBSV.003', 'Vàng', 'Adapter', 0, 0, 8, 0, 0, 1),
(19, 'Laptop ACER Aspire 5 A514-54-5127 (i5-1135G7/RAM 8GB/512GB SSD/ Windows 11)', '[\"5127.webp\", \"51271.webp\", \"51272.webp\"]', 12, 16990000, 12, 'Thuộc dòng Aspire 5 thế hệ mới nhất của ACER, Laptop ACER Aspire 5 A514-54-5127 NX.A28SV.007 khẳng định vị thế của riêng bạn với thiết kế sang trọng, cá tính và mỏng nhẹ đáng kinh ngạc và hiệu năng sẵn sàng bứt phá.', 'Acer', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nhân, 8 luồng ) i5-1135G7', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'DDR4 2666MHz', '14\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , HD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C , 3 x USB 3.2 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , không phím số , LED', 'Windows 11 Home SL Windows 11', '32.8 x 22.3 x 1.8', '48', 1.5, 'Aspire 5', 'NX.A28SV.007', 'Bạc', 'Adapter', 0, 0, 32, 0, 0, 1),
(20, 'Laptop ACER Nitro 5 AN515-58-52SP (i5-12500H/RAM 8GB/RTX 3050/512GB SSD/ Windows 11)', '[\"52sp.webp\", \"52sp1.webp\", \"52sp2.webp\"]', 12, 29490000, 15, 'Laptop ACER Nitro 5 AN515 -58 -52SP NH.QFHSV.001 được ACER cho ra mắt với vẻ ngoài thu hút hơn bởi thiết kế đậm chất gaming, các cạnh được vát theo khối hình học đầy mạnh mẽ. Đối với những ai là fan của nhà Acer đang muốn tìm hiểu về những dòng laptop gaming Nitro 5 Tiger 2022 mới nhất thì đây sẽ cỗ máy với bộ vi xử lý Intel tuyệt vời nhất dành cho bạn. ', 'Acer', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-12500H ( 2.5 GHz - 4.5 GHz / 18MB / 12 nhân, 16 luồng ) i5-12500H', 'Core i5', 'Intel Iris Xe Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 144Hz , không cảm ứng , HD webcam', '512GB SSD M.2 NVMe /', '1 x 2.5\" SATA , 2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '3 x USB 3.2 , 1 x Thunderbolt 4 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '36.04 x 27.109 x 2.59', '4 cell 57', 2.5, 'Nitro 5', 'NH.QFHSV.001', 'Đen', 'Adapter', 0, 0, 16, 0, 0, 1),
(21, 'Laptop ASUS TUF Gaming FX506HC-HN144W (i5-11400H/RAM 8GB/RTX 3050/512GB SSD/ Windows 11)', '[\"fx506.webp\", \"fx5061.webp\", \"fx5062.webp\"]', 24, 25990000, 21, 'Laptop ASUS TUF Gaming FX506HC-HN144W 90NR0724-M00FJ0 là một chiếc laptop gaming thuộc hạng nặng với bộ vi xử lý thế hệ mới Intel Core 11 mới nhất và một thiết lập âm thanh tổng thể tuyệt vời. Bằng những cải tiến tối ưu về cả hiệu năng lẫn kiểu dáng Asus muốn mang lại cho người dùng một sản phẩm hoàn hảo mang đến trải nghiệm mới mẻ và vượt trội hơn bao giờ hết.', 'Asus', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-11400H ( 2.7 GHz - 4.5 GHz / 12MB / 6 nhân, 12 luồng ) i5-11400H', 'Core i5', 'Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 144Hz , không cảm ứng , Màn hình chống lóa , HD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '3 x USB 3.2 , 1 x Thunderbolt 4 , 1 x 3.5 mm , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , RGB', 'Windows 11 Home Windows 11', '35.9 x 25.6 x 2.45', '3 cell 48', 2.5, 'TUF Gaming', '90NR0724-M00FJ0', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(22, 'Laptop ASUS Gaming ROG Strix G513IE-HN246W (Ryzen 7 4800H/RAM 8GB/512GB SSD/ Windows 11)', '[\"g513.webp\", \"g5131.webp\", \"g5132.webp\"]', 24, 26990000, 15, 'Laptop Asus Gaming ROG Strix G513IE-HN246W khoác lên mình một ngoại hình Gaming ấn tượng, mạnh mẽ phù hợp với các game thủ. Đây sẽ là một ứng cử viên sáng giá với khả năng đáp ứng những nhu cầu sử dụng những tác vụ thông thường một cách nhanh chóng, đồng thời hứa hẹn mang đến cho bạn những trải nghiệm trong từng trận game tuyệt vời.', 'Asus', '2023-04-25 08:04:35', NULL, 'Ryzen 7 , AMD Ryzen thế hệ thứ 4', 'AMD Ryzen 7 4800H ( 2.9 GHz - 4.2 GHz / 8MB / 8 nhân, 16 luồng ) Ryzen 7 4800H', 'AMD Ryzen 7', 'AMD Radeon Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 144Hz , Màn hình chống lóa', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 3 x USB 3.2 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , RGB 4 vùng', 'Windows 11 Home Windows 11', '35.4 x 25.9 x 2.06 ~ 2.59', '4 cell 56', 2.1, 'ROG', '90NR0313-M00FJ0', 'Xám', 'Adapter', 0, 0, 16, 0, 0, 1),
(23, 'Laptop ASUS Expertbook B5 B5302CEA-L50916W (i5-1135G7/RAM 8GB/512GB SSD/ Windows 11)', '[\"b530.webp\", \"b5301.webp\", \"b5302.webp\"]', 24, 17230000, 0, 'Đang cập nhật...', 'Asus', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 11 , Intel EVO', 'Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nhân, 8 luồng ) i5-1135G7', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '13.3\" ( 1920 x 1080 ) Full HD Màn hình chống lóa , HD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x micro HDMI', '1 x USB 3.2 , 2 x Thunderbolt 4 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.0', 'thường , không phím số , LED', 'Windows 11 Home Windows 11', '30.90 x 21.06 x 1.69', '4 cell 66', 1.4, 'ExpertBook', '90NR00301-M00FJ0', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(24, 'Laptop ASUS Vivobook X515EA-BQ3015W (i7-1165G7/RAM 8GB/512GB SSD/ Windows 11)', '[\"x515.webp\", \"x5151.webp\", \"x5152.webp\"]', 24, 17490000, 0, 'Đang cập nhật...', 'Asus', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 11', 'Intel Core i7-1165G7 ( 2.8 GHz - 4.7 GHz / 12MB / 4 nhân, 8 luồng ) i7-1165G7', 'Core i7', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , Màn hình chống lóa , VGA webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB 3.2 Type C , 1 x USB 3.2 , 2 x USB 2.0 , Audio combo', 'WiFi 802.11ac , Bluetooth 4.1', 'thường , có phím số , không đèn', 'Windows 11 Home Windows 11', '36.00 x 23.50 x 1.99', '2 cell 37', 1.8, 'VivoBook', '90NR3123-M00FJ0', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(25, 'Laptop ASUS ROG Strix SCAR 18 G834JY-N6039W (i9-13980HX/RAM 64GB/RTX 4090/2TB SSD/ Windows 11)', '[\"g834.webp\", \"g8341.webp\", \"g8342.webp\"]', 24, 125000000, 8, 'Laptop ROG Strix SCAR luôn là đầu tàu trong dải sản phẩm Laptop Gaming của ROG, và 2023 cũng không khác biệt. ROG Strix SCAR 16 và 18 với khung máy hoàn toàn mới và màn hình tỷ lệ 16:10 thời thượng, trang bị tấm nền lên đên 2K 240Hz, đạt chuẩn ROG Nebula. Bộ vi xử lý CPU Intel Core™ i9 13980HX cho hiệu năng chơi game tuyệt đỉnh, GPU lên đến NVIDIA GeForce RTX 4090 Laptop cùng hệ thống tản nhiệt tân tiến mang đến trải nghiệm chơi game mượt mà nhất trên nền tảng đồ họa đến từ tương lai.', 'Asus', '2023-04-25 08:04:35', NULL, 'Core i9 , Intel Core thế hệ thứ 13', 'Intel Core i9-13980HX ( 2.2 GHz - 5.6GHz / 36MB / 24 nhân, 32 luồng ) i9-13980HX', 'Core i9', 'Intel UHD Graphics 770', 'DDR5 4800MHz', '18\" ( 2560 x 1600 ) WQXGA 240Hz , không cảm ứng , Màn hình chống lóa , HD webcam', '2TB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x Thunderbolt 4 , Audio combo , LAN 2500 Mbps', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '39.9 x 29.4 x 2.31 ~ 3.08', '4 cell 90', 3.1, 'ROG', '90NR31032-M00FJ0', 'Đen', 'Adapter', 0, 0, 16, 0, 0, 1),
(26, 'Laptop Dell Inspiron 14 5420 (i5-1235U/RAM 8GB/512GB SSD/ Windows 11 + Office)', '[\"5420.webp\", \"54201.webp\", \"54202.webp\"]', 24, 22990000, 14, 'Laptop Dell Inspiron 14 5420 i5 U085W11SLU chiếc laptop dành cho đa dạng nhu cầu sử dụng? Đúng, với dòng series mới này của Dell hãng đã tinh chỉnh lựa chọn linh kiện khá hợp lý với chip Intel core i5 thế hệ 12 mới nhất tại thời điểm ra mắt. Dải nhu cầu chi tiết cho chiếc laptop này nằm ở các yêu cầu như học sinh, sinh viên, nhân viên văn phòng là chủ yếu, hỗ trợ đầy đủ hiệu năng với các vụ vừa phải.', 'Dell', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1235U ( 1.3 GHz - 4.4GHz / 12MB / 10 nhân, 12 luồng ) i5-1235U', 'Core i5', 'Onboard Intel UHD Graphics', 'DDR4 3200MHz', '14\" ( 1920 x 1200 ) Full HD+ WVA không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe /', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C , 2 x USB 3.2 , 1 x SD card slot , 1 x 3.5 mm', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , không phím số , LED', 'Windows 11 Home SL + Office Home & Student 2021 Windows 11 + Office', '22.75 x 31.4 x 1.837', '4 cell 54', 1.5, 'Inspiron', 'i5U085W11SLU', 'Bạc', 'Adapter', 0, 0, 8, 0, 0, 1),
(27, 'Laptop Dell Vostro 3510 (i5-1135G7/RAM 8GB/512GB SSD/ Windows 11 + Office)', '[\"3510.webp\", \"35101.webp\", \"35102.webp\"]', 12, 22990000, 24, 'Laptop Dell Vostro 3510 P112F002BBL với thiết kế vẻ ngoài đơn giản thanh lịch, bên trong với hiệu năng xử lý khá mạnh mẽ cùng với chip Intel core i5. Được tối ưu hóa trọng lượng, mang đến trải nghiệm nhẹ nhàng và thoải mái cho người dùng. Là lựa chọn hoàn hảo cho những người thích sự gọn nhẹ và linh hoạt, nhất là các bạn sinh viên và nhân viên văn phòng.', 'Dell', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nhân, 8 luồng ) i5-1135G7', 'Core i5', 'Intel Iris Xe Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD WVA không cảm ứng , HD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB 3.2 , 1 x USB 2.0 , 1 x SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số', 'Windows 11 Home SL + Office Home & Student 2021 Windows 11 + Office', '35.8 x 23.5 x 1.89', '3 cell 42', 1.7, 'Vostro', 'P112F002BBL', 'Đen', 'Adapter, dây nguồn, HDSD,…', 0, 0, 16, 0, 0, 1),
(28, 'Laptop Dell Vostro 5620 (i5-1240P/RAM 16GB/512GB SSD/ Windows 11)', '[\"5620.webp\", \"56201.webp\"]', 12, 25690000, 11, 'Laptop Dell Vostro 5620 70282719 được thiết kế theo phong cách hiện đại với tông màu xám thanh lịch. Vostro 5620 cũng được trang bị hiệu năng vượt trội từ bộ vi xử lý và màn hình lên đến 16 inch phù hợp với khả năng xử lý công việc, học tập, giải trí và đa nhiệm dễ dàng. Đây sẽ là sự lựa chọn hoàn hảo dành cho những khách hàng yêu thích sử dụng dòng laptop có màn hình hiển thị lớn. ', 'Dell', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1240P ( 1.7 GHz - 4.4GHz / 12MB / 12 nhân, 16 luồng ) i5-1240P', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '16\" ( 1920 x 1200 ) WUXGA WVA không cảm ứng , FHD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB 3.2 , 2 x Thunderbolt 4 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.0', 'thường , không phím số , LED', 'Windows 11 Home Windows 11', '35.6 x 25.2 x 1.8', '4 cell', 1.9, 'Vostro', '70282719', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(29, 'Laptop Dell Inspiron 14 T7420 (i5-1235U/RAM 8GB/512GB SSD/ Windows 11 + Office)', '[\"t7420.webp\", \"t74201.webp\", \"t74202.webp\"]', 24, 24890000, 11, 'Đang cập nhật...', 'Dell', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1235U ( 1.3 GHz - 4.4GHz / 12MB / 10 nhân, 12 luồng ) i5-1235U', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '14\" ( 1920 x 1200 ) Full HD+ WVA cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB Type C / DisplayPort / Power Delivery , 1 x USB 3.2 , 1 x SD card slot , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , không phím số , LED', 'Windows 11 Home SL + Office Home & Student 2021 Windows 11 + Office', '31.40 x 22.75 x 1.78', '4 cell 54', 1.6, 'Inspiron', 'N4I5021W', 'Bạc', 'Adapter', 0, 0, 8, 0, 0, 1),
(30, 'Laptop Dell Inspiron 15 5625 (Ryzen 7 5825U/RAM 8GB/512GB SSD/ Windows 11 + Office)', '[\"5625.webp\", \"56251.webp\", \"56252.webp\"]', 12, 22990000, 18, 'Laptop Dell Inspiron 15 5625 99VP91 Bạc được thiết kế theo xu hướng tối giản theo đúng tiêu chuẩn của một chiếc máy tính phổ thông. Cùng với hiệu năng mạnh mẽ, laptop này sẽ giúp đáp ứng tốt các nhu cầu và hứa hẹn sẽ mang đến trải nghiệm tuyệt vời đến khách hàng.', 'Dell', '2023-04-25 08:04:35', NULL, 'Ryzen 7', 'AMD Ryzen 7 5825U ( 2.0 GHz - 4.5 GHz / 16MB / 8 nhân, 16 luồng ) Ryzen 7 5825U', 'AMD Ryzen 7', 'Onboard AMD Radeon Graphics', 'DDR4 3200MHz', '16\" ( 1920 x 1200 ) Full HD+ WVA không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x SD card slot , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , LED', 'Windows 11 Home SL + Office Home & Student 2021 Windows 11 + Office', '35.68 x 25.19 x 1.79', '4 cell 54', 1.8, 'Inspiron', '99VP91', 'Bạc', 'Adapter', 0, 0, 16, 0, 0, 1),
(31, 'Laptop HP Envy x360 13-bf0096TU (i5-1230U/RAM 8GB/512GB SSD/ Windows 11)', '[\"13.webp\", \"131.webp\", \"132.webp\", \"slim3.webp\"]', 24, 19679000, 0, 'Khi cầm trên tay chiếc Laptop HP Envy x360 13-bf0096TU, mình đã thực sự bị chinh phục bởi những gì mà HP đã mang đến trên chiếc máy này. Thiết kế mỏng nhẹ của máy cùng với chất liệu nhôm cao cấp tạo nên một sự sang trọng và hiện đại. Màn hình cảm ứng Full HD 13.3 inch cho hình ảnh sắc nét và đẹp mắt. Bàn phím có đèn nền LED cho phép làm việc trong điều kiện ánh sáng yếu và độ nhạy cao giúp người dùng nhập liệu dễ dàng. Độ hoàn thiện cũng như chi tiết được chăm chút tỉ mỉ, tạo nên một sản phẩm đáng giá cho người sử dụng.', 'HP', '2023-04-25 08:04:35', '2023-04-26 01:21:35', 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nhân, 8 luồng ) i5-1135G7', 'Core i5', 'Onboard Intel Iris Xe Graphics', ' DDR4 3200MHz', '14\" ( 1920 x 1080 ) IPS không cảm ứng , Màn hình chống lóa , HD webcam', '256GB SSD M.2 NVMe /', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x SD card slot , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , không phím số , LED', 'Windows 11 Home SL Windows 11', '32.157 x 21.159 x 1.79 ~ 1.99', '44 Wh , Pin liền', 1, 'Ideapad', '82FE016PVN', 'Xám', 'Adapter', 0, 0, 8, 0, 1, 1),
(32, 'Laptop HP Victus 16-e1107AX (Ryzen 5 6600H/RAM 8GB/512GB SSD/ Windows 11)', '[\"16.webp\", \"161.webp\", \"162.webp\"]', 24, 16819000, 17, 'Trong thế giới của những người yêu thích trò chơi điện tử, việc sở hữu một chiếc laptop gaming chất lượng là điều vô cùng quan trọng. Và Laptop HP Victus 16-e1107AX chính là một trong số những sản phẩm được các game thủ tin dùng. Được HP - thương hiệu nổi tiếng trong lĩnh vực công nghệ - sản xuất, chiếc laptop này không chỉ có thiết kế đẹp mắt mà còn được trang bị những tính năng hiện đại, cấu hình mạnh mẽ và độ bền cao. Không những thế, nó còn đáp ứng được các tiêu chuẩn về chất lượng và an toàn môi trường, là một sự lựa chọn hoàn hảo cho những người dùng đang tìm kiếm một chiếc laptop đáp ứng được nhu cầu chơi game của mình.', 'HP', '2023-04-25 08:04:35', '2023-04-26 02:59:42', 'Core i3 , Intel Core thế hệ thứ 12', 'Intel Core i3-1215U ( 1.2 GHz - 4.4GHz / 10MB / 6 nhân, 8 luồng ) i3-1215U', 'Core i3', 'Onboard Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD TN Màn hình chống lóa , HD webcam', '512GB SSD M.2 NVMe /', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Data / Power Delivery , 1 x USB 3.2 , 1 x USB 2.0 , 1 x SD card slot , Audio combo', 'WiFi 802.11ac , Bluetooth 5.0', 'thường , có phím số', 'Windows 11 Home Windows 11', '35.92 x 23.65 x 1.99', '3 cell 45', 1, 'Ideapad', '82RK001NVN', 'Xanh', 'Adapter', 0, 0, 8, 2, 0, 1),
(33, 'Laptop HP Pavilion 14-dv2050TU (i3-1215U/RAM 4GB/256GB SSD/ Windows 11)', '[\"14.webp\", \"141.webp\", \"142.webp\"]', 36, 21439000, 18, 'Laptop HP Pavilion 14-dv2050TU - 6K7G7PA là sự lựa chọn không thể bỏ qua nếu bạn đang tìm kiếm một chiếc laptop phục vụ cho các tác vụ cơ bản hàng ngày. Chiếc laptop HP này có vẻ ngoài tinh tế, gọn nhẹ dễ dàng di chuyển và sở hữu hiệu năng ổn định giúp bạn xử lý công việc nhanh chóng.', 'HP', '2023-04-25 08:04:35', '2023-04-26 02:59:42', 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1235U ( 1.3 GHz - 4.4GHz / 12MB / 10 nhân, 12 luồng ) i5-1235U', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'GDDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe /', '1 x 2.5\" SATA , 1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB Type C / DisplayPort / Data / Power Delivery , 2 x USB 3.2 , 1 x SD card slot , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , có phím số', 'Windows 11 Home Windows 11', '35.667 x 23.313 x 1.69', '57', 1, 'Ideapad', '82SF006LVN', 'Xanh', 'Adapter', 0, 0, 8, 2, 0, 1),
(34, 'Laptop HP Pavilion 15-eg2037TX (i5-1235U/RAM 8GB/256GB SSD/ Windows 11)', '[\"15.webp\", \"151.webp\", \"152.webp\"]', 36, 38990000, 18, 'Laptop HP Pavilion 15-eg2037TX - 6K783PA là sản phẩm thuộc phân khúc cao cấp sở hữu Intel Core i5 cho hiệu năng ổn định, màn hình 15.6 inch hiển thị lớn cùng thiết kế tinh tế. Đây sẽ là một công cụ làm việc hiệu quả đặc biệt phù hợp với những đối tượng khách hàng là nhân viên văn phòng.', 'HP', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 12', 'Intel Core i7-12700H ( 2.3 GHz - 4.7 GHz / 24MB / 14 nhân, 20 luồng ) i7-12700H', 'Core i7', 'RTX 3050Ti 4GB GDDR6 / Intel Iris Xe Graphics', 'DDR5 4800MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 165Hz , không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB Type C / DisplayPort / Power Delivery , 3 x USB 3.2 , 1 x Thunderbolt 4 , Không , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '35.88 x 26.235 x 1.999', '4 cell 80', 2.3, 'Legion', '82RC0036VN', 'Xám', 'Adapter', 0, 0, 8, 0, 1, 1),
(35, 'Laptop HP Envy x360 13-bf0114TU (i5-1230U/RAM 8GB/512GB SSD/ Windows 11)', '[\"12.webp\", \"121.webp\", \"122.webp\", \"123.webp\"]', 24, 21000000, 0, 'Đang cập nhật...', 'HP', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1235U ( 1.3 GHz - 4.4GHz / 12MB / 10 nhân, 12 luồng ) i5-1235U', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , Màn hình chống lóa , FHD webcam', '256GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x Thunderbolt 4 , 1 x SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ac , Bluetooth 5.0', 'thường , có phím số , LED', 'No OS FreeDOS', '35.7 x 23.5 x 1.89', '3 cell 45', 1.7, 'Thinkbook', '21DJ00CMVN', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(36, 'Laptop LG Gram 16ZD90Q (i5-1240P/RAM 16GB/512GB SSD/ Free DOS)', '[\"90.webp\", \"901.webp\", \"902.webp\", \"903.webp\"]', 12, 12590000, 0, 'Laptop LG Gram 16ZD90Q-G.AX55A5 thuộc dòng laptop cao cấp thế hệ mới, sở hữu thiết kế sang trọng với trọng lượng siêu nhẹ mang đến sự linh hoạt và thuận tiện cho những khách hàng thường xuyên di chuyển. Cùng với đó là hiệu năng mạnh mẽ bền bỉ với CPU Intel Core i5 và RAM đa nhiệm, giúp đáp ứng hầu hết các nhu cầu từ cơ bản đến nâng cao của khách hàng.', 'LG', '2023-04-25 08:04:35', NULL, 'Core i3 , Intel Core thế hệ thứ 10', 'Intel Core i3-10110U ( 2.1 GHz - 4.1 GHz / 4MB / 2 nhân, 4 luồng ) i3-10110U', 'Core i3', 'Onboard Intel UHD Graphics', 'DDR4 2666MHz', '14\" ( 1920 x 1080 ) Full HD TN không cảm ứng , HD webcam', '256GB SSD M.2 NVMe /', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C, 1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.1 , 1 x SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ac , Bluetooth 5.0', 'thường , không phím số , không đèn', 'Free DOS Free DOS', '32 x 23 x 1.79', '3 cell 45', 1.5, 'Thinkbook', '20RV00B6VN', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(37, 'Laptop LG Gram 2023 17Z90R-G.AH78A5 (i7-1360P/RAM 16GB/1TB SSD/ Windows 11)', '[\"17.webp\", \"171.webp\", \"172.webp\"]', 12, 12990000, 0, 'Laptop LG Gram 16ZD90Q-G.AX55A5 thuộc dòng laptop cao cấp thế hệ mới, sở hữu thiết kế sang trọng với trọng lượng siêu nhẹ mang đến sự linh hoạt và thuận tiện cho những khách hàng thường xuyên di chuyển. Cùng với đó là hiệu năng mạnh mẽ bền bỉ với CPU Intel Core i5 và RAM đa nhiệm, giúp đáp ứng hầu hết các nhu cầu từ cơ bản đến nâng cao của khách hàng.', 'LG', '2023-04-25 08:04:35', NULL, 'Core i3 , Intel Core thế hệ thứ 11', 'Intel Core i3-1115G4 ( 3.0 GHz - 4.10 GHz / 6MB / 2 nhân, 4 luồng ) i3-1115G4', 'Core i3', 'Onboard Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD TN không cảm ứng , Màn hình chống lóa , HD webcam', '256GB SSD M.2 NVMe /', '1 x 2.5\" SATA , 1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C , 1 x USB 3.2 , 1 x USB 2.0 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ac , Bluetooth 5.0', 'thường , có phím số', 'Windows 11 Home Windows 11', '35.92 x 23.58 x 1.99', '2 cell 38', 1.7, 'Lenovo V Series', '82KB00QMVN', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(38, 'Laptop LG Gram 14ZD90Q (i3-1220P/RAM 8GB/256GB SSD/ Free DOS)', '[\"zd.webp\", \"zd1.webp\", \"zd2.webp\"]', 36, 47490000, 0, 'Đang cập nhật...', 'LG', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1240P ( 1.7 GHz - 4.4GHz / 12MB / 12 nhân, 16 luồng ) i5-1240P', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'LPDDR5 5200MHz', '14\" ( 2240 x 1400 ) IPS Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe /', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB 3.2 , 2 x Thunderbolt 4 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường', 'Windows 11 Pro Windows 11 Pro', '31.56 x 22.25 x 1.536', '57', 1.1, 'ThinkPad', '21CB009WVN', 'Đen', 'Adapter', 0, 0, 8, 0, 1, 1),
(39, 'Laptop LG Gram 17ZD90Q (i7-1260P/RAM 16GB/256GB SSD/ Free DOS)', '[\"0q.webp\", \"0q1.webp\", \"0q2.webp\"]', 24, 24590000, 7, 'Đang cập nhật...', 'LG', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 12', 'Intel Core i7-1255U ( 1.7 GHz - 4.7GHz / 12MB / 10 nhân, 12 luồng ) i7-1255U', 'Core i7', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB 3.2 , 1 x USB 2.0 , 1 x Thunderbolt 4 , Không , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , LED', 'No OS FreeDOS', '36.5 x 24.0 x1.89', '3 cell 45', 1.7, 'Thinkbook', '21E600CMVA', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(40, 'Laptop LG Gram 2021 16Z90P (i7-1165G7/RAM 16GB/256GB SSD/ Windows 10)', '[\"z9.webp\", \"z91.webp\", \"z92.webp\"]', 24, 29490000, 7, 'Laptop LG Gram 17ZD90Q-G.AX73A5 là một thiết bị hoàn hảo với thiết kế siêu gọn nhẹ, màn hình hiển thị cao cấp và hiệu năng mạnh mẽ sẵn sàng đáp ứng mọi nhu cầu làm việc, giải trí mọi nơi mọi lúc. Thuộc phân khúc sản phẩm cao cấp chiếc laptop LG này hứa hẹn sẽ làm bạn hài lòng với những lợi ích mang lại.', 'LG', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1240P ( 1.7 GHz - 4.4GHz / 12MB / 12 nhân, 16 luồng ) i5-1240P', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'LPDDR5 4800MHz', '16\" ( 2560 x 1600 ) WQXGA IPS không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 SATA/NVMe', 'M.2 SATA/NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x USB 2.0 , 1 x Thunderbolt 4 , 1 x SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ac , Bluetooth 5.1', 'thường , có phím số , LED', 'Windows 11 Home Windows 11', '35.6 x 25.1 x 1.65', '72', 1.8, 'Thinkbook', '21CY003FVN', 'Xám', 'Adapter', 0, 0, 8, 0, 1, 1),
(41, 'Laptop ACER Nitro 5 AN515-46-R5Z2 (Ryzen 7 6800H/RAM 8GB/512GB SSD/ Windows 11)', '[\"an515.webp\", \"an5151.webp\", \"an5152.webp\"]', 12, 32990000, 0, 'Laptop Acer Nitro 5 AN515-46-R5Z2 - NH.QH3SV.001 là dòng laptop gaming cao cấp quốc dân đến từ thương hiệu nổi tiếng Acer sở hữu cấu hình mạnh mẽ vượt trội kèm với thiết kế đẹp mắt, ấn tượng và thu hút mọi ánh nhìn, chiếc laptop Acer Gaming chính hãng này chắc hẳn sẽ làm hài lòng ngay cả những khách hàng khó tính.', 'MSI', '2023-04-25 08:04:35', NULL, 'Ryzen 7', 'AMD Ryzen 7 6800H ( 3.2 GHz - 4.7 GHz / 16MB / 8 nhân, 16 luồng ) Ryzen 7 6800H', 'AMD Ryzen 7', 'AMD Radeon 680M', 'DDR5 4800MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 144Hz , HD webcam', '512GB SSD M.2 NVMe /', '1 x 2.5\" SATA , 1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort , 3 x USB 3.2 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '36.04 x 27.109 x 2.59 - 2.69', '57', 2.5, 'Nitro 5', 'NH.QH3SV.001', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(42, 'Laptop ACER Swift 3 SF314-511-55QE (i5-1135G7/RAM 16GB/512GB SSD/ Windows 11)', '[\"sf314.webp\", \"sf3141.webp\", \"sf3142.webp\"]', 12, 23790000, 25, 'Acer Swift 3 SF314-511-55QE NX.ABNSV.003 của Acer sở hữu hiệu năng mạnh mẽ đến từ chip Intel core thế hệ 11 cùng với Ram chạy đa nhiệm mượt mà và bộ nhớ SSD có dung lượng lớn. Cùng với màu sắc và kiểu dáng sang trọng hiện đại phù hợp cho nhu cầu học tập và làm việc với hiệu suất cao của các bạn sinh viên và nhân viên văn phòng.', 'MSI', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nhân, 8 luồng ) i5-1135G7', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'LPDDR4X 4266MHz', '14\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , HD webcam', '512GB SSD M.2 NVMe /', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort , 2 x USB 3.2 , 1 x 3.5 mm', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , không phím số , LED', 'Windows 11 Home Windows 11', '32.28 x 21.22 x 1.59', '56', 1.2, 'Swift 3', 'NX.ABNSV.003', 'Bạc', 'Adapter', 0, 0, 8, 0, 1, 1),
(43, 'Laptop ACER Predator Helios 16 PH16-71-94N1 (i9-13900HX/RAM 32GB/Windows 11)', '[\"ph16.webp\", \"ph161.webp\", \"ph162.webp\"]', 12, 117790000, 0, 'Acer Predator Helios 16 là một chiếc máy tính xách tay đến từ nhà Acer chuyên dùng cho những chiến binh game thủ. Predator Helios có thiết kế màu đen mạnh mẽ, và được trang bị với màn hình 16 inch có độ phân giải Full HD. Máy sử dụng chip xử lý Intel Core i9 và card đồ họa GEFORCE RTX™ 4080, cung cấp hiệu suất xử lý và đồ họa tuyệt vời cho trải nghiệm gaming tuyệt đỉnh.', 'MSI', '2023-04-25 08:04:35', NULL, 'Core i9 , Intel Core thế hệ thứ 13', 'Intel Core i9-13900HX ( 2.2 GHz - 5.4GHz / 36MB / 24 nhân, 32 luồng ) i9-13900HX', 'Core i9', 'Intel UHD Graphics 770', 'DDR5 4800MHz', '16\" ( 2560 x 1600 ) WQXGA IPS 240Hz , không cảm ứng , Màn hình chống lóa , HD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '3 x USB 3.2 , 1 x Thunderbolt 4 , 1 x micro SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , có phím số , RGB', 'Windows 11 Home SL Windows 11', '35.778 x 27.874 x 2.490 - 2.690', '4 cell 90', 2.6, 'Predator', 'NH.QJSSV.002', 'Đen', 'Adapter', 0, 0, 16, 0, 0, 1),
(44, 'Laptop ACER Nitro 5 AN515-57-71VV (i7-11800H/RAM 8GB/RTX 3050/512GB SSD/ Windows 11)', '[\"an51557.webp\", \"an515571.webp\", \"an515572.webp\"]', 12, 27490000, 5, 'Laptop Acer Nitro 5 AN515-57-71VV (NH.QENSV.005) là dòng laptop thuộc phân khúc cao cấp được nhiều người lựa chọn. Với thiết kế vô cùng mạnh mẽ đậm chất gaming cùng với con chip Intel Core i7 mang lại hiệu năng vượt trội, tự tin chiến mọi loại game, hứa hẹn mang đến cho người dùng trải nghiệm tuyệt vời hơn các dòng laptop trong cùng phân khúc.', 'MSI', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 11', 'Intel Core i7-11800H ( 2.3 GHz - 4.6 GHz / 24MB / 8 nhân, 16 luồng ) i7-11800H', 'Core i7', 'Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 144Hz , không cảm ứng , HD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe - Hỗ trợ Intel Optane', 'M.2 NVMe (Hỗ trợ Intel Optane)', '1 x HDMI', '1 x USB Type C , 3 x USB 3.2 , 1 x 3.5 mm , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '36.34 x 25.5 x 2.39', '4 cell 57', 2.2, 'Nitro 5', 'NH.QENSV.005', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1);
INSERT INTO `sanpham` (`ma_san_pham`, `ten_san_pham`, `hinh_anh`, `bao_hanh`, `gia_goc`, `giam_gia`, `mo_ta_san_pham`, `thuong_hieu`, `created_at`, `updated_at`, `the_he_cpu`, `cpu`, `series_cpu`, `chip_do_hoa_roi`, `ten_ram`, `man_hinh`, `luu_tru`, `so_cong_luu_tru_toi_da`, `kieu_khe_m2_ho_tro`, `cong_xuat_hinh`, `cong_ket_noi`, `ket_noi_khong_day`, `ban_phim`, `he_dieu_hanh`, `kich_thuoc`, `pin`, `khoi_luong`, `series_laptop`, `part_number`, `mau_sac`, `phu_kien_di_kem`, `den_led`, `man_hinh_cam_ung`, `dung_luong_ram`, `so_luong_da_ban`, `noi_bat`, `hien_thi`) VALUES
(45, 'Laptop ACER Predator Triton 300 PT315-53-7440 (i7-11800H/RAM 8GB/512GB SSD/ Windows 11)', '[\"7440.webp\", \"74401.webp\", \"74402.webp\"]', 12, 36990000, 0, 'Laptop ACER Predator Triton 300 (PT315-53-7440 NH.QDRSV.003) cực phẩm gaming được bao bọc bởi thiết kế nguyên khối mạnh mẽ, mọi đường nét của laptop đều toát lên vẻ cá tính nổi bật. Bên trong mang hiệu năng hoàn hảo cho việc xử lý thông tin, chơi game mượt mà, đồ họa đẹp mắt. Đem lại cho bạn những trải nghiệm thú vị khi sử dụng chiếc laptop này.', 'MSI', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 11', 'Intel Core i7-11800H ( 2.3 GHz - 4.6 GHz / 24MB / 8 nhân, 16 luồng ) i7-11800H', 'Core i7', 'Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 2560 x 1440 ) Quad HD (2K) IPS 165Hz , không cảm ứng , HD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI , 1 x mini DisplayPort', '3 x USB 3.2 , 1 x Thunderbolt 4 , 1 x 3.5 mm , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '35.3 x 25.5 x 1.99', '4 cell 59', 2, 'Predator', 'NH.QDRSV.003', 'Đen', 'Adapter', 0, 0, 16, 0, 0, 1),
(46, 'Laptop ACER Predator Helios 300 PH315-54-99S6 (i9-11900H/RAM 16GB/512GB SSD/ Windows 10)', '[\"99s6.webp\", \"99s61.webp\", \"99s62.webp\"]', 12, 41990000, 5, 'Laptop Acer PH315-54-99S6 Predator Helios 300  (NH.QC2SV.006) thu hút không chỉ nhờ vẻ ngoài mạnh mẽ mà còn là vì cấu hình vượt trội, mang đến trải nghiệm làm việc và giải trí rất đáng để mong đợi. Phiên bản laptop cao cấp với tính cơ động hứa hẹn sẽ là người bạn tuyệt vời đồng hành cùng bạn đến bất kỳ đâu. ', 'Huawei', '2023-04-25 08:04:35', NULL, 'Core i9 , Intel Core thế hệ thứ 11', 'Intel Core i9-11900H ( 2.5 GHz - 4.9 GHz / 24MB / 8 nhân, 16 luồng ) i9-11900H', 'Core i9', 'Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 2560 x 1440 ) Quad HD (2K) IPS 165Hz , không cảm ứng , HD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI , 1 x mini DisplayPort', '1 x USB Type C / Thunderbolt , 3 x USB 3.2 , 1 x 3.5 mm , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , RGB', 'Windows 10 Home 64-bit Windows 10', '36.3 x 25.5 x 2.29', '4 cell 59', 2.3, 'Predator', 'NH.QC2SV.006', 'Đen', 'Adapter', 0, 0, 16, 0, 0, 1),
(47, 'Laptop ACER Swift 3 SF314-71-74WD (i7-12700H/RAM 16GB/1TB SSD/ Windows 11)', '[\"74wd.webp\", \"74wd1.webp\", \"74wd2.webp\"]', 12, 34790000, 0, 'Đang cập nhật...', 'Huawei', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 12', 'Intel Core i7-12700H ( 2.3 GHz - 4.7GHz / 24MB / 14 nhân, 20 luồng ) i7-12700H', 'Core i7', 'Onboard Intel Iris Xe Graphics', 'LPDDR5 6400MHz', '14\" ( 2880 x 1800 ) OLED không cảm ứng , HD webcam', '1TB SSD M.2 NVMe /', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB Type C , 2 x USB 3.2 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , không phím số , LED', 'Windows 11 Home Windows 11', '31.29 x 21.40 x 1.79', '3 cell 57', 1.4, 'Swift 3', 'NX.KAWSV.001', 'Vàng', 'Adapter', 0, 0, 4, 0, 0, 1),
(48, 'Laptop Acer Swift 3 SF315-52-38YQ (NX.GZBSV.003) (15.6\" FHD/i3-8130U/4GB/1TB HDD/UHD 620/Win10/1.6 kg)', '[\"38yq.webp\", \"38yq1.webp\", \"38yq2.webp\"]', 12, 13499000, 0, 'Màu Rose Gold sang trọng bao phủ ngoại hình Acer Swift 3 SF315-52-38YQ, đây là màu sắc “không tuổi” ở thời điểm hiện tại do phù hợp với mọi lứa tuổi người dùng. Bên cạnh ngoại hình hấp dẫn, máy còn nổi bật nhờ việc đầu tư pin lớn lên tới 4 cell 48Wh (pin liền) nhưng khối lượng thân máy rất nhẹ cho người dùng cảm giác như một quyển notebook : Chỉ 1.6kg.', 'Macbook', '2023-04-25 08:04:35', NULL, 'Core i3 , Intel Core thế hệ thứ 8', 'Intel Core i3-8130U ( 2.2 GHz - 3.4 GHz / 4MB / 2 nhân, 4 luồng ) i3-8130U', 'Core i3', 'Onboard Intel UHD Graphics 620', 'DDR4 2666MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , HD webcam', '1TB HDD 5400RPM', '1 x 2.5\" SATA , 1 x M.2 SATA/NVMe', 'M.2 SATA/NVMe', '1 x HDMI', '1 x USB Type C , 2 x USB 3.0 , 1 x USB 2.0 , 1 x SD card slot', 'WiFi 802.11ac , Bluetooth 4.2', 'thường , có phím số , không đèn', 'Windows 10 Home SL 64-bit Windows 10', '34 x 23 x 1.8', '4 cell 48', 1.6, 'Swift 3', 'NX.GZBSV.003', 'Vàng', 'Adapter', 0, 0, 8, 0, 0, 1),
(49, 'Laptop ACER Aspire 5 A514-54-5127 (i5-1135G7/RAM 8GB/512GB SSD/ Windows 11)', '[\"5127.webp\", \"51271.webp\", \"51272.webp\"]', 12, 16990000, 12, 'Thuộc dòng Aspire 5 thế hệ mới nhất của ACER, Laptop ACER Aspire 5 A514-54-5127 NX.A28SV.007 khẳng định vị thế của riêng bạn với thiết kế sang trọng, cá tính và mỏng nhẹ đáng kinh ngạc và hiệu năng sẵn sàng bứt phá.', 'Macbook', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nhân, 8 luồng ) i5-1135G7', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'DDR4 2666MHz', '14\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , HD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C , 3 x USB 3.2 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , không phím số , LED', 'Windows 11 Home SL Windows 11', '32.8 x 22.3 x 1.8', '48', 1.5, 'Aspire 5', 'NX.A28SV.007', 'Bạc', 'Adapter', 0, 0, 32, 0, 0, 1),
(50, 'Laptop ACER Nitro 5 AN515-58-52SP (i5-12500H/RAM 8GB/RTX 3050/512GB SSD/ Windows 11)', '[\"52sp.webp\", \"52sp1.webp\", \"52sp2.webp\"]', 12, 29490000, 15, 'Laptop ACER Nitro 5 AN515 -58 -52SP NH.QFHSV.001 được ACER cho ra mắt với vẻ ngoài thu hút hơn bởi thiết kế đậm chất gaming, các cạnh được vát theo khối hình học đầy mạnh mẽ. Đối với những ai là fan của nhà Acer đang muốn tìm hiểu về những dòng laptop gaming Nitro 5 Tiger 2022 mới nhất thì đây sẽ cỗ máy với bộ vi xử lý Intel tuyệt vời nhất dành cho bạn. ', 'Macbook', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-12500H ( 2.5 GHz - 4.5 GHz / 18MB / 12 nhân, 16 luồng ) i5-12500H', 'Core i5', 'Intel Iris Xe Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 144Hz , không cảm ứng , HD webcam', '512GB SSD M.2 NVMe /', '1 x 2.5\" SATA , 2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '3 x USB 3.2 , 1 x Thunderbolt 4 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '36.04 x 27.109 x 2.59', '4 cell 57', 2.5, 'Nitro 5', 'NH.QFHSV.001', 'Đen', 'Adapter', 0, 0, 16, 0, 0, 1),
(51, 'Laptop ASUS TUF Gaming FX506HC-HN144W (i5-11400H/RAM 8GB/RTX 3050/512GB SSD/ Windows 11)', '[\"fx506.webp\", \"fx5061.webp\", \"fx5062.webp\"]', 24, 25990000, 21, 'Laptop ASUS TUF Gaming FX506HC-HN144W 90NR0724-M00FJ0 là một chiếc laptop gaming thuộc hạng nặng với bộ vi xử lý thế hệ mới Intel Core 11 mới nhất và một thiết lập âm thanh tổng thể tuyệt vời. Bằng những cải tiến tối ưu về cả hiệu năng lẫn kiểu dáng Asus muốn mang lại cho người dùng một sản phẩm hoàn hảo mang đến trải nghiệm mới mẻ và vượt trội hơn bao giờ hết.', 'Macbook', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-11400H ( 2.7 GHz - 4.5 GHz / 12MB / 6 nhân, 12 luồng ) i5-11400H', 'Core i5', 'Intel UHD Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 144Hz , không cảm ứng , Màn hình chống lóa , HD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '3 x USB 3.2 , 1 x Thunderbolt 4 , 1 x 3.5 mm , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , RGB', 'Windows 11 Home Windows 11', '35.9 x 25.6 x 2.45', '3 cell 48', 2.5, 'TUF Gaming', '90NR0724-M00FJ0', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(52, 'Laptop ASUS Gaming ROG Strix G513IE-HN246W (Ryzen 7 4800H/RAM 8GB/512GB SSD/ Windows 11)', '[\"g513.webp\", \"g5131.webp\", \"g5132.webp\"]', 24, 26990000, 15, 'Laptop Asus Gaming ROG Strix G513IE-HN246W khoác lên mình một ngoại hình Gaming ấn tượng, mạnh mẽ phù hợp với các game thủ. Đây sẽ là một ứng cử viên sáng giá với khả năng đáp ứng những nhu cầu sử dụng những tác vụ thông thường một cách nhanh chóng, đồng thời hứa hẹn mang đến cho bạn những trải nghiệm trong từng trận game tuyệt vời.', 'Macbook', '2023-04-25 08:04:35', NULL, 'Ryzen 7 , AMD Ryzen thế hệ thứ 4', 'AMD Ryzen 7 4800H ( 2.9 GHz - 4.2 GHz / 8MB / 8 nhân, 16 luồng ) Ryzen 7 4800H', 'AMD Ryzen 7', 'AMD Radeon Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS 144Hz , Màn hình chống lóa', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 3 x USB 3.2 , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , RGB 4 vùng', 'Windows 11 Home Windows 11', '35.4 x 25.9 x 2.06 ~ 2.59', '4 cell 56', 2.1, 'ROG', '90NR0313-M00FJ0', 'Xám', 'Adapter', 0, 0, 16, 0, 0, 1),
(53, 'Laptop ASUS Expertbook B5 B5302CEA-L50916W (i5-1135G7/RAM 8GB/512GB SSD/ Windows 11)', '[\"b530.webp\", \"b5301.webp\", \"b5302.webp\"]', 24, 17230000, 0, 'Đang cập nhật...', 'Macbook', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 11 , Intel EVO', 'Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nhân, 8 luồng ) i5-1135G7', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '13.3\" ( 1920 x 1080 ) Full HD Màn hình chống lóa , HD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x micro HDMI', '1 x USB 3.2 , 2 x Thunderbolt 4 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.0', 'thường , không phím số , LED', 'Windows 11 Home Windows 11', '30.90 x 21.06 x 1.69', '4 cell 66', 1.4, 'ExpertBook', '90NR00301-M00FJ0', 'Đen', 'Adapter', 0, 0, 8, 0, 0, 1),
(54, 'Laptop ASUS Vivobook X515EA-BQ3015W (i7-1165G7/RAM 8GB/512GB SSD/ Windows 11)', '[\"x515.webp\", \"x5151.webp\", \"x5152.webp\"]', 24, 17490000, 0, 'Đang cập nhật...', 'Macbook', '2023-04-25 08:04:35', NULL, 'Core i7 , Intel Core thế hệ thứ 11', 'Intel Core i7-1165G7 ( 2.8 GHz - 4.7 GHz / 12MB / 4 nhân, 8 luồng ) i7-1165G7', 'Core i7', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD IPS không cảm ứng , Màn hình chống lóa , VGA webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB 3.2 Type C , 1 x USB 3.2 , 2 x USB 2.0 , Audio combo', 'WiFi 802.11ac , Bluetooth 4.1', 'thường , có phím số , không đèn', 'Windows 11 Home Windows 11', '36.00 x 23.50 x 1.99', '2 cell 37', 1.8, 'VivoBook', '90NR3123-M00FJ0', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(55, 'Laptop ASUS ROG Strix SCAR 18 G834JY-N6039W (i9-13980HX/RAM 64GB/RTX 4090/2TB SSD/ Windows 11)', '[\"g834.webp\", \"g8341.webp\", \"g8342.webp\"]', 24, 125000000, 8, 'Laptop ROG Strix SCAR luôn là đầu tàu trong dải sản phẩm Laptop Gaming của ROG, và 2023 cũng không khác biệt. ROG Strix SCAR 16 và 18 với khung máy hoàn toàn mới và màn hình tỷ lệ 16:10 thời thượng, trang bị tấm nền lên đên 2K 240Hz, đạt chuẩn ROG Nebula. Bộ vi xử lý CPU Intel Core™ i9 13980HX cho hiệu năng chơi game tuyệt đỉnh, GPU lên đến NVIDIA GeForce RTX 4090 Laptop cùng hệ thống tản nhiệt tân tiến mang đến trải nghiệm chơi game mượt mà nhất trên nền tảng đồ họa đến từ tương lai.', 'Macbook', '2023-04-25 08:04:35', NULL, 'Core i9 , Intel Core thế hệ thứ 13', 'Intel Core i9-13980HX ( 2.2 GHz - 5.6GHz / 36MB / 24 nhân, 32 luồng ) i9-13980HX', 'Core i9', 'Intel UHD Graphics 770', 'DDR5 4800MHz', '18\" ( 2560 x 1600 ) WQXGA 240Hz , không cảm ứng , Màn hình chống lóa , HD webcam', '2TB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x Thunderbolt 4 , Audio combo , LAN 2500 Mbps', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , có phím số , RGB', 'Windows 11 Home Windows 11', '39.9 x 29.4 x 2.31 ~ 3.08', '4 cell 90', 3.1, 'ROG', '90NR31032-M00FJ0', 'Đen', 'Adapter', 0, 0, 16, 0, 0, 1),
(56, 'Laptop Dell Inspiron 14 5420 (i5-1235U/RAM 8GB/512GB SSD/ Windows 11 + Office)', '[\"5420.webp\", \"54201.webp\", \"54202.webp\"]', 24, 22990000, 14, 'Laptop Dell Inspiron 14 5420 i5 U085W11SLU chiếc laptop dành cho đa dạng nhu cầu sử dụng? Đúng, với dòng series mới này của Dell hãng đã tinh chỉnh lựa chọn linh kiện khá hợp lý với chip Intel core i5 thế hệ 12 mới nhất tại thời điểm ra mắt. Dải nhu cầu chi tiết cho chiếc laptop này nằm ở các yêu cầu như học sinh, sinh viên, nhân viên văn phòng là chủ yếu, hỗ trợ đầy đủ hiệu năng với các vụ vừa phải.', 'Macbook', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1235U ( 1.3 GHz - 4.4GHz / 12MB / 10 nhân, 12 luồng ) i5-1235U', 'Core i5', 'Onboard Intel UHD Graphics', 'DDR4 3200MHz', '14\" ( 1920 x 1200 ) Full HD+ WVA không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe /', '1 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C , 2 x USB 3.2 , 1 x SD card slot , 1 x 3.5 mm', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , không phím số , LED', 'Windows 11 Home SL + Office Home & Student 2021 Windows 11 + Office', '22.75 x 31.4 x 1.837', '4 cell 54', 1.5, 'Inspiron', 'i5U085W11SLU', 'Bạc', 'Adapter', 0, 0, 8, 0, 0, 1),
(57, 'Laptop Dell Vostro 3510 (i5-1135G7/RAM 8GB/512GB SSD/ Windows 11 + Office)', '[\"3510.webp\", \"35101.webp\", \"35102.webp\"]', 12, 22990000, 24, 'Laptop Dell Vostro 3510 P112F002BBL với thiết kế vẻ ngoài đơn giản thanh lịch, bên trong với hiệu năng xử lý khá mạnh mẽ cùng với chip Intel core i5. Được tối ưu hóa trọng lượng, mang đến trải nghiệm nhẹ nhàng và thoải mái cho người dùng. Là lựa chọn hoàn hảo cho những người thích sự gọn nhẹ và linh hoạt, nhất là các bạn sinh viên và nhân viên văn phòng.', 'Macbook', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-1135G7 ( 2.4 GHz - 4.2 GHz / 8MB / 4 nhân, 8 luồng ) i5-1135G7', 'Core i5', 'Intel Iris Xe Graphics', 'DDR4 3200MHz', '15.6\" ( 1920 x 1080 ) Full HD WVA không cảm ứng , HD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB 3.2 , 1 x USB 2.0 , 1 x SD card slot , Audio combo , LAN 1 Gb/s', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.1', 'thường , có phím số', 'Windows 11 Home SL + Office Home & Student 2021 Windows 11 + Office', '35.8 x 23.5 x 1.89', '3 cell 42', 1.7, 'Vostro', 'P112F002BBL', 'Đen', 'Adapter, dây nguồn, HDSD,…', 0, 0, 16, 0, 0, 1),
(58, 'Laptop Dell Vostro 5620 (i5-1240P/RAM 16GB/512GB SSD/ Windows 11)', '[\"5620.webp\", \"56201.webp\"]', 12, 25690000, 11, 'Laptop Dell Vostro 5620 70282719 được thiết kế theo phong cách hiện đại với tông màu xám thanh lịch. Vostro 5620 cũng được trang bị hiệu năng vượt trội từ bộ vi xử lý và màn hình lên đến 16 inch phù hợp với khả năng xử lý công việc, học tập, giải trí và đa nhiệm dễ dàng. Đây sẽ là sự lựa chọn hoàn hảo dành cho những khách hàng yêu thích sử dụng dòng laptop có màn hình hiển thị lớn. ', 'Macbook', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1240P ( 1.7 GHz - 4.4GHz / 12MB / 12 nhân, 16 luồng ) i5-1240P', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '16\" ( 1920 x 1200 ) WUXGA WVA không cảm ứng , FHD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB 3.2 , 2 x Thunderbolt 4 , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.0', 'thường , không phím số , LED', 'Windows 11 Home Windows 11', '35.6 x 25.2 x 1.8', '4 cell', 1.9, 'Vostro', '70282719', 'Xám', 'Adapter', 0, 0, 8, 0, 0, 1),
(59, 'Laptop Dell Inspiron 14 T7420 (i5-1235U/RAM 8GB/512GB SSD/ Windows 11 + Office)', '[\"t7420.webp\", \"t74201.webp\", \"t74202.webp\"]', 24, 24890000, 11, 'Đang cập nhật...', 'Macbook', '2023-04-25 08:04:35', NULL, 'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-1235U ( 1.3 GHz - 4.4GHz / 12MB / 10 nhân, 12 luồng ) i5-1235U', 'Core i5', 'Onboard Intel Iris Xe Graphics', 'DDR4 3200MHz', '14\" ( 1920 x 1200 ) Full HD+ WVA cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '2 x USB Type C / DisplayPort / Power Delivery , 1 x USB 3.2 , 1 x SD card slot , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , không phím số , LED', 'Windows 11 Home SL + Office Home & Student 2021 Windows 11 + Office', '31.40 x 22.75 x 1.78', '4 cell 54', 1.6, 'Inspiron', 'N4I5021W', 'Bạc', 'Adapter', 0, 0, 8, 0, 0, 1),
(60, 'Laptop Dell Inspiron 15 5625 (Ryzen 7 5825U/RAM 8GB/512GB SSD/ Windows 11 + Office)', '[\"5625.webp\", \"56251.webp\", \"56252.webp\"]', 12, 22990000, 18, 'Laptop Dell Inspiron 15 5625 99VP91 Bạc được thiết kế theo xu hướng tối giản theo đúng tiêu chuẩn của một chiếc máy tính phổ thông. Cùng với hiệu năng mạnh mẽ, laptop này sẽ giúp đáp ứng tốt các nhu cầu và hứa hẹn sẽ mang đến trải nghiệm tuyệt vời đến khách hàng.', 'Macbook', '2023-04-25 08:04:35', NULL, 'Ryzen 7', 'AMD Ryzen 7 5825U ( 2.0 GHz - 4.5 GHz / 16MB / 8 nhân, 16 luồng ) Ryzen 7 5825U', 'AMD Ryzen 7', 'Onboard AMD Radeon Graphics', 'DDR4 3200MHz', '16\" ( 1920 x 1200 ) Full HD+ WVA không cảm ứng , Màn hình chống lóa , FHD webcam', '512GB SSD M.2 NVMe /', '2 x M.2 NVMe', 'M.2 NVMe', '1 x HDMI', '1 x USB Type C / DisplayPort / Power Delivery , 2 x USB 3.2 , 1 x SD card slot , Audio combo', 'WiFi 802.11ax (Wifi 6) , Bluetooth 5.2', 'thường , LED', 'Windows 11 Home SL + Office Home & Student 2021 Windows 11 + Office', '35.68 x 25.19 x 1.79', '4 cell 54', 1.8, 'Inspiron', '99VP91', 'Bạc', 'Adapter', 0, 0, 16, 0, 0, 1);

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
(1, 'bttan', 0, '$2y$10$12QGE/POO4/oaU.g7Fq3juFcl8AAJyJEZAxRpq.pLLWsieYHV8qOy', '2023-03-24 11:32:15'),
(2, 'bttan1', 0, '$2y$10$npvkuJLXKjOKDFz3vgV2OOUKyopzReaY5.1wpHqQy49oBtwgPZD1.', '2023-03-24 11:38:09'),
(3, 'hung', 1, '$2y$10$T4R2dSyO2owZoX29PUEMDe2TLHgTcRH/WD.Duw3gTGxT5200hzkdq', '2023-04-02 10:08:23'),
(4, 'lam', 11, '$2y$10$FH.XFfsp.whb6EOQ.LyLI.kCMOfQZ.Rg.Q7BqWn8UK/4fRxVbLmxq', '2023-04-06 04:35:50'),
(6, 'huy', 11, '$2y$10$fgElQGaKTqah1nqaCDrM5uddEZvWi0lUy.7Ts7Je17fUablL1tipm', '2023-04-07 03:59:03'),
(7, 'hieu', 6, '$2y$10$rmWN.HAj9PszOfuNhw2kuuERu6JD0NuxMT.0F.SJBe/re5MxcZGTq', '2023-04-08 01:59:07');

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
(7, 'Huawei', '<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"1.1\" id=\"Capa_1\" x=\"0px\" y=\"0px\" viewBox=\"0 0 24 24\" style=\"enable-background:new 0 0 24 24;\" xml:space=\"preserve\" width=\"32\" height=\"32\"><g><polygon points=\"2.902,21.586 1.094,21.586 1.094,19.994 0.293,19.994 0.293,23.941 1.094,23.941 1.094,22.338 2.902,22.338    2.902,23.941 3.703,23.941 3.703,19.994 2.902,19.994  \"/><path d=\"M7.414,22.253c0,0.642-0.319,0.984-0.897,0.984c-0.582,0-0.902-0.353-0.902-1.011v-2.23H4.813v2.257   C4.813,23.363,5.43,24,6.506,24c1.086,0,1.709-0.649,1.709-1.78v-2.226H7.414V22.253z\"/><polygon points=\"16.67,22.708 15.773,19.993 15.12,19.993 14.224,22.708 13.352,19.996 12.499,19.996 13.875,23.941 14.538,23.941    15.436,21.349 16.333,23.941 17.002,23.941 18.374,19.996 17.543,19.996  \"/><polygon points=\"19.81,22.242 21.267,22.242 21.267,21.523 19.81,21.523 19.81,20.715 21.924,20.715 21.924,19.997 19.02,19.997    19.02,23.939 22,23.939 22,23.22 19.81,23.22  \"/><rect x=\"22.955\" y=\"19.994\" width=\"0.79\" height=\"3.942\"/><path d=\"M11.604,23.117l0.354,0.821h0.839l-1.732-3.944h-0.706L8.62,23.938h0.818l0.36-0.821H11.604z M10.699,20.992l0.607,1.413   h-1.211L10.699,20.992z\"/><path d=\"M22.047,7.008c0.13-2.021-1.904-3.891-1.904-3.891s-3.772,4.569-6.521,10.569c-0.014,0.031-0.019,0.084,0.013,0.112   c0.022,0.018,0.063,0.031,0.106,0.01c1.03-0.511,5.314-2.717,7.118-4.439C20.859,9.369,21.987,8.463,22.047,7.008 M17.239,2.448   c0,0-0.472-1.761-2.385-2.226c0,0-0.551-0.14-1.137-0.222c0,0-2.139,2.753-1.099,13.142c0.005,0.054,0.035,0.074,0.059,0.081   c0.039,0.01,0.076-0.004,0.102-0.041c0.686-0.991,3.813-5.626,4.448-8.445C17.227,4.737,17.571,3.373,17.239,2.448 M14.307,15.276   c-0.011,0.023-0.021,0.079,0.022,0.11c0.691,0.495,2.785,1.96,3.794,2.244c0,0,1.866,0.636,3.486-2.148   c0,0-5.423-0.189-7.226-0.252C14.358,15.229,14.321,15.247,14.307,15.276 M23.53,9.1c0,0-6.135,3.295-9.307,5.432   c-0.023,0.016-0.053,0.047-0.037,0.103c0.008,0.03,0.037,0.057,0.075,0.057c1.135,0.002,5.435,0.007,5.543-0.013   c0,0,0.556-0.022,1.243-0.286c0,0,1.529-0.486,2.323-2.223C23.37,12.171,24.078,10.755,23.53,9.1 M9.77,14.532   C6.598,12.395,0.463,9.1,0.463,9.1c-0.548,1.655,0.16,3.071,0.16,3.071c0.794,1.736,2.323,2.223,2.323,2.223   c0.687,0.264,1.243,0.286,1.243,0.286c0.108,0.02,4.408,0.015,5.543,0.013c0.038,0,0.067-0.027,0.075-0.057   C9.822,14.579,9.793,14.548,9.77,14.532 M9.61,15.23c-1.803,0.063-7.226,0.252-7.226,0.252C4.005,18.266,5.87,17.63,5.87,17.63   c1.009-0.284,3.104-1.749,3.794-2.244c0.044-0.031,0.033-0.088,0.022-0.11C9.672,15.247,9.635,15.229,9.61,15.23 M9.139,0.222   C7.226,0.687,6.754,2.448,6.754,2.448C6.422,3.373,6.766,4.737,6.766,4.737c0.635,2.819,3.762,7.455,4.448,8.445   c0.026,0.037,0.063,0.051,0.102,0.041c0.025-0.007,0.054-0.026,0.06-0.081C12.415,2.753,10.276,0,10.276,0   C9.69,0.082,9.139,0.222,9.139,0.222 M3.85,3.117c0,0-2.034,1.87-1.904,3.891c0.06,1.455,1.188,2.361,1.188,2.361   c1.805,1.721,6.088,3.927,7.118,4.439c0.042,0.021,0.083,0.008,0.106-0.01c0.033-0.028,0.027-0.08,0.013-0.112   C7.622,7.685,3.85,3.117,3.85,3.117\"/></g></svg>', 'huawei.jpg', 1),
(8, 'Dell', '<svg fill=\"#000000\" width=\"32\" height=\"32\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\" role=\"img\"><path d=\"M17.963 14.6V9.324h1.222v4.204h2.14v1.07h-3.362zm-9.784-3.288l2.98-2.292c.281.228.56.458.841.687l-2.827 2.14.611.535 2.827-2.216c.281.228.56.458.841.688a295.83 295.83 0 0 1-2.827 2.216l.61.536 2.83-2.295-.001-1.986h1.223v4.204h2.216v1.07h-3.362v-1.987c-.995.763-1.987 1.529-2.981 2.292l-2.981-2.292c-.144.729-.653 1.36-1.312 1.694-.285.147-.597.24-.915.276-.183.022-.367.017-.551.017H3.516V9.325H5.69a2.544 2.544 0 0 1 1.563.557c.454.36.778.872.927 1.43m-3.516-.917v3.21l.953-.001a1.377 1.377 0 0 0 1.036-.523 1.74 1.74 0 0 0 .182-1.889 1.494 1.494 0 0 0-.976-.766c-.166-.04-.338-.03-.507-.032h-.688zM11.82 0h.337a11.94 11.94 0 0 1 5.405 1.373 12.101 12.101 0 0 1 4.126 3.557A11.93 11.93 0 0 1 24 11.82v.36a11.963 11.963 0 0 1-3.236 8.033A11.967 11.967 0 0 1 12.182 24h-.361a11.993 11.993 0 0 1-4.145-.806 12.04 12.04 0 0 1-4.274-2.836A12.057 12.057 0 0 1 .576 15.67 12.006 12.006 0 0 1 0 12.181v-.361a11.924 11.924 0 0 1 1.992-6.396 12.211 12.211 0 0 1 4.71-4.172A11.875 11.875 0 0 1 11.82 0m-.153 1.23a10.724 10.724 0 0 0-6.43 2.375 10.78 10.78 0 0 0-3.319 4.573 10.858 10.858 0 0 0 .193 8.12 10.788 10.788 0 0 0 3.546 4.421 10.698 10.698 0 0 0 4.786 1.946c1.456.209 2.955.124 4.376-.26a10.756 10.756 0 0 0 5.075-3.062 10.742 10.742 0 0 0 2.686-5.28 10.915 10.915 0 0 0-.122-4.682 10.77 10.77 0 0 0-7.098-7.626 10.78 10.78 0 0 0-3.693-.525z\"/></svg>', 'dell.jpg', 1),
(9, 'LG', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"32\" height=\"32\" viewBox=\"0 0 192.756 192.756\"><path fill=\"#fff\" d=\"M0 0h192.756v192.756H0z\"/><path d=\"M59.467 39.781c-31.312 0-56.633 25.392-56.633 56.633 0 31.24 25.321 56.562 56.633 56.562 31.241 0 56.559-25.32 56.559-56.562S90.708 39.781 59.467 39.781zM38.64 68.882c3.709 0 6.776 3.067 6.776 6.775 0 3.78-3.067 6.848-6.776 6.848a6.85 6.85 0 0 1-6.847-6.848c0-3.708 3.067-6.775 6.847-6.775zm26.676 54.778h-7.988V70.309h5.278v48.002h10.698v5.35l-7.988-.001zm0 16.903c20.042-2.639 35.876-18.688 38.3-38.801H73.304v-5.563h35.164c0 25.034-18.83 45.934-43.152 48.93-1.926.215-3.923.285-5.849.285-7.489 0-14.551-1.642-20.827-4.563-16.69-7.847-28.316-24.822-28.316-44.437S21.95 59.824 38.64 51.978c5.991-2.782 12.696-4.422 19.757-4.636v4.565a43.95 43.95 0 0 0-19.757 5.135c-14.122 7.489-23.751 22.325-23.751 39.372s9.629 31.883 23.751 39.371c6.206 3.28 13.267 5.135 20.827 5.135 1.926 0 3.923-.144 5.849-.357zM119.81 117.599V78.796h12.768v29.743h17.475v9.06H119.81zm70.112.141h-8.272l-.43-3.853c-2.14 2.496-5.636 4.777-11.769 4.777-9.914 0-18.83-6.418-18.83-19.971 0-12.41 7.774-20.897 20.397-20.897 9.344 0 16.834 4.85 18.402 14.408h-12.125c-.928-3.21-3.209-4.922-6.562-4.922-4.992 0-7.346 4.565-7.346 11.341 0 5.492 1.711 10.557 8.131 10.557 2.568 0 5.92-1.783 6.562-4.494h-5.635V96.34h17.475l.002 21.4z\"/></svg>', 'lg.jpg', 1);

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
  MODIFY `ma_bao_hanh` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `chucnang`
--
ALTER TABLE `chucnang`
  MODIFY `ma_chuc_nang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `ma_don_hang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `hinhanh`
--
ALTER TABLE `hinhanh`
  MODIFY `ma_hinh_anh` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

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
  MODIFY `ma_phieu_nhap` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `quyenhang`
--
ALTER TABLE `quyenhang`
  MODIFY `ma_quyen_hang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `ma_san_pham` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
