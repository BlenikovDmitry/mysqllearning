create database base1

create table clients(

id int not null,
fname char(15),
sname char(15) primary key

);


create table orders (
id int not null auto_increment primary key,
clname char(30),
text char(150),
foreign key (clname) references clients(sname)

);

insert clients values(1,'Валера', 'Глинников') 

select * from clients
select fname, sname from clients where id = 1

insert orders values(1,'Глинников', 'купил два бича')
insert orders values(4,'Глинников', 'купил четыре бича')

select clname from orders where text = 'купил два бича'

/* попытка записать в таблицу orders значениe с несуществующим клиентом  - проверка действия внешнего ключа */
insert orders values(5, 'йцу', 'купил два бича') 

drop table orders
drop database base1
