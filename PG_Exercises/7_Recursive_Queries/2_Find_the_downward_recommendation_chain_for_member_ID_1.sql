-- https://pgexercises.com/questions/recursive/getdownward.html


with recursive r as (
    SELECT memid FROM cd.members WHERE recommendedBY = 1
    UNION ALL
	SELECT x.memid FROM cd.members x JOIN r ON r.memid = x.recommendedBy)
    
SELECT x.memid,firstname, surname FROM r JOIN cd.members x ON x.memid = r.memid ORDER BY x.memid