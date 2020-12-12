# Django geekshop
Сайт интернет магазина, разрабатываемый в рамках курса `Основы Django Framework`
образовательного портала ***GeekBrains***.
######Студент: Шакиров В.
######Преподаватель: Павликов В.
######Наставник: Пакальнис Д.

### Инструкции для развертывания

>Установить все необходимые зависимости для уже готового проекта:
```
pip install -r requirements.txt
```

>Создание миграций:
```
manage.py makemigrations
manage.py migrate
```

>Загрузка базы:
```
manage.py loaddata mainapp\fixtures\users.json
manage.py loaddata mainapp\fixtures\category.json
manage.py loaddata mainapp\fixtures\product.json
```

>Данные пользователя:
```
admin:admin
GeekBrains:Geek2020
```

### Инструкции для экспорта готовой БД
>Выгрузка базы:
```
manage.py dumpdata authapp.ShopUser > mainapp\fixtures\users.json
manage.py dumpdata mainapp.ProductCategory > mainapp\fixtures\category.json
manage.py dumpdata mainapp.Product > mainapp\fixtures\product.json
```