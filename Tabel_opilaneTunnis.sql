--Teine tabel
CREATE TABLE opilaneTunnis(
opilaneTunnisID int Primary Key identity(1, 1),
kuupaev date not Null,
opilaneID int,
Foreign Key (opilaneID) References opilane(opilaneID), --tabel(PK veerg)
oppeaine varchar(25),
hinne int)
Select * from opilane;
Select * from opilaneTunnis;

--lisame andmeid opilaneTunnis tabelisse
INSERT INTO opilaneTunnis
VALUES ('2025-04-14', 2, 'andmebaasid', 5 );
--testTabel
Create table testTabel(
id int primary key);
--tabeli kustutamine
Drop Table testTabel;
Drop Database ...;

--tabelirida kustutamine
select * from opilane;
delete from opilane where opilaneID=3;

--kolmas tabel
CREATE TABLE opetaja(
opetajaID int Primary Key identity(1, 1),
eesnimi varchar(25),
ruum int not null,)
INSERT INTO opetaja
VALUES ('Nimi', 24) 
--neljas tabel
CREATE TABLE opetamine(
opetamineID int Primary Key identity(1, 1),
opetajaID int,
Foreign Key (opetajaID) References opetaja(opetajaID),
oppeaine varchar(25),
maht int not null)
INSERT INTO opetamine
VALUES (1, 'keemia', 24)


Select * from opetaja;
Select * from opetamine;
