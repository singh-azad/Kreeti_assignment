--using PostgreSql
--1.
--Write the query to get the department and department wise total(sum) salary,
--display it in ascending order according to salary.

SELECT departments.department_name,SUM(employees.salary) AS total_salary 
FROM departments,employees WHERE departments.department_id = employees.department_id 
GROUP BY department.department_name   ORDER BY total_salary;

--2.
--Write the query to get the department, total no. employee of each department,
--total(sum) salary with respect to department from "Employee" table.

SELECT departments.department_name,COUNT(employees.employee_id),SUM(employees.salary) 
FROM employees,departments WHERE departments.department_id = employees.department_id 
GROUP BY department_name; 

-- 3.
-- Get department wise maximum salary from "Employee" table order by salary
-- ascending


SELECT departments.department_name,MAX(employees.salary) AS max_salary
FROM employees,departments WHERE departments.department_id = employees.department_id
GROUP BY department_name ORDER BY max_salary; 

-- 4.
-- Write a query to get the departments where average salary is more than 60k

SELECT departments.department_name , AVG(employees.salary) AS a_salary 
FROM employees,departments WHERE departments.department_id = employees.department_id 
GROUP BY department_name HAVING AVG(employess.salary) > 60000;

-- 5.
-- Write down the query to fetch department name assign to more than one
-- Employee

SELECT departments.department_name AS more_than_one_employee 
FROM employees,departments WHERE departments.department_id = employees.department_id 
GROUP BY department_name HAVING COUNT(employee_id) > 1;

-- 6.
-- Write a query to show department_name and assignedTo where assignedTo
-- will be “One candidate” if its assigned to only one employee otherwise
-- “Multiple candidates”.

SELECT departments.department_name,
CASE 
  WHEN COUNT(employee_id) = 1 THEN 'One Candidate'
  ELSE 'Multiple candidates'
END AS assignedTo  
FROM employees,departments WHERE departments.department_id = employees.department_id 
GROUP BY department_name;