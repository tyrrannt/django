# Generated by Django 3.1.5 on 2021-02-07 18:03

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('authapp', '0014_auto_20210207_2043'),
    ]

    operations = [
        migrations.AlterField(
            model_name='shopuser',
            name='activate_key_expires',
            field=models.DateTimeField(default=datetime.datetime(2021, 2, 9, 18, 3, 43, 223799, tzinfo=utc)),
        ),
    ]
