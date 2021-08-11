USE practice; 

CREATE TABLE countries
(
	CountryId int PRIMARY KEY IDENTITY(1,1),
	CountryName varchar(50) NOT NULL CONSTRAINT restrict_couName CHECK(CountryName IN ('India','China','Italy')),
	RegionId int NOT NULL CONSTRAINT unq_combination UNIQUE (CountryId, RegionId)
)
SELECT * FROM countries

INSERT INTO countries VALUES('India',7)
INSERT INTO countries VALUES('China',0)
