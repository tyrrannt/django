# Generated by Django 2.2.17 on 2020-12-24 22:21

from django.db import migrations, models
import django.db.models.deletion
import utilities.files


class Migration(migrations.Migration):
    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ProductCategory',
            fields=[
                ('uid', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=64, unique=True, verbose_name='имя')),
                ('description', models.TextField(blank=True, verbose_name='описание')),
                ('is_active', models.BooleanField(default=True, verbose_name='активна')),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('uid', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=128, verbose_name='имя продукта')),
                ('image', models.ImageField(blank=True, upload_to=utilities.files.get_file_path)),
                ('short_desc', models.CharField(blank=True, max_length=60, verbose_name='краткое описание продукта')),
                ('description', models.TextField(blank=True, verbose_name='описание продукта')),
                ('price', models.DecimalField(decimal_places=2, default=0, max_digits=8, verbose_name='цена продукта')),
                ('quantity', models.PositiveIntegerField(default=0, verbose_name='количество на складе')),
                ('is_active', models.BooleanField(default=True, verbose_name='активна')),
                ('category',
                 models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='mainapp.ProductCategory')),
            ],
        ),
    ]
