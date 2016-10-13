Feature: Display Clients filtered by search terms

	As a counselor
	So that I can quickly look at a certain clients info
	I want to see clients matching only my search terms

Background: clients have been added to database

	Given the following clients exist:
	| Last Name | First Name	| counselor	| email 			|
	| Smith		| Bob			| Toni 		| bob@smith.net 	|
	| Adams		| Joe			| Yolanda 	| joe@adams.com		|
	| Adams 	| Mary			| Yolanda 	| mary@adams.com 	|
	| Williams	| Mary 			| Toni 		| mary@williams.nu	|

	And I am on the clients page

Scenario: Search for an existing client
	When I search for "Mary Adams"
	Then I should see "Mary Adams"
	And I should not see "Mary Williams", "Bob Smith", "Joe Adams"

Scenario: Search for an nonexisting client
	When I search for "Daniel Boone"
	Then I should see an error
	And I should see "Mary Williams", "Bob Smith", "Joe Adams", "Mary Adams"

Scenario: Search by counselor
	When I search for "Yolanda"
	Then I should see "Joe Adams", "Mary Adams"
	And I should not see "Mary Williams", "Bob Smith"