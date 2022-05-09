
use employees;

select *
from employees
where emp_no in(select emp_no
				from titles
                where title = 'Senior Engineer');

select e.emp_no, e.last_name, e.gender, s.salary
from employees as e,(select *
					 from salaries
                     where salary >= 80000
                     group by emp_no)as s
where e.emp_no = s.emp_no;
select e.emp_no, e.last_name,(select s.salary
							  from salaries as s
                              where e.emp_no = s.emp_no
                              and to_date = '9999-01-01'
                              group by emp_no) as '연봉'
from employees as e;

select *
from employees as e
where e.emp_no = (select emp_no
				  from dept_manager
                  where to_date < '2000-01-01' and dept_no = (select dept_no
															  from departments
		        											  where dept_name = 'development'));
select *
from employees as e, (select *
					  from dept_manager
                      where to_date < '2000-01-01')as b
where e.emp_no = b.emp_no;	
					
select e.emp_no, e.first_name,(select d.dept_no
							   from dept_emp as d
                               where e.emp_no = d.emp_no
                               group by emp_no)as 부서번호
from employees as e;					
			
select *
from employees as a
where emp_no in(select emp_no
				from titles as b
                where title = 'Senior Engineer');
                
select a.emp_no, a.first_name, b.dept_no
from employees as a, (select *
					  from dept_manager
                      where dept_no = 'd001')as b
where a.emp_no = b.emp_no;

select a.emp_no, a.first_name, (select b.salary
								from salaries as b
                                where a.emp_no = b.emp_no
                                group by emp_no
                                having max(salary)) as '최고연봉'
from employees as a;
                      
select *
from employees as e
where e.emp_no = (select emp_no
				  from titles
                  where title = 'staff'
                  and emp_no = 10002);

select *
from employees as a,(select *
					 from dept_emp
                     where to_date <> '9999-01-01')as b
where a.emp_no = b.emp_no;

select e.emp_no, (select t.to_date
				  from titles as t
                  where t.emp_no = e.emp_no
                  and t.to_date<> '9999-01-01'
                  group by emp_no) as '퇴사일'
from employees as e;			


use shopdb;
select * from memberTbl;
SELECT * FROM memberTBL WHERE memberId IN('Dang', 'jee');

select * from usertbl;
select * from buytbl;

select u.userName, b.prodName, b.price, b.amount 
from usertbl as u
inner join buytbl as b
on u.userName = b.userName
where u.userName = '이승기';

select *
from usertbl as u
left join buytbl as b
on u.userName = b.userName
where u.userName = '이승기';

select *
from buytbl as b
left join usertbl as u
on b.userName = u.userName;

select b.userName, u.mobile, u.addr
from buytbl as b
left join usertbl as u
on b.userName = u.userName
where b.userName = '이순신'
or b.userName = '홍길동';

use employees;
select * from employees;
select * from salaries;

select m.emp_no, m.first_name, m.gender, s.salary as 현재연봉
from employees as m
inner join salaries as s
on m.emp_no = s.emp_no
where m.emp_no = 12345
group by m.emp_no;
desc salaries;

select emp_no, first_name, gender from employees where emp_no = 12345;