USE practice; 

CREATE TABLE jobs
(

	JobId int Primary key ,
	JobTitle varchar(20) DEFAULT ' ',
	MinSalary Money DEFAULT 8000,
	MaxSalary Money Default NULL
)

SELECT * FROM jobs 

INSERT INTO jobs (JobId) Values (1)