-- https://pgexercises.com/questions/date/extract.html

SELECT ROUND(EXTRACT(EPOCH FROM '2012-09-02 00:00:00'::timestamp)- EXTRACT(EPOCH FROM '2012-08-31 01:00:00'::timestamp),0)