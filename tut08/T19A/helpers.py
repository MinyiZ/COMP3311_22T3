# helper functions

def subjectExists(conn, subject):
    cur = conn.cursor()
    cur.execute("select * from subjects where code = %s", [subject])

    return cur.fetchone() is not None


def termExists(conn, term):
    cur = conn.cursor()
    cur.execute("select * from terms where code = %s", [term])

    return cur.fetchone() is not None


def courseExists(conn, subject, term):
    cur = conn.cursor()

    query = """
		select *
		from courses c
		join terms t on (t.id = c.term)
		join subjects s on (s.id = c.subject)
		where s.code = %s and t.code = %s
	"""

    cur.execute(query, [subject, term])

    return cur.fetchone() is not None
