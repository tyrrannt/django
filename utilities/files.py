from os import path
from hashlib import sha256


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
