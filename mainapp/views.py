from django.shortcuts import render, get_object_or_404
from mainapp.models import ProductCategory, Product
from basketapp.models import Basket
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger


def main(request):
    context = {
        'title': 'GeekShop',
    }
    return render(request, 'mainapp/index.html', context)


def product_item(request, category_pk=None, page=1, product_id=None):
    basket = []
    title = 'GeekShop - Каталог'
    categories = ProductCategory.objects.all()
    product = Product.objects.get(uid=product_id)
    if request.user.is_authenticated:
        basket = Basket.objects.filter(user=request.user)
    context = {
        'baskets': basket,
        'categories': categories,
        'title': title,
        'product': product,
        'pk': category_pk,
    }
    return render(request, 'mainapp/product.html', context)


def products(request, category_pk=0, page=1, product_id=None):
    basket = []
    title = 'GeekShop - Каталог'
    categories = ProductCategory.objects.all()
    if request.user.is_authenticated:
        basket = Basket.objects.filter(user=request.user)
    if category_pk:
        if category_pk == '0':
            products = Product.objects.all().order_by('price')
        else:
            products = Product.objects.filter(category=ProductCategory.objects.get(pk=category_pk)).order_by('price')
            title = 'GeekShop - ' + ProductCategory.objects.get(pk=category_pk).name
        context = {
            'title': title,
            'categories': categories,
            'products': products,
            'baskets': basket,
            'category_pk': category_pk,
        }
        paginator = Paginator(products, 3)
        try:
            products_paginator = paginator.page(page)
        except PageNotAnInteger:
            products_paginator = paginator.page(1)
        except EmptyPage:
            products_paginator = paginator.page(paginator.num_pages)
        context.update({'products': products_paginator})
        return render(request, 'mainapp/products.html', context)
    else:
        products = Product.objects.all().order_by('price')
        context = {
            'title': title,
            'categories': categories,
            'products': products,
            'baskets': basket,
            'category_pk': category_pk,
        }
        paginator = Paginator(products, 3)
        try:
            products_paginator = paginator.page(page)
        except PageNotAnInteger:
            products_paginator = paginator.page(1)
        except EmptyPage:
            products_paginator = paginator.page(paginator.num_pages)
        context.update({'products': products_paginator})
        return render(request, 'mainapp/products.html', context)


def contact(request):
    context = {
        'title': 'GeekShop',
    }
    return render(request, 'mainapp/contact.html', context)
