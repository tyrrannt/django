# Generated by Django 3.1.5 on 2021-01-31 17:07

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('authapp', '0011_auto_20210131_0053'),
    ]

    operations = [
        migrations.AlterField(
            model_name='shopuser',
            name='activate_key_expires',
            field=models.DateTimeField(default=datetime.datetime(2021, 2, 2, 17, 7, 41, 2962, tzinfo=utc)),
        ),
    ]
