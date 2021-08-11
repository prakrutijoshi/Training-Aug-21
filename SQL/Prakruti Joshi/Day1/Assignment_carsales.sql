USE practice;

CREATE TABLE B_employees
(
	EmployeeId int primary key identity(1,1),
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	MobileNo varchar(10) Constraint mno_digit check ( MobileNo like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
	Email varchar(20) Constraint em_form check (Email like '%@%.%'),
	Salary Money,
)

CREATE TABLE Inventory
(

	CarId int primary key identity(1,1),
	CarName varchar(20) not null,
	CarType varchar(20), 
	Quantity int

)

CREATE TABLE sales
(

	SrNo int primary key identity(1,1),
	sale_date date not null,
	No_of_sales int,
	EmployeeId int constraint e_forkey references B_employees(EmployeeId) on update cascade, 
	CarId int constraint c_forkey references Inventory(CarId) on update cascade,
	Commission Money DEFAULT NULL,

)

SELECT * FROM B_employees

INSERT INTO B_employees 
(FirstName,LastName,MobileNo,Email,Salary)
VALUES
('Prakruti','Joshi',9876543210,'prakruti@gmail.com',8000),
('Ram','Patel',6754289393,'ram@gmail.com',5000)

SELECT * FROM Inventory

INSERT INTO Inventory
(CarName,CarType,Quantity)
VALUES
('Alto','City',20),
('Audi','Sedan',10),
('Kia','SUV',15)

SELECT * FROM sales


INSERT INTO sales
(sale_date,No_of_sales,EmployeeId,CarId)
VALUES
('2021/02/03',2,1,3),
('2021/04/02',3,2,1)

UPDATE sales
SET Commission=No_of_sales*0.10


