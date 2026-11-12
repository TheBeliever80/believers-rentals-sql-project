
-- BELIEVER'S RENTALS
-- TASK 2: DATA INSERTION

USE believers_rentals;

-- 1. CUSTOMERS
INSERT INTO Customers
(first_name, last_name, phone, email, location)
VALUES
('Kwame', 'Mensah', '0241111111', 'kwame@email.com', 'Accra'),
('Ama', 'Owusu', '0242222222', 'ama@email.com', 'Kumasi'),
('Kofi', 'Asare', '0243333333', 'kofi@email.com', 'Tema'),
('Abena', 'Boateng', '0244444444', 'abena@email.com', 'Accra'),
('Yaw', 'Darko', '0245555555', 'yaw@email.com', 'Cape Coast'),
('Akosua', 'Appiah', '0246666666', 'akosua@email.com', 'Kumasi'),
('Kojo', 'Frimpong', '0247777777', 'kojo@email.com', 'Accra'),
('Efua', 'Arthur', '0248888888', 'efua@email.com', 'Takoradi'),
('Nana', 'Osei', '0249999999', 'nana@email.com', 'Tema'),
('Adwoa', 'Sarpong', '0240000000', 'adwoa@email.com', 'Accra');

-- 2. EMPLOYEES
INSERT INTO Employees
(first_name, last_name, department, salary)
VALUES
('Daniel', 'Mensah', 'Management', 5000),
('Sarah', 'Owusu', 'Sales', 3500),
('Michael', 'Boateng', 'Operations', 3200),
('Esther', 'Asante', 'Customer Service', 2800),
('Joseph', 'Addo', 'Finance', 4000);

-- 3. PRODUCTS
INSERT INTO Products
(product_name, category, rental_price, cost_price, stock_quantity)
VALUES
('Plastic Chair', 'Furniture', 5, 40, 200),
('Folding Table', 'Furniture', 30, 180, 40),
('Canopy Tent', 'Event Equipment', 150, 900, 15),
('Public Address System', 'Electronics', 200, 1500, 8),
('Projector', 'Electronics', 100, 1200, 10),
('Generator', 'Power Equipment', 250, 2500, 6),
('Carpet', 'Event Equipment', 50, 300, 25),
('Plastic Table', 'Furniture', 15, 100, 60),
('Lighting Set', 'Electronics', 120, 800, 4),
('Cooler', 'Equipment', 40, 200, 20);

-- 4. ORDERS
INSERT INTO Orders
(customer_id, employee_id, order_date, order_status)
VALUES
(1, 2, '2026-01-05', 'Completed'),
(2, 2, '2026-01-08', 'Completed'),
(3, 3, '2026-01-12', 'Completed'),
(4, 2, '2026-02-02', 'Completed'),
(5, 3, '2026-02-10', 'Pending'),
(6, 4, '2026-02-15', 'Completed'),
(7, 2, '2026-03-01', 'Completed'),
(8, 3, '2026-03-07', 'Pending'),
(1, 4, '2026-03-12', 'Completed'),
(9, 5, '2026-03-20', 'Completed'),
(10, 2, '2026-04-03', 'Completed'),
(2, 3, '2026-04-10', 'Completed'),
(3, 4, '2026-04-15', 'Pending'),
(4, 5, '2026-05-02', 'Completed'),
(5, 2, '2026-05-10', 'Completed');

-- 5. ORDER DETAILS
INSERT INTO Order_Details
(order_id, product_id, quantity, rental_days, unit_price)
VALUES
(1,1,100,1,5), (1,2,10,1,30),
(2,3,1,2,150), (2,1,50,2,5),
(3,4,1,1,200), (3,5,1,1,100),
(4,6,1,2,250), (4,7,5,2,50),
(5,2,5,1,30), (5,8,10,1,15),
(6,9,2,1,120), (6,10,5,2,40),
(7,3,2,1,150), (7,4,1,1,200),
(8,5,2,2,100), (8,7,10,1,50),
(9,1,80,1,5), (9,8,20,1,15),
(10,6,1,1,250), (10,10,10,1,40),
(11,2,10,2,30), (11,3,1,1,150),
(12,4,1,2,200), (12,9,1,2,120),
(13,1,40,1,5), (13,7,5,1,50),
(14,5,1,1,100), (14,8,10,2,15),
(15,3,1,2,150), (15,6,1,1,250);

-- 6. PAYMENTS
INSERT INTO Payments
(order_id, payment_date, amount, payment_method, payment_status)
VALUES
(1,'2026-01-05',800,'Mobile Money','Paid'),
(2,'2026-01-08',500,'Cash','Paid'),
(3,'2026-01-12',300,'Bank Transfer','Paid'),
(4,'2026-02-02',750,'Mobile Money','Paid'),
(5,'2026-02-10',100,'Cash','Partial'),
(6,'2026-02-15',300,'Mobile Money','Paid'),
(7,'2026-03-01',500,'Bank Transfer','Paid'),
(8,'2026-03-07',200,'Cash','Partial'),
(9,'2026-03-12',700,'Mobile Money','Paid'),
(10,'2026-03-20',300,'Cash','Paid'),
(11,'2026-04-03',750,'Bank Transfer','Paid'),
(12,'2026-04-10',500,'Mobile Money','Partial'),
(13,'2026-04-15',100,'Cash','Partial'),
(14,'2026-05-02',250,'Mobile Money','Paid'),
(15,'2026-05-10',400,'Bank Transfer','Partial');

-- VERIFY THE DATA
SELECT COUNT(*) AS total_customers FROM Customers;
SELECT COUNT(*) AS total_employees FROM Employees;
SELECT COUNT(*) AS total_products FROM Products;
SELECT COUNT(*) AS total_orders FROM Orders;
SELECT COUNT(*) AS total_order_details FROM Order_Details;
SELECT COUNT(*) AS total_payments FROM Payments;
