from django.shortcuts import render
from rest_framework import viewsets


# Create your views here.


# example view
from fitgarageapp.serializers import WorkoutClassSerializer, UserSerializer
from fitgarageapp.models import WorkoutClass, User


class WorkoutClassView(viewsets.ModelViewSet):
    serializer_class = WorkoutClassSerializer
    queryset = WorkoutClass.objects.all()

class UserView(viewsets.ModelViewSet):
    serialzer_class = UserSerializer
    queryset = User.objects.all()