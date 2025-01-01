USE AZABELLCODE;

SHOW TABLES;


-- 회원 가입 쿼리
INSERT INTO MEMBERTBL
(MEMBER_ID, MEMBER_PW,  MEMBER_GR,MEMBER_NICKNAME,MEMBER_BIRTH,MEMBER_ADDR,MEMBER_EMAIL,MEMBER_INFONUM,MEMBER_JOINDATE,MEMBER_BLACKYN,MEMBER_EVENTQTY) 
VALUES ('testUser00', 'testUser00', 1, 'testUser00', cast(NOW() as CHAR),  '서울특별시', 'text00@naver.com', SUBSTR(MD5(RAND()),1,60), cast(NOW() as CHAR) ,  1, 0);

INSERT INTO MEMBERTBL
(MEMBER_ID, MEMBER_PW,  MEMBER_GR,MEMBER_NICKNAME,MEMBER_BIRTH,MEMBER_ADDR,MEMBER_EMAIL,MEMBER_INFONUM,MEMBER_JOINDATE,MEMBER_BLACKYN,MEMBER_EVENTQTY) 
VALUES ('회원가입예제', '회원가입예제', 1, '회원가입예제', cast(NOW() as CHAR),
		(SELECT DISTINCT DABUNRU FROM KOREANADDRESS WHERE DABUNRU = '서울특별시')
		,'회원가입예제@naver.com', SUBSTR(MD5(RAND()),1,60), cast(NOW() as CHAR),
		1, 0);

SELECT COUNT(*) FROM MEMBERTBL;

SELECT * FROM MEMBERTBL;

SHOW TABLES;

DESC MEMBERTBL ;
DESC KOREANADDRESS ;

SELECt * FROM KOREANADDRESS;

ALTER TABLE MEMBERTBL MODIFY MEMBER_INFONUM VARCHAR(100);
SELECT DISTINCT DABUNRU FROM KOREANADDRESS;

SELECT COUNT(*) FROM MEMBERTBL WHERE MEMBER_INFONUM LIKE '%';

SELECT MEMBER_INFONUM FROM MEMBERTBL WHERE MEMBER_INFONUM LIKE '%';


SELECT * FROM MEMBERTBL WHERE MEMBER_ID LIKE 'test%'


-- 멤버 인포넘버 무작위 배당
SELECT SUBSTR(MD5(RAND()),1,60) AS RandomString FROM DUAL ;

-- 회원 정보 조회 쿼리
SELECT 	MEMBER_ID AS '아이디'
	    , MEMBER_NICKNAME AS '닉네임' 
	    , MEMBER_BIRTH AS '생일'
        , MEMBER_ADDR AS '주소'
        , MEMBER_EMAIL AS '이메일'
        , date_format(MEMBER_JOINDATE,"%Y-%m-%d") AS '회원가입한 날짜'
        , MEMBER_EVENTQTY AS '이벤트에 당첨된 총 횟수'
        FROM 	MEMBERTBL WHERE MEMBER_ID  = '회원가입예제';

-- 전체 회원 조회
SELECT 	MEMBER_ID
        , MEMBER_NICKNAME
        , MEMBER_BIRTH
        , MEMBER_ADDR
        , MEMBER_EMAIL
        , CAST(date_format(MEMBER_JOINDATE,"%Y-%m-%d") AS CHAR) AS MEMBER_JOINDATE
        , MEMBER_EVENTQTY
        FROM 	MEMBERTBL;

SELECT COUNT(*) AS COUNT FROM MEMBERTBL;

DESC MEMBERTBL;
SELECT COUNT(*) AS COUNT
        FROM 	MEMBERTBL B
        WHERE 	B.MEMBER_ID LIKE '%';

-- 유저 별 개인 회원정보 조회
SELECT 	MEMBER_ID AS '아이디'
	, MEMBER_NICKNAME AS '닉네임' 
	, MEMBER_BIRTH AS '생일'
    , MEMBER_ADDR AS '주소'
    , MEMBER_EMAIL AS '이메일'
    , CAST(date_format(MEMBER_JOINDATE,"%Y-%m-%d") AS CHAR) AS '회원가입한 날짜'
        	, MEMBER_EVENTQTY AS '이벤트에 당첨된 총 횟수'
FROM 	MEMBERTBL A
WHERE   A.MEMBER_ID = 'user0';

-- 회원정보 조회 쿼리
-- <select id="showInfo" resultType="basemap" parameterType="basemap">
-- SELECT 	MEMBER_ID AS '아이디'
-- 		, MEMBER_NICKNAME AS '닉네임'
--      , date_format(MEMBER_BIRTH,"%Y-%m-%d") AS '생일'
--      , MEMBER_ADDR AS '주소'
--      , MEMBER_EMAIL AS '이메일'
--      , date_format(MEMBER_JOINDATE,"%Y-%m-%d") AS '회원가입한 날짜'
--      , MEMBER_EVENTQTY AS '이벤트에 당첨된 총 횟수'
-- FROM 	MEMBERTBL A
-- WHERE   A.MEMBER_ID = #{memberId};
-- </select>

-- 회원정보 수정 쿼리
UPDATE MEMBERTBL
SET MEMBER_PW = 'admin' 				-- 패스워드 수정
	,MEMBER_ADDR = 'admin' 				-- 주소 수정
	, MEMBER_EMAIL = 'admin@test.com'  	-- 이메일 주소 수정
WHERE MEMBER_ID = 'admin';
-- 1로 참이 되어야 수정 처리
-- <select id="login" resultType="basemap" parameterType="basemap">
-- SELECT COUNT(*) FROM MEMBERTBL WHERE MEMBER_ID = #{memberId} AND MEMBER_PW = #{memberPw};
-- </select>

-- <update id="modifyInfo" resultType="basemap" parameterType="basemap">
-- UPDATE MEMBERTBL 
-- SET MEMBER_PW = 'admin'
-- ,MEMBER_ADDR = 'admin'
-- , MEMBER_EMAIL = 'admin@test.com'
-- WHERE MEMBER_ID = 'admin';
-- </update>

-- 회원삭제
DELETE FROM MEMBERTBL
WHERE MEMBER_ID = 'admin'
AND	  MEMBER_PW = 'admin';
-- <delete id="deleteMember" resultType="basemap" parameterType="basemap">
-- DELETE FROM MEMBERTBL
-- WHERE MEMBER_ID = #{memberId}
-- AND	 MEMBER_PW = #{memberPw};
-- </delete>
COMMIT;
SELECT * FROM MEMBERTBL;

-- 로그인 쿼리
SELECT COUNT(*) FROM MEMBERTBL WHERE MEMBER_ID = 'admin' AND MEMBER_PW = 'admin';

-- 아이디와 비밀번호, 무작위 발급되는 토큰이 입력한 아이디와 일치하는지 조회
SELECT CAST((  SELECT COUNT(*) FROM ( 
        SELECT MEMBER_INFONUM FROM MEMBERTBL WHERE MEMBER_ID = '회원가입예제' AND MEMBER_PW = '회원가입예제' AND MEMBER_INFONUM = ( 
        SELECT MEMBER_INFONUM FROM MEMBERTBL WHERE MEMBER_ID = '회원가입예제')) A) AS CHAR);

-- 1로 참이 되어야 로그인 처리
-- <select id="login" resultType="basemap" parameterType="basemap">
-- SELECT COUNT(*) FROM MEMBERTBL WHERE MEMBER_ID = #{memberId} AND MEMBER_PW = #{memberPw};
-- </select>

-- 메인화면 아이디 보여주기
SELECT MEMBER_ID FROM MEMBERTBL WHERE MEMBER_ID = 'admin';
-- <select id ="showId" resultType="basemap" parameterType="basemap">
-- SELECT MEMBER_ID FROM MEMBERTBL WHERE MEMBER_ID = 'admin';
-- </select>

select MEMBER_BIRTH, MEMBER_JOINDATE from MEMBERTBL;
