import tkinter as tk
from tkinter import *
from tkinter import ttk

root = Tk()
root.title("База квартир")
root.geometry("1000x1000")

notebook = ttk.Notebook(root)
notebook.pack(pady=3, expand=True)


read = ttk.Frame(notebook, width=1000, height=1000)
add = ttk.Frame(notebook, width=1000, height=1000)
delete = ttk.Frame(notebook, width=1000, height=1000)
update = ttk.Frame(notebook, width=1000, height=1000)
reports = ttk.Frame(notebook, width=1000, height=1000)

read.pack(fill='both', expand=True)
add.pack(fill='both', expand=True)
delete.pack(fill='both', expand=True)
update.pack(fill='both', expand=True)
reports.pack(fill='both', expand=True)



notebook.add(read, text='Чтение')
notebook.add(add, text='Добавление')
notebook.add(delete, text='Удаление')
notebook.add(update, text='Обновление')
notebook.add(reports, text='Отчеты')
#в фрейм пихаем все, что не кнопка выгрузки и не поле вывода
frame_ch = tk.Frame(read, width=1000, height=200)
frame_ch.pack(anchor="nw")

label_ch_table = ttk.Label(frame_ch, text="Выберите таблицу:")
label_ch_table.grid(row=0, column=0)

# Список значений для выпадающего списка экрана чтения
options= ["Квартиры", "Дома", "Районы"]
# Переменная для хранения выбранного значения
selected_option = tk.StringVar()
# Создание Combobox
combo = ttk.Combobox(frame_ch, textvariable=selected_option, values=options, state="readonly")
combo.grid(row=1, column=0)

'''
генерация интерфейса
нужно!
подключиться к Бд и заполнить структуры
вынести в отдельный класс или файл чтобы только вызывать отрисовку
'''
header = ('Поле', 'Условие', 'Аргумент')
counter = 0
for item in header:
    label_tmp = ttk.Label(frame_ch, text=item)
    #label_tmp.pack(anchor="n", side=tk.LEFT, padx=5)
    label_tmp.grid(row=2, column=counter)
    counter += 1

#поля выбранной таблцы БД(подключиться и заполнить)
options_f= ['Адрес', 'Номер дома', 'Номер квартиры']
selected_option_f = []
combos = []
for item in header:
    combos.append(ttk.Combobox(frame_ch, textvariable=selected_option_f, values=options_f, state="readonly"))
    selected_option_f.append(tk.StringVar())

counter = 4
for item in combos:
    item.grid(row=counter, column = 0)
    counter += 1

options_u= ['>', '<', '=']
selected_option_u = []
combos_u = []
for item in header:
    combos_u.append(ttk.Combobox(frame_ch, textvariable=selected_option_u, values=options_u, state="readonly"))
    selected_option_u.append(tk.StringVar())

counter = 4
for item in combos_u:
    item.grid(row=counter, column = 1)
    counter += 1
#поле ввода аргумента
entry_arg = []
for item in header:
    entry_arg.append(ttk.Entry(frame_ch))

counter = 4
for item in entry_arg:
    item.grid(row=counter, column = 2)
    counter += 1

#в фрейм пихаем кнопку выгрузки и поле вывода
frame_out = tk.Frame(read, width=1000, height=200)
frame_out.pack(anchor="nw")

btn = tk.Button(frame_out,text="Выгрузить", width = 30, height = 2)
btn.pack(anchor="nw")
text_widget = tk.Text(frame_out, wrap=tk.WORD)
#пока скрыли, откроем в обработчике выгрузки
text_widget.pack(fill='both', expand=True, anchor="n")
text_widget.pack_forget()






root.mainloop()
