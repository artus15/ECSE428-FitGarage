Feature: Update User Password 
User Story: 
As a user of Fit Garage 
I want to change my current password
So I can access my account with a new password 

Scenario Outline (Normal Flow): 
Given person <user_name> with <email> that is of type <user> and does have an account with Fit Garage Workout Class System but has forgotten their password
When this person <user_name> requests access to Fit Garage Workout Class System 
Then the system will prompt the person <user_name> to input their <email> and <new_password> and their account will be updated 
|user_name	|isAdmin	|email	|balance ($CAD)	|password	|
|James First	|true	|jamesfirst@gmail.com	|	|iAmAdmin	|
|Jenny New	|false	|jennyjoins2@gmail.com	|0	|trynaBeFitter!		|

Alternate Flow: 
Given person <user_name> with <email> that is of type <user> and does have an account with Fit Garage Workout Class System
When this person is logged into the Fit Garage Workout Class System and requests to change their password by inputting the correct current <password> and <new_password>
Then the system update their account with <new_password> as the user <password>

Error Flow:
Given person <user_name> with <email> that is of type <user> and does have an account with Fit Garage Workout Class System
When this person is logged into the Fit Garage Workout Class System and requests to change their password by inputting an incorrect current <password> and <new_password>
Then a “Please input the correct current password” message is show and no changes will be made to the account
