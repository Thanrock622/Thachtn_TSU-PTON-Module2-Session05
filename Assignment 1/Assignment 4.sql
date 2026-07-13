DROP DATABASE IF EXISTS Session4;
CREATE DATABASE IF NOT EXISTS Session4;
USE Session4;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Order_items (
    order_id INT,
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(12,0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
INSERT INTO Customers (customer_id, customer_name) VALUES
(1, 'Nguyễn Văn An'),
(2, 'Trần Thị Bình'),
(3, 'Lê Văn Cường'),
(4, 'Phạm Thị Dung'),
(5, 'Hoàng Văn Đức');
INSERT INTO Orders (order_id, order_date, customer_id) VALUES
(101, '2026-01-15', 1),
(102, '2026-01-20', 2),
(103, '2026-02-01', 1),
(104, '2026-02-10', 3),
(105, '2026-02-15', 4),
(106, '2026-03-01', 5);
INSERT INTO Order_items (order_id, product_name, quantity, price) VALUES
(101, 'Laptop Dell XPS', 1, 25000000),
(101, 'Chuột không dây', 2, 500000),
(102, 'iPhone 15 Pro', 1, 28000000),
(102, 'Ốp lưng iPhone', 3, 200000),
(103, 'Tai nghe Sony', 2, 8000000),
(104, 'iPad Pro M2', 1, 20000000),
(104, 'Bàn phím Bluetooth', 1, 2500000),
(104, 'Chuột Logitech', 1, 1500000),
(105, 'Samsung Galaxy S24', 1, 22000000),
(105, 'Sạc nhanh', 2, 1000000),
(106, 'Laptop MacBook Pro', 1, 35000000),
(106, 'USB 64GB', 5, 500000);
-- 1. Hiển thị mã đơn hàng, ngày đặt, tên khách hàng
SELECT 
    o.order_id AS 'Mã đơn hàng',
    o.order_date AS 'Ngày đặt hàng',
    c.customer_name AS 'Tên khách hàng'
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id;
-- 2. Danh sách sản phẩm trong mỗi đơn hàng
SELECT 
    o.order_id AS 'Mã đơn hàng',
    o.order_date AS 'Ngày đặt',
    c.customer_name AS 'Khách hàng',
    oi.product_name AS 'Tên sản phẩm',
    oi.quantity AS 'Số lượng',
    oi.price AS 'Đơn giá'
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN Order_items oi ON o.order_id = oi.order_id
ORDER BY o.order_id, oi.product_name;
-- 3. Tổng tiền mỗi đơn hàng
SELECT 
    o.order_id AS 'Mã đơn hàng',
    o.order_date AS 'Ngày đặt',
    c.customer_name AS 'Khách hàng',
    SUM(oi.quantity * oi.price) AS 'Tổng tiền'
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN Order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.order_date, c.customer_name
ORDER BY o.order_date;
-- 4. Đơn hàng có tổng tiền > 10.000.000
SELECT 
    o.order_id AS 'Mã đơn hàng',
    o.order_date AS 'Ngày đặt',
    c.customer_name AS 'Khách hàng',
    SUM(oi.quantity * oi.price) AS 'Tổng tiền'
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN Order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.order_date, c.customer_name
HAVING SUM(oi.quantity * oi.price) > 10000000
ORDER BY o.order_date;