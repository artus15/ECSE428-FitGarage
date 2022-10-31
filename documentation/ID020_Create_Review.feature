Feature: Create a review of a workout class

User Story:
As a member of Fit Garage,
I want to be able to write a review for a workout class I have taken
So that review appears on the course page

Scenario Outline: A user writes a review for a class that they took (Normal Flow)
Given that the user <user_name> has taken the workout class <workoutclass_name>
When the user tries to write a review with a <grade> and a <comment>
Then the review <id> by user <user_name> for class <workoutclass_name> is saved to the database and displayed on the reviews page

| user_name 	 | workoutclass_name | grade | comment 											|
| John Smith 	 | Zumba	     | 4     | Great class to get moving! The intructor is lively and motivating.			|
| Jihoon Lee	 | Boxing	     | 3     | It was okay but I wish it was more challenging.						|
| Maria Tremblay | Zumba	     | 5     | Soooo fun!! I recommend zumba to anyone!!! Great teachers!				|
| George New	 | Kickboxing	     | 2     | The instructor does not take safety into account, another member almost broke my neck... |

Scenario Outline: A user writes a review for a class that they are currently taking (Alternate Flow)
Given that the user <user_name> is currently taking the workout class <workoutclass_name>
When the user tries to write a review with a <grade> and a <comment>
Then the review <id> for class <workoutclass_name> is saved in the database and displayed on the reviews page, hiding the user <user_name>'s name

Scenario Outline: A user tries to write a review for a class they did not take (Error Flow)
Given that the user <user_name> has not taken the workout class <workoutclass_name>
When the user tries to write a review with a <grade> and a <comment>
Then the review <id> by user <user_name> for class <workoutclass_name> is not saved in the database and is not displayed on the reviews page