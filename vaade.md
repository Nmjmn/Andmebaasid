## SQL Vaated (Views)


[Select laused](select.md) | [Kasutaja loomine SQL serveris](kasutajad.md) | [Protseduurid](Protseduurid.md) | [Küsimused](kysimused.md) | [Triggerid](trigerid.md) | [Vaade](vaade.md) |
Mis on vaade?
Vaade (View) on virtuaalne tabel, mis põhineb SQL-päringul. Vaade ei salvesta andmeid ise — see on nagu "akna" kaudu vaatamine pärisandmetele. Iga kord, kui vaatele viidatakse, käivitatakse taustapäring uuesti.

Vaate loomine
```sql
CREATE VIEW vaate_nimi AS
SELECT veerg1, veerg2
FROM tabel
WHERE tingimus;
```

Vaade 1: Kõik brändid
```sql
CREATE VIEW kõik_brändid AS
SELECT * FROM Brands;
```
Kasutamine:
```sql
SELECT * FROM kõik_brändid;
```

Vaade 2: Brändid kategooriatega (JOIN)
```sql
CREATE VIEW brändid_kategooriatega AS
SELECT b.Brand_Name, c.Category_Name
FROM Brands b
JOIN Category c ON b.category_id = c.category_id;
```
Kasutamine:
```sql
SELECT * FROM brändid_kategooriatega;
```

Vaade 3: Ainult N-tähega brändid
```sql
CREATE VIEW n_brändid AS
SELECT Brand_Name FROM Brands
WHERE Brand_Name LIKE 'N%';
Kasutamine:
sqlSELECT * FROM n_brändid;
```

Vaate kustutamine
```sql
DROP VIEW vaate_nimi;
```
Vaate muutmine
```sql
ALTER VIEW vaate_nimi AS
SELECT ...uus päring...;
```
