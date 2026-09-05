-- https://pgexercises.com/questions/aggregates/classify.html

SELECT name,
CASE WHEN rank = 1 THEN 'high' WHEN rank = 2 
THEN 'average' ELSE 'low' END revenue 
FROM (SELECT f.name,
	  NTILE(3) OVER(ORDER BY SUM(CASE WHEN b.memid = 0 THEN b.slots * f.guestcost ELSE b.slots * f.membercost END)DESC) rank
FROM cd.facilities f JOIN cd.bookings b ON f.facid = b.facid GROUP BY f.facid ORDER BY rank,f.name) a