   CREATE SCHEMA dannys_diner;
    SET search_path = dannys_diner;
    
    CREATE TABLE sales (
      "customer_id" VARCHAR(1),
      "order_date" DATE,
      "product_id" INTEGER
    );
    
    INSERT INTO sales
      ("customer_id", "order_date", "product_id")
    VALUES
      ('A', '2021-01-01', '1'),
      ('A', '2021-01-01', '2'),
      ('A', '2021-01-07', '2'),
      ('A', '2021-01-10', '3'),
      ('A', '2021-01-11', '3'),
      ('A', '2021-01-11', '3'),
      ('B', '2021-01-01', '2'),
      ('B', '2021-01-02', '2'),
      ('B', '2021-01-04', '1'),
      ('B', '2021-01-11', '1'),
      ('B', '2021-01-16', '3'),
      ('B', '2021-02-01', '3'),
      ('C', '2021-01-01', '3'),
      ('C', '2021-01-01', '3'),
      ('C', '2021-01-07', '3');
     
    
    CREATE TABLE menu (
      "product_id" INTEGER,
      "product_name" VARCHAR(5),
      "price" INTEGER
    );
    
    INSERT INTO menu
      ("product_id", "product_name", "price")
    VALUES
      ('1', 'sushi', '10'),
      ('2', 'curry', '15'),
      ('3', 'ramen', '12');
      
    
    CREATE TABLE members (
      "customer_id" VARCHAR(1),
      "join_date" DATE
    );
    
    INSERT INTO members
      ("customer_id", "join_date")
    VALUES
      ('A', '2021-01-07'),
      ('B', '2021-01-09');

---

**Query #1**

    /* --------------------
       Case Study Questions
       --------------------*/
    
    -- 1. What is the total amount each customer spent at the restaurant?
    /*
    SELECT
    	customer_id,
        SUM(price)
    FROM dannys_diner.sales JOIN dannys_diner.menu ON
    dannys_diner.sales.product_id = dannys_diner.menu.product_id
    GROUP BY customer_id
|customer_id|sum|
|---|---|
|B|74|
|C|36|
|A|76|
    */
    -- 2. How many days has each customer visited the restaurant?
    /*
    SELECT
    	customer_id,
        COUNT(DISTINCT order_date)
    FROM dannys_diner.sales 
    GROUP BY customer_id
    */
|customer_id|count|
|---|---|
|A|4|
|B|6|
|C|2|
    -- 3. What was the first item from the menu purchased by each customer?
    
    -- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
    
    /*
    SELECT
    	product_name,COUNT(sales.product_id)
    FROM dannys_diner.sales JOIN menu ON sales.product_id = menu.product_id 
    GROUP BY menu.product_name ORDER BY count DESC LIMIT 1
    */
    |product_name|count|
|---|---|
|ramen|8|
    -- 5. Which item was the most popular for each customer?
    /*
WITH customer_prod_count AS (SELECT
    	customer_id,product_id,COUNT(product_id)
    FROM dannys_diner.sales 
    GROUP BY customer_id,product_id
    ORDER BY customer_id,count DESC)
    
    SELECT cpc.customer_id, product_name,count FROM customer_prod_count cpc JOIN (SELECT customer_id,MAX(count) FROM customer_prod_count GROUP BY customer_id) as cpm ON
    cpc.customer_id = cpm.customer_id AND cpc.count = cpm.max JOIN menu ON menu.product_id = cpc.product_id
    */
    -- 6. Which item was purchased first by the customer after they became a member?
    /*
  WITH order_after_membership AS (SELECT m.customer_id, MIN(order_date) order_after_membership FROM members m JOIN sales s
    ON m.customer_id = s.customer_id AND s.order_date >= m.join_date GROUP BY m.customer_id)
    
    SELECT o.customer_id,s.order_date,menu.product_name FROM order_after_membership o JOIN
    sales s ON o.customer_id = s.customer_id AND s.order_date = o.order_after_membership JOIN menu ON s.product_id = menu.product_id
    */
    -- 7. Which item was purchased just before the customer became a member?
    /*
     WITH order_after_membership AS (SELECT m.customer_id, MIN(order_date) order_after_membership FROM members m JOIN sales s
    ON m.customer_id = s.customer_id AND s.order_date < m.join_date GROUP BY m.customer_id)
    
    SELECT o.customer_id,s.order_date,menu.product_name FROM order_after_membership o JOIN
    sales s ON o.customer_id = s.customer_id AND s.order_date = o.order_after_membership  JOIN menu ON s.product_id = menu.product_id
    */
    -- 8. What is the total items and amount spent for each member before they became a member?
    /*
    WITH order_before_membership AS (SELECT DISTINCT m.customer_id, order_date FROM members m JOIN sales s
    ON m.customer_id = s.customer_id AND s.order_date < m.join_date)
    
-- SELECT * FROM order_before_membership
SELECT o.customer_id,COUNT(*),
SUM(menu.price) FROM order_before_membership o JOIN
 sales s ON o.customer_id = s.customer_id AND s.order_date = o.order_date JOIN menu ON s.product_id = menu.product_id
 GROUP BY o.customer_id
|customer_id|count|sum|
|---|---|---|
|B|3|40|
|A|2|25|
    */
    -- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
    /*
    SELECT s.customer_id,SUM(CASE WHEN product_name = 'sushi' THEN 10*price*2 ELSE price*10 END) points FROM sales s JOIN menu m ON m.product_id = s.product_id GROUP BY customer_id
    |customer_id|points|
|---|---|
|B|940|
|C|360|
|A|860|
    */
    -- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
    
    -- Example Query:
    
    
    SELECT m.customer_id, SUM(CASE WHEN menu.product_name = 'sushi' THEN 10*menu.price*2 WHEN s.order_date - m.join_date >=0 AND  s.order_date - m.join_date <6  THEN 10*menu.price*2 ELSE 10*menu.price END) FROM members m JOIN
    sales s ON m.customer_id = s.customer_id JOIN menu on menu.product_id = s.product_id
    WHERE s.order_date >= '2021-01-01' AND s.order_date < '2021-02-01'
    GROUP BY m.customer_id

| customer_id | sum  |
| ----------- | ---- |
| B           | 820  |
| A           | 1370 |
Bonus
### Join All The Things

The following questions are related creating basic data tables that Danny and his team can use to quickly derive insights without needing to join the underlying tables using SQL.

Recreate the following table output using the available data:
/*
SELECT 
    s.customer_id,
    s.order_date,
    m.product_name,
    m.price,
    CASE WHEN 
order_date >= join_date THEN 'y' ELSE 'n' END AS members,
CASE WHEN order_date >= join_date THEN RANK() OVER(PARTITION BY s.customer_id,order_date >= join_date ORDER BY order_date) ELSE NULL END AS ranking
FROM sales s
LEFT JOIN menu m ON s.product_id = m.product_id
LEFT JOIN members mem ON s.customer_id = mem.customer_id
ORDER BY s.customer_id, s.order_date;
*/

### Rank All The Things

Danny also requires further information about the `ranking` of customer products, but he purposely does not need the ranking for non-member purchases so he expects null `ranking` values for the records when customers are not yet part of the loyalty program.
/*
SELECT 
    s.customer_id,
    s.order_date,
    m.product_name,
    m.price,
    CASE WHEN 
order_date >= join_date THEN 'y' ELSE 'n' END AS members,
CASE WHEN order_date >= join_date THEN RANK() OVER(PARTITION BY s.customer_id,order_date >= join_date ORDER BY order_date) ELSE NULL END AS ranking
FROM sales s
LEFT JOIN menu m ON s.product_id = m.product_id
LEFT JOIN members mem ON s.customer_id = mem.customer_id
ORDER BY s.customer_id, s.order_date;
*/
