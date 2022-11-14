Feature: Home page

    User Story:
        As a user, when I log in I want to be redirected to the home Page
        I want to see the most relevant information on the home page

    Scenario: Sees future enrolled workouts (Normal Flow)
        Given I am logged in
        When I go to the home page
        Then I see the workouts I have enrolled in
    
    Scenario: Not enrolled in workouts (Alternate Flow)
        Given I am logged in
        And i haven't enrolled to any workouts
        When I go to the home page
        Then I see a message that I am not enrolled in any workouts

    Scenario: Cancelled workouts (Alternate Flow)
        Given I am logged in
        And I have enrolled in a workout
        And the workout has been cancelled
        When I go to the home page
        Then I see a message that the workout has been cancelled