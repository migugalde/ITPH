Feature: Hide Client Names from other counselors: calendar
	As a counselor
	So that no one else can who I am scheduled with
	I want only myself to see my clients

Background: Counselor has been logged in
	Given I am logged in as Toni
	And the following clients exist:
	| name				| counselor	| email 			|
	| Bob Smith			| Toni 		| bob@smith.net 	|
	| Joe Adams			| Yolanda 	| joe@adams.com		|
	| Mary Adams		| Yolanda 	| mary@adams.com 	|
	| Mary Williams		| Toni 		| mary@williams.nu	|
	And I am on the home page

Scenario: I want to view all clients
  When I click "Clients"
  Then I should see "Bob Smith"
  And I should see "Mary Williams"
  And I should not see "Joe Adams"
  And I should not see "Mary Adams"

Scenario: I want to search a client that is not mine
	When I click "Clients"
	And I search for "Mary Adams"
	Then I should see "Did not find client."

Scenario: I want to search a client that is mine
	When I click "Clients"
	And I search for "Mary Williams"
	Then I should see "Mary Williams"
