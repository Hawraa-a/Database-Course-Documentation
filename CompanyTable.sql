CREATE TABLE Department (
    Dnum int PRIMARY KEY,
    Dname varchar(20),
    Mgr_SSN int,
    hiredate date,
    CONSTRAINT FK_Department_Mgr_SSN FOREIGN KEY (Mgr_SSN) REFERENCES Employee(SSN)
);

CREATE TABLE Employee (
    SSN int PRIMARY KEY,
    Date_Of_Birth date,
    First_name nvarchar(10),
    Last_name nvarchar(20),
    Dnum int,
    Super_SSN int
);

CREATE TABLE Department_Locations (
    Dnum int,
    Locations varchar(20),
    PRIMARY KEY (Dnum, Locations),
    CONSTRAINT FK_Department_Locations_Dnum FOREIGN KEY (Dnum) REFERENCES Department(Dnum)
);

CREATE TABLE Project (
    Pnum int PRIMARY KEY,
    Pname varchar(25),
    City varchar(20),
    Location varchar(20),
    Dnum int,
    CONSTRAINT FK_Project_Dnum FOREIGN KEY (Dnum) REFERENCES Department(Dnum)
);

CREATE TABLE Dependent(
SSN int,
DepNumber int,
Gender char(1),
BirthOfDate date,
PRIMARY KEY (SSN, DepNumber),
CONSTRAINT FK_Dependent_Employee FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);

CREATE TABLE Employee_Project(
SSN int,
Pnum int,
hours int,
PRIMARY KEY (SSN, Pnum),
CONSTRAINT FK_EmployeeProject_Employee FOREIGN KEY (SSN) REFERENCES Employee(SSN),
CONSTRAINT FK_EmployeeProject_Project FOREIGN KEY (Pnum) REFERENCES Project(Pnum)
);

ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Dnum FOREIGN KEY (Dnum) REFERENCES Department(Dnum);

ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Super_SSN FOREIGN KEY (Super_SSN) REFERENCES Employee(SSN);
