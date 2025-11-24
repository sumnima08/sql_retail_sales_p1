--Data Cleaning

SELECT
	COUNT(*)
FROM retail_sales;

--
SELECT * FROM retail_sales
WHERE transactions_id IS NULL;

SELECT * FROM retail_sales
WHERE sale_date IS NULL;

SELECT * FROM retail_sales
WHERE sale_time IS NULL;

SELECT * FROM retail_sales
WHERE 
	transactions_id IS NULL
	OR
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR 
	gender IS NULL
	OR
	category IS NULL
	OR
	quantiy IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL;

--
DELETE FROM retail_sales
WHERE 
	transactions_id IS NULL
	OR
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR 
	gender IS NULL
	OR
	category IS NULL
	OR
	quantiy IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL;

-- Data Exploration

-- How many sales we have?

SELECT COUNT(*) AS total_sale FROM retail_sales;

-- How many unique customers we have?
SELECT COUNT(DISTINCT customer_id) AS total_sale FROM retail_sales;

SELECT DISTINCT category FROM retail_sales;

-- Data Analysis & Business Key Problems and Ansers

-- SQL query to retrieve all columns for sales made on '2022-11-05'

SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

-- Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

SELECT *
FROM retail_sales
WHERE category = 'Clothing' 
	AND
	TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
	AND
	quantiy >=4;

-- Calculating total sales  for each category

SELECT category, 
	SUM(total_sale) AS net_sales,
	COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;

-- Finding average age of customers who purchased items from 'Beauty' category

SELECT 
	ROUND(AVG(age),2)
FROM retail_sales
WHERE category = 'Beauty';

-- Finding all transactions where total_sale is greater than 1000

SELECT *
FROM retail_sales
WHERE total_sale > 1000;

-- Finding total number of transactions made by each gender in each category

SELECT category, 
		gender,
		COUNT(*) AS total_trans
FROM retail_sales
GROUP BY category, gender
ORDER BY 1;

-- Calculating the average sale for each month and best selling month in each month

SELECT 
		year,
		month,
		avg_sale
FROM
(
SELECT 
		EXTRACT(YEAR FROM sale_date) AS year,
		EXTRACT(MONTH FROM sale_date) AS month, 
		AVG(total_sale) AS avg_sale,
		RANK() OVER(
		PARTITION BY EXTRACT (YEAR FROM sale_date)
		ORDER BY AVG(total_sale) DESC
		) AS rank_num
FROM retail_sales
GROUP BY 1,2 
) AS t
WHERE rank_num = 1;

--Finding top 5 customers based on the highest total retail_sales

SELECT 
		customer_id, 
		SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY 2 DESC
LIMIT 5;

--Finding the number of customers who purchased items from each category

SELECT 
	category,
	COUNT(DISTINCT customer_id) AS cnt_unique_cs
FROM retail_sales
GROUP BY category;

--Creating each shift and number of orders (Example Morning < 12, Afternoon Between 12 & 17, Evening > 17)

WITH hourly_sale
AS
(
SELECT *,
	CASE 
		WHEN EXTRACT (HOUR FROM sale_time) < 12 THEN 'Morning'
		WHEN EXTRACT (HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
	END AS shift
FROM retail_sales
)
SELECT 
	shift,
	COUNT(*) as total_orders
FROM hourly_sale
GROUP BY shift
