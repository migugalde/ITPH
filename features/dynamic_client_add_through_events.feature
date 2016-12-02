Feature: Create Dynamic form to add (multiple) new clients within event creation
	When a user (counselor) creates a new event
	If they are adding a new client
	Then they will be able to input their information dynamically right in the form
	And it will save to the database and event successfully

Background:
	Given the following counselors exist:
	| name		| email	| password	|	password_confirmation |	phone_number|	admin	|
	| Toni Z	|t@gmail.com	| t123456	|	t123456	|	+15108295840	|	false	|
	And the following clients exist:
	| name	| counselor	| email 			|
	| Bob Smith			| Jack 		| bob@smith.net 	|
	| Fred Astaire		| Toni 		| bob@smith.net 	|
	And the following events exist:
	| title			| date 		| room 	| start | end |
	| Zany Dan	| 2115-12-12 | blue	| 12:00am | 5:00pm |
	And the event "Zany Dan" has the following clients: Bob Smith, bob@smith.com
	And the event "Zany Dan" has the following counselors: t@gmail.com
	Given I am logged in as "t@gmail.com" with password "t123456"
	And I am on the home page
	
Scenario: I want to create one new clients for this event
	And I input new_name as "Dan Grey" for "Zany Dan"
	And I input new_email as "dan@grey.com" for "Zany Dan"
	And I create a new client
	Then I should see "Dan Grey" is a client

Scenario: I create a new client through the form and its reflected in the database
	And I input new_name as "Dan Grey" for "Zany Dan"
	And I input new_email as "dan@grey.com" for "Zany Dan"
	And I create a new client
	Then I should see "Dan Grey" is a client
	And I am on the clients page
	Then I should see "Dan Grey"
	And I should see "dan@grey.com"
