-- https://pgexercises.com/questions/basic/union.html

SELECT surname FROM cd.members
UNION 
SELECT name FROM cd.facilities