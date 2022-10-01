--Saturday 8 January 2022, Update no 7 [Last Update before submit]
--Monday 11 January 2022, Renaming Table name
GO
USE master
GO
USE UniDloX
GO

/*
1.	Display StaffID, StaffName, StaffAddress, SupplierName, Total Purchases (obtained from the total number of purchase) for every purchase which occurs in November and handled by Staff whose the last character of StaffID is an even number. {OK}
*/
SELECT PTH.SHID AS [StaffID], 
	   SH.SHName AS [StaffName], 
	   SH.SHAddress AS [StaffAddress], 
	   SP.SupName AS [SupplierName], 
	   [Total Purchases] = COUNT(DISTINCT PTH.PTID)
FROM PurchaseTransactionHeader PTH
	 JOIN StaffHired SH ON(PTH.SHID=SH.SHID)
	 JOIN Supplier SP ON(SP.SupID=PTH.SupID)
WHERE DATENAME(MONTH, PTH.TransactionDate) = 'November' AND RIGHT(SH.SHID, 1) % 2 = 0
GROUP BY PTH.SHID, SH.SHName, SH.SHAddress, SP.SupName
GO
/*
2.	Display SalesID, CustomerName, Total Sales Price (obtained from sum of the cloth price and quantity) for every sales transaction whose CustomerName contains 'm' and the total sales price is greater than 2000000. {OK}
*/
SELECT STD.STID AS [SalesID], 
	   C.CustName AS [CustomerName], 
       [Total Sales Price] = SUM(CS.Cprice*STD.Quantity)
FROM SalesTransactionHeader AS STH JOIN Customer AS C ON C.CustID=STH.CustID
	 JOIN SalesTransactionDetail AS STD ON STD.STID=STH.STID
	 JOIN ClothSold AS CS ON CS.ClothSoldID=STD.ClothSoldID
WHERE C.CustName LIKE '%m%'
GROUP BY STD.STID, C.CustName
HAVING SUM(CS.Cprice*STD.Quantity) > 2000000
GO
/*
3.	Display Month (obtained from month name), Transaction Count (obtained from the total number of purchases), and Material Sold Count (obtained from the sum of quantity) for every purchase that is managed by staff whose StaffAge between 25 and 30 and the material sold price is more than 150000. {OK}
*/
SELECT [Month] = DATENAME(MONTH, PTH.TransactionDate), 
	   [Transaction Count] = COUNT(DISTINCT PTH.PTID), 
	   [Material Sold Count] = SUM(PTD.Quantity)
FROM PurchaseTransactionHeader AS PTH 
	 JOIN PurchaseTransactionDetail AS PTD ON PTH.PTID=PTD.PTID
WHERE EXISTS(
	SELECT SH.SHAge
	FROM StaffHired AS SH
	WHERE SH.SHAge BETWEEN 25 AND 30 AND SH.SHID = PTH.SHID
) AND EXISTS(
	SELECT MP.MatPrice
	FROM MaterialPurchased AS MP
	WHERE MP.MatPrice > 150000 AND MP.MatPurchaseID=PTD.MatPurchaseID
)
GROUP BY DATENAME(MONTH, PTH.TransactionDate)
GO
/*
4.	Display CustomerName (obtained from customer name in lowercase format), CustomerEmail, CustomerAddress, Cloth Bought Count (Obtained from the total number of cloths bought), and Total Price (obtained by adding 'IDR ' in front of the sum of quantity and cloth price) for every transaction which payment using 'Cryptocurrency”, “Cash”, or “Shopee-Pay”. {OK}
*/
SELECT LOWER(C.CustName) AS [CustomerName], 
	   C.CustEmail AS [CustomerEmail], 
	   C.CustAddress AS [CustomerAddress],
	   [Cloth Bought Count] = COUNT(DISTINCT STD.ClothSoldID),
	   [Total Price] = 'IDR ' + CAST(SUM(STD.Quantity*CS.Cprice) AS VARCHAR)
FROM Customer AS C 
	 JOIN SalesTransactionHeader AS STH ON STH.CustID=C.CustID
	 JOIN SalesTransactionDetail AS STD ON STD.STID=STH.STID
	 JOIN ClothSold AS CS ON CS.ClothSoldID=STD.ClothSoldID
WHERE PaymentTypeID IN(
	SELECT PaymentTypeID
	FROM PaymentType
	WHERE PaymentTypeName IN('Cryptocurrency', 'Cash', 'Shopee-Pay')
)
GROUP BY LOWER(C.CustName), C.CustEmail, C.CustAddress
GO
--Cloth Bought Count could be SUM(Quantity)
/*
5.	Display PurchaseID (obtained from the last 3 characters of the PurchaseID), PurchaseDate, StaffName, and PaymentTypeName for every transaction which served by staff whose gender is female and salary is greater than the average salary of every staff who was born before 1996.
(alias subquery) {OK}
*/
SELECT [PurchaseID] = RIGHT(PTH.PTID, 3), 
	   [PurchaseDate] = TransactionDate, 
	   SH.SHName AS [StaffName], 
	   PT.PaymentTypeName AS [PaymentTypeName]
FROM PurchaseTransactionHeader AS PTH JOIN StaffHired AS SH ON SH.SHID=PTH.SHID
	 JOIN PaymentType AS PT ON PT.PaymentTypeID=PTH.PaymentTypeID,
	 (
		 SELECT AVG(SHInside.SHSalary) AS AVGSHSalary
		 FROM StaffHired AS SHInside
		 WHERE YEAR(SHInside.SHDOB) < 1998
	 ) AS AVGAliasQuery
WHERE SH.SHGender = 'female' AND SH.SHSalary > AVGSHSalary
GROUP BY  RIGHT(PTH.PTID, 3), TransactionDate, SH.SHName, PT.PaymentTypeName, AVGSHSalary
GO
/*
6.	Display SalesID, SalesDate (obtained from SalesDate with “Mon dd, yyyy” format), CustomerName, CustomerGender for every transaction which occurred in 2021 and quantity is lower than the minimum quantity of all transaction that occurred on the 15th day of the month.
(alias subquery) {OK}
*/
SELECT [SalesID]=STH.STID, 
	   [SalesDate] = CONVERT(VARCHAR, STH.TransactionDate, 107), 
	   [CustomerName]=CU.CustName, 
	   [CustomerGender]=CU.CustGender
FROM SalesTransactionHeader AS STH 
	 JOIN SalesTransactionDetail AS STD ON (STD.STID=STH.STID) 
	 JOIN Customer AS CU ON ( CU.CustID = STH.CustID ),
	 (
		SELECT MIN(Quantity) AS "MinQSTH"
		FROM SalesTransactionDetail AS STD
			 JOIN SalesTransactionHeader AS STH ON (STD.STID=STH.STID)
		WHERE DAY(STH.TransactionDate) = 15
	 ) AS min_quan_sales
WHERE STD.Quantity < min_quan_sales.MinQSTH AND YEAR(STH.TransactionDate) = 2021
GO
--MinQSTH = 1
/*
7.	Display PurchaseID, SupplierName, SupplierPhone (obtained by replacing SupplierPhone first character into ‘+62’), PurchaseDate (obtained from the weekday of the PurchaseDate), Quantity for every transaction which occurred on Friday until Sunday and quantity is greater than average of total quantity (obtained from sum of the quantity) for every purchase. {OK}
*/
SELECT PTD.PTID AS [PurchaseID], 
	   SP.SupName AS [SupplierName], 
	   STUFF(SP.SupPhoneNum, 1, 1, '+62') AS [SupplierPhone], 
	   DATENAME(WEEKDAY, PTH.TransactionDate) AS [PurchaseDate], 
	   SUM(PTD.Quantity) AS [Quantity for every transaction]
FROM PurchaseTransactionHeader AS PTH JOIN
	 PurchaseTransactionDetail PTD ON PTD.PTID=PTH.PTID JOIN
	 Supplier AS SP ON SP.SupID=PTH.SupID, 
	 (
		SELECT AVG(Sum_of_quantity.SumQTY) as "AvgSumQTY"
		FROM (
			SELECT PTD2.PTID, SUM(PTD2.Quantity) AS "SumQTY"
			FROM PurchaseTransactionDetail AS PTD2
			GROUP BY PTD2.PTID
		) AS Sum_of_quantity
	 ) AS Avg_of_sum_quantity
WHERE DATENAME(WEEKDAY, PTH.TransactionDate) IN ('Friday', 'Saturday', 'Sunday') 
GROUP BY PTD.PTID, SP.SupName, STUFF(SP.SupPhoneNum, 1, 1, '+62'), DATENAME(WEEKDAY, PTH.TransactionDate), Avg_of_sum_quantity.AvgSumQTY
HAVING SUM(PTD.Quantity) > Avg_of_sum_quantity.AvgSumQTY
GO

/*
8.	Display CustomerName (obtained by adding “Mr. ” in front of the CustomerName if CustomerGender is Male or “Mrs. ” if CustomerGender is female), CustomerPhone, CustomerAddress, CustomerDOB (obtained from SalesDate with “dd/mm/yyy” format), and Cloth Count (obtained from the total number of cloths bought) for every customer which has the highest total number of cloth bought and CustomerName contains “o”.
(alias subquery) {OK}
*/
SELECT CASE 
		WHEN C.CustGender = 'Male' THEN 'Mr. ' + C.CustName
		WHEN C.CustGender = 'Female' THEN 'Mrs. ' + C.CustName
		ELSE 'Mr/Mrs. ' + C.CustName END AS [CustomerName], 
	    C.CustPhoneNum AS [CustomerPhone], 
		C.CustAddress AS [CustomerAddress], 
		CONVERT(VARCHAR, C.CustDOB, 103) AS [CustomerDOB],
	    COUNT(DISTINCT STD.ClothSoldID) AS [Cloth Count]
FROM Customer AS C JOIN
	 SalesTransactionHeader AS STH ON STH.CustID=C.CustID JOIN
	 SalesTransactionDetail AS STD ON STD.STID=STH.STID, 
	(
		SELECT MAX(cloth_count.ClothCountSold) AS "MaxClothCount"
		FROM
		(
			SELECT STH2.CustID, COUNT(DISTINCT STD2.ClothSoldID) AS "ClothCountSold"
			FROM SalesTransactionHeader AS STH2
					JOIN SalesTransactionDetail AS STD2 ON STD2.STID=STH2.STID
			GROUP BY STH2.CustID
		) AS cloth_count
	) AS max_count_cloth
WHERE C.CustName LIKE '%o%'
GROUP BY CASE WHEN C.CustGender = 'Male' THEN 'Mr. ' + C.CustName WHEN C.CustGender = 'Female' THEN 'Mrs. ' + C.CustName ELSE 'Mr/Mrs. ' + C.CustName END,  C.CustPhoneNum, C.CustAddress, CONVERT(VARCHAR, C.CustDOB, 103), max_count_cloth.MaxClothCount
HAVING  max_count_cloth.MaxClothCount = COUNT(DISTINCT STD.ClothSoldID)
GO

/*
9.	Create a view named “ViewCustomerTransaction” to display CustomerID, CustomerName, CustomerEmail, CustomerDOB, Minimum Quantity (obtained from the minimum quantity purchased), Maximum Quantity (obtained from the maximum quantity purchased) for every customer whose born in 2000 and later and has an email domain “@yahoo.com” {OK}
*/
CREATE VIEW ViewCustomerTransaction AS
SELECT STH.CustID AS [CustomerID], 
	   C.CustName AS [CustomerName], 
	   C.CustEmail AS [CustomerEmail], 
	   C.CustDOB AS [CustomerDOB],
	   MIN(STD.Quantity) AS [Minimum Quantity], 
	   MAX(STD.Quantity) AS [Maximum Quantity]
FROM SalesTransactionHeader AS STH
	 JOIN Customer AS C ON C.CustID=STH.CustID
	 JOIN SalesTransactionDetail AS STD ON STD.STID=STH.STID
WHERE C.CustEmail LIKE '%yahoo.com' AND YEAR(C.CustDOB) >= 2000
GROUP BY STH.CustID, C.CustName, C.CustEmail, C.CustDOB
GO

/*
10.	Create a view named “ViewFemaleStaffTransaction” to view StaffID, StaffName (obtained by uppercasing StaffName), StaffSalary (obtained by adding “Rp. ” in front of the StaffSalary and ends with “,00”), Material Bought Count (obtained from count of the material bought and ends with “ Pc(s)”) for every staff whose gender is female and salary is greater than average of all staff salaries.
*/
CREATE VIEW ViewFemaleStaffTransaction AS
SELECT PTH.SHID AS [StaffID], 
	   UPPER(SH.SHName) AS [StaffName], 
	   'Rp. ' + CAST(SH.SHSalary AS VARCHAR) + ',00' AS [StaffSalary], 
	   CAST(COUNT(DISTINCT PTD.MatPurchaseID) AS VARCHAR) + ' Pc(s)' AS [Material Bought Count]
FROM StaffHired AS SH 
	 JOIN PurchaseTransactionHeader AS PTH ON PTH.SHID=SH.SHID
	 JOIN PurchaseTransactionDetail AS PTD ON PTD.PTID=PTH.PTID,
	 (
		SELECT AVG(SH1.SHSalary) AS 'AVGStaffSalary'
		FROM StaffHired AS SH1
	 ) AS avg_salary
WHERE SH.SHGender = 'Female'AND SH.SHSalary > avg_salary.AVGStaffSalary
GROUP BY PTH.SHID, UPPER(SH.SHName), 'Rp. ' + CAST(SH.SHSalary AS VARCHAR) + ',00'


--END OF LINE
