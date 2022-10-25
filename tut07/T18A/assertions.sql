-- Q1
create assertion manager_works_in_department
check (not exists
	select *
	from departments d
	join employee e (on d.manager = e.id)
	where e.works_in <> d.id
)
;


-- Q2
create assertion employee_manager_salary
check (not exist
	select *
	from employee e 
	join departments d on (e.works_in = d.id)
	join employee m on (d.manager = m.id)
	where e.salary > m.salary
)
;
