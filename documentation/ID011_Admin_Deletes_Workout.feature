As an admin that is logged isAdmin
I want to delete a workout class that is no longer active

Background: Available workout classes
    Given I am am logged in as an admin
    And that the following workouts are available in the database:
        |id|title|startTime|endTime|instructor|location|enable|
        |1|Yoga|2016-01-01 10:00:00|2016-01-01 11:00:00|John|Gym|true|
        |2|Pilates|2016-01-01 11:00:00|2016-01-01 12:00:00|John|Gym|true|
        |3|Zumba|2016-01-01 12:00:00|2016-01-01 13:00:00|John|Gym|false|

Scenario: Delete a workout class (Normal Flow)
    Given I am on the "Workout Classes" page
    And the "Zumba" workout class is not enabled
    When I click on the "Delete" link for the "Zumba" workout class
    Then I should see the "Workout Classes" page
    And I should see the message "Workout class deleted successfully"
    And I should not see the "Zumba" workout class
    And the database should be updated to reflect the following:
        |id|title|startTime|endTime|instructor|location|enable|
        |1|Yoga|2016-01-01 10:00:00|2016-01-01 11:00:00|John|Gym|true|
        |2|Pilates|2016-01-01 11:00:00|2016-01-01 12:00:00|John|Gym|true|

Scenario: Delete a workout class that is enabled (Error Flow)
    Given I am on the "Workout Classes" page
    And the "Yoga" workout class is enabled
    When I click on the "Delete" link for the "Yoga" workout class
    Then I should see the "Workout Classes" page
    And I should see the message "Workout class is enabled and cannot be deleted"
    And I should see the "Yoga" workout class
    And the database should be not be updated to reflect the following:
        |id|title|startTime|endTime|instructor|location|enable|
        |1|Yoga|2016-01-01 10:00:00|2016-01-01 11:00:00|John|Gym|true|
        |2|Pilates|2016-01-01 11:00:00|2016-01-01 12:00:00|John|Gym|true|
        |3|Zumba|2016-01-01 12:00:00|2016-01-01 13:00:00|John|Gym|false|

Scenario: Delete workour class that is currently in progress (Error Flow)
    Given I am on the "Workout Classes" page
    And the "Pilates" workout class is currently in progress
    When I click on the "Delete" link for the "Pilates" workout class
    Then I should see the "Workout Classes" page
    And I should see the message "Workout class is currently in progress and cannot be deleted"
    And I should see the "Pilates" workout class
    And the database should not be updated to reflect the following:
        |id|title|startTime|endTime|instructor|location|enable|
        |1|Yoga|2016-01-01 10:00:00|2016-01-01 11:00:00|John|Gym|true|
        |2|Pilates|2016-01-01 11:00:00|2016-01-01 12:00:00|John|Gym|true|
        |3|Zumba|2016-01-01 12:00:00|2016-01-01 13:00:00|John|Gym|false|
