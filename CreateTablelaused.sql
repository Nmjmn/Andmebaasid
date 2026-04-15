create database Härm;
use Härm;
--tabeli loomine
CREATE TABLE opilane(
opilaneID int Primary Key identity(1, 1),
eesnimi varchar(25),
perekonnanimi varchar(30) not null, 
synniaeg date, 
pohitoetus bit, 
aadress TEXT,
keskmineHinne decimal(2, 1))

SELECT * FROM opilane;

--admete lisamine tabelisse
INSERT INTO opilane
VALUES ('Valge', 'Sall', '2000-10-23'),
('Roheline', 'Pall', '2001-10-1')

--uuendame tabeliandmeid
UPDATE opilane SET aadress='Tallinn, Eesti'
UPDATE opilane SET pohitoetus=1 --1 on true
UPDATE opilane SET keskmineHinne=4.5;
--kui soovime kõike veerud täita - ei pea neid nimetama
INSERT INTO opilane
VALUES ('Nimi', 'perenimi', '2000-10-23', 0, 'Tartu,Eesti', 3.5)
