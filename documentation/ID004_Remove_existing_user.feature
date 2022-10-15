Feature: Remove User

User Story: 
As an inactive member
I want to delete my Fit Garage account
So I can clean my memberships

Scenario Outline (Normal Flow):
Given person <user_name> with <email> that is not of type <isAdmin> and has an account with Fit Garage Workout Class System and a balance of greater than 0 $CAD.
When this person <user_name> requests to delete their Fit Garage Workout Class account
Then the account associated with <user_name>, <email> is removed from the system and a refund of their balance is made to that account.

|user_name	|isAdmin	|email	|balance ($CAD)	|password	|
|James First	|true	|jamesfirst@gmail.com	|	|iAmAdmin	|
|Jenny New	|false	|jennyjoins2@gmail.com	|0	|trynaBeFitter!		|

Scenario Outline (Alternate Flow): 
Given person <user_name> with <email> that is not of type <isAdmin> and has an account with Fit Garage Workout Class System and has an empty balance
When this person <user_name> requests to delete their Fit Garage Workout Class account
Then the account associated with <user_name>, <email> is removed from the Fit Garage Workout Class system and no refund is made to the account.
|user_name	|isAdmin	|email	|balance ($CAD)	|password	|
|James First	|true	|jamesfirst@gmail.com	|	|iAmAdmin	|
|Jacques Third	|false	|musclejacque@yahoo.com	|200	|jacqueisHERE!	|
|Jenny New	|false	|jennyjoins2@gmail.com	|0	|trynaBeFitter!	|

Scenario Outline (Error Flow): 
Given person <user_name> with <email> that is not of type <isAdmin> and has an account with Fit Garage Workout Class System
When this person <user_name> requests to delete their Fit Garage Workout Class account but gives a wrong email <wrong_email>
Then a “Email not found” error message is shown, and no changes are made to the Fit Garage Workout Class system.
