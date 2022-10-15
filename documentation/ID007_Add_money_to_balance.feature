Feature: Add money to balance

User Story:
As my account balance is empty
I want to add some money
So I can book more workout classes!

Scenario Outline (Normal Flow):
Given person <user_name> with <email> that is of type <user> that is not <isAdmin> and does have an account with Fit Garage Workout Class System
When this person <user_name> requests to add more funds <new_balance> to their balance <balance>
Then the account associated with <user_name>, <email> will have their balance changed on the Fit Garage Workout Class System.

|user_name	|isAdmin	|email	|balance ($CAD)	|password	|
|Jacques Third	|false	|musclejacque@yahoo.com	|200	|jacqueisHERE!	|
|Jenny New	|false	|jennyjoins2@gmail.com	|1000	|trynaBeFitter!	|

Scenario Outline (Error Flow): 
Given person <user_name> with <email> that is of type <user> and does have an account with Fit Garage Workout Class System
When this person <user_name> requests to add more funds <negative_balance> to their balance <balance>
Then a “Please input valid balance” message is shown, and no changes are made to the Fit Garage Workout Class System.

Scenario Outline (Error Flow): 
Given person <user_name> with <email> that is of type <user> and does have an account with Fit Garage Workout Class System
When this person <user_name> requests to add more funds <balance> to their balance <balance> with an invalid credit card number
Then an “Invalid credit card number” message is shown, and no changes are made to the Fit Garage Workout Class System.
