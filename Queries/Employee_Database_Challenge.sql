-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);
SELECT * FROM departments;


CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);
SELECT * FROM employees;


CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);
SELECT * FROM dept_manager;


CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);
SELECT * FROM salaries


CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR(4) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
  PRIMARY KEY (emp_no,dept_no)
);
SELECT * FROM dept_emp;


CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, title, from_date)
);
SELECT * FROM titles;

-- Create new table for retirement-eligible employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
	ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;


--Left Join for retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

--check new table
SELECT * From current_emp;

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

--Update the above code block to create a new table, then export it as a CSV.
SELECT COUNT(ce.emp_no), de.dept_no,
INTO retiring_emp_count
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT * FROM retiring_emp_count;


-- List 1: Employee Information
SELECT * FROM salaries
ORDER BY to_date DESC;
-- Create emp_info Table
SELECT e.emp_no,
    e.first_name,
e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

SELECT * FROM emp_info;

-- List 2: Management
-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
		
SELECT * FROM manager_info;
		
--List 3: Department Retirees
--Creating dept_info Table
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

SELECT * FROM dept_info;

--Sales dept. retiring employees table
SELECT re.emp_no,
re.first_name,
re.last_name,
d.dept_name
INTO sales_retiring_info
FROM retirement_info as re
INNER JOIN dept_info AS d
ON (re.emp_no = d.emp_no)
WHERE d.dept_name = 'Sales';

SELECT * FROM sales_retiring_info;

--retiring employees from Sales & Development teams
SELECT re.emp_no,
re.first_name,
re.last_name,
d.dept_name
INTO sales_dev_info
FROM retirement_info as re
INNER JOIN dept_info AS d
ON (re.emp_no = d.emp_no)
WHERE d.dept_name IN ('Sales','Development'); 

SELECT * FROM sales_dev_info;


--CHALLENGE*****
--DELIVERABLE 1

--Steps 1-4 Create retirement_titles table.
SELECT et.emp_no,
		et.first_name,
		et.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirement_titles
FROM employees as et
INNER JOIN titles as ti
ON et.emp_no = ti.emp_no
WHERE (et.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles;

-- STEPS 8-20/Use Dictinct with Order by to remove duplicate rows
SELECT DISTINCT ON (et.emp_no)et.emp_no,
et.first_name,
et.last_name,
ti.title 
INTO unique_titles
FROM employees AS et
INNER JOIN titles AS ti
ON et.emp_no = ti.emp_no
WHERE (et.birth_date between '1952-01-01' AND '1955-12-31')
ORDER BY et.emp_no ASC, ti.to_date DESC;

SELECT * FROM unique_titles;


--create a Retiring Titles table 
SELECT COUNT(emp_no) as "count", title
INTO retiring_titles
FROM unique_titles
GROUP BY title 
ORDER BY "count" DESC;

SELECT * FROM retiring_titles;


--DELIVERABLE 2

--Steps 1-11 create a mentorship_eligibility table
SELECT DISTINCT ON (et.emp_no) et.emp_no,
et.first_name,
et.last_name,
et.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibility
FROM employees AS et
INNER JOIN dept_emp AS de
ON (et.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (et.emp_no = ti.emp_no)
WHERE (et.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND ti.to_date = '9999-01-01'
ORDER BY et.emp_no ASC;

SELECT * FROM mentorship_eligibility;










