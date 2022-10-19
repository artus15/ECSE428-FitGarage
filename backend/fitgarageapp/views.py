from fitgarageapp.models import WorkoutClass, CustomUser
from fitgarageapp.serializers import WorkoutClassSerializer, UserSerializer
from rest_framework import status
from django.http.response import JsonResponse
from rest_framework.parsers import JSONParser
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
    user = CustomUser.objects.all()
    serializer = UserSerializer(user, many=True)
    return Response(serializer.data)


@api_view(['PATCH'])
def updateUserInfo(request, *args, **kwargs):
    user_object = CustomUser.objects.get()
    data = request.data
    user_object.name = data.get("name", user_object.name)
    user_object.email = data.get("email", user_object.email)
    user_object.isAdmin = data.get("is_admin", user_object.isAdmin)

    user_object.save()
    serializer = UserSerializer(user_object)
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


@api_view(['GET'])
def getUserById(request, pk):
    user = CustomUser.objects.get(id=pk)
    serializer = UserSerializer(user, many=False)
    return Response(serializer.data)

@api_view(['GET'])
def getUserInfoByEmail(request, email):
    user = CustomUser.objects.get(email=email)
    serializer = UserSerializer(user, many=False)
    return Response(serializer.data)

@api_view(['POST'])
def createWorkoutClass(request, *args, **kwargs):
    workoutClass_object = JSONParser().parse(request)
    serializer = WorkoutClassSerializer(data=workoutClass_object)
    if serializer.is_valid():
        serializer.save()
        return JsonResponse(serializer.data, status=status.HTTP_201_CREATED)
    return JsonResponse(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#@api_view(['PATCH'])
#def enableWorkoutClass(request,*args, **kwargs)
