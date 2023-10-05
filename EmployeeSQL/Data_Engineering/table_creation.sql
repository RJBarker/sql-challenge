--- TABLE CREATION QUERY

-- Drop tables if they already exist - Remove comment (--) if required
-- DROP TABLE titles, employees, salaries, departments, dept_emp, dept_manager;


-- Create 'titles' table
CREATE TABLE titles (
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(50) NOT NULL
);

-- View table
SELECT * FROM titles;


-- Create 'employees' table
CREATE TABLE employees (
	emp_no INTEGER PRIMARY KEY,
	emp_title_id VARCHAR(10) NOT NULL,
		FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

-- View table
SELECT * FROM employees;


-- Create 'salaries' table
CREATE TABLE salaries (
	emp_no INTEGER PRIMARY KEY,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INTEGER NOT NULL
);

-- View table
SELECT * FROM salaries;


-- Create 'departments' table
CREATE TABLE departments (
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(50) NOT NULL
);

-- View table
SELECT * FROM departments;


-- Create 'dept_emp' table
CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(10) NOT NULL,
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- View table
SELECT * FROM dept_emp;


-- Create 'dept_manager' table
CREATE TABLE dept_manager (
	dept_no VARCHAR(10) NOT NULL,
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER PRIMARY KEY,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no)	
);

-- View table
SELECT * FROM dept_manager;