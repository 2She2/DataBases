-- 01.Create a database with two tables: Persons(Id(PK), FirstName, LastName, SSN)
--		and Accounts(Id(PK), PersonId(FK), Balance). Insert few records for testing.
--		Write a stored procedure that selects the full names of all persons.
--CREATE DATABASE PersonsAccounts
--GO

--USE PersonsAccounts
--GO

--CREATE TABLE Persons (
--	PersonId int PRIMARY KEY IDENTITY,
--	FirstName nvarchar(50) NOT NULL,
--	LastName nvarchar(50) NOT NULL,
--	SSN nvarchar(50) NOT NULL
--)
--GO

--CREATE TABLE Accounts (
--	AccountId int PRIMARY KEY IDENTITY,
--	PersonId int CONSTRAINT FK_Accounts_Persons
--		FOREIGN KEY(PersonId)
--		REFERENCES Persons(PersonId),
--	Balance money DEFAULT 0
--)
--GO

--INSERT INTO Persons
--VALUES
--	('Pesho', 'Peshev', '436453254'),
--	('Gosho', 'Goshev', '165763067'),
--	('Sasho', 'Sashev', '958694046')
--GO

--INSERT INTO Accounts
--VALUES
--	(1, 1200),
--	(2, 300),
--	(3, 6700)
--GO

--CREATE PROC usp_SelectFullNames
--AS 
--	SELECT FirstName + ' ' + LastName AS [Full Name]
--	FROM Persons
--GO

--EXEC usp_SelectFullNames

-- 02.Create a stored procedure that accepts a number as a parameter and
--		returns all persons who have more money in their accounts than
--		the supplied number.

--CREATE PROC usp_SelectPersonsWIthMoreMoneyThan @balance money
--AS
--	SELECT p.FirstName + ' ' + p.LastName AS [Full Name], a.Balance
--	FROM Persons p
--		JOIN Accounts a
--			ON p.PersonId = a.PersonId
--	WHERE a.Balance > @balance
--GO

--EXEC usp_SelectPersonsWIthMoreMoneyThan 1000

-- 03.Create a function that accepts as parameters – sum, yearly interest rate
--		and number of months. It should calculate and return the new sum.
--		Write a SELECT to test whether the function works as expected.

--CREATE FUNCTION ufn_CalcInterest(@sum money, @interestRate float, @months int)
--RETURNS money
--AS
--BEGIN
--	DECLARE @sumWithInterest money
--	SET @sumWithInterest = (@sum + @sum * @interestRate * @months / 12)
--	RETURN @sumWithInterest
--END
--GO

--SELECT p.FirstName, dbo.ufn_CalcInterest (a.Balance, 0.4, 10)
--FROM Accounts a
--	JOIN Persons p
--	 ON a.PersonId = p.PersonId

-- 04.Create a stored procedure that uses the function from the previous
--		example to give an interest to a person's account for one month.
--		It should take the AccountId and the interest rate as parameters.
--CREATE PROC usp_GiveInterestForMonth @userId int, @interestRate float
--AS
--	SELECT dbo.ufn_CalcInterest (Balance, @interestRate, 1)
--	FROM Accounts 
--		WHERE PersonId = @userId
--GO

--EXEC usp_GiveInterestForMonth 1, 0.4

-- 05.Add two more stored procedures WithdrawMoney(AccountId, money) and
--		DepositMoney (AccountId, money) that operate in transactions.
--CREATE PROC usp_WithdrawMoney @accountId int, @amount money
--AS
--	BEGIN TRAN
--	DECLARE @accountMoney money = 
--	(SELECT Balance
--	FROM Accounts
--		WHERE accountId = @accountId)
--	IF (@Amount > 0 AND @accountMoney >= @amount)
--		BEGIN
--			UPDATE Accounts
--			SET Balance = Balance - @amount
--				WHERE AccountId = @accountId
--			COMMIT
--		END
--	ELSE
--		BEGIN
--			RAISERROR ('Not enough money amount in the account', 16, 1)
--			ROLLBACK TRAN
--		END
--GO

--CREATE PROC usp_DepositMoney @AccountId int, @Amount money
--AS
--	BEGIN TRAN
--	DECLARE @accountMoney money =
--	(SELECT Balance 
--	FROM Accounts
--		WHERE PersonId = @AccountId)
--	IF (@Amount > 0)
--		BEGIN
--			UPDATE Accounts
--			SET Balance = @Amount + Balance
--				WHERE AccountId = @AccountId
--			COMMIT
--		END
--	ELSE
--		BEGIN
--			RAISERROR('Deposit money must be positive number!', 16, 1)
--			ROLLBACK
--		END
--GO

--EXEC usp_WithdrawMoney 1, 1000
--EXEC usp_DepositMoney 2, 1000

-- 06.Create another table – Logs(LogID, AccountID, OldSum, NewSum).
--		Add a trigger to the Accounts table that enters a new entry into
--		the Logs table every time the sum on an account changes.
--CREATE TABLE Logs (
--	LogID int PRIMARY KEY IDENTITY,
--	AccountId int NOT NULL CONSTRAINT FK_LogsAccounts FOREIGN KEY (AccountId)
--		REFERENCES	Accounts (AccountId),
--	OldSum money NOT NULL,
--	NewSum money NOT NULL
--)
--GO

--ALTER TRIGGER tr_AccountsUpdate
--	ON Accounts
--	FOR UPDATE
--AS
--	BEGIN
--		--SELECT Balance from deleted
--		INSERT INTO Logs(AccountId, OldSum, NewSum)
--		SELECT d.AccountId, d.Balance , i.Balance
--		FROM deleted d
--			JOIN inserted i
--				ON d.AccountId = i.AccountId
--	END
--GO

--EXEC usp_WithdrawMoney 1, 1000
--EXEC usp_DepositMoney 2, 1000

-- 07.Define a function in the database TelerikAcademy that returns all
--		Employee's names (first or middle or last name) and all town's names
--		that are comprised of given set of letters. Example 'oistmiahf' will
--		return 'Sofia', 'Smitth', … but not 'Rob' and 'Guy'.'Sofia'

--USE TelerikAcademy

--CREATE FUNCTION ufn_GetAllNamesAndTowns()
--RETURNS TABLE
--AS
--	RETURN(
--		SELECT DISTINCT e.FirstName AS [Names and Towns]
--		FROM Employees e
--			UNION
--		SELECT DISTINCT m.MiddleName
--		FROM Employees m
--			UNION
--		SELECT DISTINCT em.LastName
--		FROM Employees em
--			UNION
--		SELECT t.Name
--		FROM Towns t
--		)

--CREATE FUNCTION ufn_IsNameComprised(@letters nvarchar(50), @word nvarchar(50))
--RETURNS BIT
--AS
--BEGIN
--	DECLARE @n int = 1
--	DECLARE @length int = LEN(@word)
--	DECLARE @searchWord nvarchar(50) = LOWER(@word)
--	WHILE(@n <= @length)
--		BEGIN
--			IF(CHARINDEX(SUBSTRING(@searchWord, @n, 1), @letters) = 0)
--				BEGIN
--					RETURN 0
--				END
--			SET @n = 1 + @n
--		END

--		RETURN 1
--END

--CREATE FUNCTION ufn_FindNamesAndTownsComprisedOfGivenLetters(@letters nvarchar(50))
--RETURNS TABLE
--AS
--	RETURN(
--		SELECT *
--		FROM ufn_GetAllNamesAndTowns() e
--			WHERE 
--				(dbo.ufn_IsNameComprised(@letters, e.[Names and Towns]) > 0)
--		)

--SELECT * FROM dbo.ufn_FindNamesAndTownsComprisedOfGivenLetters('oistmiahf')

-- 08.Using database cursor write a T-SQL script that scans all employees and
--		their addresses and prints all pairs of employees that live
--		in the same town.

--DECLARE empCursor CURSOR READ_ONLY FOR
 
--SELECT a.FirstName, a.LastName, t1.Name, b.FirstName, b.LastName
--FROM Employees a
--JOIN Addresses adr
--ON a.AddressID = adr.AddressID
--JOIN Towns t1
--ON adr.TownID = t1.TownID,
-- Employees b
--JOIN Addresses ad
--ON b.AddressID = ad.AddressID
--JOIN Towns t2
--ON ad.TownID = t2.TownID
--WHERE t1.Name = t2.Name
--  AND a.EmployeeID <> b.EmployeeID
--ORDER BY a.FirstName, b.FirstName
 
--OPEN empCursor
--DECLARE @firstName1 NVARCHAR(50)
--DECLARE @lastName1 NVARCHAR(50)
--DECLARE @town NVARCHAR(50)
--DECLARE @firstName2 NVARCHAR(50)
--DECLARE @lastName2 NVARCHAR(50)
--FETCH NEXT FROM empCursor
--        INTO @firstName1, @lastName1, @town, @firstName2, @lastName2
 
--WHILE @@FETCH_STATUS = 0
--        BEGIN
--                PRINT @firstName1 + ' ' + @lastName1 +
--                        '     ' + @town + '      ' + @firstName2 + ' ' + @lastName2
--                FETCH NEXT FROM empCursor
--                        INTO @firstName1, @lastName1, @town, @firstName2, @lastName2
--        END
 
--CLOSE empCursor
--DEALLOCATE empCursor

-- 09.* Write a T-SQL script that shows for each town a list of all employees
--		that live in it. Sample output:
--			Sofia -> Svetlin Nakov, Martin Kulov, George Denchev
--			Ottawa -> Jose Saraiva
--			…

--CREATE TABLE UsersTowns (
--        ID INT IDENTITY,
--        FullName NVARCHAR(50),
--        TownName NVARCHAR(50)
--)
--INSERT INTO UsersTowns
--SELECT e.FirstName + ' ' + e.LastName, t.Name
--                FROM Employees e
--                        INNER JOIN Addresses a
--                                ON a.AddressID = e.AddressID
--                        INNER JOIN Towns t
--                                ON t.TownID = a.TownID
--                GROUP BY t.Name, e.FirstName, e.LastName
 

--DECLARE @name NVARCHAR(50)
--        DECLARE @town NVARCHAR(50)
 
--        DECLARE empCursor1 CURSOR READ_ONLY FOR
--                SELECT DISTINCT ut.TownName
--                        FROM UsersTowns ut     
 
--        OPEN empCursor1
--        FETCH NEXT FROM empCursor1
--                INTO @town
 
--                WHILE @@FETCH_STATUS = 0
--                BEGIN
--                        PRINT @town
 
--                        DECLARE empCursor2 CURSOR READ_ONLY FOR
--                                SELECT ut.FullName
--                                FROM UsersTowns ut
--                                        WHERE ut.TownName = @town
--                        OPEN empCursor2
                       
--                        FETCH NEXT FROM empCursor2
--                                INTO @name
                               
--                                WHILE @@FETCH_STATUS = 0
--                                BEGIN
--                                        PRINT '   ' + @name
--                                        FETCH NEXT FROM empCursor2 INTO @name
--                                END
 
--                                CLOSE empCursor2
--                                DEALLOCATE empCursor2
--                        FETCH NEXT FROM empCursor1 INTO @town
--                END
 
--        CLOSE empCursor1
--        DEALLOCATE empCursor1

-- 10.Define a .NET aggregate function StrConcat that takes as input a
--		sequence of strings and return a single string that consists
--		of the input strings separated by ','.
--		For example the following SQL statement should return a single string:
--			SELECT StrConcat(FirstName + ' ' + LastName)
--			FROM Employees

--DECLARE @name nvarchar(MAX);
--SET @name = N'';
--SELECT @name += e.FirstName + N','
--FROM Employees e
--	SELECT LEFT(@name,LEN(@name)-1);