from django.test import TestCase
from django.test import Client
from fitgarageapp.models import CustomUser
from fitgarageapp.views import updateUserBalance
from django.http import HttpRequest
request = HttpRequest()

class CustomUserTest(TestCase):
    def setUp(self) -> None:

        self.base_url = "user/updateUserBalance/"
        self.c = Client()
        CustomUser.objects.create(name="Tom Brady", isAdmin = False, email = "tom.brady@gmail.com", balance=0, password="1234")
        CustomUser.objects.create(name="Joe Mama", isAdmin = False, email = "joe@gmail.com", balance=20, password="1234")

    def test_update_balance_with_positive_value(self):
        """As a user with 0$, I should be able to update my balance to 40$"""
        user = CustomUser.objects.filter(name="Tom Brady")
        data = {
            'name' : 'Tom Brady',
            'balance' : 40,
        }
        request.method = 'PATCH'
        request.META = data
        request.META['SERVER_NAME'] = 'localhost'
        updateUserBalance(request)
        self.assertEqual(user.get_balance(), 40)

    def test_update_balance_with_negative_value(self):
        """Adding negative balance to my account"""
        user = CustomUser.objects.filter(name="Tom Brady")
        data = {
            "balance" : -40,
        }
        request.method = 'PATCH'
        request.META = data
        request.META['SERVER_NAME'] = 'localhost'
        updateUserBalance(request)
        self.assertEqual(user.get_balance(), 0)

    def test_update_balance_with_huge_money(self):
        """Adding too much balance to my account"""
        user = CustomUser.objects.filter(name="Tom Brady")
        data = {
            "balance" : 1000,
        }
        request.method = 'PATCH'
        request.META = data
        request.META['SERVER_NAME'] = 'localhost'
        updateUserBalance(balance=10000)
        self.assertEqual(user.get_balance(), 0)