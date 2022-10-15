from django.shortcuts import render
from rest_framework import viewsets


# Create your views here.


# example view
from fitgarageapp.serializers import WorkoutClassSerializer
from fitgarageapp.models import WorkoutClass

class WorkoutClassView(viewsets.ModelViewSet):
    serializer_class = WorkoutClassSerializer
    queryset = WorkoutClass.objects.all()