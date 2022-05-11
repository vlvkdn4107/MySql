-- 조별로 문제 진행 -> 테이블 설계

-- 데이터
-- 영화이름 , 개봉연도, 매출액, 관객수, 평점, 
-- 영화이름 , 출연자 이름, 출연자 출생,출연자 정보(키,몸무게),출연자 배우자,역활(주인공, 보조), 역활에 이름

-- 데이터베이스에 저장 관리를 해야한다.

create database movie;

use movie;

select * from 영화정보 order by 영화번호;
select * from 배우정보 order by 배우번호;

-- drop table 영화정보;
-- drop table 출연;
-- drop table 배우정보;
drop table 영화금액;

create table 영화정보(
	영화번호 int not null primary key,
    이름 varchar(20),
    개봉년도 int,
    매출액 int,
    관객수 int,
    평점 decimal(4,2)
);
-- 필드 수정, 컬럼 수정

alter table 영화정보 modify 평점 decimal(4,2);
alter table 영화정보 modify 영화번호 int(3);

create table 배우정보(
	배우번호 int not null primary key,
	배우 varchar(20),
    출연자출생 int,
    키 int,
    몸무게 int,
    배우자 varchar(10)
);

create table 출연(
	영화번호 int not null,
    배우번호 int not null,
    역할 varchar(30),
    역할명 varchar(30),
    foreign key (영화번호) references 영화정보(영화번호),
    foreign key (배우번호) references 배우정보(배우번호)
);

 alter table 출연 modify 영화번호 int(3);
 
 create table 영화금액(
	영화번호 int not null,
    투자금 int,
    영화표금액 int,
    foreign key (영화번호) references 영화정보(영화번호)
 );
 
 alter table 영화금액 modify 영화번호 int(3);

 select * from 영화정보;
 select * from 배우정보;
 select * from 출연;
 select * from 영화금액;
 

 
 desc 영화정보;
 desc 출연;
 desc 배우정보;
 desc 영화금액;
 

INSERT INTO 영화정보 VALUES (1, '명량', 2014, 8398910, 17613682, 9.79);
INSERT INTO 영화정보 VALUES (2, '극한직업', 2019, 7979516, 16264944, 6.79);
INSERT INTO 영화정보 VALUES (3, '신과 함께 - 죄와 벌', 2017, 14410754, 12319542, 7.9);
INSERT INTO 영화정보 VALUES (4, '국제시장', 2014, 13469630, 14257115, 7.60);
INSERT INTO 영화정보 VALUES (5, '어벤져스:엔드게임', 2019, 2694160, 13934592, 9.29);


insert into 배우정보 values (1, '최민식', 1962, 177, 77, '김활란');
insert into 배우정보 values (2, '류승룡', 1970, 175, 72, '유');
insert into 배우정보 values (3, '조진웅', 1976, 187, 128, '김민아');
insert into 배우정보 values (4, '이하늬', 1983, 173, 60, '유');
insert into 배우정보 values (5, '공명', 1990, 183, 70, null);
insert into 배우정보 values (6, '이동휘', 1985, 179, 72, null);
insert into 배우정보 values (7, '하정우', 1978, 184, 75, null);
insert into 배우정보 values (8, '주지훈', 1982, 188, 79, null);
insert into 배우정보 values (9, '이정재', 1972, 180, 72, null);
insert into 배우정보 values (10, '황정민', 1970, 180, 75, '김미혜');
insert into 배우정보 values (11, '김윤진', 1973, 168, 48, '박정혁');
insert into 배우정보 values (12, '오달수', 1968, 176, 68, null);
insert into 배우정보 values (13, '로버트 다우니 주니어', 1965, 173, 68, '수전 러빈');
insert into 배우정보 values (14, '크리스 에반스', 1981, 183, 79, null);
insert into 배우정보 values (15, '스칼렛 요한슨', 1984, 160, 57, '콜린 조스트');

insert into 출연 values(1,1,'주연', '이순신');
insert into 출연 values(1,2,'조연', '구루지마');
insert into 출연 values(1,3,'조연','와키자카');
insert into 출연 values(2,2,'주연', '고반장');
insert into 출연 values(2,4,'조연', '장형사');
insert into 출연 values(2,5,'조연', '재훈');
insert into 출연 values(2,6,'조연', '영 호');
insert into 출연 values(3,7,'주연', '강림도령');
insert into 출연 values(3,8,'주연', '해원맥');
insert into 출연 values(3,9,'주연', '염라대왕');
insert into 출연 values(4,10,'주연', '윤덕수');
insert into 출연 values(4,11,'주연', '오영자');
insert into 출연 values(4,12,'조연', '천달구');
insert into 출연 values(5,13,'주연', '아이언맨');
insert into 출연 values(5,14,'주연', '캡틴 아메리카');
insert into 출연 values(5,15,'조연', '블랙 위도우');

insert into 영화금액 values (1, 1081320, 12000);
insert into 영화금액 values (2, 289210, 15000);
insert into 영화금액 values (3, 30841000, 10000);
insert into 영화금액 values (4, 845100, 10000);
insert into 영화금액 values (5, 7812100, 11000);
