-- Create a Hospital Staff Management System using Department and Staff tables.
-- 1. Create both tables with suitable attributes and establish a Primary Key and Foreign Key relationship.
-- 2. Apply appropriate NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
-- 3. Insert at least 4 department records and 6 staff records.
-- 4. Display staff members whose salaries fall between ₹25,000 and ₹50,000.
-- 5. Display staff members whose names start with a specified letter using LIKE.
-- 6. Display staff members belonging to selected departments using IN.
-- 7. Display unique staff designations using DISTINCT.
-- 8. Count the number of staff members in each department using GROUP BY and COUNT().
-- 9. Display the maximum and minimum salary using MAX() and MIN().
-- 10. Update the salary of a staff member.
-- 11. Display the final staff records using SELECT with appropriate column aliases.
-- give one simple continous code checking the code at all times

CREATE DATABASE hospital_3;
use hospital_3;

CREATE TABLE departments (
    dept_id     INT PRIMARY KEY,
    department_name   VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE staff (
	staff_id INT PRIMARY KEY,
    staff_name VARCHAR (50) NOT NULL,
    designation VARCHAR (50) DEFAULT 'Nurse',
    salary INT (10) NOT NULL CHECK (salary > 0),
    email VARCHAR (100) UNIQUE,
    dept_id INT NOT NULL
    
);

INSERT INTO departments
VALUES
(1,'NEURO'),
(2,'CARDIO'),
(3,'ORTHO'),
(4,'EMERGENCY');

INSERT INTO staff
VALUES
(101, 'Amit', 'Doctor', 45000, 'amit@hospital.com', 1),
(102, 'Sumit', 'Nurse', 28000, 'sumit@hospital.com', 2),
(103, 'Rishit', 'Surgeon', 60000, 'rishit@hospital.com', 3),
(104, 'Amt', 'Technitian', 32000, 'amt@hospital.com', 4);

SELECT * FROM staff WHERE salary BETWEEN 25000 AND 50000;

SELECT * FROM staff WHERE staff_name LIKE 'A%';

SELECT * FROM staff WHERE dept_id IN (1,2);

SELECT DISTINCT designation from staff;

SELECT dept_id , COUNT(*) FROM staff GROUP BY dept_id;

SELECT MAX(salary) , MIN(SALARY) from staff;

UPDATE staff
SET salary = 90000 WHERE staff_id = 101;

SELECT staff_id AS "ID OF STAFF",
staff_name AS "NAME OF STAFF",
designation AS "POSITION",
salary AS "MOOLA",
email AS "EMAIL ADDRESS"
FROM staff;


