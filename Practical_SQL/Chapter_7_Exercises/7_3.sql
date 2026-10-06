SELECT percentile_cont(0.5) 
WITHIN GROUP (ORDER BY ROUND((pop_est_2019::numeric-estimates_base_2010)/estimates_base_2010*100,1))
percent_change
FROM us_counties_pop_est_2010 u10 JOIN us_counties_pop_est_2019 u19
ON u10.state_fips = u19.state_fips AND u10.county_fips = u19.county_fips 