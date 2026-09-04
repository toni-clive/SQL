-- https://pgexercises.com/questions/basic/where4.html

SELECT * FROM cd.facilities WHERE facid  IN (1,5)

SELECT * FROM cd.facilities WHERE facid  = 1 OR facid = 5