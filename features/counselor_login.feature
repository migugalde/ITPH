Feature: Login as a counselor

	As a counselor
	So that I can use the app
	I want login with my username and password
	And see the calendar with available times

Background: I am a counselor
	Given the following counselors exist:
	| name		| email						| password	|	password_confirmation |	phone_number		|	admin	|
	| Toni		|	toni@gmail.com	| toni123		|	toni123								|	+19218594949		|	true	|

Scenario: I want to login and see the home page
	Given I am on the login page
	And I login with email "toni@gmail.com" and password "toni123"
	Then I should be on the home page
	And I should see the calendar

Scenario: I dont want users to be able to login without a password
	Given I am on the login page
	And I login with email "toni@gmail.com" and password ""
	Then I should be on the login page

Scenario: I dont want users to be able to with an incorrect email and password
	Given I am on the login page
	And I login with email "test@gmail.com" and password "test123"
	Then I should be on the login page

Scenario: I do not want non counselors to be able to access the page
	Given I am on the login page
	And I visit the home page
	Then I should be on the login page
