CREATE DATABASE bi_practical_01;
USE bi_practical_01;

CREATE TABLE student(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);

INSERT INTO student(id, name, marks) VALUES (1, "Krishna", 45), (2, "Rahul", 49);

SELECT * FROM student;