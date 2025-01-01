-- Active: 1672623407625@@125.128.104.134@2487@azabellcode
CREATE DATABASE `AZABELLCODE` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */

USE AZABELLCODE;

-- AZABELLCODE.MEMBERTBL definition
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


-- AZABELLCODE.TEST_MAP definition
CREATE TABLE `TEST_MAP` (
  `name` varchar(255) NOT NULL COMMENT '이름',
  `age` bigint DEFAULT NULL COMMENT '나이'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- AZABELLCODE.LOGIN_IMSI definition
CREATE TABLE LOGIN_IMSI (
    memberId    varchar(30) PRIMARY KEY
    , memberPw  varchar(12) NOT NULL
) DEFAULT CHARSET=utf8mb4;

-- AZABELLCODE.KOREANADDRESS definition
CREATE TABLE `KOREANADDRESS` (
  `DABUNRU` varchar(50) NOT NULL COMMENT '주소 코드',
  `ADDRESS_NAME` varchar(200) NOT NULL COMMENT '주소 이름',
  PRIMARY KEY (`DABUNRU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='한국 주소 데이터 테이블';

-- AZABELLCODE.BOARD definition
CREATE TABLE `BOARD` (
  `board_idx` int NOT NULL AUTO_INCREMENT COMMENT '게시물 번호',
  `title` varchar(255) NOT NULL COMMENT '제목',
  `contents` text NOT NULL COMMENT '내용',
  `creater_id` varchar(50) NOT NULL COMMENT '작성자 ID',
  `password` varchar(100) NOT NULL COMMENT '비밀번호',
  `created_datetime` datetime NOT NULL COMMENT '작성 일자',
  `delete_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '삭제 여부',
  `hit_cnt` int NOT NULL DEFAULT '0' COMMENT '조회수',
  PRIMARY KEY (`board_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시판 테이블';


SHOW TABLES;

SELECT * FROM MEMBERTBL WHERE MEMBER_ID LIKE 'testUser%';

SELECT * FROM MEMBERTBL WHERE MEMBER_ID = 'testUser00';

SELECT CAST((SELECT COUNT(*) FROM (	SELECT 	MEMBER_INFONUM FROM MEMBERTBL WHERE 	MEMBER_ID = 'testUser00' AND MEMBER_PW = 'testUser00' AND MEMBER_INFONUM = (SELECT MEMBER_INFONUM FROM MEMBERTBL WHERE MEMBER_ID = 'testUser00')) A) AS CHAR) AS LOGIN;

SELECT COUNT(*) FROM MEMBERTBL WHERE MEMBER_ID = 'testUser00';

SELECT COUNT(*) FROM MEMBERTBL WHERE MEMBER_ID = "testUser00";

SELECT COUNT(*) FROM MEMBERTBL WHERE MEMBER_ID = 'testUser00';

INSERT INTO BOARD (title, contents, creater_id, password, created_datetime)
VALUES 
    ('첫 번째 게시글', '첫 번째 게시글의 내용입니다.', 'azabell', 'password123', NOW()),
    ('두 번째 게시글', '두 번째 게시글의 내용입니다.', 'user1', 'securepass456', NOW());


CREATE TABLE LOGIN_IMSI (
    memberId    varchar(30) PRIMARY KEY
    , memberPw  varchar(12) NOT NULL
) DEFAULT CHARSET=utf8mb4;

-- 임시 Table Login SQL Test 성공
INSERt INTO LOGIN_IMSI(memberId, memberPw)
SELECT 'testUser00', 'testUser00'
FROM DUAL
WHERE EXISTS
        (SELECT CAST((  SELECT COUNT(*)
                        FROM (  SELECT MEMBER_INFONUM
                                FROM MEMBERTBL
                                WHERE MEMBER_ID = 'testUser00'
                                AND MEMBER_PW = 'testUser00'
                                AND MEMBER_INFONUM = (  SELECT MEMBER_INFONUM
                                                        FROM MEMBERTBL
                                                        WHERE MEMBER_ID = 'testUser00')) A)
                                                        AS CHAR)
                                                    AS LOGIN);

SELECT * FROM LOGIN_IMSI;

DESC LOGIN_IMSI;


SELECT CAST((  SELECT COUNT(*)
FROM (  SELECT MEMBER_INFONUM
        FROM MEMBERTBL
        WHERE MEMBER_ID = 'testUser00'
        AND MEMBER_PW = 'testUser00'
        AND MEMBER_INFONUM = (  SELECT MEMBER_INFONUM
                                FROM MEMBERTBL
                                WHERE MEMBER_ID = 'testUser00')) A)
                                AS CHAR)
AS LOGIN;


SELECT DISTINCT
	IFNULL((SELECT CAST((  SELECT COUNT(*)
FROM (  SELECT MEMBER_INFONUM
        FROM MEMBERTBL
        WHERE MEMBER_ID = 'testUser00'
        AND MEMBER_PW = 'testUser00'
        AND MEMBER_INFONUM = (  SELECT MEMBER_INFONUM
                                FROM MEMBERTBL
                                WHERE MEMBER_ID = 'testUser00')) A)
                                AS CHAR) ),0) AS LOGIN
FROM MEMBERTBL;


SELECT DISTINCT
	IFNULL((SELECT CAST((  SELECT COUNT(*)
			FROM (  SELECT MEMBER_INFONUM
			        FROM MEMBERTBL
			        WHERE MEMBER_ID = 'testUser00'
			        AND MEMBER_PW = 'testUser00'
			        AND MEMBER_INFONUM = (  SELECT MEMBER_INFONUM
			                                FROM MEMBERTBL
			                                WHERE MEMBER_ID = 'testUser00')) A)
			                                AS CHAR) ),0) AS LOGIN
FROM MEMBERTBL;