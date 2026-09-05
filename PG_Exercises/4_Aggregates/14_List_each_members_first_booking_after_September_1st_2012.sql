-- https://pgexercises.com/questions/aggregates/nbooking.html

SELECT m.surname,m.firstname,m.memid,MIN(b.starttime)
FROM cd.members m join cd.bookings b on
m.memid = b.memid
WHERE starttime > '2012-09-01'
GROUP BY m.surname,m.firstname,m.memid
ORDER BY memid