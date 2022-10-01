GO
USE master
GO
USE LugiOh
GO
--Start 14:41
--1
SELECT c.CustomerName, c.CustomerGender, c.CustomerPhone, c.CustomerAddress, c.CustomerDOB
FROM Customer AS c
WHERE c.CustomerName LIKE '%l%'
GO
--2
SELECT c.CustomerName, c.CustomerGender, c.CustomerPhone, c.CustomerAddress, [Transaction Month] = DATENAME(MONTH, ht.TransactionDate)
FROM Customer AS c
	 JOIN HeaderTransaction AS ht ON ht.CustomerID=c.CustomerID
WHERE c.CustomerName = 'Adrian Lukito Lo'
GO
--3
SELECT LOWER(ca.CardName) AS [CardName], ca.CardElement, ca.CardLevel, ca.CardAttack, ca.CardDefense, [Total Transaction] = CAST(COUNT(ht.TransactionID) AS VARCHAR) + ' times'
FROM Cards AS ca 
	 JOIN DetailTransaction AS dt ON dt.CardsID=ca.CardsID
	 JOIN HeaderTransaction AS ht ON ht.TransactionID=dt.TransactionID
WHERE ca.CardElement = 'Dark'
GROUP BY LOWER(ca.CardName), ca.CardElement, ca.CardLevel, ca.CardAttack, ca.CardDefense
GO
--4
SELECT ca.CardName, ca.CardElement, [Total Price] = SUM(ca.CardPrice), [Total Transaction] = CAST(COUNT(DISTINCT dt.TransactionID) AS VARCHAR) + ' times'
FROM Cards AS ca
	 JOIN DetailTransaction AS dt ON dt.CardsID=ca.CardsID
	 JOIN HeaderTransaction AS ht ON ht.TransactionID=dt.TransactionID
WHERE DATEDIFF(MONTH, ht.TransactionDate, '2017-12-31') > 8 
GROUP BY ca.CardName, ca.CardElement
UNION 
SELECT ca.CardName, ca.CardElement, [Total Price] = SUM(ca.CardPrice), [Total Transaction] = CAST(COUNT(DISTINCT dt.TransactionID) AS VARCHAR) + ' times'
FROM Cards AS ca
	 JOIN DetailTransaction AS dt ON dt.CardsID=ca.CardsID
	 JOIN HeaderTransaction AS ht ON ht.TransactionID=dt.TransactionID
WHERE ca.CardPrice > 500000
GROUP BY ca.CardName, ca.CardElement
GO
--5
SELECT c.CustomerName, c.CustomerGender, CONVERT(VARCHAR, c.CustomerDOB, 107) AS [CustomerDOB]
FROM Customer AS c
WHERE c.CustomerName IN(
	SELECT C1.CustomerName
	FROM Customer AS C1
		 JOIN HeaderTransaction AS HT1 ON HT1.CustomerID=C1.CustomerID
	WHERE DAY(HT1.TransactionDate) = 5 AND C1.CustomerID=c.CustomerID
)
GO
--6
SELECT ca.CardName, UPPER(ct.CardTypeName), ca.CardElement, [Total Card] = SUM(dt.Quantity), [Total Price] = AVG(ca.CardPrice*dt.Quantity)
FROM Cards AS ca 
	 JOIN CardType AS CT ON CT.CardTypeID=ca.CardTypeID
	 JOIN DetailTransaction AS dt ON dt.CardsID=ca.CardsID
	 JOIN HeaderTransaction AS ht ON ht.TransactionID=dt.TransactionID,
	 (
		SELECT AVG(CA1.CardPrice) AS 'AverageCardPrice'
		FROM Cards AS CA1
	 ) AS sub
WHERE ca.CardElement = 'Dark' AND ca.CardPrice < sub.AverageCardPrice
GROUP BY ca.CardName, UPPER(ct.CardTypeName), ca.CardElement, sub.AverageCardPrice
ORDER BY [Total Card] ASC
GO
--7
CREATE VIEW DragonDeck AS
SELECT [Monster Card] = SUBSTRING(ca.CardName, 1, CHARINDEX(' ', ca.CardName)), ct.CardTypeName, ca.CardElement, ca.CardLevel, ca.CardAttack, ca.CardDefense
FROM Cards AS ca
	 JOIN CardType AS ct ON ct.CardTypeID=ca.CardTypeID
WHERE ct.CardTypeName = 'Dragon'
GO
--8
CREATE VIEW MayTransaction AS 
SELECT c.CustomerName, c.CustomerPhone, s.StaffName, REPLACE(s.StaffPhone, '8', 'x'), ht.TransactionDate, [Sold Card] = SUM(dt.Quantity)
FROM Customer AS c
	 JOIN HeaderTransaction AS ht ON ht.CustomerID=c.CustomerID
	 JOIN Staff AS s ON s.StaffID=ht.StaffID
	 JOIN DetailTransaction AS dt ON dt.TransactionID=ht.TransactionID
WHERE DATENAME(MONTH,ht.TransactionDate) = 'May' AND c.CustomerGender = 'Female' 
GROUP BY c.CustomerName, c.CustomerPhone, s.StaffName, REPLACE(s.StaffPhone, '8', 'x'), ht.TransactionDate
GO
--9
SELECT * FROM Staff
BEGIN TRAN
ALTER TABLE Staff
ADD StaffSalary INT
ALTER TABLE Staff
ADD CONSTRAINT StaffSalary CHECK(StaffSalary > 100000)
ROLLBACK
GO
--10
BEGIN TRAN
UPDATE Cards
SET Cards.CardPrice += 200000
FROM Cards AS c 
	 JOIN DetailTransaction AS dt ON dt.CardsID=c.CardsID
	 JOIN HeaderTransaction AS ht ON ht.TransactionID=dt.TransactionID
	 JOIN CardType AS ct ON ct.CardTypeID=c.CardTypeID
WHERE ct.CardTypeName = 'Divine-Beast' AND dt.Quantity > 10
SELECT * FROM Cards
ROLLBACK

--END OF LINE -- 15:24

