

use shopdb;

select * from usertbl;
select * from buytbl;

-- inner join
select *
from usertbl
inner join buytbl
on usertbl.userName = buytbl.userName;

-- inner join2
select a.userName, a.addr, a.mobile, b.prodName, b.price, b.amount 
from usertbl as a   -- as a(별칭)
inner join buytbl as b -- as b(별칭)
on a.userName = b.userName;

-- 전부다 들고오기
select *
from usertbl as a
inner join buytbl as b
on a.userName = b.userName;

-- 원하는 것만 들고오기 a테이블과 b테이블에 교집합되는 데이터만 들고온다. a테이블에만 있는 야스오는 안나온다.
select a.userName, a.addr, a.mobile, b.prodName, b.price, b.amount
from usertbl  as a
inner join buytbl as b
on a.userName = b.userName;

-- usertbl 고객등록
select * from usertbl; 
insert into usertbl values('야스오', '2000', '여수', '010-8888-8888');

-- left join 1 왼쪽기준으로 잡았기 때문에 야스오의 정보는 나오지만 구매테이블에는 내역이 없기때문에 null값이 나온다.
select *
from usertbl as u
left join buytbl as b
on  u.userName = b.userName;

-- left join 2
select *
from usertbl as u
left join buytbl as b
on u.userName = b.userName
where b.userName is not null; -- 값이 null이 아닌 것만 출력한다.

select *
from usertbl as u
left join buytbl as b
on u.userName = b.userName
where b.userName = '이승기';

-- 테이블 생성할때 외례키에 제약을 생성했기 때문에 안된다.
insert into buytbl values('티모', '컴퓨터', '100', '1');

-- 하지만 구매테이블을 생성할 때 외례키(FK)를 제약하지 않았다면 insert는 가능하다.

-- left join 3
select *
from buytbl as b -- buytbl 기준으로 하면 usertbl에 있는 야스오는 안나온다.(조건문없이가능하다)
left join usertbl u
on b.userName = u.userName;

-- left join
select *
from buytbl as b
left join usertbl u
on b.userName = u.userName
where u.userName is not null;

-- right join  right join인 buytbl 기준으로 usertbl 정보를 들고온다.
select u.userName, b.prodName, b.price, b.amount
from usertbl as u
right join buytbl as b
on u.userName = b.userName;

-- 곱 집합  CROSS JOIN 1??
select *
from usertbl as u
cross join buytbl as b
on u.userName = b.userName;

-- cross join 2 -- null 값이 있는 녀석만 들고온다.
select *
from usertbl
cross join buytbl
on usertbl.userName = buytbl.userName
where usertbl.userName is null
or buytbl.userName is null;

-- 실무에서는 거의 inner join 위주로 쓴다.

