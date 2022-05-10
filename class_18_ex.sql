 
-- ANSI SQL
-- DBMS(Oracle, My-SQL, MSSQL 등등)들에서 각기 다른 SQL를 사용하므로, 미국 표준 협회(American National Standards Institute)에서 이를 표준화하여 표준 SQL문을 정립 시켜 놓은 것이다.

-- ANSI SQL 특징
-- 표준 SQL문이기 때문에 DBMS의 종류에 제약을 받지 않는다. (MySQL, Oracle..) 즉, 특정 벤더에 종속적이지 않아 다른 벤더의 DBMS로 교체하더라도 빠르게 다른 벤더사를 이동할 수 있다. 특정 DBMS의 이탈이 가속되는 것도 ANSI SQL의 영향이 크다고 할 수 있다.
-- 테이블간의 Join 관계가 FROM 에서 명시되기 때문에 WHERE 문에서 조건만 확인하면 된다. 즉, 가독성이 일반 Query문보다 좋다.
