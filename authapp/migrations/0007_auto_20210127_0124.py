# Generated by Django 3.1.5 on 2021-01-26 22:24

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):
    dependencies = [
        ('authapp', '0006_auto_20210120_2247'),
    ]

    operations = [
        migrations.AlterField(
            model_name='shopuser',
            name='activate_key_expires',
            field=models.DateTimeField(default=datetime.datetime(2021, 1, 28, 22, 24, 44, 784076, tzinfo=utc)),
        ),
        migrations.AlterField(
            model_name='shopuser',
            name='first_name',
            field=models.CharField(blank=True, max_length=150, verbose_name='first name'),
        ),
    ]
