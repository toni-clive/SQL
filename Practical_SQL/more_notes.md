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