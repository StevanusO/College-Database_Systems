CREATE DATABASE BluejackPainting
GO
USE BluejackPainting
GO
CREATE TABLE Customer(
	CustomerID CHAR(5) PRIMARY KEY,
	CustomerName VARCHAR(30),
	CustomerEmail VARCHAR(30),
	CustomerAddress VARCHAR(30),
	CustomerDOB DATE,
	CustomerPhoneNumber CHAR(10)
)
GO
CREATE TABLE Staff(
	StaffID CHAR(5) PRIMARY KEY,
	StaffName VARCHAR(30),
	StaffEmail VARCHAR(30),
	StaffAddress VARCHAR(30),
	StaffDOB DATE,
	StaffPhoneNumber CHAR(10)
)
GO
CREATE TABLE PaintingType(
	PaintingTypeID CHAR(5) PRIMARY KEY,
	PaintingTypeName VARCHAR(30)
)
GO
CREATE TABLE Painting(
	PaintingID CHAR(5) PRIMARY KEY,
	PaintingName VARCHAR(30),
	PaintingTime VARCHAR(30),
	PaintingPrice INT,
	PaintingTypeID CHAR(5) FOREIGN KEY REFERENCES PaintingType(PaintingTypeID) ON UPDATE CASCADE ON DELETE CASCADE
)
GO
CREATE TABLE HeaderTransaction(
	TransactionID CHAR(5) PRIMARY KEY,
	CustomerID CHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE,
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
	TransactionDate DATE,
)
GO
CREATE TABLE DetailTransaction(
	TransactionID CHAR(5) FOREIGN KEY REFERENCES HeaderTransaction(TransactionID) ON UPDATE CASCADE ON DELETE CASCADE,
	PaintingID CHAR(5) FOREIGN KEY REFERENCES Painting(PaintingID) ON UPDATE CASCADE ON DELETE CASCADE,
	Quantity INT
	PRIMARY KEY (TransactionID, PaintingID)
)
GO
insert into Customer values ('CU001', 'Melissa', 'mtorfin0@liveinternet.ru', '8 Sunbrook Terrace', '2010-04-18 17:12:10', '9792164596');
insert into Customer values ('CU002', 'Naomi Iskandar', 'hwinsborrow1@ox.ac.uk', '3 Westport Terrace', '2003-02-18 07:08:31', '2896900758');
insert into Customer values ('CU003', 'Joana', 'jnehlsen2@instagram.com', '0355 Pepper Wood Parkway', '2016-11-21 08:01:36', '6274531061');
insert into Customer values ('CU004', 'Shirley', 'amurname3@infoseek.co.jp', '2 Sundown Trail', '2014-07-31 06:40:07', '2658054652');
insert into Customer values ('CU005', 'Sunni La Rosa', 'bdenholm4@mapquest.com', '2973 Spenser Pass', '2003-05-05 02:45:54', '6072345623');
insert into Customer values ('CU006', 'Dorian', 'dbridgens5@yahoo.co.jp', '51 Fairfield Street', '2014-08-15 11:38:22', '1732750782');
insert into Customer values ('CU007', 'Violette', 'jfirk6@ibm.com', '34 Washington Crossing', '2003-12-08 11:10:25', '7311106328');
insert into Customer values ('CU008', 'Andy Kurnia', 'tholby7@vk.com', '2710 Dexter Avenue', '2008-06-30 19:38:40', '8888780975');
insert into Customer values ('CU009', 'Son Go Ku', 'wkerfut8@tinypic.com', '0944 Aberg Way', '2008-01-08 20:03:02', '4527349862');
insert into Customer values ('CU010', 'Melisandra', 'mmclagain9@economist.com', '7438 Fuller Drive', '2015-01-21 08:12:57', '3639194117');
insert into Customer values ('CU011', 'Sidney Princess', 'svalianta@ihg.com', '8 Nancy Parkway', '2017-05-17 14:31:48', '5708175171');
insert into Customer values ('CU012', 'Carmina Caspian', 'crobbinsb@issuu.com', '0 Tomscot Trail', '2003-01-09 04:27:53', '5376252735');
insert into Customer values ('CU013', 'Prudy', 'ptookc@so-net.ne.jp', '73300 Miller Street', '2010-06-01 21:51:37', '6483819293');
insert into Customer values ('CU014', 'Lonnie Lona', 'lgreaderd@si.edu', '5888 Muir Court', '2003-04-18 10:40:08', '2531125921');
insert into Customer values ('CU015', 'Cindra', 'cbrehenye@delicious.com', '2 8th Hill', '2004-04-17 13:56:23', '4887805858');
insert into Customer values ('CU016', 'Padgett', 'pmctrustyf@altervista.org', '10107 Hudson Trail', '2000-11-23 14:03:08', '2483046481');
insert into Customer values ('CU017', 'Carole Charlotte', 'ckarchowskig@rambler.ru', '90987 East Avenue', '2009-06-22 12:00:18', '7142352098');
insert into Customer values ('CU018', 'Elizabeth', 'ekitteringhamh@opera.com', '15 Arrowood Plaza', '2019-10-25 04:57:39', '1303020466');
insert into Customer values ('CU019', 'Hinze Adam', 'hcarolani@blogtalkradio.com', '493 Old Shore Avenue', '2019-11-01 10:12:01', '6926465233');
insert into Customer values ('CU020', 'Dittha', 'drenadj@ehow.com', '71767 Shopko Crossing', '2002-12-22 07:25:49', '7256308848');
insert into Customer values ('CU021', 'Jeremy Tetty', 'joxnamk@prnewswire.com', '3034 Armistice Plaza', '2012-06-27 06:17:37', '5574302562');
insert into Customer values ('CU022', 'Talitha', 'toliveyl@cafepress.com', '7 Derek Court', '2007-06-28 11:55:39', '8543009159');
insert into Customer values ('CU023', 'Tim Duncan', 'dwaszczykowskim@google.es', '55442 Heath Road', '2014-03-10 05:37:14', '1992199249');
insert into Customer values ('CU024', 'Stefanie', 'slambethn@123-reg.co.uk', '604 Saint Paul Court', '2015-05-18 11:25:07', '8845974490');
insert into Customer values ('CU025', 'Jimmy', 'eguiduzzio@4shared.com', '5 Twin Pines Street', '2006-03-04 16:39:07', '7476768671');
GO
insert into Staff VALUES ('ST001', 'Joan Saphire', 'jjaime0@wufoo.com', '488 Armistice Crossing', '2017-06-08 17:24:11', 'SR002');
insert into Staff VALUES ('ST002', 'Codi Tanaka', 'cmacdowall1@princeton.edu', '0850 Eagle Crest Park', '2004-09-10 17:47:26', 'SR001');
insert into Staff VALUES ('ST003', 'Reagen', 'hbrennon2@e-recht24.de', '06330 Manley Way', '2012-04-13 03:38:29', 'SR002');
insert into Staff VALUES ('ST004', 'Jeffry Nicole', 'jkarys3@symantec.com', '90305 Katie Terrace', '2019-06-14 05:51:40', 'SR005');
insert into Staff VALUES ('ST005', 'Barbara', 'bfadian4@redcross.org', '32 Ohio Parkway', '2010-07-31 22:09:51', 'SR003');
insert into Staff VALUES ('ST006', 'Kirsten Steward', 'kolerenshaw5@newsvine.com', '24 Springs Way', '2019-10-01 14:28:06', 'SR002');
insert into Staff VALUES ('ST007', 'Lissy Chan Pokemon', 'lquinton6@miitbeian.gov.cn', '377 Mifflin Circle', '2017-07-26 00:47:39', 'SR004');
insert into Staff VALUES ('ST008', 'Flinn', 'fcracknall7@independent.co.uk', '5147 Lyons Crossing', '2012-12-11 13:44:58', 'SR004');
insert into Staff VALUES ('ST009', 'Lin Dan', 'lselland8@odnoklassniki.ru', '708 Tennessee Terrace', '2017-12-23 11:14:22', 'SR002');
insert into Staff VALUES ('ST010', 'Maverick', 'mlougheed9@netvibes.com', '9577 Forest Drive', '2012-03-25 04:12:56', 'SR002');
GO
insert into PaintingType values ('PT001', 'Modernism');
insert into PaintingType values ('PT002', 'Abstract');
insert into PaintingType values ('PT003', 'Cubism');
insert into PaintingType values ('PT004', 'Chinese Style');
insert into PaintingType values ('PT005', 'Japanese Style');
GO
insert into Painting values ('PA001', 'Mona Lisa', '3/5/1997', 50000000, 'PT001');
insert into Painting values ('PA002', 'The Starry Night', '2/10/1950', 6000000, 'PT003');
insert into Painting values ('PA003', 'The Blue Rider', '5/12/1970', 8000000, 'PT001');
insert into Painting values ('PA004', 'Madonna with the Fish', '12/11/1995', 70000000, 'PT002');
insert into Painting values ('PA005', 'The Music', '11/26/2010', 13000000, 'PT004');
insert into Painting values ('PA006', 'Les Demoiselles d''Avignon', '10/24/1980', 4000000, 'PT005');
insert into Painting values ('PA007', 'The Night Watch', '8/22/2011', 2000000, 'PT003');
insert into Painting values ('PA008', 'Chriss of Cuttle', '9/26/2013', 2500000, 'PT002');
insert into Painting values ('PA009', 'Shame on Me', '11/25/1988', 45000000, 'PT004');
insert into Painting values ('PA010', 'Dragons Night', '12/12/1970', 75000000, 'PT005');
GO
insert into HeaderTransaction values ('TR001', 'CU001', 'ST001', '8/12/2021');
insert into HeaderTransaction values ('TR002', 'CU002', 'ST001', '9/22/2021');
insert into HeaderTransaction values ('TR003', 'CU002', 'ST001', '7/13/2021');
insert into HeaderTransaction values ('TR004', 'CU003', 'ST003', '8/18/2021');
insert into HeaderTransaction values ('TR005', 'CU004', 'ST003', '8/17/2021');
insert into HeaderTransaction values ('TR006', 'CU005', 'ST006', '9/27/2021');
insert into HeaderTransaction values ('TR007', 'CU006', 'ST009', '9/30/2021');
insert into HeaderTransaction values ('TR008', 'CU007', 'ST010', '6/25/2021');
insert into HeaderTransaction values ('TR009', 'CU008', 'ST010', '6/23/2021');
insert into HeaderTransaction values ('TR010', 'CU002', 'ST009', '8/30/2021');
insert into HeaderTransaction values ('TR011', 'CU003', 'ST009', '6/21/2021');
insert into HeaderTransaction values ('TR012', 'CU004', 'ST009', '7/28/2021');
insert into HeaderTransaction values ('TR013', 'CU005', 'ST009', '5/25/2021');
insert into HeaderTransaction values ('TR014', 'CU006', 'ST003', '5/13/2021');
insert into HeaderTransaction values ('TR015', 'CU007', 'ST003', '6/22/2021');
insert into HeaderTransaction values ('TR016', 'CU008', 'ST003', '10/24/2021');
insert into HeaderTransaction values ('TR017', 'CU009', 'ST006', '6/14/2021');
insert into HeaderTransaction values ('TR018', 'CU010', 'ST006', '8/21/2021');
insert into HeaderTransaction values ('TR019', 'CU011', 'ST001', '7/12/2021');
insert into HeaderTransaction values ('TR020', 'CU025', 'ST001', '7/13/2021');
insert into HeaderTransaction values ('TR021', 'CU011', 'ST001', '8/17/2021');
insert into HeaderTransaction values ('TR022', 'CU012', 'ST001', '9/18/2021');
insert into HeaderTransaction values ('TR023', 'CU014', 'ST001', '9/25/2021');
insert into HeaderTransaction values ('TR024', 'CU013', 'ST009', '8/24/2021');
insert into HeaderTransaction values ('TR025', 'CU015', 'ST009', '9/17/2021');
insert into HeaderTransaction values ('TR026', 'CU016', 'ST009', '7/17/2021');
insert into HeaderTransaction values ('TR027', 'CU017', 'ST010', '7/15/2021');
insert into HeaderTransaction values ('TR028', 'CU018', 'ST010', '7/3/2021');
insert into HeaderTransaction values ('TR029', 'CU019', 'ST010', '8/28/2021');
insert into HeaderTransaction values ('TR030', 'CU020', 'ST010', '9/3/2021');
insert into HeaderTransaction values ('TR031', 'CU021', 'ST010', '8/28/2021');
insert into HeaderTransaction values ('TR032', 'CU022', 'ST010', '8/28/2021');
insert into HeaderTransaction values ('TR033', 'CU023', 'ST006', '7/28/2021');
insert into HeaderTransaction values ('TR034', 'CU024', 'ST003', '8/2/2021');
insert into HeaderTransaction values ('TR035', 'CU025', 'ST003', '8/3/2021');
GO
insert into DetailTransaction values ('TR001', 'PA001', 2);
insert into DetailTransaction values ('TR001', 'PA002', 1);
insert into DetailTransaction values ('TR002', 'PA002', 3);
insert into DetailTransaction values ('TR002', 'PA003', 5);
insert into DetailTransaction values ('TR002', 'PA004', 2);
insert into DetailTransaction values ('TR003', 'PA001', 4);
insert into DetailTransaction values ('TR004', 'PA002', 5);
insert into DetailTransaction values ('TR005', 'PA003', 7);
insert into DetailTransaction values ('TR005', 'PA004', 5);
insert into DetailTransaction values ('TR006', 'PA004', 3);
insert into DetailTransaction values ('TR007', 'PA006', 5);
insert into DetailTransaction values ('TR007', 'PA007', 6);
insert into DetailTransaction values ('TR007', 'PA008', 3);
insert into DetailTransaction values ('TR008', 'PA008', 2);
insert into DetailTransaction values ('TR009', 'PA009', 1);
insert into DetailTransaction values ('TR010', 'PA010', 1);
insert into DetailTransaction values ('TR011', 'PA010', 1);
insert into DetailTransaction values ('TR011', 'PA009', 2);
insert into DetailTransaction values ('TR012', 'PA009', 2);
insert into DetailTransaction values ('TR013', 'PA010', 2);
insert into DetailTransaction values ('TR013', 'PA006', 3);
insert into DetailTransaction values ('TR014', 'PA001', 2);
insert into DetailTransaction values ('TR015', 'PA002', 5);
insert into DetailTransaction values ('TR015', 'PA003', 2);
insert into DetailTransaction values ('TR016', 'PA006', 6);
insert into DetailTransaction values ('TR017', 'PA006', 4);
insert into DetailTransaction values ('TR018', 'PA006', 3);
insert into DetailTransaction values ('TR019', 'PA007', 4);
insert into DetailTransaction values ('TR019', 'PA008', 3);
insert into DetailTransaction values ('TR019', 'PA009', 4);
insert into DetailTransaction values ('TR020', 'PA001', 1);
insert into DetailTransaction values ('TR021', 'PA002', 1);
insert into DetailTransaction values ('TR021', 'PA003', 1);
insert into DetailTransaction values ('TR022', 'PA004', 1);
insert into DetailTransaction values ('TR023', 'PA004', 10);
insert into DetailTransaction values ('TR023', 'PA005', 11);
insert into DetailTransaction values ('TR024', 'PA006', 12);
insert into DetailTransaction values ('TR025', 'PA006', 8);
insert into DetailTransaction values ('TR025', 'PA007', 2);
insert into DetailTransaction values ('TR025', 'PA008', 3);
insert into DetailTransaction values ('TR026', 'PA008', 3);
insert into DetailTransaction values ('TR027', 'PA009', 3);
insert into DetailTransaction values ('TR028', 'PA001', 6);
insert into DetailTransaction values ('TR028', 'PA010', 6);
insert into DetailTransaction values ('TR029', 'PA010', 5);
insert into DetailTransaction values ('TR030', 'PA010', 8);
insert into DetailTransaction values ('TR031', 'PA001', 8);
insert into DetailTransaction values ('TR032', 'PA001', 8);
insert into DetailTransaction values ('TR032', 'PA002', 3);
insert into DetailTransaction values ('TR033', 'PA003', 5);
insert into DetailTransaction values ('TR034', 'PA004', 4);
insert into DetailTransaction values ('TR035', 'PA005', 4);