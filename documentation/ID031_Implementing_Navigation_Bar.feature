Feature: Implementing navigation bar

User story:
As an active user
I want to navigate between different tabs
So I can use different content on the app

Scenario Outline (Normal Flow):
Given person <user_name> is on one of the tabs
When this person <user_name> presses on a different tab than the one he currently is one
Then the app shall redirect the person <user_name> to the new screen

Scenario Outline (Alternative Flow):
Given person <user_name> is on one of the tabs
When this person <user_name> presses on a the tab he currently is one
Then the app shall keep the person <user_name> on the same screen

Scenario Outline (Alternative Flow):
Given person <user_name> is on one of the tabs
When this person <user_name> presses on two different tabs before the first screen loads
Then the app shall redirect the person <user_name> to the last tab he pressed