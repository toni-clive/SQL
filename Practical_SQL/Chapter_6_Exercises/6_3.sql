SELECT state_name,percentile_cont(0.5) WITHIN GROUP (ORDER BY pop_est_2019) median FROM us_counties_pop_est_2019 WHERE state_name IN( 'New York','California') GROUP BY state_name
