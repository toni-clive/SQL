-- https://pgexercises.com/questions/aggregates/payback.html

SELECT f.name,f.initialoutlay/((1.*
SUM(CASE WHEN b.memid = 0 THEN b.slots*f.guestcost ELSE b.slots*f.membercost END))/3 - f.monthlymaintenance) months
FROM cd.bookings b JOIN cd.facilities f on f.facid = b.facid
GROUP BY f.name,f.monthlymaintenance,f.initialoutlay
ORDER BY f.name 
 