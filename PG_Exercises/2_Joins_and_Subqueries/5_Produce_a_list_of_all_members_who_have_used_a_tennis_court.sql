-- https://pgexercises.com/questions/joins/threejoin.html


SELECT 
DISTINCT CONCAT(cd.members.firstname, ' ',cd.members.surname) as member,cd.facilities.name
FROM cd.members JOIN cd.bookings
ON cd.members.memid = cd.bookings.memid JOIN cd.facilities ON 
cd.bookings.facid = cd.facilities.facid WHERE cd.facilities.name LIKE 'Tennis%'