Feature: Get user information from database

User Story:

As user is logged in
Get the user’s information
So I can see my personal account

Scenario Outline (Normal Flow): 
Given person <user_name> with <email> that is of type <user> and has an account with Fit Garage Workout Class System
When this person <user_name> desires to view his/her account information
The system will display the user’s information
|user_name	|isAdmin	|email	|balance ($CAD)	|password	|
|James First	|true	|jamesfirst@gmail.com	|	|iAmAdmin	|
|Jenny New	|false	|jennyjoins2@gmail.com	|0	|trynaBeFitter!		|


Error Flow:
Given person <user_name> with <email> that is of type <user> and has an account with Fit Garage Workout Class System
When this person <user_name> desires to view his/her account information
If the system is offline
Then an “Information cannot be displayed now” will be displayed
The user will have to refresh the page or wait a little 

Error Flow:
Given person <user_name> with <email> that is of type <user> and has an account with Fit Garage Workout Class System
When this person <user_name> desires to view his/her account information
The wrong primary key is sent to the database
Then the wrong information will appear in the application
The user will have to sign out and sign back in
