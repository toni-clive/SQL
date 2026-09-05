-- https://pgexercises.com/questions/joins/self2.html

SELECT m.firstname AS memfname, m.surname AS memsname, rec.firstname AS recfname, rec.surname AS recsname 
FROM cd.members AS m LEFT JOIN cd.members AS rec ON m.recommendedBY = rec.memid ORDER BY memsname,memfname
