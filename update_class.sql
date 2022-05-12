
 -- 영화쪽
  select * from 영화정보;
 -- 영화 평점 수정
 update 영화정보 set 평점 = (7.77) where 영화번호 = 2;
 -- 영화이름 수정
 update 영화정보 set 이름 = '명량2' where 영화번호 = 1;
 -- 영화 개봉년도 수정
 update 영화정보 set 개봉년도 = 2020 where 영화번호 = 2;
 -- 영화 매출액 수정
 update 영화정보 set 매출액 = 111111111 where 영화번호 = 3;
 -- 영화 관객수 수정
 update 영화정보 set 관객수 = 1 where 영화번호 = 5;
 
 

 -- 영화금액
   select * from 영화금액;
   update 영화금액 set 영화표금액 = 10000 where 영화번호 = 1;
   
-- 배우쪽
 select * from 배우정보;
 desc 배우정보;
 -- 배우 이름 수정
 update 배우정보 set 배우 = '최만식' where 배우번호 = 1;
 -- 배우 출생 수정
 update 배우정보 set 출연자출생 = 1995 where 배우번호 = 5;
 -- 배우 키 수정
 update 배우정보 set 키 = 180 where 배우번호 = 1;
 -- 배우 몸무게 수정
 update 배우정보 set 몸무게 = 80 where 배우번호 = 1;
 -- 배우 배우자 수정
 update 배우정보 set 배우자 = '있음' where 배우번호 = 1;
 
 -- 출연쪽
  select * from 출연;
update 출연 set 배우번호 = 1 where 역할명 = '고반장';
update 출연 set 역할명 = '고순경' where 역할명 = '고반장';
update 출연 set 역할 = '1인2역주연' where 역할명 = '고순경';