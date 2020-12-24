from django.shortcuts import render, HttpResponseRedirect
from authapp.models import ShopUser
from adminapp.forms import UserAdminRegisterForm, UserAdminEditForm, ProductCategoryEditForm, ProductsEditForm
from django.urls import reverse
from utilities.files import calculate_age
from django.contrib import messages
from django.contrib.auth.decorators import user_passes_test
from mainapp.models import Product, ProductCategory


# Create your views here.

@user_passes_test(lambda u: u.is_superuser)
def index(request):
    user = ShopUser.objects.all()
    category = ProductCategory.objects.all()
    product = Product.objects.all()
    context = {
        'user': user,
        'category': category,
        'product': product,
    }
    return render(request, 'adminapp/index.html', context)


@user_passes_test(lambda u: u.is_superuser)
def admin_users(request):
    context = {
        'users': ShopUser.objects.all(),
    }
    return render(request, 'adminapp/admin-users-read.html', context)


@user_passes_test(lambda u: u.is_superuser)
def admin_users_create(request):
    if request.method == 'POST':
        form = UserAdminRegisterForm(data=request.POST, files=request.FILES)
        if form.is_valid():
            form.save()
            messages.success(request, 'Пользователь успешно создан!')
            return HttpResponseRedirect(reverse('admin_staff:admin_users'))
        else:
            messages.warning(request, form.errors)
    else:
        form = UserAdminRegisterForm()
    context = {
        'form': form,
    }
    return render(request, 'adminapp/admin-users-create.html', context)


@user_passes_test(lambda u: u.is_superuser)
def admin_users_update(request, user_id):
    user = ShopUser.objects.get(id=user_id)
    title = 'редактирование'
    if request.method == 'POST':
        # Подсчитываем возраст автоматически на основании даты рождения
        try:
            _mutable = request.POST._mutable
            request.POST._mutable = True
            request.POST['age'] = calculate_age(request.POST['birthday'])
            request.POST._mutable = _mutable
        except:
            messages.warning(request, 'Не указана дата рождения! Возраст не определен, и оставлен без изменения!')

        edit_form = UserAdminEditForm(request.POST, request.FILES, instance=user)
        if edit_form.is_valid():
            edit_form.save()
            messages.success(request, 'Изменения успешно сохранены!')
            return HttpResponseRedirect(reverse('admin_staff:admin_users'))
        else:
            messages.warning(request, 'Вы слишком молоды!')
    else:
        edit_form = UserAdminEditForm(instance=user)
    context = {
        'title': title,
        'form': edit_form,
        'user': user,
    }
    return render(request, 'adminapp/admin-users-update-delete.html', context)


@user_passes_test(lambda u: u.is_superuser)
def admin_users_remove(request, user_id):
    user = ShopUser.objects.get(id=user_id)
    user.is_active = False
    user.save()
    messages.success(request, 'Пользователь успешно деактивирован!')
    return HttpResponseRedirect(reverse('admin_staff:admin_users'))


@user_passes_test(lambda u: u.is_superuser)
def admin_users_active(request, user_id):
    user = ShopUser.objects.get(id=user_id)
    user.is_active = True
    user.save()
    messages.success(request, 'Пользователь успешно активирован!')
    return HttpResponseRedirect(reverse('admin_staff:admin_users'))


@user_passes_test(lambda u: u.is_superuser)
def categories_item(request):
    context = {
        'categories': ProductCategory.objects.all()
    }
    return render(request, 'adminapp/categories-items-read.html', context)


@user_passes_test(lambda u: u.is_superuser)
def categories_item_create(request):
    if request.method == 'POST':
        form = ProductCategoryEditForm(data=request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Категория успешно создана!')
            return HttpResponseRedirect(reverse('admin_staff:categories'))
        else:
            messages.warning(request, form.errors)
    else:
        form = ProductCategoryEditForm()
    context = {
        'form': form,
    }
    return render(request, 'adminapp/categories-item-create.html', context)


@user_passes_test(lambda u: u.is_superuser)
def categories_item_update(request, category_pk):
    category = ProductCategory.objects.get(pk=category_pk)
    if request.method == 'POST':
        form = ProductCategoryEditForm(data=request.POST, instance=category)
        if form.is_valid():
            form.save()
            messages.success(request, 'Категория успешно изменена!')
            return HttpResponseRedirect(reverse('admin_staff:categories'))
        else:
            messages.warning(request, form.errors)
    else:
        form = ProductCategoryEditForm(instance=category)
    context = {
        'form': form,
        'category': category,
    }
    return render(request, 'adminapp/categories-item-update.html', context)


@user_passes_test(lambda u: u.is_superuser)
def categories_item_remove(request, category_pk):
    category = ProductCategory.objects.get(pk=category_pk)
    category.is_active = False
    category.save()
    messages.success(request, 'Категория успешно деактивированна!')
    return HttpResponseRedirect(reverse('admin_staff:categories'))


@user_passes_test(lambda u: u.is_superuser)
def categories_item_active(request, category_pk):
    category = ProductCategory.objects.get(pk=category_pk)
    category.is_active = True
    category.save()
    messages.success(request, 'Категория успешно активированна!')
    return HttpResponseRedirect(reverse('admin_staff:categories'))


@user_passes_test(lambda u: u.is_superuser)
def products_item(request):
    context = {
        'products': Product.objects.all()
    }
    return render(request, 'adminapp/products-items-read.html', context)


@user_passes_test(lambda u: u.is_superuser)
def products_item_create(request):
    if request.method == 'POST':
        form = ProductsEditForm(data=request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Продукт успешно создан!')
            return HttpResponseRedirect(reverse('admin_staff:products'))
        else:
            messages.warning(request, form.errors)
    else:
        form = ProductsEditForm()
    context = {
        'form': form,
    }
    return render(request, 'adminapp/products-item-create.html', context)


@user_passes_test(lambda u: u.is_superuser)
def products_item_update(request, product_pk):
    product = Product.objects.get(pk=product_pk)
    if request.method == 'POST':
        form = ProductsEditForm(data=request.POST, instance=product)
        if form.is_valid():
            form.save()
            messages.success(request, 'Продукт успешно изменен!')
            return HttpResponseRedirect(reverse('admin_staff:products'))
        else:
            messages.warning(request, form.errors)
    else:
        form = ProductsEditForm(instance=product)
    context = {
        'form': form,
        'product': product,
    }
    return render(request, 'adminapp/products-item-update.html', context)


@user_passes_test(lambda u: u.is_superuser)
def products_item_remove(request, product_pk):
    product = ProductCategory.objects.get(pk=product_pk)
    product.is_active = False
    product.save()
    messages.success(request, 'Продукт успешно деактивирован!')
    return HttpResponseRedirect(reverse('admin_staff:products'))


@user_passes_test(lambda u: u.is_superuser)
def products_item_active(request, product_pk):
    product = Product.objects.get(pk=product_pk)
    product.is_active = True
    product.save()
    messages.success(request, 'Продукт успешно активирован!')
    return HttpResponseRedirect(reverse('admin_staff:products'))
