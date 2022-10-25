-- a

create function r_pk_check() returns trigger
as $$
begin
	-- a or b is not null
	if (new.a is null or new.b is null) then
		raise exception 'Primary key cannot be null';
	end if;

	-- if we have an update and primary key has not changed
	-- just return new
	if (TG_OP = 'update' and old.a = new.a and old.b = new.b) then
		return new;
	end if;

	-- (a,b) does not already exist in database
	select * from R
	where a = new.a and b = new.b

	if (found) then
		raise exception 'Duplicate primary key found';
	end if;

	return new;
end;
$$ language plpgsql;

create trigger r_pk_check_trigger
before insert or update
on R
for each row
execute procedure r_pk_check();

-- b

create function t_fk_check() returns trigger
as $$
begin
	if (TG_OP = 'update' and old.k = new.k) then
		return new;
	end if;

	select * from S
	where x = new.k

	if not (found) then
		raise exception 'Referenced tuple not found';
	end if;

	return new;
end;
$$ language plpgsql;

create trigger t_fk_check_trigger
before insert or update
on T
for each row
execute procedure t_fk_check();

create function t_fk_check_delete() returns trigger
as $$
begin
	-- check no references from T to the tuple being deleted
	select * from T
	where k = old.x;

	if (found) then
		raise exception 'References still exist in T';
	end if;

	return null;
end;
$$ language plpgsql;

create trigger t_fk_check_delete_trigger
before delete
on S
for each row
execute procedure t_fk_check_delete();