
use shopdb_1;
-- 테이블 생성alter
-- 연관 관계 생성
-- CRUD 연습
create table userTBL(
	userName char(3) not null,
    birthYear int not null,
    addr char(2) not null,
    mobile char(13) not null,
	
    primary key(userName)
);
create table buyTBL(
	userName char(3) not null,
    prodName char(5) not null,
    price int not null,
    amount int not null,
    foreign key(userName) references userTBL(userName)
);

select * from usertbl;
-- 추가
insert into usertbl values('임우성', '1997', '김해', '010-4107-1290');
insert into usertbl values('전우치', '1920', '창원', '010-2222-2222');
insert into usertbl values('정우재', '1997', '서울', '010-7777-7777');
insert into usertbl values('홍길동', '1925', '인천', '010-4444-5555');

-- 수정
update usertbl set mobile = '010-4107-1111' where userName = '임우성';
update usertbl set addr = '대구' where userName = '전우치';

-- 전체 조회
select * from usertbl;
-- 한건 조회
select userName from usertbl where addr = '대구';
select userName, mobile from usertbl where addr = '김해';

-- 삭제
delete from usertbl where userName = '홍길동';


insert into buytbl values('임우성', '의자', '20', '1');
insert into buytbl values('임우성', '행거', '5', '2');
insert into buytbl values('전우치', '부채', '3', '5');
insert into buytbl values('정우재', '컴퓨터', '50', '1');
insert into buytbl values('전우치', '피리', '10', '2');

-- 전체 조회
select * from buytbl;

-- 한건 조회
select prodName, price, amount
from buytbl
where userName = '임우성';

-- 한건 조회
select prodName, price, amount
from buytbl
where userName = '정우재';

-- 업데이트
update buytbl set amount = '10' where prodName = '부채';
update buytbl set amount = '7' where prodName = '피리';
-- 삭제
delete from buytbl where prodName = '행거';