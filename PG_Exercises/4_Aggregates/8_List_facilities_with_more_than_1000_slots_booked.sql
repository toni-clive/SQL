-- https://pgexercises.com/questions/aggregates/fachours1a.html

SELECT facid,SUM(slots) AS "Total Slots" FROM cd.bookings GROUP BY facid 
HAVING SUM(slots)>1000 ORDER BY facid