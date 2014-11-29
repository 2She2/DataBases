--CREATE DATABASE PerformanceTest
--GO

--USE PerformanceTest
--GO

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- 1.Create a table in SQL Server with 10 000 000 log entries (date + text).
--	 Search in the table by date range. Check the speed (without caching).

--CREATE TABLE BirthDay
--(
--	Id int IDENTITY PRIMARY KEY,
--	FirstName nvarchar(50),
--	lastName nvarchar(50),
--	BirthDate Date
--);
--GO

-- First way to add
-- Add 100 000 entries, then select all entries and add them again
--====================================================================
--DECLARE @n int = 0;
--WHILE(@n < 100000)
--BEGIN
--	INSERT INTO BirthDay (FirstName, lastName, BirthDate)
--	VALUES ('Pesho' + CONVERT(varchar,@n), 'Peshov' + CONVERT(varchar, @n), DATEADD(day, @n, '2014-09-04'))
--	SET @n += 1
--END

--DECLARE @i int = 0;
--WHILE (@i < 7)
--BEGIN
--INSERT INTO BirthDay(FirstName, lastName, BirthDate)
--	SELECT FirstName, lastName, BirthDate
--	FROM BirthDay 

--	SET @i += 1
--END
--====================================================================


-- Second way to add
-- Add 10 000 000 in one time. This cause overflow(etleast for my machine) and only 2 916 580 were added
-- So I added 2 000 000 5 times :)
--====================================================================

--DECLARE @n INT = 0
--BEGIN TRANSACTION
--WHILE(@n < 2000000)
--BEGIN
--	INSERT INTO BirthDay (FirstName, lastName, BirthDate)
--	VALUES ('Pesho' + CONVERT(varchar,@n), 'Peshov' + CONVERT(varchar, @n), DATEADD(day, @n, '2014-09-04'))
--	SET @n += 1
--END
--COMMIT TRANSACTION
--====================================================================


-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- 2.Add an index to speed-up the search by date.
--	 Test the search speed (after cleaning the cache).

--CHECKPOINT; DBCC DROPCLEANBUFFERS;
--SELECT BirthDate
--	FROM BirthDay
--	WHERE BirthDate < '2017-01-01'

--CREATE INDEX IDX_BirtDay_BirthDate
--ON BirthDay(BirthDate)

--CHECKPOINT; DBCC DROPCLEANBUFFERS;
--SELECT BirthDate
--	FROM BirthDay
--	WHERE BirthDate < '2017-01-01'


-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- 3.Add a full text index for the text column.
--	 Try to search with and without the full-text index and compare the speed.

--SELECT FirstName
--	FROM BirthDay
--	GROUP BY FirstName

--CREATE FULLTEXT CATALOG BirthDayFullFirstNameCatalog
--WITH ACCENT_SENSITIVITY = OFF

--CREATE FULLTEXT INDEX ON BirthDay(FirstName)
--KEY INDEX PK__BirthDay__3214EC071B623FBE
--ON BirthDayFullFirstNameCatalog
--WITH CHANGE_TRACKING AUTO

--SELECT FirstName
--	FROM BirthDay
--	GROUP BY FirstName