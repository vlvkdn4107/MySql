
-- mysql에 내장 되어있는 function

-- MySQL에 관련된 String function
select ascii('b'); -- 아스키코드

select char_length('MY SQL TEST') as 문자길이; -- 문자열의 글자수 (공백포함) // as 문자길이 필드명을 별칭으로도 변경 가능하다.
select char_length('홍길동') as 이름 ;
select concat('boot', 'class', '100%') as class_name; -- 문자열을 더해주는 내장된 함수 이다
select concat_ws('->', 'boot', 'class', '100%') as class_name; -- ws는 문자열을 연결 시켜줄때 사이사이 표시해서 나타낸다.
-- 문자열 목록 내에서 q를 검색할수 있다.
select find_in_set('q', 's,q,l'); -- q라는 문자열이 어디에 있는지 (결과값2) // 없으면 0이라고 결과값이 나온다.

select format(250500.5634, 0);
-- 숫자 형식은 '#.##.##.##'(소수점 2자리 반올림)으로 지정 한다.

select lcase('HELLO JAVA'); -- 문자열에 있는 대문자들을 소문자로 바꿔준다
select ucase('hello java'); -- 문자열에 있는 소문자들을 대문자로 바꿔준다

select trim('                M Y S                      Q L             '); -- 맨 앞과 맨 뒤 공백만 지워준다.
select replace('   M   Y  S  Q  L    aaa 111    ',' ', ''); -- ' '(공백을),''(공백없이) 만들어주겠다.


select a.userName, a.addr, a.mobile, b.prodName, b.price, b.amount, char_length(a.userName)
from usertbl as a   -- as a(별칭)
inner join buytbl as b -- as b(별칭)
on a.userName = b.userName;



-- 주소에있는 문자열 글자수 확인하기, amount ascii 값 확인하기. as(별칭)
select u.userName, u.addr as 주소,u.mobile, b.prodName,b.amount, char_length(u.addr) as 주소_글자_길이, ascii(b.amount) as amount_ascii, 
	replace(u.Mobile, '-', '') as 전화번호_공백제거
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

select b.userName as 이름, b.prodName as 제품이름, b.amount as 곗수, u.addr as 주소,replace(u.mobile, '-','') as 전화번호
from buytbl as b
inner join usertbl as u
on b.userName = u.userName;

-- sql
-- usertbl기준으로 buytbl left join한다.
-- mobile에서 -빼고 조회
select u.userName, replace(u.mobile, '-','')as 전화번호_공백제거
from usertbl as u
left join buytbl as b
on u.userName = b.userName;

-- usertbl 기준으로 buytbl과 공통되는 userName 출력하고, 글자수 반환하기
select u.userName, char_length(u.userName) as 유저이름_글자수
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

-- '누가 구매한 상품명' 으로 리스트를 만들고, 가격과 수량 조회하기
select concat_ws('가 구매한 ', u.userName, b.prodName) as 'list', b.amount, b.price
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

select replace(u.userName, '순','*'), u.addr, u.mobile, concat_ws('의 총 가격은 : ', b.prodName, b.price * b.amount)
from usertbl as u
inner join buytbl as b
on u.userName = b.userName
where b.price > 10;


select a.userName, (b.price * b.amount) as total
from usertbl as a
inner join buytbl as b
on a.username = b.username
where b.price > 10;
