--1.What is SQL? What is DML? What is DDL? Recite the most important SQL commands.
--	What is Transact-SQL (T-SQL)?
--	SQL is declarative language for query and manipulation of relational data
--	A relational database can be accessed and modified by executing SQL statements
--	SQL allows:
--	- Defining / modifying the database schema
--	- Searching / modifying table data
--	- A set of SQL commands are available for extracting subset of the table data
--	- Most SQL commands return a single value or record set
--	SQL consists of:
--	- Data Manipulation Language (DML) - SELECT, INSERT, UPDATE, DELETE
--	- Data Definition Language (DDL) - CREATE, DROP, ALTER, GRANT, REVOKE
	
--2.What is Transact-SQL (T-SQL)?
--	T-SQL (Transact SQL) is an extension to the standard SQL language
--	T-SQL is the standard language used in MS SQL Server
--	Supports if statements, loops, exceptions
--	Constructions used in the high-level procedural programming languages
--	T-SQL is used for writing stored procedures, functions, triggers, etc.

USE TelerikAcademy

-- 4. Write a SQL query to find all information about all departments (use "TelerikAcademy" database).
--SELECT *
--FROM Departments

-- 5. Write a SQL query to find all department names.
--SELECT Name
--FROM Departments

-- 6. Write a SQL query to find the salary of each employee.
--SELECT FirstName + ' ' + LastName AS Name, Salary
--FROM Employees

-- 7. Write a SQL to find the full name of each employee.
--SELECT FirstName, MiddleName, LastName
--FROM Employees

-- 8. Write a SQL query to find the email addresses of each employee (by his first and last name).
--	  Consider that the mail domain is telerik.com. Emails should look like “John.Doe@telerik.com".
--	  The produced column should be named "Full Email Addresses".
--SELECT FirstName + '.' + LastName + '@telerik.com' AS [Full Email Addresses]
--FROM Employees

-- 9. Write a SQL query to find all different employee salaries.
--SELECT DISTINCT Salary
--FROM Employees

-- 10. Write a SQL query to find all information about the employees whose job title is “Sales Representative“.
--SELECT *
--FROM Employees
--WHERE JobTitle = 'Sales Representative'

-- 11. Write a SQL query to find the names of all employees whose first name starts with "SA".
--SELECT FirstName + ' ' + LastName AS Name
--FROM Employees
--WHERE FirstName LIKE 'SA%'

-- 12. Write a SQL query to find the names of all employees whose last name contains "ei".
--SELECT FirstName + ' ' + LastName AS Name
--FROM Employees
--WHERE LastName LIKE '%ei%'

-- 13. Write a SQL query to find the salary of all employees whose salary is in the range [20000…30000].
--SELECT FirstName + ' ' + LastName AS Name, Salary
--FROM Employees
--WHERE Salary BETWEEN 20000 AND 30000

-- 14. Write a SQL query to find the names of all employees whose salary is 25000, 14000, 12500 or 23600.
--SELECT FirstName + ' ' + LastName AS Name, Salary
--FROM Employees
--WHERE Salary IN (25000, 14000, 12500, 23600)

--- 15. Write a SQL query to find all employees that do not have manager.
--SELECT FirstName + ' ' + LastName AS Name, Salary
--FROM Employees
--WHERE ManagerID IS NULL

-- 16. Write a SQL query to find all employees that have salary more than 50000. Order them in decreasing order by salary.
--SELECT FirstName + ' ' + LastName AS Name, Salary
--FROM Employees
--WHERE Salary > 50000
--ORDER BY Salary DESC

-- 17. Write a SQL query to find the top 5 best paid employees.
--SELECT TOP 5 FirstName + ' ' + LastName AS Name, Salary
--FROM Employees
--ORDER BY Salary DESC

-- 18. Write a SQL query to find all employees along with their address. Use inner join with ON clause.
--SELECT 
--	e.FirstName + ' ' + e.LastName AS Name,
--	a.AddressText
--FROM Employees e
--	INNER JOIN Addresses a
--		ON e.AddressID = a.AddressID

-- 19. Write a SQL query to find all employees and their address. Use equijoins (conditions in the WHERE clause).
--SELECT 
--	e.FirstName + ' ' + e.LastName AS Name,
--	a.AddressText
--FROM Employees e, Addresses a
--	WHERE e.AddressID = a.AddressID

-- 20. Write a SQL query to find all employees along with their manager.
--SELECT 
--	e.FirstName + ' ' + e.LastName AS Name,
--	m.LastName AS ManagerName
--FROM Employees e, Employees m
--	WHERE e.ManagerID = m.EmployeeID

-- 21. Write a SQL query to find all employees, along with their manager and their address.
--	   Join the 3 tables: Employees e, Employees m and Addresses a.
--SELECT
--	e.FirstName + ' ' + e.LastName AS Name,
--	m.LastName AS ManagerName,
--	a.AddressText
--FROM Employees e
--	INNER JOIN Employees m
--		ON e.ManagerID = m.EmployeeID
--	INNER JOIN Addresses a
--		ON e.AddressID = a.AddressID

-- 22. Write a SQL query to find all departments and all town names as a single list. Use UNION.
--SELECT Name
--	FROM Departments
--UNION
--SELECT Name
--	FROM Towns

-- 23. Write a SQL query to find all the employees and the manager for each of them
--	   along with the employees that do not have manager. Use right outer join. Rewrite the query to use left outer join.
--SELECT
--	e.FirstName,
--	e.LastName,
--	m.LastName AS ManagerName
--	FROM Employees e
--		RIGHT OUTER JOIN Employees m
--			ON e.ManagerID = m.EmployeeID

--SELECT
--	e.FirstName,
--	e.LastName,
--	m.LastName AS ManagerName
--	FROM Employees e
--		LEFT OUTER JOIN Employees m
--			ON e.ManagerID = m.EmployeeID

-- 24. Write a SQL query to find the names of all employees from the departments
--	   "Sales" and "Finance" whose hire year is between 1995 and 2005.
--SELECT e.FirstName, e.LastName
--	FROM Employees e
--		INNER JOIN Departments d
--		ON (d.Name = 'Sales' OR d.name = 'Finance') 
--			AND e.DepartmentID = d.DepartmentID
