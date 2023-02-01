-- Active: 1672623407625@@125.128.104.134@2487@azabellcode
USE AZABELLCODE;

SHOW TABLES;

SELECT * FROM MEMBERTBL WHERE MEMBER_ID LIKE 'testUser%';

SELECT * FROM MEMBERTBL WHERE MEMBER_ID = 'testUser00';

SELECT CAST((SELECT COUNT(*) FROM (	SELECT 	MEMBER_INFONUM FROM MEMBERTBL WHERE 	MEMBER_ID = 'testUser00' AND MEMBER_PW = 'testUser00' AND MEMBER_INFONUM = (SELECT MEMBER_INFONUM FROM MEMBERTBL WHERE MEMBER_ID = 'testUser00')) A) AS CHAR) AS LOGIN;

SELECT COUNT(*) FROM MEMBERTBL WHERE MEMBER_ID = 'testUser00';

SELECT COUNT(*) FROM MEMBERTBL WHERE MEMBER_ID = "testUser00";

SELECT COUNT(*) FROM MEMBERTBL WHERE MEMBER_ID = 'testUser00';

INSERT INTO test01 VALUES(
    (SELECT COUNT(*) FROM test),
    (SELECT COUNT(*) FROM test)
);
 
SELECT * FROM test01;

DESC MEMBERTBL;

CREATE TABLE LOGIN_IMSI (
    memberId    varchar(30) PRIMARY KEY
    , memberPw  varchar(12) NOT NULL
) DEFAULT CHARSET=utf8mb4;

DROP TABLE LOGIN_IMSI;
--------------------

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