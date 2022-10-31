
from fitgarageapp.models import WorkoutClass, CustomUser, CustomReview
from fitgarageapp.serializers import WorkoutClassSerializer, UserSerializer, ReviewSerializer

from datetime import date, datetime
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
def updateUserPassword(request, *args, **kwargs):
    user_object = CustomUser.objects.get()
    data = request.data
    user_object.password = data.get('password', user_object.password)

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

@api_view(['PATCH'])
def updateUserBalance(balance, user):
    if balance >= 0:
        user.balance += balance
        # user_object.save()
        # serializer = UserSerializer(user_object, data=self.data, partial=True)
        user.save()
    return JsonResponse(status=status.HTTP_400_BAD_REQUEST)
    
@api_view(['DELETE'])
def deleteWorkoutClass(request, pk):
    workoutClass = WorkoutClass.objects.get(id=pk)

    now = date.today()
    if workoutClass.enable:
      return Response("Wokrout class is enabled, cannot delete")  
    elif(workoutClass.start > now and workoutClass.end < now):
        return Response("Workout class is in progress, cannot delete")

    workoutClass.delete()
    return Response('Workout Class Deleted')

@api_view(['POST'])
def createWorkoutClass(request, *args, **kwargs):
    workoutClass_object = JSONParser().parse(request)
    serializer = WorkoutClassSerializer(data=workoutClass_object)
    if serializer.is_valid():
        serializer.save()
        return JsonResponse(serializer.data, status=status.HTTP_201_CREATED)
    return JsonResponse(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET'])
def getWorkoutByName(request, name):
    workout = WorkoutClass.objects.get(name=name)
    serializer = WorkoutClassSerializer(workout, many=False)
    return Response(serializer.data)


@api_view(['GET'])
def getWorkoutById(request, pk):
    workout = WorkoutClass.objects.get(id=pk)
    serializer = WorkoutClassSerializer(workout, many=False)
    return Response(serializer.data)


@api_view(['GET'])
def getWorkoutByInstructor(request, instructor):
    workout = WorkoutClass.objects.get(instructor=instructor)
    serializer = WorkoutClassSerializer(workout, many=False)
    return Response(serializer.data)


@api_view(['POST'])
def createReview(request, *args, **kwargs):
    review_object = JSONParser().parse(request)
    serializer = ReviewSerializer(data=review_object)
    print(review_object)
    if serializer.is_valid():
        serializer.save()
        return JsonResponse(serializer.data, status=status.HTTP_201_CREATED)
    return JsonResponse(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['PATCH'])
def updateReview(request, *args, **kwargs):
    review_object = CustomReview.objects.get()
    data = request.data
    review_object.grade = data.get('grade', review_object.grade)
    review_object.comment = data.get('comment', review_object.comment)
    review_object.save()
    serializer = ReviewSerializer(review_object)
    return Response(serializer.data)

@api_view(['GET'])
def getReviewById(request, pk):
    review = CustomReview.objects.get(id=pk)
    serializer = ReviewSerializer(review, many=False)
    return Response(serializer.data)

@api_view(['PATCH'])
def updateWorkoutClass(request,*args, **kwargs):
    workout_object = WorkoutClass.objects.get()
    data = request.data
    workout_object.name = data.get("name", workout_object.name)
    workout_object.instructor = data.get("instructor", workout_object.instructor)
    workout_object.description = data.get("description", workout_object.description)
    workout_object.start = data.get("start", workout_object.start)
    workout_object.end = data.get("end", workout_object.end)
    workout_object.enable = data.get("enable", workout_object.enable)
    workout_object.save()
    serializer = WorkoutClassSerializer(workout_object)
