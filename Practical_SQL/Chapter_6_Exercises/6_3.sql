 SELECT 'New York' as state,percentile_cont(0.5) WITHIN GROUP (ORDER BY pop_est_2019) median FROM us_counties_pop_est_2019 WHERE state_name = 'New York'
 UNION 
  SELECT 'California' as state,percentile_cont(0.5) WITHIN GROUP (ORDER BY pop_est_2019)  FROM us_counties_pop_est_2019 WHERE state_name = 'California' ORDER BY median DESC;