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
-- Query all fields from the table
SELECT *
FROM departments;

-- Import csv files
COPY dept_emp(emp_no, dept_no)
FROM 'C:\Users\dept_emp.csv'
DELIMITER ','
CSV HEADER;
-- Query all fields from the table
SELECT *
FROM dept_emp;

-- Import csv files
COPY dept_manager(dept_no, emp_no)
FROM 'C:\Users\dept_manager.csv'
DELIMITER ','
CSV HEADER;
-- Query all fields from the table
SELECT *
FROM dept_manager;

-- Import csv files
COPY employees(emp_no, emp_title, birth_date, first_name, last_name, sex, hire_date) 
FROM 'C:\Users\employees.csv'
DELIMITER ','
CSV HEADER;
-- Query all fields from the table
SELECT *
FROM employees;

-- Import csv files
COPY salaries(emp_no, salary) 
FROM 'C:\Users\salaries.csv'
DELIMITER ','
CSV HEADER;
-- Query all fields from the table
SELECT *
FROM salaries;

-- Import csv files
COPY titles(title_id, title) 
FROM 'C:\Users\titles.csv'
DELIMITER ','
CSV HEADER;
-- Query all fields from the table
SELECT *
FROM titles;
