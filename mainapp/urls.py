from django.urls import path, re_path
import mainapp.views as mainapp_views

app_name = 'mainapp'

urlpatterns = [
    path('', mainapp_views.products, name='index'),
    path('category/<int:pk>/', mainapp_views.products, name='category'),
    path('category/<int:pk>/page/<int:page>/', mainapp_views.products, name='page'),
    path('product/<int:pk>/', mainapp_views.product_item, name='product'),

]
