# [Practical SQL: A Beginner's Guide to Storytelling with Data](https://practicalsql.com/)

Notes for useful info I've picked up from the book, this book focuses on using Postgres.

## 🚀 Chapter 1: Setup & Environment
* **RDBMS:** PostgreSQL (ANSI-compliant relational database) + **pgAdmin** (GUI management client).
* **Connection Defaults:** Host `localhost`, Port `5432`, default database `postgres`.
* **Version Check:**
  ```sql
  SELECT version();
  ```

---

## 🛠️ Chapter 2: Databases, Tables & Data Entry
* **DDL / DML Basics:**
  ```sql
  CREATE DATABASE analysis;

  CREATE TABLE teachers (
      id bigserial,
      first_name varchar(25),
      last_name varchar(50),
      hire_date date,
      salary numeric(10,2)
  );

  INSERT INTO teachers (first_name, last_name, hire_date, salary)
  VALUES ('Janet', 'Smith', '2011-10-30', 36200.00);
  ```
* **Formatting Conventions:** Uppercase keywords (`SELECT`), lowercase data types (`numeric`), `snake_case` table/column names. Text/dates require single quotes (`'2021-10-30'`).

---

## 🔍 Chapter 3: Data Retrieval, Sorting & Filtering
* **Basic Selection & Uniqueness:**
  ```sql
  SELECT DISTINCT school, salary FROM teachers ORDER BY salary DESC;
  ```
* **Pattern Matching & Operators:**
  * `=` | `<>` / `!=` | `>` | `<` | `BETWEEN` | `IN`
  * `LIKE` (case-sensitive) vs. `ILIKE` (case-insensitive). Wildcards: `%` (multi-character), `_` (single character).
  ```sql
  SELECT * FROM teachers 
  WHERE school ILIKE '%roosevelt%' AND salary >= 40000 
  ORDER BY hire_date DESC;
  ```

---

## 📊 Chapter 4: Data Types & Casting
* **Character:** `char(n)` (fixed-length), `varchar(n)` (limited), `text` (unlimited, recommended in Postgres).
* **Numeric:** `integer` (4-byte), `bigint` (8-byte), `numeric(p,s)` (exact/money), `double precision` (floating-point).
* **Temporal:** `date`, `time`, `timestamp`, `timestamptz` (with time zone), `interval` (durations).
* **Type Casting Syntax:**
  ```sql
  SELECT CAST('2023-01-01' AS date);
  SELECT '100'::integer;
  ```

---

## 📁 Chapter 5: Ingestion & Export (`COPY`)
* **Bulk Import (CSV to Table):**
  ```sql
  COPY us_counties 
  FROM 'C:\data\counties.csv' 
  WITH (FORMAT CSV, HEADER, DELIMITER ',');
  ```
* **Bulk Export (Query to CSV):**
  ```sql
  COPY (SELECT county_name, pop_2019 FROM us_counties WHERE pop_2019 > 500000) 
  TO 'C:\data\large_counties.csv' 
  WITH (FORMAT CSV, HEADER);
  ```

---

## 🧮 Chapter 6: Math, Percentages & Aggregates
* **Calculations:**
  * Percent of Total: `(part / total) * 100`
  * Percent Change: `((new_val - old_val) / old_val) * 100`
  * Rounding: `round(value, decimal_places)`
  * *Integer Division Trap:* Cast integers to `numeric` before division (`col1::numeric / col2`).
* **Vertical Aggregates:** `count()`, `sum()`, `avg()`, `min()`, `max()`.
* **Median & Mode:**
  ```sql
  SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY salary) FROM teachers;
  SELECT mode() WITHIN GROUP (ORDER BY salary) FROM teachers;
  ```

---

## 🔗 Chapter 7: Joins & Set Operators
* **Join Types:**
  * `JOIN` (Inner): Matches only rows present in both tables.
  * `LEFT JOIN`: All rows from left table + matches from right (`NULL` if unmatched).
  * `RIGHT JOIN`: All rows from right table + matches from left.
  * `FULL OUTER JOIN`: All rows from both tables matched where possible.
  * `CROSS JOIN`: Cartesian product (all row combinations).
  * `Anti-Join`: `LEFT JOIN ... WHERE right_table.key IS NULL`.
* **Set Operators (Matching Column Counts/Types Required):**
  * `UNION` (combines & deduplicates) | `UNION ALL` (combines & keeps duplicates)
  * `INTERSECT` (returns shared rows) | `EXCEPT` (returns rows unique to 1st query)

---

## 🏗️ Chapter 8: Table Design, Constraints & Indexes
* **Identifier Style:** `snake_case` unquoted. Quoted names (`"MyTable"`) require double quotes in all future queries.
* **Primary Keys:**
  * *Natural:* Existing unique domain data (`PRIMARY KEY (student_id, school_day)`).
  * *Surrogate:* Database-generated (`id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY`).
* **Foreign Keys & Integrity:**
  ```sql
  CREATE TABLE registrations (
      registration_id text PRIMARY KEY,
      license_id text REFERENCES licenses (license_id) ON DELETE CASCADE
  );
  ```
* **Field Validation Constraints:** `NOT NULL`, `UNIQUE` (permits `NULL`s), `CHECK (salary >= 0)`.
* **Indexes & Performance:**
  * Default: PostgreSQL builds B-Tree indexes on `PRIMARY KEY` and `UNIQUE` fields.
  * Custom Indexing: `CREATE INDEX street_idx ON addresses (street);`
  * Query Plan Benchmark: Use `EXPLAIN ANALYZE SELECT ...` to evaluate execution time (~90ms seq scan vs ~1ms index scan).
