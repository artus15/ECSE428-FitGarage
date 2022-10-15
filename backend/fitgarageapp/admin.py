from django.contrib import admin

# Register your models here.


# example, remove this once actual models have been implemented
from fitgarageapp.models import WorkoutClass

class WorkoutClassAdmin(admin.ModelAdmin):
    list_display = ('name', 'instructor', 'description', 'start', 'end')

# registering the example model
admin.site.register(WorkoutClass, WorkoutClassAdmin)