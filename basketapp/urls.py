from django.urls import path

import basketapp.views as basketapp

app_name = 'basketapp'

urlpatterns = [
    path('', basketapp.basket, name='view'),
    path('add/<int:pk>/', basketapp.basket_add, name='add'),
    path('remall/', basketapp.basket_all_remove, name='remove_all'),
    path('remove/<int:id>)/', basketapp.basket_remove, name='remove'),
    path('edit/<int:id>/<int:quantity>/', basketapp.basket_edit, name='basket_edit')
]
