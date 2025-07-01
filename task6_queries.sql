SELECT DATABASE();
SHOW DATABASES;
use task6;
SHOW TABLES;
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary INT,
    experience INT
);
INSERT INTO employees (id, name, department, salary, experience) VALUES
(1, 'John', 'HR', 50000, 2),
(2, 'Alice', 'IT', 70000, 5),
(3, 'Bob', 'Finance', 65000, 4),
(4, 'Eve', 'IT', 80000, 7),
(5, 'Charlie', 'HR', 55000, 3);
SELECT * FROM employees;
-- subquery in select clause
SELECT name,
       salary,
       (SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees;
-- subquery in where clause
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
-- subquery in from clause
SELECT department, avg_salary
FROM (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
) AS dept_avg;
-- correlated subquery
SELECT name, department, salary
FROM employees e1
WHERE salary > (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e1.department = e2.department
);
-- using in with subquery
SELECT name, department
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    WHERE salary > 70000
);
-- using exsist
SELECT name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employees
    WHERE department = 'IT'
);

 