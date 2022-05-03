

select *
from membertbl;

insert into membertbl values('jsa', '김주한', '부산시 진구');


-- and
-- 이름 홍길동 , 주소가 부산시 진구
select *
from membertbl
where membername = '홍길동'
and memberAddress = '부산시 진구';

-- or
-- 주소가 부산시 진구 OR 경기도 부천시  공백까지 정확하게 입력 해야된다 아니면 안뜬다
select * 
from membertbl
where memberAddress = '부산시 진구'
or memberAddress = '경기도 부천시';

-- 주소가 부산시 진수 or 경기도 부천시) / and 이름이 김주한 이라는 사람 검색
select *
from membertbl
where (memberAddress = '부산시 진구' or memberAddress = '경기도 부천시') and memberName = '김주한';


-- 샘플 테이블 생성
create table membercart(
	id int not null auto_increment,
    name varchar(30) not null,
    amount int not null,
    primary key(id)
);

desc membercart;
select * from membercart;

-- 테이블에 컬럽 추가 
alter table membercart add productName varchar(30) not null;

-- 테이블안에 컬럼 명을 수정해 보자
alter table membercart rename column name to name2;

-- 테이블안에 컬럼 명을 삭제해 보자
alter table membercart drop column name2;

-- 테이블 이름 변경하기
rename table membercart to mycart;
select * from mycart;
alter table mycart rename shopCart; -- 이걸로 외우자
select * from shopcart;

-- 데이터 입력
insert into shopcart values(1, 1, '청바지');
-- 기본 전략을 auto_increment 로 설정해둬서 insert부분에 추가를 안해줘도 알아서 1씩 증가해서 값을 넣어준다.
insert into shopcart(amount, productname) values(2, '운동화');
insert into shopcart(amount, productname) values(12, '잠바');
insert into shopcart(amount, productname) values(3, '핸드폰');
insert into shopcart(amount, productname) values(5, '지갑');

-- bettween
select *
from shopcart
where amount between 2 and 5; -- 테이블에있는 amount에 값이 2~5사이에있는것만 출력해줘 

select * from producttbl;




select b.userName, b.prodName, b.price, b.amount, timestamp('2022-05-1', '12:13:21') as 주문날짜,
       u.addr, u.mobile,(select date_add(주문날짜, interval 5 day)) as 도착날짜
from buytbl as b
left join usertbl as u
on b.userName = u.userName
where b.userName = '이승기';




insert into membertbl values('Lim', '임우성', '부산시 서면');



