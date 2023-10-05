-- Analysis Query

-- 1. Emp_no, last_name, first_name, sex, salary each employee
SELECT emp_no, last_name, first_name, sex,
	(SELECT salaries.salary
	FROM salaries
	WHERE employees.emp_no = salaries.emp_no) AS "Salary"
FROM employees

-- 2. First_name, Last_name, hire_date = 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE date_part('year',hire_date) = 1986

-- 3. Manager for each depart department nmbr, depart name, emp_no, last_name, first_name
SELECT dept_no,
	(SELECT dept_name
	FROM departments
	WHERE dept_manager.dept_no = departments.dept_no),
emp_no,
	(SELECT last_name, first_name
	FROM employees
	WHERE dept_manager.emp_no = employees.emp_no)
FROM dept_manager;