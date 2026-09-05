[Link](https://pgexercises.com/)


A list of the PG Exercise problem's I'm working on or completed. <br> 
In order to reuse the completed challenges again for revision a brief sentence is added to the comments.

# Section 

## Basic 
## Simple SQL Queries
| Name | Status | Comment |
| ---- | ------ | ------- |
| [Retrieve everything from a table](https://pgexercises.com/questions/basic/selectall.html) | &nbsp;&nbsp;  | SELECT / TABLE  |
| [Retrieve specific columns from a table](https://pgexercises.com/questions/basic/selectspecific.html) | &nbsp;&nbsp;  | SELECT Statement specify the columns required |
| [Control which rows are retrieved](https://pgexercises.com/questions/basic/where.html) | &nbsp;&nbsp; | SELECT Statement THEN use a WHERE clause to filter results |
| [Control which rows are retrieved - part 2](https://pgexercises.com/questions/basic/where2.html) | &nbsp;&nbsp; | SELECT Statement specify the columns required THEN use a WHERE clause to filter results |
| [Basic string searches](https://pgexercises.com/questions/basic/where3.html) | &nbsp;&nbsp;  | SELECT Statement specify the columns required THEN use a WHERE clause to filter results |
| [Matching against multiple possible values](https://pgexercises.com/questions/basic/where4.html) | &nbsp;&nbsp; | SELECT Statement specify the columns required THEN use a WHERE clause to filter results |
| [Classify results into buckets](https://pgexercises.com/questions/basic/classify.html) | &nbsp;&nbsp; | SELECT Statement specify the columns required THEN use CASE WHEN to generate a column |
| [Working with dates](https://pgexercises.com/questions/basic/date.html) | &nbsp;&nbsp; | SELECT Statement specify the columns required THEN use a WHERE clause to filter results |
| [Removing duplicates, and ordering results](https://pgexercises.com/questions/basic/unique.html) | &nbsp;&nbsp;  | SELECT + DISTINCT THEN ORDER Statement  |
| [Combining results from multiple queries](https://pgexercises.com/questions/basic/union.html) | &nbsp;&nbsp;  | SELECT + UNION |
| [Simple aggregation](https://pgexercises.com/questions/basic/agg.html) | &nbsp;&nbsp; | SELECT + ORDER BY / SELECT + aggregation function  |
| [More aggregation](https://pgexercises.com/questions/basic/agg2.html) | &nbsp;&nbsp; | SELECT + ORDER BY / SELECT + aggregation function |

## Joins and Subqueries
| Name | Status | Comment |
| ---- | ------ | ------- |
| [Retrieve the start times of members' bookings](https://pgexercises.com/questions/joins/simplejoin.html) | &nbsp;&nbsp;  | JOIN clause & where to filter results |
| [Work out the start times of bookings for tennis courts](https://pgexercises.com/questions/joins/simplejoin2.html) | &nbsp;&nbsp; | JOIN clause & where to filter results |
| [Produce a list of all members who have recommended another member](https://pgexercises.com/questions/joins/self.html) | &nbsp;&nbsp; | JOIN clause AND DISTINCT SELECT to avoid duplicates  |
| [Produce a list of all members, along with their recommender](https://pgexercises.com/questions/joins/self2.html) | &nbsp;&nbsp; | LEFT JOIN clause |
| [Produce a list of all members who have used a tennis court](https://pgexercises.com/questions/joins/threejoin.html) | &nbsp;&nbsp; | JOIN then JOIN again |
| [Produce a list of costly bookings](https://pgexercises.com/questions/joins/threejoin2.html) | &nbsp;&nbsp; | JOIN then JOIN again |
| [Produce a list of all members, along with their recommender, using no joins.](https://pgexercises.com/questions/joins/sub.html) | &nbsp;&nbsp; | Subquery |
| [Produce a list of costly bookings, using a subquery](https://pgexercises.com/questions/joins/tjsub.html) |  &nbsp;&nbsp; | Apply a subquery to the following solution Produce a list of costly bookings |

## Modifying data
| Name | Status | Comment |
| ---- | ------ | ------- |
| [Insert some data into a table](https://pgexercises.com/questions/updates/insert.html) | &nbsp;&nbsp; | INSERT statement provide the values needed |
| [Insert multiple rows of data into a table](https://pgexercises.com/questions/updates/insert2.html) | &nbsp;&nbsp; | INSERT statement provide the values needed |
| [Insert calculated data into a table](https://pgexercises.com/questions/updates/insert3.html) | &nbsp;&nbsp; | INSERT statement + SELECT statement |
| [Update some existing data](https://pgexercises.com/questions/updates/update.html) | &nbsp;&nbsp; | UPDATE statement + SET |
| [Update multiple rows and columns at the same time](https://pgexercises.com/questions/updates/updatemultiple.html) | &nbsp;&nbsp; | UPDATE statement + SET |
| [Update a row based on the contents of another row](https://pgexercises.com/questions/updates/updatecalculated.html) | &nbsp;&nbsp; | UPDATE statement + SET |
| [Delete all bookings](https://pgexercises.com/questions/updates/delete.html) | &nbsp;&nbsp; | DELETE statement |
| [Delete a member from the cd.members table](https://pgexercises.com/questions/updates/deletewh.html) | &nbsp;&nbsp; | DELETE statement + WHERE clause  |
| [Delete based on a subquery](https://pgexercises.com/questions/updates/deletewh2.html) | &nbsp;&nbsp; | DELETE statement + WHERE clause |

## Aggregates
| Name | Status | Comment |
| ---- | ------ | ------- |
| [Count the number of facilities](https://pgexercises.com/questions/aggregates/count.html) |  |  |
| [Count the number of expensive facilities](https://pgexercises.com/questions/aggregates/count2.html) |  |  |
| [Count the number of recommendations each member makes.](https://pgexercises.com/questions/aggregates/count3.html) |  |  |
| [List the total slots booked per facility](https://pgexercises.com/questions/aggregates/fachours.html) |  |  |
| [List the total slots booked per facility in a given month](https://pgexercises.com/questions/aggregates/fachoursbymonth.html) |  |  |
| [List the total slots booked per facility per month](https://pgexercises.com/questions/aggregates/fachoursbymonth2.html) |  |  |
| [Find the count of members who have made at least one booking](https://pgexercises.com/questions/aggregates/members1.html) |  |  |
| [List facilities with more than 1000 slots booked](https://pgexercises.com/questions/aggregates/fachours1a.html) |  |  |
| [Find the total revenue of each facility](https://pgexercises.com/questions/aggregates/facrev.html) |  |  |
| [Find facilities with a total revenue less than 1000](https://pgexercises.com/questions/aggregates/facrev2.html) |  |  |
| [Output the facility id that has the highest number of slots booked](https://pgexercises.com/questions/aggregates/fachours2.html) |  |  |
| [List the total slots booked per facility per month, part 2](https://pgexercises.com/questions/aggregates/fachoursbymonth3.html) |  |  |
| [List the total hours booked per named facility](https://pgexercises.com/questions/aggregates/fachours3.html) |  |  |
| [List each member's first booking after September 1st 2012](https://pgexercises.com/questions/aggregates/nbooking.html) |  |  |
| [Produce a list of member names, with each row containing the total member count](https://pgexercises.com/questions/aggregates/countmembers.html) |  |  |
| [Produce a numbered list of members](https://pgexercises.com/questions/aggregates/nummembers.html) |  |  |
| [Output the facility id that has the highest number of slots booked, again](https://pgexercises.com/questions/aggregates/fachours4.html) |  |  |
| [Rank members by (rounded) hours used](https://pgexercises.com/questions/aggregates/rankmembers.html) |  |  |
| [Find the top three revenue generating facilities](https://pgexercises.com/questions/aggregates/facrev3.html) |  |  |
| [Classify facilities by value](https://pgexercises.com/questions/aggregates/classify.html) |  |  |
| [Calculate the payback time for each facility](https://pgexercises.com/questions/aggregates/payback.html) |  |  |
| [Calculate a rolling average of total revenue](https://pgexercises.com/questions/aggregates/rollingavg.html) |  |  |

## String Operations
| Name | Status | Comment |
| ---- | ------ | ------- |
| [Format the names of members](https://pgexercises.com/questions/string/concat.html) |  |  |
| [Find facilities by a name prefix](https://pgexercises.com/questions/string/like.html) |  |  |
| [Perform a case-insensitive search](https://pgexercises.com/questions/string/case.html) |  |  |
| [Find telephone numbers with parentheses](https://pgexercises.com/questions/string/reg.html) |  |  |
| [Pad zip codes with leading zeroes](https://pgexercises.com/questions/string/pad.html) |  |  |
| [Count the number of members whose surname starts with each letter of the alphabet](https://pgexercises.com/questions/string/substr.html) |  |  |
| [Clean up telephone numbers](https://pgexercises.com/questions/string/translate.html) |  |  |

## Working with Timestamps
| Name | Status | Comment |
| ---- | ------ | ------- |
| [Produce a timestamp for 1 a.m. on the 31st of August 2012](https://pgexercises.com/questions/date/timestamp.html) |  |  |
| [Subtract timestamps from each other](https://pgexercises.com/questions/date/interval.html) |  |  |
| [Generate a list of all the dates in October 2012](https://pgexercises.com/questions/date/series.html) |  |  |
| [Get the day of the month from a timestamp](https://pgexercises.com/questions/date/extract.html) |  |  |
| [Work out the number of seconds between timestamps](https://pgexercises.com/questions/date/interval2.html) |  |  |
| [Work out the number of days in each month of 2012](https://pgexercises.com/questions/date/daysinmonth.html) |  |  |
| [Work out the number of days remaining in the month](https://pgexercises.com/questions/date/daysremaining.html) |  |  |
| [Work out the end time of bookings](https://pgexercises.com/questions/date/endtimes.html) |  |  |
| [Return a count of bookings for each month](https://pgexercises.com/questions/date/bookingspermonth.html) |  |  |
| [Work out the utilisation percentage for each facility by month](https://pgexercises.com/questions/date/utilisationpermonth.html) |  |  |

## Recursive Queries
| Name | Status | Comment |
| ---- | ------ | ------- |
| [Find the upward recommendation chain for member ID 27](https://pgexercises.com/questions/recursive/getupward.html) |  |  |
| [Find the downward recommendation chain for member ID 1](https://pgexercises.com/questions/recursive/getdownward.html) |  |  |
| [Produce a CTE that can return the upward recommendation chain for any member](https://pgexercises.com/questions/recursive/getupwardall.html) |  |  |