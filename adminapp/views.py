from django.shortcuts import render, HttpResponseRedirect, get_object_or_404
from authapp.models import ShopUser
from adminapp.forms import UserAdminRegisterForm, UserAdminEditForm, ProductCategoryEditForm, ProductsEditForm
from django.urls import reverse, reverse_lazy
from utilities.files import calculate_age, change_state
from django.contrib import messages
from django.contrib.auth.decorators import user_passes_test
from django.utils.decorators import method_decorator
from mainapp.models import Product, ProductCategory
from django.views.generic.list import ListView
from django.views.generic.edit import CreateView, UpdateView, DeleteView


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


# CBV
class AdminUsers(ListView):
    model = ShopUser
    template_name = 'adminapp/admin-users-read.html'

    @method_decorator(user_passes_test(lambda u: u.is_superuser))
    def dispatch(self, request, *args, **kwargs):
        return super(AdminUsers, self).dispatch(request, *args, **kwargs)


# @user_passes_test(lambda u: u.is_superuser)
# def admin_users(request):
#     context = {
#         'users': ShopUser.objects.all(),
#     }
#     return render(request, 'adminapp/admin-users-read.html', context)


# CBV
class AdminUsersCreate(CreateView):
    model = ShopUser
    template_name = 'adminapp/admin-users-create.html'
    success_url = reverse_lazy('admin_staff:admin_users')
    form_class = UserAdminRegisterForm

    @method_decorator(user_passes_test(lambda u: u.is_superuser))
    def dispatch(self, request, *args, **kwargs):
        return super(AdminUsersCreate, self).dispatch(request, *args, **kwargs)


# @user_passes_test(lambda u: u.is_superuser)
# def admin_users_create(request):
#     if request.method == 'POST':
#         form = UserAdminRegisterForm(data=request.POST, files=request.FILES)
#         if form.is_valid():
#             form.save()
#             messages.success(request, 'Пользователь успешно создан!')
#             return HttpResponseRedirect(reverse('admin_staff:admin_users'))
#         else:
#             messages.warning(request, form.errors)
#     else:
#         form = UserAdminRegisterForm()
#     context = {
#         'form': form,
#     }
#     return render(request, 'adminapp/admin-users-create.html', context)


# CBV
class AdminUsersUpdate(UpdateView):
    model = ShopUser
    template_name = 'adminapp/admin-users-update-delete.html'
    success_url = reverse_lazy('admin_staff:admin_users')
    form_class = UserAdminEditForm

    @method_decorator(user_passes_test(lambda u: u.is_superuser))
    def dispatch(self, request, *args, **kwargs):
        return super(AdminUsersUpdate, self).dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(AdminUsersUpdate, self).get_context_data(**kwargs)
        context['title'] = title = 'редактирование'
        return context


# @user_passes_test(lambda u: u.is_superuser)
# def admin_users_update(request, user_id):
#     user = get_object_or_404(ShopUser, id=user_id)
#     title = 'редактирование'
#     if request.method == 'POST':
#         # Подсчитываем возраст автоматически на основании даты рождения
#         try:
#             _mutable = request.POST._mutable
#             request.POST._mutable = True
#             request.POST['age'] = calculate_age(request.POST['birthday'])
#             request.POST._mutable = _mutable
#         except:
#             messages.warning(request, 'Не указана дата рождения! Возраст не определен, и оставлен без изменения!')
#
#         edit_form = UserAdminEditForm(request.POST, request.FILES, instance=user)
#         if edit_form.is_valid():
#             edit_form.save()
#             messages.success(request, 'Изменения успешно сохранены!')
#             return HttpResponseRedirect(reverse('admin_staff:admin_users'))
#         else:
#             messages.warning(request, 'Вы слишком молоды!')
#     else:
#         edit_form = UserAdminEditForm(instance=user)
#     context = {
#         'title': title,
#         'form': edit_form,
#         'user': user,
#     }
#     return render(request, 'adminapp/admin-users-update-delete.html', context)


# CBV
class AdminUsersRemove(DeleteView):
    model = ShopUser
    template_name = 'adminapp/admin-users-update-delete.html'
    success_url = reverse_lazy('admin_staff:admin_users')

    def delete(self, request, *args, **kwargs):
        self.object = self.get_object()
        self.object.is_active = False
        self.object.save()
        return HttpResponseRedirect(self.get_success_url())


# @user_passes_test(lambda u: u.is_superuser)
# def admin_users_remove(request, user_id):
#     change_state(request, ShopUser, user_id, False, 'Пользователь успешно деактивирован!')
#     return HttpResponseRedirect(reverse('admin_staff:admin_users'))

# CBV
class AdminUsersActive(DeleteView):
    model = ShopUser
    template_name = 'adminapp/admin-users-update-delete.html'
    success_url = reverse_lazy('admin_staff:admin_users')

    def delete(self, request, *args, **kwargs):
        self.object = self.get_object()
        self.object.is_active = True
        self.object.save()
        return HttpResponseRedirect(self.get_success_url())


# @user_passes_test(lambda u: u.is_superuser)
# def admin_users_active(request, user_id):
#     change_state(request, ShopUser, user_id, True, 'Пользователь успешно активирован!')
#     return HttpResponseRedirect(reverse('admin_staff:admin_users'))


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
    category = get_object_or_404(ProductCategory, pk=category_pk)
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
    change_state(request, ProductCategory, category_pk, False, 'Категория успешно деактивированна!')
    return HttpResponseRedirect(reverse('admin_staff:categories'))


@user_passes_test(lambda u: u.is_superuser)
def categories_item_active(request, category_pk):
    change_state(request, ProductCategory, category_pk, True, 'Категория успешно активированна!')
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
        form = ProductsEditForm(request.POST, request.FILES)
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
    product = get_object_or_404(Product, pk=product_pk)
    if request.method == 'POST':
        form = ProductsEditForm(request.POST, request.FILES, instance=product)
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
    change_state(request, Product, product_pk, False, 'Продукт успешно деактивирован!')
    return HttpResponseRedirect(reverse('admin_staff:products'))


@user_passes_test(lambda u: u.is_superuser)
def products_item_active(request, product_pk):
    change_state(request, Product, product_pk, True, 'Продукт успешно активирован!')
    return HttpResponseRedirect(reverse('admin_staff:products'))
