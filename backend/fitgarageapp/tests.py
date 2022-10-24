from django.test import TestCase
from django.http.response import JsonResponse as response
from fitgarageapp.models import WorkoutClass, CustomUser
from fitgarageapp.views import updateUserBalance

# Create your tests here.
class CustomUserTest(TestCase):
    def setUp(self):
        CustomUser.objects.create(name="Tom Brady", isAdmin = False, email = "tom.brady@gmail.com", balance=0, password="1234")
        CustomUser.objects.create(name="Joe Mama", isAdmin = False, email = "joe@gmail.com", balance=20, password="1234")

    def test_update_balance_with_positive_value(self):
        """As a user with 0$, I should be able to update my balance to 40$"""
        user = CustomUser.objects.get(name="Tom Brady")
        balance = 40
        updateUserBalance(balance, self)
        self.assertEqual(user.balance, '40')

    def test_update_balance_with_negative_value(self):
        """Adding negative balance to my account"""
        user = CustomUser.objects.get(name="Tom Brady")
        balance = -40
        updateUserBalance(balance, self)
        self.assertEqual(response.data, 'Balance needs to be superior to 0$')

# class  WorkoutClassViewTest(TestCase):
#     def setUp(self):