As an admin
I want to update the attributes of a workout class
So that the users see the updated attributes

Background: Available workout classes
    Given I am am logged in as an admin
    And that the following workouts are available in the database:
    |user_name	|isAdmin	|email	|balance ($CAD)	|password	|
    |James First	|true	|jamesfirst@gmail.com	|	|iAmAdmin	|
    |Jacques Third	|false	|musclejacque@yahoo.com	|200	|jacqueisHERE!	|
    |Jenny New	|false	|jennyjoins2@gmail.com	|0	|trynaBeFitter!	|

    |name		|instructor	|description	|start		|end		|enable	|
    |Boxing		|Jacques Third	|Chicken fight	|2022-10-20	|2022-10-25	|True	|
Scenario: Update description for a class (normal flow)
     Given user <user_name> that is of type <user> and type <isAdmin>
     When this person <user_name> attempts to update a new workout description with text field
     Then the workout class description attribute is updated

Scenario: Error Flow 1
    Given user <user_name> that is of type <user> and not type <isAdmin>
    When this person <user_name> attempts to update a new workout
    Then an "You don't have the privilege to update classes" message is raised

Scenario: Error Flow 2
    Given user <user_name> that is of type <user> and type <isAdmin>
    When this person <user_name> attempts to update a new workout time 
    But the time inputted has already passed
    Then an "Invalid entry" message is raised

