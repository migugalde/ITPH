Feature: Schedule a new appointment

	As a counselor
	So that I can create new appointments for clients
	I want to see the new appointment on my home page

Background: clients have been added to database

	Given the following clients exist:
	| Last Name | First Name	| counselor	| email 			|
	| Smith		| Bob			| Toni 		| bob@smith.net 	|
	| Adams		| Joe			| Yolanda 	| joe@adams.com		|
	| Adams 	| Mary			| Yolanda 	| mary@adams.com 	|
	| Williams	| Mary 			| Toni 		| mary@williams.nu	|

	And I am on the home page

Scenario: Successfully redirect to schedule new page
	When I click on "Schedule a new appointment"
	Then I should be redirected to the "schedule_new" page

Scenario: Successfully scheduled a new appointment
    When I click on "Done"
    Then I should be redirected to the "home_page" page
    And I should see the message "Success!"
    And I should see the new appointment on my calendar

Scenario: Failed to schedule a new appointment
	When I click on "Done"
	Then I should stay on the "schedule_new" page
	And I should see the message "Failed."

Scenario: Client name exists
	When I type "Mary Adams" on the "Name:" field
	Then I should see "Mary Adams" as a suggestion
	And I should see "mary@adams.com" in the "Email:" field
	
Scenario: CLient name does not exist
    When I type "Mary Smith" on the "Name:" field
	Then I should the "Add New Client" option as a suggestion
	And I should be redirected to the "create_new_client" page