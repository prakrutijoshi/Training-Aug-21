select * from Employees
select * from Departments
select * from Locations
select * from JobHistory


--1. Find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'.
SELECT NAME=FirstName+space(1)+LastName ,Salary FROM Employees
WHERE Salary > 
(SELECT Salary FROM Employees
WHERE LastName='BULL')

--2. Find the names (first_name, last_name) of all employees who works in the IT department. 
SELECT NAME=FirstName+space(1)+LastName FROM Employees
WHERE DepartmentID IN
(SELECT DepartmentID FROM Departments
WHERE DepartmentName='IT')

--3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 
SELECT NAME=FirstName+space(1)+LastName FROM Employees
WHERE ManagerID IN 
(SELECT ManagerID FROM Departments)
AND DepartmentID IN
(SELECT DepartmentID FROM Departments
WHERE LocationID IN
(SELECT LocationID FROM Locations
WHERE CountryID='US'))

--4. Find the names (first_name, last_name) of the employees who are managers. 
SELECT NAME=FirstName+space(1)+LastName FROM Employees
WHERE EmployeeID IN
(SELECT ManagerID FROM Employees)

--5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 
SELECT NAME=FirstName+space(1)+LastName FROM Employees
WHERE Salary >
(SELECT AVG(Salary) FROM Employees)

--6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 
SELECT NAME=FirstName+space(1)+LastName,Salary FROM Employees
WHERE Salary IN 
(select MIN(Salary) FROM Employees
WHERE JobId IN 
(SELECT JobId FROM JobHistory))

--7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments.
SELECT NAME=FirstName+space(1)+LastName,Salary FROM Employees
WHERE DepartmentID IN
(SELECT DepartmentID FROM Departments
WHERE DepartmentName LIKE'IT%')
AND Salary >
(SELECT AVG(Salary) FROM Employees)

--8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 
SELECT NAME=FirstName+space(1)+LastName,Salary FROM Employees
WHERE Salary>
(SELECT Salary FROM Employees
WHERE LastName='Bell')

--9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 
SELECT NAME=FirstName+space(1)+LastName,Salary FROM Employees
WHERE Salary IN
(SELECT MIN(SALARY) FROM Employees)

--10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 
SELECT NAME=FirstName+space(1)+LastName,Salary FROM Employees
WHERE Salary >
(SELECT AVG(Salary) FROM Employees
WHERE DepartmentID IN
(SELECT DepartmentID FROM Departments))

--11. find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. 
SELECT NAME=FirstName+space(1)+LastName,Salary FROM Employees
WHERE Salary > ALL(SELECT Salary FROM Employees WHERE JobId='SH_CLERK')
ORDER BY Salary ASC

--12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors.
SELECT NAME=FirstName+space(1)+LastName,Salary FROM Employees
WHERE NOT EXISTS 
(SELECT 'X' FROM Employees 
WHERE EmployeeID IN
(SELECT ManagerID FROM Employees))

--13. Write a query to display the employee ID, first name, last names, and department names of all employees. 
SELECT EmployeeID,FirstName,LastName, 
(SELECT DepartmentName FROM Departments d 
WHERE d.DepartmentID=e.DepartmentID) AS Department 
FROM Employees e 

--14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. 
SELECT EmployeeID, NAME=FirstName+space(1)+LastName,Salary FROM Employees e
WHERE Salary >
(SELECT AVG(Salary) FROM Employees
WHERE DepartmentID IN 
(SELECT DepartmentID FROM Departments d
WHERE d.DepartmentID=e.DepartmentID) )

--15.  Write a query to fetch even numbered records from employees table. 
SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY EmployeeID) AS Row_No,* FROM Employees)tmp WHERE Row_No % 2 = 0

--16. Write a query to find the 5th maximum salary in the employees table. 
SELECT DISTINCT Salary FROM Employees e1
WHERE 5 = (SELECT COUNT(DISTINCT Salary) FROM Employees e2
WHERE e2.Salary>=e1.Salary)

--17. Write a query to find the 4th minimum salary in the employees table. 
SELECT DISTINCT Salary FROM Employees e1
WHERE 4 = (SELECT COUNT(DISTINCT Salary) FROM Employees e2
WHERE e2.Salary<=e1.Salary)

--18. Write a query to select last 10 records from a table. 
SELECT * FROM
(SELECT TOP 10 * FROM Employees ORDER  BY EmployeeID DESC)temp
ORDER BY EmployeeID ASC

--19. Write a query to list department number, name for all the departments in which there are no employees in the department. 
SELECT DepartmentID,DepartmentName FROM Departments
WHERE DepartmentID NOT IN 
(SELECT DepartmentID FROM Employees)

--20. Write a query to get 3 maximum salaries. 
SELECT Distinct * FROM 
(SELECT DENSE_RANK() OVER (ORDER BY Salary DESC)[drank], Salary FROM Employees)tmp 
WHERE drank<=3

--21. Write a query to get 3 minimum salaries. 

SELECT Distinct * FROM 
(SELECT DENSE_RANK() OVER (ORDER BY Salary ASC)[drank], Salary FROM Employees)tmp 
WHERE drank<=3


--22. Write a query to get nth max salaries of employees. 
DECLARE @n INT
SET @n=10
SELECT Distinct * FROM 
(SELECT DENSE_RANK() OVER(ORDER BY Salary DESC)drank, Salary FROM Employees)tmp
WHERE drank<=@n

