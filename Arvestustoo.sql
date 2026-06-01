create database Logitpe24

use Logitpe24

create table isik(
isik_ID int primary key identity (1, 1),
eesnimi varchar(20),
perenimi varchar(20),
isikukood int,
sugu varchar(5)
)

INSERT INTO isik (eesnimi, perenimi, isikukood, sugu)
VALUES ('Mari', 'Mägi', '49001011', 'N');

create table aadress(
aadress_ID int primary key identity (1, 1),
riik varchar (30),
linn varchar (20),
tanav varchar (30),
maja varchar (20),
korter varchar (10),
postiindeks int)

INSERT INTO aadress (riik, linn, tanav, maja, korter, postiindeks)
VALUES ('Eesti', 'Tallinn', 'Tartu mnt', '1', '5', '10115');

create table elamine(
elamine_ID int primary key identity (1, 1),
isik_ID int,
Foreign key (isik_ID) References isik(isik_ID),
aadress_ID int,
Foreign key (aadress_ID) References aadress(aadress_ID),
alates date,
kuni date,
kommentaar varchar(50))

select * from isik
select * from aadress
select * from elamine

grant update on isik to isikLohelaid
grant select on isik to isikLohelaid
grant insert on isik to isikLohelaid

grant update on elamine to isikLohelaid
grant select on elamine to isikLohelaid
grant insert on elamine to isikLohelaid

deny update on aadress to isikLohelaid
grant select on aadress to isikLohelaid
deny insert on aadress to isikLohelaid
deny select on logi to isikLohelaid


Create table logi(
id int primary key identity(1, 1),
kasutaja varchar(50),
kuupaev datetime,
sisestatudAndmed TEXT)

Create trigger AndmeteLisamine
On elamine -- tabel, mis triger jälgib
for insert
as
insert into logi(kasutaja, kuupaev, sisestatudAndmed)
select
SYSTEM_USER, --siselogitud user
GETDATE(), 
concat('lisatud: ' isik_Id,', ', aadress_id, ', ', inserted.alates, ', ', inserted.kuni, ', ', inserted.kommentaar)
from inserted;

ALTER TRIGGER AndmeteLisamine
ON elamine
FOR INSERT
AS
INSERT INTO logi(kasutaja, kuupaev, sisestatudAndmed)
SELECT
    SYSTEM_USER,
    GETDATE(),
    CONCAT('lisatud: ', inserted.isik_ID, ', ', inserted.aadress_ID, ', ', inserted.alates, ', ', inserted.kuni, ', ', inserted.kommentaar)
FROM inserted;


select * from logi

Create trigger AndmeteUuendamine
On elamine -- tabel, mis triger jälgib
for update
as
insert into logi(kasutaja, kuupaev, sisestatudAndmed)
select
SYSTEM_USER, --siselogitud user
GETDATE(), 
concat('vana andmed : ',
deleted.alates, ', ', deleted.kuni, ', ', deleted.kommentaar,
' ||| uued andmed: ',
inserted.alates, ', ', inserted.kuni, ', ', inserted.kommentaar)
from deleted INNER JOIN inserted
on deleted.elamine_ID=inserted.elamine_ID;

select * from elamine
-- Proceduur, mis täidab tabeli
Create Procedure lisa
	@kuni date
As
Begin
	Insert into elamine (kuni)
	values (@kuni);
	select * from elamine;
end
--kutse
Exec lisa '2026-06-7'

--Proceduur, mis kustutab tabelist id järgi
Create procedure kustuta
@id int
AS
Begin
	SELECT * from elamine;
	Delete from elamine where elamine_ID=@id;
	Select * from elamine
End

-- kutse
EXEC kustuta 6 

Create Procedure otsing2
@paev date
AS
Begin
	Select * from elamine
	Where kuni = @paev;
ENd
--kutse
Select * from elamine
Exec otsing2 '2026-09-01'

CREATE VIEW päev AS
SELECT alates FROM elamine
WHERE alates = Cast(Getdate() as date)

kasutaine
SELECT * FROM päev;

CREATE VIEW elamisAeg AS
SELECT b.alates, c.riik
FROM elamine b
JOIN aadress c ON b.elamine_ID = c.aadress_ID;

select * from elamine
select * from aadress

SELECT * FROM elamisAeg

CREATE VIEW kõikElanikud AS
SELECT 
    i.eesnimi,
    i.perenimi,
    i.isikukood,
    i.sugu,
    a.riik,
    a.linn,
    a.tanav,
    a.maja,
    a.korter,
    a.postiindeks,
    e.alates,
    e.kuni,
    e.kommentaar
FROM aadress a
JOIN elamine e ON a.aadress_ID = e.aadress_ID
JOIN isik i ON e.isik_ID = i.isik_ID;

SELECT * FROM kõikElanikud;

Create procedure kustuta2
	@id int
AS
Begin
    SELECT * from aadress;
    Delete from aadress where aadress_ID=@id;
    Select * from aadress
End
-- Kutse:
