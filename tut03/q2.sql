-- q2a
create table Subject (
	subjCode text,

	primary key (subjCode)
);

create table Teacher (
	staffID integer,
	subject text,
	semester text,

	primary key (staffID),
	foreign key (subject) references Subject(subjCode)
);

-- q2b
create table Teacher (
	staffID integer,

	primary key (staffID)
);

create table Subject (
	subjCode text,

	primary key (subjCode)
);

create table Teaches (
	subject text,
	teacher integer,
	semester text,

	primary key (subject, teacher),
	foreign key (subject) references Subject(subjCode)
	foreign key (teacher) references Teacher(staffID)
);

-- q2c
create table Teacher (
	staffID integer,

	primary key (staffID),
);

create table Subject (
	subjCode text,
	-- not null enforces that subject has to be taught by teacher
	-- unique enforces that teacher can only teach one subject
	teacher integer not null unique,
	semester text

	primary key (subjCode)
	foreign key (teacher) references Teacher(staffID)
);
