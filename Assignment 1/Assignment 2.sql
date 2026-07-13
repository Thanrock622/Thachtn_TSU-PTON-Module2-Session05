USE Session4;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(12,0)
);
INSERT INTO employees (emp_id, full_name, department, salary) 
VALUES
(1, 'Nguyễn Văn An', 'Kỹ thuật', 15000000),
(2, 'Trần Thị Bình', 'Kinh doanh', 12000000),
(3, 'Lê Văn Cường', 'Kỹ thuật', 18000000),
(4, 'Phạm Thị Dung', 'Nhân sự', 10000000),
(5, 'Hoàng Văn Đức', 'Kinh doanh', 14000000);
SELECT * FROM employees;
-- Moi phong ban co bao nhieu nhan vien
SELECT 
    department AS 'Phòng ban',
    COUNT(*) AS 'Số lượng nhân viên'
FROM employees
GROUP BY department;
-- Muc luong trung binh
SELECT 
    department AS 'Phòng ban',
    COUNT(*) AS 'Số nhân viên',
    ROUND(AVG(salary), 0) AS 'Lương trung bình'
FROM employees
GROUP BY department;
-- phong ban tren 3 nhan vien
SELECT 
    department AS 'Phòng ban',
    COUNT(*) AS 'Số lượng nhân viên'
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;
-- phong ban luong trung binh hon 12tr
SELECT 
    department AS 'Phòng ban',
    COUNT(*) AS 'Số nhân viên',
    ROUND(AVG(salary), 0) AS 'Lương trung bình'
FROM employees
GROUP BY department
HAVING AVG(salary) > 12000000;
