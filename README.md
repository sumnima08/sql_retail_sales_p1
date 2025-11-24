# Retail Sales Analysis Project

## Project Overview
This project analyzes retail sales data to extract actionable insights. Using SQL, the dataset is cleaned, explored, and analyzed to answer key business questions about sales trends, customer behavior, and category performance.  

The goal is to demonstrate SQL skills for data cleaning, exploration, and analysis while providing insights for retail decision-making.

---

## Dataset
The `retail_sales` table contains transactional data with the following columns:

| Column Name       | Data Type | Description                               |
|------------------|-----------|-------------------------------------------|
| `transactions_id` | INT       | Unique transaction identifier             |
| `sale_date`       | DATE      | Date of the transaction                    |
| `sale_time`       | TIME      | Time of the transaction                    |
| `customer_id`     | INT       | Unique customer identifier                 |
| `gender`          | VARCHAR   | Gender of the customer                     |
| `age`             | INT       | Age of the customer                        |
| `category`        | VARCHAR   | Product category                           |
| `quantity`        | INT       | Number of units sold                       |
| `price_per_unit`  | FLOAT     | Price per unit of the product              |
| `cogs`            | FLOAT     | Cost of goods sold                         |
| `total_sale`      | FLOAT     | Total sale amount for the transaction     |

---

## Project Steps

### 1. Data Cleaning
- Removed records with missing values in critical columns.
- Ensured dataset integrity before analysis.

### 2. Data Exploration
- Counted total transactions and unique customers.
- Listed all product categories.
- Checked sales distribution across gender, age, and category.

### 3. Data Analysis
Key analyses include:

- Daily transactions on a specific date.
- High-quantity sales in specific categories.
- Total and average sales per category.
- Average age of customers per category.
- High-value transactions (`total_sale > 1000`).
- Transactions by gender in each category.
- Best-selling month by average sales.
- Top 5 customers by total sales.
- Sales distribution by shift: Morning, Afternoon, Evening.

### 4. SQL Techniques Used
- `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`
- Aggregate functions: `SUM()`, `AVG()`, `COUNT()`
- Window functions: `RANK() OVER(PARTITION BY … ORDER BY …)`
- Common Table Expressions (CTEs)
- Data cleaning with `DELETE` statements

---

## Usage

Follow these steps to run the project:

1. **Download the project**
   ```bash https://github.com/sumnima08/sql_retail_sales_p1.git
