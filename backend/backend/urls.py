"""backend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from xml.etree.ElementInclude import include
from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from fitgarageapp import views

router = routers.DefaultRouter()

# Registering routes

# Example
router.register(r'classes', views.WorkoutClassView, 'class')
router.register(r'classes', views.UserView, 'user')

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('user/createUser', views.createUser),
    path('user/getUserInfo', views.getUserInfo),
    path('user/updatePassword/<int:pk>/', views.updateUserPassword),
    path('user/deleteCustomUser/<int:pk>', views.deleteCustomUser),
    path('user/updateUserInfo/<int:pk>/', views.updateUserInfo),
    path('user/updateUserBalance', views.updateUserBalance),    
    path('user/getUserInfoById/<int:pk>/', views.getUserById),
    path('user/getUserInfoByEmail/<str:email>/', views.getUserInfoByEmail),
    path('user/login/<str:email>/<str:password>', views.logIn),
    path('workoutClass/getAllClasses', views.getWorkoutClasses),
    path('workoutClass/delete/<int:pk>', views.deleteWorkoutClass),
    path('workoutClass/createWorkoutClass', views.createWorkoutClass),
    path('workoutClass/updateWorkoutClass/<int:pk>/', views.updateWorkoutClass),
    path('workoutClass/getWorkoutByName/<str:name>/', views.getWorkoutByName),
    path('workoutClass/getWorkoutById/<int:pk>/', views.getWorkoutById),
    path('workoutClass/getWorkoutByInstructor/<str:instructor>/',
         views.getWorkoutByInstructor),
    path('booking/createBooking', views.createBooking),
    path('booking/deleteBooking/<int:pk>/', views.deleteBooking),
    path('booking/getBookingById/<int:pk>/', views.getBookingsById),
    path('workoutClass/updateWorkoutEnableFlag/<int:pk>/',
         views.updateWorkoutEnableFlag)
]

