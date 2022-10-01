GO
USE master
GO
USE DZara
GO
--Start 13:10
--1
SELECT ms.StaffName, ms.StaffGender
FROM MsStaff AS ms
WHERE ms.StaffName LIKE '%Watson'
GO	
--2
SELECT ht.TransactionID, ms.StaffName, ht.TransactionDate
FROM HeaderTransaction AS ht 
	 JOIN MsStaff AS ms ON ms.StaffID=ht.StaffID
WHERE  ms.StaffID = 'ST003'
GO
--3
SELECT mc.CustomerName, STUFF(mc.CustomerPhone, 1, 1, '+62') AS [Phone Number], [Total Transaction] = COUNT(DISTINCT ht.TransactionID)
FROM MsCustomer AS mc
	 JOIN HeaderTransaction AS ht ON ht.CustomerID=mc.CustomerID
WHERE mc.CustomerID BETWEEN 'CU002' AND 'CU004'
GROUP BY mc.CustomerName, STUFF(mc.CustomerPhone, 1, 1, '+62')
GO
--4
SELECT [Date] = CONVERT(VARCHAR, ht.TransactionDate, 107), mc.CustomerName, [Total Price] = SUM(mShirt.Price), [Number of shirt] = COUNT(mShirt.ShirtTypeID)
FROM HeaderTransaction AS ht 
	 JOIN MsCustomer AS mc ON mc.CustomerID=ht.CustomerID
	 JOIN DetailTransaction AS dt ON dt.TransactionID=ht.TransactionID
	 JOIN MsShirt AS mShirt ON mShirt.ShirtID=dt.ShirtID
WHERE DATENAME(MONTH, ht.TransactionDate) = 'February'
GROUP BY CONVERT(VARCHAR, ht.TransactionDate, 107), mc.CustomerName
UNION
SELECT [Date] = CONVERT(VARCHAR, ht.TransactionDate, 107), mc.CustomerName, [Total Price] = SUM(mShirt.Price), [Number of shirt] = COUNT(mShirt.ShirtTypeID)
FROM HeaderTransaction AS ht 
	 JOIN MsCustomer AS mc ON mc.CustomerID=ht.CustomerID
	 JOIN DetailTransaction AS dt ON dt.TransactionID=ht.TransactionID
	 JOIN MsShirt AS mShirt ON mShirt.ShirtID=dt.ShirtID
WHERE DATENAME(MONTH, ht.TransactionDate) = 'January'
GROUP BY CONVERT(VARCHAR, ht.TransactionDate, 107), mc.CustomerName
GO
--5
SELECT DISTINCT(ms.StaffName), [Salary] = 'Rp. ' + CAST(ms.StaffSalary AS VARCHAR)
FROM MsStaff AS ms
	 JOIN HeaderTransaction AS ht ON ht.StaffID=ms.StaffID
WHERE ms.StaffGender = 'Male' AND ms.StaffID IN(
	SELECT ht.StaffID
	FROM HeaderTransaction AS HT1
		 JOIN DetailTransaction AS DT1 ON DT1.TransactionID=HT1.TransactionID
	WHERE (ms.StaffID=HT1.StaffID) AND DT1.Quantity > 2
)
GO
--6
SELECT mShirt.ShirtID, 
	   mShirt.ShirtName, 
	   [Price] = 'Rp. ' + CAST(mShirt.Price AS VARCHAR)
FROM MsShirt AS mShirt 
	 JOIN MsShirtType AS mShirtType ON mShirtType.ShirtTypeID=mShirt.ShirtTypeID
	 JOIN DetailTransaction AS dt ON dt.ShirtID=mShirt.ShirtID
	 JOIN HeaderTransaction AS ht ON ht.TransactionID=dt.TransactionID, (
		SELECT AVG(mShirt1.Price) AS 'AveragePrice'
		FROM MsShirt AS mShirt1
			 JOIN DetailTransaction AS DT1 ON DT1.ShirtID=mShirt1.ShirtID
			 JOIN HeaderTransaction AS HT1 ON HT1.TransactionID=DT1.TransactionID
		WHERE DATEPART(MONTH, HT1.TransactionDate) = 1
) AS sub
WHERE mShirt.ShirtName LIKE '% % %' AND mShirt.Price > sub.AveragePrice
GROUP BY mShirt.ShirtID, mShirt.ShirtName, mShirt.Price, sub.AveragePrice
GO
--7
CREATE VIEW CustomerView AS 
SELECT mc.CustomerName, mc.CustomerAddress, CONVERT(VARCHAR, mc.CustomerDOB, 106) AS [DOB]
FROM  MsCustomer AS mc
WHERE DATENAME(WEEKDAY, mc.CustomerDOB) = 'Wednesday'
GO
--8
CREATE VIEW ShirtView AS 
SELECT mShirt.ShirtName, [Total Price] = SUM(mShirt.Price)
FROM MsShirt AS mShirt
	 JOIN MsShirtType AS mShirtType ON mShirtType.ShirtTypeID=mshirt.ShirtTypeID
	 JOIN DetailTransaction AS dt ON dt.ShirtID=mShirt.ShirtID
	 JOIN HeaderTransaction AS ht ON ht.TransactionID=dt.TransactionID
WHERE mShirt.ShirtName LIKE '% % %' AND YEAR(ht.TransactionDate) = 2021
GROUP BY mShirt.ShirtName
HAVING SUM(mShirt.Price) > 1200000
GO
--9
SELECT * FROM MsStaff
BEGIN TRAN
ALTER TABLE MsStaff
ADD StaffEmail VARCHAR(50)
ROLLBACK
BEGIN TRAN
ALTER TABLE MsStaff
ADD CONSTRAINT StaffEmail CHECK(StaffEmail LIKE '%@binus.ac.id')
ROLLBACK
GO
--10
BEGIN TRAN
DELETE MsShirt
FROM MsShirt AS mShirt
	 JOIN DetailTransaction AS dt ON dt.ShirtID=mShirt.ShirtID
	 JOIN HeaderTransaction AS ht ON ht.TransactionID=dt.TransactionID
WHERE dt.ShirtID BETWEEN 'SH007' AND 'SH009' AND DATEPART(YEAR, ht.TransactionDate) = 2020
SELECT * FROM MsShirt
ROLLBACK

--End Of Line -- 13:53
	







