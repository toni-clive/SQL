# [Practical SQL: A Beginner's Guide to Storytelling with Data](https://practicalsql.com/)

AI generated notes for each chapter very brief not much depth.

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

# Chapter 9: Extracting Information by Grouping and Summarizing

### Aggregate Functions
Aggregate functions combine values across multiple rows in a column to return a single summary result:
* `count(*)`: Counts total rows, including `NULL` values.
* `count(column_name)`: Counts only non-`NULL` values in a specific column.
* `count(DISTINCT column_name)`: Counts the number of unique non-`NULL` values.
* `sum(column)` / `avg(column)`: Calculates sum or arithmetic mean.
* `min(column)` / `max(column)`: Returns lowest or highest value.

### Aggregating Data with `GROUP BY`
* **Syntax Rule:** Any non-aggregated column listed in the `SELECT` clause **must** appear in the `GROUP BY` clause.
* **Multi-Column Grouping:** Groups rows by unique combinations of values across multiple specified columns.

```sql
SELECT stabr, stataddr, count(*) AS agency_count
FROM pls_fy2018_libraries
GROUP BY stabr, stataddr
ORDER BY stabr, stataddr;
```

### Filtering Aggregates with `HAVING`
* **`WHERE` vs. `HAVING`:** The `WHERE` clause filters individual rows *before* aggregation occurs. The `HAVING` clause filters aggregated group results *after* `GROUP BY` completes.

```sql
SELECT stabr, sum(visits) AS total_visits
FROM pls_fy2018_libraries
WHERE visits >= 0
GROUP BY stabr
HAVING sum(visits) > 50000000
ORDER BY total_visits DESC;
```

---

## Chapter 10: Inspecting and Modifying Data

### Interviewing & Cleaning Dirty Data
* **Detecting Duplicates:** Group by candidate key columns and filter with `HAVING count(*) > 1`.
* **Finding Missing Values:** Filter using `WHERE column_name IS NULL`.
* **Checking String Lengths:** Use `length(column_name)` to identify truncated or malformed codes (e.g., 3- or 4-digit ZIP codes missing leading zeros).

### Table & Column Modifications (`ALTER TABLE`)
* **Structure Edits:** `ALTER TABLE table_name ADD COLUMN col_name type;`
* **Dropping Columns:** `ALTER TABLE table_name DROP COLUMN col_name;`
* **Renaming Tables:** `ALTER TABLE table_name RENAME TO new_name;`

### Modifying Rows (`UPDATE` & `RETURNING`)
* **Updating Values:** Use `UPDATE table SET column = new_value WHERE condition;`. Always include `WHERE` to avoid overwriting the entire table.
* **The `RETURNING` Clause:** Displays modified row values instantly without requiring a separate `SELECT` query.

```sql
UPDATE meat_poultry_egg_establishments
SET zip = '0' || zip
WHERE st IN ('CT','MA','ME','NH','NJ','RI','VT') AND length(zip) = 4
RETURNING establishment_number, company, zip;
```

### Safety, Deletion, and Transactions
* **Table Backups:** `CREATE TABLE backup_table AS SELECT * FROM original_table;`
* **Deleting Rows:** `DELETE FROM table_name WHERE condition;`
* **Fast Table Truncation:** `TRUNCATE table_name RESTART IDENTITY;` (clears all rows instantly and resets auto-incrementing identity sequences).
* **Transaction Blocks:** Enclose queries between `START TRANSACTION;` (or `BEGIN;`) and `COMMIT;` to finalize, or `ROLLBACK;` to revert changes if errors occur.

---

## Chapter 11: Statistical Functions in SQL

### Measuring Relationships & Regression
* **Pearson Correlation (`corr(Y, X)`):** Measures the linear relationship between dependent variable $Y$ and independent variable $X$, returning a value $r \in [-1, 1]$.
* **Linear Regression Slope & Intercept:**
  * `regr_slope(Y, X)`: Returns the slope $b$ of the best-fit line ($Y = bX + a$).
  * `regr_intercept(Y, X)`: Returns the $y$-intercept $a$.
* **Coefficient of Determination ($R^2$):** `regr_r2(Y, X)` returns the percentage of variation in $Y$ explained by $X$ ($R^2 \in [0, 1]$).

### Window Functions & Rankings
Window functions perform calculations across a set of table rows related to the current row without collapsing them into a single output row.

* **`rank()` vs. `dense_rank()`:**
  * `rank()`: Leaves gaps in rank numbering when ties occur (e.g., 1, 2, 2, 4).
  * `dense_rank()`: Does not leave gaps in rank numbering after ties (e.g., 1, 2, 2, 3).
* **Subgroup Ranking (`PARTITION BY`):** Resets the ranking calculation for each distinct group value.

```sql
SELECT category, store, unit_sales,
       rank() OVER (PARTITION BY category ORDER BY unit_sales DESC) AS category_rank
FROM store_sales
ORDER BY category, category_rank;
```

### Rolling Averages & Time-Series Smoothing
Calculate moving averages across specified row frames:

```sql
SELECT year, month, citrus_export_value,
       round(avg(citrus_export_value) OVER (
           ORDER BY year, month
           ROWS BETWEEN 11 PRECEDING AND CURRENT ROW
       ), 0) AS twelve_month_avg
FROM us_exports;
```

---

## Chapter 12: Working with Dates and Times

### Datetime Data Types
* `timestamp with time zone` (`timestamptz`): Standard date + time with time zone tracking (8 bytes). Internal storage is normalized to UTC.
* `date`: Calendar date (`YYYY-MM-DD`, 4 bytes).
* `time`: Time of day (`HH:MM:SS`, 8 bytes).
* `interval`: Unit of duration expressed as quantity + unit (e.g., `'2 days'`, `'3 hours'`).

### Extracting & Constructing Datetimes
* **Extracting Parts:** `date_part('unit', timestamptz)` or standard `extract(unit FROM timestamptz)`. Units include `'year'`, `'month'`, `'day'`, `'hour'`, `'week'`, `'quarter'`, `'epoch'`.
* **Constructing Types:** `make_date(year, month, day)`, `make_time(hour, minute, seconds)`, `make_timestamptz(year, month, day, hour, minute, seconds, 'timezone')`.
* **Current Time Functions:**
  * `current_timestamp`: Returns transaction start time (constant throughout transaction).
  * `clock_timestamp()`: Returns exact real-time execution clock timestamp per row.

### Time Zone Management & Calculations
* **Session Settings:** `SHOW timezone;`, `SET TIME ZONE 'US/Eastern';`
* **Conversion View:** `timestamp_col AT TIME ZONE 'Asia/Seoul'`
* **Interval Calculations & Standardization:**
  * `date - date`: Returns difference as an integer count of days.
  * `timestamp - interval`: Returns a calculated timestamp.
  * `justify_interval(interval)`: Standardizes cumulative intervals (converts 24+ hours into days, 30+ days into months).
  * `to_char(timestamp, 'YYYY-MM-DD HH12:MI a.m. TZ')`: Custom string formatting.

---

## Chapter 13: Advanced Query Techniques

### Subqueries
Nested queries enclosed in parentheses used as dynamic inputs for outer queries.
* **Scalar Subqueries in `WHERE`:** Returns a single value to evaluate against a comparison operator.

```sql
SELECT county_name, state_name, pop_est_2019
FROM us_counties_pop_est_2019
WHERE pop_est_2019 >= (
    SELECT percentile_cont(.9) WITHIN GROUP (ORDER BY pop_est_2019)
    FROM us_counties_pop_est_2019
);
```

* **Derived Tables in `FROM`:** Subqueries returning rows/columns treated as temporary tables (must have a table alias).
* **Subquery Expressions (`IN`, `EXISTS`, `NOT EXISTS`):** `EXISTS` tests whether a correlated subquery returns at least one row, evaluating per row of the outer query.

### `LATERAL` Subqueries
Allows subqueries in `FROM` or `JOIN` clauses to reference columns from preceding tables in the query pipeline (acting like a `for` loop per row).

```sql
SELECT t.id, t.first_name, a.lab_name, a.access_time
FROM teachers t
LEFT JOIN LATERAL (
    SELECT * FROM teachers_lab_access
    WHERE teacher_id = t.id
    ORDER BY access_time DESC
    LIMIT 2
) a ON true;
```

### Common Table Expressions (CTEs)
Defines temporary named result sets using `WITH name AS (SELECT ...)` to simplify complex joins and eliminate redundant calculations.

```sql
WITH counties (st, pop_2018) AS (
    SELECT state_name, sum(pop_est_2018)
    FROM us_counties_pop_est_2019 GROUP BY state_name
),
establishments (st, estab_count) AS (
    SELECT st, sum(establishments)
    FROM cbp_naics_72_establishments GROUP BY st
)
SELECT c.st, c.pop_2018, e.estab_count,
       round((e.estab_count / c.pop_2018::numeric) * 1000, 1) AS estabs_per_thousand
FROM counties c JOIN establishments e ON c.st = e.st
ORDER BY estabs_per_thousand DESC;
```

### Reclassifying Values with `CASE`
Applies conditional logical branching:

```sql
SELECT max_temp,
       CASE WHEN max_temp >= 90 THEN 'Hot'
            WHEN max_temp >= 70 AND max_temp < 90 THEN 'Warm'
            WHEN max_temp >= 50 AND max_temp < 70 THEN 'Pleasant'
            ELSE 'Cold'
       END AS temp_group
FROM temperature_readings;
```

### Cross-Tabulations (`crosstab`)
Pivot tables generated via PostgreSQL's `tablefunc` extension (`CREATE EXTENSION tablefunc;`), transforming row categories into columnar matrix outputs.

---

## Chapter 14: Mining Text to Find Meaningful Data

### String Functions & Regular Expression Matching
* **Core String Functions:** `length()`, `upper()`, `lower()`, `trim()`, `left()`, `right()`, `substring(string from pattern)`, `replace()`.
* **Regex Operators in `WHERE`:** `~` (case-sensitive regex match), `~*` (case-insensitive regex match), `!~` (does not match), `!~*` (does not match, case-insensitive).
* **Regex Functions:**
  * `regexp_match(text, pattern)`: Returns matched capture groups as a text array (`text[]`). Indexing array element `(regexp_match(...))[1]` extracts string.
  * `regexp_replace(text, pattern, replacement)`: Replaces regex matches.
  * `regexp_split_to_table(text, delimiter)` / `regexp_split_to_array()`: Splits text into rows or arrays.

### Full-Text Search Engine
PostgreSQL's built-in search engine normalizes unstructured text into searchable lexemes.

* **Data Types:**
  * `tsvector`: Normalized list of lexemes (word roots) with word position pointers.
  * `tsquery`: Search terms combined with logical operators (`&` AND, `|` OR, `!` NOT, `<->` adjacent).
* **Search Operator (`@@`):** Checks whether a `tsvector` matches a `tsquery`.
* **GIN Indexing:** Accelerates full-text queries (`CREATE INDEX idx ON table USING gin(tsvector_col);`).
* **Search Functions:**
  * `to_tsvector('english', text)`: Converts raw text into lexemes.
  * `to_tsquery('english', 'terms')`: Converts search terms into lexemes.
  * `ts_headline(...)`: Highlights search matches within text snippets.
  * `ts_rank(tsvector, tsquery)` / `ts_rank_cd()`: Ranks query relevance by term frequency or cover density.

```sql
SELECT president, speech_date,
       ts_headline(speech_text, to_tsquery('english', 'tax'), 'StartSel=<, StopSel=>') AS snippet
FROM president_speeches
WHERE search_speech_text @@ to_tsquery('english', 'tax')
ORDER BY speech_date;
```

---

## Chapter 15: Analyzing Spatial Data with PostGIS

### PostGIS Fundamentals & Data Types
Enable extension via `CREATE EXTENSION postgis;`.
* **`geography` Type:** Round-Earth spherical model (longitude, latitude). High precision over large areas/continents. Calculations returned in **meters**.
* **`geometry` Type:** Planar Euclidean grid model. Fast performance over smaller areas. Calculations returned in **SRID units**.
* **Simple Feature Geometries:** `Point`, `LineString`, `Polygon`, `MultiPoint`, `MultiLineString`, `MultiPolygon`.
* **SRID (Spatial Reference System Identifier):** Defines spatial projection (e.g., SRID `4326` = WGS 84 GPS coordinate system; SRID `4269` = NAD 83).

### Constructors & Spatial Functions
* **Constructors:** `ST_GeomFromText(WKT, SRID)`, `ST_GeogFromText('SRID=4326;WKT')`, `ST_MakePoint(long, lat)`, `ST_SetSRID(geom, SRID)`.
* **Distance & Proximity:**
  * `ST_DWithin(geog1, geog2, meters)`: Evaluates whether two objects are within a specified distance (returns Boolean).
  * `ST_Distance(geog1, geog2)`: Calculates minimum distance between objects in meters.
  * `<->` Operator: Nearest-neighbor distance sorting operator in `ORDER BY`.
* **Spatial Measurements & Joins:**
  * `ST_Area(geom::geography)`: Calculates polygon area in square meters.
  * `ST_Within(geom1, geom2)`: Tests if geometry 1 is entirely inside geometry 2.
  * `ST_Intersects(geom1, geom2)`: Tests if spatial objects touch or overlap.
  * `ST_Intersection(geom1, geom2)`: Returns the geometric point/line where objects cross.
* **Spatial Indexing:** Built using GiST (`CREATE INDEX idx ON table USING GIST (geog_col);`).

```sql
SELECT market_name, city,
       round((ST_Distance(geog_point, ST_GeogFromText('POINT(-93.620 41.585)')) / 1609.344)::numeric, 2) AS miles
FROM farmers_markets
WHERE ST_DWithin(geog_point, ST_GeogFromText('POINT(-93.620 41.585)'), 10000)
ORDER BY miles ASC;
```

---

## Chapter 16: Working with JSON Data

### `json` vs. `jsonb`
* `json`: Stores exact text copy of JSON (preserves whitespace, key order, duplicate keys). Slow reads, no indexing.
* `jsonb`: Stores JSON in decomposed binary format (strips whitespace, removes duplicate keys, optimizes key order). Fast reads, **supports GIN indexing** (`USING GIN (jsonb_col)`).

### JSON Operators Reference
| Operator | Type | Description | Return Type |
| :--- | :--- | :--- | :--- |
| `->` | Field / Array Element | Extracts key value or array index | `json` / `jsonb` |
| `->>` | Field / Array Element | Extracts key value or array index | `text` |
| `#>` | Path Extraction | Extracts object at specified path array `'{a, b}'` | `json` / `jsonb` |
| `#>>` | Path Extraction | Extracts object at specified path array `'{a, b}'` | `text` |
| `@>` | Containment | Tests if left JSON contains right JSON | `boolean` |
| `?` | Existence | Tests if text key or array value exists | `boolean` |

### JSON Processing Functions
* `to_json(table_row)`: Converts SQL query row into a JSON object.
* `jsonb_array_length(jsonb_array)`: Returns integer count of elements in an array.
* `jsonb_array_elements(jsonb_array)` / `jsonb_array_elements_text()`: Unpacks JSON array elements into separate table rows.
* `jsonb_set(jsonb_col, path, new_value_jsonb)`: Modifies or adds a JSON value at a target path.

```sql
-- Querying JSONB earthquake data converted to timestamptz and numeric
SELECT earthquake #>> '{properties, place}' AS place,
       to_timestamp((earthquake #>> '{properties, time}')::bigint / 1000) AT TIME ZONE 'UTC' AS time,
       (earthquake #>> '{properties, mag}')::numeric AS magnitude
FROM earthquakes
WHERE (earthquake #>> '{properties, mag}')::numeric >= 6.0
ORDER BY magnitude DESC;
```

---

## Chapter 17: Saving Time with Views, Functions, and Triggers

### Views & Materialized Views
* **Standard View:** Stored query executed dynamically on access (`CREATE OR REPLACE VIEW view_name AS SELECT ...`). Updatable when referencing a single table with `WITH LOCAL CHECK OPTION`.
* **Materialized View:** Executes stored query once and physically saves output on disk for fast access (`CREATE MATERIALIZED VIEW mat_view AS SELECT ...`). Updated manually using `REFRESH MATERIALIZED VIEW mat_view [CONCURRENTLY];`.

### User-Defined Functions & Procedures
* **PL/pgSQL Functions:** Returns a typed value or table.

```sql
CREATE OR REPLACE FUNCTION percent_change(
    new_header numeric,
    old_header numeric,
    decimal_places integer DEFAULT 1
) RETURNS numeric AS $$
BEGIN
    RETURN round(((new_header - old_header) / old_header) * 100, decimal_places);
END;
$$ LANGUAGE plpgsql;
```

* **Stored Procedures (`PROCEDURE`):** Invoked with `CALL proc_name()`. Does not return values, but supports transaction management (`COMMIT`, `ROLLBACK`) inside code blocks.

### Automated Actions with Triggers
Triggers execute a PL/pgSQL function automatically when an `INSERT`, `UPDATE`, or `DELETE` event occurs on a target table.

```sql
-- 1. Create trigger function returning trigger
CREATE OR REPLACE FUNCTION record_if_grade_changed()
RETURNS trigger AS $$
BEGIN
    IF NEW.grade <> OLD.grade THEN
        INSERT INTO grades_history (student_id, course, old_grade, new_grade, change_time)
        VALUES (OLD.student_id, OLD.course, OLD.grade, NEW.grade, now());
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 2. Bind trigger to table
CREATE TRIGGER grade_change_trigger
AFTER UPDATE ON grades
FOR EACH ROW
EXECUTE FUNCTION record_if_grade_changed();
```