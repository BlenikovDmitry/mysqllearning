import mysql.connector
from mysql.connector import Error
import pandas as pd

def check_uniq_houses():
    #список куда пишем что получили от БД
    res_list = []
    #df куда пишем что хотим загрузить
    upd = pd.read_csv('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ex.csv', sep = ';')
    #print(upd)
    select_houses = 'select * from houses'
    cursor.execute(select_houses)
    result = cursor.fetchall()
    for i in result:
        res_list.append(i)
    #приводим к одинаковым типам данных значимые для нас столбцы
    res_df = pd.DataFrame(res_list, columns=['Улица','Дом', 'Корпус', 'Подъездов', 'Тип перекрытий', 'Этажность','Год постройки', 'Район'])
    res_df['Улица'] = res_df['Улица'].astype(str)
    res_df['Дом'] = res_df['Дом'].astype(int)
    res_df['Корпус'] = res_df['Корпус'].astype(int)
    upd['Улица'] = upd['Улица'].astype(str)
    upd['Дом'] = upd['Дом'].astype(int)
    upd['Корпус'] = upd['Корпус'].astype(int)
'''
нужно как - то хитро смерджить, чтобы остались только те записи, которые есть и в upd и  в res_df
потом убрать их из upd
из upd убрать заголовки и индекс и запиать результат в ex.csv
после можно применить запрос на обновление (лучше все таки через mysql так как придется отклчать проверку на ссылочную целостность)
без этого работать не будет
'''

    print(upd)
    print(res_df)
    result_tmp = pd.merge(upd, res_df, how='inner')
    print(result_tmp)
    '''rows_to_drop = result_tmp.index
    upd = upd.drop(rows_to_drop)

    print(res_df)
    upd.to_csv('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ex1.csv', encoding = 'utf-8', sep = ';')'''


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
    INTO TABLE houses
    FIELDS TERMINATED BY \';\'
    ENCLOSED BY \'\"\'
    LINES TERMINATED BY \'\\n\'
    """
        check_uniq_houses()
        #cursor.execute(sql_query)
        
        connection.commit()
        
except Error as e:
    print(f"Ошибка при подключении к MySQL: {e}")
finally:
    if connection.is_connected():
        connection.close()
        print("Соединение с MySQL закрыто")
