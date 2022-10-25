
create or replace function emp_stamp() returns trigger
as $$
begin
    -- check that employee name is given
    if (new.empname is null or new.empname = '') then
        raise exception 'Employee name must be given';
    end if;

    -- check salary positive
    if (new.salary <= 0) then 
        raise exception 'Salary must be positive';
    end if;

    -- stamp current user and time
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
