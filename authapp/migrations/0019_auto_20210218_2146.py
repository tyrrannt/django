# Generated by Django 3.1.5 on 2021-02-18 18:46

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('authapp', '0018_auto_20210214_0812'),
    ]

    operations = [
        migrations.AlterField(
            model_name='shopuser',
            name='activate_key_expires',
            field=models.DateTimeField(default=datetime.datetime(2021, 2, 20, 18, 46, 7, 498478, tzinfo=utc)),
        ),
    ]