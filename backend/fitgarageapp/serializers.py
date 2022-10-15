from functools import total_ordering
from rest_framework import serializers

# example serializer to serialize class to json
from fitgarageapp.models import WorkoutClass

class WorkoutClassSerializer(serializers.ModelSerializer):
    class Meta:
        model = WorkoutClass
        fields = ('id', 'name', 'instructor', 'description', 'start', 'end')