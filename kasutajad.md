
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

    db_datareader → võib lugeda
    db_datawriter → võib kirjutada

>>>>>pilt

### SQL Server Authentication Mode muutmine
Kui ilmub viga: Error 18456, siis on tavaliselt lubatud ainult Windows Authentication.
#### Lahendus

    Server → Properties
    Security
    Vali: SQL Server and Windows Authentication mode

### GRANT käsud õiguste jagamiseks

GRANT käsuga antakse kasutajale õigused.
#### Käsk 	Tähendus
SELECT 	Lugemine
INSERT 	Lisamine
UPDATE 	Muutmine
DELETE 	Kustutamine

>>>>>pilt


    

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
    
