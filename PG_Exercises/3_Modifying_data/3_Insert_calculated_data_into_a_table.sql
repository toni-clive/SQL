-- https://pgexercises.com/questions/updates/insert3.html

INSERT INTO cd.facilities
(facid,Name, membercost,
 guestcost, initialoutlay,
 monthlymaintenance)
VALUES ( (SELECT MAX(facid) FROM cd.facilities)+1,'Spa',20,  30,100000,  800)
