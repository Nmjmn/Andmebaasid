## Andmebaasi võtmed (Keys)

### 1. Primary Key (Primaarvõti)
Definitsioon:
Primaarvõti on veerg (või veergude kombinatsioon), mis üheselt identifitseerib iga rea tabelis. Iga tabel saab omada ainult ühte primaarvõtit.
Milleks kasutatakse:
Tagab, et tabelis ei ole kaks identset rida. Kasutatakse viitamiseks teistest tabelitest (Foreign Key).
Erinevus teistest:

Ei tohi olla NULL
Peab olema unikaalne
Tabelis saab olla ainult üks Primary Key

SQL näide:
```sql
CREATE TABLE Õpilane (
    õpilane_id   INT PRIMARY KEY,
    eesnimi      VARCHAR(50),
    perenimi     VARCHAR(50)
);

INSERT INTO Õpilane VALUES (1, 'Mari', 'Tamm');
INSERT INTO Õpilane VALUES (2, 'Jaan', 'Kask');
```
📸 Lisa siia ekraanipilt: käivita kood SQL Server Management Studios ja tee print screen tulemusest ning tabeli struktuurist (paremklikk tabelil → Design)


### 2. Foreign Key (Võõrvõti)
Definitsioon:
Võõrvõti on veerg, mis viitab teise tabeli primaarvõtmele. See loob seose kahe tabeli vahel.
Milleks kasutatakse:
Tagab viitamistervikluse — andmebaas ei luba lisada rida, mis viitab olematule kirjele teises tabelis.
Erinevus teistest:

Sõltub teise tabeli Primary Key-st
Võib olla NULL (kui seos ei ole kohustuslik)
Tabelis võib olla mitu Foreign Key-d

SQL näide:
```sql
CREATE TABLE Klass (
    klass_id    INT PRIMARY KEY,
    klassinimi  VARCHAR(10)
);

CREATE TABLE Õpilane (
    õpilane_id  INT PRIMARY KEY,
    eesnimi     VARCHAR(50),
    klass_id    INT FOREIGN KEY REFERENCES Klass(klass_id)
);

INSERT INTO Klass VALUES (1, '10A');
INSERT INTO Õpilane VALUES (1, 'Mari', 1);
```
📸 Lisa siia ekraanipilt: näita mõlemat tabelit ja Foreign Key seost (Database Diagrams või tabeli Design vaade)


### 3. Unique Key (Unikaalne võti)
Definitsioon:
Unique Key tagab, et kõik veerus olevad väärtused on unikaalsed, kuid erinevalt Primary Key-st lubab ühte NULL-väärtust.
Milleks kasutatakse:
Kasutatakse veergudel, mis peavad olema unikaalsed, kuid ei ole tabeli peamine identifikaator (nt e-posti aadress, isikukood).
Erinevus teistest:

Lubab NULL-i (Primary Key ei luba)
Tabelis võib olla mitu Unique Key-d
Ei ole tabeli "peamine" võti

SQL näide:
```sql
CREATE TABLE Kasutaja (
    kasutaja_id  INT PRIMARY KEY,
    kasutajanimi VARCHAR(50) UNIQUE,
    email        VARCHAR(100) UNIQUE
);

INSERT INTO Kasutaja VALUES (1, 'mari123', 'mari@kool.ee');
INSERT INTO Kasutaja VALUES (2, 'jaan456', 'jaan@kool.ee');
-- Järgmine rida annaks vea, sest email on juba olemas:
-- INSERT INTO Kasutaja VALUES (3, 'peeter', 'mari@kool.ee');
```
📸 Lisa siia ekraanipilt: näita tabelit ja proovi sisestada duplikaati — näita veateadet


### 4. Simple Key (Lihtne võti)
Definitsioon:
Simple Key koosneb ainult ühest veerust, mis üheselt identifitseerib rea.
Milleks kasutatakse:
Lihtsaim viis tabeli ridade identifitseerimiseks. Enamik tavatabeletest kasutab just Simple Key-d.
Erinevus teistest:

Koosneb ühest veerust (Composite Key koosneb mitmest)
Lihtne hallata ja indekseerida

SQL näide:
```sql
CREATE TABLE Toode (
    toode_id   INT PRIMARY KEY,   -- Simple Key: ainult üks veerg
    toodenimi  VARCHAR(100),
    hind       DECIMAL(10,2)
);

INSERT INTO Toode VALUES (1, 'Pliiats', 0.99);
INSERT INTO Toode VALUES (2, 'Vihik', 2.49);
```
📸 Lisa siia ekraanipilt: tabeli struktuur, kus on näha ühe veeru Primary Key


### 5. Composite Key (Komposiitsetsioon võti)
Definitsioon:
Composite Key on primaarvõti, mis koosneb kahest või enamast veerust — nende kombinatsioon on unikaalne, kuid ükski veerg eraldi ei pruugi olla unikaalne.
Milleks kasutatakse:
Kasutatakse siis, kui üks veerg ei ole piisav rea identifitseerimiseks. Tüüpiline vahemängutabelites (many-to-many seos).
Erinevus teistest:

Mitu veergu koos moodustavad võtme
Ükski üksik veerg ei pea olema unikaalne
Simple Key = 1 veerg, Composite Key = 2+ veergu

SQL näide:
```sql
CREATE TABLE Registreerimine (
    õpilane_id  INT,
    kursus_id   INT,
    kuupäev     DATE,
    PRIMARY KEY (õpilane_id, kursus_id)  -- Composite Key
);

INSERT INTO Registreerimine VALUES (1, 101, '2025-09-01');
INSERT INTO Registreerimine VALUES (1, 102, '2025-09-01');  -- sama õpilane, erinev kursus ✓
INSERT INTO Registreerimine VALUES (2, 101, '2025-09-01');  -- erinev õpilane, sama kursus ✓
```
📸 Lisa siia ekraanipilt: tabeli Design vaade, kus on näha mõlemad PK veerud märgitud


### 6. Compound Key (Liitmõtmvõti)
Definitsioon:
Compound Key on Composite Key erijuht — koosneb mitmest veerust, kuid vähemalt üks neist on Foreign Key teises tabelis.
Milleks kasutatakse:
Kasutatakse seosetabelites, kus võti koosneb mitme teise tabeli viidetest.
Erinevus teistest:

Sarnane Composite Key-ga, kuid sisaldab Foreign Key veerge
Composite Key võib koosneda "tavalistest" veergudest; Compound Key sisaldab FK-d

SQL näide:
```sql
CREATE TABLE Õpilane_Kursus (
    õpilane_id  INT REFERENCES Õpilane(õpilane_id),
    kursus_id   INT REFERENCES Kursus(kursus_id),
    hinne       INT,
    PRIMARY KEY (õpilane_id, kursus_id)  -- Compound Key: mõlemad on FK-d
);
```
📸 Lisa siia ekraanipilt: Database Diagram, kus on näha seosed kolme tabeli vahel


### 7. Superkey (Supervõti)
Definitsioon:
Superkey on mis tahes veergude kombinatsioon, mis üheselt identifitseerib rea tabelis. See võib sisaldada "üleliigseid" veerge.
Milleks kasutatakse:
Teoreetiline kontseptsioon — kasutatakse andmebaasiteooria õpetamisel ja normaliseerimisel, et selgitada, millest Candidate Key tuleneb.
Erinevus teistest:

Võib sisaldada ebavajalikke veerge
Candidate Key on "minimaalne" Superkey
Iga Candidate Key on Superkey, aga mitte iga Superkey ei ole Candidate Key

SQL näide:
```sql
CREATE TABLE Töötaja (
    töötaja_id   INT PRIMARY KEY,
    isikukood    CHAR(11) UNIQUE,
    eesnimi      VARCHAR(50),
    perenimi     VARCHAR(50)
);
```
-- Supervõtmed selles tabelis (kõik identifitseerivad rea):
-- {töötaja_id}
-- {isikukood}
-- {töötaja_id, eesnimi}          ← üleliigsed veerud, aga ikka Superkey
-- {töötaja_id, eesnimi, perenimi} ← ka see on Superkey

📸 Lisa siia ekraanipilt: tabeli struktuur. Selgita kommentaarina, millised veergude kombinatsioonid on Superkeyid


### 8. Candidate Key (Kandidaatvõti)
Definitsioon:
Candidate Key on minimaalne Superkey — veerg või veergude kombinatsioon, mis suudab rea üheselt identifitseerida, ilma ühegi üleliigsuse veeruta.
Milleks kasutatakse:
Andmebaasi kujundamisel valitakse Candidate Key-de hulgast üks Primary Key-ks. Ülejäänud saavad Alternate Key-deks.
Erinevus teistest:

Superkey on kõik identifitseerivad kombinatsioonid
Candidate Key on neist minimaalsed (ei saa ühtegi veergu eemaldada)
Primary Key valitakse Candidate Key-de hulgast

SQL näide:
```sql
CREATE TABLE Sõiduk (
    sõiduk_id    INT PRIMARY KEY,        -- Candidate Key → valiti Primary Key-ks
    registreering CHAR(6) UNIQUE,        -- Candidate Key → saab Alternate Key-ks
    VIN_kood     CHAR(17) UNIQUE,        -- Candidate Key → saab Alternate Key-ks
    mark         VARCHAR(50)
);

INSERT INTO Sõiduk VALUES (1, '123ABC', 'WBA1234567890ABCDE', 'Toyota');
```
📸 Lisa siia ekraanipilt: tabeli struktuur, kus on näha mitu UNIQUE + PRIMARY KEY veergu


### 9. Alternate Key (Alternatiivne võti)
Definitsioon:
Alternate Key on Candidate Key, mida ei valitud Primary Key-ks. See on alternatiivne viis rea identifitseerimiseks.
Milleks kasutatakse:
Rakendatakse UNIQUE piiranguna. Kasulik, kui soovitakse tabelile otsinguid teha mitme erineva tunnuse järgi (nt nii ID kui ka isikukoodi järgi).
Erinevus teistest:

On Candidate Key, aga pole Primary Key
Rakendatakse SQL-is UNIQUE kaudu
Tabelis võib olla mitu Alternate Key-d

SQL näide:
```sql
CREATE TABLE Klient (
    klient_id   INT PRIMARY KEY,         -- Primary Key (valitud Candidate Key)
    isikukood   CHAR(11) UNIQUE,         -- Alternate Key
    email       VARCHAR(100) UNIQUE,     -- Alternate Key
    nimi        VARCHAR(100)
);

INSERT INTO Klient VALUES (1, '39001010010', 'mari@näide.ee', 'Mari Mets');
```
```sql
-- Saab otsida nii:
SELECT * FROM Klient WHERE klient_id = 1;
SELECT * FROM Klient WHERE isikukood = '39001010010';
SELECT * FROM Klient WHERE email = 'mari@näide.ee';
```
