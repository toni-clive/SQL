-- https://pgexercises.com/questions/aggregates/count2.html

SELECT COUNT(*) FILTER(WHERE guestcost > 10) FROM cd.facilities