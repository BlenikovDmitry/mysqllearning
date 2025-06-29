
/*
база данных будущего проекта - базы квартир для нужд агентского бизнеса
*/


create database realty
/*
  таблица хранит информацию о квартирах
*/
create table flats
(
  /* уникальный номер */
	id integer primary key,
  /* улица */
    street char(255),
  /* номер дома */
    hnum integer,
  /*
  номер корпуса
  */
    pod integer,
  /*
  цена
  */
    price integer,
  /*
  флаг - о - в продаже, 1 - объявление снято
  */
    flag bool,
  /*
  подтягиваем данные их таблицы о доме(потребуется для статистики)
  */
    foreign key (street,hnum,pod) references houses(street,hnum,pod)
);
/*
таблица хранит информацию о домах
*/
create table houses
(
  /*
  адрес дома
  */
	street char(255),
  /*
  номер дома
  */
    hnum integer,
  /*
  номер корпуса
  */
    pod integer,
  /*
  число этажей
  */
    levels integer,
  /*
  год постройки
  */
    year_boulding integer,
  /*
  район - подтягивается из таблицы районов
  */
    dist char(100),
    foreign key (dist) references districts(dist_name)
);
/*
способ задания составного первичного клоча, чтобы таблицу дома связать с таблицей квартиры
*/
alter table houses
add constraint housepk primary key(street,hnum,pod)

alter table flats
add nkomn integer
/*
  таблица содержит информацию о районах
*/
create table districts
(
  /* нназвание района */
	dist_name char(100) primary key,
  /*
    средняя цена в районе(планирую рассчитывать и добавлять из внешних систем)
  */
    avprice integer
);
