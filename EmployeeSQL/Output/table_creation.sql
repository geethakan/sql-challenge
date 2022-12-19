-- Create all the required tables in Employee_db
-- Department table
DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
	dept_no CHAR(4) PRIMARY KEY,
  	dept_name VARCHAR(30) NOT NULL
);

-- Titles table
DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
  	title_id CHAR(5) PRIMARY KEY,
  	title VARCHAR(30) NOT NULL
);

-- Employee table
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
  	emp_no INT PRIMARY KEY,
  	emp_title CHAR(5) REFERENCES titles (title_id),
  	birth_date DATE,
  	first_name VARCHAR(20),
  	last_name VARCHAR(20),
  	sex CHAR(1),
  	hire_date DATE
);

-- Salaries table
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY REFERENCES employees (emp_no),
	salary NUMERIC
);

-- Dept_Manager table
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager (
	dept_no CHAR(4) REFERENCES departments (dept_no),
	emp_no INT REFERENCES employees (emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

-- Dept_Employee table (table to indicate dept for employees)
DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp (
	emp_no INT REFERENCES employees (emp_no),
	dept_no CHAR(4) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

