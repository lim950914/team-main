CREATE DATABASE untact;

USE untact;

DROP TABLE member;

CREATE TABLE member(
  memberId VARCHAR(50) PRIMARY KEY, -- 아이디
  memberPw VARCHAR(100) NOT NULL, -- 비밀번호
  memberName VARCHAR(30) NOT NULL, -- 이름
  memberBirth INT NOT NULL, -- 생일
  memberPhoneNum INT NOT NULL, -- 폰번호
  memberMail VARCHAR(100) NOT NULL, -- 이메일
  memberAddNum VARCHAR(100) NOT NULL, -- 우편번호
  memberAddCity VARCHAR(100) NOT NULL, -- 주소
  memberAddHome VARCHAR(100) NOT NULL, -- 상세주소
  regDate TIMESTAMP DEFAULT NOW(), -- 가입날짜
  money int NOT NULL -- 돈
);

DESC member;

SELECT * FROM member;

INSERT INTO member
(memberId, memberPw, memberName, memberBirth, memberPhoneNum, memberMail, memberAddNum, memberAddCity, memberAddHome, money)
VALUES ('qwe', '1234', '찬영', '950914', '01088076027', 'dlackswn2222@naver.com', '12345', '경기도 하남', '덕풍동', '1000');

DELETE FROM member WHERE memberId = 'qw';


