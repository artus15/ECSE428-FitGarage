from datetime import date
from enum import unique
from django.db import models

# Create your models here.


# This is just an example, feel free to remove/replace this with the appropriate classes/fields
class WorkoutClass(models.Model):
    name = models.CharField(max_length=168)
    instructor = models.CharField(max_length=168)
    description = models.TextField()
    start = models.DateField()
    end = models.DateField()
    enable = models.BooleanField()
    def _str_(self):
        return self.name

    def get_instructor(self):
        return self.instructor

class CustomUser(models.Model):
    name = models.CharField(max_length=168, unique= True)
    isAdmin = models.BooleanField()
    email = models.EmailField()
    balance = models.IntegerField(choices=[(i, i) for i in range(1, 1000)], blank=False)
    password = models.CharField(max_length=168)

    def _str_(self):
        return self.name

    def get_balance(self):
        return self.balance
    
    def set_balance(self, balance):
        self.balance = balance
        self.save(update_fields=["balance"])

class CustomReview(models.Model):

    username = models.CharField(max_length=168)
    classname = models.CharField(max_length=168)
    grade = models.IntegerField()
    comment = models.TextField()

    # userId = models.IntegerField()
    # workoutClassId = models.IntegerField()

    def get_grade(self):
        return self.grade

    def get_comment(self):
        return self.comment

    def get_userName(self):
        return self.username

    def get_workoutClassName(self):
        return self.classname
        
    # def get_userId(self):
    #     return self.userId

    # def get_workoutClassId(self):
    #     return self.workoutClassId


class Booking(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    workoutClass = models.ForeignKey(WorkoutClass, on_delete=models.CASCADE)
    bookingDate = models.DateField()

    def _str_(self):
        return (f'Booking for user {self.user} for the class {self.workoutClass}')
    
    def get_user(self):
        return self.user

    

