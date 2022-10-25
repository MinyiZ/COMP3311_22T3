-- Q1
create assertion manager_works_in_department
check (not exists
	select *
	from department d
	join employee e (d.manager = e.id)
	where e.works_in <> d.id
)
;


-- Q2
create assertion employee_manager_salary
check (not exists
	select *
	from department d
	join employee m (d.manager = m.id)
	join employee e (e.works_in = d.id)
	where e.salary > m.salary
)
;
