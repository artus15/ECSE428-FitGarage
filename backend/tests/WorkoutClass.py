from cgitb import enable
from django.test import TestCase
from fitgarageapp.serializers import WorkoutClassSerializer
from fitgarageapp.models import WorkoutClass
from django.test import Client
import datetime

class WorkoutClassTestCase(TestCase):
    def setUp(self) -> None:

        self.base_url = "/workoutClass/"
        self.c = Client()

        WorkoutClass.objects.create(

            name = "Zumba",
            instructor = "Charlie Chaplin",
            description = "Come dance with Charlie!",
            start = datetime.date(2022, 10, 31),
            end = datetime.date(2023, 3, 19),
            enable = True

        )

        WorkoutClass.objects.create(

            name = "Kickboxing",
            instructor = "Charlie Chaplin",
            description = "Come train with Charlie!",
            start = datetime.date(2022, 10, 31),
            end = datetime.date(2023, 3, 19),
            enable=False

        )

    def test_instructor_name(self):
        zumbaclass = WorkoutClass.objects.get(name="Zumba")
        kickboxingclass = WorkoutClass.objects.get(name="Kickboxing")

        self.assertEqual(zumbaclass.get_instructor(), "Charlie Chaplin")
        self.assertEqual(kickboxingclass.get_instructor(), "Charlie Chaplin")

    def test_delete_workout_class(self):
        zumbaclass = WorkoutClass.objects.get(name="Zumba")
        kickboxingclass = WorkoutClass.objects.get(name="Kickboxing")

        zumbaclass.delete()
        kickboxingclass.delete()

        self.assertEqual(WorkoutClass.objects.count(), 0)

    def test_get_all_workout_classes(self):
        response = self.c.get(self.base_url + "getAllClasses")
        self.assertEqual(response.status_code, 200)


        