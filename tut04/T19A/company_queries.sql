-- Q2 

-- with view
create or replace view young_employees(eid, salary)
as
select eid, salary
from employees
where age < 25
;

update young_employees
set salary = 0.8 * salary;

-- without using view

update employees
set salary = 0.8 * salary
where age < 25;

-- Q3

-- with view
create or replace view sales_employees(eid)
as
select w.eid
from worksin w
join departments d on (w.did = d.did)
where d.dname = 'Sales'
;

update employees
set salary = salary * 1.1
where eid in (select eid from sales_employees);

-- without using view

update employees
set salary = salary * 1.1
where eid in (select w.eid
				from worksin w
				join departments d on (w.did = d.did)
				where d.dname = 'Sales');
