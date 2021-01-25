# Generated by Django 2.2.17 on 2021-01-17 19:18

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):
    dependencies = [
        ('authapp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='shopuser',
            name='activate_key',
            field=models.CharField(blank=True, max_length=128, verbose_name='Код активации'),
        ),
        migrations.AddField(
            model_name='shopuser',
            name='activate_key_expires',
            field=models.DateTimeField(default=datetime.datetime(2021, 1, 19, 19, 18, 57, 421583, tzinfo=utc)),
        ),
    ]
