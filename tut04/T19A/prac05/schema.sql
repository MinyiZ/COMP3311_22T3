--
--  This script creates the Beer v2 database tables
--
--  Run it via:  \i schema.sql
--
--  Assume that the database has just been created
--  or that it has just been cleaned via clean.sql
--

create table Brewers (
	id      integer, -- PG: serial
	name    varchar(50) not null unique,
	country varchar(30) not null,
	primary key (id)
);

create table Beers (
	id      integer, -- PG: serial
	name    varchar(50),
	brewer  integer,
	primary key (id),
	foreign key (brewer) references Brewers(id)
);

create table Bars (
	id      integer, -- PG: serial
	name    varchar(50),
	addr    varchar(50),
	license integer,
	primary key (id)
);

create table Drinkers (
	id      integer, -- PG: serial
	name    varchar(50),
	addr    varchar(50),
	phone   char(10),
	primary key (id)
);

create table Sells (
	bar     integer,
	beer    integer,
	price   float,
	primary key (bar,beer),
	foreign key (bar) references Bars(id),
	foreign key (beer) references Beers(id)
);

create table Likes (
	drinker	integer,
	beer    integer,
	primary key (drinker,beer),
	foreign key (drinker) references Drinkers(id),
	foreign key (beer) references Beers(id)
);

create table Frequents (
	drinker integer,
	bar     integer,
	primary key (drinker,bar),
	foreign key (drinker) references Drinkers(id),
	foreign key (bar) references Bars(id)
);
