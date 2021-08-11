--select1
SELECT * FROM Employees

--select2
SELECT FirstName,LastName FROM Employees

--select3
SELECT 'Employee Name'=FirstName FROM Employees

--select4
SELECT * FROM Employees WHERE FirstName='Steven'

--select5
SELECT * FROM Employees 
WHERE FirstName ='Neena' 
OR FirstName='Lex'

--select6
SELECT * FROM Employees
WHERE Salary BETWEEN 5000 AND 8000 

--select7
SELECT FirstName,LastName,Salary,'PF'=0.12*Salary FROM Employees


--select8
SELECT * FROM Employees
WHERE FirstName LIKE 'N%'

--select9
SELECT DISTINCT DepartmentID FROM Employees

--select10
SELECT * FROM Employees
ORDER BY FirstName DESC

--select11
SELECT EmployeeID,FirstName,LastName,Salary FROM Employees
ORDER BY Salary ASC

--select12
SELECT TOP 2 Salary FROM Employees 