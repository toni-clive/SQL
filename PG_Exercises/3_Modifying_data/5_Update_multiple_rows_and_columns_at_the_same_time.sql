-- https://pgexercises.com/questions/updates/updatemultiple.html

UPDATE cd.facilities
SET membercost = 6, guestcost = 30
WHERE name LIKE 'Tennis%';