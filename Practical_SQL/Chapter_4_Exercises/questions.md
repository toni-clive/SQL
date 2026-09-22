

Your company delivers fruit and vegetables to local grocery stores, and you need to  track the mileage driven by each driver each day to a tenth of a mile. Assuming no  driver would ever travel more than 999 miles in a day, what would be an appropriate  data type for the mileage column in your table? Why? numeric(precision of 4, scale 1) due to the requirement of being able to monitor 1 tenth of a mile.

In the table listing each driver in your company, what are appropriate data types for the  drivers’ first and last names? Why is it a good idea to separate first and last names into  two columns rather than having one larger name column? varchar with a large length and two seperate columns to ensure accuracy also with just one column an entry could be missing a space


Assume you have a text column that includes strings formatted as dates. One of the  strings is written as '4//2021'. What will happen when you try to convert that string to  the timestamp data type?  Error will advise regarding the format error
