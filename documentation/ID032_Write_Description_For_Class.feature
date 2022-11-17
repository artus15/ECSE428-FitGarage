Feature: Write Description For Class

        User story:
        As an an admin user
        I want to write a description for a workout class
        So the customers are able to have a brief overview of the class

        Scenario Outline (Normal Flow):
        Given person <user_name> and is of type <admin>
        When this person <user_name> requests to add a description <description> to the workout class with name <workout_class_name> 
        Then a descrisption <description> should be added to the workout class with name <workout_class_name>
        Then users are able to read the description

        Scenario Outline (Alternative Flow):
        Given person <user_name> and is of type <admin>
        When this person <user_name> requests to edit a description <description> to the workout class with name <workout_class_name>
        Then a descrisption <description> should be updated to the workout class with name <workout_class_name>
        Then users are able to read the updated description

        Scenario Outline (Error Flow):
        Given person <user_name> and is of type <user>
        When this person <user_name> requests to edit a description <description> to the workout class with name <workout_class_name>
        Then "You cannot edit the description of the workout class" should be thrown to the user

]