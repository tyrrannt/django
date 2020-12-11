from django.shortcuts import render
from mainapp.models import ProductCategory, Product


def main(request):
    context = {
        'title': 'GeekShop',
    }
    return render(request, 'mainapp/index.html', context)


def products(request, pk=None):
    title = 'GeekShop - Каталог'
    categories = ProductCategory.objects.all()
    if pk is None:
        products = Product.objects.all()
    else:
        products = Product.objects.filter(category=ProductCategory.objects.get(uid=pk))
    context = {
        'title': title,
        'categories': categories,
        'products': products,
        'pk': pk,
    }
    return render(request, 'mainapp/products.html', context)


def contact(request):
    context = {
        'title': 'GeekShop',
    }
    return render(request, 'mainapp/contact.html', context)
