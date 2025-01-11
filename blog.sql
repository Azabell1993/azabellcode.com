-- MySQL dump 10.13  Distrib 9.0.1, for macos14.7 (x86_64)
--
-- Host: localhost    Database: AZABELLCODE
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_idx` int NOT NULL AUTO_INCREMENT COMMENT '게시물 번호',
  `title` varchar(255) NOT NULL COMMENT '제목',
  `contents` text NOT NULL COMMENT '내용',
  `creater_id` varchar(50) NOT NULL COMMENT '작성자 ID',
  `password` varchar(100) NOT NULL COMMENT '비밀번호',
  `created_datetime` datetime NOT NULL COMMENT '작성 일자',
  `delete_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '삭제 여부',
  `hit_cnt` int NOT NULL DEFAULT '0' COMMENT '조회수',
  `parent_idx` int DEFAULT NULL COMMENT '부모 게시글 번호',
  `depth` int DEFAULT '0',
  PRIMARY KEY (`board_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시판 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (46,'원문','원','원','1234','2025-01-01 17:52:48','N',5,NULL,0),(47,'원문2','원문2','원문2','1234','2025-01-01 17:52:59','N',1,46,1),(48,'원문3','1234','원문3','1234','2025-01-01 17:53:09','N',1,47,2),(49,'테스트','','테스트','1234','2025-01-01 17:59:04','N',2,NULL,0),(50,'테스트2','2','테스트2','1234','2025-01-01 17:59:19','N',4,49,1),(51,'원문4','1234','원문4','1234','2025-01-01 18:06:36','N',1,48,3),(53,'1234','1234','1234','1234','2025-01-01 22:08:08','N',1,NULL,0),(54,'테스트4','테스트4444','테스트4','1234','2025-01-01 22:10:09','N',1,NULL,0),(55,'ㅎㅇ','ㅎㅇ','ㅎㅇ','1234','2025-01-01 22:13:41','N',0,50,2),(56,'ㅇ','3','1','1234','2025-01-01 22:18:56','N',2,NULL,0),(57,'123','123','123','1234','2025-01-01 22:33:33','N',1,NULL,0),(58,'1234444','1234','1234444','1234','2025-01-01 22:33:45','N',1,57,1),(59,'33','33','33','1234','2025-01-01 22:33:57','N',0,58,2),(60,'테스트5','1234','테스트5','1234','2025-01-01 22:34:09','N',1,54,1),(61,'ㅇㅇㅇ2','1234','ㅇㅇㅇㅇ','1234','2025-01-01 23:29:16','N',0,56,1);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KOREANADDRESS`
--

DROP TABLE IF EXISTS `KOREANADDRESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KOREANADDRESS` (
  `DABUNRU` varchar(50) NOT NULL COMMENT '주소 코드',
  `ADDRESS_NAME` varchar(200) NOT NULL COMMENT '주소 이름',
  PRIMARY KEY (`DABUNRU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='한국 주소 데이터 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KOREANADDRESS`
--

LOCK TABLES `KOREANADDRESS` WRITE;
/*!40000 ALTER TABLE `KOREANADDRESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `KOREANADDRESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOGIN_IMSI`
--

DROP TABLE IF EXISTS `LOGIN_IMSI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOGIN_IMSI` (
  `memberId` varchar(30) NOT NULL,
  `memberPw` varchar(12) NOT NULL,
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOGIN_IMSI`
--

LOCK TABLES `LOGIN_IMSI` WRITE;
/*!40000 ALTER TABLE `LOGIN_IMSI` DISABLE KEYS */;
INSERT INTO `LOGIN_IMSI` VALUES ('testUser00','testUser00');
/*!40000 ALTER TABLE `LOGIN_IMSI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEMBERTBL`
--

DROP TABLE IF EXISTS `MEMBERTBL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MEMBERTBL` (
  `MEMBER_ID` varchar(30) NOT NULL COMMENT '회원 ID',
  `MEMBER_PW` varchar(100) NOT NULL COMMENT '회원 비밀번호',
  `MEMBER_GR` int NOT NULL COMMENT '회원 등급',
  `MEMBER_NICKNAME` varchar(50) NOT NULL COMMENT '회원 닉네임',
  `MEMBER_BIRTH` varchar(10) NOT NULL COMMENT '회원 생년월일',
  `MEMBER_ADDR` varchar(200) NOT NULL COMMENT '회원 주소',
  `MEMBER_EMAIL` varchar(100) NOT NULL COMMENT '회원 이메일',
  `MEMBER_INFONUM` varchar(100) NOT NULL COMMENT '회원 고유 정보 번호',
  `MEMBER_JOINDATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '회원 가입 날짜',
  `MEMBER_BLACKYN` tinyint(1) NOT NULL COMMENT '회원 블랙리스트 여부',
  `MEMBER_EVENTQTY` int NOT NULL DEFAULT '0' COMMENT '이벤트 당첨 횟수',
  PRIMARY KEY (`MEMBER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='회원 정보 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEMBERTBL`
--

LOCK TABLES `MEMBERTBL` WRITE;
/*!40000 ALTER TABLE `MEMBERTBL` DISABLE KEYS */;
INSERT INTO `MEMBERTBL` VALUES ('testUser00','testUser00',1,'testUser00','1990-01-01','서울특별시','test00@naver.com','6650f2a7fae99fcb86ba21b4110d70b0','2024-12-31 21:42:18',0,0),('회원가입예제','회원가입예제',1,'회원가입예제','1985-05-15','서울특별시','test01@naver.com','95121ea0253600984fe235356f915c3f','2024-12-31 21:42:19',0,0);
/*!40000 ALTER TABLE `MEMBERTBL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST_MAP`
--

DROP TABLE IF EXISTS `TEST_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEST_MAP` (
  `name` varchar(255) NOT NULL COMMENT '이름',
  `age` bigint DEFAULT NULL COMMENT '나이'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST_MAP`
--

LOCK TABLES `TEST_MAP` WRITE;
/*!40000 ALTER TABLE `TEST_MAP` DISABLE KEYS */;
INSERT INTO `TEST_MAP` VALUES ('부산광역시',30),('대구광역시',27),('광주광역시',NULL);
/*!40000 ALTER TABLE `TEST_MAP` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-02  9:55:59
