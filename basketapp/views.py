from django.shortcuts import render, HttpResponseRedirect, get_object_or_404
from basketapp.models import Basket
from mainapp.models import Product
from django.contrib import messages
from django.urls import reverse
from authapp.forms import ShopUserEditForm


def basket(request):
    title = 'Просмотр корзины'
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


def basket_add(request, pk):
    product = get_object_or_404(Product, pk=pk)
    if not request.user.is_authenticated:
        messages.warning(request, 'Для добавления в корзину товаров Вы должны войти в ЛК!')
        return HttpResponseRedirect(reverse('authapp:login'))
    basket = Basket.objects.filter(user=request.user, product=product).first()
    if not basket:
        basket = Basket(user=request.user, product=product)
    basket.quantity += 1
    basket.save()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


def basket_all_remove(request):
    baskets = Basket.objects.filter(user=request.user)
    for basket in baskets:
        basket.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

def basket_remove(request, id):
    basket = Basket.objects.get(id=id)
    basket.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
