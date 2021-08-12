SELECT * FROM Employees

-- String1
SELECT Name_of_the_employee = FirstName, Number_of_Characters = len(FirstName)  FROM Employees
WHERE FirstName LIKE 'A%' OR FirstName LIKE 'J%' OR FirstName LIKE 'M%'
ORDER BY FirstName ASC

--string2
SELECT FIRST_NAME = FirstName, 
SALARY = REPLICATE('$',10-Len(Salary))+ CAST( LEFT(Salary,10) As varchar(10))
FROM Employees

--string3
SELECT EmployeeID, FirstName,LastName,CAST(HireDate As varchar(10)) FROM Employees
WHERE DATENAME(dd,HireDate) LIKE 07 OR DATENAME(mm,Hiredate) LIKE 'July'


--string4
SELECT FirstName, LastName, Length_of_name= LEN(FirstName) FROM Employees
WHERE (PATINDEX('__c%', LastName)) LIKE 1  

--string5
SELECT RIGHT(PhoneNumber,4) FROM Employees

--string6
UPDATE Employees
SET PhoneNumber= REPLACE (PhoneNumber,'124','999')
SELECT PhoneNumber FROM Employees

--string7
--not birthdate given to calculate the age




--string8
SET DATEFIRST 1
SELECT HireDate FROM Employees
WHERE DATEPART(dw,HireDate) LIKE 1

--string9
SELECT FirstName, HireDate FROM Employees
WHERE CAST(HireDate As varchar(10)) BETWEEN '1987-06-01' AND '1987-07-30'

--string10
DECLARE @dt varchar(20)
SET @dt = CONVERT(varchar,getdate(),100)
SELECT RIGHT(@dt,6) + SPACE(1)+ LEFT(@dt,3) + ',' + SUBSTRING(@dt,5,9)

--string11
SELECT FirstName,LastName FROM Employees
WHERE DATENAME(mm,HireDate) LIKE 'June'

--string12
SELECT FirstName, HireDate, Experience= DATEDIFF(yy,HireDate,getdate()) FROM Employees 

--string13
SELECT FirstName FROM Employees
WHERE DATENAME(yy,Hiredate) LIKE '1987'