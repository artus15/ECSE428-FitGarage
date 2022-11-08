Feature: Choose website Theme

        User story:
        As an active user
        I want to choose the website theme
        So I can see the screen in a different color

        Scenario Outline (Normal Flow):
        Given person <user_name> and has a dark website theme 
        When this person <user_name> requests to change the website theme to bright
        Then the user with name <user_name> should have his application website theme changed to bright color

        Scenario Outline (Alternative Flow):
        Given person <user_name> and has a bright website theme
        When this person <user_name> requests to change the website theme to dark
        Then the user with name <user_name> should have his application website theme changed to dark color

        Scenario Outline (Error Flow):
        Given person <user_name> and has a bright website theme
        When this person <user_name> requests to change the website theme to bright
        Then nothing should be changed

        Scenario Outline (Error Flow):
        Given person <user_name> and has a dark website theme
        When this person <user_name> requests to change the website theme to dark
        Then nothing should be changed