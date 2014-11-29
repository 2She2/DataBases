--USE TelerikAcademy

-- 1. Write a SQL query to find the names and salaries of the employees
--	  that take the minimal salary in the company. Use a nested SELECT statement.
--SELECT FirstName, LastName, Salary
--FROM Employees
--	WHERE Salary = 
--		(SELECT MIN(Salary) 
--		FROM Employees)

-- 2. Write a SQL query to find the names and salaries of the employees
--	  that have a salary that is up to 10% higher than the minimal salary for the company.
--SELECT FirstName, LastName, Salary
--FROM Employees
--	WHERE Salary <
--		(SELECT (MIN(Salary) * 1.1)
--		FROM Employees)

-- 3. Write a SQL query to find the full name, salary and department of the employees
--	  that take the minimal salary in their department. Use a nested SELECT statement.
--SELECT FirstName + ' ' + MiddleName + ' ' + LastName AS [Full Name], Salary, d.Name
--FROM Employees e
--	JOIN Departments d
--		ON e.DepartmentID = d.DepartmentID
--	WHERE Salary =
--		(SELECT MIN(Salary)
--		FROM Employees
--			WHERE e.DepartmentID = DepartmentID)

-- 4. Write a SQL query to find the average salary in the department #1.
--SELECT AVG(Salary) [Average Salary]
--FROM Employees
--	WHERE DepartmentID = 1

-- 5. Write a SQL query to find the average salary in the "Sales" department.
--SELECT AVG(Salary) [Average Salary]
--FROM Employees e
--	JOIN Departments d
--		ON e.DepartmentID = d.DepartmentID
--	WHERE d.Name = 'Sales'

-- 6. Write a SQL query to find the number of employees in the "Sales" department.
--SELECT COUNT(e.EmployeeID) [Employees in Sales], MIN(d.Name) [Department]
--FROM Employees e
--	JOIN Departments d
--		ON d.DepartmentID = e.DepartmentID
--	WHERE d.Name = 'Sales'

-- 7. Write a SQL query to find the number of all employees that have manager.
--SELECT COUNT(ManagerID) AS [Employees with Manager]
--FROM Employees

-- 8. Write a SQL query to find the number of all employees that have no manager.
--SELECT COUNT(*)
--FROM Employees
--	WHERE ManagerID IS NULL

-- 9. Write a SQL query to find all departments and the average salary for each of them.
--SELECT d.Name [Departmant], AVG(e.Salary) [Average Salary]
--FROM Employees e
--	JOIN Departments d
--		ON e.DepartmentID = d.DepartmentID
--GROUP BY e.DepartmentID, d.Name
	
-- 10.Write a SQL query to find the count of all employees in each department and for each town.
--SELECT COUNT(EmployeeID) [Employees Count], d.Name [Department], t.Name [Town]
--FROM Employees e
--	JOIN Departments d
--		ON e.DepartmentID = d.DepartmentID
--	JOIN Addresses a
--		ON a.AddressID = e.AddressID
--	JOIN  Towns t
--		ON a.TownID = t.TownID
--GROUP BY t.Name, d.Name
--ORDER BY d.Name	

-- 11.Write a SQL query to find all managers that have exactly 5 employees. Display their first name and last name.
--SELECT m.FirstName, m.LastName, COUNT(e.EmployeeID) [Employees]
--FROM Employees e
--	JOIN Employees m
--		ON e.ManagerID = m.EmployeeID
--GROUP BY m.FirstName, m.LastName
--HAVING COUNT(e.EmployeeID) = 5

-- 12.Write a SQL query to find all employees along with their managers.
--	  For employees that do not have manager display the value "(no manager)".
--SELECT e.FirstName, e.LastName, ISNULL(m.FirstName, '(no manager)')
--FROM Employees e
--	LEFT JOIN Employees m
--		ON e.ManagerID = m.EmployeeID

-- 13.Write a SQL query to find the names of all employees whose last name is exactly 5 characters long.
--	  Use the built-in LEN(str) function.
--SELECT FirstName, LastName
--FROM Employees
--	WHERE LEN(LastName) = 5

-- 14.Write a SQL query to display the current date and time in the following format
--	  "day.month.year hour:minutes:seconds:milliseconds". Search in Google to find how to format dates in SQL Server.
--SELECT CONVERT(nvarchar(30), GETDATE(), 13) AS [Date]
--SELECT CONVERT(nvarchar(30), GETDATE(), 131) AS [Date]

-- 15.Write a SQL statement to create a table Users.
--	  Users should have username, password, full name and last login time.
--	  Choose appropriate data types for the table fields.
--	  Define a primary key column with a primary key constraint.
--	  Define the primary key column as identity to facilitate inserting records.
--	  Define unique constraint to avoid repeating usernames.
--	  Define a check constraint to ensure the password is at least 5 characters long.
--CREATE TABLE Users (
--	UserID int PRIMARY KEY IDENTITY,
--	Username nvarchar(50) NOT NULL UNIQUE,
--	UserPassword nvarchar(50),
--	FullName nvarchar(100) NOT NULL,
--	LastLoginTime datetime,
--	CONSTRAINT checkPasswordLength CHECK (LEN(UserPassword) >= 5)
--)
--GO

-- 16.Write a SQL statement to create a view that displays the users from the Users table
--	  that have been in the system today. Test if the view works correctly.
--CREATE VIEW TodayUsers AS
--SELECT Username
--FROM Users
--	WHERE CAST(LastLoginTime AS DATE) = CAST(GETDATE() AS DATE)

--SELECT *
--FROM TodayUsers

-- 17.Write a SQL statement to create a table Groups. Groups should have unique name (use unique constraint).
--	  Define primary key and identity column.
--CREATE TABLE Groups (
--	ID int PRIMARY KEY IDENTITY,
--	Name nvarchar(50) NOT NULL UNIQUE
--)
--GO

-- 18.Write a SQL statement to add a column GroupID to the table Users.
--	  Fill some data in this new column and as well in the Groups table.
--	  Write a SQL statement to add a foreign key constraint between tables Users and Groups tables.
--ALTER TABLE Users
--ADD GroupID int

--ALTER TABLE Users
--ADD CONSTRAINT FK_UsersGroup FOREIGN KEY (GroupID)
--	REFERENCES Groups (ID)

-- 19.Write SQL statements to insert several records in the Users and Groups tables.
--INSERT INTO Groups
--VALUES
--	('Group1'),
--	('Group2'),
--	('Group3'),
--	('Group4');
--GO

--INSERT INTO Users
--VALUES
--	('user1', '996681', 'user1 full name', GETDATE(), 1),
--	('user2', '996682', 'user2 full name', GETDATE(), 5),
--	('user3', '996683', 'user3 full name', GETDATE(), 7),
--	('user4', '996684', 'user4 full name', GETDATE(), 8);
--GO

-- 20.Write SQL statements to update some of the records in the Users and Groups tables.
--UPDATE Users
--SET Username = 'Peshnqta'
--	WHERE Username = 'user1'

--UPDATE Groups
--SET Name = 'Piqchite'
--	WHERE Name = 'Group1'

-- 21.Write SQL statements to delete some of the records from the Users and Groups tables.
--DELETE
--FROM Users
--	WHERE Username = 'user3'

--DELETE
--FROM Groups
--	WHERE Name = 'Group3'

-- 22.Write SQL statements to insert in the Users table the names of all employees from the Employees table.
--	  Combine the first and last names as a full name. For username use the first letter of the first name
--	  + the last name (in lowercase). Use the same for the password, and NULL for last login time.
--INSERT INTO Users(FullName, Username, UserPassword)
--SELECT 
--	FirstName + ' ' + LastName,
--	-- Here we have error, because of the UNIQUE CONSTRAINT
--	LOWER(SUBSTRING(FirstName, 1, 1) + LastName),
--	LOWER(SUBSTRING(FirstName, 1, 1) + LastName)
--FROM Employees

-- 23.Write a SQL statement that changes the password to NULL for all users that have not been in the system since 10.03.2010.
--ALTER TABLE Users
--ALTER COLUMN UserPassword nvarchar(50) NULL
--UPDATE Users
--SET UserPassword = NULL
--	WHERE CAST(LastLoginTime AS DATE) < CAST('10.03.2010' AS DATE)

-- 24.Write a SQL statement that deletes all users without passwords (NULL password).
--DELETE FROM Users
--	WHERE UserPassword IS NULL
--GO

-- 25.Write a SQL query to display the average employee salary by department and job title.
--SELECT AVG(e.Salary) AS [Average Salary], d.Name AS Departmant, e.JobTitle
--FROM Employees e
--	JOIN Departments d
--		ON e.DepartmentID = d.DepartmentID
--GROUP BY d.Name, e.JobTitle
--ORDER BY d.Name

-- 26.Write a SQL query to display the minimal employee salary by department and job title
--	  along with the name of some of the employees that take it.
--SELECT MIN(Salary) AS Salary, e.FirstName + ' ' + e.LastName AS Name, d.Name
--FROM Employees e
--	JOIN Departments d
--		ON e.DepartmentID = d.DepartmentID
--GROUP BY d.Name, e.JobTitle, e.FirstName, e.LastName
--ORDER BY Salary

-- 27.Write a SQL query to display the town where maximal number of employees work.
--SELECT TOP 1 t.Name, COUNT(e.EmployeeID) AS MaxEmployees
--FROM Employees e
--	JOIN Addresses a
--		ON e.AddressID = a.AddressID
--	JOIN Towns t
--		ON a.TownID = t.TownID
--GROUP BY t.Name
--ORDER BY MaxEmployees DESC

-- 28.Write a SQL query to display the number of managers from each town.
--SELECT t.Name, COUNT(DISTINCT e.ManagerID)
--FROM Employees e
--	JOIN Employees m
--		ON e.ManagerID = m.EmployeeID
--	JOIN Addresses a
--		ON m.AddressID = a.AddressID
--	JOIN Towns t
--		ON a.TownID = t.TownID
--GROUP BY t.Name

-- 29.Write a SQL to create table WorkHours to store work reports for each employee (employee id, date, task, hours, comments).
--	  Don't forget to define  identity, primary key and appropriate foreign key. 
--	  Issue few SQL statements to insert, update and delete of some data in the table.
--	  Define a table WorkHoursLogs to track all changes in the WorkHours table with triggers.
--	  For each change keep the old record data, the new record data and the command (insert / update / delete).
--CREATE TABLE WorkHours (
--	WorkHoursID int PRIMARY KEY IDENTITY(1, 1),
--	EmployeeID int FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID) NOT NULL,
--	[Date] datetime NOT NULL,
--	Task nvarchar(100) NOT NULL,
--	Hours int NULL,
--	Comments nvarchar(100) NULL
--)

--INSERT INTO WorkHours
--VALUES
--	(1, GETDATE(), 'Make Tables', 5, 'Bahh maaamu'),
--	(3, GETDATE(), 'Insert values', 10, 'Aii siktir'),
--	(5, GETDATE(), 'Update Values', 10, 'Veche e 3:00 i mi pisna na...')

--UPDATE WorkHours
--SET Hours = 8
--	WHERE Task = 'Make Tables' 

--DELETE FROM WorkHours
--	WHERE Task = 'Update Values'

--CREATE TABLE WorkHoursLogs (
--  LogID int, 
--  OldEmployeeID int ,
--  OldDate datetime,
--  OldTask nvarchar(100),
--  OldHours int ,
--  OldComments varchar(200),
--  NewEmployeeID INT ,
--  NewDate datetime,
--  NewTask nvarchar(100),
--  NewHours int ,
--  NewComments varchar(200),
--  Command varchar(20)
--)
--GO

--CREATE TRIGGER tr_WorkHoursUpdate ON WorkHours
--AFTER UPDATE
--AS
--BEGIN
--INSERT INTO WorkHoursLogs
--			(LogID, OldEmployeeID, OldDate, OldTask, OldHours, OldComments,
--			 NewEmployeeID, NewDate, NewTask, NewHours, NewComments ,Command) 
--SELECT d.WorkHoursID, d.EmployeeID, d.[Date], d.Task, d.[Hours], d.Comments,
--	   w.EmployeeID, w.[Date], w.Task, w.Hours, w.Comments,'Update'
--FROM deleted d 
--	JOIN WorkHours w
--		ON d.WorkHoursID = w.WorkHoursID
--END
--GO

--CREATE TRIGGER tr_workHoursInsert ON WorkHours
--AFTER INSERT
--AS
--BEGIN
--INSERT INTO WorkHoursLogs 
--			(LogID, OldEmployeeID, OldDate, OldTask, OldHours, OldComments,
--			 NewEmployeeID, NewDate, NewTask, NewHours, NewComments, Command) 
--SELECT w.WorkHoursID, NULL, NULL, NULL, NULL, NULL,
--	   i.EmployeeID, i.[Date], i.Task, i.[Hours], i.Comments, 'Insert'
--FROM WorkHours w 
--	JOIN inserted i
--		ON w.WorkHoursID = i.WorkHoursID
--END
--GO

--CREATE TRIGGER tr_workHoursDelete ON WorkHours
--AFTER DELETE
--AS
--BEGIN
--INSERT INTO WorkHoursLogs 
--			(LogID, OldEmployeeID, OldDate, OldTask, OldHours, OldComments,
--			 NewEmployeeID, NewDate, NewTask, NewHours, NewComments, Command) 
--SELECT WorkHoursID, EmployeeID, [Date], Task, [Hours], Comments,
--	   NULL, NULL, NULL, NULL, NULL, 'Delete'
--FROM deleted
--END
--GO

---- TESTS
--UPDATE WorkHours
--SET Hours = 123
--FROM WorkHours
--	WHERE WorkHoursID = 1;

--INSERT INTO WorkHours
--VALUES (7, GETDATE(), 'Make Tests', 5, 'Ne moga poveche')
 
--DELETE 
--FROM WorkHours
--	WHERE WorkHoursID = 1


-- 30.Start a database transaction, delete all employees from the 'Sales' department along
--	  with all dependent records from the pother tables. At the end rollback the transaction.
--BEGIN TRAN
--ALTER TABLE Departments DROP FK_Departments_Employees

--DELETE FROM Employees 
--	WHERE DepartmentID = 
--	(SELECT DepartmentID
--	FROM Departments
--		WHERE Name = 'Sales')

--DELETE FROM Departments
--	WHERE Name = 'Sales'

--ROLLBACK TRAN
--GO

-- 31.Start a database transaction and drop the table EmployeesProjects. Now how you could restore back the lost table data?
--BEGIN TRAN
--DROP TABLE EmployeesProjects
--ROLLBACK TRAN
--GO

-- 32.Find how to use temporary tables in SQL Server. Using temporary tables backup all records
--	  from EmployeesProjects and restore them back after dropping and re-creating the table.
--CREATE TABLE #TemporaryTable
--	(EmployeeID int NOT NULL,
--	ProjectID int NOT NULL)

--INSERT INTO #TemporaryTable
--	SELECT EmployeeID, ProjectID
--	FROM EmployeesProjects

--DROP TABLE EmployeesProjects

--CREATE TABLE EmployeesProjects
--	(EmployeeID int NOT NULL,
--	 ProjectID int NOT NULL,
--	 CONSTRAINT PK_EmployeesProjects PRIMARY KEY(EmployeeID, ProjectID),
--	 CONSTRAINT FK_EP_Employee FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID),
--	 CONSTRAINT FK_EP_Project FOREIGN KEY(ProjectID) REFERENCES Projects(ProjectID))

--INSERT INTO EmployeesProjects
--	SELECT EmployeeID, ProjectID
--	FROM #TemporaryTable