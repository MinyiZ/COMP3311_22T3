-- Q7 Write a PLpgSQL function called hotelsIn() that takes a single argument giving the name of a suburb, and returns a text string containing the names of all hotels in that suburb, one per line.

create or replace function hotelsIn(_addr text) returns text
as $$
declare
    _bar bars;
    _res text = '';
begin
    for _bar in
        select * from bars
        where addr = _addr
    loop
        _res := _res || _bar.name || e'\n';
    end loop;

    return _res;
end;
$$ language plpgsql;

-- Q8 Write a new PLpgSQL function called hotelsIn2() that takes a single argument giving the name of a suburb and returns the names of all hotels in that suburb. The hotel names should all appear on a single line, as in the following example:
-- Hotels in The Rocks:  Australia Hotel  Lord Nelson

create or replace function hotelsIn2(_addr text) returns text
as $$
declare
    _bar bars;
    _res text = '';
begin
    for _bar in
        select * from bars
        where addr = _addr
    loop
        _res = _res || _bar.name || '  ';
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
    _price real;
    _new_price real;
    _count integer;
begin
    -- check hotel exists
    select count(*) from bars
    into _count
    where name = _hotel;

    if _count = 0 then
        return 'There is no hotel called ''' || _hotel || '''';
    end if;

    -- check beer exists
    perform * from beers
    where name = _beer;

    if not found then
        return 'There is no beer called ''' || _beer || '''';
    end if;

    -- check beer is sold at hotel
    select price
    into _price
    from sells s
    join bars ba on (s.bar = ba.id) 
    join beers be on (s.beer = be.id)
    where ba.name = _hotel
    and be.name = _beer;

    if not found then
        return 'The ' || _hotel || ' does not serve ' || _beer; 
    end if;

    -- calculate new price
    -- check price is not zero or negative
    _new_price = _price - _discount;

    if _new_price <= 0 then
        return 'Price reduction is too large; ' || _beer || ' only costs ' || to_char(_price,'$9.99');
    end if;

    return 'Happy hour price for ' || _beer || 'at ' || _hotel || 'is ' || to_char(_new_price,'$9.99');

end;
$$ language plpgsql;

