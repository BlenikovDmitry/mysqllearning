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
add constraint housepk primary key(street,hnum,pod); 
