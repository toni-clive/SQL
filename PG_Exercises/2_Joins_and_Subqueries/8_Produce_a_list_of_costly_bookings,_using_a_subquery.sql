-- https://pgexercises.com/questions/joins/tjsub.html

SELECT * FROM
(SELECT(SELECT cd.members.firstname || ' ' || cd.members.surname as member FROM cd.members WHERE memid IN(  SELECT cd.bookings.memid FROM cd.members)),
 (SELECT name FROM cd.facilities WHERE cd.bookings.facid
							 = cd.facilities.facid) ,slots * (CASE WHEN memid != 0 THEN
							(SELECT membercost FROM cd.facilities WHERE cd.bookings.facid
							 = cd.facilities.facid) 
							
							ELSE
							(SELECT guestcost FROM cd.facilities WHERE cd.bookings.facid
							 = cd.facilities.facid) END) cost
							FROM cd.bookings WHERE 
		starttime >= '2012-09-14' and 
		starttime < '2012-09-15' ORDER BY cost DESC) a WHERE cost>30