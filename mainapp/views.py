from django.shortcuts import render

# Create your views here.
from django.shortcuts import render
import random

def rand_price():
    return random.randint(1000, 30000) * 1.00


def main(request):
    context = {
        'title': 'GeekShop',
    }
    return render(request, 'mainapp/index.html', context)


def products(request):
    context = {
        'title': 'GeekShop - Каталог',
        'items': [
            ['#','vendor/img/products/Adidas%20hoodie.png','#','Худи черного цвета с монограммами adidas Originals',
             rand_price(), 'Мягкая ткань для свитшотов. Стиль и комфорт – это образ жизни.', ],
            ['#', 'vendor/img/products/Blue%20jacket%20The%20North%20Face.png', '#', 'Синяя куртка The North Face',
             rand_price(), 'Гладкая ткань. Водонепроницаемое покрытие. Легкий и теплый пуховый наполнитель.', ],
            ['#', 'vendor/img/products/Brown%20sports%20oversized-top%20ASOS%20DESIGN.png', '#', 'Коричневый спортивный oversized-топ ASOS DESIGN',
             rand_price(), 'Материал с плюшевой текстурой. Удобный и мягкий.', ],
            ['#', 'vendor/img/products/Black%20Nike%20Heritage%20backpack.png', '#', 'Черный рюкзак Nike Heritage',
             rand_price(), 'Плотная ткань. Легкий материал.', ],
            ['#', 'vendor/img/products/Black%20Dr%20Martens%20shoes.png', '#', 'Черные туфли на платформе с 3 парами люверсов Dr Martens 1461 Bex',
             rand_price(), 'Гладкий кожаный верх. Натуральный материал.', ],
            ['#', 'vendor/img/products/Dark%20blue%20wide-leg%20ASOs%20DESIGN%20trousers.png', '#', 'Темно-синие широкие строгие брюки ASOS DESIGN',
             rand_price(), 'Легкая эластичная ткань сирсакер Фактурная ткань.', ],
        ]
    }



    return render(request, 'mainapp/products.html', context)
