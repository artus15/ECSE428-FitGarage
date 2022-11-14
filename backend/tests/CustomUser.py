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
        user = CustomUser.objects.get(name="Tom Brady")
        data = {
            'name' : user.name,
            'balance' : 40,
        }
        self.assertEqual(updateUserBalance(data), 40)

    def test_update_balance_with_negative_value(self):
        """Adding negative balance to my account"""
        user = CustomUser.objects.get(name="Tom Brady")
        data = {
            'name' : user.name,
            "balance" : -40,
        }
        self.assertEqual(updateUserBalance(data), 0)

    def test_update_balance_with_huge_money(self):
        """Adding too much balance to my account"""
        user = CustomUser.objects.get(name="Tom Brady")
        data = {
            'name' : user.name,
            "balance" : 1000,
        }
        self.assertEqual(updateUserBalance(data), 0)