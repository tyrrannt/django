from datetime import timedelta

from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.timezone import now

from utilities.files import get_file_path


class ShopUser(AbstractUser):
    avatar = models.ImageField(upload_to='users_avatars', blank=True)
    age = models.PositiveIntegerField(verbose_name='возраст', blank=True, null=True)
    birthday = models.DateField(verbose_name='День рождения', blank=True, null=True)
    # Курс Инструменты оптимизации
    activate_key = models.CharField(verbose_name='Код активации', max_length=128, blank=True, null=True)
    activate_key_expires = models.DateTimeField(default=(now() + timedelta(hours=48)))

    def is_activate_key_expired(self):
        if now() <= self.activate_key_expires:
            return False
        return True
