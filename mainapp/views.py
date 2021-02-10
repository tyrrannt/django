import random

from django.shortcuts import render, get_object_or_404
from mainapp.models import ProductCategory, Product
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.conf import settings
from django.core.cache import cache

def get_links_menu():
    if settings.LOW_CACHE:
        key = 'links_menu'
        links_menu = cache.get(key)
        if links_menu is None:
            links_menu = ProductCategory.objects.filter(is_active=True)
            cache.set(key, links_menu)
        return links_menu
    else:
        return ProductCategory.objects.filter(is_active=True)


def get_category(pk):
    if settings.LOW_CACHE:
        key = f'category_{pk}'
        category = cache.get(key)
        if category is None:
            category = get_object_or_404(ProductCategory, pk=pk)
            cache.set(key, category)
        return category
    else:
        return get_object_or_404(ProductCategory, pk=pk)


def get_products():
    if settings.LOW_CACHE:
        key = 'products'
        products = cache.get(key)
        if products is None:
            products = Product.objects.filter(is_active=True, category__is_active=True).select_related('category')
            cache.set(key, products)
        return products
    else:
        return Product.objects.filter(is_active=True, category__is_active=True).select_related('category')


def get_product(pk):
    if settings.LOW_CACHE:
        key = f'product_{pk}'
        product = cache.get(key)
        if product is None:
            product = get_object_or_404(Product, pk=pk)
            cache.set(key, product)
        return product
    else:
        return get_object_or_404(Product, pk=pk)


def get_products_orederd_by_price():
    if settings.LOW_CACHE:
        key = 'products_orederd_by_price'
        products = cache.get(key)
        if products is None:
            products = Product.objects.filter(is_active=True, category__is_active=True).order_by('price')
            cache.set(key, products)
        return products
    else:
        return Product.objects.filter(is_active=True, category__is_active=True).order_by('price')


def get_products_in_category_orederd_by_price(pk):
    if settings.LOW_CACHE:
        key = f'products_in_category_orederd_by_price_{pk}'
        products = cache.get(key)
        if products is None:
            products = Product.objects.filter(category__pk=pk, is_active=True, category__is_active=True).order_by(
                'price')
            cache.set(key, products)
        return products
    else:
        return Product.objects.filter(category__pk=pk, is_active=True, category__is_active=True).order_by('price')


def get_hot_product():
    products = get_products()
    return random.sample(list(products), 1)[0]


def main(request):
    context = {
        'title': 'GeekShop',
    }
    return render(request, 'mainapp/index.html', context)


def product_item(request, pk=None):
    title = 'GeekShop - Каталог'
    # categories = ProductCategory.objects.all()
    categories = get_links_menu()
    # product = Product.objects.get(pk=pk)
    product = get_product(pk)
    context = {
        'categories': categories,
        'title': title,
        'product': product,
    }
    return render(request, 'mainapp/product.html', context)


def products(request, pk=None, page=1):
    title = 'GeekShop - Каталог'
    # categories = ProductCategory.objects.filter(is_active=True)
    categories = get_links_menu()
    if pk is not None:
        if pk == 0:
            # products = Product.objects.all().order_by('price')
            products = get_products_orederd_by_price()
            category = {'pk': 0}
        else:
            # category = get_object_or_404(categories, pk=pk)
            # products = Product.objects.filter(category=category).order_by('price')
            category = get_category(pk)
            products = get_products_in_category_orederd_by_price(pk)

            title = 'GeekShop - ' + category.name
        context = {
            'title': title,
            'categories': categories,
            'products': products,
            'category': category,
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

    category = {
        'pk': 0,
    }
    products = Product.objects.all().order_by('price')
    context = {
        'title': title,
        'categories': categories,
        'products': products,
        'category': category,
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


