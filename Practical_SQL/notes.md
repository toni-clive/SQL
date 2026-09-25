# [Practical SQL: A Beginner's Guide to Storytelling with Data](https://practicalsql.com/)

Notes for useful info I've picked up from the book, this book focuses on using Postgres.

## Chapter 1 

Includes links Github repo for ahead, also includes the following IDE recommendations,Postgres link/setup and PGadmin.

Instructions are provided for the setup of Postgres & PGadmin.

Creating Servers are also mentioned should PGadmin not have a default one 

Right click on the Server > Create Server 
Fill in the following fields name in the General Tab.
On the Connections tab enter localhost  for host name/address box also provide the username and password from PostgreSQL then save. The server should be listed.
The server contains a collection of objects every defines every feature of the database server. Most importantly it contains tables which we can write queries on to investigate data.

The query tool can be selected by Tools > Query Tool note that you need to have a database selected.

Query to check the version of SQL being ran, seems compatible with MYSQL also.
```SQL
SELECT version();
```
## Chapter 2

Introduces creating a database as well as a table. The points of the chapter are that you need to know how to define structures so data can be stored efficiently as well being able to retrieve the data you require.

The definition of a table is a grid of rows * columns that store data.
Each row holds a collection of columns.
Each column contains data of a specific type.

An example school enrollment database contains several tables how their is relationships between the tables.

Each table contains a matching column to further demonstrate the connections between tables.

#### database creating

Following command  CREATE DATABASE name_of_db_goes_here; *** In order to see the newly created Database you may need to reload via the view tab

#### Create TABLE Statement
```SQL
 CREATE TABLE teachers (
    id bigserial,
    first_name varchar(25),  
    last_name varchar(50),
    school varchar(50),
    hire_date date,
    salary numeric); 
```
The following statement is to be taken as an example it's mentioned that missing constraints.
Commas are required for defining additional columns.

#### Using the Insert Statement
The following statement:
```SQL
INSERT INTO teachers (first_name, last_name, school,  hire_date, salary)  

VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30',  36200),
        ('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22',  65000),  
        ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),  
        ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),  
        ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30',  43500),
        ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);
```
Format for dates is YYYY-MM-DD

is the standard approach when insert due to the first part containing all the columns and the values part matching the columns specified. The id column is missing due to how it was defined. It automatically increments.

You can view all the rows of the table by selecting the databases_name > Schemas > Tables > Table_name > View/Edit Data > All Rows.

#### SQL Conventions

Keywords to be uppercase, some people also uppercase datatype.
Avoid camelcase and use underscores for object names (tables and column names).

## Chapter 3

#### How to retrieve data with the SELECT statement.

SELECT can accept an expression such as

```SQL
SELECT 1 + 4;
```
A table isn't required as we aren't gathering data from a table

Retrieving everything row & column from a table by:
```SQL
SELECT * FROM table_name;
```
In order to select a subset you can do as follows:
```SQL
SELECT column_1, .... FROM table_name;
```
When you retrieve the data it's important to check whether the columns have data that is formatted as expected.

Sorting Data with ORDER BY 
This is useful as there is no guarantee that data will be in order.

```SQL
SELECT first_name, last_name, salary  FROM teachers  ORDER BY salary DESC; 

SELECT first_name, last_name, salary  FROM teachers  ORDER BY salary DESC,....; 

```
Interestingly ORDER BY can also accept numbers instead of columns the numbers are determined by the position within the select clause.

Using DISTINCT to Find Unique Values

This would remove duplicate sc
```SQL
SELECT DISTINCT school FROM teachers ORDER BY school; 
```
You could also use DISTINCT for checking valid dates structures a possible dataset you may come across could of set up dates with using a text data type.

DISTINCT can also work on multiple columns

```SQl
SELECT first_name, last_name, salary  FROM teachers  ORDER BY salary DESC; 
```

Filtering Rows with WHERE

Useful for filtering rows that meet a criteria.

```SQL
SELECT last_name, school, hire_date  FROM teachers  WHERE school = 'Myers Middle School'; 
```

Operators List Page 77

Simple examples

= Operator
```SQL
SELECT first_name, last_name, school  FROM teachers  WHERE first_name = 'Janet';  Next, we list all school names in the table but exclude F.D. Roosevelt HS  using the not-equal operator:  SELECT school  FROM teachers  WHERE school <> 'F.D. Roosevelt HS'; 

```

Not Equal <> OR !=
```SQL
SELECT school  FROM teachers  WHERE school <> 'F.D. Roosevelt HS';
```

Less Than 
```SQL
SELECT first_name, last_name, hire_date  FROM teachers  WHERE hire_date < '2000-01-01'; 
```

Greater Than or Equal To
```SQL
SELECT first_name, last_name, salary  FROM teachers  WHERE salary >= 43500; 
```

BETWEEN the range is inclusive 40k to 65k

```SQL
SELECT first_name, last_name, school, salary  FROM teachers  WHERE salary BETWEEN 40000 AND 65000; 
```

LIKE (Case sensitive)

Percent sign (%) A wildcard matching one or more characters  Underscore (_) A wildcard matching just one character  For example, if you’re trying to find the word baker, the following LIKE  patterns will match it:
```SQL
  LIKE 'b%'  LIKE '%ak%'  LIKE '_aker'  LIKE 'ba_er' 
```

ILIKE (Case insensitive)
SAME Syntax to LIKE

## Chapter 4
### Understanding Data Types

Useful chapters for as the concepts can be applied to low level languages

Each column within the create_table statement can only contain one data type

```SQL
CREATE TABLE eagle_watch (  
  observation_date date,
  eagles_seen integer,
  notes text  
); 

The data type fall into three of the most common categories

```
**Characters** Any character or symbol

**Numbers** Includes whole numbers & fractions

**Dates and times** Temporal Information

#### Understanding characters

*Character string types* are used for any combination of text,numbers and symbols. Character types are as follows:

**char (n)** A column that is fixed in length specified by n. Should the entry not be the length of n it will store the length of n regardless. **character (n)** is equivalent.

**varchar (n)** similar to char but it wont use extra space if it's not required.

**text** an unlimited length column up to 1gb of storage. not commonly used.

On the listing 4-1

It introduces the COPY TO function

*Numbers* 

numbers that are stored as strings you can't do mathematical operations unlike JS with type coercion.

Number types include the following 

**Integers** The common types are:
smallint
integer
bigint
Each type have there limit for max and min numbers there able to store, they are ordered smallest to largest.

Auto Increment Integers are also available when you need a column that increments each time you add a row the types are:

smallserial
serial
bigserial

Similar to above each type has their limit, they are ordered smallest to largest.

```SQL
CREATE TABLE people (  
  id serial
  ,person_name varchar(100)  ); 
```

From version 10 Postgres supports the user of Identity for auto-incrementing integers, it also popular due to it's strictness it won't allow a value to be entered unlike the serial types.

The two ways in which IDENTITY can be used:
```SQL
name of col integer type GENERATED ALWAYS AS IDENTITY

name of col integer type GENERATED BY DEFAULT AS IDENTITY (this can be manually overrided)

```

**Fixed-point and floating-point** Two formats of fractions

The fixed-point type is declared as numeric(precision,scale), the precision declares the max number length and the scale is for the right side.

Floating-Point Types include real and double precision

An example below is needed to show the trade off between types

```SQL
CREATE TABLE number_data_types
(  numeric_column numeric(20,5),
  real_column real,  double_column double precision  )  

 INSERT INTO number_data_types  VALUES  (.7, .7, .7), 
(2.13579, 2.13579, 2.13579),  (2.1357987654, 2.1357987654, 2.1357987654); 

SELECT * FROM number_data_types
```
Result
```SQL
numeric_column real_column double_column 
-------------- ----------- -------------
0.70000           0.7           0.7
2.13579         2.13579       2.13579
2.13580         2.1357987   2.1357987654 
```

Rounding issues with floating point math

```SQL
SELECT
    numeric_column * 10000000 AS fixed,
    real_column * 10000000 AS floating
FROM number_data_types
WHERE numeric_column = .7;
```

```SQL
fixed         numeric
------------- ----------------
7000000.00000	6999999.88079071
```

Understanding Dates and Times

Four of the most common date data types

timestamp a type that can store date & time with an option timezone option 
date records the date
time records the time
interval represents a value of time expressed in a quantity unit

The timestamps in action the use of the now function captures the time _ timezone based on your hardware
```SQL
CREATE TABLE date_time_types (
    timestamp_column timestamp with time zone,
    interval_column interval
);

INSERT INTO date_time_types
VALUES
    ('2022-12-31 01:00 EST','2 days'),
    ('2022-12-31 01:00 -8','1 month'),
    ('2022-12-31 01:00 Australia/Melbourne','1 century'),
    (now(),'1 week');

SELECT * FROM date_time_types;


timestamp_column                interval_column
 ----------------------------- ---------------
2022-12-31 01:00:00-05          2 days  
2022-12-31 04:00:00-05          1 mon  
2022-12-30 09:00:00-05          100 years  
2020-05-31 21:31:15.716063-05   7 days 

```

You can do calculations with intervals as follows

```SQL
SELECT
    timestamp_column,
    interval_column,
    timestamp_column - interval_column AS new_date
FROM date_time_types;
```

Other data types you could run into are:

JSON/JSONB

Boolean

Geometric types such as points, lines, circles

Text search types 

Network address types

A universally unique identifier (UUID) type

Adjusting values from one type to another using CAST

This can be done as:

```SQL
CAST(char_column AS integer)
CAST(timestamp_column AS varchar(10))
```

You can also cast using ::type however this is only available in PostgreSQL
```SQL
char_column::integer
```

## Chapter 5
Note C drive on the copy locations is Windows Specific adjust based on your current OS
### Working with Delimited Text Files
When you want to copy data from a file usually the file type will be a csv file.

More often than not the first row of the file will contain a bunch of headers, there's an option to skip the first line with POSTGRESQL (however other dialects use it) with COPY FROM

### Issues with delimiters

Some files may contain columns that use a commas within an entry this can cause issues but a text qualifier can help around this issue.

Also another issue could be two text_qualifiers within one entry such as:

"123 Main St."" Apartment 200"

On import the following would be the result:

123 Main St." Apartment 200 

The output of the above shows the importance of review of data.

The syntax of copy

```SQL
COPY table_name
FROM 'C:\YourDirectory\your_file.csv'
WITH (FORMAT CSV, HEADER);

```

Some of the common options for WITH:

Input and output file format 'FORMAT file_type'

Presence of a header row use HEADER to exclude the first row

Delimiter 'character' when csv options is selected by default delimiter is comma if you don't provide delimiter.

Quote Character in CSV mode by default the character is " however you can specify an alternative

### Creating a Table & Importing data
The constraint creates a key from the first two columns the combinations are unique.
```SQL
CREATE TABLE us_counties_pop_est_2019 (
    state_fips text,                         -- State FIPS code
    county_fips text,                        -- County FIPS code
    region smallint,                         -- Region
    state_name text,                         -- State name	
    county_name text,                        -- County name
    area_land bigint,                        -- Area (Land) in square meters
    area_water bigint,                       -- Area (Water) in square meters
    internal_point_lat numeric(10,7),        -- Internal point (latitude)
    internal_point_lon numeric(10,7),        -- Internal point (longitude)
    pop_est_2018 integer,                    -- 2018-07-01 resident total population estimate
    pop_est_2019 integer,                    -- 2019-07-01 resident total population estimate
    births_2019 integer,                     -- Births from 2018-07-01 to 2019-06-30
    deaths_2019 integer,                     -- Deaths from 2018-07-01 to 2019-06-30
    international_migr_2019 integer,         -- Net international migration from 2018-07-01 to 2019-06-30
    domestic_migr_2019 integer,              -- Net domestic migration from 2018-07-01 to 2019-06-30
    residual_2019 integer,                   -- Residual for 2018-07-01 to 2019-06-30
    CONSTRAINT counties_2019_key PRIMARY KEY (state_fips, county_fips)	
);

COPY us_counties_pop_est_2019
FROM 'C:\YourDirectory\us_counties_pop_est_2019.csv'
WITH (FORMAT CSV, HEADER);
```

Second Table note within the copy the example shows which columns you will import the data to.
Additionally  the csv file doesn't have an id column plus due to the setup of the table it would reject the import due to the auto-increment.
```SQL
CREATE TABLE supervisor_salaries (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    town text,
    county text,
    supervisor text,
    start_date date,
    salary numeric(10,2),
    benefits numeric(10,2)
);

COPY supervisor_salaries (town, supervisor, salary)
FROM 'C:\YourDirectory\supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER);
```

Deleting all rows from a table note when you do such operations the id position doesn't reset this will be done through further steps.
```SQL
DELETE FROM supervisor_salaries;
```

Importing a subset of rows using WHERE
```SQL
COPY supervisor_salaries (town, supervisor, salary)
FROM 'C:\YourDirectory\supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER)
WHERE town = 'New Brillig';
```
#### Creating temp tables & adding default value to a column using import

```SQL
DELETE FROM supervisor_salaries;

CREATE TEMPORARY TABLE supervisor_salaries_temp 
    (LIKE supervisor_salaries INCLUDING ALL);

COPY supervisor_salaries_temp (town, supervisor, salary)
FROM 'C:\YourDirectory\supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER);

INSERT INTO supervisor_salaries (town, county, supervisor, salary)
SELECT town, 'Mills', supervisor, salary
FROM supervisor_salaries_temp;

DROP TABLE supervisor_salaries_temp;

-- Check the data
SELECT * FROM supervisor_salaries ORDER BY id LIMIT 2;
```

### Exporting Data
Copy all data
```SQL
COPY us_counties_pop_est_2019
TO ''
WITH (FORMAT CSV, HEADER, DELIMITER '|')
```

Copy specific columns

```SQL
COPY us_counties_pop_est_2019
    (county_name, internal_point_lat, internal_point_lon)
TO ''
WITH (FORMAT CSV, HEADER, DELIMITER '|')
```

Copy query results
```SQL
COPY (
    SELECT county_name, state_name
    FROM us_counties_pop_est_2019
    WHERE county_name ILIKE '%mill%'
     )
TO ''
WITH (FORMAT CSV, HEADER);
```

## Chapter 6
Introduces the math operators some of them that are different compared to other programming languages:

|/ Square root  
||/ Cube root 
! Factorial 

Return types with math operators

Two integers will return an integer

Numeric on either side of the equation will return numeric

Floating-point returns a floating-point number of type double precision

Shows how to do math between two columns and aggregate functions such as avg, sum,min, max, median through the functions percentile_cont(n) and percentile_disc(n), mode.

Order of operations:

Exponents and roots.
Multiplication, division, modulo.
Addition and subtraction 

Uses Parentheses to change the order.

## Chapter 7

Explains how to query multiple, related tables by joining them on key columns.

Classic JOIN 

SELECT * FROM table_one JOIN table_two ON table_one.key_column = table_two.foreign_key_column

The statement works through the ON Clause where the rows evaluate to true.

Any other expression can be used such as long as it evaluates to true:

ON table_one.key_column >= table_two.foreign_key_column

ON table_one.key_column <= table_two.foreign_key_column

ON table_one.key_column = table_two.foreign_key_column-1

The author uses a realistic scenario to show the use of the join where you are given data separately rather then in one csv file

Below we create two tables with constraints such as PK through:
CONSTRAINT column_name PRIMARY KEY (column_name)

The following below ensures unique pairs
CONSTRAINT name_of_pair UNIQUE(column_1,column_2)

Ensures data validity when you are references from another table also known as a foreign key should an invalid value be given you can expect the following:
```SQL
ERROR:  insert or update on table "employees" violates foreign key constraint "employees_dept_id_fkey"
Key (dept_id)=(4) is not present in table "departments". 

SQL state: 23503
Detail: Key (dept_id)=(4) is not present in table "departments".
```
column_name data_type REFERENCES another_table (another_tables_column_name)
```SQL
CREATE TABLE departments(
	dept_id int,
	dept text,
	city text,
	CONSTRAINT dept_key PRIMARY KEY (dept_id),
	CONSTRAINT dept_city_unique UNIQUE(dept,city)
);

CREATE TABLE employees(
	emp_id int,
	first_name text,
	last_name text,
	salary numeric(10,2),
	dept_id integer REFERENCES departments (dept_id),
	CONSTRAINT emp_key PRIMARY KEY (emp_id)
);

INSERT INTO departments
VALUES
(1,'Tax','Atlanta'),
(2,'IT','Boston');

INSERT INTO employees
VALUES
(1,'Julia','Reyes',115300,1),
(2,'Janet','King',98000,1),
(3,'Arthur','Pappas',72700,2),
(4,'Michael','Taylor',89500,2)
```