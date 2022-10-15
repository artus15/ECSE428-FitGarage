Feature: Add New Admin 

User Story: 
As an administrator,
I want to add new employee accounts
So the new employees can have admin access

Scenario Outline (Normal Flow)
Given person <user_name> with <email> that is of the type <isAdmin>
When this person <user_name> adds another employee <differnet_name> with <different_email> that is of the type <employee>
Then the person <different_name> is now of type <isAdmin>
|user_name	|isAdmin	|email	|balance ($CAD)	|password	|
|James First	|true	|jamesfirst@gmail.com	|	|iAmAdmin	|
|Jenny New	|true |jennyjoins2@gmail.com	|	|trynaBeFitter!		|


Scenario Outline (Error Flow)
Given person <user_name> with <email> that is not of the type <isAdmin>
When this person <user_name> adds another employee <differnet_name> with <different_email>
Then a “You can’t give admin rights to <different_name>” message is issued



Scenario Outline (Error Flow 2)
Given person <user_name> with <email> that is of the type <isAdmin>
When this person <user_name> adds another employee <differnet_name> with <different_email> that is of the type <isAdmin>
Then a “<diiferent_name> already has admin rights” message is issued
