
from fitgarageapp.models import WorkoutClass, CustomUser, CustomReview, Booking
from fitgarageapp.serializers import WorkoutClassSerializer, UserSerializer, ReviewSerializer, BookingSerializer

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
def updateUserInfo(request, pk, *args, **kwargs):
    user_object = CustomUser.objects.get(id=pk)
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
def updateUserPassword(request, pk):
    user_object = CustomUser.objects.get(id=pk)
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

def updateUserBalance(request, *args, **kwargs):
    user_object = CustomUser.objects.get(name=request['name'])
    if request['balance'] >= 0 and request['balance'] < 1000:
        user_object.balance = user_object.balance + request['balance']
        user_object.save()
    return user_object.balance
    
@api_view(['DELETE'])
def deleteWorkoutClass(request, pk):
    workoutClass = WorkoutClass.objects.get(id=pk)

    now = date.today()
    if workoutClass.enable:
      return Response("Workout class already began, we cannot delete")  
    elif(workoutClass.start > now and workoutClass.end < now):
        return Response("Workout class is in progress, cannot delete")

    workoutClass.delete()
    return Response('Workout Class Deleted')
    
@api_view(['DELETE'])
def deleteCustomUser(request, pk):
    customUser = CustomUser.objects.get(id=pk)
    customUser.delete()
    return Response('Customer has been Deleted')

@api_view(['POST'])
def createWorkoutClass(request, *args, **kwargs):
    workoutClass_object = JSONParser().parse(request)
    serializer = WorkoutClassSerializer(data=workoutClass_object)
    print(workoutClass_object)
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


@api_view(['PATCH'])
def updateWorkoutClass(request, pk, *args, **kwargs):
    workout_object = WorkoutClass.objects.get(id=pk)
    serializer = WorkoutClassSerializer(workout_object)
    data = request.data
    workout_object.name = data.get("name", workout_object.name)
    workout_object.instructor = data.get("instructor", workout_object.instructor)
    workout_object.description = data.get("description", workout_object.description)
    workout_object.start = data.get("start", workout_object.start)
    workout_object.end = data.get("end", workout_object.end)
    workout_object.enable = data.get("enable", workout_object.enable)
    workout_object.save()
    return Response(serializer.data)


# Booking Features

@api_view(['GET'])
def getBookingsById(request, pk: int):
    bookings = Booking.objects.get(id=pk)
    serializer = BookingSerializer(bookings, many=False)
    return Response(serializer.data) 


@api_view(['POST'])
def createBooking(request):
    booking_object = JSONParser().parse(request)
    serializer = BookingSerializer(data=booking_object)
    if serializer.is_valid():
        serializer.save()
        return JsonResponse(serializer.data, status=status.HTTP_201_CREATED)
    return JsonResponse(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
def deleteBooking(request, pk):
    booking = Booking.objects.get(id=pk)
    booking.delete()
    return Response('Booking Deleted')
    
@api_view(['PATCH'])
def updateWorkoutEnableFlag(request, pk):
    workout_object = WorkoutClass.objects.get(id=pk)
    data = request.data
    workout_object.enable = data.get("enable", workout_object.enable)
    workout_object.save()
    serializer = WorkoutClassSerializer(workout_object)
    return Response(serializer.data)

@api_view(['GET'])
def logIn(request, email, password):
    user = CustomUser.objects.get(email=email)
    serializer = UserSerializer(user, many=False)
    if user.password == password:
        return Response(serializer.data)
    return Response("Invalid Credentials")