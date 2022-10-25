create type StateType as (sum numeric, n numeric);

create or replace function mean_sfunc(s StateType, v numeric) returns StateType
as $$
begin
	if (v is not null) then
		s.sum = s.sum + v;
		s.n = s.n + 1;
	end if;

	return s;
end;
$$ language plpgsql;

create or replace function mean_finalfunc(s StateType) returns numeric
as $$
begin
	if (s.n = 0) then
		return 0;
	end if;

	return s.sum / s.n;
end;
$$ language plpgsql;

CREATE AGGREGATE mean(numeric) (
    stype     = StateType,
    initcond  = '(0,0)',
    sfunc     = mean_sfunc,
    finalfunc = mean_finalfunc
);