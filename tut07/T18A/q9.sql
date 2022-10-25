
create or replace function emp_stamp() returns trigger
as $$
begin
    raise notice '%', new.empname;
    if (new.empname is null) then
        raise exception 'Employee name is compulsory';
    end if;

    if (new.salary <= 0) then
        raise exception 'Salary must be positive';
    end if;

    new.last_date = now();
    new.last_usr = user;

    return new; 
end;
$$ language plpgsql;

create trigger emp_stamp_trigger
before insert or update
on Emp
for each row
execute procedure emp_stamp();
