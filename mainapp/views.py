from django.shortcuts import render
from .models import ProductCategory, Product


def main(request):
    context = {
        'title': 'GeekShop',
    }
    return render(request, 'mainapp/index.html', context)


def products(request, pk=None):
    title = 'GeekShop - Каталог'
    categories = ProductCategory.objects.all()
    products = Product.objects.all()
    context = {
        'title': title,
        'categories': categories,
        'products': products,
    }
    print(pk)
    return render(request, 'mainapp/products.html', context)

def contact(request):
    context = {
        'title': 'GeekShop',
    }
    return render(request, 'mainapp/contact.html', context)
