-- Create all the required tables in Employee_db
-- Department table
DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
	dept_no CHAR(4) PRIMARY KEY NOT NULL,
  	dept_name VARCHAR(30) NOT NULL
);

-- Titles table
DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
  	title_id CHAR(5) PRIMARY KEY NOT NULL,
  	title VARCHAR(30) NOT NULL
);

-- Employee table
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
  	emp_no INT PRIMARY KEY NOT NULL,
  	emp_title CHAR(5) REFERENCES titles (title_id) NOT NULL,
  	birth_date DATE NOT NULL,
  	first_name VARCHAR(20) NOT NULL,
  	last_name VARCHAR(20),
  	sex CHAR(1),
  	hire_date DATE
);

-- Salaries table
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY REFERENCES employees (emp_no) NOT NULL,
	salary NUMERIC NOT NULL
);

-- Dept_Manager table
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager (
	dept_no CHAR(4) REFERENCES departments (dept_no) NOT NULL,
	emp_no INT REFERENCES employees (emp_no) NOT NULL,
	PRIMARY KEY (dept_no, emp_no)
);

-- Dept_Employee table (table to indicate dept for employees)
DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp (
	emp_no INT REFERENCES employees (emp_no) NOT NULL,
	dept_no CHAR(4) REFERENCES departments (dept_no) NOT NULL,
	PRIMARY KEY (emp_no, dept_no)
);

