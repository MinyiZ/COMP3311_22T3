-- on insert, increment numStudes
create or replace function insert_trigger_func() returns trigger
as $$
declare
	-- _quota int;
	-- _numStudes int;

	_exceeded boolean;
begin
	-- select into _quota, _numStudes
	-- quota, numStudes
	-- from Course
	-- where code = new.course;

	-- if (_numStudes >= _quota) then
	-- 	raise exception 'Cannot enrol, quota reached';
	-- end if;

	select into _exceeded
	(numStudes >= quota)
	from Course
	where code = new.course;

	if (_exceeded) then 
		raise exception 'Cannot enrol, quota reached';
	end if;

	update Course
	set numStudes = numStudes + 1
	where code = new.course;

	return null;
end;
$$ language plpgsql;

create trigger insert_trigger
after insert
on Enrolment
for each row
execute procedure insert_trigger_func();


-- on delete, decrement numStudes
create or replace function delete_trigger_func() returns trigger
as $$
begin
	update Course
	set numStudes = numStudes - 1
	where code = new.course;

	return null;
end;
$$ language plpgsql;

create trigger delete_trigger
after insert
on Enrolment
for each row
execute procedure delete_trigger_func();

-- on update
create or replace function update_trigger_func() returns trigger
as $$
begin
	if (old.course = new.course) then
		return null;
	end if;

	update Course
	set numStudes = numStudes - 1
	where code = old.course;

	update Course
	set numStudes = numStudes + 1
	where code = new.course;

	return null;
end;
$$ language plpgsql;

create trigger update_trigger
after insert
on Enrolment
for each row
execute procedure update_trigger_func();