-- https://pgexercises.com/questions/aggregates/count3.html

SELECT recommendedby,count(*) FROM cd.members
WHERE recommendedby IS NOT NULL GROUP BY recommendedby  ORDER BY recommendedby