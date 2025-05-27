CREATE DATABASE sql_pr;
USE sql_pr;

-- DATABASE CREATION 
CREATE TABLE retail_sales (
 transactions_id INT PRIMARY KEY,
 sale_date DATE,
 sale_time TIME,
 customer_id INT,
 gender VARCHAR(15),
 age INT,
 category VARCHAR(30),
 quantity INT,
 price_per_unit FLOAT,
 cogs FLOAT,
 total_sale FLOAT
);

-- Determine the total number of records in the dataset.
SELECT COUNT(*) FROM retail_sales;


SELECT * FROM retail_sales
LIMIT 100;
    
-- Check for any null values in the dataset 
    
    SELECT * FROM retail_sales
WHERE 
    transactions_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR customer_id IS NULL
    OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
    OR quantity IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;
    
    
    
    -- delete records with missing data
    SET SQL_SAFE_UPDATES = 0;
DELETE FROM retail_sales
WHERE 
    transactions_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR customer_id IS NULL
    OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
    OR quantity IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;
    
    -- HOW MANY UNIQUE CUSTOMER ARE THERE 
    
    select count(DISTINCT customer_id) as total_sale FROM retail_sales;
    select count(DISTINCT category) as total_sale FROM retail_sales;
    
    -- unique distinct category
    SELECT DISTINCT category FROM retail_sales;
    
    --  DATA ANALYSIS
    
-- 1.Write a SQL query to retrieve all columns for sales made on '2022-11-05:
    select * from retail_sales
    where sale_date = '2022-11-05';

-- 2.Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
select * from retail_sales
where
     category = 'clothing' AND quantity>=0;

SELECT category, SUM(quantity)
FROM retail_sales
WHERE category = 'clothing'
      AND  
        TO_CHAR(sale_date, YYYY-MM) = '2022-11'
GROUP BY 1;


-- 3.Calculate total sales for each category

SELECT category, count(category), SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY category;

-- 4.To find the average age of customer who purcahsed items from the beauty category

SELECT category, avg(age) FROM retail_sales 
WHERE category = 'Beauty';

-- 5.Write a sql query to find all transaction where the total sale is greater than 1000

SELECT * FROM retail_sales
WHERE total_sale>1000;

-- 6.Write  a sql  query to find the total number of transaction (trans_id) made by each gender in category --

SELECT count(transactions_id) as num_of_trans , category, gender
FROM retail_sales
GROUP BY category, gender;

-- 7.Write a SQL query to calculate the avg sale for each months. Find out best selling month in each year
SELECT 
       YEAR(sale_date) as sales_year,
       month(sale_date) as sales_month,
       AVG(total_sale)
FROM retail_sales
GROUP BY 1,2
ORDER BY 1,2;

-- 8.write a sql query to find top 5 customer based on higest total sales

SELECT customer_id, SUM(total_sale)
FROM retail_sales
GROUP BY customer_id
ORDER BY 2 DESC
LIMIT 5;

-- 9.WRITE A SQL QUERY TO FIND THE NUMBER OF UNIQUE CUSTOMER WHO PURCAHSED ITEMS FROM EACH CATEGORY

SELECT category, count(DISTINCT customer_id) as UNIQUE_customer
FROM retail_sales
GROUP BY category;


-- 10.WRITE A SQL QUERY TO CREATE EACH SHIFT AND NO. OF ORDER 

SELECT *,
	CASE
        WHEN HOUR(sale_time)<12 THEN 'morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'aftternoon'
        ELSE 'EVENING'
        END SHIFT
 FROM retail_sales;       
       







