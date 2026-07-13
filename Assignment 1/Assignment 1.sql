DROP DATABASE IF EXISTS Session4;
CREATE DATABASE IF NOT EXISTS Session4;
USE Session4;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    birth_date DATE,
    gender VARCHAR(10),
    score FLOAT
);
INSERT INTO students (student_id, full_name, birth_date, gender, score) VALUES
(1, 'Nguyễn Văn An', '2004-01-07', 'Nam', 8.57),
(2, 'Trần Thị Bình','2005-03-15', 'Nữ', 7.21),
(3, 'Lê Văn Cường', '2003-04-07', 'Nam', 9.11),
(4, 'Phạm Thị Dung', '2000-02-22', 'Nữ', 6.8),
(5, 'Hoàng Văn Đức', '1999-07-13', 'Nam', 8.0);
SELECT * FROM students;
SELECT student_id AS 'Mã Sinh Viên', UPPER(full_name) AS 'Họ tên' FROM students;
SELECT UPPER(full_name) AS 'Họ tên',
TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS 'Số Tuổi Sinh Viên' 
FROM students;
SELECT 
    student_id AS 'Mã Sinh Viên',
    UPPER(full_name) AS 'Họ tên',
    ROUND(score, 1) AS 'Điểm trung bình'
FROM students;
SELECT 
    COUNT(student_id) AS 'Tổng số sinh viên',
    MAX(score) AS 'Điểm cao nhất',
    MIN(score) AS 'Điểm thấp nhất'
FROM students;