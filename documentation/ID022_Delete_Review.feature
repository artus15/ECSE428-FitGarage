Feature: Delete a review of a workout class

User Story: 
As a member od Fit Garage, 
I want to be able to delete a review I have written
So that the old review no longer appears on the course page

Scenario Outline:  A user deletes the grade and comment of a review they wrote (Normal Flow)
Given that the user <user_name> has written a review <id> with a <grade> and a <comment>
Given that the user has clicked the delete button on the previously written review
When the user clicks the confirm delete button 
Then the old <comment> with <grade> and <id> are removed from the database and not displayed on the reviews page for class <workoutclass_name>

| user_name 	 | workoutclass_name | grade | comment 											|
| John Smith 	 | Zumba	     | 4     | Great class to get moving! The intructor is lively and motivating.			|
| Jihoon Lee	 | Boxing	     | 3     | It was okay but I wish it was more challenging.						|
| Maria Tremblay | Zumba	     | 5     | Soooo fun!! I recommend zumba to anyone!!! Great teachers!				|
| George New	 | Kickboxing	     | 2     | The instructor does not take safety into account, another member almost broke my neck... |

Scenario Outline: A user deletes the grade and comment of a review they wrote but desides not to remove it (Normal Flow)
Given that the user <user_name> has writtten a review <id> with a <grade> and a <comment> 
Givent that the user hasd clicked the delete button on the previously written review 
When the user clicks the cancel button 
Then the user <user_name> is returned to the page they were before clicking the delete button 

