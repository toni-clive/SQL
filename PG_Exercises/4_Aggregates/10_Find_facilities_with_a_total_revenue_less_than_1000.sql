-- https://pgexercises.com/questions/aggregates/facrev2.html

SELECT f.name,SUM(CASE WHEN b.memid = 0 THEN b.slots*f.guestcost ELSE b.slots*f.membercost END) revenue
FROM cd.bookings b JOIN cd.facilities f on f.facid = b.facid 
GROUP BY f.name 
HAVING SUM(CASE WHEN b.memid = 0 THEN b.slots*f.guestcost ELSE b.slots*f.membercost END) < 1000 ORDER BY revenue