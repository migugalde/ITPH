Feature: Edit counselor account information

  As a counselor
	So that my account can have up to date information
	I want to be able to edit my account information

Background: I am a counselor
	Given the following counselors exist:
	| name		| email						| password	|	phone_number 				|	admin	|
	| Bob			|	bob@gmail.com		| bobby1		|	+15108295840	|	true	|
	Given I am on the login page
	And I login with email "bob@gmail.com" and password "bobby1"
	And I am on the home page
	
Scenario: I want to access the update details page
  And I follow "Edit Counselor Profile"
  Then I should be on the edit counselor page

Scenario: I want to edit my information
  Given I am logged in as "bob@gmail.com"
  And I am on the edit counselor page
  And I press "Update User"
  Then I should be on the home page
  And I should see "Successfully edited counselor!"