from datetime import date
from django.db import models

# Create your models here.


# This is just an example, feel free to remove/replace this with the appropriate classes/fields
class WorkoutClass(models.Model):
    name = models.CharField(max_length=168)
    instructor = models.CharField(max_length=168)
    description = models.TextField()
    start = models.DateField()
    end = models.DateField()

    def _str_(self):
        return self.name

class User(models.Model):
    name = models.CharField(max_length=168)
    isAdmin = models.BooleanField()
    email = models.EmailField()
    balance = models.IntegerField()
    password = models.CharField(max_length=168)

    def _str_(self):
        return self.name
