-- Filtering with WHERE, Comparison, Logical Operators

-- Filter by 1 condition
select * from customer_churn
where gender = 'female';

-- Filter by more than 1 condition (AND)
select * from customer_churn
where gender = 'male' AND Churn = 'Yes';

-- Filter using OR
select * from customer_churn
where Contract = 'Month-to-month' OR Contract = 'One year';

-- BETWEEN Operator
select * from customer_churn
where tenure between 12 AND 24;

-- IN Operator
select * from customer_churn
where PaymentMethod IN ('Mailed check', 'Electronic check');

-- Wildcards & LIKE Operator

-- Find customerID starting with '75'
select * from customer_churn
where customerID like '75%';

-- Find customerID ending with 'EG'
select * from customer_churn
where customerID like '%EG';

-- Find customerID containing 'VH'
select * from customer_churn
where customerID like '%VH%';

-- String/Text Functions

-- UPPER & LOWER
select upper(gender), lower(gender) from customer_churn;

-- LENGTH
select customerID, length(customerID) as id_length
from customer_churn;

-- TRIM 
-- The TRIM() function in SQL is used to remove unwanted spaces 
-- or specific characters from the beginning and/or end of a string.

select trim(PaymentMethod) from customer_churn;

-- SUBSTRING
select substring(customerID, 1, 4) as first_fourchars 
from customer_churn;

-- REVERSE
-- Use case in data analysis:
-- Sometimes used for string manipulation, pattern checking, 
-- or even data masking.
-- For example, if IDs always end with a number, reversing 
-- them can help extract patterns easily.

select reverse(customerID) from customer_churn;

-- LEFT & RIGHT
select left(customerID, 5), right(customerID, 3)
from customer_churn;

-- CONCAT
select concat(gender, '-', Contract) as customer_info
from customer_churn;

-- NULL Handling
-- COALESCE
-- Key Points
-- Returns the first non-NULL value.
-- Can take any number of arguments.
-- Useful for handling missing values, default values, or combining columns.

-- COALESCE
SELECT COALESCE(TotalCharges, 'NA') FROM customer_churn;

-- CONCAT + COALESCE
SELECT CONCAT(COALESCE(Dependents,'NoInfo'), '-', COALESCE(Partner,'NoInfo')) 
AS FamilyStatus FROM customer_churn;

-- CONCAT_WS (with separator)
SELECT CONCAT_WS(',', customerID, gender, Contract) AS CustomerDetails 
FROM customer_churn;

-- CONCAT_WS (with separator)
-- Key Points
-- Adds a separator between each value.
-- Ignores NULL values automatically.
-- Useful for creating full names, addresses, 
-- or combined information in a single column.

SELECT CONCAT_WS(',', customerID, gender, Contract) AS CustomerDetails 
FROM customer_churn;

-- Aggregation, Grouping, Sorting

-- Aggregation
select avg(MonthlyCharges) as avg_charges, max(tenure) as maximum_tenure
from customer_churn;

-- GROUP BY
select Contract, count(*) as customer_count
from customer_churn
group by Contract;

-- HAVING
select Contract, count(*) as customer_count
from customer_churn
group by Contract
having count(*) > 1000;

-- ORDER BY
SELECT * FROM customer_churn
ORDER BY MonthlyCharges DESC;

-- LIMIT
SELECT * FROM customer_churn
LIMIT 10;

-- Calculate Churn Rate
SELECT 
    (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS ChurnRate
FROM customer_churn;



























