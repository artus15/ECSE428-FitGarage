Feature: Admin Adds New Workout Class

User Story: 
As an admin
I want to add a workout class
So users can enroll in that class

Scenario Outline (Normal Flow):
Given person <user_name> with true <isAdmin> 
When this person <user_name> attempts to create a new workout 
Then the person creates new wokrout class with <name>, <instructor>, <description>, <start>, <end>, <enable>
|user_name	|isAdmin	|email	|balance ($CAD)	|password	|
|James First	|true	|jamesfirst@gmail.com	|	|iAmAdmin	|
|Jacques Third	|false	|musclejacque@yahoo.com	|200	|jacqueisHERE!	|
|Jenny New	|false	|jennyjoins2@gmail.com	|0	|trynaBeFitter!	|

|name		|instructor	|description	|start		|end		|enable	|
|Boxing		|Jacques Third	|Chicken fight	|2022-10-20	|2022-10-25	|True	|

Scenario Outline (Error Flow 1): 
Given user <user_name> that is of type <user> and not type <isAdmin>
When this person <user_name> attempts to create a new workout
Then an "You don't have the privilege to create new classes" message is raised

Scenario Outline (Error Flow 2): 
Given user <user_name> that is of type <isAdmin>
When this person <user_name> attempts to create a new workout without <name>
Then an “Class name is required to create new workout class” message is raised