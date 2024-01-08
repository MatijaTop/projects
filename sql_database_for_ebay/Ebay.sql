/*
Matija Topalovic IT27/21
*/

USE master;
GO
DROP DATABASE Ebay;
GO
CREATE DATABASE Ebay;
GO
USE Ebay;
GO
CREATE TABLE KategorijaProizvoda
(
	KategorijaProizvodaID int NOT NULL IDENTITY(1,1),
	KategorijaNaziv nvarchar(40) NOT NULL,
	CONSTRAINT PK_KategorijaProizvoda PRIMARY KEY(KategorijaProizvodaID)
);

CREATE TABLE Marka 
(
	MarkaID int NOT NULL IDENTITY (1,1),
	MarkaNaziv nvarchar (30) NOT NULL,
	CONSTRAINT PK_Marka PRIMARY KEY (MarkaID)
);
CREATE TABLE Model
(
	ModelID int NOT NULL IDENTITY (1,1),
	ModelNaziv nvarchar (30) NOT NULL,
	MarkaID int NOT NULL,
	CONSTRAINT PK_Model PRIMARY KEY (ModelID),
	CONSTRAINT FK_Marka FOREIGN KEY (MarkaID) REFERENCES Marka(MarkaID)
);
CREATE TABLE Pogon
(
	PogonID int NOT NULL IDENTITY (1,1),
	PogonNaziv nvarchar(20) NOT NULL,
	CONSTRAINT PK_Pogon PRIMARY KEY (PogonID)
);
CREATE TABLE Drzava
(
	DrzavaID int NOT NULL IDENTITY (1,1),
	DrzavaNaziv nvarchar(30) NOT NULL,
	Grad nvarchar(30) NOT NULL,
	Kontinent nvarchar(20) NOT NULL,
	CONSTRAINT PK_Drzava PRIMARY KEY (DrzavaID)
);
CREATE TABLE Materijal
(
	MaterijalID int NOT NULL IDENTITY (1,1),
	MaterijalNaziv nvarchar(30) NOT NULL,
	CONSTRAINT PK_Materijal PRIMARY KEY (MaterijalID)
);
CREATE TABLE Stanje
(
	StanjeID int NOT NULL IDENTITY (1,1),
	StanjeNaziv nvarchar(20) NOT NULL,
	CONSTRAINT PK_MStanje PRIMARY KEY (StanjeID)
);
CREATE TABLE Garancija
(
	GarancijaID int NOT NULL IDENTITY (1,1),
	GarancijaUMjesecima int NOT NULL,
	CONSTRAINT PK_Garancija PRIMARY KEY (GarancijaID)
);

CREATE TABLE TipProdavca
(
	TipProdavcaID int NOT NULL IDENTITY (1,1),
	TipProdavcaNaziv nvarchar(30) NOT NULL,
	CONSTRAINT PK_TipProdavca PRIMARY KEY (TipProdavcaID)
);
CREATE TABLE Prodavac
(
	ProdavacID int NOT NULL IDENTITY (1,1),
	ProdavacNaziv nvarchar(30) NOT NULL,
	ProdavacEmail nvarchar(30) NOT NULL,
	ProdavacSifra nvarchar(30) NOT NULL,
	CONSTRAINT PK_Prodavac PRIMARY KEY (ProdavacID),
	DrzavaID int NOT NULL,
	CONSTRAINT FK_Drzava FOREIGN KEY (DrzavaID) REFERENCES Drzava(DrzavaID),
	TipProdavcaID int NOT NULL,
	CONSTRAINT FK_TipProdavca FOREIGN KEY (TipProdavcaID) REFERENCES TipProdavca(TipProdavcaID)
);

CREATE TABLE Proizvod
(
	ProizvodID int NOT NULL IDENTITY (1,1),
	Cena decimal NOT NULL,
	GodinaProizvodnje int NULL,
	Opis nvarchar (500) NOT NULL,
	Velicina nvarchar(10) NULL,
	Boja nvarchar (20) NULL,
	
	CONSTRAINT PK_Proizvod PRIMARY KEY (ProizvodID),
	
	ModelID int NOT NULL,
	CONSTRAINT FK_Model FOREIGN KEY (ModelID) REFERENCES Model(ModelID),
	PogonID int NULL,
	CONSTRAINT FK_Pogon FOREIGN KEY (PogonID) REFERENCES Pogon(PogonID),
	MaterijalID int NULL,
	CONSTRAINT FK_Materijal FOREIGN KEY (MaterijalID) REFERENCES Materijal(MaterijalID),
	StanjeID int NOT NULL,
	CONSTRAINT FK_Stanje FOREIGN KEY (StanjeID) REFERENCES Stanje(StanjeID),
	GarancijaID int NULL,
	CONSTRAINT FK_Garancija FOREIGN KEY (GarancijaID) REFERENCES Garancija(GarancijaID),
	ProdavacID int NOT NULL,
	CONSTRAINT FK_Prodavac FOREIGN KEY (ProdavacID) REFERENCES Prodavac(ProdavacID)
);
CREATE TABLE KategorijaProizvodaProizvod
(
	KategorijaProizvodaID int NOT NULL,
	ProizvodID int NOT NULL,
	CONSTRAINT PK_KategorijaProizvodaProizvod PRIMARY KEY(KategorijaProizvodaID,ProizvodID),
	CONSTRAINT FK_KategorijaProizvoda FOREIGN KEY(KategorijaProizvodaID) REFERENCES KategorijaProizvoda (KategorijaProizvodaID),
	CONSTRAINT FK_Proizvod FOREIGN KEY(ProizvodID) REFERENCES Proizvod (ProizvodID)
);
