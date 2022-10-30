
from urllib import response
from django.test import TestCase
from fitgarageapp.models import CustomReview
import json
from fitgarageapp.views import updateReview

import datetime

class ReviewTestCase(TestCase):
    def setUp(self) -> None:
        CustomReview.objects.create(
            username = "John Smith",
            classname = "Kickboxing",
            # userid = 655,
            # workoutclassid = 876,
            grade = 5,
            comment = "The class was beginner friendly, I recommend it."
        )

        # self.customReview = CustomReview(
        #     username = "John Smith",
        #     classname = "Kickboxing",
        #     # userid = 655,
        #     # workoutclassid = 876,
        #     grade = 5,
        #     comment = "The class was beginner friendly, I recommend it."
        # )

        CustomReview.objects.create(
            # userid = 655,
            # workoutclassid = 566,
            username = "Alexandra Gafencu",
            classname = "Yoga",
            grade = 3,
            comment = "The instructor was a bit rude at times but the class was okay."

        )

    # def test_project_review_GET(self):
    #     review = CustomReview()
    #     response = review.get_grade('3')

    def test_get_review_by_user(self):
        review = CustomReview.objects.get(username="Alexandra Gafencu")

        # self.assertEquals(response.status_code,200)
        self.assertEqual(review.get_workoutClassName(), "Yoga")
        self.assertEqual(review.get_grade(), 3)
        self.assertEqual(review.get_comment(), "The instructor was a bit rude at times but the class was okay.")


    def test_review_grade(self):
        goodreview_grade = CustomReview.objects.get(comment="The class was beginner friendly, I recommend it.")
        okayreview_grade = CustomReview.objects.get(comment="The instructor was a bit rude at times but the class was okay.")

        self.assertEqual(goodreview_grade.get_grade(), 5)
        self.assertEqual(okayreview_grade.get_grade(), 3)

    def test_review_comment(self):
        goodreview_comment = CustomReview.objects.get(grade=5)
        okayreview_comment = CustomReview.objects.get(grade=3)

        self.assertEqual(goodreview_comment.get_comment(), "The class was beginner friendly, I recommend it.")
        self.assertEqual(okayreview_comment.get_comment(), "The instructor was a bit rude at times but the class was okay.")

    def test_get_review_author(self):
        goodreview_grade = CustomReview.objects.get(comment="The class was beginner friendly, I recommend it.")
        self.assertEqual(goodreview_grade.get_userName(), "John Smith")

    def test_get_review_workout_class(self):
        goodreview = CustomReview.objects.get(comment="The instructor was a bit rude at times but the class was okay.")
        self.assertEqual(goodreview.get_workoutClassName(), "Yoga")

    # def test_update_review(self):
    #     review = CustomReview.objects.get(username="Alexandra Gafencu")
    #     updateReview(review,grade=1)
    #     self.assertEqual(review.get_grade(), 1)