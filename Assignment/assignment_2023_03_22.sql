--Using Postgres

-- 1.
-- From the following tables write a SQL query to find the details of an employee.
-- Return full name, email, salary, Department Name, postal code, and City.

SELECT CONCAT(e.first_name,' ',e.last_name) FullName,e.email,d.department_name,l.pincode,l.city  FROM 
employees e INNER JOIN departments d ON e.department_id = d.department_id 
INNER JOIN locations l ON d.location_id = l.location_id;

-- 2.
-- From the following tables write a SQL query to find the departments whose location is
-- in "Jammu Kashmir" or "Jharkhand". Return Department Name, state_province,
-- street_address.

SELECT d.department_name,l.state_province,l.street_address FROM departments d INNER JOIN locations l 
ON d.location_id = l.location_id where l.city = 'Jammu Kashmir' OR l.city = 'Jharkhand'; 

-- 3.
-- From the following tables write a SQL query to find the count of employees present in
-- different jobs whose average salary is greater than 10,000. Return all the jobs with
-- employee count, Job Name, and average salary.

SELECT COUNT(e.employee_id), j.job_title, AVG(e.salary) FROM employees e INNER JOIN 
jobs j ON e.job_id = j.job_id GROUP BY j.job_id HAVING AVG(e.salary) > 10000;

-- 4.
-- From the following table write a SQL query to find all the first_names and
-- last_names in both dependents and employees tables. Return the duplicate records as
-- well and order the records in descending order of the last_name column.

SELECT first_name,last_name FROM employees 
UNION
SELECT first_name,last_name FROM dependents ORDER BY last_name DESC;

-- 5.
-- From the following table write a SQL query to list every employee that has a manager
-- with the name of his or her manager. 

SELECT e.first_name,e.last_name,m.first_name,m.last_name FROM employees e INNER JOIN employees m 
ON e.manager_id = m.employee_id where e.first_name = m.first_name
AND e.last_name = m.last_name;

-- 6.
-- Find the departments that have more than 5 employees earning a salary greater than
-- 50,000 and are located in either New York or California. Include the department name,
-- location, and the number of employees meeting the criteria.

SELECT d.department_name,l.city,COUNT(e.employee_id) total_emp FROM employees e INNER JOIN departments d 
ON e.department_id = d.department_id INNER JOIN locations l ON d.location_id = l.location_id 
WHERE e.salary > 50000 AND l.city IN('New York','California') GROUP BY d.department_name,l.city
HAVING COUNT(e.employee_id) > 5;

-- 7.
-- List any employees who have dependents and have a job title that includes the word
-- 'manager', and sort the results by department name in ascending order.

SELECT e.employee_id,j.job_title,d.department_name FROM employees e INNER JOIN 
dependents dp ON dp.employee_id = e.employee_id INNER JOIN jobs j ON 
j.job_id = e.job_id INNER JOIN departments d ON d.department_id = e.department_id
WHERE j.job_title LIKE '%manager%' ORDER BY d.department_name;

-- 8.Add a column in the dependent table called “city” depicting their current location of
-- stay. 

ALTER TABLE dependents ADD COLUMN city varchar(255);

UPDATE dependents set city = 'KOLKATA' WHERE dependent_id in (1,3,5);
UPDATE dependents set city = 'DELHI' WHERE dependent_id in (2,4);

-- Find all employees who have been hired in the past 3 years and have dependents
-- living in a city that is different from the city they work in (if I work in Kolkata, then my
-- dependent should not be in Kolkata).

SELECT e.employee_id,dp.city,d.department_name,l.city FROM employees e INNER JOIN 
dependents dp ON dp.employee_id = e.employee_id INNER JOIN departments d ON d.department_id = e.department_id 
INNER JOIN locations l ON l.location_id = d.location_id WHERE dp.city != l.city AND e.hire_date >= current_date - interval '3 years';

-- Additionally, only include employees whose salary is greater than the average salary of
-- their job title(suppose, my job_title is ”developer” and the salary is 80k, and the average
-- salary under the same job_title “developer” is 70k), and whose manager's job title
-- includes the word 'director'. Finally, include the department name and location of each
-- employee, and sort the results by department name in ascending order

SELECT e.employee_id,dp.city,d.department_name,l.city FROM employees e 
INNER JOIN dependents dp ON dp.employee_id = e.employee_id 
INNER JOIN jobs j ON e.job_id = j.job_id 
INNER JOIN (SELECT m.employee_id,j.job_title manager_job_title FROM  employees m INNER JOIN jobs j 
ON m.job_id = j.job_id) manager ON manager.employee_id = e.employee_id
INNER JOIN departments d ON d.department_id = e.department_id 
INNER JOIN locations l ON l.location_id = d.location_id 
INNER JOIN(SELECT j.job_title,AVG(e.salary) avg_salary FROM jobs j INNER JOIN employees e
ON j.job_id = e.job_id GROUP BY j.job_title) job_avg ON j.job_title = job_avg.job_title
WHERE dp.city != l.city AND e.hire_date >= current_date - interval '3 years' AND e.salary > job_avg.avg_salary AND manager.manager_job_title 
LIKE '%director%' ORDER BY d.department_name;