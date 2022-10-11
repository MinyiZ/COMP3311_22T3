-- Q7 Write a PLpgSQL function called hotelsIn() that takes a single argument giving the name of a suburb, and returns a text string containing the names of all hotels in that suburb, one per line.

create or replace function hotelsIn(_addr text) returns text
as $$
declare
    _barname text;
    _res text = '';
begin
    for _barname in
        select name::text
        from bars
        where addr = _addr
    loop
        _res := _res || _barname || e'\n';
    end loop;

    return _res;
end;
$$ language plpgsql;

-- Q8 Write a new PLpgSQL function called hotelsIn2() that takes a single argument giving the name of a suburb and returns the names of all hotels in that suburb. The hotel names should all appear on a single line, as in the following example:
-- Hotels in The Rocks:  Australia Hotel  Lord Nelson

create or replace function hotelsIn2(_addr text) returns text
as $$
declare
    _barname text;
    _res text = '';
begin
    for _barname in
        select name::text
        from bars
        where addr = _addr
    loop
        _res := _res || _barname || '  ';
    end loop;

    if found then
        return 'Hotels in ' || _addr || ':  ' || _res;
    end if;

    return 'There are no hotels in ' || _addr;
end;
$$ language plpgsql;

-- Q9 Write a PLpgSQL procedure happyHourPrice that accepts the name of a hotel, the name of a beer and the number of dollars to deduct from the price, and returns a new price. 

create or replace function
    happyHourPrice (_hotel text, _beer text, _discount real) returns text
as $$
declare
    _count integer;
    _price real;
    _new_price real;
begin
    -- check that hotel exists
    select count(*)
    into _count
    from bars
    where name = _hotel;

    if _count = 0 then
        return 'There is no hotel called ''' || _hotel || '''';
    end if;

    -- check that beer exists
    select count(*)
    into _count
    from beers
    where name = _beer;

    if _count = 0 then
        return 'There is no beer called ''' || _beer || '''';
    end if;

    -- check that hotel sells beer
    select price
    into _price
    from sells s
    join beers be on (s.beer = be.id)
    join bars ba on (s.bar = ba.id)
    where be.name = _beer
    and ba.name = _hotel;

    if not found then
        return 'The ' || _hotel || ' does not serve ' || _beer;
    end if;

    -- calculate new price
    _new_price = _price - _discount;
    -- check that price would be > 0 after discount
    if (_new_price <= 0) then
        return 'Price reduction is too large; ' || _beer || ' only costs ' || to_char(_price,'$9.99');
    end if;

    return 'Happy hour price for ' || _beer || ' at' || _hotel || 'is ' || to_char(_new_price,'$9.99');

end;
$$ language plpgsql;

create type ABVLALALA as (minABV float, maxABV float);

create or replace function Q11(_country text) returns ABVLALA
as $$
begin
    return (1.30, 1.30)::ABVrange;
end;
$$ language plpgsql;