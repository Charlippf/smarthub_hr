--Question 1
--Employees who earn more than the company average:

SELECT full_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

--Question 2
--Employees in the same department as Chinedu Eze:

SELECT full_name, department
FROM employees
WHERE department = (
    SELECT department
    FROM employees
    WHERE full_name = 'Chinedu Eze'
);

--Question 3
--Employee(s) with the highest salary:

SELECT full_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

--Question 4
--Employee(s) with the lowest salary:

SELECT full_name, salary
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

--Question 5
--Employees whose salary is below the company average:

SELECT full_name, salary
FROM employees
WHERE salary < (
    SELECT AVG(salary)
    FROM employees
);

--Question 6
--Employees earning more than the average salary in their own department:

SELECT full_name, department, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees AS department_employees
    WHERE department_employees.department = employees.department
);

--Question 7
--Employees earning more than Grace Effiong:

SELECT full_name, salary
FROM employees
WHERE salary > (
    SELECT salary
    FROM employees
    WHERE full_name = 'Grace Effiong'
);

--Question 8
--Employees earning more than every Sales employee:

SELECT full_name, salary
FROM employees
WHERE salary > (
    SELECT MAX(salary)
    FROM employees
    WHERE department = 'Sales'
);

--Question 9
--Employees earning more than at least one Engineering employee:

SELECT full_name, salary
FROM employees
WHERE salary > (
    SELECT MIN(salary)
    FROM employees
    WHERE department = 'Engineering'
);

--Question 10
--Employees who earn more than their own manager:

SELECT full_name, salary
FROM employees
WHERE salary > (
    SELECT salary
    FROM employees AS managers
    WHERE managers.emp_id = employees.manager_id
);

--Question 11
--Employees who do not manage anyone:

SELECT full_name
FROM employees
WHERE emp_id NOT IN (
    SELECT manager_id
    FROM employees
    WHERE manager_id IS NOT NULL
);

--Question 12
--Employees who manage at least one person:

SELECT full_name
FROM employees
WHERE emp_id IN (
    SELECT manager_id
    FROM employees
    WHERE manager_id IS NOT NULL
);

--Question 13
--Employees hired before Kelechi Amadi:

SELECT full_name, hire_date
FROM employees
WHERE hire_date < (
    SELECT hire_date
    FROM employees
    WHERE full_name = 'Kelechi Amadi'
);

--Question 14
--Employees whose salary is the highest in their department:

SELECT full_name, department, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees AS department_employees
    WHERE department_employees.department = employees.department
);

--Question 15
--Employees earning more than the average bonus of employees who receive a bonus:

SELECT full_name, bonus
FROM employees
WHERE bonus > (
    SELECT AVG(bonus)
    FROM employees
    WHERE bonus IS NOT NULL
);

--Question 16
--Departments where the average salary is above the company average:

SELECT department
FROM employees
GROUP BY department
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM employees
);

--Question 17
--Employees earning more than the average Engineering salary:

SELECT full_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = 'Engineering'
);

--Question 18
--Employees whose salary is within 200,000 of the highest salary:

SELECT full_name, salary
FROM employees
WHERE salary >= (
    SELECT MAX(salary) - 200000
    FROM employees
);

--Question 19
--Using a subquery in the FROM clause:

SELECT full_name, salary
FROM (
    SELECT full_name, salary
    FROM employees
    WHERE department = 'Engineering'
) AS engineering_employees
WHERE salary > 500000;

--Question 20
--Employee with the second-highest salary:

SELECT full_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);