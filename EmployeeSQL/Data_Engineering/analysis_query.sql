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

-- 3. Manager for each depart - department nmbr, depart name, emp_no, last_name, first_name
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
INNER JOIN departments d
ON dm.dept_no = d.dept_no
INNER JOIN employees e
ON dm.emp_no = e.emp_no;

