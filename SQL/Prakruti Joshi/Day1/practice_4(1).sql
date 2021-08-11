USE practice;

CREATE TABLE Employees
(

	Employee_Id int primary key identity(1,1),
	FirstName varchar(20) not null,
	LastName varchar(20),
	Email varchar(30), 
	PhoneNumber numeric(10),
	Hire_Date date, 
	Job_Id int constraint jforkey references jobs(JobId) on update cascade,
	Salary Money,
	Commission Money,
	Manager_Id int,
	Department_Id int constraint dforkey references Department(Department_Id) on update cascade

)

SELECT * FROM Employees
INSERT INTO Employees VALUES('Prakruti','Joshi','joshiprakruti@gmail.com',0987654321,'2021/08/02',1,8000,2000,2,1)