WITH customers AS (
  SELECT 
    id AS customer_id
    , name
    , email
  FROM `analytics-engineers-club.coffee_shop.customers`
)

, orders AS (
  SELECT 
    customer_id
    , MIN(created_at) AS first_order_at
    , COUNT(id) AS number_of_orders
  from `analytics-engineers-club.coffee_shop.orders`
  GROUP BY 1
)

SELECT
  c.customer_id
  , c.name 
  , c.email
  , o.first_order_at
  , o.number_of_orders
FROM customers c 
LEFT JOIN orders o 
  ON c.customer_id = o.customer_id
ORDER BY o.first_order_at
LIMIT 5
