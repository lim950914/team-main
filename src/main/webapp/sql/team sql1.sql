CREATE DATABASE untact;

USE untact;

DROP TABLE tp_member;

CREATE TABLE tp_member(
  memberId  VARCHAR(50) PRIMARY KEY, -- 아이디
  memberPw VARCHAR(100) NOT NULL, -- 비밀번호
  memberName VARCHAR(30) NOT NULL, -- 이름
  memberBirth DATE NOT NULL, -- 생일
  memberPhoneNum VARCHAR(30) NOT NULL, -- 폰번호
  memberMail VARCHAR(100) NOT NULL, -- 이메일
  memberAddNum VARCHAR(100) NOT NULL, -- 우편번호
  memberAddCity VARCHAR(100) NOT NULL, -- 주소
  regDate TIMESTAMP DEFAULT NOW(), -- 가입날짜
  money int, -- 돈
  enabled TINYINT(1) DEFAULT 1
);

DESC tp_member;

SELECT * FROM tp_member;

INSERT INTO tp_member
(memberId, memberPw, memberName, memberBirth, memberPhoneNum, memberMail, memberAddNum, memberAddCity, money)
VALUES ('qwe', '1234', '찬영', '950914', '01088076027', 'dlackswn2222@naver.com', '12345', '경기도 하남', '1000');

DROP TABLE tp_member_auth;

CREATE TABLE tp_member_auth (
	id INT PRIMARY KEY AUTO_INCREMENT,
    memberId VARCHAR(50) NOT NULL,
    auth VARCHAR(50) NOT NULL,
    FOREIGN KEY (memberId) REFERENCES tp_member(memberId)
);

DESC tp_member_auth;

DELETE FROM tp_member WHERE memberId = '';

SELECT * FROM tp_member;
SELECT * FROM tp_member_auth;

  SELECT 
	m.memberId memberId,
	m.memberpw memberpw,
	m.memberName memberName,
	m.memberBirth memberBirth,
	m.memberPhoneNum memberPhoneNum,
	m.memberMail memberMail,
	m.memberAddNum memberAddNum,
	m.memberAddCity memberAddCity,
    m.enabled enabled,
	m.money money,
	a.auth auth
  FROM 
    tp_member m LEFT JOIN tp_member_auth a ON m.memberId = a.memberId
  WHERE
    m.memberId = 'qwe';








