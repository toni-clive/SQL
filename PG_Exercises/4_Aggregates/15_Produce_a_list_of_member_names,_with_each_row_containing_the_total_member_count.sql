-- https://pgexercises.com/questions/aggregates/countmembers.html

SELECT (SELECT COUNT(*) FROM cd.members), firstname,surname FROM cd.members ORDER BY joindate