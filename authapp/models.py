from django.db import models
from django.contrib.auth.models import AbstractUser
from utilities.files import get_file_path


class ShopUser(AbstractUser):
    avatar = models.ImageField(upload_to='users_avatars', blank=True)
    age = models.PositiveIntegerField(verbose_name='возраст', blank=True, null=True)
    birthday = models.DateField(verbose_name='День рождения', blank=True, null=True)
