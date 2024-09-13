-- Create departments table
CREATE TABLE departments (
    dept_no VARCHAR(30) PRIMARY KEY,
    dept_name VARCHAR(150) NOT NULL
);

-- Checking departments table
SELECT * FROM departments;

-- Create salaries table
CREATE TABLE salaries (
    emp_no INT,
    salary INT,
    PRIMARY KEY (emp_no, salary),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Checking salaries table
SELECT * FROM salaries;

-- Create titles table
CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

-- Checking titles table
SELECT * FROM titles;

-- Create dept_emp table
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(4),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Checking dept_emp table
SELECT * FROM dept_emp;

-- Create dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(4),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Checking dept_manager table
SELECT * FROM dept_manager;

-- Create employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR (10),
    birth_date DATE,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    sex VARCHAR(1),
    hire_date DATE
);

-- Checking employees table
SELECT * FROM employees;

--  List the employee number, last name, first name, sex, and salary of each employee, use employee number as primary key
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN employees e ON dm.emp_no = e.emp_no
JOIN departments d ON dm.dept_no = d.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;



