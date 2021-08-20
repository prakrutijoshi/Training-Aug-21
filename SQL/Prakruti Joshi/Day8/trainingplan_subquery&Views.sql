SELECT * FROM EMPLOYEE
SELECT * FROM Incentives

--1. Select employee details from employee table if data exists in incentive table ?
SELECT * FROM Employee 
WHERE EXISTS
(SELECT * FROM Incentives
WHERE EMPLOYEE_ID=EMPLOYEE_REF_ID)

--2. Find Salary of the employee whose salary is more than Roy Salary
SELECT FIRST_NAME,LAST_NAME,SALARY FROM Employee
WHERE SALARY > 
(SELECT SALARY FROM Employee WHERE FIRST_NAME='Roy')

--3. Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount
CREATE VIEW EMPLOYEE_INFO 
AS 
SELECT e.FIRST_NAME,e.LAST_NAME,e.SALARY,e.JOINING_DATE,i.INCENTIVE_DATE,i.INCENTIVE_AMOUNT 
FROM Employee e JOIN Incentives i 
ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID

SELECT * FROM EMPLOYEE_INFO

--4. Create a view to select Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
CREATE VIEW Incentive_3000
AS
SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT
FROM Employee e JOIN Incentives i
ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID
WHERE INCENTIVE_AMOUNT>3000

SELECT * FROM Incentive_3000


SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM Locations
SELECT * FROM Countries
SELECT * FROM JobHistory

--5. Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London
CREATE VIEW Employee_details
AS
SELECT Name=e.FirstName+SPACE(1)+e.LastName,e.JobId,e.DepartmentID,d.DepartmentName 
FROM Employees e JOIN Departments d 
ON e.DepartmentID=d.DepartmentID 
WHERE d.LocationID IN
(SELECT l.LocationID FROM Departments d JOIN Locations l
ON d.LocationID=l.LocationID
WHERE l.City='London')

SELECT * FROM Employee_details


--6. Create a View to get the department name and number of employees in the department.
CREATE VIEW Department_details
AS 
SELECT Department_Name = d.DepartmentName, No_of_Employees = COUNT(*) 
FROM Departments d JOIN Employees e
ON d.DepartmentID=e.DepartmentID
GROUP BY d.DepartmentID,d.DepartmentName

SELECT * FROM Department_details

--7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
SELECT e.EmployeeID,e.JobId, Number_of_days= DATEDIFF(dy,j.StartDate,j.EndDate)
FROM Employees e JOIN JobHistory j
ON e.EmployeeID=j.EmployeeID
WHERE j.DepartmentID=90

--8. Write a View to display the department name, manager name, and city.
CREATE VIEW Name_City
AS
SELECT Manager_Name = e.FirstName, d.DepartmentName,l.City
FROM Departments d JOIN Employees e
ON d.ManagerID=e.EmployeeID
JOIN Locations l ON d.LocationID=l.LocationID

SELECT * FROM Name_City

--9. Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
CREATE VIEW Experienced_managers
AS
SELECT Name=e.FirstName+Space(1)+e.LastName, d.DepartmentName, e.HireDate,e.Salary
FROM Departments d JOIN Employees e
ON d.ManagerID=e.EmployeeID
WHERE DATEDIFF(YYYY,e.HireDate,getdate())>15

SELECT * FROM Experienced_managers