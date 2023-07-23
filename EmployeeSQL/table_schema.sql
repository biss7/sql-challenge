-- TABLE SCHEMAS

CREATE TABLE departments (
	dept_no VARCHAR(4) NOT null PRIMARY KEY,
	dept_name VARCHAR(255) NOT null
);

CREATE TABLE titles (
	title_id VARCHAR(5) NOT null PRIMARY KEY,
	title VARCHAR(255) NOT null
);

CREATE TABLE employees (
	emp_no SERIAL NOT null PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT null,
	birth_date DATE,
	first_name VARCHAR(255) NOT null,
	last_name VARCHAR(255) NOT null,
	sex VARCHAR(1),
	hire_date DATE NOT null,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
	emp_no INT NOT null,
	salary MONEY NOT null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT null,
	dept_no VARCHAR(4) NOT null,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT null,
	emp_no INT NOT null,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);