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

Using the query tool writing the following statement ```sql SELECT * FROM tablename```