-- trigger function defines what happens when its called
-- what to do
create function trigger_function() return trigger
as $$
begin
	-- trigger logic
end;
$$
language plpgsql

-- binds a database event to call a trigger function
-- when to do it
create trigger trigger_name
[before | after] [insert | delete | update]
on table_name
-- for each row -- trigger function called for each modified row
-- for each statement -- trigger function called once per statement (statement can update multple rows)
for each [row | statement]
execute procedure trigger_function();

-- example

Employee(id:text, first:text, last:text, works_in:integer, salary:integer)
Department(id:integer, name:text, manager:integer, num_employees integer)

-- before trigger
-- check that
--		employee name is given
--      salary is positive
-- add id to tuple
-- 		new: (NULL, 'anna', 'smith', 0, 10)
-- 		new: ('asmith', 'anna', 'smith', 0, 10)
-- stanard DB check
-- eg. primary and foreign keys
--
-- after trigger
-- 		increment num_employees in Department table