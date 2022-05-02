-- C R U D

-- 데이터를 생성(밀어넣기) insert 구문
desc memberTbl;
insert into membertbl values("Dang", "탕탕이", "경기도 부천시");
insert into membertbl values('Han', '한주연', '부산시 해운대구');
insert into membertbl(memberAddress, memberName, memberId) values('서울시 상암동', '지운이', "jee");

insert into membertbl(memberId, memberName) values("kee2", "홍길삼");

-- 오류구문( 왜?  설계할때 memberId, memberName 필드명이 not null 했기때문에 memberName도 해야된다)
insert into membertbl(memberId) values("jee222");

-- 전체 테이블에 대한 데이터 조회
select * from membertbl;

-- 한건에 대한 데이터 조회를 어떻게 할까?? primary로 찾는게 빠르다
select * from membertbl where memberId = 'jee';

-- 한건에 대한 조회 + 조건절
select memberName 
from membertbl
where memberId = 'jee';


-- 한건에 대한 데이터 삭제하기
delete from membertbl where memberId = 'kee2';
delete from membertbl where memberId = 'jee222';

-- 전체에 대한 데이터 삭제하기 delete, truncate 두개 같음
delete from membertbl;
truncate membertbl; 

-- 한건에 대한 데이터 수정(업데이트)
update membertbl set memberName = '홍길동' where memberId = 'jee'; -- memberId jee에 memberName을 홍길동으로 바꾼다 조건문에 primary로 설정한 memberId로 찾는게 빠르다

-- 전체 데이터에 대한 값 수정
update membertbl set memberAddress = ''; -- membertbl에 있는 memberAddress에 값을 공백으로 바꾼다.
update membertbl set memberAddress = '김해시'; -- membertbl에 있는 memberAddress에 값을 김해시로 바꾼다

-- --------------------------------------------------
desc producttbl;

-- 데이터 문제1. producttbl; 데이터를 3건 입력해 주세요
insert into producttbl values('1', '에어컨', '80', 'LG', '3');
insert into producttbl values('1', "냉장고", '100', 'LG', '5'); -- productId를 primary key로 설정해놔서 중복할수없다.
insert into producttbl values('2', "티비", '60', '삼성', '2');
insert into producttbl values('3', '컴퓨터', '50', '삼성', '10');
insert into producttbl(productId, productName, cost) values('4', '세탁기', '60');
insert into producttbl(productId, productName, cost, company) values('5', '면도기', '30', "필립스");
insert into producttbl values('6', '키보드', '5', 'G1', '14');
insert into producttbl values('7', '냉장고', '100', 'LG', '5');
insert into producttbl values('8', '냉장고', '100', 'LG', '5'); -- primary key로 설정한 productId 제외하고 나머지는 중복이 되도 값이 들어간다.


-- 문제 2 검색 
select * from producttbl;
select amount
from producttbl
where productId = 1;
select productId, productName, amount from producttbl where productName = '컴퓨터';
select productName, productId, amount from producttbl where productName = '키보드';


-- 문제 3 수정
update producttbl set amount = '8' where productId = '1';
update producttbl set amount = '6' where productId = '3';
update producttbl set amount = '3' where productId = '5';
update producttbl set amount = '0'  where productId = '2';
update producttbl set company = '' where productId = '6';

-- 문제 4 삭제
delete from producttbl;
delete from producttbl where productId = '1';


-- 불필요한 컬럼 삭제 하는 방법
alter table producttbl drop makeDate;









