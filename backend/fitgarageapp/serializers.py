from functools import total_ordering
from rest_framework import serializers

# example serializer to serialize class to json
from fitgarageapp.models import WorkoutClass, User

class WorkoutClassSerializer(serializers.ModelSerializer):
    class Meta:
        model = WorkoutClass
        fields = ('id', 'name', 'instructor', 'description', 'start', 'end')

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'name', 'isAdmin', 'email', 'balance', 'password')