-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore_test
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_role`
--

DROP TABLE IF EXISTS `app_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_deleted` bit(1) DEFAULT b'0',
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_role`
--

LOCK TABLES `app_role` WRITE;
/*!40000 ALTER TABLE `app_role` DISABLE KEYS */;
INSERT INTO `app_role` VALUES (1,_binary '\0','ROLE_ADMIN'),(2,_binary '\0','ROLE_USER');
/*!40000 ALTER TABLE `app_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `creation_date` date DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `password` varchar(100) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (1,'2019-12-12','sangnguyenjp97@gmail.com',_binary '\0','$2a$10$3Vke14hdeWGh25HEPhpD.uncnmsUmGKstrOueJ98iHLZFfOv0oLnW','admin'),(2,'2019-12-12','abc2@gmail.com',_binary '\0','$2a$10$3Vke14hdeWGh25HEPhpD.uncnmsUmGKstrOueJ98iHLZFfOv0oLnW','abc2'),(3,'2019-12-12','abc3@gmail.com',_binary '\0','$2a$10$3Vke14hdeWGh25HEPhpD.uncnmsUmGKstrOueJ98iHLZFfOv0oLnW','abc3'),(4,'2019-12-12','abc4@gmail.com',_binary '\0','$2a$10$3Vke14hdeWGh25HEPhpD.uncnmsUmGKstrOueJ98iHLZFfOv0oLnW','abc4'),(5,'2019-12-12','abc5@gmail.com',_binary '\0','$2a$10$3Vke14hdeWGh25HEPhpD.uncnmsUmGKstrOueJ98iHLZFfOv0oLnW','abc5'),(6,'2019-12-12','abc6@gmail.com',_binary '\0','$2a$10$3Vke14hdeWGh25HEPhpD.uncnmsUmGKstrOueJ98iHLZFfOv0oLnW','abc6'),(7,'2019-12-12','abc7@gmail.com',_binary '\0','$2a$10$3Vke14hdeWGh25HEPhpD.uncnmsUmGKstrOueJ98iHLZFfOv0oLnW','abc7'),(8,'2019-12-12','abc8@gmail.com',_binary '\0','$2a$10$3Vke14hdeWGh25HEPhpD.uncnmsUmGKstrOueJ98iHLZFfOv0oLnW','abc8'),(9,'2022-09-18','tranvai591989@gmail.com',_binary '\0','$2a$10$3Vke14hdeWGh25HEPhpD.uncnmsUmGKstrOueJ98iHLZFfOv0oLnW','hungnguyen'),(10,'2022-09-18','dong@gmail.com',_binary '\0','$2a$10$3Vke14hdeWGh25HEPhpD.uncnmsUmGKstrOueJ98iHLZFfOv0oLnW','tamle1');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dimension` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `release_date` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `total_pages` int DEFAULT NULL,
  `translator` varchar(255) DEFAULT NULL,
  `category` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa58ia1r4ptov8h8agr0itfo67` (`category`),
  KEY `FKpjvgamjx7kpa7elu60x5e4b2h` (`discount`),
  CONSTRAINT `FKa58ia1r4ptov8h8agr0itfo67` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `FKpjvgamjx7kpa7elu60x5e4b2h` FOREIGN KEY (`discount`) REFERENCES `discount` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Nguyễn Tuân','8935247','“Sau một cái tử biệt, giờ ta phải tính đến một nỗi sinh li khác. Đối với đàn, hát, từ bây giờ ta nguyện làm một người điếc một người cô đơn một người phản bội. Và trên vong linh Bá Nhỡ\"','14,5 x 20,5 cm','https://firebasestorage.googleapis.com/v0/b/tam-le-112a8.appspot.com/o/book%2F2022-10-17%2004%3A47%3A53pexels-pixabay-259915.jpg?alt=media&token=71475208-2eb9-4896-bda1-810194a523d8','CHÙA ĐÀN',48000,'Hội nhà văn',11,'2022-01-01',_binary '\0',126,'Nguyễn Tuân',1,1),(2,'Trần Vàng Sao','893523','Thơ ông hiện ra như chính áo quần ông, tóc tai ông, hơi thở ông, ánh mắt ông, giọng nói ông, cảm giác ông, mồ hôi ông, đau đớn ông, giận dữ ông, giày vò ông, tuyệt vọng ông, khát vọng ông','14 x 20.5 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2020/9/4/DKQYFA75.jpg','BÀI THƠ CỦA MỘT NGƯỜI YÊU NƯỚC MÌNH',104000,'Hội nhà văn',15,'2022-03-03',_binary '\0',210,'Hội nhà văn',1,2),(3,'Blog của May','8935235','Được yêu, trong lý lẽ của nàng, là được sóng bước bên cạnh người đàn ông chứ không phải lặng thầm núp sau lưng họ. Được yêu, là được nâng niu theo cái cách mà nàng chờ đợi','14x20.5 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2019/11/14/2QAYBLJW.jpg','MUỐN LÀM NỮ HOÀNG',100000,'Dân Trí',11,'2019-04-01',_binary '\0',200,'Dân Trí',1,5),(4,'Zihua Nguyễn','224728','Thời sinh viên, trong tôi, ý nghĩ trở thành vĩ nhân luôn thường trực.\nBill Gates, Steve Jobs, Mark Zuckerberg.\nĐặc điểm chung của các vĩ nhân là họ luôn bỏ ngang đại học.','14x 20.5cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2019/11/14/C3F24YNQ.jpg','KÝ TÚC XÁ PHÒNG 307',55000,'Hội nhà văn',22,'2022-03-03',_binary '\0',176,'Hội nhà văn',1,3),(5,'Nguyễn Hoàng Vũ','8935235','Người đưa thư tình chính là những mảnh vụn cuộc sống qua góc nhìn của tuổi trẻ. Mà tuổi trẻ, ấy là tuổi của những đổ vỡ và làm lại, tuổi của khát vọng và ảo tưởng, của sự nhâng nháo bất cần, của những tiếng thở dài và niềm thiết tha','14x20.5 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2019/11/20/YB9HLB6Z.jpg','NGƯỜI ĐƯA THƯ TÌNH',63000,'Hội nhà văn',22,'2022-03-03',_binary '\0',188,'Hội nhà văn',1,3),(6,'Hoàng Minh Tường','893523','Gần 600 năm trước, khi cuộc chiến chống ngoại bang kết thúc, cũng là lúc cuộc chiến phe cánh trong nội bộ triều đình nhà Lê mở ra','14 x 20.5 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2019/10/29/3GX3U5U3.jpg','THẢM KỊCH VĨ NHÂN',93000,'Hội nhà văn',22,'2022-05-16',_binary '\0',400,'Hội nhà văn',1,2),(7,'Phan Việt','893523522','Chiều gió mát, tôi không vào Tam Bảo mà ngồi ngoài thềm nghe đại chúng tụng kinh. Từ chỗ ngồi, tôi thấy anh thợ sơn đứng phun nhũ vàng lên các tượng Tỳ Lô Giá Na','14x20.5 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2019/6/21/C5FA2DHX.jpg','VỀ NHÀ (TB 2019)',87000,'Hội nhà văn',22,'2019-03-14',_binary '\0',399,'Hội nhà văn',1,2),(8,'BS. Vân Hương','8935235','Bạn có phân vân trong việc đưa con đi tiêm chủng? Bạn có lo ngại về thông tin vắc xin MMR (sởi-rubella-quai bị) gây hội chứng tự kỷ? Và thủy ngân, cùng nhôm có thể được truyền vào cơ thể của trẻ cùng các mũi vắc xin?','14x20.5 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2019/6/28/1A4LDY89.jpg','ĐỂ CON ĐƯỢC CHÍCH - HIỂU HẾT VỀ VẮC XIN',65000,'Hội nhà văn',22,'2022-03-03',_binary '\0',99,'Hội nhà văn',1,4),(13,'Sir Arthur Conan Doyle','9876543132','Bạn đang cầm trên tay tập truyện về nhân vật thám tử nổi danh nhất mọi thời đại – vị thám tử tài ba xuất hiện đầu tiên trong tác phẩm trinh thám kinh điển “Sherlock Holmes” của nhà văn Arthur Conan Doyle.','13.5 x 20.5','https://salt.tikicdn.com/cache/w1200/ts/product/98/fb/6b/8afaf7b08aa4c6e408181baf4c6fdeaa.jpg','Sherlock Holmes toàn tập',500000,'Hội nhà văn',20,'2020-10-19',_binary '\0',600,'Bùi Liên Thảo - Vũ Thu Hà - Vũ Quế Anh',1,1),(14,'Rosie Nguyễn','8935236','Tuổi Trẻ Đáng Giá Bao Nhiêu\n\n\"Bạn hối tiếc vì không nắm bắt lấy một cơ hội nào đó, chẳng có ai phải mất ngủ.\n\nBạn trải qua những ngày tháng nhạt nhẽo với công việc bạn căm ghét, người ta chẳng hề bận lòng.','14x20.5 cm','https://cdn0.fahasa.com/media/catalog/product/i/m/image_119757.jpg','Tuổi Trẻ Đáng Giá Bao Nhiêu',75000,'Hội nhà văn',11,'2016-10-13',_binary '\0',292,'Rosie Nguyễn',1,3),(15,'Kawabata Yasunari','8935237','Không có gió. Trăng sáng gần như trăng rằm, nhưng hơi đêm ẩm ướt khiến cho đường nét của đỉnh quả núi nhỏ được vẽ nên bởi những thân cây nhòe đi. Tuy nhiên không phải do chúng lay động vì gió.','14x20.5 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2022/9/14/899HQYIC.jpg','TIẾNG NÚI',205000,'Hà Nội',33,'2022-09-29',_binary '\0',384,'Uyên Thiểm',2,3),(16,'Tất An','523523','Bản thân người trong cuộc là Tom Hazard - thoạt nhìn là một thầy giáo bốn mươi mốt tuổi không thể bình thưởng hơn - cũng chẳng thể trả lời câu hỏi đó.','14x20.5 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2022/9/12/1RJP3DAX.jpg','LÀM SAO DỪNG LẠI THỜI GIAN',152000,'Thông Tấn',55,'2022-10-20',_binary '\0',460,'Tất An',2,7),(17,'Tàn Tuyết','8935232','Những chuyện tình thế kỷ mới là câu chuyện dốc lòng theo đuổi cuộc sống xứng đáng của những con người bình thường nhất, có thể gặp ở bất cứ đâu trên cõi đời này','14x20.5 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2022/9/12/KDHP55N8.jpg','NHỮNG CHUYỆN TÌNH THẾ KỶ MỚI',165000,'Phụ nữ',55,'2016-10-13',_binary '\0',500,'Thúy Hạnh',2,4),(19,'Jean-Paul Dubois','35235234','Trong một buồng giam ở nhà tù Bordeaux, nằm bên dòng Prairies, Paul Hansen lần hồi lại cuộc đời mình. Là kết quả của cuộc hôn phối kỳ lạ giữa một mục sư đạo Tin Lành người Đan Mạch','14x20.5 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2022/7/20/J5213DVZ.jpg','KHÔNG AI SỐNG GIỐNG AI TRONG CUỘC ĐỜI NÀY',115000,'Hội nhà văn',88,'2022-11-11',_binary '\0',123,'Lê Hồng Sâm',2,3),(20,'Guy De Maupassant','5233683','Vì sao Chúa tạo ra điều đó? Một khi đêm đã dành cho giấc ngủ, cho nỗi vô tri vô giác, cho sự nghỉ ngơi, lãng quên hết thảy, thì vì sao lại khiến cho đêm thâu duyên dáng hơn ban ngày','14x20.5 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2022/7/11/4TH9IWTX.jpg','SÁNG TRĂNG',67000,'Hội nhà văn',100,'2022-08-23',_binary '\0',44,'Lê Hồng Sâm',2,4),(21,'Imamura Natsuko','35235233','Khắc họa một người dẫn chuyện có phần ngờ nghệch và kỳ dị là một việc hết sức khó khăn nhưng nhờ sự diện hiện của “cô gái mặc váy tím” mà những điều lẩn khuất trong bóng tối','14x20.5 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2022/7/11/UXYZPE2L.jpg','CÔ GÁI MẶC VÁY TÍM',85000,'Hà Nội',33,'2022-08-09',_binary '\0',55,'Vương Hải Yến',2,2),(22,'Maz Evans','5234062','Câu chuyện siêu hài hước này xoay quanh Thần và Người. Một cậu bé 12 tuổi tên Elliot, gia cảnh khó khăn, mẹ thì ốm bệnh, tuổi nhỏ mà nhiều việc đau đầu','14x20.5 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2022/7/11/1B5GKXCF.jpg','AI THẢ CÁC THẦN RA?',65000,'Hội nhà văn',22,'2022-08-09',_binary '\0',23,'Thu Phương',2,1),(23,'Haruki Murakami','523423','Nhạc trưởng và nhà văn, bên nhau, cùng lắng nghe những đĩa nhạc, ôn lại những kỷ niệm về quãng đời Seiji Ozawa đã trải qua cùng những bậc thầy như Glenn Gould, Bernstein, Karajan','14x20.5 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2022/6/21/YLZQH5YU.jpg','BÀN VỀ ÂM NHẠC - TRÒ CHUYỆN CÙNG SEIJI OZAWA',55000,'Hội nhà văn',54,'2022-06-09',_binary '\0',44,'Thu Phương',2,3),(24,'Carole Stivers','3523555','Tiểu thuyết đầu tay cuốn hút và đậm chất điện ảnh của Stivers đã đặt ra một câu hỏi thấm thía về bản chất mối kết nối giữa những người trong gia đình với nhau và giữa người với người','14x20.5 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2022/4/5/ITIP1FEH.jpg','MÃ MẪU TỬ',76000,'Hội nhà văn',76,'2022-11-09',_binary '\0',44,'Thu Phương',2,4),(25,'Bernhard Schlink','352357','Được viết ra ở nửa muộn của tuổi bảy mươi, với 9 màu chia ly – cuốn truyện ngắn thứ ba liên tiếp của Bernhard Schlink sau Những cuộc chạy trốn tình yêu và Mùa hè dối trả','14x20.5 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2022/3/21/O7J4WSKW.jpg','9 MÀU CHIA LY',120000,'Hội nhà văn',75,'2022-01-09',_binary '\0',11,'Thu Phương',2,5),(26,'Phạm Ngọc Điệp minh họa','352356','Bố mẹ biết chứ, trẻ dưới 18 tháng đã có khả năng chuyển tải suy nghĩ và cảm xúc bằng hình ảnh có màu sắc','18.5x26cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2022/9/9/WVTGDXMZ.jpg','TÔ MÀU PHÁT TRIỂN NÃO BỘ CHO BÉ 1-5 TUỔI TẬP 5\n',76000,'Dân Trí',44,'2022-01-09',_binary '\0',66,'Dân Trí',3,4),(27,'Phạm Ngọc Điệp minh họa','352357','Dành cho bé 1-5 tuổi:\n\nBố mẹ biết chứ, trẻ dưới 18 tháng đã có khả năng chuyển tải suy nghĩ và cảm xúc bằng hình ảnh có màu sắc','18.5x26cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2022/9/9/NYO2UXWV.jpg','TÔ MÀU PHÁT TRIỂN NÃO BỘ CHO BÉ 1-5 TUỔI TẬP 6',78000,'Dân Trí',21,'2022-01-09',_binary '\0',44,'Dân Trí',3,5),(28,'Phạm Ngọc Điệp minh họa','635235','Dành cho bé 1-5 tuổi:\n\nBố mẹ biết chứ, trẻ dưới 18 tháng đã có khả năng chuyển tải suy nghĩ và cảm xúc bằng hình ảnh có màu sắc','20x20 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2022/9/9/NYO2UXWV.jpg','BỐ ĐÃ TỪNG XA CON',99000,'Dân Trí',42,'2022-01-09',_binary '\0',123,'Dân Trí',3,1),(29,'Phạm Ngọc Điệp minh họa','352359','Dành cho bé 1-5 tuổi:\n\nBố mẹ biết chứ, trẻ dưới 18 tháng đã có khả năng chuyển tải suy nghĩ và cảm xúc bằng hình ảnh có màu sắc','15x21cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2018/6/7/OUBHBBZ2.jpg','NGÀY XƯA CỦA CON',67000,'Dân Trí',51,'2022-01-09',_binary '\0',55,'Dân Trí',3,2),(30,'Studio Afra','35235233','Khi con còn nằm trong nôi, bố mẹ chăm bẵm từng bữa sữa và giấc ngủ, chỉ mong con tự đứng tự đi được. Đến khi con đứng dậy, bắt đầu làm được việc này việc khác thì bố mẹ lại có nỗi lo khác','24x17 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2022/4/7/UQHMFN4D.jpg','BÉ YÊU NGOAN NGOÃN GIỎI GIANG – CẢM ƠN',56000,'Dân Trí',45,'2022-05-14',_binary '',56,'Đặng Văn Sử.',3,7),(31,'Ira Semenyuk','35235235','Cuộc sống khắp nơi trong rừng luôn sôi động, nhưng phần chính của cuộc sống ấy là những sinh vật nhỏ bé mà chẳng ai biết tới - những sinh vật rực rỡ, kỳ lạ,','20.5x28.5 cm','https://firebasestorage.googleapis.com/v0/b/tam-le-112a8.appspot.com/o/book%2F2022-10-17%2005%3A02%3A39pexels-gerhard-hofmarcher-7162816.jpg?alt=media&token=cc4cdfdd-242d-4ae1-86b3-79e88d679a9e','SINH VẬT HỌC KỲ THÚ',100000,'Dân Trí',78,'2022-05-23',_binary '\0',89,'Đặng Văn Sử.',3,6),(32,'Mary Roach','35235212','Từ Chiến tranh thế giới thứ hai đến nay, chúng ta đã luôn chứng kiến một quân đội Hoa Kỳ hùng mạnh, tinh nhuệ và uy hiếp bậc nhất hoàn cầu','15.5 x 24cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2019/12/11/ROWH1CL4.jpg','LÍNH TRƠN - KHOA HỌC LẠ KỲ VỀ LOÀI NGƯỜI',116000,'Thế Giới',34,'2022-05-23',_binary '\0',340,'Nguyễn An Thái',4,1),(33,'Yuval Noah Harari','35235213','Sau khi tìm hiểu quá khứ và tương lai của nhân loại qua hai cuốn sách gây tiếng vang là Sapiens và Homo deus, Yuval Noah Harari đi sâu vào các vấn đề “ngay tại đây”','15.5 x 24cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2019/10/1/1TN5N61N.jpg','21 BÀI HỌC CHO THẾ KỶ 21',125000,'Thông Tấn',12,'2022-07-16',_binary '\0',123,'Dương Ngọc Trà',4,4),(34,'Axelle Doppelt','5223035','Giới thiệu sách\nBắt đầu từ LỬA, phát minh vĩ đại nhất trong lịch sử loài người, thứ đưa con người vĩnh viễn thoát khỏi trường kỳ tăm tối, con người đã có thêm vô vàn những phát minh vĩ đại trong công cuộc tiến hóa và chinh phục thiên nhiên','17.6x25 cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2019/9/17/XMQWDM1U.jpg','18 PHÁT MINH VĨ ĐẠI',150000,'Thông Tấn',66,'2022-08-01',_binary '\0',500,'May^Sao',4,2),(35,'RICHARD HOLLOWAY','5223295','Hơn bảy tỷ người trên thế giới có thể viết một thứ gì đó khác chữ “Không” vào mục Tôn giáo trong hồ sơ của mình. Một số sinh ra đã theo một tôn giáo được chọn sẵn;','15.5 x 24cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2019/8/19/B85QRJOU.jpg','LƯỢC SỬ TÔN GIÁO',123000,'Thế Giới',88,'2022-01-19',_binary '\0',340,'Loan Vũ',4,5),(36,'Li Jing','35222632','Có một sự thật rằng: trong cuộc sống cũng như trong công việc, những người có khả năng diễn đạt tốt thường có mối quan hệ xã hội tốt,  do vậy họ gặp nhiều thuận lợi hơn','14 x 20.5cm','http://static.nhanam.com.vn/thumb/0x320/crop/Books/Images/2019/6/27/45CW6K4Z.jpg','BIẾT ĂN NÓI CHẲNG LO THUA THIỆT',99000,'Thông Tấn',12,'2022-04-12',_binary '\0',650,'Trịnh Thanh Hà',4,2),(37,'Đỗ Văn Ninh','35221550','Lịch sử lâu đời hơn hai nghìn năm của nước Việt Nam đã tạo nên những hệ thống quan lại liên tục được cải tổ theo sự vận động của các thời kỳ, các triều đại','17x25 cm','https://firebasestorage.googleapis.com/v0/b/tam-le-112a8.appspot.com/o/book%2F2022-10-17%2004%3A37%3A23pexels-pixabay-259915.jpg?alt=media&token=6630295d-1d94-41db-a5d0-7b8605314dbc','TỪ ĐIỂN CHỨC QUAN VIỆT NAM',80000,'Thế Giới',78,'2022-01-15',_binary '\0',330,'Loan Vũ',4,6),(38,'Romain Gary','35221451','Lấy bối cảnh châu Phi sau chiến tranh thế giới lần thứ nhất, Rễ trời kể về thảm kịch của loài voi trên các xa van cũng như cuộc chiến của một “tay người Pháp” điên khùng, một kẻ muốn chuyển loài','14x20.5 cm','https://firebasestorage.googleapis.com/v0/b/tam-le-112a8.appspot.com/o/book%2F2022-10-21%2010%3A48%3A13pexels-irina-iriser-1408221.jpg?alt=media&token=791bd6f9-4a67-43c8-835a-06954c9ed964','RỄ TRỜI',98000,'Thông Tấn',123,'2022-01-09',_binary '\0',330,'Trịnh Thanh Hà',2,6),(39,'Tâm','123123123','ádasdsadas','11x14cm','https://firebasestorage.googleapis.com/v0/b/tam-le-112a8.appspot.com/o/book%2F2022-10-07%2002%3A10%3A36pexels-tim-mossholder-1000653.jpg?alt=media&token=8e76118f-c10d-4cdc-b41d-385ae3c66c67','Sách Hay',1000000,'Hà Nội',66,'2022-10-09',_binary '',100,'Tâm',1,9),(40,'Tâm','1','12412412rfdfdsfsdfds','11','https://firebasestorage.googleapis.com/v0/b/tam-le-112a8.appspot.com/o/book%2F2022-10-10%2002%3A10%3A07pexels-abdulwahab-alawadhi-6379842.jpg?alt=media&token=7d3968a7-b285-45b9-add9-a640197f0c7f','ádasdsa',100000,'Sài gòn',12,'2022-10-06',_binary '',44,'sadsadsa',4,6);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_create` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdebwvad6pp1ekiqy5jtixqbaj` (`customer_id`),
  CONSTRAINT `FKdebwvad6pp1ekiqy5jtixqbaj` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'2022-12-12',_binary '\0',1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_detail`
--

DROP TABLE IF EXISTS `cart_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKflpu1psdex9le27p7owju2piw` (`book_id`),
  KEY `FKrg4yopd2252nwj8bfcgq5f4jp` (`cart_id`),
  CONSTRAINT `FKflpu1psdex9le27p7owju2piw` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `FKrg4yopd2252nwj8bfcgq5f4jp` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_detail`
--

LOCK TABLES `cart_detail` WRITE;
/*!40000 ALTER TABLE `cart_detail` DISABLE KEYS */;
INSERT INTO `cart_detail` VALUES (1,15,1,1);
/*!40000 ALTER TABLE `cart_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Văn Học Việt Nam'),(2,'Văn Học Nước Ngoài'),(3,'Thiếu Nhi'),(4,'Thời sự-Chính Trị');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `birth_day` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKslkyb5dphxe4c7au3hqx3la6m` (`user_id`),
  CONSTRAINT `FKslkyb5dphxe4c7au3hqx3la6m` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Ngủ Hành Sơn-Da Nang','2000-01-01','tamle011998@gmail.com',1,'Le Thanh Tam','090900990',1),(2,'Điện Bàn-Quang Nam','1990-01-01','abcc@gmail.com',0,'Nguyen Văn An','0986464654',2),(3,'Hải Châu-Da Nang','1999-01-01','hung21312@gmail.com',0,'Nguyễn Phi Hùng','0896345342',9),(4,'Hoà Khánh-Da Nang','1998-01-01','tuandasdsa@gmail.com',1,'Le Thanh Tam','0352141233',10);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `percent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,'10'),(2,'15'),(3,'20'),(4,'25'),(5,'30'),(6,'35'),(7,'40'),(8,'45'),(9,'50');
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_deleted` bit(1) DEFAULT b'0',
  `role_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp6m37g6n6c288s096400uw8fw` (`role_id`),
  KEY `FKg7fr1r7o0fkk41nfhnjdyqn7b` (`user_id`),
  CONSTRAINT `FKg7fr1r7o0fkk41nfhnjdyqn7b` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
  CONSTRAINT `FKp6m37g6n6c288s096400uw8fw` FOREIGN KEY (`role_id`) REFERENCES `app_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,_binary '\0',1,1),(8,_binary '\0',1,9),(9,_binary '\0',2,10),(10,_binary '\0',1,3),(11,_binary '\0',1,3);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-24  8:51:39
