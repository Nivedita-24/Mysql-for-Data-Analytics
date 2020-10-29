-- SQL SELECT STATEMENT
-- Select the information from the “dept_no” column of the “departments” table.
SELECT 
    dept_no
FROM
    departments;
    
-- Select all data from the “departments” table.    
SELECT 
    *
FROM
    departments;

-- Select all people from the “employees” table whose first name is “Elvis”.
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';

-- Retrieve a list with all female employees whose first name is Kellie. 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';

-- Retrieve a list with all employees whose first name is either Kellie or Aruna.
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';

-- Retrieve a list with all female employees whose first name is either Kellie or Aruna.
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');

-- Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');

-- Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');

-- Working with the “employees” table, use the LIKE operator to select the data about all individuals, whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');

-- Retrieve a list with all employees who have been hired in the year 2000.
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');

-- Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”.
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');

-- Extract all individuals from the ‘employees’ table whose first name contains “Jack”.-- 
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%');

-- Extract another list containing the names of employees that do not contain “Jack”.
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%');

-- Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;

-- Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
SELECT 
    *
FROM
    salaries
WHERE
    emp_no NOT BETWEEN '10004' AND '10012';

-- Select the names of all departments with numbers between ‘d003’ and ‘d006’.
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';

-- Select the names of all departments whose department number value is not null.
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;

-- Retrieve a list with data about all female employees who were hired in the year 2000 or after.
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND hire_date >= '2000-01-01';

-- Extract a list with all employees’ salaries higher than $150,000 per annum.
SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;

-- Obtain a list with all different “hire dates” from the “employees” table.
SELECT DISTINCT
    hire_date
FROM
    employees;

-- How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000;

-- How many managers do we have in the “employees” database? Use the star symbol (*) in your code to solve this exercise.
SELECT 
    COUNT(*)
FROM
    dept_manager;

-- Select all data from the “employees” table, ordering it by “hire date” in descending order.
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

-- Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars. The second column, renamed to “emps_with_same_salary”, must show the number of employees contracted to that salary. Lastly, sort the output by the first column.
SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;

-- Select all employees whose average salary is higher than $120,000 per annum.
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

-- Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

-- Select the first 100 rows from the ‘dept_emp’ table. 
SELECT 
    *
FROM
    dept_emp
LIMIT 100;

-- SQL INSERT STATEMENT 

INSERT INTO employees
VALUES(999903,'1977-09-14','Johnathan','Creek','M','1999-01-01');
 
-- Select ten records from the “titles” table to get a better idea about its content.
SELECT 
    *
FROM
    titles
LIMIT 10;

-- Then, in the same table, insert information about employee number 999903. State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.
-- At the end, sort the records from the “titles” table in descending order to check if you have successfully inserted the new record
INSERT INTO titles (emp_no,title,from_date)
VALUES(999903,'Senior Engineer','1997-10-01');

SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC
LIMIT 10;

-- Insert information about the individual with employee number 999903 into the “dept_emp” table. He/She is working for department number 5, and has started work on  October 1st, 1997; her/his contract is for an indefinite period of time.
SELECT 
    *
FROM
    dept_emp
LIMIT 10;

INSERT INTO dept_emp
VALUES(999903,'d005','1997-10-01','9999-01-01');

SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no DESC
LIMIT 10;

-- Create a new department called “Business Analysis”. Register it under number ‘d010’.
SELECT 
    *
FROM
    departments
LIMIT 10;

INSERT INTO departments
VALUES('d010','Business Analysis');

SELECT 
    *
FROM
    departments
ORDER BY dept_no DESC
LIMIT 10;

-- MySQL AGGREGATE FUNCTIONS

-- How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;

-- What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
-- Which is the lowest employee number in the database? 
SELECT 
    MIN(emp_no)
FROM
    employees;

-- Which is the highest employee number in the database?
SELECT 
    MAX(emp_no)
FROM
    employees;
    
-- What is the average annual salary paid to employees who started after the 1st of January 1997?    
SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

-- Select the department number and name from the ‘departments_dup’ table and add a third column where you name the department number (‘dept_no’) as ‘dept_info’. If ‘dept_no’ does not have a value, use ‘dept_name’.
DROP TABLE departments_dup;
CREATE TABLE departments_dup (
    dept_no CHAR(4),
    dept_name VARCHAR(40)
);

INSERT INTO departments_dup(dept_no, dept_name)
SELECT * FROM departments;

SELECT * FROM departments_dup;

UPDATE departments_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control';
    
INSERT INTO departments_dup(dept_name)
VALUES('Public Relations');

INSERT INTO departments_dup(dept_no)
VALUES('d010'),('d011');

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup;

-- Modify the code obtained from the previous exercise in the following way. Apply the IFNULL() function to the values from the first and second column, so that ‘N/A’ is displayed whenever a department number has no value, and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.

SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name,
            'Department name is not provided') AS dept_name
FROM
    departments_dup;

-- SQL JOINS
 
-- Create and fill in the ‘dept_manager_dup’ table

CREATE TABLE dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);

INSERT INTO dept_manager_dup
SELECT * FROM dept_manager;

INSERT INTO dept_manager_dup(emp_no,from_date)
VALUES(999904,'2017-01-01'),
(999905,'2017-01-01'),
(999906,'2017-01-01'),
(999907,'2017-01-01');

SELECT * FROM dept_manager_dup;

-- Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date.
SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
ORDER BY emp_no; 

-- Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. See if the output contains a manager with that name.  
SELECT 
    dm.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE
    e.last_name = 'Markovitch'
    ORDER BY dm.dept_no DESC, e.emp_no;

-- Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. Use the old type of join syntax to obtain the result.
SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM
    employees e,
    dept_manager dm
WHERE
    e.emp_no = dm.emp_no;
 
set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

-- Select the first and last name, the hire date, and the job title of all employees whose first name is “Margareta” and have the last name “Markovitch”. 

SELECT 
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'Margareta'
        AND e.last_name = 'Markovitch';    

-- Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9-- .

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE
    d.dept_no = 'd009';

-- Return a list with the first 10 employees with all the departments they can be assigned to.
SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011;
    
-- Select all managers’ first and last name, hire date, job title, start date, and department name.    
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    t.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    titles t ON t.emp_no = e.emp_no
        JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
        JOIN
    departments d ON d.dept_no = dm.dept_no
WHERE
    t.title = 'Manager'
ORDER BY e.emp_no;

-- How many male and how many female managers do we have in the ‘employees’ database?
SELECT 
    e.gender, COUNT(t.emp_no) AS Managers
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
GROUP BY e.gender;

-- SQL Subqueries with IN Nested Inside WHERE

-- Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995. 
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');

-- Select the entire information for all employees whose job title is “Assistant Engineer”. 
SELECT 
    e.*
FROM
    employees e
WHERE
    EXISTS( SELECT 
            t.*
        FROM
            titles t
        WHERE
            t.emp_no = e.emp_no
                AND t.title = 'Assistant Engineer');

-- Starting your code with “DROP TABLE”, create a table called “emp_manager” (emp_no – integer of 11, not null; dept_no – CHAR of 4, null; manager_no – integer of 11, not null). 
DROP TABLE IF EXISTS emp_manager;
CREATE TABLE emp_manager (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
);


-- Fill emp_manager with data about employees, the number of the department they are working in, and their managers.
INSERT INTO emp_manager
SELECT 
	U.*
FROM(
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS Employee_ID,
            MIN(de.dept_no) AS Department_no,
            (SELECT 
                    emp_no AS Manager_ID
                FROM
                    dept_manager 
                WHERE
                    emp_no = '110022')
    FROM
        employees e
    JOIN dept_emp de ON de.emp_no = e.emp_no
    WHERE
        e.emp_no <= '10020'
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A UNION SELECT
    B.*
FROM
    (SELECT 
        e.emp_no AS Employee_ID,
            MIN(de.dept_no) AS Department_no,
            (SELECT 
                    emp_no AS Manager_ID
                FROM
                    dept_manager 
                WHERE
                    emp_no = '110039')
    FROM
        employees e
    JOIN dept_emp de ON de.emp_no = e.emp_no
    WHERE
        e.emp_no > '10020'
    GROUP BY e.emp_no
    ORDER BY e.emp_no LIMIT 20) AS B UNION SELECT
    C.* 
FROM
    (SELECT 
        e.emp_no AS Employee_ID,
            MIN(de.dept_no) AS Department_no,
            (SELECT 
                    emp_no AS Manager_ID
                FROM
                    dept_manager
                WHERE
                    emp_no = '110039')
    FROM
        employees e
    JOIN dept_emp de ON de.emp_no = e.emp_no
    WHERE
        e.emp_no ='110022'
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS C UNION SELECT
    D.*
FROM
	(SELECT 
        e.emp_no AS Employee_ID,
            MIN(de.dept_no) AS Department_no,
            (SELECT 
                    emp_no AS Manager_ID
                FROM
                    dept_manager 
                WHERE
                    emp_no = '110022')
    FROM
        employees e
    JOIN dept_emp de ON de.emp_no = e.emp_no
    WHERE
        e.emp_no ='110039'
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS D) AS U;
    

-- MYSQL VIEWS

-- Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.
CREATE OR REPLACE VIEW v_manager_avg_salary AS
SELECT 
    ROUND(AVG(s.salary),2) AS Average_Salary
FROM
    dept_manager dm
        JOIN
    salaries s ON dm.emp_no = s.emp_no;

-- MYSQL STORED PROCEDURES
-- Create a procedure that will provide the average salary of all employees. Then, call the procedure.

DROP PROCEDURE IF EXISTS Average_salary;

DELIMITER $$
CREATE PROCEDURE Average_salary()
BEGIN
	SELECT 
		ROUND(AVG(salary),2) AS Avg_Salary
	FROM 
		salaries;
END $$
DELIMITER ;

CALL employees.Average_salary();

-- Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.
DELIMITER $$
CREATE PROCEDURE emp_info(IN p_first_name VARCHAR(255),IN p_last_name VARCHAR(255), OUT p_employee_number INT)
BEGIN
	SELECT 
		e.emp_no 
    INTO p_employee_number FROM
		employees e
    WHERE 
		e.first_name=p_first_name
			AND e.last_name=p_last_name;
END$$

DELIMITER ;

-- Create a variable, called ‘v_emp_no’, where you will store the output of the procedure you created in the last exercise.

SET @v_emp_no=0;
CALL employees.emp_info('Aruna','Journel',@v_emp_no);
SELECT @v_emp_no;

 -- Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, and returns the salary from the newest contract of that employee.
 DELIMITER $$
 
 CREATE FUNCTION emp_info(f_first_name VARCHAR(255), f_last_name VARCHAR(255)) RETURNS DECIMAL(10,2)
 DETERMINISTIC NO SQL READS SQL DATA
 BEGIN
	DECLARE v_max_from_date DATE;
    DECLARE v_salary DECIMAL(10,2);
	
SELECT 
    MAX(s.from_date)
INTO v_max_from_date FROM
    salaries s
        JOIN
    employees e ON e.emp_no = s.emp_no
WHERE
    e.first_name = f_first_name
        AND e.last_name = f_last_name;
        
SELECT 
    s.salary
INTO v_salary FROM
    salaries s
        JOIN
    employees e ON e.emp_no = s.emp_no
WHERE
    e.first_name = f_first_name
        AND e.last_name = f_last_name
        AND s.from_date = v_max_from_date; 
        
        RETURN v_salary;
    
 END $$
 
 DELIMITER ;
 
SELECT emp_info('Aruna','Journel');






                             
            
