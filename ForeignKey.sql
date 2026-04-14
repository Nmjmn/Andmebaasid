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
