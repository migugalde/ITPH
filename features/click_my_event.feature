Feature: Can only click my event

	As a counselor
	So that I can access information for events
	I can only click on my events

Background: Events and counselors are on database

	Given the following events exist:
	| title	    | counselor	|
	| Bob Smith	| Toni 		|
	And the following counselors exist:
	| name		| email						| password	|	password_confirmation |	phone_number		|	admin	|
	| Toni		|	toni@gmail.com	| toni123		|	toni123								|	+19218594949		|	true	|
	| Bob			|	bob@gmail.com		| bob123		|	bob123								|	+15108295840		|	false	|

Scenario: Clicking on event when it is mine
    Given I am logged in as "toni@gmail.com" with password "toni123"
    And I am on the home page
    And I click on "Bob Smith"
    Then I should be on the event page

Scenario: Clicking on event when it is not mine
    Given I logged in as "bob@gmail.com" with password "bob123"
    And I am on the home page
    And I click on "Bob Smith"
    Then I should see "Invalid Action: Not your event."
