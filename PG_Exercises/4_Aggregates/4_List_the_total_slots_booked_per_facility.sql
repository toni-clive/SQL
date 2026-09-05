-- https://pgexercises.com/questions/aggregates/fachours.html

SELECT facid,sum(slots) AS 'Total Slots' FROM cd.bookings group by facid order by facid