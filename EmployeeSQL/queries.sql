-- LISTING OF ALL EMPLOYEES: EMPLOYEE NUMBER, LAST NAME, FIRST NAME, SEX, SALARY
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no;

-- LISTING OF ALL EMPLOYEES HIRED IN 1986: FIRST NAME, LAST NAME, HIRE DATE
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- LISTING OF MANAGERS: DEPARTMENT NUMBER, DEPARTMENT NAME, EMPLOYEE NUMBER, LAST NAME, FIRST NAME
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments AS d
LEFT JOIN dept_manager
ON d.dept_no = dept_manager.dept_no
	LEFT JOIN employees AS e
	ON dept_manager.emp_no = e.emp_no;

-- LISTING OF ALL EMPLOYEES: DEPARTMENT NUMBER, EMPLOYEE NUMBER, LAST NAME, FIRST NAME, DEPARTMENT NAME
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp
ON e.emp_no = dept_emp.emp_no
	LEFT JOIN departments AS d
	ON dept_emp.dept_no = d.dept_no;

-- LISTING OF ALL EMPLOYEES W/FIRST NAME HERCULES AND LAST NAME STARTING WITH B: FIRST NAME, LAST NAME, SEX
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- LISTING OF ALL SALES DEPT EMPLOYEES: EMPLOYEE NUMBER, LAST NAME, FIRST NAME
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
WHERE e.emp_no IN 
	(
	SELECT j.emp_no
	FROM dept_emp AS j
	WHERE j.dept_no IN 
		(
		SELECT d.dept_no
		FROM departments AS d
		WHERE d.dept_name = 'Sales'
		)
	);
	
-- LISTING OF ALL SALES AND DEVELOPMENT DEPT EMPLOYEES: EMPLOYEE NUMBER, LAST NAME, FIRST NAME, DEPARTMENT NAME
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS j
ON e.emp_no = j.emp_no
	LEFT JOIN departments AS d
	ON j.dept_no = d.dept_no
WHERE e.emp_no IN 
	(
	SELECT j.emp_no
	FROM dept_emp
	WHERE j.dept_no IN 
		(
		SELECT d.dept_no
		FROM departments
		WHERE d.dept_name = 'Sales'
		OR d.dept_name = 'Development'
		)
	);
	
-- FREQUENCY COUNTS FOR ALL EMPLOYEE LAST NAMES
SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
