from django.test import TestCase
from fitgarageapp.models import WorkoutClass

import datetime

class WorkoutClassTestCase(TestCase):
    def setUp(self) -> None:
        WorkoutClass.objects.create(

            name = "Zumba",
            instructor = "Charlie Chaplin",
            description = "Come dance with Charlie!",
            start = datetime.date(2022, 10, 31),
            end = datetime.date(2023, 3, 19)

        )

        WorkoutClass.objects.create(

            name = "Kickboxing",
            instructor = "Charlie Chaplin",
            description = "Come train with Charlie!",
            start = datetime.date(2022, 10, 31),
            end = datetime.date(2023, 3, 19)

        )

    def test_instructor_name(self):
        zumbaclass = WorkoutClass.objects.get(name="Zumba")
        kickboxingclass = WorkoutClass.objects.get(name="Kickboxing")

        self.assertEqual(zumbaclass.get_instructor(), "Charlie Chaplin")
        self.assertEqual(kickboxingclass.get_instructor(), "Charlie Chaplin")


        