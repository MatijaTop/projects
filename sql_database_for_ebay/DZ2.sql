

USE Ebay;
GO

INSERT  dbo.Drzava(DrzavaNaziv,Grad,Kontinent)
VALUES	
	('Georgia', 'Marietta', 'United States'),
	('QLD', 'Palm Beach', 'Australia'),
	('Nevada', 'Las Vegas', 'United States'),
	('South Carolina', 'Florence', 'United States'),
	('Texas','San Antonio', 'United States'),
	('Illinois', 'Rantoul', 'United States'),
	('Nevada', 'Carson City', 'United States'),
	('United Kingdom', 'Richmond','Europe'),
	('Germany', 'Berlin','Europe'),
	('Japan', 'Aichi','Asia'),
	('California','Sherman Oaks', 'United States'),
	('Texas', 'Houston', 'United States'),
	('New Jersey', 'Newark', 'United States'),
	('New York', 'New York', 'United States');

GO

INSERT dbo.Pogon (PogonNaziv)
VALUES	
	('Struja'),
	('Nafta'),
	('Solarna energija'),
	('Gas'),
	('Baterija');
GO

INSERT dbo.Marka(MarkaNaziv)
VALUES
	('Lacoste'),--gotovo
	('Tesla'),--gotovo
	('Rolex'),--Gotovo
	('Apple'),--gotovo
	('Samsung'),--gotovo
	('Lenovo'),--gotovo
	('Hot weels'),--gotovo
	('Garming'),--gotovo
	('Nike'),--gotovo
	('DELL');
	
GO

INSERT dbo.Model(ModelNaziv,MarkaID)
VALUES
	('AIR MAX ALPHA TRAINER',9),--nike
	('Zoom Gravity',9),--nike
	('ECHOMAP 93sv UHD 9" Marine',8),--garming
	('GSD 24 Black Box Sonar Module',8),--garming
	('1991 BMW M5 * 2023',7),--hotweels
	('ThinkPad X1 Yoga',6),--lenovo
	('Yoga 11"',6),--lenovo
	('Galaxy S7',5),--ima garanciju 12
	('iPhone 8 Plus',4),--ima garanciju 12
	('Galaxy S10e',5),--samsung
	('Precision 2611',3),--rolex
	('Datejust II',3),--rolex
	('Model Y',2),--tesla
	('Model 3',2),--tesla
	('Polo',1),--lacoste 
	('75 Chevy Blazer JAWS * 2023',7),
	('Oyster Perpetual',3),
	('Yacht-Master',3), 
	('sky-dweller',3),
	('Land Rover Defender 110',7),--20
	('BMW M3 E46',7), --21
	('1970 Chevrolet Nova SS',7),
	('Lamborghini Gallardo LP 570-4',7),--23
	('01 BMW M5',7),--24
	('iPhone SE',4),
	('Galaxy A32 ',5),--26
	('Galaxy A51',5),
	('Galaxy s7 edge',5),--28
	('Dell E2218HN',10),--29
	('Dell P2014Ht',10),
	('Dell E2010Ht',10),--31
	('Latitude 5500',10),--32
	('LACOSTE DH3201 51 166',1),
	('TH0855 51 AUQ',1),
	('PH5284 51 240',1),
	('Lebron Witness 7',9),--36
	('Pegasus Turbo Next Nature',9),
	('Giannis Immortality 2',9),--38
	('Air Max Backpack',9),
	('LBR',9);


GO

INSERT dbo.Materijal (MaterijalNaziv)
VALUES 
	('Cotton'),
	('Plastic'),
	('Polyester'),
	('Metal'),
	('Sheet'),
	('Leather'),
	('Rubber'),
	('Wool'),
	('Gold'),
	('Silver'),
	('stainless steel'),
	('Carbon Fiber'),
	('Synthetic');
GO


INSERT dbo.Stanje(StanjeNaziv)
VALUES 
	('New'),
	('Used');
GO

INSERT dbo.Garancija(GarancijaUMjesecima)
VALUES 
	(6),
	(12),
	(24),
	(48);
GO
INSERT dbo.TipProdavca(TipProdavcaNaziv)
VALUES
	('Private'),
	('Company');
GO
INSERT dbo.Prodavac(ProdavacNaziv,ProdavacEmail,ProdavacSifra,DrzavaID,TipProdavcaID)
VALUES 
	('intermilan06211987','intermilan06211987@gmail.com','intermilan123',1,1),--Nike air max R
	('Everyday Pickings','everydaypickings@gmail.com','EverydayPickings.123',2,2),--Nike Zoom Gravity R
	('GPS City','gpscity@gmail.com','gpsgpsgps',3,2),--gps,sonar R
	('wheelcollectors','wheelcollectors@gmail.com','wheelcollectors123',4,1),--hotweels R
	('secgsales','secgsales@gmail.com','secgsales1234',6,2),--lenovo think pad R
	('Summer Home Electronics','summerelectronics@gmail.com','electronics123',7,2),--yoga 11" R
	('Easy Connect Store','easyconnect@gmail.com','connectwithus',8,2),--iphone,galaxy s7 R
	('Hello Handy','hellogandy@gmail.com','hellohandy123',9,1),--galaxy s10 R
	('closer0924','closer@gmail.com','closerwatches223',10,1),--rolex R
	('autodesert01','autodesert@gmail.com','autodeserts123',11,1),--tesla R
	('amazingmotorcars','amazingmotorcars@gmail.com','amazingmotorcars123',12,2),--tesla R
	('CLOSOUTDEALS','closoutdeals@gmail.com','closoutdeals1234',13,2),--lacoste  R
	('timeluxury','timeluxury@gmail.com','timeluxury12345',14,2);--Rolex   13 R
GO

INSERT dbo.KategorijaProizvoda(KategorijaNaziv)
VALUES 
	('Collectibles&Arts'),
	('Electronics'),
	('Fashion'),
	('Toys&Hobbyes'),
	('AutoParts & Accessories'),
	('Clothing,Shoes & Accessories');
GO

INSERT dbo.Proizvod(Cena,GodinaProizvodnje,Opis,Velicina,Boja,ModelID,PogonID,MaterijalID,StanjeID,GarancijaID,ProdavacID)
VALUES
	(44.95,2019,'Nike Zoom Gravity Men’s Running Shoes Sneakers Men’s Size US 10 Triple White','us 10','white',2,NULL,13,2,NULL,2), -- 1 ODJECA
	(42.971, 2021 ,'Used vehicles have had at least one previous owner. The condition of the exterior, interior and engine can vary depending on the vehicles history. See the sellers listing for full details and description of any imperfections.',NULL,'white',13,1,NULL,2,NULL,10),--2 AUTO
	(23.995,2019,'A vehicle is considered used if it has been registered and issued a title. Used vehicles have had at least one previous owner. The condition of the exterior, interior and engine can vary depending on the vehicles history. ',NULL,'Red',14,1,NULL,2,NULL,11),--3--AUTO
	(67.88,2023,'A brand-new, unused, and unworn item (including handmade items) in the original packaging (such as the original box or bag) and/or with the original tags attached. ','us 7','black',1,NULL,13,1,NULL,1),--4 ODJECA
	(649.99,NULL,'The sunlight-readable 9” touchscreen chartplotter features a quick-release bail mount, and the transducer bundle adds Ultra High-Definition scanning sonar and CHIRP traditional sonar.','9"','black',3,1,2,2,NULL,3),--5 ELEKTRO
	(519.99,NULL,'Manufacturer refurbished, inventory is direct from Garmin. Garmin replaces all accessories with new accessories and ensures the item is functional. The item should appear as "like-new" condition','10.5"','grey',4,1,2,2,NULL,3),--6 ELEKTRO
	(280.51,NULL,'Apple iPhone 8 Plus 64GB - (Unlocked) Smartphone. This phone has been tested and passed to fully work with 12 MONTHS WARRANTY INCLUDED','5.5"','red',9,5,2,1,2,7),--7 ELEKRO
	(73.17,NULL,'Grade C - Fully functional with 80%+ battery health, moderate to heavy signs of use it might come with some screen burn small scratches and black dots. - 12 months warranty','5.1"','black',8,5,2,1,2,7),--8 ELEKTRO
	(196.34,NULL,'Refurbished. Top Zustand., Handy funktioniert einwandfrei und voll funktionsfähig','5.8"','black',10,5,2,2,2,8),--9 ELEKTRO
	(35.00,NULL,' A brand-new, unused, and unworn item (including handmade items) in the original packaging (such as the original box or bag) and/or with the original tags attached.','s','BLUE/GREEN',15,NULL,3,1,NULL,12),--10 ODJECA
	(38.00,NULL,'A brand-new, unused, and unworn item (including handmade items) in the original packaging (such as the original box or bag) and/or with the original tags attached','M','white',15,NULL,3,1,NULL,12),--11 ODJECA
	(1.512,NULL,'Condition Rank : Case B / Bracelet B*See description for definition of condition rank','15.5cm','Silver',11,5,11,2,NULL,9),--12 FASHION
	(10.350,NULL,'Good pre-owned condition. The watch may have tiny scratches, that will be removed before shipping','7"','gold',12,5,9,2,NULL,13),--13 FASHION
	(147.50,NULL,'DISPLAY HAS A FEW, BARLEY VISABLE KEYBOARD MARKS WHEN TURNED OFF (BRIGHT AND CLEAR WITHIN WINDOWS) and signs of previous use including wear on both front corners','14"','black',6,5,2,2,NULL,5),--14 ELEKTRO
	(72.99,NULL,'Fully tested working. Windows 10 Home installed and activated. Complete and ready to use.','11.6"','black',7,5,2,2,NULL,6),--15 ELEKTRO
	(10.99,NULL,'A brand-new, unused, unopened, undamaged item (including handmade items). See the sellers listing for full details.',NULL,'black',5,NULL,2,1,NULL,4),--16 TOYS
	(10.91,NULL,'A brand-new, unused, unopened, undamaged item (including handmade items). See the sellers listing for full details',NULL,'grey',16,NULL,2,1,NULL,4),--17 TOYS
	(9.750,2010,'Unworn. 2023 card. The yellow dial is aftermarket. The original dial will be included in the package. The color of the original dial will be black or blue. Comes with an original box and papers.','15,5mm','yellow',17,5,11,1,2,13),--18 FASHION 12,13,18,19,20,21
	(5.250,2000,'Good condition. The watch may have micro scratches due to shipping. The Rolex pouch and cloth in pictures are used for illustrative purposes','29mm','silver',18,5,11,2,2,13),--19 FASHION
	(16.599,2013,'Good pre-owned condition. 2013 card. The watch may have micro scratches due to the shipping process.','44mm','grey',18,5,11,2,2,13),--20 FASHIN
	(17.999,2020,'Good condition. 2020 card. The watch may have micro marks due to shipping','42mm','grey-yellow',19,5,11,2,2,13),--21 FASHION
	(5.99,2023,'A brand-new, unused, unopened, undamaged item (including handmade items). See the sellers listing for full details.',NULL,'Green',20,NULL,2,1,NULL,4),--22 TOYS
	(6.99,2023,'A brand-new, unused, unopened, undamaged item (including handmade items). See the sellers listing for full details',NULL,'White',21,NULL,2,1,NULL,4),--23 TOYS
	(4.59,2023,'A brand-new, unused, unopened, undamaged item (including handmade items). See the sellers listing for full details',NULL,'Grey',22,NULL,2,1,NULL,4),--24 TOYS
	(8.99,2023,'A brand-new, unused, unopened, undamaged item (including handmade items). See the sellers listing for full details',NULL,'Gold',23,NULL,2,1,NULL,4),--25 TOYS
	(8.57,2023,'A brand-new, unused, unopened, undamaged item (including handmade items). See the sellers listing for full details',NULL,'Red',24,NULL,2,1,NULL,4),--26 TOYS
	(266.19,2020,'Refurbished – Top Zustand, keine Kratzer oder sonstige Beschädigungen','4.7"','Black',25,5,NULL,2,2,8),--27 ELEKTRO
	(196.71,NULL,'Refurbished – Top Zustand, keine Kratzer oder sonstige Beschädigungen','6,4"','Black',26,5,NULL,2,2,8),--28 ELEKTRO
	(186.01,NULL,'Refurbished – Top Zustand, keine Kratzer oder sonstige Beschädigungen','6,5"','Black',26,5,NULL,2,2,8),--29 ELEKTRO
	(266.19,2020,'Refurbished – Top Zustand, keine Kratzer oder sonstige Beschädigungen','4.7"','Red',25,5,NULL,2,2,8),--30 ELEKTRO
	(55.13,NULL,'The item itself, has been graded D ( LCD is poor condition with screen burn/screen line/spot) under our guidelines below, as it does show signs of wear with scuff or scratch marks around the housing of the device but phone is working perfectly.','5.5"','Gold',28,5,NULL,2,2,7),--31 ELEKTRO
	(98.02,NULL,'Samsung Galaxy S7 Edge G935F 32GB (Unlocked) Smartphone Black Gold Silver - Average Condition. HANDSET 1 CHARGING CABLE COMES WITH EACH ORDER','5.5"','Gold',28,5,NULL,2,2,7),--32ELEKTRO
	(49.01,NULL,'This phone is only for Part- LCD doesnt work but the entire phone is fully working.','5.5"','Pink',28,5,NULL,2,2,7),--33 LEKTRO
	(147.04,NULL,'Grade A An excellent conditioned product that has very minor isolated wear and tear to the front, back or sides.','5.5"','Gold',28,5,NULL,2,2,7),--34 ELEKTRO
	(245.08,NULL,'Fully tested and restored to factory settings by our in house technicians.','5.5"',NULL,9,5,NULL,2,2,7),--35 ELEKTRO
	(281.84,NULL,'Apple iPhone 8 Plus 64GB - (Unlocked) Smartphone. This phone has been tested and passed to fully work with 12 MONTHS WARRANTY INCLUDED.','5.5"',NULL,9,5,NULL,2,2,7),--36 ELEKTRO
	(64.99,NULL,'A pair of identical Monitor. No stands. Tested working.','22"',NULL,29,1,2,2,NULL,6),--37 ELEKTRO
	(58.99,NULL,'A pair of identical Monitors. No stand. Tested working. No scratch on screen. Both with VGA and power cord.','20"',NULL,30,1,2,2,NULL,6),--38 ELEKTRO
	(14.99,NULL,'No stand. Tested working. No scratch on screen. with VGA and power cord','20"',NULL,31,1,2,2,NULL,6),--39 ELEKTRO
	(255.00,NULL,'Grade "A" No Display Issues - Boots to Windows 10 Pro – Passes All Lenovo Diagnostics –Very Nice Condition – Very Fast Laptop – Minor Signs of Wear on LCD Cover, base and case plastics.','14"','black',6,5,2,2,NULL,5),--40 ne koristiti nista od ovog prodavca u upitima prodavac br. 5!!!!!!! ELEKTRO
	(133.50,NULL,'Grade "A" No Display Issues -New Lenovo A/C Adapter - Boots to Windows 10 Pro – Passes All Lenovo Diagnostics –Very Nice Condition','14"','black',6,5,2,2,NULL,5),--41 ne koristiti nista od ovog prodavca u upitima prodavac br. 5!!!!!!! ELEKTRO
	(7.50,NULL,'Nice Condition LAPTOP- Battery Reads as Fair in BIOS - No Screen Issues - Dell Latitude 5500 ','15.6"','black',6,5,2,2,NULL,5),--42 ---ne koristiti nista od ovog prodavca u upitima prodavac br. 5!!!!!!! ELEKTRO
	(39.00,NULL,'A brand-new, unused, and unworn item (including handmade items) in the original packaging','S','blue',33,NULL,3,1,NULL,12),--43 ODJECA
	(39.00,NULL,'A brand-new, unused, and unworn item (including handmade items) in the original packaging (such as the original box or bag)','xl','block-Red',34,NULL,3,1,NULL,12),--44 ODJECA
	(38.00,NULL,'A brand-new, unused, and unworn item (including handmade items) in the original packaging','M','Red',35,NULL,1,1,NULL,12),--45 ODJECA
	(78.88,NULL,'New with box: A brand-new, unused, and unworn item (including handmade items) in the original packaging','M','Black',36,NULL,13,1,NULL,1),--46 ODJECA
	(59.88,NULL,'New with box: A brand-new, unused, and unworn item (including handmade items) in the original packaging',NULL,'Black',37,NULL,7,1,NULL,1),--47 ODJECA
	(64.88,NULL,'New with box: A brand-new, unused, and unworn item (including handmade items) in the original packaging','uk9.5','Neon pink',38,NULL,7,1,NULL,1),--48 ODJECA
	(79.88,NULL,'New with box: A brand-new, unused, and unworn item (including handmade items) in the original packaging','19"','Black',39,NULL,3,1,NULL,1),--49 ODJECA
	(49.88,NULL,'New with box: A brand-new, unused, and unworn item (including handmade items) in the original packaging','19"','multicolor',40,NULL,3,1,NULL,1),--50 ODJECA
	(27.88,NULL,'New with box: A brand-new, unused, and unworn item (including handmade items) in the original packaging','19"','multicolor',40,NULL,3,1,NULL,1);--51 ODJECA

GO

INSERT dbo.KategorijaProizvodaProizvod(KategorijaProizvodaID,ProizvodID)
VALUES
	(2,5),
	(2,6),
	(2,7),
	(2,8),
	(2,9),
	(2,14),
	(2,15),
	(2,27),
	(2,28),
	(2,29),
	(2,30),
	(2,31),
	(2,32),
	(2,33),
	(2,34),
	(2,35),
	(2,36),
	(2,37),
	(2,38),
	(2,39),
	(2,40),
	(2,41),
	(2,42),
	(3,12),
	(3,13),
	(3,18),
	(3,19),
	(3,20),
	(3,21),
	(4,16),
	(4,17),
	(4,22),
	(4,23),
	(4,24),
	(4,25),
	(4,26),
	(6,1),
	(6,4),
	(6,10),
	(6,11),
	(6,43),
	(6,44),
	(6,45),
	(6,46),
	(6,47),
	(6,48),
	(6,49),
	(6,50),
	(6,51),
	(5,2),
	(5,3);
GO


--Updejtovanje cijene proizvoda sa ID 1
UPDATE dbo.Proizvod
SET Cena = 49.99
WHERE ProizvodID = 1;
GO
--Updejtovanje opisa za proizvod sa ID 1
UPDATE dbo.Proizvod
SET Opis = 'Brand new Nike Zoom Gravity sneakers for men.'
WHERE ProizvodID = 1;
GO


--brisanje proizvoda sa ID 2
DELETE FROM dbo.Proizvod
WHERE ProizvodID = 2;
GO

--brisanje svih proizvoda koji imaju ID manji ili jednak od 51 i restartovanje ID tabele na 0 
DELETE FROM dbo.Proizvod WHERE ProizvodID<=51
DBCC CHECKIDENT ('Proizvod', RESEED, 0);
GO


SELECT * FROM dbo.Model
