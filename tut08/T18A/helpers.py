# helper functions

# return true if subject with code exists in db
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
		join subjects s on (c.subject = s.id)
		join terms t on (c.term = t.id)
		where s.code = %s and t.code = %s
	"""
    cur.execute(query, [subject, term])

    return cur.fetchone() is not None
