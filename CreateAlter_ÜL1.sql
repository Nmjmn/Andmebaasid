create database baas;
use baas;

--loome uue Category (idCategory, Category_Name)
Create table Category(
idCategory int primary key identity(1, 1),
Category_Name varchar(25) Unique)

Insert into Category
values ('Auto'), ('Jook'), ('Toit')
Select * from Category

-- loome uue Product (idProduct, Name, idCategory, Price)
Create table Product(
idProduct int primary key identity(1, 1),
Name varchar(25),
idCategory int,
Foreign key (idCategory) References Category(idCategory),
Price money)

insert into Product
values ('Coca-Cola', 2, 1.0)



Select * from Product

--loome uue Sale  (idSale, idProduct, idCustomer, Count_pr, Date_of_sale)
Create table Sale(
IdSale int primary key identity(1, 1),
idProduct int,
Foreign key (idProduct) References Product(idProduct),
idCustomer int,
count_pr int,
date_of_sale date)
--loome uue tabeli Customer (idCustomer, Name, Contact) ja seome
Create table Customer(
idCustomer int Primary key identity(1,1),
Name Varchar(25) UNIQUE,
Conatact varchar(100))

Alter table sale add foreign key (idCustomer)References customer(idCustomer)
insert into Customer
Values ('kevin', '+585756'), ('Robin', ,'+345678')

Insert into Sale
Values (1, 1, 5, '2026-15-04')

Select * from Category
