

COPY chapter_5
FROM '/Users/clivepato/Documents/SQL/Practical_SQL/Chapter_5_Exercises/movies.txt'
WITH (FORMAT CSV, HEADER, DELIMITER ':',QUOTE '#');