Create database protseduurLõhelaid;

use protseduurLõhelaid;
CREATE TABLE Klient(
    Id int PRIMARY KEY IDENTITY(1,1),
    Nimi varchar(30) NOT NULL,
    Linn varchar(20),
    Vanus int DEFAULT 1,
    Saldo money
);

INSERT INTO Klient(Nimi, Linn, Vanus, Saldo)
VALUES ('Hendrik Kalju', 'Tallinn', 18, 500);

Select * from Klient;
--Protseduur
CREATE PROCEDURE lisaKlient
    @Nimi varchar(20),
    @Linn varchar(20),
    @Vanus int,
    @Saldo money
AS
BEGIN
    INSERT INTO Klient(Nimi, Linn, Vanus, Saldo)
    VALUES (@Nimi, @Linn, @Vanus, @Saldo);

    SELECT * FROM Klient;
END;

--kutse
EXEc lisaKlient 'Tanel Märu', 'Viimsi', 32, 62341

--Prodceduur, mis uuendab nimed sisestatud id järgi
Create procedure uuendaKlient
@id int, 
@uuendatudLinn varchar(20)
As 
Begin
	Select * from Klient;
	Update Klient set Linn=@uuendatudLinn
	Where Id=@id;
end

--kutse
exec uuendaKlient 3, 'Kuusalu'  

--Protseduur, mis kustutab kliendi id järgi

Create procedure kustutaIDKlient
@id int
AS
Begin
	SELECT * from Klient;
	Delete from Klient where Id=@id;
	Select * from Klient
End
-- kutse
EXEC kustutaIDKlient 4 


--Kliendi otsimine
Create Procedure otsingKlient
@taht char(1)
AS
Begin
	Select Nimi from Klient
	Where Nimi like @taht + '%';
ENd
--kutse
Select * from Klient
Exec otsingKlient 'h'




--Kliendi saldo min ja max
CREATE PROCEDURE minmaxKlient
    @minHind MONEY OUTPUT,
    @maxHind MONEY OUTPUT
AS
BEGIN
    SELECT 
        @minHind = MIN(Saldo),
        @maxHind = MAX(Saldo)
    FROM Klient;
END;
--kasutamine
DECLARE @minHind MONEY, @maxHind MONEY;

EXEC minmaxKlient @minHind OUTPUT, @maxHind OUTPUT;

PRINT 'Min hind = ' + CONVERT(varchar, @minHind);
PRINT 'Max hind = ' + CONVERT(varchar, @maxHind);
--Universaalne protseduur, mis töötab ükskõik millise tabeliga
--ta lisab uus veerg või kustutab seda
CREATE PROCEDURE KliendiVeeruHaldus
    @tegevus varchar(10),
    @tabelinimi varchar(25),
    @veerunimi varchar(25),
    @tyyp varchar(25) = NULL
AS
BEGIN
    DECLARE @sqltegevus varchar(max);

    SET @sqltegevus = CASE 
        WHEN @tegevus = 'add' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tyyp)

        WHEN @tegevus = 'drop' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
    END;

    PRINT @sqltegevus;
    EXEC (@sqltegevus);
END;

--kutse
-- veeru lisamine
EXEC KliendiVeeruHaldus
    @tegevus='add', 
    @tabelinimi='Klient', 
    @veerunimi='email', 
    @tyyp='varchar(30)';
	select * from Klient
-- veeru kustutamine
EXEC KliendiVeeruHaldus 
    @tegevus='drop', 
    @tabelinimi='Klient', 
    @veerunimi='email';

--Protseduur, mis kuvab toodete kliendi nime, saldo ja lisab automaatselt
--kui hind > 50000 → "Hea klient"
--muidu → "Tavaklinet"

CREATE PROCEDURE kuvaKliendiStatust
AS
BEGIN
    SELECT 
        Nimi,
        Saldo,
        CASE 
            WHEN Saldo > 50000 THEN 'Hea klient'
            ELSE 'Tavaklient'
        END AS KliendiStatus
    FROM Klient;
END;

EXEC kuvaKliendiStatust
