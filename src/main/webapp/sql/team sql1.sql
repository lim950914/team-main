CREATE DATABASE untact;

USE untact;

DROP TABLE tp_member;

CREATE TABLE tp_member(
  memberId  VARCHAR(50) PRIMARY KEY, -- 아이디
  memberPw VARCHAR(100) NOT NULL, -- 비밀번호
  memberName VARCHAR(30) NOT NULL, -- 이름
  membernickName VARCHAR(30) NOT NULL, -- 닉네임
  memberBirth DATE NOT NULL, -- 생일
  memberPhoneNum VARCHAR(30) NOT NULL, -- 폰번호
  memberMail VARCHAR(100) NOT NULL, -- 이메일
  memberAddNum VARCHAR(100) NOT NULL, -- 우편번호
  memberAddCity VARCHAR(100) NOT NULL, -- 주소
  regDate TIMESTAMP DEFAULT NOW(), -- 가입날짜
  enabled TINYINT(1) DEFAULT 1
);

DESC tp_member;

SELECT * FROM tp_member;

INSERT INTO tp_member
(memberId, memberPw, memberName, membernickName, memberBirth, memberPhoneNum, memberMail, memberAddNum, memberAddCity)
VALUES ('qwe', '1234', '찬영', '비대변', '950914', '01088076027', 'dlackswn2222@naver.com', '12345', '경기도 하남');

DROP TABLE tp_member_auth;

CREATE TABLE tp_member_auth (
	id INT PRIMARY KEY AUTO_INCREMENT,
    memberId VARCHAR(50) NOT NULL,
    auth VARCHAR(50) NOT NULL,
    FOREIGN KEY (memberId) REFERENCES tp_member(memberId)
);

DESC tp_member_auth;

DELETE FROM tp_member WHERE memberId = 'qwe';
DELETE FROM tp_member_auth WHERE memberId = 'qwe';

SELECT * FROM tp_member;
SELECT * FROM tp_member_auth;

  SELECT 
	m.memberId memberId,
	m.memberPw memberPw,
	m.memberName memberName,
    m.membernickName membernickName,
	m.memberBirth memberBirth,
	m.memberPhoneNum memberPhoneNum,
	m.memberMail memberMail,
	m.memberAddNum memberAddNum,
	m.memberAddCity memberAddCity,
    m.regDate regDate,
    m.enabled enabled,
	a.auth auth
  FROM 
    tp_member m LEFT JOIN tp_member_auth a ON m.memberId = a.memberId
  WHERE
    m.memberId = 'qwer';

-- https://docs.spring.io/spring-security/site/docs/current/reference/html5/#persistent-login-remember-me-schema
-- 로그인 유지 테이블 spring.io
create table persistent_logins (
    username varchar(64) not null,
    series varchar(64) primary key,
    token varchar(64) not null,
    last_used timestamp not null
);

SELECT memberId, memberPw, membernickName, memberPhoneNum, regDate from tp_member WHERE memberPhoneNum = '01088076027';
SELECT memberId, memberPw, membernickName, memberPhoneNum, regDate from tp_member WHERE memberPhoneNum = #{memberPhoneNum};



