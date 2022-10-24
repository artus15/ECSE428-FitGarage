from django.test import TestCase
from fitgarageapp.models import CustomReview

import datetime

class ReviewTestCase(TestCase):
    def setUp(self) -> None:
        CustomReview.objects.create(

            grade = 5,
            comment = "The class was beginner friendly, I recommend it."

        )

        CustomReview.objects.create(

            grade = 3,
            comment = "The instructor was a bit rude at times but the class was okay."

        )

    def test_review_grade(self):
        goodreview_grade = CustomReview.objects.get(grade=5)
        okayreview_grade = CustomReview.objects.get(grade=3)

        self.assertEqual(goodreview_grade.get_grade(), 5)
        self.assertEqual(okayreview_grade.get_grade(), 3)

    def test_review_comment(self):
        goodreview_comment = CustomReview.objects.get(grade=5)
        okayreview_comment = CustomReview.objects.get(grade=3)

        self.assertEqual(goodreview_comment.get_comment(), "The class was beginner friendly, I recommend it.")
        self.assertEqual(okayreview_comment.get_comment(), "The instructor was a bit rude at times but the class was okay.")

    def updateReview(self)->None:
        CustomReview.objects.update(
            grade = 4,
            comment = "The class was beginner friendly."
        )

    def test_review_change(self):
        #incomplete
        goodreview_grade = CustomReview.objects.get(grade=5)
        goodreview_comment = CustomReview.objects.get(grade=5)

        