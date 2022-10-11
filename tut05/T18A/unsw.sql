/* Q14 Write a PLpgSQL function to produce the complete name of an organisational unit (aka OrgUnit), given the OrgUnit's internal id

The function returns the complete name using the rules:

the university is denoted by UNSW
a faculty is denoted using its base name (not all faculty names start with Faculty)
a school is denoted School of XYZ
a department is denoted Department of XYZ
a centre is denoted Centre for XYZ
an institute is denoted Institute of XYZ
other kinds of OrgUnits are treated as having no name (i.e. return null)
*/

create or replace function unitName(_ouid integer) returns text
as $$
declare
	_outype text;
	_ouname text;
begin
	perform * from orgunit
	where id = _ouid;

	if not found then
		raise exception 'No such unit %', _ouid;
	end if;

	select t.name, ou.longname
	into _outype, _ouname
	from orgunit ou
	join orgunittype t on (t.id = ou.utype)
	where ou.id = _ouid;

	if _outype = 'University' then
		return 'UNSW';
	elsif _outype = 'Faculty' then
		return _ouname;
	elsif _outype = 'School' then
		return 'School of ' || _ouname;
	elsif _outype = 'Department' then
		return 'Department of ' || _ouname;
	elsif _outype = 'Centre' then
		return 'Centre for ' || _ouname;
	elsif _outype = 'Institute' then
		return 'Institute of ' || _ouname;
	else
		return null;
	end if;
end;
$$ language plpgsql;

/* Q16 Write a PLpgSQL function which takes the numeric identifier of a given OrgUnit and returns the numeric identifier of the parent faculty for the specified OrgUnit

Note that a faculty is treated as its own parent. Note also that some OrgUnits don't belong to any faculty; such OrgUnits should return a null result from the function.
*/

create or replace function facultyOf(_ouid integer) returns integer
as $$
declare
	_outype text;
	_owner integer;
begin
	perform * from orgunit
	where id = _ouid;

	if not found then
		raise exception 'No such unit %', _ouid;
	end if;

	raise notice '%', _ouid;

	-- figure out what type the orgunit is
	select t.name
	into _outype
	from orgunit ou
	join orgunittype t on (t.id = ou.utype)
	where ou.id = _ouid;

	-- if cannot find type or does not belong to any faculty
	if _outype is null or _outype = 'University' then
		return null;
	-- if the org with _ouid is a faculty
	elsif _outype = 'Faculty' then
		-- return the _ouid
		return _ouid;
	else
		select owner 
		into _owner
		from unitgroups
		where member = _ouid;

		return facultyOf(_owner);
	end if;
end;
$$ language plpgsql;