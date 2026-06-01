### Kasutajaloomine

[Select laused](select.md) [Kasutaja loomine XAMPP-is](kasutajad.md) [Kasutaja loomine SQL serveris](kasutajad.md) [Triggerid](trigerid.md)


<img width="612" height="770" alt="pilt" src="https://github.com/user-attachments/assets/056b50fb-80b2-4681-8305-a23c61174b50" />




### SQL Server – Kasutajate autentimine ja õiguste haldamine
#### Mis on autentimine SQL Serveris?

Autentimine tähendab kasutaja tuvastamist ehk kontrollimist, kas kasutajal on õigus SQL Serverisse sisse logida.

SQL Serveris kasutatakse kahte peamist autentimise tüüpi:
### 1. Windows Authentication

Selle puhul kasutatakse samu kasutajaandmeid, millega logitakse sisse Windows operatsioonisüsteemi.

    Kasutajanimi ja parool on seotud Windowsiga
    Turvalisem lahendus
    Paroole haldab Windows
    Kasutaja ei pea eraldi SQL Serveri parooli teadma

### 2. SQL Server Authentication

Selle puhul luuakse kasutaja otse SQL Serverisse.

    Kasutaja ei ole seotud Windowsiga
    Määratakse eraldi kasutajanimi ja parool
    Sobib veebirakenduste jaoks

Näide kasutajast: DirectorHärm
Parool: director
### Kasutaja loomine SQL Serveris

#### 1. Serveritaseme kasutaja loomine (Login)
Sammud

Ava:

Security → Logins

Tee paremklikk ja vali:

New Login...

<img width="707" height="661" alt="{2051CB15-1E9C-4A0A-BC8F-97D013CC963E}" src="https://github.com/user-attachments/assets/6ddb6396-d017-4534-b87d-a0ef852c22b5" />


Harjutamiseks võib eemaldada linnukese:  User must change password at next login

#### Server Roles

Menüüst Server Roles saab määrata serveri üldised õigused.

Tavaliselt piisab rollist: public

<img width="509" height="653" alt="{668DD19C-4153-4729-97D8-D79671A57940}" src="https://github.com/user-attachments/assets/27746f50-6edc-4fa7-95f0-a9e8b29fcd01" />


#### 2. Andmebaasi kasutaja loomine (User)

Ava:

Database → Security → Users

Tee paremklikk:  New User...

##### Seosta kasutaja loginiga

<img width="262" height="383" alt="{B2B49E85-CFA4-4144-B0DF-E45C93621EB5}" src="https://github.com/user-attachments/assets/00bc023b-800d-4461-92f6-4111a5707408" />


### Membership ja õigused

Menüüst Membership saab määrata kasutaja rollid.

>db_datareader → võib lugeda
>db_datawriter → võib kirjutada INSERT, UPDATE, DELETE

<img width="703" height="292" alt="{4E88FD4C-C7A3-4668-BF50-ABA9FEBD5A6D}" src="https://github.com/user-attachments/assets/89252fcf-95d0-497e-ae6c-22ffd23cb256" />

## Kasutaja õiguste kontroll
1. tuleb sisselogida kasutajana DirectorHärm - SQL 
<img width="485" height="502" alt="{B25C310C-850F-4E97-A166-C34CD8BFC508}" src="https://github.com/user-attachments/assets/2c5470a4-3fa0-490b-8624-72382d931685" />

2. saab tabeli sisse näha ja sissestata uus kirja.
<img width="496" height="494" alt="{D7D1BE0C-F18A-424B-A1E9-D120B2544B45}" src="https://github.com/user-attachments/assets/869c5f2e-fd10-4c52-a3e8-4bb0b46eb3a9" />

3. Krontrollime tegevusi, mis ei ole lubatud kasutajale, näiteks tabeli loomine
<img width="732" height="588" alt="{C3FB16F5-86AA-45C9-83EC-CAD6485E9AEE}" src="https://github.com/user-attachments/assets/8eec078a-a832-47fa-aa89-62a402667ad2" />



### SQL Server Authentication Mode muutmine
Kui ilmub viga: Error 18456, siis on tavaliselt lubatud ainult Windows Authentication.
#### Lahendus

    Server → Properties
    Security
    Vali: SQL Server and Windows Authentication mode
    anname kasutajale directorHärm õigused
    ainult kustutada ja uuendada tebelit
    (DELETE, UPDATE, SELECT)

<img width="742" height="801" alt="{766D8ED3-5379-4450-9798-335D49ABD524}" src="https://github.com/user-attachments/assets/a4a5fea8-3ef7-4e89-83f7-a824ef729432" />

```sql
--Grant - õiguste määramine
--Deny - õiguste keelamine

--db_datareader - select 
--db_datawriter - insert, delete, update


grant delete on puhkus to DirectorHärm
grant update on puhkus to DirectorHärm
grant select on puhkus to DirectorHärm

--keelame insert
deny insert on puhkus to DirectorHärm
```

### GRANT käsud õiguste jagamiseks

GRANT käsuga antakse kasutajale õigused.
#### Käsk 	Tähendus
SELECT 	Lugemine
INSERT 	Lisamine
UPDATE 	Muutmine
DELETE 	Kustutamine



<img width="730" height="753" alt="{54AAEA2C-4CCD-41A6-9A06-A177A310D912}" src="https://github.com/user-attachments/assets/38ba89b9-0e18-425b-bde3-13b8ae01c3c8" />



    

### Ülesanne 1:

Luua andmebaas: MovieBase

Luua tabelid: 

    movies (id, moviesNimi, moviesYear, movieDir и movieCost).

    guest (id, name)

Lisada vähemalt 7 kirjet.

### Luua kasutaja Produtsent parooliga director, kellel on järgmised õigused:

    Õigus vaadata ja uuendada tabeli movies välju movieDir ja movieCost + lisada üks enda valitud privileeg.
    Õigus vaadata ja lisada kirjeid tabelisse guest.
    Keela andmete kustutamine tabelis.

## Vihje! UPDATE õigused parem lubada SQL käsuga

GRANT UPDATE (movieCost, movieDir)
ON movies
TO Produtsent;
    
