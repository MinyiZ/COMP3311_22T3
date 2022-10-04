-- Types of Return
create or replace function
	A() returns setof text
as $$
begin
	return next 'hi';
	return next 'hey';
	return;
	return next 'how are you';
end;
$$ language plpgsql;

-- Custom Tuple

create or replace function
	B() returns setof employees
as $$
begin
	return next (5, 'Bob'::text, 19, 100000);
end;
$$ language plpgsql;

-- Q1
-- Write a PLpgSQL function that takes a string as argument and finds all employees that contain that string in their name

create or replace function
 Q1(_partial_name text) returns setof employees
as $$
begin
	return query
	select *
	from employees
	where ename ~* ('.*' || _partial_name || '.*');
end;
$$ language plpgsql;

-- Q2
-- Write a PLpgSQL function that takes a partial department name, print info on the department.

-- Use the following format (note that employees are in alphabetical order):

-- Department: Sales
-- Budget: $5000000
-- Employees: Max + Maria + Susan

create or replace function
	Q2(_partial_name text) returns setof text
as $$
declare
	_d Departments;
	_emp_info text;
begin
	for _d in 
		select *
		from Departments
		where dname ~* ('.*' || _partial_name || '.*')
	loop
		return next 'Department: ' || _d.dname;
		return next 'Budget: ' || _d.budget;

		select string_agg(e.ename, ' + ')
		into _emp_info
		from worksin w
		join employees e on (w.eid = e.eid)
		where w.did = _d.did;

		return next 'Employees: ' || _emp_info;

	end loop;
end;
$$ language plpgsql;
