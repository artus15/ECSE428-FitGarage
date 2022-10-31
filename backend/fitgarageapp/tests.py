from django.test import TestCase
from django.http.response import JsonResponse as response
from fitgarageapp.models import WorkoutClass, CustomUser
from fitgarageapp.views import updateUserBalance

# Create your tests here.