Feature: Add New User

User Story: 
As a person who wants to be physically active
I would like to be a user of the Fit Garage Gym System
So I can attend the Fit Garage workout classes

Scenario Outline (Normal Flow):
Given person <user_name> with <email> that does not have an account with Fit Garage Workout Class System 
When this person <user_name> requests access to the Fit Garage Workout Class System through the sign up pagee 
Then the person signs up with <user_name>, <email> and inputs a <password> associated with their account
|user_name	|isAdmin	|email	|balance ($CAD)	|password	|
|James First	|true	|jamesfirst@gmail.com	|	|iAmAdmin	|
|Jacques Third	|false	|musclejacque@yahoo.com	|200	|jacqueisHERE!	|
|Jenny New	|false	|jennyjoins2@gmail.com	|0	|trynaBeFitter!	|

Scenario Outline (Error Flow 1): 
Given person <user_name> with <email> that is of type <user> and not type <isAdmin> and does have an account with Fit Garage Workout Class System 
When this person <user_name> requests access to the Fit Garage Workout Class System through the sign up page
Then an "Already registered" message is issued and sign in page is prompted

Scenario Outline (Error Flow 2): 
Given person <user_name> with no <email> that does not have an account with Fit Garage Workout Class System 
When this person <user_name> requests access to the Fit Garage Workout Class through the signup page
Then an “Email Required to Sign Up” message is issued
