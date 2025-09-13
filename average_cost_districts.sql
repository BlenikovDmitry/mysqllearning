/* пример подсчитываем среднюю цену по всем квартирам всех районов */
set @cost := 0;
select avg(price) into @cost from flats;
select @cost;
/* подсчитываем среднюю цену всех квартир микрорайона Древлянка и вносим в таблицу districts 
Древлянку можно поменять на что угодно */
set @cost_dr = 0;
select avg(price) into @cost_dr from flats where street in (select street from houses where dist = 'Древлянка');
select truncate(@cost_dr, 2);
update districts
set avprice = @cost_dr where dist_name = 'Древлянка';
select * from districts;


