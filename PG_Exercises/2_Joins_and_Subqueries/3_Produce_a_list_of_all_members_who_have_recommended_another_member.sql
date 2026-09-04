-- https://pgexercises.com/questions/joins/self.html


SELECT DISTINCT cd.members.firstname,cd.members.surname FROM cd.members 
JOIN cd.members x ON x.recommendedby = cd.members.memid 
ORDER BY surname,firstname