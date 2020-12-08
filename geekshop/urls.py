"""geekshop URL Configuration"""

from django.urls import path
from django.contrib import admin

from mainapp import views as mainapp_views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', mainapp_views.main, name='index'),
    path('products/', mainapp_views.products, name='products'),
]
