-- PART I: DATA ENGINEERING
-- Delete the tables if exists
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Create tabled schema for 6 csv files

CREATE TABLE departments (
	dept_no varchar(10) PRIMARY KEY not null,
	dept_name varchar(100) not null
);

CREATE TABLE dept_emp (
	emp_no int not null,
	dept_no varchar(10) not null
);

CREATE TABLE dept_manager (
	dept_no varchar(10) not null,
	emp_no int not null
);

CREATE TABLE employees (
	emp_no int primary key not null,
	emp_title varchar(30) not null,
	birth_date date not null,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	sex varchar(1) not null,
	hire_date date not null
);

CREATE TABLE salaries (
	emp_no int not null,
	salary int not null
);

CREATE TABLE titles (
	title_id varchar(30) not null,
	title varchar(30) not null
);



-- Import csv files
COPY departments(dept_no, dept_name) 
FROM 'C:\Users\departments.csv'
DELIMITER ','
CSV HEADER;

-- PART II: DATA ANALYSIS
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN  salaries AS s
ON e.emp_no = s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees
WHERE EXTRACT(YEAR FROM employees.hire_date) = 1986;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name,  dm.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_manager AS dm
ON e.emp_no = dm.emp_no
INNER JOIN departments AS d
ON dm.dept_no = d.dept_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS last_name_frequency_count
FROM employees AS e
GROUP BY last_name
ORDER BY last_name_frequency_count DESC;
