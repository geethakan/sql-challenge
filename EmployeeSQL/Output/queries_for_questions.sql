-- 1. List the following details of each employee: 
-- employee number, last name, first name, sex, and salary
SELECT a.emp_no, last_name, first_name, sex, salary
FROM employees a INNER JOIN salaries b ON b.emp_no = a.emp_no;
-- Results verified by count; total row count in individual and select matches to 300024

-- 2. List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date 
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name
SELECT a.dept_no, c.dept_name, a.emp_no as "Emp No of Manager", b.last_name, b.first_name
FROM dept_manager a INNER JOIN employees b ON b.emp_no = a.emp_no
                    INNER JOIN departments c ON c.dept_no = a.dept_no;    
					
-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees a INNER JOIN dept_emp b ON b.emp_no = a.emp_no
     INNER JOIN departments c on c.dept_no = b.dept_no;   
-- Note: Employees are present in multiple departments; so result count of 331603 > employee count of 300024

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name,
-- and department name
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees a INNER JOIN dept_emp b ON b.emp_no = a.emp_no
INNER JOIN departments c ON c.dept_no = b.dept_no
WHERE b.dept_no in (select d.dept_no from departments d where d.dept_name = 'Sales');

-- 7. List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees a INNER JOIN dept_emp b ON b.emp_no = a.emp_no
INNER JOIN departments c ON c.dept_no = b.dept_no
WHERE b.dept_no in (select d.dept_no FROM departments d WHERE d.dept_name in ('Sales', 'Development'));

-- 8. List the frequency count of employee last names (i.e., how many employees share each last name)
-- in descending order
SELECT COUNT(last_name) as frequency, last_name 
FROM employees
GROUP BY last_name
ORDER BY frequency DESC








