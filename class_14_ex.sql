-- db생성
create database reservationdb;
use reservationdb;
-- 테이블 생성(예약)
create table reservation(
	id int auto_increment,
    name varchar(20) not null,
    reserveDate date not null,
    roomNum varchar(5) not null,
    primary key(id)
);

-- 고객 정보를 관리하는 테이블
create table customer(
	id int auto_increment,
    name varchar(20) not null,
    age int not null,
    address varchar(10),
    primary key(id)
);

insert into reservation values(1, '홍길동', '2020-05-01 00:00:00', 1);
insert into reservation values(2, '임꺽정', '2020-05-02 00:00:00', 2);
insert into reservation values(3, '장길산', '2020-05-03 00:00:00', 3);
insert into reservation values(4, '홍길동', '2020-05-04 00:00:00', 4);
select * from reservation;
-- 데이터 수정
-- 1번 id에 roomNum을 1001로 번경
update reservation set roomNum = 1001 where id = 1;
update reservation set roomNum = 1002 where id = 2;
update reservation set roomNum = 1003 where id = 3;
update reservation set roomNum = 1004 where id = 4;

select * from reservation;
-- 고객 테이블 데이터 생성
insert into customer values(1, '홍길동', 20, '서울');
insert into customer values(2, '임꺽정', 30, '서울');
insert into customer values(3, '장길산', 24, '서울');
insert into customer values(4, '전우치', 33, '서울');

update customer set address = '인천' where id = 2;
update customer set address = '수원' where id = 4;

select * from customer where address in ('서울'); -- in 은 address 안에 서울인 데이터를 들고와라

-- 서브쿼리
-- 예약테이블에 있는 데이터들 중에 주소지가 서울인 고객들에 예약정보 를 확인하는 쿼리.

-- 서브쿼리(Nested Subquery)where 절에서 사용하는 서브 쿼리 사용해보기
select id, reservedate, roomNum, name
from reservation
where name in(
              select name 
              from customer 
              where address = '서울');

select * from reservation;
-- join문으로 변경해서 같은 결과를 출력
select r.id, r.reservedate, r.roomnum, r.name, c.address
from reservation as r
left join customer as c
on r.name = c.name
where c.address = '서울';

-- 2. 인라인 뷰(inline view) : from절에 사용하는 서브쿼리이다.
-- from 절에 사용하는 서브 쿼리
-- 서브쿼리가 먼저 실행이되고 roomnum이 1001번보다 이상인 roomnum만 출력
select name, reservedRoom
from (select name, reservedate, (roomnum) as reservedRoom
	  from reservation
      where roomnum > 1001) as reservationInfo; 
/*	
	쿼리 실행 순서
	1. reservation 테이블에서 roomNum > 1001 보다 큰 레코드를 먼저 찾은 후 (roomNum 필드값을 1씩 증가해서 찾는다)
	찾은후 해당 쿼리에 결과 집합 reservationInfo 이라는 이름으로 임시 테이블로 먼저 만들어준다.(내부 쿼리,서부 쿼리)
    외부 쿼리에서는 이렇게 만들어진 임시 테이블에서 name, reservedRoom 필드만을 선택해서 결과 집합을 보여주게 된다.
*/

-- 서브 쿼리를 사용해서 문제만들기
select * from reservation;
select * from customer;

-- where절에 사용하는 서브 쿼리를 사용해서 나이가 21살 이상의 예약한 고객들만 출력
select id, name, reserveDate, roomNum
from reservation
where name in(select name
	   from customer
       where age > 20);

-- 2020-05-02 일자로 예약한 고객의 id와 이름 조회
select id, name
from customer
where name in(select name
			  from reservation
              where reserveDate = '2020-05-02');
			
-- 고객 테이블에서 실제 예약한 고객중 30살 이상고객 조회
select c.id, c.name, c.age, c.address, r.reserveDate, r.roomNum
from customer as c
inner join reservation as r
on c.name = r.name
where c.age >= 30;

-- 05-02 이후 예약한 예약자 조회
select *
from(select *
	 from reservation
     where reserveDate > '2020-05-02 00:00:00') as reservationInfo;

-- 나이가 30대인 사람들의 정보 출력
select name as 이름,나이
from(select name, age as 나이
     from customer as c
     where c.age >= 30 and c.age <40) as a;
     
-- 지역이 인천과 서울인 예약고객
select *
from reservation
where name in(select name
			  from customer
              where address = '서울'or'인천');