Feature: Send Emails with Event Creation

Background:
	Given the following counselors exist:
	| name		| email						| password	|	password_confirmation |	phone_number		|	admin	|
	| Bob			|	bob@gmail.com		| bob123		|	bob123								|	+15108295840		|	false	|

	And I am logged in as "bob@gmail.com" with password "bob123"
	And I am on the home page

Scenario: I make a simple event and they recieve an email
	Given I want to create an event
	And I open the page
	And I input title as "Zany Dan"
	And I input name as "Dan Zane"
	And I input email as "dan@gmail.com"
	And I click "Submit"
	Then "dan@gmail.com" should recieve an email

Scenario: I make a recurring event and they recieve an email
	Given I want to create an event
	And I open the page
	And I input title as "Zany Dan"
	And I input name as "Dan Zane"
	And I input email as "dan@gmail.com"
	And I input recurring as "weekly"
	And I click "Submit"
	Then "dan@gmail.com" should recieve an email
	And he should not recieve another one next week

Scenario: I make an event with multiple clients and they all recieve an email
	Given I want to create an event
	And I open the page
	And I input title as "Zany Dan"
	And I input name as "Dan Zane"
	And I input email as "dan@gmail.com"
	And I click "add another client"
	And I input name as "Amy Zan"
	And I input email as "amy@gmail.com"
	And I click "Submit"
	Then "dan@gmail.com" should recieve an email
	And "amy@gmail.com" should recieve an email

Scenario: I change my mind about making the event and cancel it
	Given I want to create an event
	And I open the page
	And I input title as "Zany Dan"
	And I input name as "Dan Zane"
	And I input email as "dan@gmail.com"
	And I click "Cancel"
	Then "dan@gmail.com" should not recieve an email

Scenario: I make an event with multiple counselors and only the client recieves an email
	Given I want to create an event
	And I open the page
	And I input title as "Zany Dan"
	And I input name as "Dan Zane"
	And I input email as "dan@gmail.com"
	And I click "add another counselor"
	And I input name as "Yolanda Worley"
	And I click "Submit"
	Then "dan@gmail.com" should recieve an email
