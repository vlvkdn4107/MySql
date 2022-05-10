
create database nation;
use nation;
create table 국가(
	이름 varchar(60) not null primary key,
    영문이름 varchar(60),
    지역 varchar(60),
    인구 decimal(11),
    gdp decimal(14)
);

desc 국가;

insert into 국가 values(
'그리스', 'Greece', '유럽', 10601527, 149200000000);
insert into 국가 values(
'독일', 'Germany', '유럽', 82979408, 18640000000000);
insert into 국가 values(
'러시아', 'Russia', '유럽', 146001176, 6203000000000);
insert into 국가 values(
'스페인', 'Spain', '유럽', 39996671, 620300000);
insert into 국가 values(
'영국', 'United Kingdom', '유럽', 59511464, 129200000000);
insert into 국가 values(
'이탈리아', 'Italy', '유럽', 57634327, 1212000000000);
insert into 국가 values(
'프랑스', 'France', '유럽', 59329691, 137300000000);
insert into 국가 values(
'한국', 'Korea', '아시아', 52000000, 187300000000);
insert into 국가 values(
'카메룬', 'Cameroon', '중앙아프리카', 80000000, 7300000000);

-- 문제 1
select distinct 지역 
from 국가;

-- 문제 2
select *
from 국가
where 인구 >= 100000000;
-- 문제 3
select 이름, gdp/인구 as '1인당 GDP'
from 국가
where 인구 > 50000000;

-- 문제 4 유럽 지역에 위치하고 있는 국가의 이름과, 백만명당 인구를 검색하되, 
-- 결과값이 소스 1번째 자리에서 반올림하세요. 여기서 백만명은 숫자 0이 6개 1000000 입니다. 
-- 이해를 못하겠음
select 이름, format(인구/1000000, 1) 
from 국가
where 지역 = '유럽';

select 이름, round(인구/1000000,1) as "백만명당 인구"
from 국가
where 지역 = '유럽';

-- 문제 5한국, 러시아, 영국 국가에 이름과 인구를 검색하세요. 단 OR 키워드 사용하세요
select 이름, 인구
from 국가
where 이름 = '한국'
or 이름 = '러시아'
or 이름 ='영국';

-- 문제 6이탈리아, 프랑스, 영국 국가에 이름과 인구를 검색하세요. 단 in 키워드 사용하세요
select 이름 , 인구
from 국가
where 이름 in ('이탈리아', '프랑스', '영국');
             
-- 문제 7 United 라는 영문이 포함된 국각의 한글명과 영문이름 검색 하세요
select 이름, 영문이름
from 국가
where 영문이름 like 'United%';


-- 문제 8 테이블에 저장된 국가들의 인구 합계를 출력 하세요 (총인구) 
select sum(인구) as 국가들의총인구
from 국가;


-- 문제 9 테이블에 저장된 각 지역에 속한 국가수를 지역과 함께 검색하라. 
select *,count(지역) as '지역에 속한 국가수'
from 국가
group by 지역;


-- 문제 10 천만명 이상 인구를 가진 지역별 국가수를 검색하라.
--  여기서 팔천만명은 숫자 0이 7개인 80000000이다.
select 지역,sum(인구) as '지역의총인구', count(지역) as '지역의 국가수'
from 국가
where 인구 >= 10000000
group by 지역;


-- 문제 11 전체 인구가 1억 이상인 지역과, 이름을 검색하라.
select 지역, 이름 , sum(인구) as '지역의 총인구'
from 국가
group by 지역
having sum(인구) >= 100000000;

select 지역, 이름
from 국가
where 인구 >= 100000000;

-- 문제 12 인구가 영국 보다 많은 국가의 이름을 검색 하라 
select * from 국가;
select *
from 국가
where 59511464 < 인구;

select 이름
from 국가
where 인구 > (select 인구
			 from 국가
             where 이름 ='영국');

-- 문제 13 영국과 한국이 속한 지역에 국가의 모든 열을 검색 하라  ????????????
select *
from 국가
where 지역 = '아시아'
or 지역 = '유럽';

select *
from 국가
where 지역 = (select 지역
			 from 국가
             where 이름 = '영국')
or 지역 = (select 지역
			 from 국가
             where 이름 = '한국');

-- 문제 14 인구가 스페인보는 많고 독일보다 적은 국가의 이름을 검색 하라 
select *
from 국가
where 인구 > (select 인구
			 from 국가
             where 이름 ='스페인')
and 인구 < (select 인구
			 from 국가
             where 이름 ='독일');





