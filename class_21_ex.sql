 select * from 영화정보;
 select * from 배우정보;
 select * from 출연;
 select * from 영화금액;
 
select a.배우, b.역할, c.이름, c.개봉년도, b.역할명, c.평점
from 배우정보 as a
inner join 출연 as b
inner join 영화정보 as c
on a.배우번호 = b.배우번호





 -- 영화표금액 보여주는 기능
 select a.이름, b.영화표금액
 from 영화정보 as a
 inner join 영화금액 as b
 on a.영화번호 = b.영화번호
 where a.이름 = '국제시장';

