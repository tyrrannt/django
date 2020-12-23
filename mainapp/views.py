from django.shortcuts import render, get_object_or_404
from mainapp.models import ProductCategory, Product
from basketapp.models import Basket


def main(request):
    context = {
        'title': 'GeekShop',
    }
    return render(request, 'mainapp/index.html', context)


def product_item(request, pk, id):
    basket = []
    title = 'GeekShop - Каталог'
    categories = ProductCategory.objects.all()
    product = Product.objects.get(uid=id)
    if request.user.is_authenticated:
        basket = Basket.objects.filter(user=request.user)
    context = {
        'baskets': basket,
        'categories': categories,
        'title': title,
        'product': product,
    }
    return render(request, 'mainapp/product.html', context)


def products(request, pk=None):
    basket = []
    title = 'GeekShop - Каталог'
    categories = ProductCategory.objects.all()

    if request.user.is_authenticated:
        basket = Basket.objects.filter(user=request.user)
    if pk:
        if pk == '0':
            products = Product.objects.all().order_by('price')

        else:
            products = Product.objects.filter(category=ProductCategory.objects.get(uid=pk)).order_by('price')
            title = 'GeekShop - ' + ProductCategory.objects.get(uid=pk).name
        context = {
            'title': title,
            'categories': categories,
            'products': products,
            'baskets': basket,
            'pk': pk,
        }
        return render(request, 'mainapp/products.html', context)

    else:
        products = Product.objects.all()
        context = {
            'title': title,
            'categories': categories,
            'products': products,
            'baskets': basket,
            'pk': pk,
        }
        return render(request, 'mainapp/products.html', context)


def contact(request):
    context = {
        'title': 'GeekShop',
    }
    return render(request, 'mainapp/contact.html', context)
