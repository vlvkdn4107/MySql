
-- MYSQL Date Funtion


-- 현재 날짜를 출력하는 함수 (년 월 일)
select curdate(); -- (년-월-일)
select current_date(); -- 똑같이 (년-월-일)

-- 현재 시간을 출력하는 함수 (시간:분:초)
select curtime();
select current_time();

-- 일자를 반환하는 함수 (15)
select day("2017-06-15");
-- 오늘 날짜의 일자는 (3)
select day(curdate());


select week("2017-06-15");
select week(curdate()); -- 이번년도 5월3일까지의 주가 몇번있었는지

-- 1주일안에 월0 화1 수2 목3 금4 토5 일 6
select weekday("2017-06-15");
select weekday(curdate());

-- 날짜 시간 다 불러오는 함수
select now();
select sysdate();

-- 이 문자열을 timestamp로 반환 하는 함수
-- 인수에 따라서 datetime값을 반환 한다.
select timestamp("2019-06-15", "13:10:11");

-- 2개의 문자열을 비교해서 차이나는 시간을 출력
select timediff("13:10:11", "13:10:10");

-- 이 날짜와 시간이랑 , 이 날짜와 시간의 시간 차이를 출력
select timediff("2022-05-03 13:10:11", "2022-01-03 13:10:10");--
select timediff(now(),"2021-01-03 13:10:10"); --
-- @@@@@@@ 확인 하세요 @@@@@@@


-- 날짜 빼기  오늘 날짜에서 -10 일  = 2022-4-23
select subdate(now(), interval 10 day);

-- 날짜 더하기 오늘 날짜에서 +10일 = 2022-05-13
select date_add(sysdate(), interval 10 day);
select date_add("2021-12-03", interval 10 day);
-- 현재 시스템 유저 확인하기
select system_user();
select session_user();
-- 현재 접속한 유저가 누구인지 확인
select current_user();
-- 내 버전 확인화기
select version();

-- "Hellow"(보여줄 문자열), (여기에 null이면)
select nullif("Hello", null);
select nullif('x', null);

-- -------------------------------------------------

-- timestamp로 주문날짜 정하고 date_add로 5일 추가해서 도착날짜 정하기
select b.userName, b.prodName, b.price, b.amount,timestamp("2022-05-01" , "13:21:16") as 주문날짜, u.addr, u.mobile,
         (select date_add(주문날짜 , interval 5 day))as 도착날짜
from buytbl as b
left join usertbl as u
on b.userName = u.userName
where b.userName = '이순신'; -- userName마다 따로따로 할려면?

-- -------------------------------------------------

select week(curdate()) - week('2022-03-21') + 1 as 부트캠프주;

select timediff(curtime(), "09:00:00");

select weekday('2022-08-08');
select timediff('18:00:00', curtime());

select timediff(curdate(), '2022-05-05');

select curdate() as 오늘날짜, timediff(now(), '2022-05-05 00:00:00')as 남은시간;

select now() as 지금시간, timestamp('2022-05-05')as 어린이날, timediff(now(),'2022-05-05 00:00:00')as 남은시간;

select concat('어린이날 D-' ,day("2022-05-05") - day(now()));

select date_add("2022-05-03", interval 100 day) as 100일_기념일;


