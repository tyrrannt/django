from django.db import models
from utilities.files import get_file_path


class ProductCategory(models.Model):
    """
    Модель категориий продуктов
    """
    uid = models.AutoField(primary_key=True)
    name = models.CharField(verbose_name='имя', max_length=64, unique=True)
    description = models.TextField(verbose_name='описание', blank=True)
    is_active = models.BooleanField(verbose_name='активна', default=True)

    def __str__(self):
        """
        Переопределение стандартного метода str
        :return: Возвращает заданное пользователем представление экземпляра класса
        """
        return self.name


class Product(models.Model):
    """
    Модель продукта.
    """
    uid = models.AutoField(primary_key=True)
    category = models.ForeignKey(ProductCategory, on_delete=models.CASCADE)
    name = models.CharField(verbose_name='имя продукта', max_length=128)
    image = models.ImageField(upload_to=get_file_path, blank=True)
    short_desc = models.CharField(verbose_name='краткое описание продукта', max_length=60, blank=True)
    description = models.TextField(verbose_name='описание продукта', blank=True)
    price = models.DecimalField(verbose_name='цена продукта', max_digits=8, decimal_places=2, default=0)
    quantity = models.PositiveIntegerField(verbose_name='количество на складе', default=0)
    is_active = models.BooleanField(verbose_name='активна', default=True)

    def __str__(self):
        """
        Переопределение стандартного метода str
        :return: Возвращает заданное пользователем представление экземпляра класса
        """
        return f'{self.name} ({self.category.name})'
