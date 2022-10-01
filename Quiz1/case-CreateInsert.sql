GO 
USE master
GO

DROP DATABASE IF EXISTS JPizza 

GO
CREATE DATABASE JPizza
GO
USE JPizza
GO 


CREATE TABLE MsCustomer(
	CustomerId CHAR(5) PRIMARY KEY CHECK(CustomerId LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(80) NOT NULL,
	CustomerDOB DATE NOT NULL, 
	CustomerGender VARCHAR(8) NOT NULL,
	CustomerAddress VARCHAR(100) NOT NULL
)


CREATE TABLE MsStaff(
	StaffId CHAR(5) PRIMARY KEY CHECK(StaffId LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(80) NOT NULL,
	StaffDOB DATE NOT NULL, 
	StaffGender VARCHAR(8) NOT NULL,
	StaffAddress VARCHAR(100) NOT NULL,
	StaffSalary INT NOT NULL
)


CREATE TABLE MsPizza(
	PizzaId CHAR(5) PRIMARY KEY CHECK(PizzaID LIKE 'PI[0-9][0-9][0-9]'),
	PizzaName VARCHAR(80) NOT NULL,
	PizzaSize INT NOT NULL, 
	PizzaPrice INT NOT NULL
)

CREATE TABLE TransactionHeader(
	TransactionId CHAR(5) PRIMARY KEY CHECK(TransactionID LIKE 'TR[0-9][0-9][0-9]'),
	CustomerId CHAR(5) FOREIGN KEY REFERENCES MsCustomer(CustomerId) ON UPDATE CASCADE ON DELETE CASCADE,
	Staffid CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffId) ON UPDATE CASCADE ON DELETE CASCADE,
	TransactionDate DATE NOT NULL
)

CREATE TABLE TransactionDetail(
	TransactionId CHAR(5) FOREIGN KEY REFERENCES TransactionHeader(TransactionId) ON UPDATE CASCADE ON DELETE CASCADE,
	PizzaId CHAR(5) FOREIGN KEY REFERENCES MsPizza(PizzaId) ON UPDATE CASCADE ON DELETE CASCADE,
	Qty INT NOT NULL,
	PRIMARY KEY(TransactionId,PizzaId)
)


GO

INSERT INTO MsCustomer VALUES
('CU001','Benedict Vincent','2001-11-21','Male','Jalan palmerah 2'),
('CU002','Brandon Julio Thenaro','2001-06-07','Male','Jalan palmerah 3'),
('CU003','Clarissa Chuardi','2001-08-26','Female','Jalan palmerah 4'),
('CU004','Gabriella Theresendia Skolastika Prasetyo','2001-01-27','Female','Kotak Sunib'),
('CU005','Johanes Peter Vincentius','2001-04-03','Male','Jalan makaliwe'),
('CU006','Lim Lionel Ritchie','2001-02-25','Male','Jalan Jembatan besi'),
('CU007','Stanley Dave Teherag','2001-8-12','Male','Kotak Sunib'),
('CU008','Thaddeus Cleo','2001-12-22','Male','Jalan Palmerah 5')


INSERT INTO MsStaff VALUES
('ST001','William','2001-05-22','Male','Jalan Kedoya',11000000),
('ST002','Peter','2001-02-21','Male','Jalan Kebenaran',5000000),
('ST003','Calvin','2001-08-05','Male','Jalan Gatot',7000000),
('ST004','Andrew','2001-01-02','Male','Jalan Binus',9000000),
('ST005','Catherine','2001-08-21','Male','Jalan Bandung',12000000)




INSERT INTO MsPizza VALUES
('PI001','Meat Meat Meat',4, 300000),
('PI002','Hot Pizza',1, 40000),
('PI003','Macaroni Pizza',2, 300000),
('PI004','Square Pizza',3, 500000),
('PI005','Bobba Pizza',1, 80000),
('PI006','Tomatoe Lover',3, 100000),
('PI007','Wagyu Pizza',3, 400000),
('PI008','Sphere Pizza',2, 900000)


--Header
INSERT INTO TransactionHeader VALUES
('TR001','CU001','ST005','2021-03-04'),
('TR002','CU002','ST004','2021-06-06'),
('TR003','CU003','ST003','2021-03-07'),
('TR004','CU004','ST002','2021-06-09'),
('TR005','CU005','ST001','2021-01-05'),
('TR006','CU006','ST001','2021-08-07'),
('TR007','CU007','ST005','2021-04-03'),
('TR008','CU008','ST004','2021-03-02'),
('TR009','CU002','ST003','2021-01-01'),
('TR010','CU004','ST002','2020-02-06'),
('TR011','CU005','ST002','2020-05-03'),
('TR012','CU002','ST003','2020-06-02'),
('TR013','CU007','ST001','2020-07-04')


--Detail
INSERT INTO TransactionDetail VALUES
('TR001','PI001',1),
('TR001','PI004',2),
('TR001','PI007',1),
('TR002','PI003',2),
('TR002','PI004',1),
('TR003','PI007',3),
('TR003','PI001',4),
('TR003','PI006',2),
('TR004','PI006',1),
('TR004','PI001',3),
('TR005','PI008',8),
('TR006','PI005',4),
('TR007','PI004',4),
('TR007','PI007',3),
('TR008','PI002',4),
('TR008','PI007',1),
('TR009','PI003',4),
('TR009','PI005',2),
('TR010','PI004',3),
('TR011','PI005',2),
('TR012','PI008',1),
('TR013','PI002',4)




