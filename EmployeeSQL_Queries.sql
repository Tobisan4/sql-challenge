-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM "Salaries" AS s
INNER JOIN "Employees" AS e
ON
e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date 
FROM "Employees" AS e
WHERE hire_date LIKE '%1986';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dep.dept_no, dep.dept_name, dep_m.emp_no, e.last_name, e.first_name
FROM "Department_Manager" AS dep_m
INNER JOIN "Departments" AS dep
ON
dep.dept_no = dep_m.dept_no
INNER JOIN "Employees" AS e
ON
e.emp_no = dep_m.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dep.dept_name  
FROM "Employees" AS e
INNER JOIN "Department_Employee" AS dep_e
ON
e.emp_no = dep_e.emp_no
INNER JOIN "Departments" AS dep
ON
dep_e.dept_no = dep.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.sex
FROM "Employees" AS e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dep.dept_name  
FROM "Employees" AS e
INNER JOIN "Department_Employee" AS dep_e
ON
e.emp_no = dep_e.emp_no
INNER JOIN "Departments" AS dep
ON
dep_e.dept_no = dep.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dep.dept_name  
FROM "Employees" AS e
INNER JOIN "Department_Employee" AS dep_e
ON
e.emp_no = dep_e.emp_no
INNER JOIN "Departments" AS dep
ON
dep_e.dept_no = dep.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT e.last_name, COUNT (e.last_name)
FROM "Employees" AS e
GROUP BY last_name
order BY COUNT (e.last_name) DESC;