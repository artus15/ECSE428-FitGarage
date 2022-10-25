Feature: Edit a review of a workout class

User Story:
As a member of Fit Garage,
I want to be able to edit a review I have written
So that the new review appears on the course page

Scenario Outline: A user edits the grade and comment of a review they wrote (Normal Flow)
Given that the user <user_name> has written a review <id> with a <grade> and a <comment>
Given that the user has clicked the edit button on the previously written review
When the user changes the <grade>, modifies the <comment> and confirms the modification
Then the new <grade> and <comment> are saved to the database and displayed on the reviews page instead of the old review <id> by user <user_name> for class <workoutclass_name>

| user_name 	 | workoutclass_name | grade | comment 											|
| John Smith 	 | Zumba	     | 4     | Great class to get moving! The intructor is lively and motivating.			|
| Jihoon Lee	 | Boxing	     | 3     | It was okay but I wish it was more challenging.						|
| Maria Tremblay | Zumba	     | 5     | Soooo fun!! I recommend zumba to anyone!!! Great teachers!				|
| George New	 | Kickboxing	     | 2     | The instructor does not take safety into account, another member almost broke my neck... |

Scenario Outline: A user edits a review but changes their mind and cancels the edit (Alternate Flow)
Given that the user <user_name> has written a review <id> with a <grade> and a <comment>
Given that the user has clicked the edit button on the previously written review
When the user <user_name> clicks on the cancel button
Then the user <user_name> is returned to the page they were previously on before clicking the edit button

Scenario Outline: A user edits the grade of a review they wrote (Alternate Flow)
Given that the user <user_name> has written a review <id> with a <grade> and a <comment>
Given that the user <user_name> has clicked the edit button on the previously written review
When the user <user_name> changes the <grade> and confirms the modification
Then the new <grade> is saved to the database and displayed on the reviews page instead of the old <grade> for the review <id> by user <user_name> for class <workoutclass_name>

Scenario Outline: A user edits the comment of a review they wrote (Alternate Flow)
Given that the user <user_name> has written a review <id> with a <grade> and a <comment>
Given that the user <user_name> has clicked the edit button on the previously written review
When the user <user_name> modifies the <comment> and confirms the modification 
Then the new <comment> is saved to the database and displayed on the reviews page instead of the old <comment> for the review <id> by user <user_name> for class <workoutclass_name>

Scenario Outline: A user clicks to edit a review but tries to resubmit the exact same review (Error Flow)
Given that the user <user_name> has written a review <id> with a <grade> and a <comment>
Given that the user <user_name> has clicked the edit button on the previously written review
Given that the user <user_name> has left the review <id> unmodified
When the user <user_name> tries to confirm the modification
Then a message saying that "The review has not been modified" appears on the screen
