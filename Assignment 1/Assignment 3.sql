DROP DATABASE IF EXISTS Session4;
CREATE DATABASE IF NOT EXISTS Session4;
USE Session4;
-- Tạo bảng
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(12,0)
);
-- Insert dữ liệu
INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Laptop Dell XPS', 'Laptop', 25000000),
(2, 'iPhone 15 Pro', 'Điện thoại', 28000000),
(3, 'Samsung Galaxy S24', 'Điện thoại', 22000000),
(4, 'Tai nghe Sony WH-1000XM5', 'Phụ kiện', 8000000),
(5, 'Laptop MacBook Pro', 'Laptop', 35000000);
SELECT * FROM products;
-- 1. Sản phẩm có giá cao hơn giá trung bình
SELECT 
    product_id AS 'Mã SP',
    product_name AS 'Tên sản phẩm',
    category AS 'Loại',
    price AS 'Giá'
FROM products
WHERE price > (SELECT AVG(price) FROM products);
-- 2. Sản phẩm có giá cao nhất trong từng loại
SELECT 
    product_id AS 'Mã SP',
    product_name AS 'Tên sản phẩm',
    category AS 'Loại',
    price AS 'Giá'
FROM products
WHERE (category, price) IN (
    SELECT category, MAX(price) 
    FROM products 
    GROUP BY category
);
-- 3. Sản phẩm thuộc loại có ít nhất 1 sản phẩm giá trên 20 triệu
SELECT 
    product_id AS 'Mã SP',
    product_name AS 'Tên sản phẩm',
    category AS 'Loại',
    price AS 'Giá'
FROM products
WHERE category IN (
    SELECT DISTINCT category 
    FROM products 
    WHERE price > 20000000
)