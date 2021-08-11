SELECT * FROM Employees

SELECT * FROM Departments

-- update1
UPDATE Employees 
SET Email='not available'

--update2
UPDATE Employees
SET Email='not available', CommissionPct=0.10

--update3
UPDATE Employees
SET Email='not available', CommissionPct=0.10
WHERE DepartmentID=110

--update4
UPDATE Employees 
SET Email='not available'
WHERE DepartmentID=80 AND CommissionPct<0.20

--update5
UPDATE Employees  
SET Email = 'not available'    
WHERE DepartmentID = 
( SELECT DepartmentID FROM Departments
WHERE DepartmentName = 'Accounting')

SELECT * FROM Employees
--update6 
UPDATE Employees
SET Salary=8000
WHERE EmployeeID=105 AND Salary<5000

--update7
UPDATE Employees
SET JobId='SH_CLERK'
WHERE EmployeeID=118 AND DepartmentID=30 AND JobId<>'SH%'

--update8
UPDATE Employees
SET Salary=Salary+(0.25*Salary) WHERE DepartmentID=40
UPDATE Employees
SET Salary=Salary+(0.15*Salary) WHERE DepartmentID=90
UPDATE Employees
SET Salary=Salary+(0.10*Salary) WHERE DepartmentID=110 

--update9
