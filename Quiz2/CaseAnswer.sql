GO
USE master
GO 
USE ettaylor
GO
--1
SELECT UPPER(ms.StaffName) AS [StaffName], ms.StaffGender, ms.StaffSalary
FROM MsStaff AS ms
WHERE ms.StaffSalary > 5000000
GO
--2
SELECT tsh.SalesDate, mc.CustomerName, mc.CustomerAddress, mc.CustomerPhone
FROM TrSalesHeader AS tsh 
	 JOIN MsCustomer As mc ON mc.CustomerId=tsh.CustomerId
WHERE DATENAME(MONTH, tsh.SalesDate) = 'September'
GO
--3
SELECT REPLACE(msc.ClothesId, 'CL', 'CLOTHES ') AS [ClothesId], msc.ClothesName, CONCAT('Rp. ', msc.ClothesPrice) AS [ClothesPrice], tsd.Quantity
FROM MsClothes AS msc
	 JOIN TrSalesDetail AS tsd ON tsd.ClothesId=msc.ClothesId
GROUP BY REPLACE(msc.ClothesId, 'CL', 'CLOTHES '), msc.ClothesName, CONCAT('Rp. ', msc.ClothesPrice), tsd.Quantity
HAVING SUM(tsd.Quantity) > 3
ORDER BY tsd.Quantity ASC
GO
--4
SELECT mc.CustomerId, mc.CustomerName, [Average Quantity] = AVG(tsd.Quantity), [Total Transaction] = COUNT(tsh.SalesId)
FROM MsCustomer AS mc
	 JOIN TrSalesHeader AS tsh ON tsh.CustomerId=mc.CustomerId
	 JOIN TrSalesDetail AS tsd ON tsd.SalesId=tsh.SalesId
WHERE mc.CustomerAddress LIKE '%Street' AND DATEDIFF(YEAR, mc.CustomerDOB, tsh.SalesDate) > 20
GROUP BY mc.CustomerId, mc.CustomerName
UNION
SELECT mc.CustomerId, mc.CustomerName, [Average Quantity] = AVG(tsd.Quantity), [Total Transaction] = COUNT(tsh.SalesId)
FROM MsCustomer AS mc
	 JOIN TrSalesHeader AS tsh ON tsh.CustomerId=mc.CustomerId
	 JOIN TrSalesDetail AS tsd ON tsd.SalesId=tsh.SalesId
WHERE mc.CustomerAddress LIKE '%Hill' AND DATEDIFF(YEAR, mc.CustomerDOB, tsh.SalesDate) > 20
GROUP BY mc.CustomerId, mc.CustomerName
GO
--5
SELECT DISTINCT(msc.ClothesName), msct.ClothesTypeName, msc.ClothesPrice, [Sold in Month] = DATENAME(MONTH, tsh.SalesDate) 
FROM MsClothes AS msc
	 JOIN TrSalesDetail AS tsd ON tsd.ClothesId=msc.ClothesId
	 JOIN MsClothesType AS msct ON msct.ClothesTypeId=msc.ClothesTypeId
	 JOIN TrSalesHeader AS tsh ON tsh.SalesId=tsd.SalesId
WHERE msct.ClothesTypeName IN('Dress', 'Blouse') AND msc.ClothesPrice > 300000
GO
--6
SELECT ms.StaffId, SUBSTRING(ms.StaffName, CHARINDEX(' ', ms.StaffName)+1, CHARINDEX(' ', REVERSE(ms.StaffName))) AS [StaffName], ms.StaffSalary, tsh.SalesId, tsh.SalesDate, tsd.Quantity
FROM MsStaff AS ms
	 JOIN TrSalesHeader AS tsh ON tsh.StaffId=ms.StaffId
	 JOIN TrSalesDetail AS tsd ON tsd.SalesId=tsh.SalesId,
	 (
		SELECT AVG(tsd1.Quantity) AS 'AverageQuantity'
		FROM TrSalesDetail AS tsd1 
	 ) AS Sub
WHERE tsd.Quantity > sub.AverageQuantity AND ms.StaffSalary < 5000000
GO
--7
CREATE VIEW [Female Staffs] AS
SELECT 'Ms.' + LEFT(ms.StaffName, CHARINDEX(' ', ms.StaffName, 1)) AS [StaffName], ms.StaffAddress, ms.StaffPhone, ms.StaffDOB, ms.StaffGender
FROM MsStaff AS ms
WHERE ms.StaffGender = 'Female'
GO
--8
CREATE VIEW [Customer that get discount] AS 
SELECT ms.CustomerName, ms.CustomerAddress, ms.CustomerPhone, ms.CustomerDOB, [Total Transaction] = SUM(tsd.Quantity*msc.ClothesPrice)
FROM MsCustomer AS ms
	 JOIN TrSalesHeader AS tsh ON tsh.CustomerId=ms.CustomerId
	 JOIN TrSalesDetail AS tsd ON tsd.SalesId=tsh.SalesId
	 JOIN MsClothes AS msc ON msc.ClothesId=tsd.ClothesId
WHERE YEAR(tsh.SalesDate) = 2021
GROUP BY ms.CustomerName, ms.CustomerAddress, ms.CustomerPhone, ms.CustomerDOB
HAVING SUM(tsd.Quantity* msc.ClothesPrice) > 700000
ORDER BY [Total Transaction] DESC
GO
--9
BEGIN TRAN
ALTER TABLE MsClothes
ADD ClothesDescription VARCHAR(255)
SELECT * FROM MsClothes
ALTER TABLE MsClothes
ADD CONSTRAINT ClothesDescription CHECK(LEN(ClothesDescription) > 10)
COMMIT
GO
--10
BEGIN TRAN
UPDATE MsClothes
SET ClothesPrice -= 20000
FROM MsClothes AS msc
	 JOIN TrSalesDetail AS tsd ON tsd.ClothesId=msc.ClothesId
WHERE ClothesSize IN('L', 'XL', 'XXL') AND tsd.Quantity < 3
SELECT * FROM MsClothes
ROLLBACK

--END 14:01
--LAST SEEN 15:04
--END OF LINE

