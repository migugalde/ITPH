Feature: Display list of current clients

	As a counselor
	So that I can quickly view all of the clients
	I want to see a list of all clients and their summary information

  Background: clients have been added to database

  	Given the following clients exist:
  	| Last Name | First Name	| counselor	| email 			|
  	| Smith		| Bob			| Toni 		| bob@smith.net 	|
  	| Adams		| Joe			| Yolanda 	| joe@adams.com		|
  	| Adams 	| Mary			| Yolanda 	| mary@adams.com 	|
  	| Williams	| Mary 			| Toni 		| mary@williams.nu	|

  	And I am on the home page

  Scenario: display a list of clients
    Given I press "Clients"
    Then I should be on the clients page
    And I should see the following emails: bob@smith.net, joe@adams.com, mary@adams.com, mary@williams.nu
