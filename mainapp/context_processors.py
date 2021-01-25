from basketapp.models import Basket


def basket(request):
    basket_items = []

    if request.user.is_authenticated:
        basket_items = Basket.objects.filter(user=request.user)
    return {
        'baskets': basket_items,
        'total_sum': sum(basket.sum() for basket in basket_items),
    }
