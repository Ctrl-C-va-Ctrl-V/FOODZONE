-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 15, 2026 lúc 05:31 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `student_food`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `student_phone` varchar(20) NOT NULL,
  `delivery_area` varchar(100) NOT NULL,
  `detailed_address` text NOT NULL,
  `payment_method` varchar(50) DEFAULT 'COD',
  `notes` text DEFAULT NULL,
  `total_amount` int(11) NOT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `img` text DEFAULT NULL,
  `badge` varchar(50) DEFAULT '',
  `badgeClass` varchar(50) DEFAULT '',
  `rating` decimal(2,1) DEFAULT 4.8,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `description`, `img`, `badge`, `badgeClass`, `rating`, `created_at`) VALUES
('dessert-1', 'Caramen/Bánh Flan Nhà Làm', 'desserts', 8000, 'Bánh flan mềm mịn, béo ngậy từ trứng và sữa, đẫm sốt caramen đắng nhẹ thơm ngon.', 'https://images.unsplash.com/photo-1528975604071-b4dc52a2d18c?auto=format&fit=crop&q=80&w=400', '', '', 4.7, '2026-09-15 14:19:05'),
('drink-1', 'Trà Sữa Trân Châu Truyền Thống', 'drinks', 18000, 'Trà sữa đậm vị trà quyện sữa béo ngậy, kèm trân châu đen dai giòn sần sật cực sướng miệng.', 'https://images.unsplash.com/photo-1541658016709-82535e94bc69?auto=format&fit=crop&q=80&w=400', 'Best Seller', 'badge-hot', 4.9, '2026-09-15 14:19:05'),
('drink-2', 'Trà Đào Cam Sả Giải Nhiệt', 'drinks', 15000, 'Hương đào thơm ngọt kết hợp nước cam tươi chua nhẹ và hương sả sảng khoái đánh tan nắng nóng.', 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?auto=format&fit=crop&q=80&w=400', 'Giải nhiệt', 'badge-new', 4.8, '2026-09-15 14:19:05'),
('lunch-1', 'Cơm Sườn Cốt Lết Rim', 'lunch', 25000, 'Sườn cốt lết rim mặn ngọt đậm đà, ăn kèm dưa leo, cà chua và canh rau thanh mát.', 'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?auto=format&fit=crop&q=80&w=400', 'Bán chạy', 'badge-hot', 4.8, '2026-09-15 14:19:05'),
('lunch-2', 'Cơm Gà Xối Mỡ Da Giòn', 'lunch', 30000, 'Đùi gà chiên xối mỡ da giòn rụm, cơm chiên hồng ngọc thơm dẻo cùng nước tương tỏi ớt.', 'https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?auto=format&fit=crop&q=80&w=400', 'Giảm 15%', '', 4.9, '2026-09-15 14:19:05'),
('lunch-3', 'Cơm Đậu Hũ Nhồi Thịt Sốt Cà', 'lunch', 20000, 'Món ngon chuẩn mẹ nấu đầy ắp thịt băm, đậu hũ mềm béo quyện sốt cà chua đậm đà cực đưa cơm.', 'https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&q=80&w=400', 'Giá rẻ', 'badge-new', 4.5, '2026-09-15 14:19:05'),
('lunch-4', 'Cơm Cá Kho Tộ Chuẩn Vị', 'lunch', 25000, 'Cá ba sa kho tộ đậm đà thơm mùi tiêu đen hành lá, ăn cùng một bát canh rau ngót ấm lòng.', 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&q=80&w=400', '', '', 4.6, '2026-09-15 14:19:05'),
('snack-1', 'Mì Trộn Indomie Thập Cẩm', 'snacks', 22000, 'Mì Indomie dai ngon trộn sốt đặc biệt, ăn kèm trứng ốp la, xúc xích và rau cải ngọt.', 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&q=80&w=400', 'Yêu thích', 'badge-hot', 4.9, '2026-09-15 14:19:05'),
('snack-2', 'Nem Chua Rán Hà Nội (Ngon)', 'snacks', 20000, 'Một đĩa gồm 5 chiếc nem chua rán giòn rụm bên ngoài, dai mềm ngọt thịt bên trong kèm tương ớt cực cuốn.', 'https://images.unsplash.com/photo-1562967916-eb82221dfb92?auto=format&fit=crop&q=80&w=400', '', '', 4.7, '2026-09-15 14:19:05');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
