/* примеры объявления переменных, операций и запросов */

/* задаем две переременные ,складываем их и ищем все записи в 
таблице flats, где номер дома больше чем значение @third_var */
set @fir := 2;
set @sec := 3;
SET @third_var := @fir + @sec;
select @third_var;
select * from flats where hnum > @third_var;

set @filt := 6000000;
/* все квартиры дороже filt / 2 */
select * from flats where price > (@filt * 0.5);

/* все квартиры дешевле filt  / 2 */
select * from flats where price > (@filt * 0.5);

/* все квартиры дороже filt - их число */
select count(*) from flats where price > @filt;

/* все квартиры дешевле filt - их число */
select count(*) from flats where price < @filt;
