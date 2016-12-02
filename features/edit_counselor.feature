Feature: Edit counselor account information

  As a counselor
	So that my account can have up to date information
	I want to be able to edit my account information

Background: I am a counselor
	Given the following counselors exist:
  | name		| email						| password	|	password_confirmation |	phone_number		|	admin	|
	| Toni		|	toni@gmail.com	| toni123		|	toni123								|	+19218594949		|	true	|
	| Bob			|	bob@gmail.com		| bob123		|	bob123								|	+15108295840		|	false	|
  Given I am logged in as "bob@gmail.com" with password "bob123"
	And I am on the home page

Scenario: I want to access the update details page
  And I follow "Edit Profile"
  Then I should be on the edit user page

Scenario: I want to edit my information
  Given I follow "Edit Profile"
  And I fill in "Name" with "Robert"
  And I fill in "Phone number" with "+2412412414"
  And I fill in "Current password" with "bob123"
  And I press "Update"
  Then I should be on the home page
  And I should see "Your account has been updated successfully."
  And the "name" of "bob@gmail.com" should be "Robert"
  And the "phone_number" of "bob@gmail.com" should be "+2412412414"
