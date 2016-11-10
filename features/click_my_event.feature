Feature: Can only click my event

	As a counselor
	So that I can access information for events
	I can only click on my events

Background: Events and counselors are on database

	Given the following events exist:
	| title	    | counselor	|
	| Bob Smith	| Toni 		|
	And the following counselors exist:
	| name		| email						| password	    |	phone_number	|	admin	|
	| Bob		|	bob@gmail.com	    	| bobby1		|	+15108295840	|	true	|
	| Toni		|	toni@gmail.com      	| toni			|	+19218594949	|	false	|
	| 

Scenario: Clicking on event when it is mine
    Given I am on the login page
    And I login with email "toni@gmail.com" and password "toni"
    And I should be on the home page
    And I click on "Bob Smith"
    Then I should be on the event page

Scenario: Clicking on event when it is not mine
    Given I am on the login page
    And I login with email "bob@gmail.com" and password "bobby1"
    And I should be on the home page
    And I click on "Bob Smith"
    Then I should see "Invalid Action: Not your event."