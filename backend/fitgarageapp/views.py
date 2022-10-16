from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework.decorators import api_view


# Create your views here.


# example view
from fitgarageapp.serializers import WorkoutClassSerializer, UserSerializer
from fitgarageapp.models import WorkoutClass, CustomUser


class WorkoutClassView(viewsets.ModelViewSet):
    serializer_class = WorkoutClassSerializer
    queryset = WorkoutClass.objects.all()

class UserView(viewsets.ModelViewSet):
    serialzer_class = UserSerializer
    queryset = CustomUser.objects.all()

@api_view(['GET'])
def getUserInfo(request):
    user = CustomUser.objects.all()
    serializer = UserSerializer(user, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def getWorkoutClasses(request):
    workoutClass = WorkoutClass.objects.all()
    serializer = WorkoutClassSerializer(workoutClass, many=True)
    return Response(serializer.data)

@api_view(['PATCH'])
def updateUserPassword(request,*args, **kwargs):
    user_object = CustomUser.objects.get()
    data = request.data
    user_object.password = data.get('password',user_object.password)

    user_object.save()
    serializer = UserSerializer(user_object)
    return Response(serializer.data)