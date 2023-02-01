INSERT INTO MEMBERTBL
(MEMBER_ID, MEMBER_PW,  MEMBER_GR,MEMBER_NICKNAME,MEMBER_BIRTH,MEMBER_ADDR,MEMBER_EMAIL,MEMBER_INFONUM,MEMBER_JOINDATE,MEMBER_BLACKYN,MEMBER_EVENTQTY) 
VALUES ('testUser00', 'testUser00', 1, 'testUser00', cast(NOW() as CHAR),  '서울특별시', 'text00@naver.com', SUBSTR(MD5(RAND()),1,60), cast(NOW() as CHAR) ,  1, 0);

INSERT INTO MEMBERTBL
(MEMBER_ID, MEMBER_PW,  MEMBER_GR,MEMBER_NICKNAME,MEMBER_BIRTH,MEMBER_ADDR,MEMBER_EMAIL,MEMBER_INFONUM,MEMBER_JOINDATE,MEMBER_BLACKYN,MEMBER_EVENTQTY) 
VALUES ('testUser10', 'testUser10', 1, 'testUser10', cast(NOW() as CHAR),  
		(SELECT DISTINCT DABUNRU FROM KOREANADDRESS WHERE DABUNRU = '서울특별시')   
		,'text10@naver.com', SUBSTR(MD5(RAND()),1,60), cast(NOW() as CHAR),  
		1, 0);

-- 회원가입 쿼리
<insert id="insertMemberTbl"> 
INSERT INTO MEMBERTBL
(MEMBER_ID, MEMBER_PW,MEMBER_GR, MEMBER_NICKNAME, MEMBER_BIRTH, MEMBER_ADDR,MEMBER_EMAIL, MEMBER_INFONUM, MEMBER_JOINDATE, MEMBER_BLACKYN, MEMBER_EVENTQTY) 
VALUES (#{memberId},#{memberPw}, 1, #{memberNickname}, #{memberBirth},  
(SELECT DISTINCT DABUNRU FROM KOREANADDRESS WHERE DABUNRU = #{memberAddr})
,#{memberEmail},  SUBSTR(MD5(RAND()),1,60), cast(NOW() as CHAR) ,  
1, 0);
</insert>

-- 회원정보 조회 쿼리
<select id="showInfo" resultType="basemap" parameterType="basemap">
SELECT 	MEMBER_ID AS '아이디'
		, MEMBER_NICKNAME AS '닉네임' 
     , date_format(MEMBER_BIRTH,"%Y-%m-%d") AS '생일'
     , MEMBER_ADDR AS '주소'
     , MEMBER_EMAIL AS '이메일'
     , date_format(MEMBER_JOINDATE,"%Y-%m-%d") AS '회원가입한 날짜'
     , MEMBER_EVENTQTY AS '이벤트에 당첨된 총 횟수'
FROM 	MEMBERTBL A
WHERE   A.MEMBER_ID = #{memberId};
</select>


-- 1로 참이 되어야 수정 처리
<select id="login" resultType="basemap" parameterType="basemap">
SELECT COUNT(*) FROM MEMBERTBL WHERE MEMBER_ID = #{memberId} AND MEMBER_PW = #{memberPw};
</select>

<update id="modifyInfo" resultType="basemap" parameterType="basemap">
UPDATE MEMBERTBL 
SET MEMBER_PW = 'admin'
,MEMBER_ADDR = 'admin'
, MEMBER_EMAIL = 'admin@test.com'
WHERE MEMBER_ID = 'admin';
</update>

-- 회원삭제
<delete id="deleteMember" resultType="basemap" parameterType="basemap">
DELETE FROM MEMBERTBL 
WHERE MEMBER_ID = #{memberId} 
AND	 MEMBER_PW = #{memberPw};
</delete>

-- 로그인 쿼리
SELECT COUNT(*) FROM MEMBERTBL WHERE MEMBER_ID = 'admin' AND MEMBER_PW = 'admin';

1로 참이 되어야 로그인 처리
<select id="login" resultType="basemap" parameterType="basemap">
SELECT COUNT(*) FROM MEMBERTBL WHERE MEMBER_ID = #{memberId} AND MEMBER_PW = #{memberPw};
</select>

-- 메인화면 아이디 보여주기
select id ="showId" resultType="basemap" parameterType="basemap">
ELECT MEMBER_ID FROM MEMBERTBL WHERE MEMBER_ID = 'admin';
</select>
