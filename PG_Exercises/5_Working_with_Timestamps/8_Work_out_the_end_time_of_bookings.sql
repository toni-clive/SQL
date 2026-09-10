-- https://pgexercises.com/questions/date/endtimes.html

SELECT starttime,starttime+ interval '30 minutes '* slots AS endtime FROM cd.bookings ORDER BY endtime DESC,starttime DESC LIMIT 10
