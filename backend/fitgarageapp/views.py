from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse
from rest_framework import status


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


@api_view(['POST'])
def createUser(request, *args, **kwargs):
    user_object = JSONParser().parse(request)
    serializer = UserSerializer(data=user_object)
    print(user_object)
    if serializer.is_valid():
        serializer.save()
        return JsonResponse(serializer.data, status=status.HTTP_201_CREATED)
    return JsonResponse(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    # return Response(serializer.data)


@api_view(['GET'])
def getUserInfo(request):
    user = User.objects.all()
    serializer = UserSerializer(user, many=True)
    return Response(serializer.data)


@api_view(['PATCH'])
def updateUserInfo(self, request, *args, **kwargs):
    user_object = User.objects.get()
    data = request.GET.get('data')
    user_object.username = data.get("username", user_object.username)
    user_object.email = data.get("email", user_object.email)
    user_object.isAdmin = data.get("is_admin", user_object.isAdmin)

    user_object.save()
    serializer = UserSerializer(user_object)
    return Response(serializer.data)
