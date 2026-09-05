-- https://pgexercises.com/questions/aggregates/fachours3.html

SELECT f.facid,f.name,ROUND(1.0*SUM(b.slots)/2,2) AS "Total Hours"
 FROM cd.facilities f 
 JOIN cd.bookings b ON 
f.facid = b.facid GROUP BY f.facid,f.name ORDER BY facid