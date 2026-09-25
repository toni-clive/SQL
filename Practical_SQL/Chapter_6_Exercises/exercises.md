1. Write a SQL statement for calculating the area of a circle whose radius is 5 inches. (If  you don’t remember the formula, it’s an easy web search.) Do you need parentheses in  your calculation? Why or why not?

SELECT PI()*5^2 AS area_circle

No parentheses required as due to the order of operations, although for clarity you could apply

SELECT PI()*(5^2) AS area_circle

2.  Using the 2019 US Census county estimates data, calculate a ratio of births to deaths  for each county in New York state. Which region of the state generally saw a higher  ratio of births to deaths in 2019?

SELECT county_name,state_name,births_2019,deaths_2019, births_2019::numeric/ deaths_2019 ratio FROM us_counties_pop_est_2019
WHERE deaths_2019 > 0 AND state_name IN ('New York') ORDER BY ratio DESC

3.  Was the 2019 median county population estimate higher in California or New York? 

SELECT state_name, percentile_cont(.5) WITHIN GROUP(ORDER BY pop_est_2019)  FROM us_counties_pop_est_2019
WHERE state_name IN ('New York','California') 
 GROUP BY state_name
