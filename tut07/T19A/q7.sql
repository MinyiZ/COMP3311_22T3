create or replace function updateS1() returns trigger
as $$
begin
	raise notice 'S1';
	return null;
end;
$$ language plpgsql;

create or replace function updateS2() returns trigger
as $$
begin
	raise notice 'S2';
	return null;
end;
$$ language plpgsql;

create trigger updateS1 after update on S
   for each row execute procedure updateS1();

create trigger updateS2 after update on S
   for each statement execute procedure updateS2();
