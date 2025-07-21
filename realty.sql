create database realty;

/* таблица содержит данные о районах */
create table districts
(
/* название района */
    dist_name char(100) primary key,
/* средняя цена(предполагается, что будет доабвляться из внешних систем) */
    avprice integer
);


/* таблица содержит данные о домах */
create table houses
(
/* улица */
	street char(255),
/* номер дома */
    hnum integer,
/* номер корпуса*/
    corp char(5),
/* число подъездов */
    npods integer,
/*тип перекрытий(панель/кирпич и тд)*/
    htype char(255),
/* число этажей */
    levels integer,
/* год постройки */
    year_boulding integer,
/* район */
    dist char(100),
    foreign key (dist) references districts(dist_name)
);

alter table houses
add constraint housepk primary key(street,hnum,corp);

create table flats
(
/* уникальный id квартиры */
	id integer primary key,
/* улица */
    street char(255),
/* номер дома */
    hnum integer,
/* номер корпуса */
    fcorp char(5),
/* число этажей */
    flevel integer,
/* общая площадь */
    square float,
/* число комнат */
    nkomn integer,
/* цена */
    price integer,
/* флаг(0 - не продается, 1 - продается)*/
    flag bool,
/* внешний ключ, чтобы не добавтьб фейковый адрес */
    foreign key (street,hnum,fcorp) references houses(street,hnum,corp)
); 
/* в процессе работы потребовалась дата внесения в реестр, чтобы отслеживать длительность экспозиции */
alter table flats 
add date_insert date
