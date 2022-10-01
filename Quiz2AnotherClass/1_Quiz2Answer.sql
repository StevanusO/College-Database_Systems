GO
USE master
GO
USE HolidayTour
GO

--1
SELECT *
FROM MsStaff AS ms
WHERE ms.StaffEmail LIKE '%gmail.com'
GO
--2
SELECT mc.CustomerID, mc.CustomerName, mc.CustomerEmail, mc.CustomerPhone, t.PurchaseDate
FROM MsCustomer AS mc
	 JOIN Ticket AS t ON t.CustomerID=mc.CustomerID
WHERE DATENAME(MONTH, t.PurchaseDate) = 'April'
GO
--3
SELECT md.DestinationID, md.DestinationName, md.DestinationLocation, [Total Visit] = CAST(COUNT(td.DestinationID) AS VARCHAR) + ' Times'
FROM MsDestination AS md
	 JOIN TicketDetail AS td ON td.DestinationID=md.DestinationID
GROUP BY md.DestinationID, md.DestinationName, md.DestinationLocation
HAVING COUNT(td.DestinationID) >= 3
ORDER BY [Total Visit] DESC
GO
--4
SELECT t.TicketID, mc.CustomerID, mc.CustomerName, ms.StaffID, ms.StaffName, t.PurchaseDate, [Total Destination] = COUNT(td.DestinationID), [Total Days] = SUM(DATEDIFF(DAY, td.StartDate, td.EndDate))
FROM Ticket AS t 
	 JOIN MsCustomer AS mc ON mc.CustomerID=t.CustomerID
	 JOIN MsStaff AS ms ON ms.StaffID=t.StaffID
	 JOIN TicketDetail AS td ON td.TicketID=t.TicketID
WHERE DATEPART(MONTH, t.PurchaseDate) = 4
GROUP BY t.TicketID, mc.CustomerID, mc.CustomerName, ms.StaffID, ms.StaffName, t.PurchaseDate
UNION
SELECT t.TicketID, mc.CustomerID, mc.CustomerName, ms.StaffID, ms.StaffName, t.PurchaseDate, [Total Destination] = COUNT(td.DestinationID), [Total Days] = SUM(DATEDIFF(DAY, td.StartDate, td.EndDate))
FROM Ticket AS t 
	 JOIN MsCustomer AS mc ON mc.CustomerID=t.CustomerID
	 JOIN MsStaff AS ms ON ms.StaffID=t.StaffID
	 JOIN TicketDetail AS td ON td.TicketID=t.TicketID
WHERE DATEPART(MONTH, t.PurchaseDate) = 6
GROUP BY t.TicketID, mc.CustomerID, mc.CustomerName, ms.StaffID, ms.StaffName, t.PurchaseDate
GO
--5
SELECT t.CustomerID, mc.CustomerName, mc.CustomerEmail, [Phone Number] = STUFF(mc.CustomerPhone, 1, 3, '0'), td.DestinationID, md.DestinationName
FROM MsCustomer AS mc
	 JOIN Ticket AS t ON t.CustomerID=mc.CustomerID
	 JOIN TicketDetail AS td ON td.TicketID = t.TicketID
	 JOIN MsDestination AS md ON md.DestinationID=td.DestinationID
WHERE mc.CustomerEmail LIKE '%yahoo%' AND NOT EXISTS(
	SELECT
	FROM 
)
--6
SELECT DISTINCT(mc.CustomerID), mc.CustomerName, mc.CustomerEmail, mc.CusomerDOB, mc.CustomerPhone, [Total Spending] = sub.[Total Spending]
FROM MsCustomer AS mc 
	 JOIN Ticket AS t ON t.CustomerID=mc.CustomerID,
	 (
		SELECT DISTINCT(t1.CustomerID), SUM(md1.DestinationPrice*DATEDIFF(DAY, td1.StartDate, td1.EndDate)) AS 'Total Spending'
		FROM MsDestination AS md1 
			 JOIN TicketDetail AS td1 ON td1.DestinationID=md1.DestinationID
			 JOIN Ticket AS t1 ON t1.TicketID=td1.TicketID
		WHERE RIGHT(t1.CustomerID, 1) % 2 != 0
		GROUP BY t1.CustomerID
		HAVING SUM(md1.DestinationPrice*DATEDIFF(DAY, td1.StartDate, td1.EndDate)) BETWEEN 1500000 AND 5000000
	 ) AS sub
WHERE sub.CustomerID=mc.CustomerID AND RIGHT(mc.CustomerID, 1) % 2 != 0
GO
--7
CREATE VIEW Yogyakarta_Vacation_List AS 
SELECT [DestinationTypeName] = LOWER(mdt.DestinationTypeName), md.DestinationName, md.DestinationPrice, md.DestinationLocation, md.DestinationDescription
FROM MsDestinationType AS mdt 
	 JOIN MsDestination AS md ON md.DestinationTypeID=mdt.DestinationTypeID
WHERE md.DestinationLocation LIKE '%Yogyakarta%'
GO
--8
CREATE VIEW economic_customer AS 
SELECT DISTINCT(mc.CustomerID), mc.CustomerPhone, mc.CustomerEmail, mc.CustomerName
FROM MsCustomer AS mc
	 JOIN Ticket AS t ON t.CustomerID=mc.CustomerID
	 JOIN TicketDetail As td ON td.TicketID=t.TicketID
	 JOIN MsDestination AS md ON md.DestinationID=td.DestinationID
WHERE md.DestinationPrice > (
	SELECT AVG(md1.DestinationPrice) 
	FROM MsDestination AS md1
) AND MONTH(t.PurchaseDate) % 2 = 0
GO
--9
BEGIN TRAN
ALTER TABlE Ticket
ADD TicketStatus VARCHAR(15)
GO
ALTER TABLE Ticket
ADD CONSTRAINT Ticket CHECK(Ticket LIKE 'Completed' OR Ticket LIKE 'Canceled')
GO
ROLLBACK
--10
BEGIN TRAN
UPDATE MsDestination
SET DestinationPrice += (0.1 * DestinationPrice)
FROM MsDestination AS md
	 JOIN TicketDetail AS td ON td.DestinationID=md.DestinationID
	 JOIN Ticket AS t ON t.TicketID=td.TicketID
	 JOIN MsDestinationType AS mdt ON mdt.DestinationTypeID=md.DestinationTypeID
WHERE DATEPART(DAY, t.PurchaseDate) = 1 AND mdt.DestinationTypeName IN('Panorama', 'Family Tour')
SELECT * FROM MsDestination
ROLLBACK