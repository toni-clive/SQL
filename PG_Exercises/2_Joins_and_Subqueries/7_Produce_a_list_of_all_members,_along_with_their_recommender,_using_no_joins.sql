-- https://pgexercises.com/questions/joins/sub.html

SELECT DISTINCT firstname ||  ' ' || surname member,CASE WHEN recommendedBY 
IS NOT NULL THEN (SELECT firstname ||  ' ' || surname FROM cd.members
				  WHERE x.recommendedBY = memid) 
ELSE '' END
recommender  FROM cd.members x