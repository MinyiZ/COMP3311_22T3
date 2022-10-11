-- Q1 Write a simple PLpgSQL function that returns the square of its argument value.

create or replace function sqr(_n integer) returns numeric
as $$
begin
    return _n * _n;
end;
$$ language plpgsql;

create or replace function sqr(_n text) returns numeric
as $$
begin
    return _n::integer * _n::integer;
end;
$$ language plpgsql;

-- Q2 Write a PLpgSQL function that spreads the letters in some text.

create or replace function spread(_str text) returns text
as $$
declare
    _i integer := 1;
    _res text := '';
begin
    -- while (_i <= length(_str)) loop
    --     _res := _res || substr(_str, _i, 1) || ' ';
    --     _i := _i + 1;
    -- end loop;

    for _i in 1..length(_str) loop
        _res := _res || substr(_str, _i, 1) || ' ';
    end loop;

    return _res;
end;
$$ language plpgsql;




