## Triger - trigger - päästik
### Triger - andmebaasi objekt, mis käivitub automaatselt, kui toimub steatud sündmus (nt INSERT, UPDATE , DELETE).
Trigerite loomine - automatseerub protsessid SQL Serveris

Tabelid mis tuleb luua enne trigerit!
```sql
create database trigerLogitpe24

use trigerLogitpe24
Create table linnad(
linnId int primary key identity (1, 1),
linnanimi varchar(30) unique,
maakond varchar(50),
rahvarv int)
select * from linnad

insert into linnad(linnanimi, maakond, rahvarv)
Values('Tallinn', 'Harjumaa', 600000);

--tabeli logi - tabel, mis täidab triger, kui kasutaja täidab tabeli linnad!
Create table logi(
id int primary key identity(1, 1),
kasutaja varchar(50),
aeg datetime,
andmed TEXT)
```
