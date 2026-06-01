## SQL Protseduurid


[Select laused](select.md) | [Kasutaja loomine SQL serveris](kasutajad.md) | [Protseduurid](Protseduurid.md) | [Küsimused](kysimused.md) | [Triggerid](trigerid.md) | [Vaade](vaade.md) |

Mis on protseduur?
Protseduur (Stored Procedure) on eelkompileeritud SQL-koodiplokk, mis on salvestatud andmebaasi ja mida saab korduvalt käivitada. Protseduurid võtavad vastu parameetreid, täidavad toiminguid ja võivad tagastada tulemusi.

Protseduur 1: lisa
```sql
Create Procedure lisa
@First_Name varchar(15)
AS
Begin
    Insert into Brands values (@First_Name);
    select * from Brands;
end
-- Kutse:
Exec lisa 'test'
```

Kirjeldus:
Lisab uue kirje Brands tabelisse.

```sql
Parameeter: @First_Name varchar(15) — lisatava brändi nimi (max 15 tähemärki)
Tegevus 1: Sisestab uue rea tabelisse Brands
Tegevus 2: Kuvab kogu Brands tabeli sisu pärast lisamist
Kutsumine: Exec lisa 'test' — lisab brändi nimega "test"
```
Protseduur 2: kustuta
```sql
Create procedure kustuta
@id int
AS
Begin
    SELECT * from Brands;
    Delete from Brands where brand_id=@id;
    Select * from Brands
End
-- Kutse:
EXEC kustuta 3
```
Kirjeldus:
Kustutab kirje Brands tabelist ID järgi.
```sql
Parameeter: @id int — kustutatava brändi ID (täisarv)
Tegevus 1: Kuvab tabeli sisu enne kustutamist
Tegevus 2: Kustutab rea, kus brand_id = @id
Tegevus 3: Kuvab tabeli sisu pärast kustutamist
Kutsumine: EXEC kustuta 3 — kustutab brändi, mille ID on 3
```
Protseduur 3: otsing
```sql
Create Procedure otsing
@taht char(1)
AS
Begin
    Select Brand_Name from Brands
    Where Brand_Name like @taht + '%';
ENd
-- Kutse:
Exec otsing 'N'
```

Kirjeldus:
Otsib brände, mille nimi algab antud tähega.

```sql
Parameeter: @taht char(1) — otsitav esitäht (üks tähemärk)
Tegevus: Tagastab kõik Brand_Name väärtused, mis algavad parameetriga
LIKE-muster: @taht + '%' — tähendab "algab sellega, millele järgneb mis tahes"
Kutsumine: Exec otsing 'N' — leiab kõik brändid, mille nimi algab tähega "N"
```
