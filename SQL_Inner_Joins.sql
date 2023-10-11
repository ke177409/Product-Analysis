--Here is a SQL query using multiple inner joins to find the top 5 paying customers from countries with the highest number of customers:

SELECT customer.customer_id,
       customer.first_name,
       customer.last_name,
       country.country,
       city.city,
SUM(amount) AS Total_Amount_Paid
FROM country
INNER JOIN city ON country.country_id = city.country_id
INNER JOIN address ON city.city_id = address.city_id
INNER JOIN customer ON customer.address_id = address.address_id
INNER JOIN payment ON payment.customer_id = customer.customer_id
WHERE country IN ('India', 'China', 'United States', 'Japan', 'Mexico', 'Brazil', 'Russian Federation', 'Philippines', 'Turkey', 'Indonesia')
GROUP BY 1, 2, 3, 4, 5
ORDER BY 6 DESC
LIMIT 5
