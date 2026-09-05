-- https://pgexercises.com/questions/aggregates/rankmembers.html

SELECT m.firstname,m.surname,
ROUND(SUM(b.slots) /2.0/10)*10
AS hours
 , RANK() OVER(ORDER BY ROUND(SUM(b.slots) /2.0/10)*10 DESC) rank
FROM cd.members m LEFT JOIN cd.bookings b ON m.memid = b.memid 
GROUP BY m.firstname,m.surname
ORDER BY 
hours DESC,surname,firstname
