GO
USE master
GO
USE UniDloX
GO

-- Randomly Generate Data by https://generatedata.com/generator
INSERT INTO StaffHired(SHID, SHName, SHAddress, SHGender, SHPhoneNum, SHAge, SHSalary, SHDOB) VALUES
					  ('SF001', 'Andre Setiawan Wijaya', 'Orchid Street', 'Male', '+6281908856868', 19, 4300000, '2004-05-22'),
					  ('SF002', 'Erwin', 'Rose Street', 'Male', '+6282122221610', 20, 4500000, '2001-01-15'),
					  ('SF003', 'Felix Novando', 'Lily Street', 'Male', '+6285269374552', 30, 4350000, '1991-11-16'),
					  ('SF004', 'Veronica', 'Sun Street', 'Female', '+6281289075249', 31, 4450000, '1990-06-20'),
					  ('SF005', 'Julieta', 'Lotus Street', 'Female', '+62818190999', 33, 4310000, '1988-04-12'),
					  ('SF006', 'Hansen Artajaya', 'Tulip Street', 'Male', '+6289618521447', 24, 4390000, '1997-01-05'),
					  ('SF007', 'Jose Giancarlos', 'Daisy Street', 'Male', '+6281296204300', 21, 4390000, '2000-05-11'),
					  ('SF008', 'Chelsey', 'Jasmine Street', 'Female', '+6283898987977', 25, 4400000, '1996-07-05'),
					  ('SF009', 'Adewirya Niko Sidharta', 'Gardenia Street', 'Male', '+6282221942330', 33, 4320000, '1988-05-15'),
					  ('SF010', 'Maverick Sean Therry', 'Lavender Street', 'Male', '+6281283861646', 22, 4300000, '1999-05-16');
GO

-- Randomly Generate data by https://generatedata.com/generator
INSERT INTO Customer(CustID, CustName, CustEmail, CustPhoneNum, CustAddress, CustDOB, CustGender) VALUES 
					('CU001', 'Kameko Anderson', 'kamekoanderson@gmail.com', '0217944116620', 'P.O. Box 464, 9848 Enim. Rd.', '1994-10-09', 'Male'),
					('CU002', 'Dahlia Phillips', 'dahliaphillips8379@gmail.com', '0213138278123','711-9339 Ut, St.', '2004-07-24', 'Female'),
					('CU003', 'Murphy James', 'murphyjames@gmail.com', '089684246558', 'P.O. Box 530, 1289 Purus. Street', '1992-03-20', 'Male'),
					('CU004', 'Iona Henderson', 'ionahenderson4083@yahoo.com', '088562737099', 'P.O. Box 369, 6538 Rutrum St.', '1988-06-04', 'Male'),
					('CU005', 'Merritt Carroll', 'merrittcarroll@yahoo.com', '087549152651', 'P.O. Box 350, 5224 Cras St.', '2004-02-09', 'Female'),
					('CU006', 'Evelyn Morris', 'evelynmorris@gmail.com', '0215422654282', 'Ap #829-8671 Mauris St.', '1997-01-22', 'Female'),
					('CU007', 'Larissa Hayes', 'larissahayes@yahoo.com', '0215357232321', 'Ap #194-9855 Donec St.', '2004-04-17', 'Female'),
					('CU008', 'Tamara Tran', 'tamaratran5127@gmail.com', '083787444571', 'P.O. Box 928, 298 Sem St.', '1985-04-03', 'Female'),
					('CU009', 'Jorden Fisher', 'jordenfisher1979@gmail.com', '088262007157', 'P.O. Box 777, 4120 Convallis Rd.', '2003-03-28', 'Male'),
					('CU010', 'Jordan Walker','jordanwalker@gmail.com','081974117448','Ap #954-5611 Eu St.','1994-07-05', 'Male'),
					('CU011', 'Barbara Long', 'barbaralong5978@yahoo.com', '086857351242', '983-9934 Suspendisse Rd.', '1988-07-22', 'Female'),
					('CU012', 'Logan Hamilton', 'loganhamilton@yahoo.com', '084831674353', '410-3342 Quis Street', '1995-08-13', 'Male'),
					('CU013', 'Gray Matthews', 'graymatthews7848@yahoo.com', '089662584549', '236-2812 Aliquet Avenue', '2003-01-03', 'Male'),
					('CU014', 'Garrett Elliott', 'garrettelliott@gmail.com', '086861371131', '4742 Orci Ave', '1995-07-01', 'Male'),
					('CU015', 'Dexter Webb', 'dexterwebb@yahoo.com', '086873438145', '665-4002 Pede. St.', '1986-11-04', 'Male'),
				    ('CU016', 'Jessamine Fisher', 'jessaminefisher@yahoo.com', '084747618311', 'Ap #304-4570 Ut Street', '1999-08-12', 'Female'),
				    ('CU017', 'Paul Cung', 'paulcung@gmail.com', '0214732468253', 'Ap #612-6053 Tincidunt Rd.','1988-08-10', 'Male'),
				    ('CU018', 'Clayton Webb', 'claytonwebb7120@gmail.com', '083847558342', 'Ap #866-8792 Mattis Av.', '2004-12-13', 'Female'),
				    ('CU019', 'Bruno Bennett', 'brunobennett9036@yahoo.com', '085378112608', 'Ap #880-6735 Erat. St.', '1985-03-22', 'Male'),
					('CU020', 'Merritt Herrera', 'merrittherrera4639@gmail.com', '0213472649331', 'Ap #624-7955 Euismod Ave', '1986-08-13', 'Female'),
					('CU021', 'Hedwig', 'hedwig3672@yahoo.com', '086519152325', '748-6466 Dui. Rd.', '2001-11-03', 'Female'),
				    ('CU022', 'Leslie', 'leslie@gmail.com', '086642816255', 'P.O. Box 964, 7788 Enim St.', '1996-01-20', 'Female'),
				    ('CU023', 'Cally', 'cally6087@gmail.com', '0212361014318', '485-2164 Libero Ave', '1985-01-18', 'Female'),
				    ('CU024', 'Montana', 'montana@gmail.com', '0211412294034', '594-9503 Ac Avenue', '1993-09-11', 'Female'),
				    ('CU025', 'Scarlett', 'scarlett6113@yahoo.com', '0212690567052', '8142 Interdum. Av.', '1998-12-27', 'Female'),
				    ('CU026', 'Roanna', 'roanna8991@yahoo.com', '084269844359', '3260 Placerat, Road', '1995-04-20', 'Female');

GO

INSERT INTO PaymentType(PaymentTypeID, PaymentTypeName) VALUES
('PA001', 'DANA'), ('PA002', 'OVO'), ('PA003', 'GO-PAY'), ('PA004', 'Shopee-Pay'), ('PA005', 'Cash'), 
('PA006', 'Debit Card'), ('PA007', 'Credit Card'), ('PA008', 'Cryptocurrency'), ('PA009', 'Flazz');
GO

-- Randomly Generate by https://generatedata.com/generator 
INSERT INTO Supplier(SupID, SupName, SupPhoneNum, SupAddress)VALUES
('SU001', 'Yetta Hendrix', '020467181006', 'Ap #556-8943 Sapien Road'), 
('SU002', 'Chaney Atkinson', '082181017004', 'Ap #914-2779 Augue St.'),
('SU003', 'Bernard Decker', '083062278950', 'P.O. Box 439, 5403 Nunc Av.'), 
('SU004', 'Gil Moody', '087386746546', '328-6207 Sit Av.'),
('SU005', 'Freya Hebert', '081208315721', '997-4718 Sociis Rd.'), 
('SU006', 'Cathleen Curry', '086218088672', 'Ap #214-6527 Vivamus Street'),
('SU007', 'Kadeem Gamble', '087521165030', '734-6005 Amet, Avenue'), 
('SU008', 'Maryam Butler', '082636184085', '908-5139 Lobortis Road'),
('SU009', 'Anthony Higgins', '021631045152', 'P.O. Box 953, 5311 Lorem, St.'), 
('SU010', 'Gregory Navarro', '021414278214', '2868 Diam. Rd.');
GO

--Random Price
INSERT INTO MaterialPurchased(MatPurchaseID, MatName, MatPrice) VALUES
('MA001', 'Cotton', 38000), 
('MA002', 'Cellulosic Fibres', 45000), 
('MA003', 'Viscose Fiber', 93000), 
('MA004', 'Wool', 137550), 
('MA005', 'Silk', 122000), 
('MA006', 'Leather-Lambskin', 77000),
('MA007', 'Leather-Cowhide', 76500),
('MA008', 'Silver', 3500000), 
('MA009', 'Polyester Fiber', 30000),
('MA010', 'Linen', 210000), 
('MA011', 'Cashmere', 100000), 
('MA012', 'Denim', 300000),
('MA013', 'Drill', 100000),
('MA014', 'Lycra', 20000),
('MA015', 'Suede', 40000);
GO

INSERT INTO PurchaseTransactionHeader(PTID, SHID, SupID, PaymentTypeID, TransactionDate) VALUES
('PU001', 'SF003', 'SU009', 'PA006', '2021-09-03'),
('PU002', 'SF003', 'SU001', 'PA006', '2021-09-03'),
('PU003', 'SF003', 'SU003', 'PA006', '2021-09-03'),
('PU004', 'SF003', 'SU004', 'PA006', '2021-09-03'),
('PU005', 'SF003', 'SU005', 'PA006', '2021-09-03'),
--
('PU006', 'SF006', 'SU002', 'PA007', '2021-10-23'),
('PU007', 'SF006', 'SU003', 'PA007', '2021-10-23'),
('PU008', 'SF006', 'SU005', 'PA007', '2021-10-23'),
('PU009', 'SF006', 'SU006', 'PA007', '2021-10-23'),
('PU010', 'SF006', 'SU008', 'PA007', '2021-10-23'),
--
('PU011', 'SF002', 'SU004', 'PA005', '2021-09-30'),
('PU012', 'SF002', 'SU001', 'PA005', '2021-09-30'),
('PU013', 'SF002', 'SU002', 'PA005', '2021-09-30'),
('PU014', 'SF002', 'SU009', 'PA005', '2021-09-30'),
('PU015', 'SF002', 'SU010', 'PA005', '2021-09-30'),
--
('PU016', 'SF007', 'SU005', 'PA006', '2021-10-07'),
('PU017', 'SF007', 'SU002', 'PA006', '2021-10-07'),
('PU018', 'SF007', 'SU001', 'PA006', '2021-10-07'),
('PU019', 'SF007', 'SU003', 'PA006', '2021-10-07'),
('PU020', 'SF007', 'SU007', 'PA006', '2021-10-07');
GO

INSERT INTO PurchaseTransactionDetail(PTID, MatPurchaseID, Quantity)VALUES
('PU001', 'MA001', 20),
('PU001', 'MA004', 15),
('PU001', 'MA005', 16),
('PU001', 'MA009', 21),
('PU001', 'MA008', 10),
('PU002', 'MA015', 27),
('PU002', 'MA012', 11),
('PU002', 'MA013', 5),
('PU002', 'MA011', 8),
('PU002', 'MA001', 22),
('PU003', 'MA014', 28),
('PU003', 'MA005', 5),
('PU003', 'MA009', 30),
('PU003', 'MA008', 4),
('PU003', 'MA012', 9),
('PU004', 'MA011', 10),
('PU004', 'MA013', 6),
('PU004', 'MA006', 14),
('PU004', 'MA007', 19),
('PU004', 'MA012', 10),
('PU005', 'MA004', 9),
('PU005', 'MA013', 6),
('PU005', 'MA007', 26),
('PU005', 'MA011', 10),
('PU005', 'MA002', 30),
('PU007', 'MA015', 20),
('PU007', 'MA013', 10),
('PU007', 'MA002', 34),
('PU007', 'MA001', 42),
('PU008', 'MA014', 37),
('PU008', 'MA005', 14),
('PU008', 'MA009', 20),
('PU008', 'MA008', 2),
('PU008', 'MA012', 3),
('PU009', 'MA013', 2),
('PU009', 'MA004', 4),
('PU009', 'MA008', 1),
('PU009', 'MA009', 40),
('PU010', 'MA014', 49),
('PU011', 'MA015', 20),
('PU012', 'MA001', 37),
('PU013', 'MA005', 21),
('PU014', 'MA012', 10),
('PU015', 'MA010', 9),
('PU016', 'MA001', 10),
('PU016', 'MA005', 2),
('PU016', 'MA010', 10),
('PU016', 'MA015', 56),
('PU017', 'MA004', 23),
('PU017', 'MA009', 20),
('PU017', 'MA014', 21),
('PU018', 'MA008', 1),
('PU018', 'MA013', 2),
('PU019', 'MA007', 4),
('PU019', 'MA012', 5),
('PU020', 'MA012', 5),
('PU020', 'MA008', 2),
('PU020', 'MA013', 3);
GO

INSERT INTO ClothSold(ClothSoldID, Cname, Cstock, Cprice)VALUES
('CL001', 'Sweater', 100, 250000),
('CL002', 'Hoodies', 220, 199000),
('CL003', 'T-Shirt', 120, 259000),
('CL004', 'Dress', 240, 149000),
('CL005', 'Jacket', 250, 145000),
('CL006', 'Formal Coat', 20, 399000),
('CL007', 'Party Wear Coat', 20, 229000),
('CL008', 'Long Coat', 30, 475000),
('CL009', 'Polo Shirt', 90, 299000),
('CL010', 'Knitwear', 75, 390000),
('CL011', 'Long Black Tie', 40 , 165000),
('CL012', 'UV Protection Twill Cap',  100, 299000),
('CL013', 'HEATTECH Knitted Cap',  55, 149000),
('CL014', 'JWA Cashmere Ribbed Beanie',  15, 599000),
('CL015', 'Rayon Long Sleeve',  100, 299000);
GO

INSERT INTO SalesTransactionHeader(STID, SHID, CustID, PaymentTypeID, TransactionDate)VALUES
('SA001', 'SF002', 'CU001', 'PA005', '2021-11-11'),
('SA002', 'SF002', 'CU003', 'PA005', '2021-11-11'),
('SA003', 'SF002', 'CU002', 'PA005', '2021-11-11'),
--
('SA004', 'SF001', 'CU004', 'PA001', '2021-11-15'),
('SA005', 'SF001', 'CU008', 'PA001', '2021-11-15'),
('SA006', 'SF001', 'CU007', 'PA001', '2021-11-15'),
--
('SA007', 'SF010', 'CU005', 'PA006', '2021-11-12'),
('SA008', 'SF010', 'CU006', 'PA006', '2021-11-12'),
('SA009', 'SF010', 'CU009', 'PA006', '2021-11-12'),
--
('SA010', 'SF008', 'CU010', 'PA007', '2021-11-13'),
('SA011', 'SF008', 'CU012', 'PA007', '2021-11-13'),
('SA012', 'SF008', 'CU014', 'PA007', '2021-11-13'),
--
('SA013', 'SF009', 'CU011', 'PA002', '2021-11-14'),
('SA014', 'SF009', 'CU013', 'PA002', '2021-11-14'),
('SA015', 'SF009', 'CU015', 'PA002', '2021-11-14');
GO

INSERT INTO SalesTransactionDetail(STID, ClothSoldID, Quantity)VALUES
('SA001', 'CL001', 6),
('SA001', 'CL003', 4),
('SA001', 'CL004', 7),
('SA002', 'CL002', 5),
('SA002', 'CL015', 10),
('SA002', 'CL006', 4),
('SA003', 'CL007', 5),
('SA003', 'CL009', 10),
('SA003', 'CL010', 5),
('SA004', 'CL008', 2),
('SA004', 'CL011', 10),
('SA004', 'CL013', 5),
('SA005', 'CL014', 1),
('SA005', 'CL012', 7),
('SA005', 'CL015', 8),
('SA005', 'CL007', 3),
('SA006', 'CL006', 4),
('SA006', 'CL008', 2),
('SA006', 'CL009', 3),
('SA006', 'CL011', 8),
('SA007', 'CL001', 7),
('SA007', 'CL014', 2),
('SA007', 'CL015', 7),
('SA007', 'CL007', 9),
('SA007', 'CL012', 5),
('SA008', 'CL015', 2),
('SA008', 'CL007', 1),
('SA008', 'CL012', 4),
('SA009', 'CL010', 4),
('SA009', 'CL008', 2),
('SA009', 'CL013', 5),
('SA010', 'CL011', 10),
('SA010', 'CL005', 15),
('SA010', 'CL009', 7),
('SA011', 'CL001', 9),
('SA011', 'CL002', 20),
('SA012', 'CL004', 9),
('SA012', 'CL005', 10),
('SA013', 'CL009', 10),
('SA013', 'CL008', 2),
('SA014', 'CL008', 2),
('SA014', 'CL009', 5),
('SA015', 'CL004', 6),
('SA015', 'CL005', 8);
GO
