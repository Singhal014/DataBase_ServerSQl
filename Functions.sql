-- View

CREATE VIEW InnerJoin AS
SELECT 
    e.EmployeeID, 
    e.Name, 
    d.DepartmentName
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID;

Select * from InnerJoin;
-- SubQuery Find Departments That Have Any Employees 

SELECT DepartmentName 
FROM Departments 
WHERE DepartmentID IN (
    SELECT DISTINCT DepartmentID 
    FROM Employees
);

--  Find Employees Maximum Department ID
SELECT Name 
FROM Employees 
WHERE DepartmentID = (
    SELECT MAX(DepartmentID) 
    FROM Employees
);

-- check employee total project
CREATE FUNCTION count (@EmployeeID INT)
RETURNS INT
AS
BEGIN
    DECLARE @ProjectCount INT

    SELECT @ProjectCount = COUNT(*)
    FROM Projects
    WHERE EmployeeID = @EmployeeID

    RETURN @ProjectCount
END

SELECT dbo.count(3) AS ProjectCount;



--index
CREATE INDEX empID
ON Employees(DepartmentID);


SELECT * 
FROM Employees 
WHERE DepartmentID = 101;


  -- Update DepartmentID to 101 default

CREATE TRIGGER SetID
ON Employees
AFTER INSERT
AS
BEGIN
    UPDATE Employees
    SET DepartmentID = 101
    WHERE EmployeeID IN (SELECT EmployeeID FROM INSERTED)
      AND DepartmentID IS NULL;
END;


-- Insert an employee with no DepartmentID
INSERT INTO Employees (EmployeeID, Name) 
VALUES (7, 'John Doe');

SELECT * FROM Employees WHERE EmployeeID = 7;

CREATE PROCEDURE GetEmployeeProjects
AS
BEGIN
    SELECT 
        e.EmployeeID, 
        e.Name, 
        COUNT(p.ProjectID) AS TotalProjects
    FROM Employees AS e
    LEFT JOIN Projects AS p
        ON e.EmployeeID = p.EmployeeID
    GROUP BY e.EmployeeID, e.Name;
END;

-- Execute the procedure
EXEC GetEmployeeProjects;