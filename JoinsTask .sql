SELECT
d.Dnum AS department_id,
d.Dname AS department_name,
d.MGRSSN AS manager_id,
e.Fname + ' ' + e.Lname AS manager_full_name
From departments d 
JOIN Employee e ON d.MGRSSN = e.SSN;

SELECT 
d.Dname AS department_name,
p.Pname AS project_name
FROM departments d
JOIN Project p ON d.Dnum = p.Dnum;

SELECT 
d.ESSN AS Dependent_ID,
d.Dependent_name,
d.Sex,
d.Bdate,
e.Fname + ' ' + e.Lname AS Full_name
FROM Dependent d
JOIN Employee e ON d.ESSN = e.SSN;

SELECT
Pnumber AS Project_ID,
Pname AS Project_Name,
Plocation AS Location
FROM Project
WHERE City IN ('Cairo', 'Alex');

SELECT *
FROM Project 
WHERE Pname LIKE 'A%'

SELECT 
SSN AS ID,
Fname + ' ' + Lname AS name
From Employee
WHERE Dno = 30 AND salary BETWEEN 1000 AND 2000;

SELECT 
e.Fname + ' ' + e.Lname AS name
From Employee e
JOIN Works_for w ON e.SSN = w.ESSn
JOIN Project p ON w.Pno = p.Pnumber
WHERE e.Dno = 10
AND p.Pname = 'AL Rabwah'
AND w.Hours >= 10;

SELECT 
e.Fname + ' ' + e.Lname AS name
From Employee e
JOIN Employee m ON e.Superssn = m.SSN
WHERE m.Fname + ' ' + m.Lname = 'Kamel Mohamed';

SELECT 
e.Fname + ' ' + e.Lname AS name,
p.Pname AS project_name
FROM Employee e
JOIN Works_for w ON w.ESSn = e.SSN
JOIN Project p ON w.Pno = p.Pnumber
ORDER BY p.Pname;

SELECT 
p.Pnumber AS project_number,
d.Dname AS department_name,
e.Lname AS manager_LastName,
e.Address,
e.Bdate AS birthdate
FROM Project p
JOIN Departments d ON p.Dnum = d.Dnum
JOIN Employee e ON d.MGRSSN = e.SSN
WHERE p.City = 'Cairo';

SELECT e.*
FROM Employee e
JOIN Departments d ON d.MGRSSN = e.SSN;

SELECT 
e.SSN AS Employee_ID,
e.Fname + ' ' + e.Lname AS name,
d.Dependent_name,
d.Sex,
d.Bdate
FROM Employee e
LEFT JOIN Dependent d ON e.SSN = d.ESSN;