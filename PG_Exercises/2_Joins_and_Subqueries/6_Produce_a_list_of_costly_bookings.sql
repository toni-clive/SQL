-- https://pgexercises.com/questions/joins/threejoin2.html



SELECT member,facility,cost FROM(SELECT CONCAT(m.firstname , ' ' , m.surname) member,f.name facility,
CASE WHEN 
b.memid = 0 THEN (f.guestcost*(b.slots))
WHEN b.memid != 0 AND f.membercost > 0
AND f.membercost*b.slots > 30 THEN f.membercost*b.slots
END cost
FROM cd.bookings b JOIN cd.facilities f ON b.facid = f.facid
JOIN cd.members m  ON m.memid = b.memid 
WHERE 
(b.starttime >= '2012-09-14' and b.starttime < '2012-09-15') 
ORDER BY cost DESC) a where cost IS NOT NULL