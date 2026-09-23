 1. Write a WITH statement to include with COPY to handle the import of an
 imaginary text file whose first couple of rows look like this:

id:movie:actor
50:#Mission: Impossible#:Tom Cruise

```SQL
COPY movies
FROM 'location goes here/filename.txt'
WITH(FORMAT CSV,HEADER,DELIMITER ':',QUOTE '#');
```

2. Using the table us_counties_pop_est_2019 you created and filled in this
chapter, export to a CSV file the 20 counties in the United States that had
the most births. Make sure you export only each county’s name, state, and
number of births. (Hint: births are totaled for each county in the column
births_2019.)

```SQL
COPY (SELECT county_name, state_name, births_2019 FROM us_counties_pop_est_2019
ORDER BY births_2019 DESC LIMIT 20)
TO ''
WITH(FORMAT CSV, HEADER)

```
3. Imagine you’re importing a file that contains a column with these values:  17519.668  20084.461  18976.335  Will a column in your target table with data type numeric(3,8) work for these values?  Why or why not? 

It won't work due to the precision needing to be larger than the scale with this setup the only number that is 0
