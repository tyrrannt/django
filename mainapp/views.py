from django.shortcuts import render, get_object_or_404
from mainapp.models import ProductCategory, Product
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger


def main(request):
    context = {
        'title': 'GeekShop',
    }
    return render(request, 'mainapp/index.html', context)


def product_item(request, pk=None):
    title = 'GeekShop - Каталог'
    categories = ProductCategory.objects.all()
    product = Product.objects.get(pk=pk)
    context = {
        'categories': categories,
        'title': title,
        'product': product,
    }
    return render(request, 'mainapp/product.html', context)


def products(request, pk=None, page=1):
    title = 'GeekShop - Каталог'
    categories = ProductCategory.objects.filter(is_active=True)
    if pk is not None:
        if pk == 0:
            products = Product.objects.all().order_by('price')
            category = {'pk': 0}
        else:
            category = get_object_or_404(categories, pk=pk)
            products = Product.objects.filter(category=category).order_by('price')
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
