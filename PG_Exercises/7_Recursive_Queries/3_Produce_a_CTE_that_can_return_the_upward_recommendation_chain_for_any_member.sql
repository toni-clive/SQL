-- https://pgexercises.com/questions/recursive/getupwardall.html
/*
with recursive recommenders(recommender) as (
	select recommendedby from cd.members where memid = 12
	union all
	select mems.recommendedby
		from recommenders recs
		inner join cd.members mems
			on mems.memid = recs.recommender
),
 recommenders2(recommender) as (
	select recommendedby from cd.members where memid = 22
	union all
	select mems.recommendedby
		from recommenders2 recs
		inner join cd.members mems
			on mems.memid = recs.recommender
)
select m.member,recs.recommender, mems.firstname, mems.surname
	from recommenders recs
	inner join cd.members mems
		on recs.recommender = mems.memid cross join (select 12 as member) m
UNION ALL
select x.member,recs2.recommender, mems.firstname, mems.surname
	from recommenders2 recs2
	inner join cd.members mems
		on recs2.recommender = mems.memid cross join (select 22 as member) x
order by member 
*/

-- attempt no 2 

WITH RECURSIVE r(member,recommender) AS 
(SELECT memid,recommendedBy FROM cd.members  
 UNION ALL
 SELECT r.member, f.recommendedBy FROM r 
 JOIN cd.members f ON r.recommender = f.memid
)
 
 SELECT member,recommender,x.firstname,x.surname FROM r JOIN cd.members x
ON recommender = x.memid 
 WHERE member IN (12,22)
ORDER BY member,recommender DESC
