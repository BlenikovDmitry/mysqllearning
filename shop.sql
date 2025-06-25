/*create database shop*/
/*
создаем БД shop c таблицами:
customers - данные о клиентах
prices - прайс
orders - заказы

намерено допускаем ошибки:
номер телефона 7 позиций а не 12
id в таблицe orders не уникальный и не первичный ключ - из за этого данные намеренно дублируются

исправляем столбец телефоны в таблице customers и перезаписываем телефоны
исправляем сначала дублирующиеся данные в таблице orders, после делаем столбец id уникальным

*/
create table customers
(
fio char(30) primary key,
tel char(7),
adress char(150)
);

create table prices
(
 descr char(30) primary key,
 price integer
);

create table orders
(
id integer not null,
cfio char(30),
descr char(30),
foreign key (cfio) references customers(fio),
foreign key (descr) references prices(descr)
);

insert into customers values('Валерий Глинников','+71488', 'Пушкина-Колотушкина');
insert into customers values('Димон Ошпаренный','+71488', 'под мостом');
insert into customers values('Кот','+71483', 'у подруги на хате');

insert into prices values('Придти на стрелку','300');
insert into prices values('Зарамсить с ФСБ','1000');
insert into prices values('Обучиться SQL','100500');

insert into orders values(1,'Валерий Глинников', 'Обучиться SQL');
insert into orders values(2,'Валерий Глинников', 'Зарамсить с ФСБ');
insert into orders values(3,'Димон Ошпаренный', 'Зарамсить с ФСБ');
insert into orders values(1,'Валерий Глинников', 'Обучиться SQL');
insert into orders values(4,'Кот', 'Обучиться SQL');
insert into orders values(4,'Кот', 'Придти на стрелку');


alter table customers
drop column tel,
add column tel char(12) ;

update customers
set tel = '+79111234565' where fio = 'Валерий Глинников';
update customers
set tel = '+79111234512' where fio = 'Димон Ошпаренный';
update customers
set tel = '+79111234534' where fio = 'Кот';

delete from orders where cfio = 'Валерий Глинников' and descr = 'Обучиться SQL';
delete from orders where cfio = 'Кот' and id = 4;

alter table orders
add constraint uniq_id unique(id) ;

insert into orders values(1,'Валерий Глинников', 'Обучиться SQL');
insert into orders values(4,'Валерий Глинников', 'Обучиться SQL');
insert into orders values(5,'Кот', 'Обучиться SQL');
insert into orders values(6,'Кот', 'Придти на стрелку');

select * from orders

/*drop database shop*/



