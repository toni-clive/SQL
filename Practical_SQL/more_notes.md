# [Practical SQL: A Beginner's Guide to Storytelling with Data](https://practicalsql.com/)

Notes for useful info I've picked up from the book, this book focuses on using Postgres.

## 🚀 Chapter 1: Setup & Environment

Author suggests different text editors. Where to Download the resources for the book.

You are also guided through Installing PostgreSQL and pgAdmin macOS seems the easiest installation out of Linux and Windows.

Once successful a pw is required.

With PGAdmin you are give a default server but you create your own server in this chapter.

Right Click on Servers > Create > Server Group

## 🛠️ Chapter 2: Databases, Tables & Data Entry

Goes through the relationship between tables how keys can connect tables together.

Also touches how to structure tables explicitly using different data types.

Creating a database:

Right on databases > Create > Databases
```sql
 CREATE DATABASE analysis;
```
When you want to query a DB you right click then select query tool.

Always check the label at the top of the query tool matches the DB you with to query

Creating a table using the query tool:

```sql
  CREATE TABLE teachers (
      id bigserial,
      first_name varchar(25),
      last_name varchar(50),
      hire_date date,
      salary numeric(10,2)
  );
```

Once executed refresh the DB to see the change in:

DB name > Schemas > Public > Tables

Inserting Values into the table:
```sql
  INSERT INTO teachers (first_name, last_name, hire_date, salary)
  VALUES ('Janet', 'Smith', '2011-10-30', 36200.00);
```
Note the id field is let out as this auto generates due to the big data type declaration within the TABLE statement.

When there a column that auto-generates you need to be explicit and declare the columns your adding data into.

Viewing the data:

Method one:

Right click on the table name then select all rows 

Method two:

Using the query tool writing the following statement 
```sql
 SELECT * FROM tablename
```

## 🔍 Chapter 3: Data Retrieval, Sorting & Filtering

You can retrieve data from your table using the select statement above the * returns all columns within the table.

Note that you may not always need a table selection so you can omit the table.

The following examples are valid as the return an expression.

```sql
SELECT 'hello there' AS hello
```

```sql
SELECT 4+4 AS hello
```

WHERE clause:

Used for filtering out rows that meet the condition listed within the clause an example:

```sql
SELECT first_name, last_name FROM teachers WHERE salary > 50000
```

The chapter covers many other examples of the where clause.

## 📊 Chapter 4: Data Types & Casting

Starts off the chapter with a data dictionary, this is a document that lists each other specifies the type as well as the column values.

We are also given the fact in a table one column can only hold one datatype.

The chapter also introduces decimals and floating points is worth reading as it shows how the issues you can run into when selecting the datatypes and floating point-math.

We also get shown timestamps and interval types and their use cases.

A timestamp may contain a timezone this additional info is practical as most application won't just be operational in one country.

timestamp with -+ interval always returns a timestamp

The chapter ends with other data types you may encounter in the wild.

CAST Function used to cast one data type to the other.

The standard notation is CAST(insert expression)

Postgres as the shortcut of ::CAST but it's not functional for beyond Postgres.

## 📁 Chapter 5: Ingestion & Export (`COPY`)

Introduces bulk imports for COPY statement

The general Syntax for copy is as follows:

```sql
COPY table_name
FROM 'C:\YourDirectory\your_file.csv'
WITH (FORMAT CSV, HEADER);
```
The chapter lists several import options.

HEADER is used to skip the first row of a CSV file.

Subset import with COPY specifying of columns required with the statement useful for when you have an auto generated column as you can't add data into it by default.

```sql
COPY supervisor_salaries (town, supervisor, salary)
FROM 'C:\YourDirectory\supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER);
```

The chapter also includes the following regarding importing:

adding rows with a filter

Adding a Value to a Column During Import

Copy to Export Data

```sql
COPY us_counties_pop_est_2019
TO 'C:\YourDirectory\us_counties_export.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');
```

You can also export particular columns & subqueries.

## 🧮 Chapter 6: Math, Percentages & Aggregates

Introduces Math Operators must are the same to other programming languages.

## 🔗 Chapter 7: Joins & Set Operators

When using ON for JOIN the expression that joins the table together results in the boolean value of true.

Not all joins will simply be 

table_a.column_a = table_b.column_b

New constraints/references are also introduced via the following examples:

CREATE TABLE departments (
    dept_id integer,
    dept text,
    city text,
    CONSTRAINT dept_key PRIMARY KEY (dept_id),
    CONSTRAINT dept_city_unique UNIQUE (dept, city)
);

CREATE TABLE employees (
    emp_id integer,
    first_name text,
    last_name text,
    salary numeric(10,2),
    dept_id integer REFERENCES departments (dept_id),
    CONSTRAINT emp_key PRIMARY KEY (emp_id)
);

Discusses the different joins, important to note that cross join can be hardware intense on large databases as it does actions somewhat similar to a nested for loop

Introduces Table relationships.

## 🏗️ Chapter 8: Table Design, Constraints & Indexes

Naming style conventions:

Snake case as shown in brief_notes.

Avoid cryptic abbreviations.

For table names use plurals.

Length of Identifier names PostgreSQL has a limit for 63.

Use date references when creating backups table_name_YYYY_MM_DD.

Everything defaults to lowercase with Identifiers.

The following example would produce an table already exist error:

CREATE TABLE customers (
customer_id text,
--snip--
);
CREATE TABLE Customers (
customer_id text,
--snip--
);

Composite is created when a primary key doesn't meet the primary key requirements to ensure the row within the table is unique. In this example the student_id wouldn't ensure unique data due to the table representing an attendance checker

CREATE TABLE natural_key_composite_example (
    student_id text,
    school_day date,
    present boolean,
    CONSTRAINT student_key PRIMARY KEY (student_id, school_day)
);

Useful to consider by default the primary key constraint automatically ensures the column cannot be null however with other dialects such as MySQL you also need to be more verbose and also add the constraint of NOT NULL to a PK column

Surrogate keys

CREATE TABLE surrogate_key_example (
    order_number bigint GENERATED ALWAYS AS IDENTITY,
    product_name text,
    order_time timestamp with time zone,
    CONSTRAINT order_number_key PRIMARY KEY (order_number)
);

INSERT INTO surrogate_key_example (product_name, order_time)
VALUES ('Beachball Polish', '2020-03-15 09:21-07'),
       ('Wrinkle De-Atomizer', '2017-05-22 14:00-07'),
       ('Flux Capacitor', '1985-10-26 01:18:00-07');

SELECT * FROM surrogate_key_example;

Overriding values

INSERT INTO natural_key_composite_example (student_id,
school_day, present)
VALUES(775, '2022-01-22', 'Y');
INSERT INTO natural_key_composite_example (student_id,
school_day, present)
VALUES(775, '2022-01-23', 'Y');
INSERT INTO natural_key_composite_example (student_id,
school_day, present)
VALUES(775, '2022-01-23', 'N');

ERROR: duplicate key value violates unique constraint
"student_key"
DETAIL: Key (student_id, school_day)=(775, 2022-01-23)
already exists.

REFERENCES keyword to ensure data validity the final insert will produce the license_id isn't valid.

CREATE TABLE licenses (
    license_id text,
    first_name text,
    last_name text,
    CONSTRAINT licenses_key PRIMARY KEY (license_id)
);

CREATE TABLE registrations (
    registration_id text,
    registration_date timestamp with time zone,
    license_id text REFERENCES licenses (license_id),
    CONSTRAINT registration_key PRIMARY KEY (registration_id, license_id)
);

INSERT INTO licenses (license_id, first_name, last_name)
VALUES ('T229901', 'Steve', 'Rothery');

INSERT INTO registrations (registration_id, registration_date, license_id)
VALUES ('A203391', '2022-03-17', 'T229901');

INSERT INTO registrations (registration_id, registration_date, license_id)
VALUES ('A75772', '2022-03-17', 'T000001');

Deleting Related Records with Cascade 

Say if one of the registrations are removed we can apply DELETE CASCADE at the end of the license_id definitions in order to remove the license_id from the license table. Useful to ensure data integrity.

UNIQUE constraint already mentioned within the brief_notes however UNIQUE allows NULL unlike Primary Key.

Modifying constraints

CREATE TABLE not_null_example (
student_id bigint GENERATED ALWAYS AS IDENTITY,
first_name text NOT NULL,
last_name text NOT NULL,
CONSTRAINT student_id_key PRIMARY KEY (student_id)
);

ALTER TABLE not_null_example DROP CONSTRAINT student_id_key;
ALTER TABLE not_null_example ADD CONSTRAINT student_id_key
PRIMARY KEY (student_id);
ALTER TABLE not_null_example ALTER COLUMN first_name DROP NOT
NULL;
ALTER TABLE not_null_example ALTER COLUMN first_name SET NOT
NULL;

# Chapter 9: Extracting Information by Grouping and Summarizing


## Chapter 10: Inspecting and Modifying Data

ANSI SQL version of updating from another table:

UPDATE table
SET column = (SELECT column
FROM table_b
WHERE table.column = table_b.column)
WHERE EXISTS (SELECT column
FROM table_b
WHERE table.column = table_b.column);

Within Postgres we can do things simpler:

UPDATE table
SET column = table_b.column
FROM table_b
WHERE table.column = table_b.column;

If you try to back up a table inside the database using a query like CREATE TABLE backup_table AS SELECT * FROM original_table;, constraints will NOT be picked up.
• This method only copies the column names, data types, and the data itself.
• It completely ignores primary keys, foreign keys, indexes, and default values.