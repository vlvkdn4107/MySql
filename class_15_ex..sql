
use employees;

select * from employees;
select * from dept_emp; -- employees vs dept_emp (1:N) 관계
desc dept_emp;
select * from departments order by dept_no; -- departments vs dept_emp (1:N)
desc departments;

select * from dept_manager;
select * from titles;

select *, dept_no as '뽑아야 되는 값'
from departments as d
where d.dept_name = 'development';



-- 문제 1 (중첩 서브쿼리)
-- dept_emp 테이블에서 development 인 emp_no와 dept_no를 출력하세요
select * from departments;
select * from dept_manager;

select *
from dept_emp
where dept_no = (select dept_no
			     from departments
                 where dept_name = 'development');
                 
-- 문제 2 
-- employees 테이블에서 현재 development 매니저인 직원만 출력
select * from employees;
select * from dept_manager;
select * from departments;

select *
from employees as e
where e.emp_no = (select emp_no
				  from dept_manager
                  where to_date = '9999-01-01' 
                  and dept_no = 'd005');
                 
select *
from dept_manager
where to_date = '9999-01-01' and dept_no = 'd005';

-- 단일행 결과 집합이 나와서 외부 쿼리인 emp_no에 조건식으로 처리가 된다.
select *
from employees as e
where e.emp_no = (select emp_no
				  from dept_manager
                  where to_date = '9999-01-01' 
                  and dept_no = (select dept_no
								 from departments
                                 where dept_name = 'development'));
-- d005 ---> development (값으로 변경해서 쿼리문으로 완성해 주세요)

-- 서브쿼리를 사용할때는 단일행 결과 집합을 만들어서 사용하는게 편하다.
/*
	다중 행 서브 쿼리
    결과값이 2건 이상 출력되는 것을 말한다. 다중행 서브쿼리는 쿼리에 결과가 여러건 출력되기 때문에
    단일행 연산자를 사용할 수 없다.
    다중행 서브쿼리를 사용할때는 별도의 연산자를 사용해야 한다. in 같은
*/

use employees;
-- join
select e.emp_no, e.first_name, t.title
from employees as e
inner join titles as t
on e.emp_no = t.emp_no;

-- 인라인 뷰로 결과를 출력
select e.emp_no, e.first_name, t.title
from employees as e, (select * 
                      from titles)as t
where e.emp_no = t.emp_no;

select * from employees;
select * from titles;
select * from dept_manager;
select * from dept_emp;
-- 문제 1
-- 직원 테이블에서 부서 팀장만 출력하시오 (join 사용, 단 현재 근무중인 사람만 출력)
select *
from employees as e
inner join dept_manager as m
on e.emp_no = m.emp_no
where m.to_date = '9999-01-01';

-- 문제 2
-- 인라인 뷰로 출력하시오
use employees;
select *
from employees as e, (select *
					  from dept_manager
                      where to_date = '9999-01-01'
                      and dept_no = 'd003') as m
where e.emp_no = m.emp_no;

-- 스칼라 서브쿼리 (select 절에 사용하는 서브 쿼리)
-- select 절에 서브 쿼리를 사용하여 하나의 컬럼처럼 사용하기 위한 목적
-- join문을 대체 표현식으로 자주 사용하지만 성능면에서 좋은편이 아니다!!!!
-- 스칼라를 쓸때고 단일행으로 변경해야한다
select *, (select dept_name 
           from departments as b
           where d.dept_no = b.dept_no) as '부서명'
from dept_manager as d
where to_date = '9999-01-01';

-- 스칼라 서브쿼리를 사용해서
-- 문제 3 employees 테이블에서 emp_no, first_name (타이틀명)
-- 단일행으로 변경해야한다 


select e.emp_no, e.first_name,(select t.title
							   from titles as t
                               where e.emp_no = t.emp_no
                               group by emp_no) as '직함'
from employees as e;

select e.emp_no, e.first_name
from employees as e;
select title from titles;

-- 스칼라 select 중첩
-- 인라인 from
-- 중접  where
select * from employees;
select * from titles;
select * from dept_emp;

-- 스칼라 ( 현재 근무중인 사람만 emp_no , first_name , gender 출력
select e.emp_no, e.first_name, e.gender,(select d.to_date
										from dept_emp as d
                                        where  e.emp_no = d.emp_no 
                                        and d.to_date = '9999-01-01'
                                        group by d.emp_no) as 현재근무중인사람 
from employees as e;

-- 인라인 dept_emp 테이블에서 현재 근무중인 사람의 last_name과 gerder 출력
select d.emp_no, d.dept_no,d.from_date,d.to_date , e.last_name, e.gender
from dept_emp as d, (select *
					 from employees) as e
where d.emp_no = e.emp_no
and d.to_date = '9999-01-01';

-- 중접 emp_no 11111번의 타이틀 정보 출력
select *,(select first_name
		  from employees
          where emp_no = 11111)as '1111번 first_name'
from titles as t
where t.emp_no = (select emp_no
				 from employees as e
				 where emp_no = 11111);
select * from employees limit 3000;
select * from titles;
select * from dept_emp;

select * from salaries;
select * from employees;
select * from titles;



SELECT * 
FROM departments as a 
INNER JOIN dept_emp as b 
ON a.dept_no = b.dept_no WHERE dept_name = 'Marketing' AND b.to_date = '9999-01-01' limit 10;


SELECT * 
FROM dept_manager as a 
LEFT JOIN departments as b 
ON a.dept_no = b.dept_no 
WHERE b.dept_name = 'Finance';

SELECT * 
FROM employees as e 
LEFT JOIN titles as t 
ON e.emp_no = t.emp_no 
WHERE t.title = 'senior Engineer' limit 10;


SELECT emp_no, first_name, gender 
FROM employees LIMIT 10;

SELECT e.emp_no, e.first_name, e.last_name, e.gender, d.dept_no, d.from_date, d.to_date 
FROM employees as e 
RiGHT JOIN dept_manager as d 
ON e.emp_no = d.emp_no 
WHERE e.gender = 'M';

SELECT emp_no, first_name, last_name, gender FROM employees LIMIT 10;


