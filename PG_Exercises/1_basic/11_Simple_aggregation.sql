-- https://pgexercises.com/questions/basic/agg.html

SELECT joindate AS latest FROM cd.members ORDER BY joindate DESC LIMIT 1

SELECT MAX(joindate) FROM cd.members