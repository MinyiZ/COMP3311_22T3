create table Employees (
      eid     integer,
      ename   text,
      age     integer,
      salary  integer,

      primary key (eid),
      check (salary >= 15000)
);
create table Departments (
      did     integer,
      dname   text,
      budget  integer,
      manager integer not null,

      primary key (did),
      foreign key (manager) references Employees(eid)

      -- check (1 = (
      --       select w.percent
      --       from worksin w
      --       where w.eid = manager
      --       and w.did = did
      -- ))
);
create table WorksIn (
      eid     integer,
      did     integer default 1,
      percent real,

      -- primary key (eid,did),
      foreign key (eid) references Employees(eid),      
      foreign key (did) references Departments(did) on delete set default

      -- check (1 >= (
      --       select sum(w.percent)
      --       from worksin w
      --       where w.eid = eid
      -- ))
);