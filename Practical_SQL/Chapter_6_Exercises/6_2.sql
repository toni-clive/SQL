

SELECT county_name, births_2019, deaths_2019, 1.*births_2019/ deaths_2019 ratio
FROM us_counties_pop_est_2019 WHERE state_name = 'New York' ORDER BY ratio DESC