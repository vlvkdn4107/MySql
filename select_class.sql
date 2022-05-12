 select * from 영화정보;
 select * from 배우정보;
 select * from 출연;
 select * from 영화금액;
 
 use movie;



use movie;



-- 배우이름으로 어떤배우가 어떤 영화를 찍었는지 그 영화에 역할,역할명이 무엇인지 출력
select c.배우, b.이름, a.역할, a.역할명
from 출연 as a
inner join 영화정보 as b
on a.영화번호 = b.영화번호
inner join 배우정보 as c
on a.배우번호 = c.배우번호
where c.배우 = '이하늬';
-- or c.배우 = '최민식';

 -- 영화표금액 보여주는 기능
 select a.이름, b.영화표금액
 from 영화정보 as a
 inner join 영화금액 as b
 on a.영화번호 = b.영화번호
 where a.이름 = '국제시장';

-- 배우에대한 정보 리스트
select 배우, 출연자출생, 키, 몸무게, 배우자 
from 배우정보
where 배우 = '이하늬';

-- 영화에대한 정보 리스트, 주연이 누구인지
select * from 영화정보;
select * from 배우정보;
select * from 출연;

select b.이름, b.개봉년도, concat_ws(':', a.역할, c.배우) as '주연배우', b.평점
from 출연 as a
inner join 영화정보 as b
on a.영화번호 = b.영화번호
inner join 배우정보 as c
on a.배우번호 = c.배우번호
where b.이름 = '극한직업'
and a.역할 = '주연';