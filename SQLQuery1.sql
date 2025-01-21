Create Database CompanyDB;

use CompanyDB;

create table Employee(
EmployeeID int primary key,
Name nvarchar(50),
Salary int,
Department nvarchar(50)
);

INSERT INTO Employee(EmployeeID,Name,Salary,Department)
VALUES
(1,'Prankul Singhal',6000,'IT'),
(2,'Aman Rana',6000,'IT'),
(3,'Aman garg',12000,'HR');

UPDATE Employee
SET Salary = 7000
WHERE EmployeeID = 2;

Delete From Employee
where EmployeeID = 1;

Select * from Employee;

SELECT Name, Department
FROM Employee
WHERE Salary > 5000
ORDER BY Salary desc;

ALTER TABLE Employee
ADD Email NVARCHAR(100);

Select * from Employee;

create login NewLogin with password = '12345'

create user NewUser for login NewLogin

grant select on Employee to NewLogin




