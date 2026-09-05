-- https://pgexercises.com/questions/aggregates/facrev3.html

SELECT f.name,DENSE_RANK() OVER(ORDER BY SUM(CASE WHEN b.memid = 0 THEN b.slots * f.guestcost ELSE b.slots * f.membercost END)DESC) rank
FROM cd.facilities f JOIN cd.bookings b ON f.facid = b.facid GROUP BY f.facid LIMIT 3								 
	 