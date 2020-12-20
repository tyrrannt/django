from django.shortcuts import render, HttpResponseRedirect, get_object_or_404
from basketapp.models import Basket
from mainapp.models import Product
from django.contrib import messages
from django.urls import reverse


def basket(request):
    basket = Basket.objects.filter(user=request.user)
    content = {
        'baskets': basket,
    }
    return render(request, 'basketapp/basket.html', content)


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


def basket_all_remove(request, pk):
    content = {}
    return render(request, 'basketapp/basket.html', content)

def basket_remove(request, id):
    basket = Basket.objects.get(id=id)
    basket.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
