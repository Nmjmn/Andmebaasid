create database Harm;
use Harm;

--Tabel brands
Create table Brands(
brand_id int primary key identity(1, 1),
Brand_Name varchar(25) Unique)

Insert into Brands
values('Nike'),('Puma')
alter table Brands drop column Jaguar

Select * from Brands

--Tabel Category
Create table Category(
category_id int primary key identity(1, 1),
Category_Name varchar(25) Unique)

Insert into Category
values('Jalatsid'), ('Särgid')

Select * from Category

--Tabel Products
Create table Products(
product_id int primary key identity(1, 1),
Products_name varchar(25) UNIQUE,
brand_id int
Foreign key (brand_id) References Brands(brand_id),
category_id int,
Foreign key (category_id) References Category(Category_id),
Model_year int,
List_price money)

insert into Products
values ('Valge Särk', 2, , 2025, 130.50)
Select * from Products

--Tabel Customers
Create table Customers(
customer_id int primary key identity(1, 1),
First_Name varchar(25) Not Null,
Last_Name varchar(25) Not Null,
Phone char(13),
Email varchar(25) Not Null,
Street varchar(25),
City varchar(25),
State varchar(25),
Zip_Code char(5))

Select * from Customers

insert into Customers
Values ('Priit', 'Mets', '573498', 'priit.mets@gmail.com', 'Mingi Tänav', 'Linnutee', 'Eesti', '74297')

--Tabel Stores
Create table Stores(
store_id int primary key identity(1, 1),
Store_name varchar(25) Unique Not null,
Phone char(13),
Email varchar(25) Not Null,
Street varchar(25),
City varchar(25),
State varchar(25),
Zip_Code char(5))

Select * from Stores

insert into Stores
Values ('Sportland', '5638983', 'sportland@gmail.com', 'Priisele', 'Lasnamäe', 'Eesti', '78492')

--Tabel Staff

Create table Staff(
staff_id int primary key identity(1, 1),
First_Name varchar(25) Not Null,
Last_Name varchar(25) Not Null,
Email varchar(25) Not Null,
Phone char(13),
Active bit,
store_id int,
Foreign key (store_id) References Stores(store_id),
Manager_id bit)

Select * from Staff

Insert into Staff
values ('Mia', 'Raud', 'mia.raud@gmail.com', 58942183,1 , 2, 0)

--Tabel Stocks
Create table Stocks(
store_id int,
product_id int,
primary key (store_id, product_id),
Foreign key (store_id) References Stores(store_id),
Foreign key (product_id) References Products(product_id),
Quantity int)

select * from Stores
select * from Products
select * from Stocks

insert into Stocks
values ( 2, 1, 50)

--Tabel Orders
Create table Orders(
order_id int primary key identity(1, 1),
customer_id int,
Foreign key(customer_id) references Customers(customer_id),
order_status varchar(10) check(order_status = 'tehtud' or order_status = 'tegematta'),
order_date date,
required_date date,
shipped_date date,
store_id int, 
Foreign key(store_id) references Stores(store_id),
staff_id int, 
Foreign key(staff_id) references Staff(staff_id))

select * from Orders
select * from Stores
select * from Staff
select * from Customers

insert into Orders
values (1, 'tehtud', '2026-04-21', '2026-05-13', '2026-05-14', 2, 1)

--Tabel order_items
create table order_items(
order_id int, 
Foreign key(order_id) references Orders(order_id),
item_id int, 
product_id int,
Foreign key(product_id) references Products(product_id),
primary key(order_id, item_id),
quantity int,
list_price money,
discount int)

select * from order_items
select * from Products
select * from Orders

insert into order_items
values (2, 1, 2, 100, 100,  20)
