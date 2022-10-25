-- trigger function which defines what to do
create function trigger_function()
	return trigger
as $$
begin
	-- trigger logics
end;
$$
language plpgsql;

-- trigger that defines when to call the function
create trigger trigger_name
[before | after] [insert | delete | update ]
on table_name
for each [row | statment]
execute procedure trigger_function();

-- example
employee(id, first, last , birthday)
department(employee_count)

-- before inserting employee
insert employee (first, last, birthday) values ('anna', 'smith', 232);

trigger can modify employee tuple to add id

employee("asmith", 'anna', 'smith', 232)

-- after inserting employee
