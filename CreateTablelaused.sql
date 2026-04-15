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

--uue veeru lisamine
alter table opilane add telefon varchar(1);


--tabeli struktuuri muutmine -veeru kustatamine
alter table opilane drop column telefon ;

--tabeli muutmine ´- veeru andemtüübi vahetamine
alter table opilane alter column  telefon varchar(13);
--store procedure help, mis näitab tabeli struktuuri ja veerude andmetüübid.
sp_help opilane;

drop table ryhm;

create table ryhm(
ryhmID int not null, 
ryhmNIMI varchar(10));

Select * from ryhm;
--muudame tabeli ryhm ja lisame Primary key
Alter Table ryhm Add constraint pk_ryhm Primary key (ryhmID);


--muudame tabeli ryhm ja  teeme ryhmNimi unikaalseks UNIQUE
Alter Table ryhm Add constraint un_ryhm UNIQUE(ryhmNimi);

sp_help ryhm;

--täidame tabeli ryhm

insert into ryhm(ryhmID, ryhmNIMI)
Values (3, 'LOGITPE24'),(4, 'TITpe24');
select * from ryhm;

--FOREIGN KEY -- opilane tabelis
--lisame opilane tabelisse uus veerg

alter table opilane add ryhmID int;
select * from opilane
select * from ryhm

--lisame ryhmID foreign key

alter table opilane add constraint fk_ryhm
Foreign key (ryhmID) References ryhm(ryhmID) --link tabel(PK veerg)

--kontrollimiseks täidame tabeli opilane
INSERT INTO opilane
VALUES ('Kevin', 'Allik', '2008-10-23', 0, 'Tartu,Eesti', 4.5, '+45555', 2)

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
