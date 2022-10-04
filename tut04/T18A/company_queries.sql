-- Q2 
update Employees
set salary = 0.8 * salary
where age < 25;

-- update through view

create or replace view young_employees(ename, salary)
as
select ename, salary
from employees
where age < 25
;

update young_employees
set salary = 0.8 * salary;

-- Q3

update Employees
set salary = salary * 1.1
where eid in (
	select w.eid
	from WorksIn w
	join Departments d on (w.did = d.did)
	where d.dname = 'Sales'
);
