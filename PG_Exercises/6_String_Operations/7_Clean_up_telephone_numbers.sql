-- https://pgexercises.com/questions/string/translate.html

SELECT memid,REGEXP_REPLACE(telephone,'[\(\)\-, ]','',1,0) FROM cd.members