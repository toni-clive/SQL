-- https://pgexercises.com/questions/aggregates/fachoursbymonth.html


SELECT facid,sum(slots) AS "Total Slots" 
FROM cd.bookings
WHERE starttime >= '2012-09-01' AND starttime < '2012-10-01'
group by facid order by "Total Slots"