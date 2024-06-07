SELECT
    DATE_TRUNC(first_order_at, MONTH) AS signup_month
    , COUNT(*) as new_customers
FROM {{ ref('customers')}}
GROUP BY 1