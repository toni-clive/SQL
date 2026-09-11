-- https://pgexercises.com/questions/recursive/getupward.html

WITH RECURSIVE r(recommender) AS 
(SELECT recommendedby FROM cd.members WHERE memid = 27
UNION ALL
SELECT x.recommendedby FROM cd.members x JOIN r ON r.recommender = x.memid)
SELECT r.recommender,x.firstname,x.surname 
FROM r JOIN cd.members x ON r.recommender = x.memid