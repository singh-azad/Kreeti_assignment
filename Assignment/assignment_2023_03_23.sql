--Using Postgres

-- 1.
-- Find all the departments where the minimum salary is less than 2000.

select department_name from departments where dependent_id in 
(select distinct(department_id) from employees where salary < 2000);
-- 2.
-- Find all the countries where no employees exist.

SELECT c.country_name FROM countries c WHERE c.country_id NOT IN 
(SELECT distinct(l.country_id) FROM locations l WHERE l.location_id IN 
(SELECT distinct(d.location_id) FROM  departments d WHERE d.department_id IN 
(SELECT distinct(e.department_id) FROM employees e)));

-- 3.
-- From the following tables write a query to find all the jobs, having at least 2 employees in a
-- single department.(don’t use joins)
select job_title from jobs where job_id in 
(select distinct(j.job_id) from employees j where j.department_id 
in(select d.department_id from employees d where 2 <= 
(select count(e.employee_id) from employees e where e.department_id = d.department_id)));

-- 4.
-- From the following tables write a query to find all the countries, having cities with all the city
-- names starting with 'a'.(don’t use joins)

-- 5.
-- From the following tables write a query to find all the departments, having no cities

SELECT d.department_name FROM departments d WHERE d.location_id IN
(SELECT l.location_id FROM locations l WHERE l.city IS NULL) OR location_id IS NULL;

