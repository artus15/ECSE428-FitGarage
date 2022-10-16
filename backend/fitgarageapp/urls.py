from django.urls import path
from . import views


urlpatterns = [
    path('getUserInfo', views.getUserInfo),
]