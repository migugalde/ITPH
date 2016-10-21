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
	When I press "Add new counselor"
	And I enter my email as "razmatazz@aol.com"
	And I enter my password as "b00p"
	And I press "Create"
	Then I should be on the login page

Scenario: I want to login and see the home page
	When I press "Add new counselor"
	And I enter my email as "razmatazz@aol.com"
	And I enter my password as "b00p"
	And I enter my password as "b00p"
	And I press "Create"
	Then I should be on the login page
	Given I enter my username as 'razmatazz@aol.com'
	And I enter my password as "b00p"
	And I press "Login"
	Then I should be on the home page

Scenario: I want to see my calendar
	Given I am on the home page
	Then I should see "Client"
	And I should see "Logout"
	And I should see "Sun"
	And I should see "Print"
