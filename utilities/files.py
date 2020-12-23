from os import path
from hashlib import sha256
from datetime import date
import datetime as dt


def calculate_age(birthday):
    """
    Функция подсчета возраста на текущую дату
    :param birthday: Передается дата рождения, строкового типа
    :return: Возвращает возраст на текущую дату, строкового типа
    """
    born = dt.datetime.strptime(birthday.replace('-', ''), '%Y%m%d').date()
    today = date.today()
    try:
        birthday = born.replace(year=today.year)
    except ValueError:  # перехватывает ошибку когда дата рождения-29 февраля, а текущий год не является високосным
        birthday = born.replace(year=today.year, month=born.month + 1, day=1)
    if birthday > today:
        return str(today.year - born.year - 1)
    else:
        return str(today.year - born.year)


def hash_string(filename):
    """
    Функция приводит к общему виду имена файлов загружаемых пользователями, переименовывает и приводит их к шаблону:
    IMG_<hash сумма>.<расширение>
    :param filename: строка содержащая имя файла
    :return: Возвращает hash сумму строки
    """
    byte_input = filename.encode()
    hash_object = sha256(byte_input)
    return 'IMG_' + hash_object.hexdigest()


def get_file_path(instance, filename):
    """
    Функция приводит к общему виду имена файлов загружаемых пользователями, переименовывает и приводит их к шаблону:
    :param instance: Экземпляр класса
    :param filename: Имя файла
    :return: Переименовывает файл переданный в models.ImageField(upload_to= ... )
    """
    ext = filename.split('.')[-1]
    filename = "%s.%s" % (hash_string(filename), ext)
    return path.join('products_images', filename)
