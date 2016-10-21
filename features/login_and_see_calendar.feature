Feature: Login as a user

	As a counselor
	So that I can open the app to make an appointment
	I want login with my username and password
	And see the calendar with available times

Background: I am a counselor
	Given the following counselors exist:
	| email			| password	|
	| bob@gmail.com	| bobby1	|
	And I am on the home page

Scenario: I want to be added as a counselor
	When I follow "Add new counselor"
	And I enter my email as "razmatazz@aol.com"
	And I enter my password as "b00p"
	And I press "Create"
	Then I should be on the home page

Scenario: I want to login and see the home page
	When I follow "Add new counselor"
	And I enter my email as "razmatazz@aol.com"
	And I enter my password as "b00p"
	And I enter my password as "b00p"
	And I press "Create"
	And I follow "Logout"
	Then I should be on the login page
	Given I login with email "razmatazz@aol.com" and password "b00p"
	Then I should be on the home page

Scenario: I want to see my calendar
	Given I am on the home page
	And I should see the calendar
