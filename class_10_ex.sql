
create database shop_db;

use shop_db;

create table shop_db.product(
	 id tinyint not null,
     p_name varchar(30) not null,
     created date,
     company varchar(30)
);

-- database에서 index 개념은  (어떤 데이터를 검색할때 하나하나 다 읽는걸 pull scan이라고 하고 PK , FK를 지정하면 찾기 편하다)
-- index  : create index(UNIQUE INDEX);

create index idx_product_name 
on product(p_name);

-- 가상 테이블 (뷰 테이블)
select * from product;
-- 데이터 생성
insert into product values(1, '세탁기', '2020-12-12', '삼성');
insert into product values(2, '냉장고', now(), '엘지');
insert into product values(3, '모니터', curdate(), '삼성');
insert into product values(4, '컴퓨터', curdate(), '삼성');

desc product;

 -- 컬럼 추가하기
 alter table product add input_time timestamp;
 
 -- 가상테이블이란? 계정을 새로 하나 만들어서 어떠한 권한을 지정할수 있다
 -- 테이블은 일단 보여줘야하기 때문에 계정 권한으로는 막을수 없다 
 -- 가상테이블 생성하기 (테이블을 참조해서 보여주는거다)
 create view product_view   -- 뷰 이름
 as select p_name, created, company -- 뷰에 어떤거만 보여줄꺼냐
 from product; -- 어디에서 들고올거냐

select * from product_view;
select * from product;

-- 데이터 삭제(복습) 
delete from product_view where p_name = '컴퓨터'; -- 뷰에 삭제를 하면 원래 테이블에서도 사라진다.(계정을 줄때 삭제 권한을 안주면 방지 할수있다)

-- drop database shop_db;

show databases;
show tables;


-- index 조회 하는 방법
show index from product;

-- index 수정 하는 방법 -- @@@추가 확인 해야함!
alter table product; 

-- drop index
alter table product
drop index idx_product_name;

-- 테이블 복사
select * from product;

create table product_2 select * from product;
select * from product_2;

-- 집계 함수 !!

use shopdb;

select * from buytbl;
-- GROUP BY 그룹화 하는 키워드
select userName
from buytbl
group by userName;

select *
from buytbl
group by price;

select *
from buytbl
group by amount;

-- 이름으로 묶고 amount 3보다 큰 사람들을 출력하라a
select *
from buytbl
where amount >= 3   
group by userName;   -- 흐름상 조건문을 먼저 쓴다음 그룹화 하는 키워드를 써야한다.

-- 집계함수
select * from buytbl;

create view buytnl_view
as select userName, prodName, amount
from buytbl;
select * from buytnl_view;

drop view buytnl_view; -- 뷰 삭제

select count(*) as 판매횟수
from buytbl; -- amount가 총 6줄이있어서 6이나온다

select userName, sum(price) as '구매 금액'
from buytbl;

-- 집계 함수와 group by
select userName, sum(price) as '구매 금액'
from buytbl
group by userName;



