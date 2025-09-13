import mysql.connector
from mysql.connector import Error

'''
скелет клиента бд + пример заливки данных в бд из файла
'''
try:
    connection = mysql.connector.connect(
        host='localhost',
        database='realty',
        user='root',
        password='зщдшлфкз'
            )
    if connection.is_connected():
        db_Info = connection.server_info
        print(f"Успешно подключено к серверу MySQL (версия: {db_Info})")
        cursor = connection.cursor()
        sql_query = """
    LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ex.csv'
    INTO TABLE districts
    FIELDS TERMINATED BY \';\'
    ENCLOSED BY \'\"\'
    LINES TERMINATED BY \'\\n\'
    """
        print(sql_query)
        cursor.execute(sql_query)
        connection.commit()
        
except Error as e:
    print(f"Ошибка при подключении к MySQL: {e}")
finally:
    if connection.is_connected():
        '''
        здесь прописываем запросы к бд по поиску
        '''
        '''result = cursor.fetchall()
        for i in result:
            print(i)'''
        connection.close()
        print("Соединение с MySQL закрыто")
