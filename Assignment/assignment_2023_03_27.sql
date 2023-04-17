-- PostgreSQL

-- 1. Create a trigger to fill up the full_name column in the dependents table while
-- inserting any new records.

ALTER TABLE dependents ADD COLUMN IF NOT EXISTS full_name varchar(255);
  
CREATE TRIGGER full_name_trigger 
BEFORE INSERT ON dependents 
FOR EACH ROW 
BEGIN 
  SET NEW.full_name = CONCAT(NEW.first_name, ' ', NEW.last_name); 
END;

-- 2. Create a trigger that stores the transaction records of each insert, update and
-- delete operations performed on the locations table into locations_info table

CREATE TABLE locations_info (
    id SERIAL PRIMARY KEY,
    operation VARCHAR(10),
    location_id INT,
    street_address VARCHAR(255),
    pincode VARCHAR(10),
    city VARCHAR(255),
    state_province VARCHAR(255),
    country_id INT
);


CREATE TRIGGER locations_transaction
AFTER INSERT,UPDATE,DELETE ON locations
FOR EACH ROW 
BEGIN
  IF TG_OP = 'DELETE' THEN
    INSERT INTO locations_info (operation, location_id, street_address, pincode, city, state_province, country_id)
    VALUES (TG_OP, OLD.location_id, OLD.street_address, OLD.pincode, OLD.city, OLD.state_province, OLD.country_id);
  ELSE
    INSERT INTO locations_info (operation, location_id, street_address, pincode, city, state_province, country_id)
    VALUES (TG_OP, NEW.location_id, NEW.street_address, NEW.pincode, NEW.city, NEW.state_province, NEW.country_id);
 
  END IF;
END;

-- 3. For the following tables create a view named employee_information with
-- employee first name, last name, salary, department name, city, postal code insert
-- only those records whose postal code length is less than 5.

CREATE VIEW employee_information AS
SELECT e.first_name, e.last_name, e.salary, d.department_name, l.city, l.pincode
FROM employees e JOIN departments d 
  ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
  WHERE LENGTH(l.pincode) < 5;
  
-- 4. Explain ACID properties with an example

The ACID properties of a Relational DBMS are:

i. Atomicity: All the transactions in a DB will be atomic either the whole transaction
will complete or not.

ii. Consistency: This property ensures that a transaction moves the database from
one consistent state to another consistent state. It guarantees that the 
database is always upto date and accurate.

iii. Isolation: This property ensures that multiple transactions can execute
simultaneously without interfering with each other.It ensures that the
execution of one transaction does not interfere with the execution of other
concurrent transactions.

iv. Durability: This property makes sure that the changes commited to the 
database persist.

-- 5. Answer the above question with explanation
The index is built from Occupation column.If we sort the Occupation column 
the rows get placed in the sequence 1,3,2,5,4.