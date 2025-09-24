/* пример подсчитываем среднюю цену по всем квартирам всех районов */
set @cost := 0;
select avg(price) into @cost from flats;
select @cost;
/* подсчитываем среднюю цену всех квартир всех микрорайонов и вносим в таблицу districts  */
set @cost_tmp = 0;
select avg(price) into @cost_tmp from flats where street in (select street from houses where dist = 'Древлянка');
select truncate(@cost_tmp, 2);
update districts
set avprice = @cost_tmp where dist_name = 'Древлянка';

set @cost_tmp = 0;
select avg(price) into @cost_tmp from flats where street in (select street from houses where dist = 'Голиковка');
select truncate(@cost_tmp, 2);
update districts
set avprice = @cost_tmp where dist_name = 'Голиковка';

set @cost_tmp = 0;
select avg(price) into @cost_tmp from flats where street in (select street from houses where dist = 'Железнодорожный');
select truncate(@cost_tmp, 2);
update districts
set avprice = @cost_tmp where dist_name = 'Железнодорожный';

set @cost_tmp = 0;
select avg(price) into @cost_tmp from flats where street in (select street from houses where dist = 'Зарека');
select truncate(@cost_tmp, 2);
update districts
set avprice = @cost_tmp where dist_name = 'Зарека';

set @cost_tmp = 0;
select avg(price) into @cost_tmp from flats where street in (select street from houses where dist = 'Кукковка');
select truncate(@cost_tmp, 2);
update districts
set avprice = @cost_tmp where dist_name = 'Кукковка';

set @cost_tmp = 0;
select avg(price) into @cost_tmp from flats where street in (select street from houses where dist = 'Октябрьский');
select truncate(@cost_tmp, 2);
update districts
set avprice = @cost_tmp where dist_name = 'Октябрьский';

set @cost_tmp = 0;
select avg(price) into @cost_tmp from flats where street in (select street from houses where dist = 'Перевалка');
select truncate(@cost_tmp, 2);
update districts
set avprice = @cost_tmp where dist_name = 'Перевалка';

set @cost_tmp = 0;
select avg(price) into @cost_tmp from flats where street in (select street from houses where dist = 'Сулажгора');
select truncate(@cost_tmp, 2);
update districts
set avprice = @cost_tmp where dist_name = 'Сулажгора';

select * from districts;

