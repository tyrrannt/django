from django.urls import path, re_path
from django.views.decorators.cache import cache_page

import mainapp.views as mainapp_views

app_name = 'mainapp'

urlpatterns = [
    path('', mainapp_views.products, name='index'),
    path('category/<int:pk>/', mainapp_views.products, name='category'),
    path('category/<int:pk>/page/<int:page>/', cache_page(3600)(mainapp_views.products), name='page'),
    path('product/<int:pk>/', mainapp_views.product_item, name='product'),

]
