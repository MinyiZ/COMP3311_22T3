-- a

create function r_pk_check() returns trigger
as $$
begin
	if (new.a is null or new.b is null) then
		raise exception 'Primary key cannot be null';
	end if;

	-- if primary not changed by update
	if (TG_OG = 'update' and old.a = new.a and old.b = new.b) then
		return new;
	end if;

	-- check if a tuple with PK already exists
	perform * from R
	where a = new.a and b = new.b;

	if (found) then
		raise exception 'Duplicate primary key';
	end if; 

	return new;
end;
$$ language plpgsql

create trigger r_pk_check_trigger
before insert or update
on R
for each row
execute procedure r_pk_check();

-- b

-- check if k references a valid tuple in S
create function t_fk_check() returns trigger
as $$
begin
	perform * from S
	where x = new.k;

	if not (found) then
		raise exception 'Non-existent reference to primary key x in S';
	end if; 

	return new;
end;
$$ language plpgsql

create trigger t_fk_check_trigger
before insert or update
on T
for each row
execute procedure t_fk_check();

-- check that there are no fk references to tuple in S from T before deleting/updating
create function s_ref_check() returns trigger
as $$
begin
	-- if not changing pk
	if (TG_OG = 'update' and old.x = new.x) then
		return new;
	end if;

	perform * from T
	where k = old.x;

	if (found) then
		raise exception 'Reference to tuple still exists in T';
	end if; 

	return null;
end;
$$ language plpgsql

create trigger s_ref_check_trigger
before delete or update
on S
for each row
execute procedure s_ref_check();