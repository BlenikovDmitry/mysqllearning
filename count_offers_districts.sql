/* код обновляет число объявлений по районам */
create temporary table tmp1 as
select flats.street, flats.hnum,flats.fcorp, houses.dist from flats join houses
on flats.street = houses.street and flats.hnum = houses.hnum and flats.fcorp = houses.corp and flats.flag = 1;

set @tmp_count = 0;
select count(*) into @tmp_count from tmp1 where dist = 'Древлянка';
select @tmp_count;
update districts
set count_offers = @tmp_count where dist_name = 'Древлянка';

select count(*) into @tmp_count from tmp1 where dist = 'Голиковка';
select @tmp_count;
update districts
set count_offers = @tmp_count where dist_name = 'Голиковка';

select count(*) into @tmp_count from tmp1 where dist = 'Железнодорожный';
select @tmp_count;
update districts
set count_offers = @tmp_count where dist_name = 'Железнодорожный';

select count(*) into @tmp_count from tmp1 where dist = 'Зарека';
select @tmp_count;
update districts
set count_offers = @tmp_count where dist_name = 'Зарека';

select count(*) into @tmp_count from tmp1 where dist = 'Кукковка';
select @tmp_count;
update districts
set count_offers = @tmp_count where dist_name = 'Кукковка';

select count(*) into @tmp_count from tmp1 where dist = 'Октябрьский';
select @tmp_count;
update districts
set count_offers = @tmp_count where dist_name = 'Октябрьский';

select count(*) into @tmp_count from tmp1 where dist = 'Перевалка';
select @tmp_count;
update districts
set count_offers = @tmp_count where dist_name = 'Перевалка';

select count(*) into @tmp_count from tmp1 where dist = 'Сулажгора';
select @tmp_count;
update districts
set count_offers = @tmp_count where dist_name = 'Сулажгора';
select * from districts;
