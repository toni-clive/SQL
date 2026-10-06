COPY(SELECT county_name,state_name,births_2019 
FROM us_counties_pop_est_2019 ORDER BY births_2019 DESC
LIMIT 20)
TO '/Users/clivepato/Documents/SQL/Practical_SQL/Chapter_5_Exercises/5_2.csv'
WITH (FORMAT CSV, HEADER)