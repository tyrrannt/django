from django.conf import settings
from django.core.mail import send_mail
from django.db import transaction
from django.shortcuts import render, HttpResponseRedirect
from authapp.forms import ShopUserLoginForm, ShopUserProfileEditForm
from authapp.forms import ShopUserRegisterForm
from authapp.forms import ShopUserEditForm
from django.contrib import auth, messages
from django.urls import reverse

from authapp.models import ShopUser
from basketapp.models import Basket
from django.contrib.auth.decorators import login_required
from utilities.files import calculate_age


def login(request):
    title = 'вход'
    if request.method == 'POST':
        login_form = ShopUserLoginForm(data=request.POST)
        if login_form.is_valid():
            username = request.POST['username']
            password = request.POST['password']
            user = auth.authenticate(username=username, password=password)
            if user and user.is_active:
                auth.login(request, user)
                return HttpResponseRedirect(reverse('mainapp:index'))
    else:
        login_form = ShopUserLoginForm()
    content = {'title': title, 'login_form': login_form}
    return render(request, 'authapp/login.html', content)


def logout(request):
    auth.logout(request)
    return HttpResponseRedirect(reverse('mainapp:index'))


def register(request):
    title = 'регистрация'
    if request.method == 'POST':
        register_form = ShopUserRegisterForm(request.POST, request.FILES)
        if register_form.is_valid():
            user = register_form.save()
            messages.success(request, 'Вы успешно зарегистрировались!')
            if send_verify_mail(user):
                print('сообщение подтверждения отправлено')
                return HttpResponseRedirect(reverse('auth:login'))
            else:
                print('ошибка отправки сообщения')
                return HttpResponseRedirect(reverse('auth:login'))
    else:
        register_form = ShopUserRegisterForm()
    content = {'title': title, 'register_form': register_form}
    return render(request, 'authapp/register.html', content)


@login_required
def edit(request):
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

        edit_form = ShopUserEditForm(request.POST, request.FILES, instance=request.user)
        if edit_form.is_valid():
            edit_form.save()
            messages.success(request, 'Изменения успешно сохранены!')
            return HttpResponseRedirect(reverse('authapp:edit'))
    else:
        edit_form = ShopUserEditForm(instance=request.user)

    baskets = Basket.objects.filter(user=request.user)
    content = {
        'title': title,
        'edit_form': edit_form,
        'baskets': baskets,
        'total_quantity': sum(basket.quantity for basket in baskets),
        'total_sum': sum(basket.sum() for basket in baskets),
    }
    return render(request, 'authapp/profile.html', content)


def send_verify_mail(user):
    verify_link = reverse('authapp:verify', args=[user.email, user.activate_key])

    title = f'Подтверждение учетной записи {user.username}'

    message = f'Для подтверждения учетной записи {user.username} на портале {settings.DOMAIN_NAME} перейдите по ' \
              f'ссылке: \n{settings.DOMAIN_NAME}{verify_link} '

    return send_mail(title, message, settings.EMAIL_HOST_USER, [user.email], fail_silently=False)


def verify(request, email, activate_key):
    try:
        user = ShopUser.objects.get(email=email)
        if user.activate_key == activate_key and not user.is_activate_key_expired():
            user.is_active = True
            user.activate_key = None
            user.save()
            auth.login(request, user)
            return render(request, 'authapp/verification.html')
        else:
            print(f'error activation user: {user}')
            return render(request, 'authapp/verification.html')
    except Exception as e:
        print(f'error activation user : {e.args}')
        return HttpResponseRedirect(reverse('index'))


@transaction.atomic
def edit(request):
    title = 'редактирование'

    if request.method == 'POST':
        edit_form = ShopUserEditForm(request.POST, request.FILES, instance=request.user)
        profile_form = ShopUserProfileEditForm(request.POST, instance=request.user.shopuserprofile)
        if edit_form.is_valid() and profile_form.is_valid():
            edit_form.save()
            return HttpResponseRedirect(reverse('authapp:edit'))
    else:
        edit_form = ShopUserEditForm(instance=request.user)
        profile_form = ShopUserProfileEditForm(
            instance=request.user.shopuserprofile
        )

    content = {
        'title': title,
        'edit_form': edit_form,
        'profile_form': profile_form
    }

    return render(request, 'authapp/edit.html', content)
