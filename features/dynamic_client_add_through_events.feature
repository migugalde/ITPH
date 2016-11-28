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
	| Bob Smith			| Toni 		| bob@smith.net 	|
	Then I am on the home page
	And I click "Schedule Appointment"

Scenario: I do not see new client input when I open the form
	Then I should see "Bob Smith"
	And I should not see "new email"
	And I should see "Add new Client"

Scenario: I open the dynamic form and see the correct input for new client
	Given I click "Add new Client"
	Then I should see "new client name"
	And I should see "new client email"
	And I should see "new client phone number"
	And I should see "Save new Client"

Scenario: I want to create one new clients for this event
	Given I click "Add new Client"
	And I input "name" as "Dan Grey"
	And I input "email" as "dan@grey.com"
	And I input "phone number" as "444-999-0012"
	And I click "Save new Client"
	Then I should see "Dan Grey" is checked

Scenario: I want to create several new clients for this event
	Given I click "Add new Client"
	And I input "name" as "Dan Grey"
	And I input "email" as "dan@grey.com"
	And I input "phone number" as "444-999-0012"
	And I click "Save new Client"
	Then I click "Add new Client"
	And I input "name" as "Dan Purple"
	And I input "email" as "dan@purple.com"
	And I input "phone number" as "444-777-0012"
	And I click "Save new Client"
	Then I should see "Dan Grey" is checked
	And I should see "Dan Purple" is checked

Scenario: I create a new client through the form and its reflected in the database
	Given I click "Add new Client"
	And I input "name" as "Dan Grey"
	And I input "email" as "dan@grey.com"
	And I input "phone number" as "444-999-0012"
	And I click "Save new Client"
	And I create a new event with "Dan Grey"
	Then I click "Client"
	Then I should see "Dan Grey"
	And I should see "dan@grey.com"
	And I should see "444-999-0012"