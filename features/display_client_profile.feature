Feature: Display Client Profile when selected

	As a counselor
	So that I can quickly look at a certain clients info
	After finding the right client
	I want to see their intake form data and contact info

Background: clients have been added to database

	Given the following clients exist:
	| Last Name | First Name	| counselor	| email 			|
	| Smith		| Bob			| Toni 		| bob@smith.net 	|
	| Adams		| Joe			| Yolanda 	| joe@adams.com		|
	| Adams 	| Mary			| Yolanda 	| mary@adams.com 	|
	| Williams	| Mary 			| Toni 		| mary@williams.nu	|

	And I am on the clients page

Scenario: I want to know if I have an upcoming appointment with client
	Given Bob Smith has an appointment with me on May 23, 2070
	When I press "Bob Smith"
	Then I should be on the Intake Form Data page for "Bob Smith"
	And I should see an upcoming appointment for May 23, 2070

Scenario: I want to see all details from the intake form
	Given the phone number of Mary Adams is 999-000-1234
	When I press "Mary Adams"
	Then I should be on the Intake Form Data page for "Mary Adams"
	And I should see the phone number is 999-000-1234
	And I should see the counselor is "Yolanda"