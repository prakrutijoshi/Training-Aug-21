CREATE DATABASE SQL
USE SQL;

CREATE TABLE BRANCH 
(
	BNAME VARCHAR(18) PRIMARY KEY,
	CITY VARCHAR(18)
)

INSERT INTO BRANCH 
(BNAME,CITY)
VALUES 
('VRCE','NAGPUR'),
('AJNI','NAGPUR'),
('KAROLBAGH','DELHI'),
('CHANDNI','DELHI'),
('DHARAMPETH','NAGPUR'),
('M.G.ROAD','BANGLORE'),
('ANDHERI','MUMBAI'),
('VIRAR','MUMBAI'),
('NEHRU PLACE','DELHI'),
('POWAI','MUMBAI')

CREATE TABLE CUSTOMER
(
	CNAME VARCHAR(18) PRIMARY KEY,
	CITY VARCHAR(18)
)

INSERT INTO CUSTOMER
(CNAME,CITY)
VALUES
('ANIL','KOLKATA'),
('SUNIL','DELHI'),
('MEHUL','BARODA'),
('MANDAR','PATNA'),
('MADHURI','NAGPUR'),
('PRAMOD','NAGPUR'),
('SANDIP','SURAT'),
('SHIVANI','MUMBAI'),
('KRANTI','MUMBAI'),
('NAREN','MUMBAI')


CREATE TABLE Deposit 
(
	ACTNO VARCHAR(5) PRIMARY KEY,
	CName VARCHAR(18) CONSTRAINT Dcname_forkey REFERENCES CUSTOMER(CNAME),
	BName VARCHAR(18) CONSTRAINT Dbname_forkey REFERENCES BRANCH(BNAME),
	Amount INT,
	Adate DATE 
)

INSERT INTO Deposit
(ACTNO,CName,BName,Amount,Adate)
VALUES
('100','ANIL','VRCE',1000,'1995/03/01'),
('101','SUNIL','AJNI',5000,'1996/01/04'),
('102','MEHUL','KAROLBAGH',3500,'1995/11/17'),
('104','MADHURI','CHANDNI',1200,'1995/12/17'),
('105','PRAMOD','M.G.ROAD',3000,'1996/03/27'),
('106','SANDIP','ANDHERI',2000,'1996/03/31'),
('107','SHIVANI','VIRAR',1000,'1995/09/05'),
('108','KRANTI','NEHRU PLACE',5000,'1995/07/02'),
('109','NAREN','POWAI',7000,'1995/08/10')


CREATE TABLE BORROW 
(
	LOANNO VARCHAR(5) PRIMARY KEY,
	CName VARCHAR(18) CONSTRAINT Bcname_forkey REFERENCES CUSTOMER(CNAME),
	BName VARCHAR(18) CONSTRAINT Bbname_forkey REFERENCES BRANCH(BNAME),
	Amount INT
)

INSERT INTO BORROW
(LOANNO,CName,BName,Amount)
VALUES
('201','ANIL','VRCE',1000),
('206','MEHUL','AJNI',5000),
('311','SUNIL','DHARAMPETH',3000),
('321','MADHURI','ANDHERI',2000),
('375','PRAMOD','VIRAR',8000),
('481','KRANTI','NEHRU PLACE',3000)


--subquery1 :  List Names of Customers who are Depositors and have Same Branch City as that of SUNIL
SELECT d.CName
FROM Deposit d JOIN BRANCH b
ON d.BName=b.BNAME
WHERE CITY IN
(SELECT b.CITY 
FROM Deposit d JOIN BRANCH b
ON d.BName=b.BNAME 
WHERE d.CName='SUNIL')

--subquery2 : List All the Depositors Having Depositors Having Deposit in All the Branches where SUNIL is Having Account
SELECT d.CName
FROM Deposit d JOIN BRANCH b ON d.BName=b.BNAME
WHERE d.BName IN
(SELECT d.BName FROM Deposit d JOIN BRANCH b ON d.BName=b.BNAME WHERE d.CName='SUNIL')
OR d.BName IN
(SELECT bo.BName FROM BORROW bo JOIN BRANCH b ON bo.BName=b.BNAME WHERE bo.CName='SUNIL')


--subquery3 : List the Names of Customers Living in the City where the Maximum Number of Depositors are Located
SELECT d.CName FROM Deposit d JOIN CUSTOMER c ON d.CName=c.CNAME
WHERE c.CITY IN
(SELECT TOP 1 tmp.CITY FROM 
(SELECT COUNT(CName) AS Names,CITY FROM CUSTOMER GROUP BY CITY)tmp
ORDER BY Names DESC)

--subquery4 : List Names of Borrowers Having Deposit Amount Greater than 1000 and Loan Amount Greater than 2000

SELECT CName from BORROW
where Amount>2000 
AND CNAME IN
(select CName from Deposit
where Amount>1000) 

--subquery5 : List All the Customers Living in NAGPUR and Having the Branch City as MUMBAI or DELHI
SELECT CNAME FROM CUSTOMER
where CITY='NAGPUR'
AND CNAME IN 
(SELECT CNAME FROM Deposit
where BNAME IN
(Select BNAME from BRANCH
where city='MUMBAI' OR city='DELHI'))

--subquery6 : Count the Number of Customers Living in the City where Branch is Located
select count(cname) from CUSTOMER
where city IN
(select city from BRANCH)
