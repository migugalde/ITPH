Feature: Add new counselor

	As an admin (e.g. Toni)
	So that I can add new counselor accounts
	I want to be able to add their detials
	And add their account to the system

Background: I am a counselor
	Given the following counselors exist:
	| name		| email						| password	|	phone 				|	admin	|
	| Bob			|	bob@gmail.com		| bobby1		|	+15108295840	|	true	|
	| Toni		|	toni@gmail.com	| toni			|	+19218594949	|	false	|

Scenario: I don't want normal counselors to be able to create new counselor
	Given I am logged in as "bob@gmail.com"
	And I am on the home page
	Then I should not see /Add new counselor/

Scenario: I don't want normal counselors to be able to create new counselor
	Given I am logged in as "bob@gmail.com"
	And I visit the new user page
	Then I should be on the home page

Scenario: I want a link form the home page to create a new user
	Given I am logged in as "toni@gmail.com"
	And I am on the home page
	Then I should see /Add new counselor/
	And I follow "Add new counselor"
	Then I should be on the new user page

Scenario: I want to be able to create a new user
	Given I am logged in as "toni@gmail.com"
	And I am on the new user page
	And I enter the email as "razmatazz@aol.com"
	And I enter the password as "b00p"
	And I press "Create"
	Then I should be on the home page
	And a user with the email "razmatazz@aol.com" should be created

Scenario: I should not be able to create an account without all details
	Given I am logged in as "toni@gmail.com"
	And I am on the new user page
	And I enter the email as "razmatazz@aol.com"
	And I press "Create"
	Then I should see "Invalid details"

Scenario: I want to be able to create a new user
	Given I am logged in as "toni@gmail.com"
	And I am on the new user page
	And I enter the email as "bob@gmail.com"
	And I enter the password as "bob1"
	And I press "Create"
	Then I should see "User already exists"
