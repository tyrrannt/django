from django.urls import path, re_path
import authapp.views as authapp_views

app_name = 'authapp'

urlpatterns = [
    path('login/', authapp_views.login, name='login'),
    path('logout/', authapp_views.logout, name='logout'),
    path('register/', authapp_views.register, name='register'),
    path('edit/', authapp_views.edit, name='edit'),
    path('verify/<email>/<activate_key>/', authapp_views.verify, name='verify'),
]
