-- https://pgexercises.com/questions/date/daysremaining.html

SELECT ('2012-03-01' - '2012-02-11 01:00:00'::date)::int ||' ' || 'days' as remaining