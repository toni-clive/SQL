-- https://pgexercises.com/questions/date/daysinmonth.html

WITH m as (SELECT GENERATE_SERIES(1,12) AS month),
 fd as( SELECT CAST(GENERATE_SERIES(TIMESTAMP '2012-01-01','2012-12-01','1 month') AS DATE) AS date)
SELECT month,fd.date + interval '1 month' -fd.date AS length FROM m JOIN fd ON m.month = EXTRACT(month FROM fd.date)