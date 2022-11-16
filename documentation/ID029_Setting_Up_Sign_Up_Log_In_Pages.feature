Feature: Setting SignUp/LogIn Page

    User story:
        A person wants to start working out
        They need to create an account or log in to an existing account
        To start working out

    Background: 
        Given the user wants to create an account or log in to an existing account
        And the user is on the SignUp page
        And the following user exist:
            | name | password | email | 
            | user1    | 1234     | user1email.com|

    Scenario: The user creates an account (Normal Flow)
        When the user enters a username
        And the user enters a password
        And the user enters an email
        And the user clicks the create account button
        Then the user is redirected to the home page

    Scenario: The user logs in to an existing account (Alternate Flow)
        When the user enters a username
        When the user clicks on the login button
        And the user enters an existing <name>
        And the user enters the correct <password>
        And the user clicks the login button
        Then the user is redirected to the home page

        Example: name
            | name | password |
            | user1    | 1234     |
    
    Scenario: The user enters an incorrect password (Error Flow)
        When the user clicks on the login button
        And the user enters an existing <name>
        And the user enters the incorrect <password>
        And the user clicks the login button
        Then the user is not redirected to the login page

        Example: name
            | name | password |
            | user1    | 12345     |

