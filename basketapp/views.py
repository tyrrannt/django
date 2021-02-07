from django.shortcuts import render, HttpResponseRedirect, get_object_or_404
from basketapp.models import Basket
from mainapp.models import Product
from django.template.loader import render_to_string
from django.http import JsonResponse
from authapp.forms import ShopUserEditForm
from django.contrib.auth.decorators import login_required


@login_required
def basket(request):
    title = 'Просмотр корзины'
    edit_form = ShopUserEditForm(instance=request.user)
    baskets = Basket.objects.filter(user=request.user).select_related()
    content = {
        'title': title,
        'edit_form': edit_form,
        'baskets': baskets,
        'total_quantity': sum(basket.quantity for basket in baskets),
        'total_sum': sum(basket.sum() for basket in baskets),
    }
    return render(request, 'authapp/profile.html', content)


@login_required
def basket_add(request, pk):
    product = get_object_or_404(Product, pk=pk)
    basket = Basket.objects.filter(user=request.user, product=product).first()
    if not basket:
        basket = Basket(user=request.user, product=product)
    basket.quantity += 1
    basket.save()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


@login_required
def basket_all_remove(request):
    baskets = Basket.objects.filter(user=request.user)
    for basket in baskets:
        basket.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


@login_required
def basket_remove(request, id):
    basket = Basket.objects.get(id=id)
    basket.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


@login_required
def basket_edit(request, id, quantity):
    if request.is_ajax():
        quantity = int(quantity)
        basket = Basket.objects.get(id=int(id))
        if quantity > 0:
            basket.quantity = quantity
            basket.save()
        else:
            basket.delete()
        baskets = Basket.objects.filter(user=request.user)
        context = {
            'baskets': baskets,
            'total_quantity': sum(basket.quantity for basket in baskets),
            'total_sum': sum(basket.sum() for basket in baskets),
        }
        result = render_to_string('basketapp/basket.html', context)
        return JsonResponse({'result': result})
