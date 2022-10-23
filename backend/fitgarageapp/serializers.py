from functools import total_ordering
from rest_framework import serializers
# example serializer to serialize class to json
from fitgarageapp.models import WorkoutClass, CustomUser

class WorkoutClassSerializer(serializers.ModelSerializer):
    class Meta:
        model = WorkoutClass
        fields = ('id', 'name', 'instructor', 'description', 'start', 'end', 'enable')

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ('id', 'name', 'isAdmin', 'email', 'balance', 'password')