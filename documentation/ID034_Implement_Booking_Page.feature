Feature: Setting up the booking page

User story:
As an active user
I want to access the booking page
So I can make bookings

Scenario Outline (Normal Flow):
Given person <user_name> is on the booking page
When this person clicks on the booking page
Then all available slots should show up

Scenario Outline (Alternative Flow):
Given person <user_name> is on the booking page
When this person attempts to book a slot
Then a confirmation window should pop-up

Scenario Outline (Error Flow):
Given person <user_name> is on the booking page
When this person tries to book an invalid slot
Then an error should be raised