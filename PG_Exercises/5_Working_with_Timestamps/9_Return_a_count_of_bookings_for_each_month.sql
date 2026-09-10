-- https://pgexercises.com/questions/date/bookingspermonth.html

SELECT date_trunc('month', starttime) AS month ,COUNT(slots) 
FROM cd.bookings group by date_trunc('month', starttime) 
ORDER BY month