from django.db import models
from django.conf import settings
from mainapp.models import Product
from django.utils.functional import cached_property

# class BasketQuerySet(models.QuerySet):
#
#     def delete(self, *args, **kwargs):
#         for object in self:
#             object.product.quantity += object.quantity
#             object.product.save()
#         super(BasketQuerySet, self).delete(*args, **kwargs)


class Basket(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='basket')
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(verbose_name='количество', default=0)
    add_datetime = models.DateTimeField(verbose_name='время', auto_now_add=True)

    # objects = BasketQuerySet.as_manager()

    def __str__(self):
        """
        Переопределение стандартного метода str
        :return: Возвращает заданное пользователем представление экземпляра класса
        """
        return f'{self.user} - {self.product}'

    # @cached_property
    # def get_items_cached(self):
    #     return self.user.basket.select_related()
    #
    # def get_total_quantity(self):
    #     _items = self.get_items_cached
    #     return sum(list(map(lambda x: x.quantity, _items)))
    #
    # def get_total_cost(self):
    #     _items = self.get_items_cached
    #     return sum(list(map(lambda x: x.product_cost, _items)))
    #

    def sum(self):
        return self.quantity * self.product.price

    # Решение сигналами
    @staticmethod
    def getitem(pk):
        return Basket.objects.filter(pk=pk).first()

    @staticmethod
    def get_items(user, product=None):
        if product:
            return Basket.objects.filter(user=user, product=product).select_related()
        return Basket.objects.filter(user=user).select_related()

    # Решение изменением моделей
    # def delete(self):
    #     self.product.quantity += self.quantity
    #     self.product.save()
    #     super(self.__class__, self).delete()
    #
    # def save(self, *args, **kwargs):
    #     if self.pk:
    #         self.product.quantity -= self.quantity - self.__class__.get_item(self.pk).quantity
    #     else:
    #         self.product.quantity -= self.quantity
    #     self.product.save()
    #     super(self.__class__, self).save(*args, **kwargs)
