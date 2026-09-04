-- https://pgexercises.com/questions/joins/simplejoin2.html


SELECT cd.bookings.starttime start,cd.facilities.name FROM cd.bookings JOIN cd.facilities ON
cd.facilities.facid = cd.bookings.facid WHERE cd.bookings.starttime >= '2012-09-21'
AND cd.bookings.starttime < '2012-09-22'
AND cd.facilities.name LIKE 'Tennis%' ORDER BY cd.bookings.starttime