-- https://pgexercises.com/questions/string/pad.html

SELECT LPAD(zipcode::varchar,5,'0') zipcode FROM cd.members ORDER BY zipcode