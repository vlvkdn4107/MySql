
-- MySQL 계정 생성 및 권한 관리

-- 사용자 계정 확인
show databases;
use mysql;

-- 사용자 확인해보기 -- localhost만있으면 다른 컴퓨터에서는 이 아이디를 사용못한다.
select host,user from user;

-- 1. 사용자 추가 및 관한 셋팅 (첫번째 방법)
create user tester1@localhost identified by 'asd123';
-- 권한 주기
grant select, insert, update, delete on shop_db.* To 'tester1'@'localhost'; -- to(어떤 유저에게) grant(이러한 권한들을 주겠다.on(shop_db.*(shop_db에 전부)

-- MYSQL 8 에서 생성 방법( 계정 생성 후 모든 권한을 할당해서 사용하면된다!!!!!!!!!!!!!!!!!!!!!!!)

-- 2.모든 DB에 권한 할당 해보기, localhost만 접근 허용(2번째 방법)
create user tester2@localhost identified by 'asd123';
grant all privileges on *.* to 'tester2'@'localhost' with grant option; -- on (database명).(테이블명)
flush privileges; -- 권한을 강제로 집어 넣는다.

-- 3. 외부 접속 허용하는 계정 만들기
create user tester3@'%' identified by 'asd123';
grant all privileges on *.* to 'tester3'@'%' with grant option;


select host,user from user;
-- 생성된 유저 삭제 해보기
drop user 'tester3'@'%';
drop user tester2@'localhost';


-- DB에 만들어진 모든 테이블 확인
use shopdb;
show full tables; -- show tables 동일

-- 뷰 생성
create view usertbl_view
as select userName, birthYear, addr
from usertbl;

select * from usertbl_view;

use mysql;
select * from user;

create user tendcoding@'%' identified by 'asd123';
grant select on shopdb.usertbl_view to tendcoding@'%';

use mysql;
select host,user from user;
use shopdb;
select * from buytbl_view;
-- buytbl에 userName,prodName, price 만 볼수있는  뷰 만들기
-- 계정을 새로 만들어서 buytbl_view에 생성 수정 보기 권한주기
create view buytbl_view
as select *
from buytbl;

create user buytbl_view_id@'%' identified by 'asd123';
grant insert, update, select on shopdb.buytbl_view to buytbl_view_id@'%' with grant option;

use shopdb;
select *
from product
where created >= '2020-12-12'
group by company;

select prodName as 제품명, count(prodName)as 판매량
from buytbl
group by prodName;
create user 'korea_it'@'%' identified by 'asd123';
grant select on shopdb.producttbl to 'korea_it'@'%';

 create view usertbl_view3
 as select userName, birthYear
 from usertbl
 where birthYear >=2000;
 select * from usertbl_view3;
 
 create view vip_view
 as select a.userName, b.prodName, b.price, b.amount
 from usertbl as a
 inner join buytbl as b
 on a.userName = b.userName
 where price >=50
 group by a.username;

select * from vip_view;
use mysql;
select host,user from user;
create user employee1@'%' identified by 'asd123';
 grant select on shopdb.vip_view to employee1;

use shopdb;
select userName, sum(price * amount) as 총지불금액
from buytbl
group by userName;
create view producttbl_view
as select productId, productName, cost, company
from producttbl;

select * from producttbl_view;

create user tester2@'%' identified by 'asd123';
grant select, insert, update on shopdb.producttbl_view
to tester2@'%';

use mysql;
select host,user from user;
use shopdb;

select userName, sum(amount) as '구매 수량'
from buytbl
group by userName;

-- !!!!@@@
create user test@localhost identified by 'asd123';
grant select, inactive, update, delete on shopdb.* to test@localhost;

create table usertbl_view2 select * from usertbl;

