/* примеры представлений к бд realty */
/* представление выбирает все квартиры дешевле 6 млн
проверяем простым селектом */
create view test as 
select flats.street, flats.hnum, flats.fcorp, flats.price, flats.nkomn from flats where flats.price < 6000000;
select * from test;
/*select street, hnum, fcorp, price from flats where price < 6000000*/

/* представление выбирает все районы, где квартиры стоят от 4 млн до 6 млн
чтобы не тянулись дубликаты, пришлось добавить distinct */
create view test1 as
select distinct houses.dist, flats.street, flats.hnum, flats.fcorp, flats.price, flats.nkomn from houses, flats
where flats.price < 6000000 and flats.price > 4000000 and flats.street = houses.street;
select * from test1;

/* выбираем все дома где год постройки больше 1991*/
create view test2 as
select street, hnum, corp,npods, year_boulding from houses
where year_boulding > 1990;
select * from test2;
