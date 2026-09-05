-- https://pgexercises.com/questions/updates/deletewh2.html

DELETE FROM cd.members WHERE memid NOT IN (SELECT memid FROM cd.bookings)