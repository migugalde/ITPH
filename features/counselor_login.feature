Feature: Login as a counselor

	As a counselor
	So that I can use the app
	I want login with my username and password
	And see the calendar with available times

Background: I am a counselor
	Given the following counselors exist:
	| name		| email						| password	|	phone 				|	admin	|
	| Bob			|	bob@gmail.com		| bobby1		|	+15108295840	|	true	|

Scenario: I want to login and see the home page
	Given I am on the login page
	And I login with email "bob@gmail.com" and password "bobby1"
	Then I should be on the home page
	And I should see the calendar

Scenario: I dont want users to be able to login without a password
	Given I am on the login page
	And I login with email "bob@gmail.com" and password ""
	Then I should be on the login page
	And I should see the "Invalid password"

Scenario: I do not want non counselors to be able to access the page
	Given I am not logged in
	And I visit the home page
	Then I should be on the login page
