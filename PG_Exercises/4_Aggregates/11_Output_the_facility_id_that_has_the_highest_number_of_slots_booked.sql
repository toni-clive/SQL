-- https://pgexercises.com/questions/aggregates/fachours2.html

SELECT facid,sum FROM (SELECT facid,SUM(slots),DENSE_RANK() OVER(ORDER BY SUM(slots) DESC) r
FROM cd.bookings GROUP BY facid) a WHERE r = 1