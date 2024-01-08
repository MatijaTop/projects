

USE Ebay;
GO

--informacije o modelima i njihovim odgovarajucim markama.
SELECT *
FROM Model
INNER JOIN Marka ON Model.MarkaID = Marka.MarkaID;
GO

--informacije o proizvodima i njihovim odgovarajucim stanjima, ako nema poklapanja bice NULL
SELECT *
FROM Proizvod
LEFT OUTER JOIN Stanje ON Proizvod.StanjeID = Stanje.StanjeID AND StanjeNaziv = 'New';
GO

--informacije o proizvodima koji imaju cijenu vecu od 10 a manju od 5000 po oadajucem redoslijedu
SELECT *
FROM Proizvod
WHERE Cena > 10 AND Cena < 5000
ORDER BY Cena DESC;
GO

--informacije o svim proizvodima po rastucem redoslijedu cijene
SELECT *
FROM Proizvod
ORDER BY Cena ASC;
GO

--informacije o prodavcima i njihovim odgovarajucim drzavama.
SELECT *
FROM Prodavac
INNER JOIN Drzava ON Prodavac.DrzavaID = Drzava.DrzavaID;
GO
-- informacije o proizvodima i njihovim odgovarajucim garancijama.
SELECT *
FROM Proizvod
INNER JOIN Garancija ON Proizvod.GarancijaID = Garancija.GarancijaID;
GO

--informacije o markama i njihovim odgovarajucim modelima.
SELECT *
FROM Marka
INNER JOIN Model ON Marka.MarkaID = Model.MarkaID;
GO

--sve informacije iz tabele Prodavac, a ako postoje odgovarajuci proizvodi u tabeli Proizvod, informacije o tim proizvodima ce biti dodate u rezultat ako ne bice NULL
SELECT *
FROM Prodavac
LEFT OUTER JOIN Proizvod ON Prodavac.ProdavacID = Proizvod.ProdavacID;
GO

-- informacije o drzavi iz tabele Drzava i odgovarajuce informacije o prodavcu iz tabele Prodavac, ako nema podudaranja onda NULL
SELECT *
FROM Drzava
LEFT OUTER JOIN Prodavac ON Drzava.DrzavaID = Prodavac.DrzavaID
--WHERE Drzava.DrzavaID = 1;
GO

-- informacije iz obje tabele gdje ce se redovi podudarati prema ModelID, ako nema podudaranja bice NULL
SELECT *
FROM Model
FULL OUTER JOIN Proizvod ON Model.ModelID = Proizvod.ModelID;
GO
 
 --informacije iz obje tabele gdje ce se redovi podudarati prema GarancijaID, ako nema podudaranja bice NULL
SELECT *
FROM Proizvod
LEFT OUTER JOIN Garancija ON Proizvod.GarancijaID = Garancija.GarancijaID;
GO

-- informacije iz obje abele Materijal i Proizvod gdje ce se redovi podudarati prema MaterijalID, ako nema podudaranja bice NULL
SELECT *
FROM Materijal
RIGHT OUTER JOIN Proizvod ON Materijal.MaterijalID = Proizvod.MaterijalID;
GO

--Prikazivanje informacija o proizvodima sa podacima o modelima i markama
SELECT 
    Proizvod.Cena,
    Proizvod.GodinaProizvodnje,
    Proizvod.Opis,
    Model.ModelNaziv,
    Marka.MarkaNaziv
FROM Proizvod
INNER JOIN Model ON Proizvod.ModelID = Model.ModelID
INNER JOIN Marka ON Model.MarkaID = Marka.MarkaID;
GO

--Prikazivanje proizvoda sa nformacijama o prodavcu i državi prodavca
SELECT 
    Proizvod.Cena,
    Proizvod.GodinaProizvodnje,
    Proizvod.Opis,
    Prodavac.ProdavacNaziv,
    Prodavac.ProdavacEmail,
    Drzava.DrzavaNaziv
FROM Proizvod
INNER JOIN Prodavac ON Proizvod.ProdavacID = Prodavac.ProdavacID
INNER JOIN Drzava ON Prodavac.DrzavaID = Drzava.DrzavaID;
GO

--prikazuje sve proizvode, a ako je garancija dostupna, prikazuje i informacije o garanciji
SELECT 
    Proizvod.Cena,
    Proizvod.GodinaProizvodnje,
    Proizvod.Opis,
    Garancija.GarancijaUMjesecima
FROM Proizvod
LEFT OUTER JOIN Garancija ON Proizvod.GarancijaID = Garancija.GarancijaID;
GO

--prikazuje sve proizvode a ako je materijal dostupan prikazuje i informacije o materijalu
SELECT 
    Proizvod.Cena,
    Proizvod.GodinaProizvodnje,
    Proizvod.Opis,
    Materijal.MaterijalNaziv
FROM Proizvod
LEFT OUTER JOIN Materijal ON Proizvod.MaterijalID = Materijal.MaterijalID;
GO



-- skalarni podupit koji vraca broj prodavaca u svakoj drzavi
SELECT DrzavaID,
       (SELECT COUNT(*) FROM Prodavac WHERE Prodavac.DrzavaID = Drzava.DrzavaID) AS BrojProdavaca
FROM Drzava
GO

--vise-vrijednosni podupit koji vraca sve proizvode sa stanjem New
SELECT *
FROM Proizvod
WHERE StanjeID IN (SELECT StanjeID FROM Stanje WHERE StanjeNaziv = 'New');
GO

--upit vraca sve redove iz tabele Prodavac gdje je TipProdavcaID jedan i gdje postoji barem jedan red u tabeli Proizvod za tog prodavca,
--a cijena tog proizvoda je veca od 100
SELECT *
FROM Prodavac
WHERE TipProdavcaID = 1 AND EXISTS (
    SELECT 1
    FROM Proizvod
    WHERE Proizvod.ProdavacID = Prodavac.ProdavacID
          AND Cena > 100
);
GO

--podupit koji prikazuje sve drzave koje imaju prodavce sa tipom Company
SELECT *
FROM Drzava
WHERE EXISTS (
    SELECT *
    FROM Prodavac
    WHERE Prodavac.DrzavaID = Drzava.DrzavaID
          AND TipProdavcaID = 2
);
GO

--upit koji prikazujje sve proizvode koji imaju garanciju
SELECT *
FROM Proizvod
WHERE EXISTS (
    SELECT 1
    FROM Garancija
    WHERE Proizvod.GarancijaID = Garancija.GarancijaID
);
GO

--upit ce prikazati broj proizvoda i njihovu prosjecnu cijenu i grupisati ih po ProdavacID
SELECT ProdavacID, COUNT(*) AS BrojProizvoda, AVG(Cena) AS ProsjecnaCijena
FROM Proizvod
GROUP BY ProdavacID;


--upit ce prikazati informacije o broju proizvoda svakog prodavca koji ima vise od 5 proizvoda i prosjecna cijena im je veca od 50
SELECT ProdavacID, COUNT(*) AS BrojProizvoda, AVG(Cena) AS ProsjecnaCijena
FROM Proizvod
GROUP BY ProdavacID
HAVING COUNT(*) > 5 AND AVG(Cena) > 50;

--upit ce prikazati sve proizvode pocevsi od 11. do 20.
SELECT ProizvodID, Opis, Cena, ModelID
FROM Proizvod
ORDER BY ProizvodID
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;
GO