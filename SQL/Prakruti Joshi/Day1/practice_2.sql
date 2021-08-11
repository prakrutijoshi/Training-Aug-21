USE practice; 

CREATE TABLE JobHistory
(	EmployeeId INT PRIMARY KEY IDENTITY(1,1),
	StartDate DATE NOT NULL,
	End_date varchar(10) Constraint dt_form check( End_date like '[0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9]')not null,
	Job_Id INT ,
	Department_Id INT,
)

SELECT * FROM JobHistory
	
Insert into JobHistory values ('2000/01/01','03/03/2021',1,2)


-- Alter Practice 

ALTER TABLE JobHistory ADD Constraint fk_job_id Foreign Key (Job_Id) references jobs(jobId);

ALTER TABLE JobHistory DROP Constraint fk_job_id 

ALTER TABLE JobHistory ADD Location varchar(10)  