
SELECT county_name,state_name,estimates_base_2010 as pop, 2010 as year FROM us_counties_pop_est_2010
UNION 
SELECT county_name,state_name,pop_est_2019 as pop, 2019 as year FROM us_counties_pop_est_2019
ORDER BY county_name,
year
