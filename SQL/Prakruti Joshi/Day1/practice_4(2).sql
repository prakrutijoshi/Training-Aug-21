USE practice;

CREATE TABLE Department
(
	Department_Id int primary key identity(1,1),
	Department_Name varchar(20)
)
 
 SELECT * FROM Department
 INSERT INTO Department values('Android')