

-- 그룹함수, 그룹바이, having 절

-- GROUP BY 절
-- 그룹바이 절은 데이터들을 원하는 그룹으로 나눌 수 있다
-- 나누고자 하는 구룹의 컬럼명을 SELECT절과 GROUP BY 절 뒤에 추가하면된다
-- 집계함수와 함께 사용되는 상수는 GROUP BY 절에 추가하지 않아도 된다.(많이 실수하는 부분)

-- DISTINCT 와 GROUP BY 절
-- DISTINCT는 주로 중복을 제거 하기 위해서 사용한다.
-- 그룹바이는 데이터를 그룹핑해서 그 결과를 가져오는 경우 사용한다.
-- 하지만 두 작업은 조금만 생각해보면 동일한 형태의 작업이라는 것을 쉽게 알수 있고, 일부 작업의 경우
-- distinct로 동시에 처리할 수 도 있다

-- having 절
-- where 절 에서는 사실 집계함수를 사용할수 없다!!!!!!!!!!!
-- having 절은 집계함수를 가지고 조건을 비교할 때 사용한다.
-- where이랑 having은 비슷하지만 집계함수를 쓸때는 having 절을 쓴다
-- having 절은 group by 절과 함께 사용 된다.

use employees;
show tables;

select * from salaries limit 100; -- 연봉
select * from departments limit 100; -- 회사 부서를 담은 테이블
select * from dept_emp; -- 직원들의 정보
select * from dept_manager; -- 매니저 들가 누구인지 알려주고 매니저가 퇴사한날짜 입사한 날짜 현재 까지 일하고있는지
select * from employees; -- 직원 상세 정보
select * from titles; -- 

-- 합계 함수
-- 문제 1. 전체 직원수(전체 직원수) , 제일 먼저 입사한 일자(최초고용일자), 제일 마지막 입사일자가 언제인지(가장 최근 고용일자)
select count(emp_no) as '전체 직원수' , min(hire_date) as '최초 고용일자' , max(hire_date) as '가장최근 고용일자'
from employees;

-- 문제 2. gender 로 그룹핑
select *
from employees
group by gender;

-- 문제 3 남성, 여성 수와, gender 를 표시 해주세요 

select count(*), gender 
from employees
group by gender;

-- 문제 4 고용일자 그룹화
select *
from employees
group by hire_date;

-- 문제5 고용일자가 같은 직원에 명수를 표시하시요
select *,count(*) as 동기수, hire_date
from employees
group by hire_date;

-- 6 위 쿼리에서 남성과 여성을 구분해서 결과 값을 구하시오
select count(*) as 동기수, hire_date, gender 
from employees
group by hire_date, gender
order by hire_date desc; -- asc 오름차순으로 정렬해서 보여줘 desc 내림차순으로 정렬해서 보여줘

--
select *
from salaries; -- 2개의 PK가있다
desc salaries;

-- 급여 테이블에서 
-- 총 건수, 총 금여, 평균 급여, 최고 연봉자 급여, 최소 급여
select count(emp_no), sum(salary)as 총급여, round(avg(salary),2)as 평균급여, max(salary)as 최고급여, min(salary)as 최소급여
from salaries
where salary;

-- 데이터 검증 하는 과정 하나하나 검증해야한다.
select max(salary) from salaries;

-- having 절 연습
-- 연봉을 10번이상 받은 직원들을 출력하시오.

use employees;

select *, count(emp_no) as 횟수
from salaries
group by emp_no
having count(emp_no >= 10)
order by emp_no asc
limit 30;

-- 문제
select * from titles;

select count(*)
from titles;    

-- 10만명 이상 사용하고 있는 직함의 이름과 직원의 수를 출력하시오
select title,count(title) as 직함의직원수
from titles
group by title
having count(title) >= 100000;

select title, count(*)
from titles
group by title
having count(*) >= 100000;

-- 5만명 이상 근무하고 있는 부서의 부서번호와 부서 소속 사원의 수를 출력하시오

select emp_no as 부서번호, title as 부서이름, count(title) as emp_no의직원수
from titles
group by title
having count(title) >= 50000;

select *,count(*)
from dept_emp
group by dept_no
having count(*) >=50000;

select * from dept_emp;
-- 현재 근무중인 사람들만 출력 하시요
select *
from dept_emp
where to_date = '9999-01-01';

select *, count(*)
from dept_emp
where to_date = '9999-01-01';

-- 각 부서별 과거의 매니저의 수를 구하시오(퇴사자)
select * from dept_manager;
select *
from dept_manager
where to_date <> '9999-01-01'; -- <> 같지 않다


-- 그룹함수, having 절 + join
select * from employees;
select * from titles;
select * from departments;
select * from dept_emp;
select * from salaries;


-- titles 와 employees를 inner join하고 같은부서의 사람들 수 출력
select t.emp_no, t.title, e.first_name, e.last_name, e.gender,count(t.title) as '같은 부서 사람들 수'
from titles as t
inner join employees as e
on t.emp_no = e.emp_no
group by t.title
having count(t.title);

select * from titles;
select *,count(title)
from titles
group by title;

select *, count(title)
from titles
where title= 'Engineer';

select e.emp_no, concat(first_name,"",last_name) as name, salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no
where to_date = '9999-01-01'
order by salary desc
limit 10;









