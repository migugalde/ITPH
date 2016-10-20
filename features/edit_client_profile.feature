Feature: Successfully Edit Client Profile

	As a counselor
	So that I can quickly update a certain clients info
	I want to change their profile successfully

Background: clients have been added to database

	Given the following clients exist:
	| name	| counselor	| email 			|
	| Bob Smith	| Toni 		| bob@smith.net 	|

	And I am on the clients page
	And I follow "Bob Smith"

Scenario: I want to update my clients intake form
	When I follow "Edit"
	Then I should see "Editing Intake Information for Bob Smith"
	Then I should see "Counselor"
	Then I change the counselor to Anna
	And I change the phone number to 123-456-7890
	And I press "Update"
	Then I should see the phone number is 123-456-7890
	And I should see the counselor is Anna
