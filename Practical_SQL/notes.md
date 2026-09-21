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
        ('Samuel', 'Cole', 'Myers Middle School', '2005-08-  01', 43500),  
        ('Samantha', 'Bush', 'Myers Middle School', '2011-10-  30', 36200),  
        ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30',  43500),
        ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-  22', 38500);
```
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