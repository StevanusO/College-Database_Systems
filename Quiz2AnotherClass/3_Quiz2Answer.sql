GO
USE master
GO
USE BluejackPainting
GO
--1
SELECT p.PaintingID, p.PaintingName, p.PaintingPrice
FROM Painting AS p
WHERE LEN(p.PaintingName) > 15
GO
--2
SELECT ht.CustomerID, c.CustomerName, ht.TransactionDate
FROM HeaderTransaction AS ht 
	 JOIN Customer AS c ON c.CustomerID=ht.CustomerID
WHERE DATENAME(MONTH, ht.TransactionDate) = 'September'
GO
--3
SELECT p.PaintingName, 'IDR ' + CAST(p.PaintingPrice AS VARCHAR) + ',-' AS [Price], [Total Profit] = SUM(dt.Quantity*p.PaintingPrice)
FROM Painting AS p
	 JOIN DetailTransaction AS dt ON dt.PaintingID=p.PaintingID
WHERE  p.PaintingName LIKE '%d%'
GROUP BY p.PaintingName,  CAST(p.PaintingPrice AS VARCHAR)
GO
--4
SELECT c.CustomerName, ht.TransactionID, ht.TransactionDate, 
	   [Total of Painting] = COUNT(DISTINCT dt.PaintingID),
	   [Total of Quantity] = SUM(dt.Quantity)
FROM Customer AS c
	 JOIN HeaderTransaction AS ht ON ht.CustomerID=c.CustomerID
	 JOIN DetailTransaction AS dt ON dt.TransactionID=ht.TransactionID
WHERE YEAR(c.CustomerDOB) % 2 != 0
GROUP BY c.CustomerName, ht.TransactionID, ht.TransactionDate
UNION
SELECT c.CustomerName, ht.TransactionID, ht.TransactionDate, 
	   [Total of Painting] = COUNT(DISTINCT dt.PaintingID),
	   [Total of Quantity] = SUM(dt.Quantity)
FROM Customer AS c
	 JOIN HeaderTransaction AS ht ON ht.CustomerID=c.CustomerID
	 JOIN DetailTransaction AS dt ON dt.TransactionID=ht.TransactionID
WHERE LEN(c.CustomerName) > 10
GROUP BY c.CustomerName, ht.TransactionID, ht.TransactionDate
GO
--5
SELECT c.CustomerName, c.CustomerAddress, c.CustomerEmail, [Date of Birth] = CONVERT(VARCHAR, c.CustomerDOB, 106)
FROM Customer AS c
WHERE c.CustomerID IN(
	SELECT HT1.CustomerID
	FROM HeaderTransaction AS HT1
		 JOIN DetailTransaction AS DT1 ON DT1.TransactionID=HT1.TransactionID
		 JOIN Painting AS P1 ON P1.PaintingID=DT1.PaintingID
		 JOIN PaintingType AS PT1 ON PT1.PaintingTypeID=P1.PaintingTypeID
	WHERE DATENAME(MONTH, HT1.TransactionDate) = 'July' AND PT1.PaintingTypeName = 'Abstract'
)
GO
--6
SELECT DISTINCT(c.CustomerID), c.CustomerName, c.CustomerEmail
FROM Customer AS c
	 JOIN HeaderTransaction AS ht ON ht.CustomerID=c.CustomerID
	 JOIN DetailTransaction AS dt ON dt.TransactionID=ht.TransactionID,
	 (
		SELECT AVG(DT1.Quantity) AS 'AverageQty'
		FROM HeaderTransaction AS HT1 
			 JOIN DetailTransaction AS DT1 ON DT1.TransactionID=HT1.TransactionID
	 ) AS sub
WHERE dt.Quantity > sub.AverageQty AND CHARINDEX(' ', c.CustomerName, 1) != 0
GROUP BY c.CustomerID, c.CustomerName, c.CustomerEmail, sub.AverageQty
ORDER BY c.CustomerName ASC
GO
--7
CREATE VIEW StaffOddView AS 
SELECT 'Staff ' + RIGHT(s.StaffID, 3) AS [StaffID], s.StaffName, s.StaffAddress
FROM Staff AS s
WHERE CONVERT(INT, RIGHT(s.StaffID, 1)) % 2 != 0
GO
--8
CREATE VIEW TransactionDataOfModernismPainting AS 
SELECT ht.TransactionID, [Day of Transaction] = DATENAME(WEEKDAY, ht.TransactionDate), ht.TransactionDate, UPPER(p.PaintingName) AS [Painting Title], [Quantity] = SUM(dt.Quantity)
FROM HeaderTransaction AS ht
	 JOIN DetailTransaction AS dt ON dt.TransactionID=ht.TransactionID
	 JOIN Painting AS p ON p.PaintingID=dt.PaintingID
	 JOIN PaintingType AS pt ON pt.PaintingTypeID=p.PaintingTypeID
WHERE pt.PaintingTypeName = 'Modernism'
GROUP BY ht.TransactionID, DATENAME(WEEKDAY, ht.TransactionDate), ht.TransactionDate, UPPER(p.PaintingName)
ORDER BY UPPER(p.PaintingName) ASC
GO
--9
BEGIN TRAN
ALTER TABLE Customer
ADD CustomerSocialMedia VARCHAR(30)

ALTER TABLE Customer
ADD CONSTRAINT CustomerSocialMedia CHECK(LEN(CustomerSocialMedia) BETWEEN 5 AND 25)
ROLLBACK
GO
--10
BEGIN TRAN
DELETE Customer
FROM HeaderTransaction AS ht
	 JOIN DetailTransaction AS dt ON dt.TransactionID=ht.TransactionID
	 JOIN Customer AS c ON c.CustomerID=ht.CustomerID
WHERE dt.Quantity > 6 AND MONTH(ht.TransactionDate) % 2 = 0
SELECT * FROM Customer
ROLLBACK
GO