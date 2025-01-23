Create Database JoinsDB;

use JoinsDB;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(100),
    DepartmentID INT
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName NVARCHAR(100),
    EmployeeID INT
);

INSERT INTO Employees (EmployeeID, Name, DepartmentID)
VALUES
(1, 'Amit', 101),
(2, 'Ayush', 102),
(3, 'Shagun', 103),
(4, 'Aman', NULL),
(5, 'Aadhya', 104),
(6, 'Anjali', 105);

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'Marketing'),
(104, 'IT'),
(106, 'Operations');



INSERT INTO Projects (ProjectID, ProjectName, EmployeeID)
VALUES
(1, 'Project Alpha', 1),
(2, 'Project Beta', 2),
(3, 'Project Gamma', 3),
(4, 'Project Delta', 7);



SELECT e.EmployeeID,e.Name,d.DepartmentName
FROM Employees as e
INNER JOIN Departments as d
ON e.DepartmentID = d.DepartmentID;


SELECT 
    e.EmployeeID, e.Name, d.DepartmentName, p.ProjectName
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID
INNER JOIN Projects AS p
    ON e.EmployeeID = p.EmployeeID;


SELECT *
FROM Employees
LEFT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;


SELECT 
    e.EmployeeID, e.Name, d.DepartmentName, p.ProjectName
FROM Employees AS e
LEFT JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID
LEFT JOIN Projects AS p
    ON e.EmployeeID = p.EmployeeID;


SELECT *
FROM Employees
RIGHT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;


SELECT *
FROM Employees AS e
LEFT JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;


SELECT *
FROM Employees AS e
RIGHT JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID
WHERE e.EmployeeID IS NULL;


Select * 
from Employees
full outer join Departments
on Employees.EmployeeID = Departments.DepartmentID;

SELECT *
FROM Employees AS e
full outer join Departments AS d
    ON e.DepartmentID = d.DepartmentID
WHERE e.DepartmentID IS NULL
or d.DepartmentID IS NULL;


