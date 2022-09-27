create table Team (
	name text,
	captain text not null unique,

	primary key (name)
	foreign key (captain) references Player(name)
);

create table Player (
	name text,
	team text not null,

	primary key (name),
	foreign key (team) references Team(name)
);

create table Fan (
	name text,

	primary key (name)
);

create table FavColours (
	fan text,
	colour text,

	primary key (fan, colour),
	foreign key (fan) references Fan(name)

);

create table TeamColours (
	team text,
	colour text,

	primary key (team, colour),
	foreign key (team) references Team(name)

);

create table FavTeam (
	fan text
	team text

	primary key (fan, team),
	foreign key (fan) references Fan(name),
	foreign key (team) references Team(name),
);

create table FavPlayer (
	fan text
	player text

	primary key (fan, player),
	foreign key (fan) references Fan(name),
	foreign key (player) references Player(name),
);
