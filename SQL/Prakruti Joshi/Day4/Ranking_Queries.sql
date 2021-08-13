
--ranking1
SELECT 
ROW_NUMBER() OVER (ORDER BY Salary DESC) [Row number],
FirstName, LastName, Salary, 
DENSE_RANK() OVER (ORDER BY Salary DESC) [D_Rank],
RANK() OVER (ORDER BY Salary DESC) [Rank]
FROM Employees

--ranking2
SELECT FirstName, LastName,Salary,DRank FROM 
(SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) [DRank],FirstName, LastName, Salary FROM Employees) temp
WHERE DRank=4 ORDER BY Salary DESC

--ranking3
SELECT Department = Departments.DepartmentName ,Total_salary = SUM(Employees.Salary) 
FROM Departments, Employees
WHERE Employees.DepartmentID = Departments.DepartmentID
GROUP BY Departments.DepartmentName

--ranking4
SELECT Department = Departments.DepartmentName ,Total_salary = SUM(Employees.Salary) 
FROM Departments, Employees
WHERE Employees.DepartmentID = Departments.DepartmentID
GROUP BY Departments.DepartmentName
ORDER BY Total_salary DESC

--ranking5
SELECT Department = Departments.DepartmentName , Maximum_salary = MAX(Employees.Salary) 
FROM Departments, Employees
WHERE Employees.DepartmentID = Departments.DepartmentID
GROUP BY Departments.DepartmentName
ORDER BY Maximum_salary ASC

--ranking6
SELECT Department = Departments.DepartmentName , Minimum_salary = MIN(Employees.Salary) 
FROM Departments, Employees
WHERE Employees.DepartmentID = Departments.DepartmentID
GROUP BY Departments.DepartmentName
ORDER BY Minimum_salary ASC

--ranking7
SELECT Department = Departments.DepartmentName ,Total_salary = SUM(Employees.Salary) 
FROM Departments, Employees
WHERE Employees.DepartmentID = Departments.DepartmentID 
GROUP BY Departments.DepartmentName
HAVING SUM(Employees.Salary)>50000
ORDER BY Total_salary DESC
