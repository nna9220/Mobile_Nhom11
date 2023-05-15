-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th5 15, 2023 lúc 07:39 AM
-- Phiên bản máy phục vụ: 10.5.16-MariaDB
-- Phiên bản PHP: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `id20732267_vnvlstore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `MAHD` int(11) NOT NULL,
  `MASANPHAM` int(11) NOT NULL,
  `DONGIA` bigint(20) DEFAULT NULL,
  `SOLUONG` int(11) DEFAULT NULL,
  `TONGITEN` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`MAHD`, `MASANPHAM`, `DONGIA`, `SOLUONG`, `TONGITEN`) VALUES
(65, 69, 490000, 5, 2450000),
(66, 69, 490000, 1, 490000),
(67, 74, 490000, 1, 490000),
(68, 74, 490000, 2, 980000),
(68, 76, 299000, 1, 299000),
(69, 70, 649000, 1, 649000),
(70, 72, 399000, 2, 798000),
(71, 72, 399000, 5, 1995000);

--
-- Bẫy `chitiethoadon`
--
DELIMITER $$
CREATE TRIGGER `trg_chitiethoadon` BEFORE INSERT ON `chitiethoadon` FOR EACH ROW UPDATE sanpham SET SOLUONG = SOLUONG - new.SOLUONG 
    WHERE MASANPHAM = new.MASANPHAM
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MAHD` int(11) NOT NULL,
  `MAKH` varchar(10) DEFAULT NULL,
  `TONGTIEN` bigint(20) DEFAULT NULL,
  `NGAYLAPHOADON` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`MAHD`, `MAKH`, `TONGTIEN`, `NGAYLAPHOADON`) VALUES
(65, 'Nanguyen', 2450000, '2023-05-11'),
(66, 'vee', 490000, '2023-05-11'),
(67, 'hoangvu', 490000, '2023-05-11'),
(68, 'linhtando', 1279000, '2023-05-14'),
(69, 'hoangvu', 649000, '2023-05-14'),
(70, 'vidao', 798000, '2023-05-15'),
(71, 'vidao', 1995000, '2023-05-15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `USERNAME` varchar(10) NOT NULL,
  `TENKH` varchar(100) DEFAULT NULL,
  `MATKHAU` varchar(100) DEFAULT NULL,
  `DIACHI` varchar(100) DEFAULT NULL,
  `SODT` int(11) DEFAULT NULL,
  `HINHANH` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`USERNAME`, `TENKH`, `MATKHAU`, `DIACHI`, `SODT`, `HINHANH`) VALUES
('hoangvu', 'Vũ', '827ccb0eea8a706c4c34a16891f84e7b', 'thu duc', 397611383, ''),
('linhtando', 'Đỗ Nguyễn Tấn Linh', '8c9eab591869449e38c6ab1785db8fd7', 'thủ đức, Hồ Chí Minh', 123456788, 'Screenshot_2023-03-31-11-28-43-161684054902603.jpg'),
('Nanguyen', 'Na', '202cb962ac59075b964b07152d234b70', '01', 987654321, 'IMG_20230513_2128131683991949517.jpg'),
('vee', 'Dao Vi', '202cb962ac59075b964b07152d234b70', 'Tang Nhon Phu', 987654321, ''),
('vi1', 'Vi', '202cb962ac59075b964b07152d234b70', '123 HCM', 987654321, 'c325241f7fce2ae4bbc8e5db0a965b7f1684134841363.jpg'),
('vidao', 'DaoThiThanhVi', '202cb962ac59075b964b07152d234b70', 'Q9', 988765761, '20230512_1559281684134735990.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `MALSANPHAM` int(11) NOT NULL,
  `TENLSANPHAM` varchar(20) DEFAULT NULL,
  `HINHANH` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`MALSANPHAM`, `TENLSANPHAM`, `HINHANH`) VALUES
(65, 'MH Conan', 'https://fdcvshop.com/wp-content/uploads/2020/06/104884350_2695225604088208_3655347837364771996_n.jpg'),
(66, 'MH LOL', 'https://sapo.dktcdn.net/100/441/564/variants/lolnd04-1670665990982.jpg'),
(67, 'MH Pacific Rim', 'https://media.forbiddenplanet.com/products/21/ba/dc987acbfa716832add6bef9d277c27e72c8.jpeg'),
(68, 'MH Game', 'https://images2.thanhnien.vn/Uploaded/nthanhluan/2021_11_23/picture22-2438.png'),
(69, 'MH Kimetsu No Yaiba', 'https://my-test-11.slatic.net/p/8bbd977de13917a9aa09d8a1e5c2a92f.jpg'),
(70, 'MH Tokyo Ghoul', 'https://i.bbcosplay.com/10876/z3088244413154_5aed3456ed7267b70355824000fce4ef.jpg'),
(71, 'MH Siêu nhân', 'https://cf.shopee.vn/file/f555dd8b0341c6f95a3ee76d748c503f'),
(72, 'MH Sailor Moon', 'https://my-live-02.slatic.net/p/89497d3f14a6160c3ddd44740be73c38.jpg'),
(73, 'MH Lính', 'https://vn-test-11.slatic.net/original/d9cfca33beea6ebb42367e47d11d559e.jpg'),
(76, 'MH Attack on Titan', 'https://fado.vn/blog/wp-content/uploads/2021/02/mo-hinh-attack-on-titan-1-1.jpg'),
(77, 'MH Dragon Ball', 'https://tinyurl.com/2q2y6wsj'),
(78, 'MH Naruto', 'https://tinyurl.com/2esq7jkw'),
(79, 'MH Pokemon', 'https://tinyurl.com/2o2mrtqg'),
(80, 'MH Avengers', 'https://tinyurl.com/2o2s4w2m'),
(85, 'MH Fate/Stay Night', 'https://lzd-img-global.slatic.net/g/p/34be9ed8470a6d4c3ecf3df435d2b78f.jpg_1200x1200q80.jpg_.webp'),
(86, 'MH Xe', 'https://vn-live-01.slatic.net/p/b712f3418bb7d7c045d699664b1df66a.jpg'),
(87, 'MH One Piece', 'https://tinyurl.com/2qndsu4m'),
(90, 'MH LEGO', 'https://cipershop.com/public/userfiles/products/bo-6-nhan-vat-lap-rap-one-piece-xp036.webp'),
(91, 'MH Nendoroid', 'https://cipershop.com/public/userfiles/products/mo-hinh-nendoroid-657-figure-nendoroid-dazai-osamu-657.webp'),
(92, 'hehe', 'C.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MANV` varchar(100) NOT NULL,
  `MATKHAU` varchar(100) DEFAULT NULL,
  `HOTEN` varchar(20) DEFAULT NULL,
  `GIOITINH` varchar(3) DEFAULT NULL,
  `NGAYSINH` date DEFAULT NULL,
  `DIACHI` varchar(30) DEFAULT NULL,
  `SODT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MASANPHAM` int(11) NOT NULL,
  `TENSANPHAM` varchar(200) DEFAULT NULL,
  `GIATIEN` bigint(20) DEFAULT NULL,
  `SOLUONG` int(11) DEFAULT NULL,
  `GIATIENKHUYENMAI` bigint(20) DEFAULT NULL,
  `MOTA` varchar(500) DEFAULT NULL,
  `HINHANH` varchar(255) DEFAULT NULL,
  `NGAYCAPNHAT` date DEFAULT NULL,
  `MALSANPHAM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MASANPHAM`, `TENSANPHAM`, `GIATIEN`, `SOLUONG`, `GIATIENKHUYENMAI`, `MOTA`, `HINHANH`, `NGAYCAPNHAT`, `MALSANPHAM`) VALUES
(65, 'Mô hình Bracer Phoenix', 469000, 10, 0, 'Tên sản phẩm: Bracer Phoenix\r\nChất liệu: Nhựa PVC\r\nCao: 18cm\r\nHàng nguyên hộp\r\nTrọng lượng: 350g', 'https://tinyurl.com/2m46cokq', '2023-05-12', 67),
(66, 'Mô hình Gipsy Avenger trong Pacific Rim Uprising Siêu Đại Chiến Thái bình Dương', 275000, 10, 0, '- Mô hình Gipsy Avenger trong Pacific Rim Uprising Siêu Đại Chiến Thái bình Dương\r\n- Chất Liệu : Nhựa nguyên sinh, an toàn cho người sử dụng\r\n- Khớp có thể cử động, tạo hình dễ dàng\r\n- Đầy đủ box và phụ kiện\r\n- Hàng hóa chất lượng, giá cả cạnh tranh\r\n*** Sản phẩm tặng kèm đế Base', 'https://tinyurl.com/2z2qq532', '2023-05-10', 67),
(67, 'Mô hình Crimson Typhoon JEAGER PACIFIC RIM NECA', 420000, 10, 0, '- Tên Sản Phẩm : Crimson Typhoon JEAGER PACIFIC RIM NECA\r\n- Phong cách : Động, có thể chuyển khớp\r\n- Chất liệu : Nhựa\r\n- Chiều Cao : 20 cm\r\n- Nhân vật Crimson Typhoon trong bom tấn Pacific Rim\r\n- Phụ kiện: Đầy đủ như hình Mô Tả\r\n- Hàng mới 100% fullbox', 'https://tinyurl.com/2lnpvnnx', '2023-05-12', 67),
(68, 'Mô Hình Robot Jaeger Extermination Guerrilla', 400000, 10, 0, '-  Tên Sản Phẩm: Robot Jaeger Extermination Guerrilla\r\n-  Thương hiệu : Sluban\r\n-  Số lượng mảnh ghép: 542pcs\r\n-  Sản phẩm làm từ nhựa sinh học ABS không mùi cực kỳ an toàn cho trẻ nhỏ\r\n-  Tiêu chuẩn chất lượng: 3C, EN71, ASTM, \r\n-  Kích thước hộp:  42.5 * 28.5 * 6.7cm\r\n-  Kích Thước Mô Hình : 40.9 * 33.2 * 12.4cm\r\n-  Độ tuổi phù hợp : Từ 6 Tuổi trở lên.', 'https://tinyurl.com/2os4nh5d', '2023-05-12', 67),
(69, 'Mô hình nhân vật Conan Ván Trượt - Figure Kudo Shinichi 1/4', 549000, 0, 490000, 'Tên sản phẩm: Conan Ván Trượt  - Kudo Shinichi Ball\r\nMã SP: CP02177\r\nChất liệu: Nhựa PVC\r\nQuy cách: Đóng hộp\r\nKích thước: Tỉ lệ 1/4 ~ 32cm\r\nKích thước hộp: 20 x 20 x 33cm\r\nXuất sứ: Trung Quốc\r\nTrọng lượng: 1000gr', 'https://lzd-img-global.slatic.net/g/p/c0398d83eb5578574b60f9da86d776c2.jpg_1200x1200q80.jpg_.webp', '2023-05-12', 65),
(70, 'Mô hình nhân vật Shinichi Kudo - Thám tử conan GK - Figure Conan', 790000, 4, 649000, 'Tên sản phẩm: Shinichi Kudo - Thám tử conan\r\nMã SP: CP02169\r\nChất liệu: Nhựa PVC\r\nCao: Khoảng 26cm\r\nKích thước hộp: 18 x 19 x 30cm\r\nXuất sứ: Trung Quốc\r\nQuy cách: Đóng hộp\r\nTrọng lượng: 1000gr', 'https://lzd-img-global.slatic.net/g/p/5b5ddcf5628d50cf25aaa7ad2de2d8e1.jpg_1200x1200q80.jpg_.webp', '2023-05-12', 65),
(71, 'Mô Hình Jaeger Guardian Bravo - Ice Front Protector', 400000, 10, 0, '- Tên Gọi : Jaeger Guardian Bravo - Ice Front Protector\r\n- Model: B1151\r\n- Số Mảnh Ghép: 585 PCS\r\n- Kích Thước Mô Hình : 23.1x14.7x9cm\r\n- Kích Thước Hộp : 42.5x28.5x6.7cm\r\n- Chất liệu: Nhựa ABS cao cấp\r\n- Tiêu chuẩn chất lượng: 3C, EN71, ASTM, HR4040\r\n- Độ tuổi phù hợp : 6 Tuổi Trở Lên', 'https://tinyurl.com/2kg6v3lh', '2023-05-12', 67),
(72, 'Mô Hình Figma Edogawa Conan - FigFIX Conan Edogawa and Figma Criminal - Figure Action', 479000, 22, 399000, 'Tên sản phẩm: Figma Edogawa Conan SP001 - SP058\r\nMã SP: CP01976\r\nKích thước: Conan: 9cm - Criminal: 13cm\r\nQuy cách: Đóng hộp\r\nKích thước hộp: 8 x 15 x 22cm\r\nChất liệu: Nhựa PVC cao cấp\r\nTrọng lượng: 300gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-figma-edogawa-conan-figfix-conan-edogawa-and-figma-criminal-figure-action.webp', '2023-05-12', 65),
(73, 'Mô hình nhân vật Conan Đá Bóng - Figure Kudo Shinichi 1/4 - Ball', 599000, 9, 490000, 'Tên sản phẩm: Conan Đá Bóng - Kudo Shinichi Ball\r\nMã SP: CP0085\r\nChất liệu: Nhựa PVC\r\nQuy cách: Đóng hộp\r\nKích thước: Tỉ lệ 1/4 ~ 30cm\r\nKích thước hộp: 11 x 20 x 31cm\r\nXuất sứ: Trung Quốc\r\nTrọng lượng: 600gr', 'https://vn-live-01.slatic.net/p/461fcb0fcb8905a2a9b866a59e216354.jpg', '2023-05-12', 65),
(74, 'Mô hình nhân vật Conan - Figure Kudo Shinichi 1/4', 599000, 13, 490000, 'Tên sản phẩm: Conan - Kudo Shinichi\r\nMã SP: CP0082\r\nChất liệu: Nhựa PVC\r\nQuy cách: Đóng hộp\r\nKích thước: Tỉ lệ 1/4 ~ 30cm\r\nKích thước hộp: 11 x 20 x 31cm\r\nXuất sứ: Trung Quốc\r\nTrọng lượng: 600gr', 'https://cipershop.com/public/userfiles/images/do-choi-mo-hinh/Conan/conan-0082/figure-kudo-shinichi.jpg', '2023-05-12', 65),
(75, 'Mô hình Ootengu Đại thiên cẩu - Onmyoji', 590000, 10, 0, 'Tên nhân vật: Ootengu Đại thiên cẩu\r\nMã SP: CP02187\r\nKích thước: Khoảng 22cm\r\nKích thước hộp: 22 x 27 x 29cm\r\nChất liệu: nhựa PVC cao cấp\r\nQuy cách: Đóng hộp \r\nTrọng lượng: 1200gr', 'https://tinyurl.com/2jttt7r6', '2023-05-12', 68),
(76, 'Mô hình nhím Sonic The Hedgehog - Có giá đỡ điện thoại', 299000, 9, 0, '~ Tên sản phẩm: Sonic The Hedgehog\r\n~ Mã SP: CP0376\r\n~ Chất liệu: Nhựa PVC\r\n~ Kích thước: Khoảng 18cm\r\n~ Kích thước hộp: 14 x 22 x 28cm\r\n~ Quy cách: Đóng hộp\r\n~ Trọng lượng: 500gr', 'https://tinyurl.com/2nu9e9o5', '2023-04-14', 68),
(77, 'Mô hình Gấu Pandaren Brewmaster', 890000, 10, 0, 'Tên sản phẩm: Pandaren Brewmaster\r\nMã SP: CP01555\r\nChất liệu: Nhựa PVC\r\nKích thước: 21cm\r\nQuy cách: Đóng hộp đẹp\r\nTrọng lượng: 2000gr', 'https://tinyurl.com/2zsnxx58', '2023-04-14', 68),
(78, 'Mô hình Monster Hunter World Iceborne Velkhana', 549000, 10, 0, 'Tên nhân vật: Iceborne Velkhana\r\nMã SP: CP02105\r\nKích thước: Khoảng 20cm\r\nQuy cách: Đóng hộp\r\nKích thước hộp: 14 x 23 x 27cm\r\nChất liệu: Nhựa PVC cao cấp\r\nTrọng lượng: 800gr', 'https://tinyurl.com/2lb9bhsh', '2023-04-14', 68),
(79, 'Mô hình Riven Quán Quân - Mô hình LOL', 349000, 11, 349, 'Tên sản phẩm: Riven Quán Quân\r\nMã SP: CP01800\r\nKích thước: Khoảng 21cm\r\nKích thước hộp: 9 x 17 x 26cm\r\nQuy cách: Đóng hộp đẹp\r\nTrọng lượng: 550gr', 'https://salt.tikicdn.com/ts/tmp/4f/a4/18/279fc1b0e4c3276f05721b1bf8a031a0.jpg', '2023-04-14', 66),
(80, 'Mô hình Vayne Valentine - Vaynelentine - Mô hình LOL', 649000, 25, 349000, 'Tên nhân vật: Vaynelentine - Liên Minh Huyền Thoại\r\nMã SP: CP0879\r\nKích thước: 25cm\r\nQuy cách: Đóng hộp đẹp\r\nChất liệu: Nhựa PVC cao cấp\r\nTrọng lượng: 700gr', 'https://cipershop.com/public/userfiles/images/do-choi-mo-hinh/lol/vayne-0879/mo-hinh-tuong-vayne.jpg', '2023-04-14', 66),
(81, 'Mũ Cosplay Teemo - League of Legends', 130000, 2, 99000, 'Tên sản phẩm: Mũ nón Cosplay Teemo\r\nMã SP: CP0317\r\nKích thước: Đường kính 20cm - Đường kính vành: 25cm\r\nChất liệu: Vải\r\nTrọng lượng: 200gr', 'https://my-live-02.slatic.net/p/864cb1fb23316c9df3e7fbeb4313d28a.jpg', '2023-04-14', 66),
(82, 'Mô hình Leesin Quyền Thái', 279000, 33, 89000, 'Tên nhân vật: Leesin\r\nMẫu: Quyền Thái\r\nKích thước: 19cm\r\nTrọng lượng: 400gr\r\nChất liệu: Nhựa PVC cao cấp\r\nXuất xứ: Trung Quốc', 'https://cipershop.com/public/userfiles/images/do-choi-mo-hinh/leesin-quyen-thai/mo-hinh-leesin-quyen-thai.jpg', '2023-04-14', 66),
(83, 'Mô hình figure Leesin – Liên minh huyền thoại', 310000, 12, 310000, 'Tên nhân vật: Leesin\r\nMẫu: Đứng tấn\r\nKích thước: 19cm\r\nTrọng lượng: 400gr\r\nChất liệu: Nhựa PVC cao cấp\r\nXuất xứ: Trung Quốc', 'https://salt.tikicdn.com/cache/750x750/ts/product/cd/e1/ff/9c19bdaf5418cd035421560d40284f52.jpg.webp', '2023-04-14', 66),
(84, 'Mô hình Funko 15 ARTHAS', 289000, 10, 0, 'Tên sản phẩm: Funko 15 ARTHAS\r\nMã SP: CP01693\r\nChất liệu: Nhựa PVC\r\nCao: 10cm\r\nKích thước hộp: 9 x 16 x 12cm\r\nQuy cách: Đóng hộp đẹp\r\nTrọng lượng: 200gr', 'https://tinyurl.com/2qzq2zg8', '2023-04-14', 68),
(85, 'Mô Hình Kaneki Ken HALF-KAKUJA', 1450000, 5, 0, 'Mô hình Figure Kaneki Ken HALF được làm bằng chất liệu cao cấp.\r\n- Chiều cao ~28cm có thể đứng vững ở địa hình phẳng.\r\n- Mô hình được làm cực kỳ chi tiết, sắc nét, màu sơn đẹp, thể hiện được hết cái thần thái của nhân vật.', 'https://tinyurl.com/2zbskfbb', '2023-04-14', 70),
(86, 'Mô hình 𝐃𝐫𝐚𝐤𝐞𝐧 | 𝐓𝐨𝐤𝐲𝐨 𝐑𝐞𝐯𝐞𝐧𝐠𝐞𝐫𝐬 chính hãng Banpresto', 180000, 5, 0, '- Ken Ryuguji King of Artist\r\n- Chiều cao: 13 cm\r\n- Chất liệu: Nhựa PVC cao cấp\r\n- Nobox (Không hộp), Likenew (Đẹp như mới), Have base (Có đế)\r\n- Hãng sản xuất: Banpresto\r\n- Xuất xứ: Japan', 'https://tinyurl.com/2e6mbuhe', '2023-04-14', 70),
(87, 'Mô hình Phong Trụ Shinazugawa Sanemi - Có đèn led - Mô hình Kimetsu No yaiba', 1090000, 18, 950000, 'Tên sản phẩm: Phong Trụ Shinazugawa Sanemi\r\nMã SP: CP02132\r\nChất liệu: Nhựa PVC\r\nQuy cách: Đóng hộp\r\nKích thước: Khoảng 25cm\r\nKích thước hộp: 25 x 30 x 31cm\r\nXuất sứ: Trung Quốc\r\nTrọng lượng: 1500gr', 'https://cipershop.com/public/userfiles/images/do-choi-mo-hinh/kimetsu-no-yaiba/phong-tru-02132/mo-hinh-phong-tru-co-led.jpg', '2023-04-14', 69),
(88, 'Mô hình Nezuko khớp - Figma Nezuko 508-dx - figure/figma 508-dx', 449000, 11, 379000, 'Tên sản phẩm: Nezuko 508-dx - figure/figma 508-dx\r\nMã SP: CP02127\r\nChất liệu: Nhựa PVC\r\nQuy cách: Đóng hộp\r\nKích thước: Khoảng 13cm\r\nKích thước hộp: 8 x 21 x 22cm\r\nXuất sứ: Trung Quốc\r\nTrọng lượng: 300gr', 'https://cipershop.com/public/userfiles/images/do-choi-mo-hinh/kimetsu-no-yaiba/nezuko-02127/do-choi-mo-hinh-nezuko-figma-508dx.jpg', '2023-04-14', 69),
(89, 'Mô hình Thượng Huyền Nhị Douma - Figure Douma Kimetsu No Yaiba', 409000, 23, 249000, 'Tên sản phẩm: Thượng Huyền Nhị Douma \r\nMã SP: CP0361\r\nChất liệu: Nhựa PVC\r\nKích thước: Khoảng 28cm\r\nKích thước hộp: 13 x 14 x 30cm\r\nQuy cách: Đóng hộp\r\nTrọng lượng: 500gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-thuong-huyen-nhi-douma-figure-douma-kimetsu-no-yaiba.webp', '2023-05-02', 69),
(90, 'Mô hình Viêm Trụ Rengoku Led - Figure Rengoku Kimetsu No Yaiba\r\n', 2990000, 4, 279000, 'Tên sản phẩm: Viêm Trụ Rengoku\r\nMã SP: CP0740\r\nChất liệu: Nhựa PVC\r\nKích thước: Khoảng 40cm\r\nKích thước hộp: 29 x 38 x 43cm\r\nQuy cách: Đóng hộp carton\r\nTrọng lượng: 6000gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-viem-tru-rengoku-led-figure-rengoku-kimetsu-no-yaiba.webp', '2023-05-02', 69),
(91, 'Mô hình Agatsuma Zenitsum GK - Figure Action Kimetsu No Yaiba - Mô hình Thanh Gươm Hủy Diệt', 379000, 8, 379000, 'Tên sản phẩm: Agatsuma Zenitsum\r\nMã SP: CP02007\r\nChất liệu: Nhựa PVC\r\nQuy Cách: Đóng hộp\r\nKích thước: Khoảng 17cm\r\nKích thước hộp: 17 x 25 x 28cm\r\nTrọng lượng:700gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-agatsuma-zenitsum-gk-figure-action--kimetsu-no-yaiba-mo-hinh-thanh-guom-huy-diet-3.webp', '2023-05-02', 69),
(92, 'Mô hình giấy Anime Kaneki Ken Mask', 72000, 20, 0, 'LƯU Ý: SẢN PHẨM LÀ BỘ KIT IN TRÊN GIẤY BẠN MUA VỀ PHẢI TỰ CẮT RA VÀ DÁN LẠI BẰNG KEO SỮA Ạ!\r\nBộ sản phẩm Mô hình giấy Anime Kaneki Ken Mask – Tokyo Ghoul bao gồm:\r\n- 11 tờ kit mô hình.\r\n- Kích thước: Cao: 30cm x Rộng: 22,4cm x Sâu: 15,8cm', 'https://tinyurl.com/2kt8e7nd', '2023-05-02', 70),
(93, 'Mô Hình Nhân Vật YB2 Tokyo Ghoul Kaneki Ken Sasaki Yoshiyo', 387000, 10, 0, 'Chất liệu: PVC\r\nChiều cao: khoảng 22cm\r\nMô hình: Kaneki Ken\r\nMàu sắc: như hình\r\nGói hộp', 'https://tinyurl.com/2osh23cs', '2023-05-02', 70),
(94, 'Mô hình Kaneki Ken Ngửa Mặt', 400000, 10, 0, 'Nhân vật: Ken Kaneki\r\nAnime/Manga: Tokyo Ghoul\r\nPhiên bản: Awakened Centipede\r\nCao khoảng 15cm\r\nNhựa PVC', 'https://tinyurl.com/2lln4chg', '2023-05-02', 70),
(95, 'Mô hình Sailor Moon Crystal - Figure Sailor Moon - Mô hình Thủy Thủ Mặt Trăng', 790000, 18, 790000, 'Tên sản phẩm: Sailor Moon Crystal\r\nMã SP: CP0111\r\nChất liệu: Nhựa PVC\r\nKích thước: Khoảng 25 cm\r\nKích thước hộp: 25 x 26 x 27cm\r\nQuy cách: Đóng hộp\r\nTrọng lượng: 800gr', 'https://cipershop.com/public/userfiles/images/do-choi-mo-hinh/thuy-thu-mat-trang/sailor-0111/figure-do-choi-bien-hoa.jpg', '2023-05-02', 72),
(96, 'Mô hình Sailor Mars Vol 1 - Thủy thủ Sao Hỏa', 219000, 9, 219000, 'Tên sản phẩm: Sailor Mars Vol 1 - Thủy thủ Sao Hỏa\r\nMã SP: CP01889\r\nMẫu: Vol 1\r\nChất liệu: Nhựa\r\nKích thước hộp: 9 x 12 x 18cm\r\nKích thước: khoảng 18cm\r\nTrọng lượng: 150gr', 'https://cipershop.com/public/userfiles/images/do-choi-mo-hinh/thuy-thu-mat-trang/mars-01889/sailor-mars-gia-re.jpg', '2023-05-02', 72),
(97, 'Mô hình Sailor Jupiter Vol 1 - Thủy thủ Sao Mộc', 219000, 4, 219000, 'Tên sản phẩm: Sailor Jupiter - Thủy thủ sao Mộc\r\nMã SP: CP01888\r\nMẫu: Vol 1\r\nChất liệu: Nhựa\r\nKích thước hộp: 9 x 12 x 18cm\r\nKích thước: khoảng 18cm\r\nTrọng lượng: 150gr', 'https://cipershop.com/public/userfiles/images/do-choi-mo-hinh/thuy-thu-mat-trang/jupiter-01888/mo-hinh-thuy-thu-mat-trang.jpg', '2023-05-02', 72),
(98, 'Bộ 4 nhân vật Thủy Thủ Mặt Trăng - Mẫu 1', 259000, 12, 259000, 'Tên nhân vật: Thủy Thủ Mặt Trăng – Sailor Moon\r\nMã SP: CP01247\r\nMẫu 1\r\nCao khoảng 6cm\r\nChất liệu: Nhựa PVC\r\nQuy cách: Đóng hộp đẹp\r\nTrọng lượng: 350gr', 'https://cipershop.com/public/userfiles/images/do-choi-mo-hinh/thuy-thu-mat-trang/4-1-01247/mo-hinh-nhan-vat-thuy-thu.jpg', '2023-05-02', 72),
(99, 'Mô hình Sailor Neptune - Thủy Thủ Sao Hải Vương', 359000, 34, 359000, 'Tên nhân vật: Thủy Thủ Sao Hải Vương – Sailor Neptune\r\nCao khoảng 14cm\r\nNhựa PVC\r\nTrọng lượng: 300gr\r\nCác khớp mỏng, mạnh tay sẽ dễ gãy, khách hàng cẩn thận khi sử dụng.', 'https://cipershop.com/public/userfiles/products/mo-hinh-sailor-neptune-thuy-thu-sao-hai-vuong.webp', '2023-05-02', 72),
(100, 'Mô hình Masked Rider Agito SHF - Vàng', 419000, 10, 0, 'Tên sản phẩm: Rider Agito SHF - Vàng\r\nMẫu: SHF khớp\r\nMã SP: CP01826\r\nKích thước: 16cm\r\nQuy cách: Đóng hộp\r\nChất liệu: Nhựa PVC cao cấp\r\nTrọng lượng: 300gr', 'https://tinyurl.com/2fnnvul3', '2023-05-02', 71),
(101, 'Mô hình Kamen Rider Kuuga', 419000, 10, 0, 'Tên nhân vật: Kamen Rider Kuuga\r\nMẫu: SHF khớp\r\nMã SP: CP01058\r\nKích thước: 16cm\r\nQuy cách: Đóng hộp\r\nChất liệu: Nhựa PVC cao cấp\r\nTrọng lượng: 300gr', 'https://tinyurl.com/2zgbx3bn', '2023-05-02', 71),
(102, 'Bộ mô hình Lính Counter Strike Swat - SS05-2', 259000, 10, 159000, 'Tên sản phẩm: Counter Strike Swat \r\nMã SP: CP0437\r\nKích thước: Khoảng 10cm\r\nQuy cách: Túi Zip\r\nKích thước: 5 x15 x 30cm\r\nChất liệu: Nhựa PVC\r\nTrọng lượng: 500gr', 'https://cipershop.com/public/userfiles/images/do-choi-mo-hinh/mo-hinh-linh/linh-0437/do-choi-mo-hinh-linh.jpg', '2023-05-02', 73),
(103, 'Mô hình Lính SNIPER ELITE - Action Figure NB07', 890000, 9, 750000, 'Tên sản phẩm: SNIPER ELITE - Action Figure NB07\r\nMẫu: Action Figure NB07\r\nMã SP: CP01960\r\nKích thước: Khoảng 30cm\r\nQuy cách: Đóng hộp\r\nKích thước hộp: 10 x 25 x 35cm\r\nChất liệu: Nhựa PVC cao cấp\r\nTrọng lượng: 800gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-linh-sniper-elite-action-figure-nb07.webp', '2023-05-02', 73),
(104, 'Mô hình Lính PFOR Chinese Peacekeepers CH03 1/6 - KADHOBBY', 890000, 6, 750000, 'Tên sản phẩm: Lính PFOR Chinese Peacekeepers  - KADHOBBY\r\nMẫu: 1/6 CH03\r\nMã SP: CP01958\r\nKích thước: Khoảng 30cm\r\nQuy cách: Đóng hộp\r\nKích thước hộp: 10 x 25 x 35cm\r\nChất liệu: Nhựa PVC cao cấp\r\nTrọng lượng: 800gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-linh-pfor-chinese-peacekeepers-ch03-16-kadhobby-1.webp', '2023-05-02', 73),
(105, 'Mô hình bàn nhựa tỷ lệ 1/6 - Màu ghi', 219000, 3, 219000, 'Tên sản phẩm: Bàn nhựa tỷ lệ 1/6 - Màu ghi\r\nMã SP: CP01682\r\nChất liệu: Nhựa PVC\r\nKích thước bàn: 11.5 x 12.7 x 20.5cm\r\nQuy cách: Đóng hộp đẹp\r\nTrọng lượng: 300gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-ban-nhua-ty-le-16-mau-ghi.webp', '2023-05-02', 73),
(106, 'Mô hình lính 1:6 30cm NB05 SDU', 379000, 15, 339000, 'Tên nhân vật: Mô hình lính 1:6 30cm NB05 SDU\r\nMã SP: CP01042\r\nMẫu: NB05\r\nChất liệu: Nhựa PVC cao cấp\r\nKích thước: 30cm\r\nTrọng lượng: 900gr', 'https://my-test-11.slatic.net/p/573993f0e0739fb9ab5260878dc09448.jpg', '2023-05-02', 73),
(107, 'MÔ HÌNH NHÂN VẬT HIỆP SĨ MẶT NẠ HIỂM HỌA AI SHF KAMEN RIDER ICHIGATA', 690000, 10, 0, ' MÔ HÌNH SHF KAMEN RIDER ICHIGATA BL\r\nTên sản phẩm:  SHF KAMEN RIDER ICHIGATA BL\r\nThành phần: 1 NHÂN VẬT\r\nChất liệu: PVC\r\nCách sử dụng: Trang trí bàn làm việc, trưng bày, sưu tầm', 'https://tinyurl.com/2pclta7a', '2023-05-02', 71),
(108, 'Mô Hình Siêu Nhân Kamen Rider Heroes', 200000, 10, 0, 'Tên sản phẩm: [RHS] Mô Hình Siêu Nhân Kamen Rider Heroes Figure Geats\r\n_ Hàng chính hãng Bandai Nhật.\r\n_ Mô hình cao 15 -16 cm. Cử động được 2 cánh tay và xoay được bụng.\r\n_ Chất liệu: nhựa PVC an toàn.\r\n_ Sản phẩm phù hợp cho trẻ từ 6 tuổi trở lên.', 'https://tinyurl.com/2p6ceczr', '2023-05-02', 71),
(109, 'Mô hình Sodo Kamen Rider Geats', 340000, 10, 0, '- Sodo Kamen Rider Geats ID 1\r\n  + Chiều cao 12cm\r\n  + Là mô hình Action: có khả năng thay đổi nhiều tư thế; trưng bày hoặc pose dáng chụp ảnh', 'https://tinyurl.com/2qrx4g9w', '2023-05-02', 71),
(110, 'Mô hình Saber Kimono Dress Ver', 959000, 9, 959000, 'Tên sản phẩm: Saber Kimono Dress Ver\r\nMã SP: CP01587\r\nMẫu: Kimono Dress Ver\r\nChất liệu: Nhựa PVC an toàn cho sức khỏe\r\nKích thước: 26cm\r\nQuy cách: đóng hộp\r\nTrọng lượng: 1100gr', 'https://vn-live-01.slatic.net/p/5dfa617553da6efeda1708d706389cec.jpg', '2023-05-02', 85),
(111, 'Mô hình Saber Alter Fate FGO - Figure Saber fate/stay night', 699000, 5, 659000, 'Tên sản phẩm: Saber Alter Fate FGO\r\nMã SP: CP02207\r\nChất liệu: Nhựa PVC\r\nKích thước: Khoảng 24cm\r\nKích thước hộp: 20 x 25 x 31cm\r\nXuất sứ: Trung Quốc\r\nQuy cách: Đóng hộp\r\nTrọng lượng: 800gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-saber-alter-fate-fgo-figure-saber-fatestay-night.webp', '2023-05-02', 85),
(112, 'Mô hình Jeanne d\'Arc (Fate/Grand Order Avenger) - Figma 390 - Mô hình Alter', 479000, 17, 449000, 'Tên nhân vật: Jeanne d\'Arc (Fate/Grand Order Avenger) -  Figma 390\r\nMã SP: CP01220\r\nKích thước: 14cm\r\nKích thước hộp: 7 x 21 x 22cm\r\nChất liệu: Nhựa PVC cao cấp\r\nTrọng lượng: 350gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-jeanne-darc-fategrand-order-avenger-figma-390-mo-hinh-alter.webp', '2023-05-02', 85),
(113, 'Mô hình Saber Alter 1/7 - Mô hình Fate/Stay Night', 649000, 8, 590000, 'Tên nhân vật: Saber Alter\r\nMã SP: CP0648\r\nBộ truyện: Fate/Stay Night\r\nKích thước: Khoảng 20cm\r\nKích thước hộp: 22 x 26 x 27cm\r\nChất liệu: nhựa PVC cao cấp\r\nQuy cách: Đóng hộp \r\nTrọng lượng: 1200gr', 'https://lzd-img-global.slatic.net/g/p/a61198f8b763b03080dc6d77d79331b4.jpg_1200x1200q80.jpg_.webp', '2023-05-02', 85),
(114, 'Mô hình Fate saber UBW - Mô hình Stay Night', 749000, 6, 649000, 'Tên nhân vật: Saber Alter\r\nMã SP: CP01140\r\nBộ truyện: Fate/Stay Night\r\nKích thước: 25cm\r\nKích thước hộp: 22 x 22 x 29cm\r\nChất liệu: nhựa PVC cao cấp\r\nQuy cách: Đóng hộp\r\nTrọng lượng: 1100gr', 'https://lzd-img-global.slatic.net/g/p/a54ffdbf561596285c1d41e567caea8b.jpg_720x720q80.jpg', '2023-05-02', 85),
(115, 'Mô hình Đại úy Levi Ackerman - Figure Levi Attack on titan', 850000, 7, 790000, 'Tên sản phẩm: Đại úy Levi Ackerman\r\nMã SP: CP0068\r\nChất liệu: Nhựa PVC\r\nQuy cách: Đóng hộp\r\nKích thước: Khoảng 36cm\r\nKích thước hộp: 18 x 23 x 40cm\r\nXuất sứ: Trung Quốc\r\nTrọng lượng: 1500gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-dai-uy-levi-ackerman-figure-levi-attack-on-titan.webp', '2023-05-02', 76),
(116, 'Mô hình Figma 207 - Figma Eren Yeager 207', 389000, 7, 389000, 'Tên sản phẩm: Eren 207\r\nMã SP: CP01957\r\nChất liệu: Nhựa PVC\r\nKích thước: Khoảng 14cm\r\nKích thước hộp: 21 x 22 x 8cm\r\nQuy cách: Đóng hộp\r\nTrọng lượng: 400gr', 'https://takishop.vn/wp-content/uploads/2022/08/figm007-eren-yeager-207-1.jpg', '2023-05-02', 76),
(117, 'Mô hình Đại Úy Levi - ARTFX J Levi Fortitude ver', 599000, 10, 599000, 'Tên sản phẩm: ARTFX J Levi Fortitude ver\r\nMã SP: CP01948\r\nChất liệu: Nhựa PVC\r\nCao: Khoảng 16cm\r\nKích thước hộp: 17 x 18 x 21cm\r\nQuy cách: Đóng hộp\r\nTrọng lượng: 500gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-dai-uy-levi-artfx-j-levi-fortitude-ver.webp', '2023-05-02', 76),
(118, 'Bộ 10 móc khóa, dây chuyền Attack on Titan', 299000, 21, 259000, 'Tên sản phẩm: Móc khóa, dây chuyền Attack on Titan\r\nMã SP: CP01903\r\nKích thước: 4cm\r\nKích thước hộp:  4 x 13 x 21cm\r\nChất liệu: Hơp kim mạ\r\nTrọng lượng: 300gr', 'https://vn-live-01.slatic.net/p/4fc29e7173e6ac727536832439d413d9.jpg', '2023-05-02', 76),
(119, 'Mô hình Mikasa Ackerman 203 - Mô hình Attack on Titan ', 389000, 14, 389000, 'Tên nhân vật: Mikasa Ackerman 203\r\nMã SP: CP0862\r\nKích thước: 15cm\r\nChất liệu: Nhựa PVC cao cấp\r\nQuy cách: Đóng hộp đẹp\r\nTrọng lượng: 450gr', 'https://cipershop.com/public/userfiles/images/do-choi-mo-hinh/attack-on-titan/mikasa-203/mo-hinh-mikasa-203.jpg', '2023-05-02', 76),
(120, 'Mô hình Boa Hancock GK - Có Led - Figure Boa Hancock One Piece', 1590000, 10, 200000, 'Tên nhân vật: Boa Hancock GK - Có Led\r\nMã SP: CP02152\r\nKích thước: Khoảng 36cm\r\nKích thước hộp: 24 x 33 x 45cm\r\nQuy Cách: Đóng hộp\r\nXuất xứ: Trung Quốc\r\nChất liệu: Nhựa PVC cao cấp\r\nTrọng lượng: 2300gr', 'https://tinyurl.com/2zfdlfgg', '2023-05-02', 87),
(121, 'Mô hình Luffy Gear 5 Nika chiến đấu', 990000, 10, 150000, 'Tên sản phẩm: Luffy Gear 5 Nika \r\nMã SP: CP02135\r\nChất liệu: Nhựa PVC\r\nQuy cách: Đóng hộp\r\nKích thước: Khoảng 32cm\r\nKích thước hộp: 20 x 23 x 36cm\r\nXuất sứ: Trung Quốc\r\nTrọng lượng: 1500gr', 'https://tinyurl.com/2jdfszh4', '2023-05-02', 87),
(122, 'Mô hình xe Honda CBR1000RR - Mô hình Xe', 279000, 11, 279000, 'Tên sản phẩm: Honda CBR1000RR\r\nMã SP: CP01606\r\nQuy cách: Đóng hộp đẹp\r\nChất liệu: Nhựa PVC\r\nTỉ lệ: 1/12\r\nTrọng lượng: 300gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-xe-honda-cbr1000rr-mo-hinh-xe-7.webp', '2023-05-02', 86),
(123, 'Mô hình xe Kawasaki Z900RS Cafe - Mô hình Xe', 279000, 7, 279000, 'Tên sản phẩm: Kawasaki Z900RS Cafe\r\nMã SP: CP01605\r\nQuy cách: Đóng hộp đẹp\r\nChất liệu: Nhựa PVC\r\nTỉ lệ: 1/12\r\nTrọng lượng: 300gr', 'https://product.hstatic.net/1000288177/product/20-18989_f1adb75461eb4dcaa16b3cb602285d86_master.jpg', '2023-05-02', 86),
(124, 'Mô hình Ducati 1199 Panigale 1:12', 289000, 16, 289000, 'Mô hình Ducati 1199  Panigale 1:12 \r\nMã SP: CP0975\r\nMầu sắc: Đỏ\r\nChất liệu: Nhựa\r\nKích thước: 17 x 6 x 9cm\r\nXuất xứ: Maisto.\r\nTrọng lượng: 300gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-ducati-1199--panigale-112-7.webp', '2023-05-02', 86),
(125, 'Mô Hình Xe CheZhi Toyota Prado Đen 1:24', 390000, 11, 250000, 'Tỉ Lệ:1/24 (nhỏ hơn xe thật 24 lần)\r\n\r\nKích Thước :Dài 21cm, rộng 9,5cm, cao 8,5cm\r\n\r\nBao Bì:Hộp Giấy + Xốp\r\n\r\nChất Liệu: Nhựa Cứng ABS, Hợp Kim,Cao Su (Lốp Xe)\r\n\r\nMàu sắc: Đen/Trắng\r\n\r\nHãng sản xuất: Chezhi\r\n\r\nChức năng: Mở được 2 cửa và 2 nắp capo;có đèn và âm thanh', 'https://toyplanet.vn/wp-content/uploads/2020/10/DSC1521.jpg', '2023-05-02', 86),
(126, 'Xe Mô Hình Lambo V12 Vision Gran Turismo 1:18 Maisto ( Xanh Dương )', 1100000, 4, 1100000, 'Tên Sản Phẩm: Lambo V12 Vision Gran Turismo\r\nHãng Sản Xuất: Maisto\r\nTỉ Lệ: 1:18 ( kích thước nhỏ hơn xe thật 18 lần )\r\nKích Thước Hộp: Dài 33 cm x Rộng 16 cm x Cao 13 cm\r\nBao Bì: Hộp Giấy + Xốp\r\nChất Liệu: Nhựa Cứng ABS, Hợp Kim,Cao Su (Lốp Xe)\r\nKích Thước Xe: Dài 26 cm x Rộng 10.5 cm x Cao 6 cm\r\nOption                   : Xe mở được full các cửa , bánh xe quay được \r\nSơn: Xe được phủ lớp sơn tĩnh điện cho nước sơn sáng , bóng , mỏng và bền , được sơn phủ nhiều lớp .', 'https://product.hstatic.net/1000288177/product/31454bl_8de8920ea30b47f2b3e8ac1860e03d0c_grande.jpg', '2023-05-02', 86),
(127, 'Mô hình Boa Hancock Bóng Rổ', 1390000, 10, 100000, 'Tên nhân vật: Boa Hancock Basketball\r\nMã SP: CP0307\r\nKích thước: Khoảng 32cm\r\nQuy cách: Đóng hộp\r\nKích thước hộp: 22 x 27 x38cm\r\nChất liệu: Nhựa PVC\r\nTrọng lượng: 2000gr', 'https://tinyurl.com/2haapmwu', '2023-05-02', 87),
(128, 'Mô hình nhân vật Buggy - thuyền trưởng Buggy', 599000, 10, 50000, '~ Tên sản phẩm: Buggy - thuyền trưởng Buggy\r\n~ Mã SP: CP01331\r\n~ Chất liệu: Nhựa PVC\r\n~ Kích thước: Khoảng 24cm\r\n~ Kích thước hộp: 17 x 22 x 28cm\r\n~ Quy cách: Đóng hộp\r\n~ Trọng lượng: 1000gr', 'https://tinyurl.com/2jn4rjca', '2023-05-02', 87),
(129, 'Mô hình Ace Street - Figure Ace Fashion Style One Piece', 619000, 10, 0, 'Tên sản phẩm: Ace Street Fashion Ver\r\nMã SP: CP02064\r\nChất liệu: Nhựa PVC\r\nCao: Khoảng Khoảng 30 cm\r\nKích thước hộp: 15 x 22 x 31cm\r\nQuy cách: Đóng hộp\r\nTrọng lượng: 800gr', 'https://tinyurl.com/2g6cn9jt', '2023-05-02', 87),
(130, 'Mô hình Cell Samurai', 990000, 10, 140000, 'Tên sản phẩm: Cell Samurai\r\nMã SP: CP0039\r\nChất liệu: Nhựa PVC\r\nQuy cách: Đóng hộp\r\nKích thước: Khoảng 34cm\r\nKích thước hộp: 20 x 23 x 35cm\r\nXuất sứ: Trung Quốc\r\nTrọng lượng: 800gr', 'https://tinyurl.com/2zbkpyof', '2023-05-02', 77),
(131, 'Mô hình Cell Form 1', 399000, 10, 40000, '~ Tên sản phẩm: Cell Form 1\r\n~ Mã SP: CP02215\r\n~ Chất liệu: Nhựa PVC\r\n~ Kích thước: Khoảng 31cm\r\n~ Kích thước hộp: 15 x 17 x 25cm\r\n~ Xuất sứ: Trung Quốc\r\n~ Quy cách: Đóng hộp\r\n~ Trọng lượng: 500gr', 'https://tinyurl.com/2mcje2uf', '2023-05-02', 77),
(132, 'Mô hình Nendoroid 657 - Figure Nendoroid Dazai Osamu 657', 349000, 11, 319000, 'Tên sản phẩm: Nendoroid Dazai Osamu 657\r\nMã SP: CP0112\r\nChất liệu: Nhựa PVC\r\nQuy cách: Đóng hộp\r\nKích thước: Khoảng 10cm\r\nKích thước hộp: 8 x 17 x 21cm\r\nTrọng lượng: 300gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-nendoroid-657-figure-nendoroid-dazai-osamu-657.webp', '2023-05-02', 91),
(133, 'Mô hình Nendoroid 365 - Nendoroid Mikasa Ackerman - Figure Mikasa 365', 349000, 20, 289000, 'Tên nhân vật: Nendoroid Mikasa Ackerman - Figure Mikasa 365\r\nMã SP: CP02146\r\nKích thước: 10cm\r\nKích thước hộp: 8 x 18 x 21cm\r\nXuất xứ: Trung Quốc\r\nChất liệu: Nhựa PVC cao cấp\r\nTrọng lượng: 350gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-nendoroid-365-nendoroid-mikasa-ackerman-figure-mikasa-365.webp', '2023-05-02', 91),
(134, 'Mô hình Nendoroid 1541 - Nendoroid Kyojuro Rengoku - Figure Rengoku 1541', 349000, 22, 289000, 'Tên nhân vật: Nendoroid Kyojuro Rengoku - Figure Rengoku 1541\r\nMã SP: CP02121\r\nKích thước: 10cm\r\nKích thước hộp: 9 x 13 x 17cm\r\nChất liệu: Nhựa PVC cao cấp\r\nTrọng lượng: 350gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-nendoroid-1541-nendoroid-kyojuro-rengoku-figure-rengoku-1541.webp', '2023-05-02', 91),
(135, 'Mô hình Nendoroid 1510 - Nendoroid Tanjiro Kamado - Figure Tanjiro 1510', 349000, 17, 289000, 'Tên nhân vật: Nendoroid Tanjiro Kamado - Figure Tanjiro 1510\r\nMã SP: CP02120\r\nKích thước: 10cm\r\nKích thước hộp: 9 x 13 x 17cm\r\nChất liệu: Nhựa PVC cao cấp\r\nTrọng lượng: 350gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-nendoroid-1510-nendoroid-tanjiro-kamado-figure-tanjiro-1510.webp', '2023-05-02', 91),
(136, 'Mô hình Nendoroid 1408 - Nendoroid Giyu Tomioka - Figure Giyu Tomioka 1408', 349000, 11, 289000, 'Tên nhân vật: Nendoroid Giyu Tomioka - Figure Giyu Tomioka 1408\r\nMã SP: CP02119\r\nKích thước: 10cm\r\nKích thước hộp: 9 x 13 x 17cm\r\nChất liệu: Nhựa PVC cao cấp\r\nTrọng lượng: 350gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-nendoroid-1408-nendoroid-giyu-tomioka-figure-giyu-tomioka-1408.webp', '2023-05-02', 91),
(137, 'Mô hình rồng thần YOYO - Bản full', 1890000, 10, 300000, '~ Tên sản phẩm: rồng thần YOYO\r\n~ Mã SP: CP02210\r\n~ Chất liệu: Nhựa PVC\r\n~ Kích thước: Khoảng 45cm\r\n~ Kích thước hộp: 32 x 55 x 55cm\r\n~ Xuất sứ: Trung Quốc\r\n~ Quy cách: Đóng hộp\r\n~ Trọng lượng: 6200gr', 'https://tinyurl.com/2q37bjb5', '2023-05-02', 77),
(138, 'Mô hình Gogeta Samurai', 990000, 10, 20000, 'Tên sản phẩm: Gogeta Samurai\r\nMã SP: CP02192\r\nChất liệu: Nhựa PVC\r\nQuy cách: Đóng hộp\r\nKích thước: Khoảng 30cm\r\nKích thước hộp: 20 x 23 x 35cm\r\nXuất sứ: Trung Quốc\r\nTrọng lượng: 1000gr', 'https://tinyurl.com/2j6eebhy', '2023-05-02', 77),
(139, 'Mô hình Nhân Vật Trunks Super Saiyan', 479000, 10, 30000, 'Tên sản phẩm: Trunks Super Saiyan\r\nMã SP: CP02155\r\nChất liệu: Nhựa PVC\r\nQuy cách: Đóng hộp\r\nKích thước: Khoảng 33cm\r\nKích thước hộp: 15 x 20 x 33.5cm\r\nXuất sứ: Trung Quốc\r\nTrọng lượng: 1500gr', 'https://tinyurl.com/2pwr98b2', '2023-05-02', 77),
(140, 'Bộ 6 nhân vật lắp ráp One Piece - XP036', 179000, 11, 179000, 'Tên sản phẩm: Bộ 6 nhân vật lắp ráp One Piece - XP036\r\nMã SP: CP01527\r\nSố chi tiết: 6 nhân vật\r\nKích thước: 4.5 x 2cm\r\nChất liệu: Nhựa PVC cao cấp an toàn cho sức khỏe\r\nTrọng lượng: 200gr', 'https://cipershop.com/public/userfiles/products/bo-6-nhan-vat-lap-rap-one-piece-xp036-2.webp', '2023-05-02', 90),
(141, 'Bộ 8 nhân vật lắp ráp DC - Avengers - XP028', 179000, 19, 179000, 'Tên sản phẩm: Bộ 8 nhân vật lắp ráp DC - Avengers - XP028\r\nMã SP: CP01526\r\nSố chi tiết: 8 nhân vật\r\nKích thước: 4.5 x 2cm\r\nChất liệu: Nhựa PVC cao cấp an toàn cho sức khỏe\r\nTrọng lượng: 200gr', 'https://cipershop.com/public/userfiles/products/bo-8-nhan-vat-lap-rap-dc-avengersxp028-4.webp', '2023-05-02', 90),
(142, 'Bộ 6 nhân vật lắp ráp One Piece - XP056', 179000, 17, 169000, 'Tên sản phẩm: Bộ 6 nhân vật lắp ráp One Piece - XP056\r\nMã SP: CP01525\r\nSố chi tiết: 6 nhân vật\r\nKích thước: 4.5 x 2cm\r\nChất liệu: Nhựa PVC cao cấp an toàn cho sức khỏe\r\nTrọng lượng: 200gr', 'https://cipershop.com/public/userfiles/products/bo-6-nhan-vat-lap-rap-one-piece-xp056-8.webp', '2023-05-02', 90),
(143, 'Bộ 6 nhân vật lắp ráp Dragon Ball - XP021', 179000, 17, 159000, 'Tên sản phẩm: Bộ 6 nhân vật lắp ráp Dragon Ball - XP021\r\nMã SP: CP01523\r\nSố chi tiết: 6 nhân vật\r\nKích thước: 4.5 x 2cm\r\nChất liệu: Nhựa PVC cao cấp an toàn cho sức khỏe\r\nTrọng lượng: 200gr', 'https://cipershop.com/public/userfiles/products/bo-6-nhan-vat-lap-rap-dragon-ball-xp021-6.webp', '2023-05-02', 90),
(144, 'Mô hình lắp ráp LEGO 4in1 390 - 33000', 279000, 13, 199000, 'Tên sản phẩm: Mô hình lắp ráp LEGO\r\nSố chi tiết: 390\r\nChất liệu: Nhựa PVC cao cấp an toàn cho sức khỏe\r\nTrọng lượng: 900gr', 'https://cipershop.com/public/userfiles/products/mo-hinh-lap-rap-lego-4in1-390-33000.webp', '2023-05-02', 90),
(145, 'Mô hình Itachi Akatsuki - Figure Itachi Naruto - Có led', 1090000, 10, 920000, 'Tên sản phẩm: Itachi Akatsuki\r\nMã SP: CP02168\r\nChất liệu: Nhựa PVC\r\nQuy cách: Đóng hộp carton\r\nKích thước: Khoảng 35cm\r\nKích thước hộp: 26 x 32 x 42cm\r\nXuất sứ: Trung Quốc\r\nTrọng lượng: 2000gr', 'https://tinyurl.com/2h5u5dok', '2023-05-02', 78),
(146, 'Mô hình Uzumaki Naruto Hiền Nhân', 449000, 10, 399000, 'Tên sản phẩm: Uzumaki Naruto Hiền Nhân \r\nMã SP: CP01947\r\nChất liệu: Nhựa PVC\r\nCao: Khoảng 20cm\r\nKích thước hộp: 15 x 21 x 24cm\r\nQuy cách: Đóng hộp\r\nTrọng lượng: 500gr', 'https://tinyurl.com/2hr6wdor', '2023-05-02', 78),
(147, 'Mô hình Kazekage Gaara', 1499000, 10, 1399000, 'Tên sản phẩm: Kazekage Gaara \r\nMã SP: CP01894\r\nKích thước: Nhân vật: 21cm - Móng vuốt: 31cm\r\nKích thước hộp:  30 x 25 x 25cm\r\nChất liệu: Nhựa PVC an toàn khi sử dụng\r\nTrọng lượng: 3000gr', 'https://tinyurl.com/2dtkrfph', '2023-05-02', 78),
(148, 'Mô hình Dragonite Dratini Pokemon', 990000, 10, 799000, 'Tên sản phẩm: Dragonite Dratini - Có Led\r\nMã SP: CP02220\r\nChất liệu: Nhựa PVC\r\nQuy cách: Đóng hộp\r\nKích thước: Khoảng 23cm\r\nKích thước hộp: 22 x 28 x 33cm\r\nXuất sứ: Trung Quốc\r\nTrọng lượng: 1000gr', 'https://tinyurl.com/2jdyay33', '2023-05-02', 79),
(149, 'Mô hình Pokemon - Phản công của Mewtwo - Figure Mewtwo Pokemon tiến hóa', 1790000, 10, 1490000, 'Tên sản phẩm: Phản công của Mewtwo\r\nMã SP: CP02216\r\nChất liệu: Nhựa PVC\r\nQuy cách: Đóng hộp\r\nKích thước: Khoảng 34cm\r\nKích thước hộp: 27 x 39 x 41cm\r\nXuất sứ: Trung Quốc\r\nTrọng lượng: 4000gr', 'https://tinyurl.com/2mb6qmbg', '2023-05-02', 79),
(150, 'Mô hình Meganium Pokemon - Có Led - Figure Pokemon Mega Meganium', 990000, 10, 850000, 'Tên sản phẩm: Meganium Pokemon - Có Led\r\nMã SP: CP02217\r\nChất liệu: Nhựa PVC\r\nQuy cách: Đóng hộp\r\nKích thước: Khoảng 29cm\r\nKích thước hộp: 28 x 33 x 33cm\r\nXuất sứ: Trung Quốc\r\nTrọng lượng: 3000gr', 'https://tinyurl.com/2qyangas', '2023-05-02', 79),
(151, 'Mô hình Người Sắt End Game - Figure Iron Man Avengers', 549000, 10, 449000, '~ Tên sản phẩm: Iron Man End Game\r\n~ Mã SP: CP02124\r\n~ Chất liệu: Nhựa PVC\r\n~ Kích thước: Khoảng 15cm\r\n~ Kích thước hộp: 16 x 18 x 19cm\r\n~ Quy cách: Đóng hộp\r\n~ Trọng lượng: 500gr', 'https://tinyurl.com/2notnuvz', '2023-05-02', 80),
(152, 'Mô hình Hulk - Khổng Lồ Xanh - Figure Avengers', 449000, 10, 399000, '~ Tên sản phẩm: Hulk - Khổng Lồ Xanh\r\n~ Mã SP: CP0767\r\n~ Chất liệu: Nhựa PVC\r\n~ Kích thước: Khoảng 23cm\r\n~ Kích thước hộp: 9 x 22 x 35cm\r\n~ Quy cách: Đóng hộp\r\n~ Trọng lượng: 1000gr\r\n1\r\n', 'https://tinyurl.com/2jeh546h', '2023-05-02', 80),
(153, 'Mô hình Groot Captain America', 950000, 10, 850000, 'Tên sản phẩm: Groot Captain America\r\nMã SP: CP01686\r\nChất liệu: Nhựa PVC\r\nCao: 25cm\r\nKích thước hộp: 10 x 22 x 18cm\r\nQuy cách: Đóng hộp đẹp\r\nTrọng lượng: 800gr', 'https://tinyurl.com/2g37d5t9', '2023-05-02', 80);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`MAHD`,`MASANPHAM`),
  ADD KEY `FK_CHITIETHOADON_SANPHAM` (`MASANPHAM`),
  ADD KEY `FK_CHITIETHOADON_HD` (`MAHD`) USING BTREE;

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MAHD`),
  ADD KEY `FK_HOADON_KHACHHANG` (`MAKH`) USING BTREE;

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`USERNAME`);

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`MALSANPHAM`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MANV`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MASANPHAM`),
  ADD KEY `FK_SANPHAM_LOAISANPHAM` (`MALSANPHAM`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `MAHD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `MALSANPHAM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MASANPHAM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `FK_CHITIETHOADON_SANPHAM` FOREIGN KEY (`MASANPHAM`) REFERENCES `sanpham` (`MASANPHAM`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_CTHD_HOADON` FOREIGN KEY (`MAHD`) REFERENCES `hoadon` (`MAHD`),
  ADD CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`MAHD`) REFERENCES `hoadon` (`MAHD`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `FK_HOADON_KHACHHANG` FOREIGN KEY (`MAKH`) REFERENCES `khachhang` (`USERNAME`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MAKH`) REFERENCES `khachhang` (`USERNAME`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `FK_SANPHAM_LOAISANPHAM` FOREIGN KEY (`MALSANPHAM`) REFERENCES `loaisanpham` (`MALSANPHAM`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
