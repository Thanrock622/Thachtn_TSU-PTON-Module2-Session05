CREATE DATABASE IF NOT EXISTS Assignment1;
USE Assignment1;
CREATE TABLE students (
student_id INT PRIMARY KEY,
full_nam VARCHAR(255),
birth_day DATE,
gender VARCHAR(10),
email VARCHAR(45)
);