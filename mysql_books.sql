use sejindb;

create table books_info (
	isbn varchar(30) primary key, -- 책의 isbn 번호
	title varchar(100) not null, -- 책 제목
	author varchar(40), -- 책 저자
	publisher varchar(50), -- 출판사
	price int(6), -- 책 가격
	category varchar(50), -- 책 종류
	description varchar(2000) -- 책 설명
);

select * from books_info;

insert into books_info values ('2023001', '자바를 잘하는 기술들', '현대빈', '현대', 50000, '기술', '자바기술 소개');
insert into books_info values ('2023002', 'JSP를 잘하는 기술들', '이병진', '삼성', 30000, '기술', 'JSP기술 소개');
insert into books_info values ('2023003', 'Servlet을 잘하는 기술들', '김영진', '쌍용', 70000, '기술', 'Servlet기술 소개');
insert into books_info values ('2023004', '시안 디자인 개발 응대', '이승아', '니눔', 35000, '프로그래밍', 'Front-End Developer');
insert into books_info values ('2023005', '스프링부트 핵심 가이드', '장정우', '위키북스', 60000, '백엔드', '백엔드를 개발자를 위한 도서');

drop table books_info;

create table membership(
    id varchar(15) primary key,
    password varchar(10),
    name varchar(15),
    age int,
    gender varchar(6),
    email varchar(30)
);

select * from membership;

insert into membership values ('huhu', '1234', '하후후', '13', '남성', 'huhu@gmail.com');
insert into membership values ('rubi', '1234', '이루비', '21', '여성', 'rubi@gmail.com');
insert into membership values ('yumi', '1111', '김유미', '24', '여성', 'yumi@gmail.com');
insert into membership values ('master', '0000', '관리자', '30', '남성', 'master@gmail.com');


create table board(
	num	int primary key AUTO_INCREMENT,
	title varchar(200) not null, -- 제목
	content varchar(2000) not null, -- 내용
    writer varchar(15) not null, -- 작성자
    password varchar(10), -- 비밀번호
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,-- 작성일 
  	modified_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,-- 수정일
    visitcount int -- 조회수
    -- 왜 기본키를 설정하면 오류가 나는가에 대해 질문..
);

select * from board;
desc board;
drop table board;

INSERT INTO board (title, content, writer, password, visitcount)
VALUES ('도서 요청합니다.', '스프링 부트 관련 도서 더 들어왔으면 좋겠어요~', 'rubi', '1234', 0);

INSERT INTO board (title, content, writer, password, visitcount)
VALUES ('커뮤니티 기능 굿', '안녕하세요', 'yumi', '1111', 0);

INSERT INTO board (title, content, writer, password, visitcount)
VALUES ('정보 공유해요!', '좋은 도서 있으면 공유해주세요~', 'huhu', '1234', 0);

INSERT INTO board (title, content, writer, password, visitcount)
VALUES ('도서 요청합니다.', '스프링 부트 관련 도서 더 들어왔으면 좋겠어요~', 'babi', '1234', 0);

insert into board(title, content, writer)
  select title, content, writer from board;

SELECT count(*) FROM board;

commit

