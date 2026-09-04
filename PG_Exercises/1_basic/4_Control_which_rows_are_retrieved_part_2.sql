-- https://pgexercises.com/questions/basic/where2.html

SELECT facid,	name,	membercost,	monthlymaintenance FROM cd.facilities WHERE membercost
membercost > 0 AND < monthlymaintenance/50.0