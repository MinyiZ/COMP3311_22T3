-- helper views or functions

-- q3
create or replace view enrolments as
	select su.code as subject, t.code as term, p.id, p.family, p.given
	from course_enrolments ce
	join students st on (ce.student = st.id)
	join courses c on (ce.course = c.id)
	join subjects su on (c.subject = su.id)
	join terms t on (c.term = t.id)
	join people p on (st.id = p.id)
;

create type stu as (id int, family text, given text);

create or replace function enrolments(_subject text, _term text) returns setof stu
as $$
begin
	return query
	select p.id, p.family::text, p.given::text
	from course_enrolments ce
	join students st on (ce.student = st.id)
	join courses c on (ce.course = c.id)
	join subjects su on (c.subject = su.id)
	join terms t on (c.term = t.id)
	join people p on (st.id = p.id)
	where su.code = _subject and t.code = _term
	order by p.family, p.given
	;
end
$$ language plpgsql;

-- q5
create or replace view enrolments_q5 as
	select st.id as zid, t.code as term, string_agg(su.code || ' ' || su.name, e'\n' order by su.code) as subjects
	from course_enrolments ce
	join students st on (ce.student = st.id)
	join courses c on (ce.course = c.id)
	join subjects su on (c.subject = su.id)
	join terms t on (c.term = t.id)
	group by st.id, t.code
;