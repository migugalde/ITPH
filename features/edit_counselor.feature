Feature: Edit counselor account information

  As a counselor
	So that my account can have up to date information
	I want to be able to edit my account information

Background: I am a counselor
	Given the following counselors exist:
	| name		| email						| password	|	phone 				|	admin	|
	| Bob			|	bob@gmail.com		| bobby1		|	+15108295840	|	true	|

Scenario: I want to access the update details page
	Given I am logged in as "bob@gmail.com"
	And I am on the home page
	And I press "Update My Details"
  Then I should be on the edit counselor page

Scenario: I want to edit my information
  Given I am logged in as "bob@gmail.com"
  And I am on the edit counselor page
  And I press "Update My Details"
  Then I fill in "Name" with "John"
  And I fill in "Email" with "john@gmail.com"
  And I fill in "Phone Number" with "5108888888"
  And I fill in "Current Password" with "bobby1"
  And I fill in "New Password" with "john1"
  And I fill in "Confirm Password" with "johny1"
  And I press "Save"
  Then I should be on the home page
  And a counselor with the email "bob@gmail.com" should not exist
  And a counselor with the email "john@gmail.com" should exist
  And a counselor with the email "bob@gmail.com" should have the name "John"
  And a counselor with the email "bob@gmail.com" should have the phone number "5108888888"

Scenario: Should not be able to change details without a password
  Given I am logged in as "bob@gmail.com"
  And I am on the edit counselor page
  And I press "Update My Details"
  Then I fill in "Name" with "John"
  And I fill in "Email" with "john@gmail.com"
  And I fill in "Current Password" with "bob"
  And I press "Save"
  Then I should be on on the edit counselor page
  And I should see "Incorrect password"
  And a counselor with the email "bob@gmail.com" should exist
  And a counselor with the email "john@gmail.com" should not exist
