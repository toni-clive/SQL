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

You can view all the rows of the table by selecting the table then right > View/Edit Data > All Rows.

#### SQL Conventions

Keywords to be uppercase, some people also uppercase datatype.
Avoid camelcase and use underscores for object names (tables and column names).

## Chapter 3

#### How to retrieve data with the SELECT statement.

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
```
Interestingly ORDER BY can also accept numbers instead of columns the numbers are determined by the position within the select clause.