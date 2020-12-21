from django.contrib.auth.forms import AuthenticationForm, UserCreationForm, UserChangeForm
from authapp.models import ShopUser
from django import forms


class ShopUserLoginForm(AuthenticationForm):
    class Meta:
        model = ShopUser
        fields = ('username', 'password')

    def __init__(self, *args, **kwargs):
        super(ShopUserLoginForm, self).__init__(*args, **kwargs)
        self.fields['username'].widget.attrs['placeholder'] = 'Введите имя пользователя'
        self.fields['password'].widget.attrs['placeholder'] = 'Введите пароль'
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control py-4'


class ShopUserEditForm(UserChangeForm):
    avatar = forms.ImageField(widget=forms.FileInput)

    class Meta:
        model = ShopUser
        fields = ('username', 'first_name', 'last_name', 'email', 'age', 'birthday', 'password', 'avatar')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['username'].widget.attrs['readonly'] = True
        self.fields['email'].widget.attrs['readonly'] = True
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control py-4'
            field.help_text = ''
            if field_name == 'password':
                field.widget = forms.HiddenInput()

    def clean_age(self):
        data = self.cleaned_data['age']
        if not data or data < 18:
            raise forms.ValidationError("Вы слишком молоды!")
        return data


class ShopUserRegisterForm(UserCreationForm):
    class Meta:
        model = ShopUser
        fields = ('username', 'first_name', 'last_name', 'password1', 'password2', 'email', 'age')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control py-4'
            field.help_text = ''

    def clean_age(self):
        data = self.cleaned_data['age']
        if not data or data < 18:
            raise forms.ValidationError("Вы слишком молоды!")
        return data
