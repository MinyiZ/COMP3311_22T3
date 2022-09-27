-- COMP3311 Prac 03 Exercise
-- Schema for simple company database

create table Employees (
	tfn         char(11),
	givenName   varchar(30) not null,
	familyName  varchar(30),
	hoursPweek  float,

	primary key (tfn),

	check (tfn ~ '\d{3}-\d{3}-\d{3}'),
	check (hourspweek <= 168 and hourspweek >= 0)
);

create table Departments (
	id          char(3),
	name        varchar(100) not null unique,
	manager     char(11) unique,

	primary key (id),
	foreign key (manager) references Employees(tfn),

	check (id ~ '\d{3}')
);

create table DeptMissions (
	department  char(3),
	keyword     varchar(20) not null,

	foreign key (department) references Departments(id)
);

create table WorksFor (
	employee    char(11) not null,
	department  char(3) not null,
	percentage  float,

	primary key (employee, department),
	foreign key (employee) references Employees(tfn),
	foreign key (department) references Departments(id),

	check (percentage >= 0 and percentage <= 100)
);
