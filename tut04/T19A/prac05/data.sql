--
--  This script creates the Beer database 
--
--  Run it via:  \i data.sql
--
--  Assume that the schema.sql script has just been run
--  and that the database contains all empty tables
--

insert into Brewers values (1, 'Caledonian', 'Scotland');
insert into Brewers values (2, 'James Squire', 'Australia');
insert into Brewers values (3, 'Sierra Nevada', 'USA');
insert into Brewers values (4, 'George IV Inn', 'Australia');
insert into Brewers values (5, 'Bridge Road Brewers', 'Australia');
insert into Brewers values (6, 'Carlton', 'Australia');
insert into Brewers values (7, 'Murray''s', 'Australia');
insert into Brewers values (8, 'Toohey''s', 'Australia');
insert into Brewers values (9, 'Lord Nelson', 'Australia');
insert into Brewers values (10, 'Brew Dog', 'Scotland');
insert into Brewers values (11, 'Cooper''s', 'Australia');
insert into Brewers values (12, 'Cascade', 'Australia');


insert into Beers values (1, '80/-', 1);
insert into Beers values (2, 'Amber Ale', 2);
insert into Beers values (3, 'Bigfoot Barley Wine', 3);
insert into Beers values (4, 'Burragorang Bock', 4);
insert into Beers values (5, 'Chestnut Lager', 5);
insert into Beers values (6, 'Crown Lager', 6);
insert into Beers values (7, 'Fosters Lager', 6);
insert into Beers values (8, 'India Pale Ale', 2);
insert into Beers values (9, 'Invalid Stout', 6);
insert into Beers values (10, 'Melbourne Bitter', 6);
insert into Beers values (11, 'New', 8);
insert into Beers values (12, 'Nirvana Pale Ale',7);
insert into Beers values (13, 'Old', 8);
insert into Beers values (14, 'Old Admiral', 9);
insert into Beers values (15, 'Pale Ale', 3);
insert into Beers values (16, 'Pilsener', 2);
insert into Beers values (17, 'Porter', 2);
insert into Beers values (18, 'Premium Lager', 12);
insert into Beers values (19, 'Red', 8);
insert into Beers values (20, 'Sink the Bismarck', 10);
insert into Beers values (21, 'Sheaf Stout', 8);
insert into Beers values (22, 'Sparkling Ale', 11);
insert into Beers values (23, 'Stout', 11);
insert into Beers values (24, 'Tactical Nuclear Penguin', 10);
insert into Beers values (25, 'Three Sheets', 9);
insert into Beers values (26, 'Victoria Bitter', 6);


insert into Bars values (1, 'Australia Hotel', 'The Rocks', '123456');
insert into Bars values (2, 'Coogee Bay Hotel', 'Coogee', '966500');
insert into Bars values (3, 'Lord Nelson', 'The Rocks', '123888');
insert into Bars values (4, 'Marble Bar', 'Sydney', '122123');
insert into Bars values (5, 'Regent Hotel', 'Kingsford', '987654');
insert into Bars values (6, 'Royal Hotel', 'Randwick', '938500');
insert into Bars values (7, 'Local Taphouse', 'Darlinghurst', '111111');


insert into Drinkers values (12, 'Adam', 'Randwick', '9385-4444');
insert into Drinkers values (15, 'Gernot', 'Newtown', '9415-3378');
insert into Drinkers values (42, 'John', 'Clovelly', '9665-1234');
insert into Drinkers values (33, 'Justin', 'Mosman', '9845-4321');


insert into Likes values (12, 6);
insert into Likes values (12, 7);
insert into Likes values (12, 11);
insert into Likes values (15, 18);
insert into Likes values (15, 22);
insert into Likes values (42, 1);
insert into Likes values (42, 2);
insert into Likes values (42, 15);
insert into Likes values (42, 20);
insert into Likes values (42, 25);
insert into Likes values (33, 22);
insert into Likes values (33, 26);


insert into Sells values (1, 4, 3.50);
insert into Sells values (1, 11, 3.00);
insert into Sells values (2, 11, 2.25);
insert into Sells values (2, 13, 2.50);
insert into Sells values (2, 22, 2.80);
insert into Sells values (2, 26, 2.30);
insert into Sells values (3, 25, 3.75);
insert into Sells values (3, 11, 3.00);
insert into Sells values (3, 14, 3.75);
insert into Sells values (4, 11, 2.80);
insert into Sells values (4, 13, 2.90);
insert into Sells values (4, 26, 2.80);
insert into Sells values (5, 11, 2.20);
insert into Sells values (5, 26, 2.20);
insert into Sells values (6, 11, 2.30);
insert into Sells values (6, 13, 2.65);
insert into Sells values (6, 26, 2.30);
insert into Sells values (7, 15, 7.50);
insert into Sells values (7, 20, 25.00);


insert into Frequents values (12, 2);
insert into Frequents values (15, 3);
insert into Frequents values (15, 6);
insert into Frequents values (42, 2);
insert into Frequents values (42, 3);
insert into Frequents values (42, 1);
insert into Frequents values (42, 7);
insert into Frequents values (33, 5);
insert into Frequents values (33, 4);

