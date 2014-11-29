CREATE DATABASE ATM
GO

USE ATM
GO

CREATE TABLE CardAccounts
(
	Id int IDENTITY PRIMARY KEY,
	CardNumber char(10) NOT NULL,
	CardPIN char(4) NOT NULL,
	CardCash money NOT NULL
)
GO

INSERT INTO CardAccounts (CardNumber, CardPIN, CardCash)
	VALUES
		('0123456789', '0000', 500),
		('abcdefjhij', '1111', 1000),
		('1a2b3c4d5e', '1234', 700),
		('peshovipid', '9999', 1350)
GO

CREATE TABLE TransactionsHistory
(
	Id int IDENTITY PRIMARY KEY,
	CardNumber char(10) NOT NULL,
	TransactionDate Date NOT NULL,
	Ammount money NOT NULL
)
GO