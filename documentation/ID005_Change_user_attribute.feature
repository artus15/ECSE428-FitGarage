Feature: Change user attributes

User story: 
As an active user
I want to change my email address
So I can receive notifications on my main address

Scenario Outline (Normal Flow):
Given person <user_name> with <email> that is of type <user> and does have an account with Fit Garage Workout Class System
When this person <user_name> requests to change their email address from <old_email> to <new_email>
Then the account associated with <user_name>, <old_email> will be changed to <user_name>, <new_email>
|user_name	|isAdmin	|email	|balance ($CAD)	|password	|
|James First	|true	|jamesfirst@gmail.com	|	|iAmAdmin	|
|Jacques Third	|false	|musclejacque@yahoo.com	|200	|jacqueisHERE!	|
|Jenny New	|false	|jennyfitteralready@gmail.com	|0	|trynaBeFitter!	|

Scenario Outline (Alternate Flow): 
Given person <user_name> with <email> and <different_email> that is of type <isAdmin> and has an account with <email> they can access Fit Garage Workout Class System 
When this person <user_name> requests to change their email address from <old_email> to <new_email>
Then the account associated with <user_name>, <old_email> will be changed to <user_name>, <new_email>

Scenario Outline (Error Flow): 
Given person <user_name> with <email> that is of type <user> and does have an account with Fit Garage Workout Class System
When this person <user_name> requests to change their email address from <wrong_email> to <new_email>
Then a “Email not found” message is shown, and no changes are registered to the Fit Garage Workout Class System.
