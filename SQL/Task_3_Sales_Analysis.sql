
-- BELIEVER'S RENTALS
-- TASK 3: SALES ANALYSIS

USE believers_rentals;

-- 1. TOTAL ORDER VALUE
SELECT
    SUM(quantity * rental_days * unit_price) AS total_order_value
FROM Order_Details;

-- 2. REVENUE FROM COMPLETED ORDERS
SELECT
    SUM(od.quantity * od.rental_days * od.unit_price) AS completed_revenue
FROM Orders o
JOIN Order_Details od
    ON o.order_id = od.order_id
WHERE o.order_status = 'Completed';

-- 3. MONTHLY REVENUE
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    SUM(od.quantity * od.rental_days * od.unit_price) AS monthly_revenue
FROM Orders o
JOIN Order_Details od
    ON o.order_id = od.order_id
WHERE o.order_status = 'Completed'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;

-- 4. REVENUE PER PRODUCT
SELECT
    p.product_name,
    SUM(od.quantity * od.rental_days * od.unit_price) AS product_revenue
FROM Products p
JOIN Order_Details od
    ON p.product_id = od.product_id
JOIN Orders o
    ON od.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name
ORDER BY product_revenue DESC;

-- 5. TOTAL QUANTITY RENTED PER PRODUCT
SELECT
    p.product_name,
    SUM(od.quantity) AS total_quantity_rented
FROM Products p
JOIN Order_Details od
    ON p.product_id = od.product_id
JOIN Orders o
    ON od.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_rented DESC;

-- 6. TOP SPENDING CUSTOMERS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(od.quantity * od.rental_days * od.unit_price) AS total_spending
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Order_Details od
    ON o.order_id = od.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spending DESC;

-- 7. AVERAGE ORDER VALUE
SELECT
    AVG(order_total) AS average_order_value
FROM (
    SELECT
        o.order_id,
        SUM(od.quantity * od.rental_days * od.unit_price) AS order_total
    FROM Orders o
    JOIN Order_Details od
        ON o.order_id = od.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY o.order_id
) AS order_summary;

-- 8. REVENUE BY PRODUCT CATEGORY
SELECT
    p.category,
    SUM(od.quantity * od.rental_days * od.unit_price) AS category_revenue
FROM Products p
JOIN Order_Details od
    ON p.product_id = od.product_id
JOIN Orders o
    ON od.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
ORDER BY category_revenue DESC;

-- 9. COMPLETED ORDERS PER EMPLOYEE
SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    COUNT(o.order_id) AS completed_orders
FROM Employees e
JOIN Orders o
    ON e.employee_id = o.employee_id
WHERE o.order_status = 'Completed'
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY completed_orders DESC;

-- 10. TOP FIVE REVENUE-GENERATING PRODUCTS
SELECT
    p.product_name,
    SUM(od.quantity * od.rental_days * od.unit_price) AS revenue
FROM Products p
JOIN Order_Details od
    ON p.product_id = od.product_id
JOIN Orders o
    ON od.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC
LIMIT 5;
