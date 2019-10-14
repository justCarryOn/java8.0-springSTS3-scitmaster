-- 회원, 을 위한 테이블 및 삭제
DROP table bookinfo;
DROP SEQUENCE bookinfo_seq;

DROP TABLE bookmember;



-- 회원 관련 테이블
CREATE TABLE bookmember (
	userid 		VARCHAR2(50)  PRIMARY KEY,		-- 아이디
	userpwd 	VARCHAR2(50)  NOT NULL,			-- 비밀번호
	username 	VARCHAR2(100) NOT NULL			-- 이름
);

INSERT INTO bookmember VALUES ('aaa', 'aaa', '홍길동');
INSERT INTO bookmember VALUES ('bbb', 'bbb', '전우치');
INSERT INTO bookmember VALUES ('ccc', 'ccc', '임꺽정');

COMMIT;

-- 개인 보유 책정보 테이블
CREATE table bookinfo (
	booknum 	number 		  primary key,		--게시글 일련번호
	shelfname	varchar2(200) not null , 		-- 책장이름
	userid		varchar2(50)  references bookmember(userid), -- 유저아이디
	btitle 		varchar2(200) not null, 		-- 책제목
	writer		varchar2(200),					-- 저자
	publisher	varchar2(200),					-- 출판사
	purchasedate date		  default sysdate,	-- 구매일
	price 		 number		  not null,			-- 책 가격
	bookreview 	varchar2(1000)					-- 독서 감상평
);

--개인 보유 책정보 일련번호에 사용할 시퀀스 생성
CREATE SEQUENCE bookinfo_seq;

SELECT * FROM bookinfo;
