
<img width="1441" height="860" alt="{84FC6E06-97C1-47A9-BC2A-DFD7E4ABF854}" src="https://github.com/user-attachments/assets/7214cd53-df8c-4264-88b4-ed61f45c4944" />

```sql
create database selectLohelaid
use selectLohelaid
create table auto(
autonumber char(6) primary key,
mark varchar(30),
mudell varchar(50),
v_aasta int,
varv varchar(50),
hind money)

select * from auto

--mockaroo.com 


insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('3364zJ', 'Isuzu', 'VehiCROSS', 1999, 'Mauv', '€7437,08');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('1757fH', 'Dodge', 'Ram 1500 Club', 1998, 'Pink', '€6515,63');
insert into auto (autonumber, mark, mudell, v_aasta, varv, hind) values ('829SZM', 'Mercedes-Benz', 'E-Class', 2008, 'Mauv', '€8684,11');
