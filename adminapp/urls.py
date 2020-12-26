from django.urls import path
import adminapp.views as adminapp_views

app_name = 'adminapp'

urlpatterns = [
    path('', adminapp_views.index, name='index'),
    path('users/', adminapp_views.AdminUsers.as_view(), name='admin_users'),
    # path('users/', adminapp_views.admin_users, name='admin_users'),
    path('users/create/', adminapp_views.AdminUsersCreate.as_view(), name='admin_users_create'),
    # path('users/create/', adminapp_views.admin_users_create, name='admin_users_create'),
    path('users/update/<int:pk>/', adminapp_views.AdminUsersUpdate.as_view(), name='admin_users_update'),
    # path('users/update/<int:user_id>/', adminapp_views.admin_users_update, name='admin_users_update'),
    path('users/remove/<int:pk>/', adminapp_views.AdminUsersRemove.as_view(), name='admin_users_remove'),
    # path('users/remove/<int:user_id>/', adminapp_views.admin_users_remove, name='admin_users_remove'),
    path('users/active/<int:pk>/', adminapp_views.AdminUsersActive.as_view(), name='admin_users_active'),
    # path('users/active/<int:user_id>/', adminapp_views.admin_users_active, name='admin_users_active'),

    path('categories/', adminapp_views.categories_item, name='categories'),
    path('categories/create/', adminapp_views.categories_item_create, name='categories_item_create'),
    path('categories/update/<int:category_pk>/', adminapp_views.categories_item_update, name='categories_item_update'),
    path('categories/remove/<int:category_pk>/', adminapp_views.categories_item_remove, name='categories_item_remove'),
    path('categories/active/<int:category_pk>/', adminapp_views.categories_item_active, name='categories_item_active'),

    path('products/', adminapp_views.products_item, name='products'),
    path('products/create/', adminapp_views.products_item_create, name='products_item_create'),
    path('products/update/<int:product_pk>/', adminapp_views.products_item_update, name='products_item_update'),
    path('products/remove/<int:product_pk>/', adminapp_views.products_item_remove, name='products_item_remove'),
    path('products/active/<int:product_pk>/', adminapp_views.products_item_active, name='products_item_active'),
]
