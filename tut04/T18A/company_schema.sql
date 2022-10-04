create table Employees (
      eid     integer,
      ename   text,
      age     integer,
      salary  integer,

      primary key (eid),
      check (salary >= 15000)

      -- check (1 >= select sum(percent)
      --       from worksin w
      --       w.eid = eid)
);
create table Departments (
      did     integer,
      dname   text,
      budget  integer,
      manager integer not null,

      primary key (did),
      foreign key (manager) references Employees(eid)

      -- check (1 = select percent
      --        from worksin w
      --        w.eid = manager
      --        where w.did = did)
);
create table WorksIn (
      eid     integer,
      did     integer default 1,
      percent real,

      primary key (eid,did),
      foreign key (eid) references Employees(eid),      
      foreign key (did) references Departments(did) on delete set default
);
