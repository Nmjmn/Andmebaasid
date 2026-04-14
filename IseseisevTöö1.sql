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
