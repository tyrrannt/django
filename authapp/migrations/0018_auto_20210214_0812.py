# Generated by Django 3.1.5 on 2021-02-14 05:12

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('authapp', '0017_auto_20210207_2158'),
    ]

    operations = [
        migrations.AlterField(
            model_name='shopuser',
            name='activate_key_expires',
            field=models.DateTimeField(default=datetime.datetime(2021, 2, 16, 5, 12, 58, 815442, tzinfo=utc)),
        ),
    ]