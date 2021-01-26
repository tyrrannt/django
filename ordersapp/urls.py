from django.urls import path

import ordersapp.views as ordersapp

app_name = 'ordersapp'

urlpatterns = [
    path('', ordersapp.products, name='index'),
    path('', ordersapp.orders_list, name='orders_list'),
]
