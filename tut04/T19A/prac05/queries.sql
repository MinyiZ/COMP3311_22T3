-- COMP3311 18s1 Prac 05 Exercises

-- Q1. What beers are made by Toohey's?

create or replace view Q1 as
select be.name
from beers be
join brewers br on (be.brewer = br.id)
where br.name = 'Toohey''s'
;

-- -- Q2. Show beers with headings "Beer", "Brewer".

-- create or replace view Q2 as
-- select ...
-- from   ...
-- where  ...
-- ;

-- -- Q3. Find the brewers whose beers John likes.

create or replace view Q3 as
select br.name
from beers be
join brewers br on (be.brewer = br.id)
join likes l on (l.beer = be.id)
join drinkers d on (d.id = l.drinker)
where d.name = 'John'
;

-- -- Q4. How many different beers are there?

create or replace view Q4 as
select count(*)
from   beers;
;

-- -- Q5. How many different brewers are there?

-- create or replace view Q5 as
-- select ...
-- from   ...
-- where  ...
-- ;

-- -- Q6. Find pairs of beers by the same manufacturer
-- --     (but no pairs like (a,b) and (b,a), and no (a,a))

create or replace view Q6 as
select b1.name as a, b2.name as b
from beers b1
join beers b2 on (b1.brewer = b2.brewer)
where b1.name < b2.name
;

-- -- Q7. How many beers does each brewer make?

-- create or replace view Q7 as
-- select ...
-- from   ...
-- where  ...
-- ;

-- -- Q8. Which brewer makes the most beers?

-- create or replace view Q8 as
-- select ...
-- from   ...
-- where  ...
-- ;

-- -- Q9. Beers that are the only one by their brewer.

-- create or replace view Q9 as
-- select ...
-- from   ...
-- where  ...
-- ;

-- -- Q10. Beers sold at bars where John drinks.

-- create or replace view Q10 as
-- select ...
-- from   ...
-- where  ...
-- ;

-- Q11. Bars where either Gernot or John drink.

create or replace view bars_and_drinkers as
select b.name as bar, d.name as drinker
from frequents f
join drinkers d on (f.drinker = d.id)
join bars b on (f.bar = b.id)
;

create or replace view Q11 as
select bar from bars_and_drinkers where drinker = 'Gernot'
union
select bar from bars_and_drinkers where drinker = 'John'
;

-- -- Q12. Bars where both Gernot and John drink.

create or replace view Q12 as
select bar from bars_and_drinkers where drinker = 'Gernot'
intersect
select bar from bars_and_drinkers where drinker = 'John'
;

-- Q13. Bars where John drinks but Gernot doesn't

create or replace view Q13 as
select bar from bars_and_drinkers where drinker = 'John'
except
select bar from bars_and_drinkers where drinker = 'Gernot'
;

-- -- Q14. What is the most expensive beer?

-- create or replace view Q14 as
-- select ...
-- from   ...
-- where  ...
-- ;

-- -- Q15. Find bars that serve New at the same price
-- --      as the Coogee Bay Hotel charges for VB.

-- create or replace view Q15 as
-- select ...
-- from   ...
-- where  ...
-- ;

-- -- Q16. Find the average price of common beers
-- --      ("common" = served in more than two hotels).

-- create or replace view Q16 as
-- select ...
-- from   ...
-- where  ...
-- ;

-- -- Q17. Which bar sells 'New' cheapest?

-- create or replace view Q17 as
-- select ...
-- from   ...
-- where  ...
-- ;

-- -- Q18. Which bar is most popular? (Most drinkers)

-- create or replace view Q18 as
-- select ...
-- from   ...
-- where  ...
-- ;

-- -- Q19. Which bar is least popular? (May have no drinkers)

-- create or replace view Q19 as
-- select ...
-- from   ...
-- where  ...
-- ;

-- -- Q20. Which bar is most expensive? (Highest average price)

-- create or replace view Q20 as
-- select ...
-- from   ...
-- where  ...
-- ;

-- -- Q21. Which beers are sold at all bars?

-- create or replace view Q21 as
-- select ...
-- from   ...
-- where  ...
-- ;

-- -- Q22. Price of cheapest beer at each bar?

-- create or replace view Q22 as
-- select ...
-- from   ...
-- where  ...
-- ;

-- -- Q23. Name of cheapest beer at each bar?

-- create or replace view Q23 as
-- select ...
-- from   ...
-- where  ...
-- ;

-- -- Q24. How many drinkers are in each suburb?

-- create or replace view Q24 as
-- select ...
-- from   ...
-- where  ...
-- ;

-- -- Q25. How many bars in suburbs where drinkers live?
-- --      (Must include suburbs with no bars)

-- create or replace view Q25 as
-- select ...
-- from   ...
-- where  ...
-- ;
