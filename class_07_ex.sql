
-- MySQL Numberic Function

select ABS(-252.2);

select * from buytbl;

-- 평균값 sum() 내장되어있는 함수
select *, sum(price) as 합계 -- price를 합하고 나머지 부분은 그냥 맨앞에 있는 녀석들을 들고온다
from buytbl;

select sum(price) as 합계 -- price만 모두 합한다.(일수입??)
from buytbl;

-- 서브 쿼리(3가지)
select *,(select sum(price) from buytbl) as 총합계 -- 쿼리문 안에 쿼리문을 작성할수있다
from buytbl;

-- 평균 값
select *, avg(price) as 평균값
from buytbl;

-- 서브 쿼리 @@서브쿼리는 출력하는데 늦을수가있다. ?? 한열을 읽고 price 평균값을 계산해서 쏘고 또 다음 열로가서 읽고 평균값을 계산하기 때문에
select *,(select avg(price)from buytbl) as 평균값
from buytbl;

-- 올림 처리
select ceil(25.12);

-- 반올림
select round(135.512);
select round(135.512, 1); -- 소수몇번째까지 올려라

-- 버림 처리
select floor(25.79); -- 소수점 다 버리기

select ceil(round(10 - 5) + 5); -- 이렇게 식을 만들수있다.


select price
from buytbl;
-- max값
select max(price)
from buytbl;

select min(price)
from buytbl;

-- usertbl , buytbl 문제1

-- usertbl 기준으로 서브 쿼리를 이용해서 price의 합계,max값 구하기
select * ,(select sum(price)from buytbl)as price합계,(select max(price)from buytbl)as pricemax값 
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

select * from buytbl;

-- --------------------------------------------------

select u.userName, u.addr, u.mobile, b.prodName, 

(select sum(sb.price) 
from buytbl as sb
where sb.userName = '이승기') as 이승기의_총가격

from usertbl as u
right join buytbl as b
on u.userName = b.userName;
-- --------------------------------------


select avg(price)
from buytbl
where userName = '이승기';

select round(avg(price))as 가격평균
from buytbl;

select max(price) as 최고금액, min(price) as 최저금액, round(avg(price))as 평균금액
from buytbl;

select *,(select sum(price)from buytbl)as 합계,(select max(price) from buytbl)as max값
from usertbl;

select userName, sum(price) as 총구매금액
from buytbl as b
where userName = '홍길동';

select *,(price * amount) as 판매실적,(select sum(price)from buytbl) as 총합계
from buytbl;

select max(birthYear) as max연도, min(birthYear) as min연도
from usertbl;


select b.*,(select avg( (price * amount) / amount)from buytbl where prodName = b.prodName )as 1개당평균가 
from buytbl as b;

select u.userName as 고객명,b.price as 가격, b.amount as 판매수량, (price * amount) as 판매실적
       ,(select sum(판매실적)from buytbl) as 총합계, (select avg(판매실적)from buytbl) as 평균구매가
from usertbl as u
inner join buytbl as b
on u.userName = b.userName
where prodName = b.prodName;


select sum(amount * price) as '총 매출', round(avg(amount * price),1)as '전체 평균'
from buytbl as b
