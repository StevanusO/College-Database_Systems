GO
USE JPizza
GO

-- 1
CREATE TABLE [MsBeverage] (
	BeverageID CHAR(5) PRIMARY KEY CHECK(BeverageID LIKE 'BE[0-9][0-9][0-9]'),
	BeverageName VARCHAR(80) NOT NULL CHECK(LEN(BeverageName) > 3),
	BeveragePrice INT NOT NULL
)

-- 2
SELECT * FROM MsStaff

ALTER TABLE MsStaff
ADD [StaffPhoneNumber] VARCHAR(16)

ALTER TABLE MsStaff
ADD CONSTRAINT StaffPhoneNumber CHECK(StaffPhoneNumber LIKE '+62%')

-- 3
SELECT * FROM MsPizza

INSERT INTO MsPizza VALUES
('PI009', 'Tower Pizza', 6,	1400000)

-- 4
SELECT [PizzaName] = UPPER(PizzaName), PizzaPrice, PizzaSize
FROM MsPizza 
WHERE PizzaPrice > 300000

-- 5
SELECT * FROM TransactionHeader

SELECT * FROM MsStaff


SELECT * FROM MsStaff AS ms JOIN TransactionHeader AS th ON ms.StaffId = th.StaffId
WHERE CustomerId LIKE 'CU005'

BEGIN TRAN
UPDATE MsStaff
SET StaffSalary += 1000000
FROM MsStaff AS ms JOIN TransactionHeader AS th ON ms.StaffId = th.StaffId
WHERE CustomerId LIKE 'CU005'
ROLLBACK
COMMIT
