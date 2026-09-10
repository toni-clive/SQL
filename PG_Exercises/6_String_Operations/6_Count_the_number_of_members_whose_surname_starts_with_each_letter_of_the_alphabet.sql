-- https://pgexercises.com/questions/string/substr.html

SELECT SUBSTR(surname,1,1) letter,COUNT(*) FROM cd.members GROUP BY letter ORDER BY letter