-- on insert into Enrolments, increment numStudes for course
create or replace function insert_student() returns trigger
as $$
begin
	update Course
	set numStudes = numStudes + 1
	where code = new.course;
end;
$$ language plpgsql;

create trigger insert_student_trigger
after insert
on Enrolment
for each row
execute procedure insert_student();

-- on delete from Enrolments, decrement numStudes for course
create or replace function delete_student() returns trigger
as $$
begin
	update Course
	set numStudes = numStudes - 1
	where code = old.course;
end;
$$ language plpgsql;

create trigger delete_student_trigger
after delete
on Enrolment
for each row
execute procedure delete_student();

-- on update on Enrolments, increment/decrement as needed
create or replace function update_student() returns trigger
as $$
begin
	-- if course did not change, do nothing
	if (old.course = new.course) then
		return null;
	end if;

	-- increment numStudes to new course
	update Course
	set numStudes = numStudes + 1
	where code = new.course;

	-- decrement numStudes from old course
	update Course
	set numStudes = numStudes - 1
	where code = old.course;

end;
$$ language plpgsql;

create trigger update_student_trigger
after update
on Enrolment
for each row
execute procedure update_student();

-- on insert or update, quota is not exceeded

create or replace function quota_check() returns trigger
as $$
declare
	-- _numStudes int;
	-- _quota int;
	_full boolean;
begin
	-- if course did not change, do nothing
	if (old.course = new.course) then
		return null;
	end if;	

	select into _full
	(numStudes >= quota)
	from Course
	where code = new.course;

	-- if (_numStudes >= _quota) then
	if (_full) then
		raise exception 'Quota exceeded, cannot enrol';
	end if;

	return new;
end;
$$ language plpgsql;

create trigger quota_check_trigger
before insert or update
on Enrolment
for each row
execute procedure quota_check();