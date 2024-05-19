-- List the employee number, last name, first name, sex, and salary of each employee
SELECT 
	employees.employee_no,
	employees.employee_last_name,
	employees.employee_first_name,
	employees.employee_sex,
	salaries.salary_amount
FROM employees
INNER JOIN salaries ON employees.employee_no = salaries.employee_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT
	employee_first_name,
	employee_last_name,
	employee_hire_date
FROM employees
WHERE employee_hire_date LIKE '%1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT
	titles.title_name,
	employee_department_junction.department_id,
	departments.department_name,
	employees.employee_no,
	employees.employee_last_name,
	employees.employee_first_name
FROM employees
INNER JOIN titles ON employees.employee_title = titles.title_id
INNER JOIN employee_department_junction ON employees.employee_no = employee_department_junction.employee_no
INNER JOIN departments ON employee_department_junction.department_id = departments.department_id
WHERE titles.title_name = 'Manager';

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT
	employee_department_junction.department_id,
	employee_department_junction.employee_no,
	employees.employee_last_name,
	employees.employee_first_name,
	departments.department_name
FROM employee_department_junction
INNER JOIN departments ON employee_department_junction.department_id = departments.department_id
INNER JOIN employees ON employee_department_junction.employee_no = employees.employee_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT
	employee_first_name,
	employee_last_name,
	employee_sex
FROM employees
WHERE
	employee_first_name = 'Hercules' AND
	employee_last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT
	employee_no,
	employee_last_name,
	employee_first_name
FROM employees
WHERE employee_no IN(
	SELECT employee_no
	FROM employee_department_junction
	WHERE department_id IN(
		SELECT department_id
		FROM departments
		WHERE department_name = 'Sales'));

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT
	employee_department_junction.employee_no,
	employees.employee_last_name,
	employees.employee_first_name,
	departments.department_name
FROM employee_department_junction
INNER JOIN departments ON employee_department_junction.department_id = departments.department_id
INNER JOIN employees ON employee_department_junction.employee_no = employees.employee_no
WHERE departments.department_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT
	employee_last_name,
	COUNT(employee_last_name) as last_name_frequency
FROM employees
GROUP BY employee_last_name
ORDER BY last_name_frequency DESC;