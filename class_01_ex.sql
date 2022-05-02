
-- 문제 1번 shopdb_1 데이터 베이스를 생성
create database shopdb_1;
-- 문제 2번 membertbl 테이블 생성
create table memberTBL_1(
	memberId int not null,
    memberPassword int
);
-- 문제 3번 productTbl 테이블 생성
create table productTbl(
	productId int not null,
    productName char(8) not null,
    productPrice int not null
);

-- 문제 4번 (간단한 테이블 생성 필드 2개 이상)
create table game(
	gameName char(10) not null,
    makeDate date
);
-- 문제 5번 (간단한 테이블 생성 필드 3개 이상 primary key 지정)
create table student(
	studentName char(4) not null,
    studentAge int not null,
    Address char(20),
    primary key(studentName)
);
select * from student;

desc student;


