
-- BELIEVER'S RENTALS
-- TASK 4: CUSTOMER ANALYSIS

USE believers_rentals;

-- 1. TOTAL NUMBER OF CUSTOMERS
SELECT
    COUNT(*) AS total_customers
FROM Customers;

-- 2. CUSTOMERS WITH THE MOST ORDERS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_orders DESC;

-- 3. CUSTOMERS WHO HAVE NEVER PLACED AN ORDER
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 4. REVENUE BY CUSTOMER LOCATION
SELECT
    c.location,
    SUM(od.quantity * od.rental_days * od.unit_price) AS total_revenue
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Order_Details od
    ON o.order_id = od.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.location
ORDER BY total_revenue DESC;

-- 5. REPEAT CUSTOMER ANALYSIS
SELECT
    COUNT(*) AS repeat_customers
FROM (
    SELECT
        c.customer_id,
        COUNT(o.order_id) AS order_count
    FROM Customers c
    LEFT JOIN Orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id
    HAVING COUNT(o.order_id) > 1
) AS repeat_customer_list;

-- 6. CUSTOMER SPENDING CLASSIFICATION
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COALESCE(SUM(
        CASE
            WHEN o.order_status = 'Completed'
            THEN od.quantity * od.rental_days * od.unit_price
            ELSE 0
        END
    ), 0) AS total_spending,
    CASE
        WHEN COALESCE(SUM(
            CASE
                WHEN o.order_status = 'Completed'
                THEN od.quantity * od.rental_days * od.unit_price
                ELSE 0
            END
        ), 0) >= 1000 THEN 'VIP Customer'
        WHEN COALESCE(SUM(
            CASE
                WHEN o.order_status = 'Completed'
                THEN od.quantity * od.rental_days * od.unit_price
                ELSE 0
            END
        ), 0) >= 500 THEN 'Regular Customer'
        ELSE 'Low Spending Customer'
    END AS customer_category
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
LEFT JOIN Order_Details od
    ON o.order_id = od.order_id
GROUP BY c.customer_id, c.first_name, c.last_name;
