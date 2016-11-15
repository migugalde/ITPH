Feature: Add new counselor

	As an admin (e.g. Toni)
	So that I can add new counselor accounts
	I want to be able to add their detials
	And add their account to the system

Background: I am a counselor
	Given the following counselors exist:
	| name		| email						| password	|	password_confirmation |	phone_number		|	admin	|
	| Toni		|	toni@gmail.com	| toni123		|	toni123								|	+19218594949		|	true	|
	| Bob			|	bob@gmail.com		| bob123		|	bob123								|	+15108295840		|	false	|

Scenario: I want a link form the home page to create a new user as an admin
	Given I am logged in as "toni@gmail.com" with password "toni123"
	And I am on the home page
	Then I should see "Add new counselor"
	And I follow "Add new counselor"
	Then I should be on the new user page

Scenario: I dont want to be able to create a new user if I am not an admin
	Given I am logged in as "bob@gmail.com" with password "bob123"
	Given I am on the home page
	Then I should not see "Add new counselor"
	Given I am on the new user page
	Then I should be on the home page

Scenario: I should not be able to create an account with the same email
	Given I am logged in as "toni@gmail.com" with password "toni123"
	And I am on the new user page
	And I fill in "Email" with "bob@gmail.com"
	And I fill in "Phone number" with "+19218594949"
	And I fill in "Name" with "Raz"
	And I fill in the passwords with "b00p00"
	And I check "Admin"
	And I press "Create new user"
	Then I should see "Please review the problems below"
	And the user "razmatazz@aol.com" should not exist

Scenario: I should not be able to create an account without all details
	Given I am logged in as "toni@gmail.com" with password "toni123"
	And I am on the new user page
	And I fill in "Email" with "razmatazz@aol.com"
	And I press "Create new user"
	Then I should see "Please review the problems below"
	And the user "razmatazz@aol.com" should not exist

Scenario: I want to be able to create a new user
	Given I am logged in as "toni@gmail.com" with password "toni123"
	And I am on the new user page
	And I fill in "Email" with "razmatazz@aol.com"
	And I fill in "Phone number" with "+19218594949"
	And I fill in "Name" with "Raz"
	And I fill in the passwords with "b00p00"
	And I uncheck "Admin"
	And I press "Create new user"
	Then I should be on the home page
	And the user "razmatazz@aol.com" should exist
