Feature: Successfully Edit Client Profile

	As a counselor
	So that I can quickly update a certain clients info
	I want to change their profile successfully

Background: clients have been added to database

	Given the following clients exist:
	| Last Name | First Name	| counselor	| email 			|
	| Smith		| Bob			| Toni 		| bob@smith.net 	|

	And I am on Bob Smith's page

Scenario: I want to update my clients intake form
	When I click "Edit"
	Then I change the counselor to Anna
	And I change the phone number to 123-456-7890
	And I click "Update"
	Then I should see the phone number is 123-456-7890
	And I should see the counselor is Anna

Scenario: I want to change my clients email incorrectly
	When I click "Edit"
	Then I change the email to "bobbybear.com"
	And I click "Update"
	Then I should see an error
	And I should see the email is "bob@smith.net"