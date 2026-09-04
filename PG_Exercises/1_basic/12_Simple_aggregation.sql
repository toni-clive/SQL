-- https://pgexercises.com/questions/basic/agg2.html

SELECT firstname,surname,joindate FROM cd.members ORDER BY joindate DESC LIMIT 1

SELECT firstname,surname,joindate FROM cd.members WHERE joindate = (SELECT MAX(joindate) FROM cd.members)