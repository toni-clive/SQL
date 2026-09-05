-- https://pgexercises.com/questions/aggregates/fachours4.html

SELECT facid,total FROM
(SELECT DENSE_RANK() OVER(ORDER BY SUM(SLOTS)DESC ),facid,SUM(SLOTS) total FROM cd.bookings GROUP BY facid) a
WHERE dense_rank = 1