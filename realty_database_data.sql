/*
данные базы данных, взяты из открытых источников(пока сайт cian.ru)
*/

/* блок внесения данных в таблицу districts */
insert into districts values('Древлянка',0);
insert into districts values('Кукковка',0);
insert into districts values('Октябрьский',0);
insert into districts values('Железнодорожный',0);
insert into districts values('Голиковка',0);
insert into districts values('Зарека',0);
insert into districts values('Сулажгора',0);
select * from districts

/* блок внесения данных в таблицу houses */
insert into houses values('Интернационалистов',6,'1',5,'Панель', 9,1991, 'Древлянка');
insert into houses values('Интернационалистов',6,'2',6,'Панель', 10,1999, 'Древлянка');
insert into houses values('Лососинское шоссе',31,'2',2,'Панель', 10,1992, 'Древлянка');
insert into houses values('Лососинское шоссе',31,'1',5,'Панель', 10,1991, 'Древлянка');
insert into houses values('Лососинское шоссе',21,'1',4,'Панель', 9,1989, 'Древлянка');
insert into houses values('Скандинавский проезд',14,'1',4,'Панель', 6,2016, 'Древлянка');
insert into houses values('Хейкконена улица',16,'1',6,'Панель', 7,1995, 'Древлянка');
insert into houses values('Лососинское шоссе',22,'1',7,'Панель', 10,1990, 'Древлянка');
select * from houses;

/* блок внесения данных в таблицу flats */
insert into flats values(1,'Интернационалистов',6,1,6000000,6,68.9, 3,1, 2025.07.21);
insert into flats values(1,'Интернационалистов',6,1,6,68.9,3,6000000, 1,2025.07.21);
insert into flats values(2,'Интернационалистов',6,2,9,65.3,3,6200000, 1,2025.07.21);
insert into flats values(3,'Лососинское шоссе',31,2,8,64.8,3,6500000, 1,2025.07.21);
insert into flats values(4,'Лососинское шоссе',21,1,4,65.7,3,5700000, 1,2025.07.21);
insert into flats values(5,'Лососинское шоссе',31,1,3,80,3,6350000, 1,2025.07.21);
insert into flats values(6,'Скандинавский проезд',14,1,3,60,3,7250000, 1,2025.07.21);
insert into flats values(7,'Хейкконена улица',16,1,5,69,3,6990000, 1,2025.07.21);
insert into flats values(8,'Лососинское шоссе',22,1,4,68.6,3,6700000, 1, CURDATE());
select * from flats;

/* блок запросов к таблице flats */
select street, hnum, fcorp, square from flats where price < 6200000
update flats set date_insert = '2025.07.21' where id < 8;
select * from flats
/*////////////////////////////////////////////////////////////////////////////////////////*/
