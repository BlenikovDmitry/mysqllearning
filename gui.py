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


root.mainloop()
