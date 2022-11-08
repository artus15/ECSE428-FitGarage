Feature: Implementing Booking Feature

        User story:
        As an active user
        I want to book a workout class
        So I can join the class

        Scenario Outline (Normal Flow):
        Given person <user_name> that is of type <user> and is not enrolled in workout class with name <workout_class_name> and the class is not full
        When this person <user_name> requests to join a workout class with name <workout_class_name>
        Then the user with name <user_name> will be added to the list of users in the workout with name <workout_class_name>

        Scenario Outline (Error Flow):
        Given person <user_name> that is of type <user> and is already enrolled in workout class with name <workout_class_name>
        When this person <user_name> requests to join a workout class with name <workout_class_name>
        Then a "Already enrolled to this class" should be shown to the user

        Scenario Outline (Error Flow):
        Given person <user_name> that is of type <user> and is not enrolled in workout class with name <workout_class_name> and the class is full
        When this person <user_name> requests to join a workout class with name <workout_class_name>
        Then a "The class is full, please enroll to another class" should be shown to the user