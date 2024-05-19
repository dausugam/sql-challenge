CREATE TABLE departments (
	department_id VARCHAR(10) PRIMARY KEY,
	department_name VARCHAR(255));
	
CREATE TABLE titles (
	title_id VARCHAR(10) PRIMARY KEY,
	title_name VARCHAR(255));
	
CREATE TABLE employees (
	employee_no INT PRIMARY KEY,
	employee_title VARCHAR(10),
	employee_birth_date VARCHAR(30),
	employee_first_name VARCHAR(255),
	employee_last_name VARCHAR(255),
	employee_sex VARCHAR(10),
	employee_hire_date VARCHAR(30),
	FOREIGN KEY (employee_title) REFERENCES titles(title_id));
	
CREATE TABLE salaries (
	employee_no INT,
	salary_amount INT,
	FOREIGN KEY (employee_no) REFERENCES employees(employee_no));
	
CREATE TABLE employee_department_junction (
	employee_no INT,
	department_id VARCHAR(10),
	FOREIGN KEY (employee_no) REFERENCES employees(employee_no),
	FOREIGN KEY (department_id) REFERENCES departments(department_id));
