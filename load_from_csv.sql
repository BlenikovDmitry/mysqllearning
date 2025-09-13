/*
пример загрузки из файла
ВАЖНО! файл должен быть в спец директории, прописанной в переменной secure_file_priv
*/
/* смотрим, куда надо загрузить файл */
SHOW VARIABLES LIKE "secure_file_priv";
/* применяем загрузку */
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ex.csv'
  /* в какую таблицу загружаем */
        INTO TABLE districts
   /* разделитель полей  */
        FIELDS TERMINATED BY ';'
   /* экранируем двойные кавычки в полях */
        ENCLOSED BY '"'
   /* строки завершаются спец терминатором */
        LINES TERMINATED BY '\n';
        /*IGNORE 1 ROWS; -- если есть строка заголовка*/		
select * from districts
