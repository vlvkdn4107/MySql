use shopdb;
select * from usertbl;
select * from buytbl;

-- 제약을 걸어두면 어떤 일이 발생하냐면은~
delete from usertbl where userName = '이승기'; -- buytbl에 이승기라는 데이터가 있기 떄문에 삭제가 안된다
delete from buytbl where userName = '이승기'; -- 하지만 자식테이블인 buytbl에서는 데이터 삭제가 가능하다.



