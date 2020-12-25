from django.urls import path, re_path
import mainapp.views as mainapp_views

app_name = 'mainapp'

urlpatterns = [
    path('', mainapp_views.products, name='index'),
    path('<int:category_pk>/', mainapp_views.products, name='category'),
    path('<int:category_pk>/<int:page>/<int:product_id>/', mainapp_views.product_item, name='product'),
    path('<int:category_pk>/<int:page>/', mainapp_views.products, name='page'),

]
