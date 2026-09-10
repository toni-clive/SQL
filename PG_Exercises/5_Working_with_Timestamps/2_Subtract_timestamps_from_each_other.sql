-- https://pgexercises.com/questions/date/interval.html

SELECT * FROM generate_series(
    '2012-10-01'::timestamp, 
    '2012-10-31'::timestamp, 
    '1 day'::interval 
) ts;