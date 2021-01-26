"""geekshop URL Configuration"""

from django.urls import path
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from mainapp import views as mainapp_views
from django.conf.urls import include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', mainapp_views.main, name='index'),
    path('contact/', mainapp_views.contact, name='contact'),
    path('products/', include('mainapp.urls', namespace='products')),
    path('auth/', include('authapp.urls', namespace='auth')),
    path('basket/', include('basketapp.urls', namespace='basket')),
    path('admin-staff/', include('adminapp.urls', namespace='admin_staff')),
    path('order/', include('ordersapp.urls', namespace='order')),
    path('', include('social_django.urls', namespace='social')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
