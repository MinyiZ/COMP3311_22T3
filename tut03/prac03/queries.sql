-- Which employee works the longest hours each week?
select * from employees
where hourspweek = (select max(hourspweek) from employees);

-- What is the family name of the manager of the Sales department?
select familyname from departments d
join employees e on (e.tfn = d.manager)
where name = 'Sales';

-- How many hours per week does each employee spend in each department?
select concat(e.givenname, ' ', e.familyname) as employee, (e.hourspweek * w.percentage / 100) as hours, d.name as department
from departments d
join worksfor w on (d.id = w.department)
join employees e on (e.tfn = w.employee);